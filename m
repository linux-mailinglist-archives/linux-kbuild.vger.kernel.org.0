Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38236FCC04
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 18:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfKNRmf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 12:42:35 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:64705 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfKNRme (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:42:34 -0500
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xAEHgSo4028428;
        Fri, 15 Nov 2019 02:42:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xAEHgSo4028428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573753350;
        bh=rmpRFmxNZ/Mz3ML460iOsaBVMxNlFRyIh/Y5zJuSSiI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xc7sVy9dshezER+j91adxqP9RRE1WwfyarA600bZ8t2aXXFCoRhP0zGXPFRhpiCP/
         G0kqU+UaVGBXf3+78g/81f53DdGHT030OKS35vyW8LyFINRGmv4f48aPWPKeUoLAUl
         kec2dPH9dFM9s/gxiEQWZUgHUvB+1fufxiLtQOqf9F6kxIMdzKfN+amak4vW9ozdf7
         HS0tZuR/6wnMjub8sqAYZBKwDBKnQmtZqLyTQDuQvpe6ImQDfIQz7nrdpX3W1Rczo2
         otMv0nLO7rxRqVzkcZ2XZW2LB1BU4BPWXxBKf3/QDFrxmg85ZPnwPnONhOBoMe2ykI
         XUrON9xfkU33Q==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] modpost: stop symbol preloading for modversion CRC
Date:   Fri, 15 Nov 2019 02:42:24 +0900
Message-Id: <20191114174226.7201-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191114174226.7201-1-yamada.masahiro@socionext.com>
References: <20191114174226.7201-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is complicated to add mocked-up symbols to pre-handle CRC.
Handle CRC after all the export symbols in the relevant module
are registered.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/mod/modpost.c | 64 +++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6735ae3da4c2..73bdf27c41fe 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -169,7 +169,7 @@ struct symbol {
 	unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
 	unsigned int kernel:1;     /* 1 if symbol is from kernel
 				    *  (only for external modules) **/
-	unsigned int preloaded:1;  /* 1 if symbol from Module.symvers, or crc */
+	unsigned int preloaded:1;  /* 1 if symbol from Module.symvers */
 	unsigned int is_static:1;  /* 1 if symbol is not global */
 	enum export  export;       /* Type of export */
 	char name[0];
@@ -410,15 +410,15 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	return s;
 }
 
-static void sym_update_crc(const char *name, struct module *mod,
-			   unsigned int crc, enum export export)
+static void sym_set_crc(const char *name, const struct module *mod,
+			unsigned int crc)
 {
 	struct symbol *s = find_symbol(name);
 
 	if (!s) {
-		s = new_symbol(name, mod, export);
-		/* Don't complain when we find it later. */
-		s->preloaded = 1;
+		warn("%s: '__crc_%s' is invalid use. __crc_* is reserved for modversion\n",
+		     mod->name, name);
+		return;
 	}
 	s->crc = crc;
 	s->crc_valid = 1;
@@ -683,12 +683,34 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 	return 0;
 }
 
+static void handle_modversion(const struct module *mod,
+			      const struct elf_info *info,
+			      const Elf_Sym *sym, const char *symname)
+{
+	unsigned int crc;
+
+	if (sym->st_shndx == SHN_UNDEF) {
+		warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
+		     symname, mod->name, is_vmlinux(mod->name) ? "":".ko");
+		return;
+	}
+
+	if (sym->st_shndx == SHN_ABS) {
+		crc = sym->st_value;
+	} else {
+		unsigned int *crcp;
+
+		/* symbol points to the CRC in the ELF object */
+		crcp = sym_get_data(info, sym);
+		crc = TO_NATIVE(*crcp);
+	}
+	sym_set_crc(symname, mod, crc);
+}
+
 static void handle_symbol(struct module *mod, struct elf_info *info,
 			  const Elf_Sym *sym, const char *symname)
 {
-	unsigned int crc;
 	enum export export;
-	bool is_crc = false;
 	const char *name;
 
 	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
@@ -697,21 +719,6 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 	else
 		export = export_from_sec(info, get_secindex(info, sym));
 
-	/* CRC'd symbol */
-	if (strstarts(symname, "__crc_")) {
-		is_crc = true;
-		crc = (unsigned int) sym->st_value;
-		if (sym->st_shndx != SHN_UNDEF && sym->st_shndx != SHN_ABS) {
-			unsigned int *crcp;
-
-			/* symbol points to the CRC in the ELF object */
-			crcp = sym_get_data(info, sym);
-			crc = TO_NATIVE(*crcp);
-		}
-		sym_update_crc(symname + strlen("__crc_"), mod, crc,
-				export);
-	}
-
 	switch (sym->st_shndx) {
 	case SHN_COMMON:
 		if (strstarts(symname, "__gnu_lto_")) {
@@ -746,11 +753,6 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 		}
 #endif
 
-		if (is_crc) {
-			const char *e = is_vmlinux(mod->name) ?"":".ko";
-			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
-			     symname + strlen("__crc_"), mod->name, e);
-		}
 		mod->unres = alloc_symbol(symname,
 					  ELF_ST_BIND(sym->st_info) == STB_WEAK,
 					  mod->unres);
@@ -2063,6 +2065,10 @@ static void read_symbols(const char *modname)
 			sym_update_namespace(symname + strlen("__kstrtabns_"),
 					     namespace_from_kstrtabns(&info,
 								      sym));
+
+		if (strstarts(symname, "__crc_"))
+			handle_modversion(mod, &info, sym,
+					  symname + strlen("__crc_"));
 	}
 
 	// check for static EXPORT_SYMBOL_* functions && global vars
@@ -2476,7 +2482,7 @@ static void read_dump(const char *fname, unsigned int kernel)
 		s->kernel    = kernel;
 		s->preloaded = 1;
 		s->is_static = 0;
-		sym_update_crc(symname, mod, crc, export_no(export));
+		sym_set_crc(symname, mod, crc);
 		sym_update_namespace(symname, namespace);
 	}
 	release_file(file, size);
-- 
2.17.1

