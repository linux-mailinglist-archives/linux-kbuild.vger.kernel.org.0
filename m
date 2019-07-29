Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B25B78847
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 11:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbfG2JXT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 05:23:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38957 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfG2JXT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:23:19 -0400
Received: by mail-pl1-f196.google.com with SMTP id b7so27317871pls.6;
        Mon, 29 Jul 2019 02:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2RYXk+xmH+jnNlHAz8B2VrjUbs1jC7oTfjZvERBTUUw=;
        b=fWQTlgIFrW+epBlkoZj89SwZItsQiNWYxyeQbbaRCCSRO9xw208KHi1oeDkFPX8rx+
         S9nRRSZmuT3ipeKkGC//fxODullQqh56RXKnK/ovxBMBGkAVMlre9IcGE0WiKcSa9bFL
         23Qf6AKnHXza/Xs47Eftzq0G170z9UKCyv6VZkByANJdP6pRr+/UKIGKSTF0bqb4XkZL
         bS5jUYmozAUSLV02SFmj0xBxRPeGzA8446vXsGzZoGF3rSrEegU5g5fWPdoKBTBBunXc
         vWjj2EBBse2dz7X2E7Rgv+dXnT7wSL+D1FJsMYMKI8OT/ZllHMfqaPreuiTImcUYOQuH
         Z2HQ==
X-Gm-Message-State: APjAAAWE4ErlmcXz8LkIUyYjm/FL1/m+Ov4vWnbJQ1N13WtKKBNpG0hJ
        DlRXDx2eeLMlyN+jmYGCXXQ=
X-Google-Smtp-Source: APXvYqwL2CQ9vHO5Ud9WgjE75Io4/8w2jZP1UT9UVMiOHPSuCtMsW4VnTKvbnYh1T5LNlVd5p9SHcA==
X-Received: by 2002:a17:902:2862:: with SMTP id e89mr109696174plb.258.1564392198230;
        Mon, 29 Jul 2019 02:23:18 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.googlemail.com with ESMTPSA id 143sm91540600pgc.6.2019.07.29.02.23.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 02:23:17 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Denis Efremov <efremov@linux.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] modpost: check for static EXPORT_SYMBOL* functions
Date:   Mon, 29 Jul 2019 12:22:50 +0300
Message-Id: <20190729092250.32670-1-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190714152817.24693-1-efremov@linux.com>
References: <20190714152817.24693-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch adds a check to warn about static EXPORT_SYMBOL* functions
during the modpost. In most of the cases, a static symbol marked for
exporting is an odd combination that should be fixed either by deleting
the exporting mark or by removing the static attribute and adding the
appropriate declaration to headers.

This check could help to detect the following problems:
1. 550113d4e9f5 ("i2c: add newly exported functions to the header, too")
2. 54638c6eaf44 ("net: phy: make exported variables non-static")
3. 98ef2046f28b ("mm: remove the exporting of totalram_pages")
4. 73df167c819e ("s390/zcrypt: remove the exporting of ap_query_configuration")
5. a57caf8c527f ("sunrpc/cache: remove the exporting of cache_seq_next")
6. e4e4730698c9 ("crypto: skcipher - remove the exporting of skcipher_walk_next")
7. 14b4c48bb1ce ("gve: Remove the exporting of gve_probe")
8. 9b79ee9773a8 ("scsi: libsas: remove the exporting of sas_wait_eh")
9. ...

Build time impact, allmodconfig, Dell XPS 15 9570 (measurements 3x):
$ make mrproper; make allmodconfig; time make -j12; \
  git checkout HEAD~1; \
  make mrproper; make allmodconfig; time make -j12
1.
   (with patch) 17635,94s user 1895,54s system 1085% cpu 29:59,22 total
   (w/o  patch) 17275,42s user 1803,87s system 1112% cpu 28:35,66 total
2.
   (with patch) 17369,51s user 1763,28s system 1111% cpu 28:41,47 total
   (w/o  patch) 16880,50s user 1670,93s system 1113% cpu 27:46,56 total
3.
   (with patch) 17937,88s user 1842,53s system 1109% cpu 29:42,26 total
   (w/o  patch) 17267,55s user 1725,09s system 1111% cpu 28:28,17 total

Thus, the current implementation adds approx. 1 min for allmodconfig.

Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/mod/modpost.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..e138d763bcf2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -169,6 +169,7 @@ struct symbol {
 	unsigned int kernel:1;     /* 1 if symbol is from kernel
 				    *  (only for external modules) **/
 	unsigned int preloaded:1;  /* 1 if symbol from Module.symvers, or crc */
+	unsigned int is_static:1;  /* 1 if symbol is not global */
 	enum export  export;       /* Type of export */
 	char name[0];
 };
@@ -201,6 +202,7 @@ static struct symbol *alloc_symbol(const char *name, unsigned int weak,
 	strcpy(s->name, name);
 	s->weak = weak;
 	s->next = next;
+	s->is_static = 1;
 	return s;
 }
 
@@ -1980,6 +1982,22 @@ static void read_symbols(const char *modname)
 		handle_modversions(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
 	}
+
+	// check for static EXPORT_SYMBOL_* functions && global vars
+	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
+		unsigned char bind = ELF_ST_BIND(sym->st_info);
+		unsigned char type = ELF_ST_TYPE(sym->st_info);
+
+		if (type == STT_OBJECT || type == STT_FUNC) {
+			struct symbol *s =
+				find_symbol(remove_dot(info.strtab +
+						       sym->st_name));
+
+			if (s && (bind == STB_GLOBAL || bind == STB_WEAK))
+				s->is_static = 0;
+		}
+	}
+
 	if (!is_vmlinux(modname) || vmlinux_section_warnings)
 		check_sec_ref(mod, modname, &info);
 
@@ -2425,6 +2443,7 @@ int main(int argc, char **argv)
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
 	int err;
+	int n;
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
@@ -2520,6 +2539,19 @@ int main(int argc, char **argv)
 	if (sec_mismatch_count && sec_mismatch_fatal)
 		fatal("modpost: Section mismatches detected.\n"
 		      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
+	for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
+		struct symbol *s = symbolhash[n];
+
+		while (s) {
+			if (s->is_static)
+				warn("\"%s\" [%s] is the static %s\n",
+				     s->name, s->module->name,
+				     export_str(s->export));
+
+			s = s->next;
+		}
+	}
+
 	free(buf.p);
 
 	return err;
-- 
2.21.0

