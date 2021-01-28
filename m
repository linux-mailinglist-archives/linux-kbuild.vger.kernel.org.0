Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44BA9307DCE
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 19:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhA1SUn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 13:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231765AbhA1SSI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 13:18:08 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F36BC0617A9;
        Thu, 28 Jan 2021 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=DcV/PmOY6hAphV/JOGoYAz+wVNDHrAES7FkDy+2zUOQ=; b=nhW7yLcu3KAcayq2OhG3sf4aDH
        iR+aAX5HpWfNCMTybZ4e/zr8b5juxLRguLk5GoHC7tb36LEdiayGdruxlme+dQs9xGwuEHaPDk9Ll
        5ewxDEDMdya5NXwltwkqrB+zPie2X5nNPlm+20I4dr7VzTNzCPdfDX6CRzpnaergfvPFllOigepxa
        NFMcn0pwn4KO8i4FLuvpoq1om8LVQ01NQDlTpP5xCfDejbeRqwFlIGflUffVVwycYjmW0UARPyxCA
        CbK/5o2APWFLBnvNZscqSro77LxSZhvMnGYPjC+633y8BdYOyYZ3Lk5Hj4Dkzbcc3TgeLXRLi9zYg
        6ArcDd4A==;
Received: from [2001:4bb8:198:6bf4:e052:196b:7e32:37d9] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l5Bpc-008o1y-5u; Thu, 28 Jan 2021 18:15:50 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 12/13] module: remove EXPORT_SYMBOL_GPL_FUTURE
Date:   Thu, 28 Jan 2021 19:14:20 +0100
Message-Id: <20210128181421.2279-13-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128181421.2279-1-hch@lst.de>
References: <20210128181421.2279-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As far as I can tell this has never been used at all, and certainly
not any time recently.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/tools/relocs.c           |  4 ++--
 include/asm-generic/vmlinux.lds.h | 14 --------------
 include/linux/export.h            |  1 -
 include/linux/module.h            |  5 -----
 kernel/module.c                   | 29 ++---------------------------
 scripts/mod/modpost.c             | 13 +------------
 scripts/mod/modpost.h             |  1 -
 scripts/module.lds.S              |  2 --
 tools/include/linux/export.h      |  1 -
 9 files changed, 5 insertions(+), 65 deletions(-)

diff --git a/arch/x86/tools/relocs.c b/arch/x86/tools/relocs.c
index ce7188cbdae58a..0d210d0e83e241 100644
--- a/arch/x86/tools/relocs.c
+++ b/arch/x86/tools/relocs.c
@@ -61,8 +61,8 @@ static const char * const sym_regex_kernel[S_NSYMTYPES] = {
 	"(__iommu_table|__apicdrivers|__smp_locks)(|_end)|"
 	"__(start|end)_pci_.*|"
 	"__(start|end)_builtin_fw|"
-	"__(start|stop)___ksymtab(|_gpl|_unused|_unused_gpl|_gpl_future)|"
-	"__(start|stop)___kcrctab(|_gpl|_unused|_unused_gpl|_gpl_future)|"
+	"__(start|stop)___ksymtab(|_gpl|_unused|_unused_gpl)|"
+	"__(start|stop)___kcrctab(|_gpl|_unused|_unused_gpl)|"
 	"__(start|stop)___param|"
 	"__(start|stop)___modver|"
 	"__(start|stop)___bug_table|"
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2b3d81b1535a5..83243506e68b00 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -495,13 +495,6 @@
 		__stop___ksymtab_unused_gpl = .;			\
 	}								\
 									\
-	/* Kernel symbol table: GPL-future-only symbols */		\
-	__ksymtab_gpl_future : AT(ADDR(__ksymtab_gpl_future) - LOAD_OFFSET) { \
-		__start___ksymtab_gpl_future = .;			\
-		KEEP(*(SORT(___ksymtab_gpl_future+*)))			\
-		__stop___ksymtab_gpl_future = .;			\
-	}								\
-									\
 	/* Kernel symbol table: Normal symbols */			\
 	__kcrctab         : AT(ADDR(__kcrctab) - LOAD_OFFSET) {		\
 		__start___kcrctab = .;					\
@@ -530,13 +523,6 @@
 		__stop___kcrctab_unused_gpl = .;			\
 	}								\
 									\
-	/* Kernel symbol table: GPL-future-only symbols */		\
-	__kcrctab_gpl_future : AT(ADDR(__kcrctab_gpl_future) - LOAD_OFFSET) { \
-		__start___kcrctab_gpl_future = .;			\
-		KEEP(*(SORT(___kcrctab_gpl_future+*)))			\
-		__stop___kcrctab_gpl_future = .;			\
-	}								\
-									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
 		*(__ksymtab_strings)					\
diff --git a/include/linux/export.h b/include/linux/export.h
index fceb5e85571711..362b64f8d4a7c2 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -157,7 +157,6 @@ struct kernel_symbol {
 
 #define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym)		_EXPORT_SYMBOL(sym, "_gpl")
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)	_EXPORT_SYMBOL(sym, "_gpl_future")
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", #ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "_gpl", #ns)
 
diff --git a/include/linux/module.h b/include/linux/module.h
index da0f5966ee80c9..e6e50ee3041238 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -411,11 +411,6 @@ struct module {
 
 	bool async_probe_requested;
 
-	/* symbols that will be GPL-only in the near future. */
-	const struct kernel_symbol *gpl_future_syms;
-	const s32 *gpl_future_crcs;
-	unsigned int num_gpl_future_syms;
-
 	/* Exception table */
 	unsigned int num_exentries;
 	struct exception_table_entry *extable;
diff --git a/kernel/module.c b/kernel/module.c
index 576c780e79c799..492b6fa5a662c8 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -413,11 +413,8 @@ extern const struct kernel_symbol __start___ksymtab[];
 extern const struct kernel_symbol __stop___ksymtab[];
 extern const struct kernel_symbol __start___ksymtab_gpl[];
 extern const struct kernel_symbol __stop___ksymtab_gpl[];
-extern const struct kernel_symbol __start___ksymtab_gpl_future[];
-extern const struct kernel_symbol __stop___ksymtab_gpl_future[];
 extern const s32 __start___kcrctab[];
 extern const s32 __start___kcrctab_gpl[];
-extern const s32 __start___kcrctab_gpl_future[];
 #ifdef CONFIG_UNUSED_SYMBOLS
 extern const struct kernel_symbol __start___ksymtab_unused[];
 extern const struct kernel_symbol __stop___ksymtab_unused[];
@@ -439,7 +436,6 @@ struct symsearch {
 	enum mod_license {
 		NOT_GPL_ONLY,
 		GPL_ONLY,
-		WILL_BE_GPL_ONLY,
 	} license;
 	bool unused;
 };
@@ -463,15 +459,8 @@ static bool check_exported_symbol(const struct symsearch *syms,
 {
 	struct find_symbol_arg *fsa = data;
 
-	if (!fsa->gplok) {
-		if (syms->license == GPL_ONLY)
-			return false;
-		if (syms->license == WILL_BE_GPL_ONLY && fsa->warn) {
-			pr_warn("Symbol %s is being used by a non-GPL module, "
-				"which will not be allowed in the future\n",
-				fsa->name);
-		}
-	}
+	if (!fsa->gplok && syms->license == GPL_ONLY)
+		return false;
 
 #ifdef CONFIG_UNUSED_SYMBOLS
 	if (syms->unused && fsa->warn) {
@@ -555,9 +544,6 @@ static bool find_symbol(struct find_symbol_arg *fsa)
 		{ __start___ksymtab_gpl, __stop___ksymtab_gpl,
 		  __start___kcrctab_gpl,
 		  GPL_ONLY, false },
-		{ __start___ksymtab_gpl_future, __stop___ksymtab_gpl_future,
-		  __start___kcrctab_gpl_future,
-		  WILL_BE_GPL_ONLY, false },
 #ifdef CONFIG_UNUSED_SYMBOLS
 		{ __start___ksymtab_unused, __stop___ksymtab_unused,
 		  __start___kcrctab_unused,
@@ -584,10 +570,6 @@ static bool find_symbol(struct find_symbol_arg *fsa)
 			{ mod->gpl_syms, mod->gpl_syms + mod->num_gpl_syms,
 			  mod->gpl_crcs,
 			  GPL_ONLY, false },
-			{ mod->gpl_future_syms,
-			  mod->gpl_future_syms + mod->num_gpl_future_syms,
-			  mod->gpl_future_crcs,
-			  WILL_BE_GPL_ONLY, false },
 #ifdef CONFIG_UNUSED_SYMBOLS
 			{ mod->unused_syms,
 			  mod->unused_syms + mod->num_unused_syms,
@@ -2297,7 +2279,6 @@ static int verify_exported_symbols(struct module *mod)
 	} arr[] = {
 		{ mod->syms, mod->num_syms },
 		{ mod->gpl_syms, mod->num_gpl_syms },
-		{ mod->gpl_future_syms, mod->num_gpl_future_syms },
 #ifdef CONFIG_UNUSED_SYMBOLS
 		{ mod->unused_syms, mod->num_unused_syms },
 		{ mod->unused_gpl_syms, mod->num_unused_gpl_syms },
@@ -3215,11 +3196,6 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 				     sizeof(*mod->gpl_syms),
 				     &mod->num_gpl_syms);
 	mod->gpl_crcs = section_addr(info, "__kcrctab_gpl");
-	mod->gpl_future_syms = section_objs(info,
-					    "__ksymtab_gpl_future",
-					    sizeof(*mod->gpl_future_syms),
-					    &mod->num_gpl_future_syms);
-	mod->gpl_future_crcs = section_addr(info, "__kcrctab_gpl_future");
 
 #ifdef CONFIG_UNUSED_SYMBOLS
 	mod->unused_syms = section_objs(info, "__ksymtab_unused",
@@ -3413,7 +3389,6 @@ static int check_module_license_and_versions(struct module *mod)
 #ifdef CONFIG_MODVERSIONS
 	if ((mod->num_syms && !mod->crcs)
 	    || (mod->num_gpl_syms && !mod->gpl_crcs)
-	    || (mod->num_gpl_future_syms && !mod->gpl_future_crcs)
 #ifdef CONFIG_UNUSED_SYMBOLS
 	    || (mod->num_unused_syms && !mod->unused_crcs)
 	    || (mod->num_unused_gpl_syms && !mod->unused_gpl_crcs)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d6c81657d69550..25c1446055d16b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -44,7 +44,7 @@ static bool error_occurred;
 
 enum export {
 	export_plain,      export_unused,     export_gpl,
-	export_unused_gpl, export_gpl_future, export_unknown
+	export_unused_gpl, export_unknown
 };
 
 /* In kernel, this size is defined in linux/module.h;
@@ -304,7 +304,6 @@ static const struct {
 	{ .str = "EXPORT_UNUSED_SYMBOL",     .export = export_unused },
 	{ .str = "EXPORT_SYMBOL_GPL",        .export = export_gpl },
 	{ .str = "EXPORT_UNUSED_SYMBOL_GPL", .export = export_unused_gpl },
-	{ .str = "EXPORT_SYMBOL_GPL_FUTURE", .export = export_gpl_future },
 	{ .str = "(unknown)",                .export = export_unknown },
 };
 
@@ -369,8 +368,6 @@ static enum export export_from_secname(struct elf_info *elf, unsigned int sec)
 		return export_gpl;
 	else if (strstarts(secname, "___ksymtab_unused_gpl+"))
 		return export_unused_gpl;
-	else if (strstarts(secname, "___ksymtab_gpl_future+"))
-		return export_gpl_future;
 	else
 		return export_unknown;
 }
@@ -385,8 +382,6 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
 		return export_gpl;
 	else if (sec == elf->export_unused_gpl_sec)
 		return export_unused_gpl;
-	else if (sec == elf->export_gpl_future_sec)
-		return export_gpl_future;
 	else
 		return export_unknown;
 }
@@ -596,8 +591,6 @@ static int parse_elf(struct elf_info *info, const char *filename)
 			info->export_gpl_sec = i;
 		else if (strcmp(secname, "__ksymtab_unused_gpl") == 0)
 			info->export_unused_gpl_sec = i;
-		else if (strcmp(secname, "__ksymtab_gpl_future") == 0)
-			info->export_gpl_future_sec = i;
 
 		if (sechdrs[i].sh_type == SHT_SYMTAB) {
 			unsigned int sh_link_idx;
@@ -2152,10 +2145,6 @@ static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
 		error("GPL-incompatible module %s.ko uses GPL-only symbol marked UNUSED '%s'\n",
 		      m, s);
 		break;
-	case export_gpl_future:
-		warn("GPL-incompatible module %s.ko uses future GPL-only symbol '%s'\n",
-		     m, s);
-		break;
 	case export_plain:
 	case export_unused:
 	case export_unknown:
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index e6f46eee0af02f..834220de002bd1 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -142,7 +142,6 @@ struct elf_info {
 	Elf_Section  export_unused_sec;
 	Elf_Section  export_gpl_sec;
 	Elf_Section  export_unused_gpl_sec;
-	Elf_Section  export_gpl_future_sec;
 	char         *strtab;
 	char	     *modinfo;
 	unsigned int modinfo_len;
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 69b9b71a6a4731..d82b452e8a7168 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -13,12 +13,10 @@ SECTIONS {
 	__ksymtab_gpl		0 : { *(SORT(___ksymtab_gpl+*)) }
 	__ksymtab_unused	0 : { *(SORT(___ksymtab_unused+*)) }
 	__ksymtab_unused_gpl	0 : { *(SORT(___ksymtab_unused_gpl+*)) }
-	__ksymtab_gpl_future	0 : { *(SORT(___ksymtab_gpl_future+*)) }
 	__kcrctab		0 : { *(SORT(___kcrctab+*)) }
 	__kcrctab_gpl		0 : { *(SORT(___kcrctab_gpl+*)) }
 	__kcrctab_unused	0 : { *(SORT(___kcrctab_unused+*)) }
 	__kcrctab_unused_gpl	0 : { *(SORT(___kcrctab_unused_gpl+*)) }
-	__kcrctab_gpl_future	0 : { *(SORT(___kcrctab_gpl_future+*)) }
 
 	.init_array		0 : ALIGN(8) { *(SORT(.init_array.*)) *(.init_array) }
 
diff --git a/tools/include/linux/export.h b/tools/include/linux/export.h
index d07e586b9ba0ec..9f61349a8944e1 100644
--- a/tools/include/linux/export.h
+++ b/tools/include/linux/export.h
@@ -3,7 +3,6 @@
 
 #define EXPORT_SYMBOL(sym)
 #define EXPORT_SYMBOL_GPL(sym)
-#define EXPORT_SYMBOL_GPL_FUTURE(sym)
 #define EXPORT_UNUSED_SYMBOL(sym)
 #define EXPORT_UNUSED_SYMBOL_GPL(sym)
 
-- 
2.29.2

