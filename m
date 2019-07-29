Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D60F878D9E
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 16:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387614AbfG2OTW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 10:19:22 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50612 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387596AbfG2OTW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 10:19:22 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so54046332wml.0;
        Mon, 29 Jul 2019 07:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mPSU7CQ3trXT2tBc057UKDI1+jBvLcsqm50IJJJ4aTY=;
        b=PnvPa+hMSTqgdkPp1GuROQzUUXctTrtig3ipUIH9xAo21NUykDOoxXVirhGymVkGDc
         oTaVcb3hAvGxMuI4gLGaH4dg6F4LAVa6iPXbQLPPZnC4lCmSk0qcvcPgRn6wWnyPEOgG
         uvIodJP1gVoh1L8O/h9YNpFuCuu1lnnNK8B6Wqy/C0P6zPp+pabrsSJpXB3zmmimQ3ep
         O69x1SaMQXH/m+dWQUDQHpb/BKjdKUMGVgQLknRDcQYEp41vb4Ui6S1jh3x840CmIwM1
         t3Qf5fuwzead6vOZDgSenlmY4hdEjDQKOOZbY24WtfJIp1azD8QGBGcSEjIi8VrbMEoQ
         MG7A==
X-Gm-Message-State: APjAAAW6AI+TTUE4ZqTo9FiMP3jNOoxPnmqeNMAH4qlpMVwfCtF3Vwku
        Sx9tdBrEsDH2CZZECftZPLs=
X-Google-Smtp-Source: APXvYqwmE0Uv8sxCs53JJCegd52VZoY6HnfxIL16sCkRb/S7FUs1bx49IJ5sieNsO8qa2EHRTil8Dg==
X-Received: by 2002:a1c:d108:: with SMTP id i8mr104623902wmg.28.1564409959862;
        Mon, 29 Jul 2019 07:19:19 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
        by smtp.googlemail.com with ESMTPSA id o126sm57104044wmo.1.2019.07.29.07.19.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 07:19:19 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Denis Efremov <efremov@linux.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] modpost: check for static EXPORT_SYMBOL* functions
Date:   Mon, 29 Jul 2019 17:18:01 +0300
Message-Id: <20190729141801.31333-1-efremov@linux.com>
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
 scripts/mod/modpost.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f277e116e0eb..332898d34e47 100644
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

