Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C05B526127
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 May 2022 13:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379952AbiEMLmP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 May 2022 07:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379934AbiEMLmO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 May 2022 07:42:14 -0400
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8355A093;
        Fri, 13 May 2022 04:42:11 -0700 (PDT)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 24DBeEwa008349;
        Fri, 13 May 2022 20:40:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 24DBeEwa008349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1652442016;
        bh=kJSj0j+AXEcFQ8ZaJqXjHFqZBXEeirnzJV86O9qeRSY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BM4uUUXsXYeQPGzbAMRpqzUkPiOPzds/ZOLS5bh+zuZDgEP2nI/NNf7yNqJxfA6Cz
         Gg6wjwC7OM7KG4v94307ziySprB77YRlGNhcX711XbNRLbgLlClKakCiHkJ+NE6E4A
         Q77Ed6tBm7MKC5X2qV754LARS9HXGVYYBhllVcLB4sCKzmwJ8vf4CH9FY1ScYq5D4r
         cEohXEUSQSaKSbS9/xqrv8um3z6KfEzWq7om/tWedC9rsC645DOoMUzYPrawm1lruN
         Pj+RkH0n6rZq8lqGP6cImO3s2poXi8fU0dVmPeFaOXTcOYEq00YklYl3fGKZcoHaiS
         0TdVvBnoYohgQ==
X-Nifty-SrcIP: [133.32.177.133]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, llvm@lists.linux.dev,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v6 01/10] modpost: extract symbol versions from *.cmd files
Date:   Fri, 13 May 2022 20:39:21 +0900
Message-Id: <20220513113930.10488-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220513113930.10488-1-masahiroy@kernel.org>
References: <20220513113930.10488-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, CONFIG_MODVERSIONS needs extra link to embed the symbol
versions into ELF objects. Then, modpost extracts the version CRCs
from them.

The following figures show how it currently works, and how I am trying
to change it.

Current implementation
======================
                                                           |----------|
                 embed CRC      -------------------------->| final    |
       $(CC)       $(LD)       /  |---------|              | link for |
       -----> *.o -------> *.o -->| modpost |              | vmlinux  |
      /              /            |         |-- *.mod.c -->| or       |
     / genksyms     /             |---------|              | module   |
  *.c ------> *.symversions                                |----------|

Genksyms outputs the calculated CRCs in the form of linker script
(*.symversions), which is used by $(LD) to update the object.

If CONFIG_LTO_CLANG=y, the build process is much more complex. Embedding
the CRCs is postponed until the LLVM bitcode is converted into ELF,
creating another intermediate *.prelink.o.

However, this complexity is unneeded. There is no reason why we must
embed version CRCs in objects so early.

There is final link stage for vmlinux (scripts/link-vmlinux.sh) and
modules (scripts/Makefile.modfinal). We can link CRCs at the very last
moment.

New implementation
==================
                                                           |----------|
                   --------------------------------------->| final    |
       $(CC)      /    |---------|                         | link for |
       -----> *.o ---->|         |                         | vmlinux  |
      /                | modpost |--- .vmlinux.export.c -->| or       |
     / genksyms        |         |--- *.mod.c ------------>| module   |
  *.c ------> *.cmd -->|---------|                         |----------|

Pass the symbol versions to modpost as separate text data, which are
available in *.cmd files.

This commit changes modpost to extract CRCs from *.cmd files instead of
from ELF objects.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
---

Changes in v6:
  - Fix false-positive warnings when CONFIG_TRIM_UNUSED_KSYMS=y

Changes in v2:
  - Simplify the implementation (parse .cmd files after ELF)

 scripts/mod/modpost.c | 179 +++++++++++++++++++++++++++++++-----------
 1 file changed, 131 insertions(+), 48 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index fc5db1f73cf1..213a130d1635 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -381,19 +381,10 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	return s;
 }
 
-static void sym_set_crc(const char *name, unsigned int crc)
+static void sym_set_crc(struct symbol *sym, unsigned int crc)
 {
-	struct symbol *s = find_symbol(name);
-
-	/*
-	 * Ignore stand-alone __crc_*, which might be auto-generated symbols
-	 * such as __*_veneer in ARM ELF.
-	 */
-	if (!s)
-		return;
-
-	s->crc = crc;
-	s->crc_valid = true;
+	sym->crc = crc;
+	sym->crc_valid = true;
 }
 
 static void *grab_file(const char *filename, size_t *size)
@@ -616,33 +607,6 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 	return 0;
 }
 
-static void handle_modversion(const struct module *mod,
-			      const struct elf_info *info,
-			      const Elf_Sym *sym, const char *symname)
-{
-	unsigned int crc;
-
-	if (sym->st_shndx == SHN_UNDEF) {
-		warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
-		     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
-		     symname, mod->name, mod->is_vmlinux ? "" : ".ko",
-		     symname);
-
-		return;
-	}
-
-	if (sym->st_shndx == SHN_ABS) {
-		crc = sym->st_value;
-	} else {
-		unsigned int *crcp;
-
-		/* symbol points to the CRC in the ELF object */
-		crcp = sym_get_data(info, sym);
-		crc = TO_NATIVE(*crcp);
-	}
-	sym_set_crc(symname, crc);
-}
-
 static void handle_symbol(struct module *mod, struct elf_info *info,
 			  const Elf_Sym *sym, const char *symname)
 {
@@ -760,6 +724,104 @@ static char *remove_dot(char *s)
 	return s;
 }
 
+/*
+ * The CRCs are recorded in .*.cmd files in the form of:
+ * #SYMVER <name> <crc>
+ */
+static void extract_crcs_for_object(const char *object, struct module *mod)
+{
+	char cmd_file[PATH_MAX];
+	char *buf, *p;
+	const char *base;
+	int dirlen, ret;
+
+	base = strrchr(object, '/');
+	if (base) {
+		base++;
+		dirlen = base - object;
+	} else {
+		dirlen = 0;
+		base = object;
+	}
+
+	ret = snprintf(cmd_file, sizeof(cmd_file), "%.*s.%s.cmd",
+		       dirlen, object, base);
+	if (ret >= sizeof(cmd_file)) {
+		error("%s: too long path was truncated\n", cmd_file);
+		return;
+	}
+
+	buf = read_text_file(cmd_file);
+	p = buf;
+
+	while ((p = strstr(p, "\n#SYMVER "))) {
+		char *name;
+		size_t namelen;
+		unsigned int crc;
+		struct symbol *sym;
+
+		name = p + strlen("\n#SYMVER ");
+
+		p = strchr(name, ' ');
+		if (!p)
+			break;
+
+		namelen = p - name;
+		p++;
+
+		if (!isdigit(*p))
+			continue;	/* skip this line */
+
+		crc = strtol(p, &p, 0);
+		if (*p != '\n')
+			continue;	/* skip this line */
+
+		name[namelen] = '\0';
+
+		/*
+		 * sym_find_with_module() may return NULL here.
+		 * It typically occurs when CONFIG_TRIM_UNUSED_KSYMS=y.
+		 * Since commit e1327a127703, genksyms calculates CRCs of all
+		 * symbols, including trimmed ones. Ignore orphan CRCs.
+		 */
+		sym = sym_find_with_module(name, mod);
+		if (sym)
+			sym_set_crc(sym, crc);
+	}
+
+	free(buf);
+}
+
+/*
+ * The symbol versions (CRC) are recorded in the .*.cmd files.
+ * Parse them to retrieve CRCs for the current module.
+ */
+static void mod_set_crcs(struct module *mod)
+{
+	char objlist[PATH_MAX];
+	char *buf, *p, *obj;
+	int ret;
+
+	if (mod->is_vmlinux) {
+		strcpy(objlist, ".vmlinux.objs");
+	} else {
+		/* objects for a module are listed in the *.mod file. */
+		ret = snprintf(objlist, sizeof(objlist), "%s.mod", mod->name);
+		if (ret >= sizeof(objlist)) {
+			error("%s: too long path was truncated\n", objlist);
+			return;
+		}
+	}
+
+	buf = read_text_file(objlist);
+	p = buf;
+
+	while ((obj = strsep(&p, "\n")) && obj[0])
+		extract_crcs_for_object(obj, mod);
+
+	free(buf);
+}
+
 static void read_symbols(const char *modname)
 {
 	const char *symname;
@@ -820,9 +882,6 @@ static void read_symbols(const char *modname)
 		if (strstarts(symname, "__kstrtabns_"))
 			sym_update_namespace(symname + strlen("__kstrtabns_"),
 					     sym_get_data(&info, sym));
-		if (strstarts(symname, "__crc_"))
-			handle_modversion(mod, &info, sym,
-					  symname + strlen("__crc_"));
 	}
 
 	// check for static EXPORT_SYMBOL_* functions && global vars
@@ -850,12 +909,17 @@ static void read_symbols(const char *modname)
 
 	parse_elf_finish(&info);
 
-	/* Our trick to get versioning for module struct etc. - it's
-	 * never passed as an argument to an exported function, so
-	 * the automatic versioning doesn't pick it up, but it's really
-	 * important anyhow */
-	if (modversions)
+	if (modversions) {
+		/*
+		 * Our trick to get versioning for module struct etc. - it's
+		 * never passed as an argument to an exported function, so
+		 * the automatic versioning doesn't pick it up, but it's really
+		 * important anyhow.
+		 */
 		sym_add_unresolved("module_layout", mod, false);
+
+		mod_set_crcs(mod);
+	}
 }
 
 static void read_symbols_from_files(const char *filename)
@@ -1012,6 +1076,23 @@ static void add_header(struct buffer *b, struct module *mod)
 		buf_printf(b, "\nMODULE_INFO(staging, \"Y\");\n");
 }
 
+static void check_symversions(struct module *mod)
+{
+	struct symbol *sym;
+
+	if (!modversions)
+		return;
+
+	list_for_each_entry(sym, &mod->exported_symbols, list) {
+		if (!sym->crc_valid) {
+			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
+			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
+			     sym->name, mod->name, mod->is_vmlinux ? "" : ".ko",
+			     sym->name);
+		}
+	}
+}
+
 /**
  * Record CRCs for unresolved symbols
  **/
@@ -1227,7 +1308,7 @@ static void read_dump(const char *fname)
 		}
 		s = sym_add_exported(symname, mod, gpl_only);
 		s->is_static = false;
-		sym_set_crc(symname, crc);
+		sym_set_crc(s, crc);
 		sym_update_namespace(symname, namespace);
 	}
 	free(buf);
@@ -1353,6 +1434,8 @@ int main(int argc, char **argv)
 		if (mod->from_dump)
 			continue;
 
+		check_symversions(mod);
+
 		if (!mod->is_vmlinux)
 			write_mod_c_file(mod);
 	}
-- 
2.32.0

