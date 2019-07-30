Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48A887B152
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 20:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbfG3SMf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 14:12:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37648 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfG3SMf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 14:12:35 -0400
Received: by mail-wr1-f67.google.com with SMTP id n9so41714278wrr.4;
        Tue, 30 Jul 2019 11:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FG50qMXYDzRXP74GhnEpD0QAPrVPYalzM9CFo1Wta4k=;
        b=V9leKCBsCZDmfSheYE+IFpTBkj8qXlXD6SZvHaoDzFPFy1+iGnsBN29Nkb+Yvi5lZK
         whfurwPQKyuN4rFOu2/B2OEg+iK9JeR+SF28DNNW1TTQ841BwEYwshaMvoSAHDyh+jzg
         0cbLZfYJjBtpoL7XvhDP1Zy/S4d5r1gHWpJY7a7S6iWYqWs16BOImksoX1Rc6g+ErTHO
         eN2emWNQmMLJK/6arPN4DJKDvmjAlVokXguBDlaystEYIPkU09F5rm0MhAomfFOM8sga
         geGS4Dw0cv9HFhMxOfGiziTiNWL3uRSxWpY5vI4MtzW+wxTkLUQnZ+NaWpUEs1BNLefU
         v/gw==
X-Gm-Message-State: APjAAAWdqvqvZOJhhKEHJ7IoLsAYew9BPJUMzjbo1pyrXpjwKjc1yiGB
        oeySYYth3uxi6dqtVieOMGQ=
X-Google-Smtp-Source: APXvYqwxLD8Q/rNMwLytHuUf1tCTje3/ux9J6fmCYJ92X4681fJdAVEySTTL/Na6+UeO8GSqTJaZwA==
X-Received: by 2002:adf:fb8e:: with SMTP id a14mr34074696wrr.263.1564510353042;
        Tue, 30 Jul 2019 11:12:33 -0700 (PDT)
Received: from localhost.localdomain ([194.135.60.194])
        by smtp.googlemail.com with ESMTPSA id z25sm68350876wmf.38.2019.07.30.11.12.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jul 2019 11:12:32 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Denis Efremov <efremov@linux.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4] modpost: check for static EXPORT_SYMBOL* functions
Date:   Tue, 30 Jul 2019 21:11:46 +0300
Message-Id: <20190730181146.6507-1-efremov@linux.com>
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

The check adds less than a minute to a usual build.

Acked-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/mod/modpost.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..3e6d36ddfcdf 100644
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
 
@@ -1980,6 +1982,21 @@ static void read_symbols(const char *modname)
 		handle_modversions(mod, &info, sym, symname);
 		handle_moddevtable(mod, &info, sym, symname);
 	}
+
+	// check for static EXPORT_SYMBOL_* functions && global vars
+	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
+		unsigned char bind = ELF_ST_BIND(sym->st_info);
+
+		if (bind == STB_GLOBAL || bind == STB_WEAK) {
+			struct symbol *s =
+				find_symbol(remove_dot(info.strtab +
+						       sym->st_name));
+
+			if (s)
+				s->is_static = 0;
+		}
+	}
+
 	if (!is_vmlinux(modname) || vmlinux_section_warnings)
 		check_sec_ref(mod, modname, &info);
 
@@ -2425,6 +2442,7 @@ int main(int argc, char **argv)
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
 	int err;
+	int n;
 	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
 
@@ -2520,6 +2538,19 @@ int main(int argc, char **argv)
 	if (sec_mismatch_count && sec_mismatch_fatal)
 		fatal("modpost: Section mismatches detected.\n"
 		      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
+	for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
+		struct symbol *s = symbolhash[n];
+
+		while (s) {
+			if (s->is_static)
+				warn("\"%s\" [%s] is a static %s\n",
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

