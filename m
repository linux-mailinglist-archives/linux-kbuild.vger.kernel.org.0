Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7C37D537
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2019 08:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfHAGHN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Aug 2019 02:07:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35714 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfHAGHM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Aug 2019 02:07:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so68195646ljh.2;
        Wed, 31 Jul 2019 23:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=18o8C04iXfM/nT0jvGA4Jf28XWbsN5tGXLbxgSXhVzs=;
        b=llDA96Me+c04fgKTnKNM/9kD+ZtZlu6HoRSln2B9vzXR2H59dKnk/Wh3A/NcuFWA+C
         d2b2WJn11EPXHmo4ONPDvsymFtOb5bmSY/V9AMF9iC4cbTMjYJjtS1z13I/48+93969F
         DeuX36mxUB2/C57Skg2Tl+5BbDIVbulmfwR87H2jHYxL4oFMtGxb+GJAfNhR9NZn9m8g
         uhv8ST5HJVY51xPJEpEQkyYcYyYGQ3SDfvl89NlvgdBCf+LzEY3rzHa11vpxE27LXcSR
         /27vzDlEns55ykzpnRZy4a8gKPhhgvn7ArxefS/4zk/yItyr00KQBYc6t/f9wlxR4T/Q
         VJww==
X-Gm-Message-State: APjAAAWtz5IKQihTdTXx8vY3Dxin88D3Siv9cfZAna2IIsF4VoedDZKz
        aGW1GLqAo/TbGIouxol7erw=
X-Google-Smtp-Source: APXvYqxKG07d8i5W9EW2ZSPbmxAYbD2CQxN8z4Q3ldQLMN1T7aYpz6Zd8cW86sgecTC+si0Y6OZAsw==
X-Received: by 2002:a2e:834e:: with SMTP id l14mr20594274ljh.158.1564639630834;
        Wed, 31 Jul 2019 23:07:10 -0700 (PDT)
Received: from localhost.localdomain (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.googlemail.com with ESMTPSA id t137sm12075348lff.78.2019.07.31.23.07.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 23:07:09 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Denis Efremov <efremov@linux.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v5] modpost: check for static EXPORT_SYMBOL* functions
Date:   Thu,  1 Aug 2019 09:06:57 +0300
Message-Id: <20190801060657.5932-1-efremov@linux.com>
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

The build time impact is very limited and is almost at the unnoticeable
level (< 1 sec).

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

