Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B479523AC8
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 May 2022 18:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343820AbiEKQuC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 May 2022 12:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345098AbiEKQt5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 May 2022 12:49:57 -0400
Received: from conuserg-08.nifty.com (conuserg-08.nifty.com [210.131.2.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BC795DE7;
        Wed, 11 May 2022 09:49:48 -0700 (PDT)
Received: from grover.jp (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 24BGlWbu031975;
        Thu, 12 May 2022 01:47:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 24BGlWbu031975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1652287654;
        bh=Ny/f8Cu0+NLDcW52IfYAsg1OMd0z3nWmReT0kJbf6as=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ydw5y1kY1EZVnz64D+61N55M54VgwG1CXDXGA8qPqLHArs4b/rte/pkUN6rsM4GzX
         6Ukz4I9u2wvM+XtU7/MPAP+V/QJBLbwFuVog7mHxEWOR5BU1n4kJMGgvVK3/z+lsBk
         ZNSTpFjVUzeW9LWKsOsa/OB/PzcKKV+W9crxRerOffLPqiCbrTeXgO9HsuSYVHPV9B
         LHKzipTz8BYUZbW8C/64fZCkKvnUVQxAsocrbK/sK8S5Q4cLllH0wJgQ6289rX5Y/b
         cTZYa8oT2yje+bQFw/Oj1BhUjqZKKsDMtl6XVHy1mkvKVAmgtVOuQkIyPYc8Q+pe7T
         jRZUZbsXHS7cg==
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
Subject: [PATCH v5 01/12] modpost: split the section mismatch checks into section-check.c
Date:   Thu, 12 May 2022 01:45:03 +0900
Message-Id: <20220511164514.2741934-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220511164514.2741934-1-masahiroy@kernel.org>
References: <20220511164514.2741934-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

modpost.c is too big, and the half of the code is for section checks.
Split it.

Also, move some related typedefs and macros from modpost.h to
section-check.c

Copy Sam's Copyright there. Commit b39927cf4cc5 ("kbuild: check for
section mismatch during modpost stage") is the initial work for the
section checks.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v5:
   - Fix the build error  (spotted by Nathan)
   - Do not do codying style changes  (Suggested by Nick)
   - Copy Sam's copyright to the new file

Changes in v4:
   - New patch

 scripts/mod/Makefile        |    4 +-
 scripts/mod/modpost.c       | 1202 +---------------------------------
 scripts/mod/modpost.h       |   34 +-
 scripts/mod/section-check.c | 1222 +++++++++++++++++++++++++++++++++++
 4 files changed, 1241 insertions(+), 1221 deletions(-)
 create mode 100644 scripts/mod/section-check.c

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index c9e38ad937fd..6e548eb6317d 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -5,7 +5,7 @@ CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
 hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
 
-modpost-objs	:= modpost.o file2alias.o sumversion.o
+modpost-objs	:= modpost.o section-check.o file2alias.o sumversion.o
 
 devicetable-offsets-file := devicetable-offsets.h
 
@@ -16,7 +16,7 @@ targets += $(devicetable-offsets-file) devicetable-offsets.s
 
 # dependencies on generated files need to be listed explicitly
 
-$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o: $(obj)/elfconfig.h
+$(addprefix $(obj)/, $(modpost-objs)): $(obj)/elfconfig.h
 $(obj)/file2alias.o: $(obj)/$(devicetable-offsets-file)
 
 quiet_cmd_elfconfig = MKELF   $@
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a78b75f0eeb0..e7e2c70a98f5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -31,7 +31,7 @@ static bool external_module;
 /* Only warn about unresolved symbols */
 static bool warn_unresolved;
 
-static int sec_mismatch_count;
+int sec_mismatch_count;
 static bool sec_mismatch_warn_only = true;
 /* ignore missing files */
 static bool ignore_missing_files;
@@ -310,8 +310,8 @@ static void add_namespace(struct list_head *head, const char *namespace)
 	}
 }
 
-static void *sym_get_data_by_offset(const struct elf_info *info,
-				    unsigned int secindex, unsigned long offset)
+void *sym_get_data_by_offset(const struct elf_info *info,
+			     unsigned int secindex, unsigned long offset)
 {
 	Elf_Shdr *sechdr = &info->sechdrs[secindex];
 
@@ -327,19 +327,17 @@ static void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym)
 				      sym->st_value);
 }
 
-static const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
+const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
 {
 	return sym_get_data_by_offset(info, info->secindex_strings,
 				      sechdr->sh_name);
 }
 
-static const char *sec_name(const struct elf_info *info, int secindex)
+const char *sec_name(const struct elf_info *info, int secindex)
 {
 	return sech_name(info, &info->sechdrs[secindex]);
 }
 
-#define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
-
 static void sym_update_namespace(const char *symname, const char *namespace)
 {
 	struct symbol *s = find_symbol(symname);
@@ -741,1196 +739,6 @@ static char *get_modinfo(struct elf_info *info, const char *tag)
 	return get_next_modinfo(info, tag, NULL);
 }
 
-/**
- * Test if string s ends in string sub
- * return 0 if match
- **/
-static int strrcmp(const char *s, const char *sub)
-{
-	int slen, sublen;
-
-	if (!s || !sub)
-		return 1;
-
-	slen = strlen(s);
-	sublen = strlen(sub);
-
-	if ((slen == 0) || (sublen == 0))
-		return 1;
-
-	if (sublen > slen)
-		return 1;
-
-	return memcmp(s + slen - sublen, sub, sublen);
-}
-
-static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
-{
-	if (sym)
-		return elf->strtab + sym->st_name;
-	else
-		return "(unknown)";
-}
-
-/* The pattern is an array of simple patterns.
- * "foo" will match an exact string equal to "foo"
- * "*foo" will match a string that ends with "foo"
- * "foo*" will match a string that begins with "foo"
- * "*foo*" will match a string that contains "foo"
- */
-static int match(const char *sym, const char * const pat[])
-{
-	const char *p;
-	while (*pat) {
-		const char *endp;
-
-		p = *pat++;
-		endp = p + strlen(p) - 1;
-
-		/* "*foo*" */
-		if (*p == '*' && *endp == '*') {
-			char *bare = NOFAIL(strndup(p + 1, strlen(p) - 2));
-			char *here = strstr(sym, bare);
-
-			free(bare);
-			if (here != NULL)
-				return 1;
-		}
-		/* "*foo" */
-		else if (*p == '*') {
-			if (strrcmp(sym, p + 1) == 0)
-				return 1;
-		}
-		/* "foo*" */
-		else if (*endp == '*') {
-			if (strncmp(sym, p, strlen(p) - 1) == 0)
-				return 1;
-		}
-		/* no wildcards */
-		else {
-			if (strcmp(p, sym) == 0)
-				return 1;
-		}
-	}
-	/* no match */
-	return 0;
-}
-
-/* sections that we do not want to do full section mismatch check on */
-static const char *const section_white_list[] =
-{
-	".comment*",
-	".debug*",
-	".cranges",		/* sh64 */
-	".zdebug*",		/* Compressed debug sections. */
-	".GCC.command.line",	/* record-gcc-switches */
-	".mdebug*",        /* alpha, score, mips etc. */
-	".pdr",            /* alpha, score, mips etc. */
-	".stab*",
-	".note*",
-	".got*",
-	".toc*",
-	".xt.prop",				 /* xtensa */
-	".xt.lit",         /* xtensa */
-	".arcextmap*",			/* arc */
-	".gnu.linkonce.arcext*",	/* arc : modules */
-	".cmem*",			/* EZchip */
-	".fmt_slot*",			/* EZchip */
-	".gnu.lto*",
-	".discard.*",
-	NULL
-};
-
-/*
- * This is used to find sections missing the SHF_ALLOC flag.
- * The cause of this is often a section specified in assembler
- * without "ax" / "aw".
- */
-static void check_section(const char *modname, struct elf_info *elf,
-			  Elf_Shdr *sechdr)
-{
-	const char *sec = sech_name(elf, sechdr);
-
-	if (sechdr->sh_type == SHT_PROGBITS &&
-	    !(sechdr->sh_flags & SHF_ALLOC) &&
-	    !match(sec, section_white_list)) {
-		warn("%s (%s): unexpected non-allocatable section.\n"
-		     "Did you forget to use \"ax\"/\"aw\" in a .S file?\n"
-		     "Note that for example <linux/init.h> contains\n"
-		     "section definitions for use in .S files.\n\n",
-		     modname, sec);
-	}
-}
-
-
-
-#define ALL_INIT_DATA_SECTIONS \
-	".init.setup", ".init.rodata", ".meminit.rodata", \
-	".init.data", ".meminit.data"
-#define ALL_EXIT_DATA_SECTIONS \
-	".exit.data", ".memexit.data"
-
-#define ALL_INIT_TEXT_SECTIONS \
-	".init.text", ".meminit.text"
-#define ALL_EXIT_TEXT_SECTIONS \
-	".exit.text", ".memexit.text"
-
-#define ALL_PCI_INIT_SECTIONS	\
-	".pci_fixup_early", ".pci_fixup_header", ".pci_fixup_final", \
-	".pci_fixup_enable", ".pci_fixup_resume", \
-	".pci_fixup_resume_early", ".pci_fixup_suspend"
-
-#define ALL_XXXINIT_SECTIONS MEM_INIT_SECTIONS
-#define ALL_XXXEXIT_SECTIONS MEM_EXIT_SECTIONS
-
-#define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
-#define ALL_EXIT_SECTIONS EXIT_SECTIONS, ALL_XXXEXIT_SECTIONS
-
-#define DATA_SECTIONS ".data", ".data.rel"
-#define TEXT_SECTIONS ".text", ".text.unlikely", ".sched.text", \
-		".kprobes.text", ".cpuidle.text", ".noinstr.text"
-#define OTHER_TEXT_SECTIONS ".ref.text", ".head.text", ".spinlock.text", \
-		".fixup", ".entry.text", ".exception.text", ".text.*", \
-		".coldtext", ".softirqentry.text"
-
-#define INIT_SECTIONS      ".init.*"
-#define MEM_INIT_SECTIONS  ".meminit.*"
-
-#define EXIT_SECTIONS      ".exit.*"
-#define MEM_EXIT_SECTIONS  ".memexit.*"
-
-#define ALL_TEXT_SECTIONS  ALL_INIT_TEXT_SECTIONS, ALL_EXIT_TEXT_SECTIONS, \
-		TEXT_SECTIONS, OTHER_TEXT_SECTIONS
-
-/* init data sections */
-static const char *const init_data_sections[] =
-	{ ALL_INIT_DATA_SECTIONS, NULL };
-
-/* all init sections */
-static const char *const init_sections[] = { ALL_INIT_SECTIONS, NULL };
-
-/* All init and exit sections (code + data) */
-static const char *const init_exit_sections[] =
-	{ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS, NULL };
-
-/* all text sections */
-static const char *const text_sections[] = { ALL_TEXT_SECTIONS, NULL };
-
-/* data section */
-static const char *const data_sections[] = { DATA_SECTIONS, NULL };
-
-
-/* symbols in .data that may refer to init/exit sections */
-#define DEFAULT_SYMBOL_WHITE_LIST					\
-	"*driver",							\
-	"*_template", /* scsi uses *_template a lot */			\
-	"*_timer",    /* arm uses ops structures named _timer a lot */	\
-	"*_sht",      /* scsi also used *_sht to some extent */		\
-	"*_ops",							\
-	"*_probe",							\
-	"*_probe_one",							\
-	"*_console"
-
-static const char *const head_sections[] = { ".head.text*", NULL };
-static const char *const linker_symbols[] =
-	{ "__init_begin", "_sinittext", "_einittext", NULL };
-static const char *const optim_symbols[] = { "*.constprop.*", NULL };
-
-enum mismatch {
-	TEXT_TO_ANY_INIT,
-	DATA_TO_ANY_INIT,
-	TEXT_TO_ANY_EXIT,
-	DATA_TO_ANY_EXIT,
-	XXXINIT_TO_SOME_INIT,
-	XXXEXIT_TO_SOME_EXIT,
-	ANY_INIT_TO_ANY_EXIT,
-	ANY_EXIT_TO_ANY_INIT,
-	EXPORT_TO_INIT_EXIT,
-	EXTABLE_TO_NON_TEXT,
-};
-
-/**
- * Describe how to match sections on different criteria:
- *
- * @fromsec: Array of sections to be matched.
- *
- * @bad_tosec: Relocations applied to a section in @fromsec to a section in
- * this array is forbidden (black-list).  Can be empty.
- *
- * @good_tosec: Relocations applied to a section in @fromsec must be
- * targeting sections in this array (white-list).  Can be empty.
- *
- * @mismatch: Type of mismatch.
- *
- * @symbol_white_list: Do not match a relocation to a symbol in this list
- * even if it is targeting a section in @bad_to_sec.
- *
- * @handler: Specific handler to call when a match is found.  If NULL,
- * default_mismatch_handler() will be called.
- *
- */
-struct sectioncheck {
-	const char *fromsec[20];
-	const char *bad_tosec[20];
-	const char *good_tosec[20];
-	enum mismatch mismatch;
-	const char *symbol_white_list[20];
-	void (*handler)(const char *modname, struct elf_info *elf,
-			const struct sectioncheck* const mismatch,
-			Elf_Rela *r, Elf_Sym *sym, const char *fromsec);
-
-};
-
-static void extable_mismatch_handler(const char *modname, struct elf_info *elf,
-				     const struct sectioncheck* const mismatch,
-				     Elf_Rela *r, Elf_Sym *sym,
-				     const char *fromsec);
-
-static const struct sectioncheck sectioncheck[] = {
-/* Do not reference init/exit code/data from
- * normal code and data
- */
-{
-	.fromsec = { TEXT_SECTIONS, NULL },
-	.bad_tosec = { ALL_INIT_SECTIONS, NULL },
-	.mismatch = TEXT_TO_ANY_INIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-{
-	.fromsec = { DATA_SECTIONS, NULL },
-	.bad_tosec = { ALL_XXXINIT_SECTIONS, NULL },
-	.mismatch = DATA_TO_ANY_INIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-{
-	.fromsec = { DATA_SECTIONS, NULL },
-	.bad_tosec = { INIT_SECTIONS, NULL },
-	.mismatch = DATA_TO_ANY_INIT,
-	.symbol_white_list = {
-		"*_template", "*_timer", "*_sht", "*_ops",
-		"*_probe", "*_probe_one", "*_console", NULL
-	},
-},
-{
-	.fromsec = { TEXT_SECTIONS, NULL },
-	.bad_tosec = { ALL_EXIT_SECTIONS, NULL },
-	.mismatch = TEXT_TO_ANY_EXIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-{
-	.fromsec = { DATA_SECTIONS, NULL },
-	.bad_tosec = { ALL_EXIT_SECTIONS, NULL },
-	.mismatch = DATA_TO_ANY_EXIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-/* Do not reference init code/data from meminit code/data */
-{
-	.fromsec = { ALL_XXXINIT_SECTIONS, NULL },
-	.bad_tosec = { INIT_SECTIONS, NULL },
-	.mismatch = XXXINIT_TO_SOME_INIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-/* Do not reference exit code/data from memexit code/data */
-{
-	.fromsec = { ALL_XXXEXIT_SECTIONS, NULL },
-	.bad_tosec = { EXIT_SECTIONS, NULL },
-	.mismatch = XXXEXIT_TO_SOME_EXIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-/* Do not use exit code/data from init code */
-{
-	.fromsec = { ALL_INIT_SECTIONS, NULL },
-	.bad_tosec = { ALL_EXIT_SECTIONS, NULL },
-	.mismatch = ANY_INIT_TO_ANY_EXIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-/* Do not use init code/data from exit code */
-{
-	.fromsec = { ALL_EXIT_SECTIONS, NULL },
-	.bad_tosec = { ALL_INIT_SECTIONS, NULL },
-	.mismatch = ANY_EXIT_TO_ANY_INIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-{
-	.fromsec = { ALL_PCI_INIT_SECTIONS, NULL },
-	.bad_tosec = { INIT_SECTIONS, NULL },
-	.mismatch = ANY_INIT_TO_ANY_EXIT,
-	.symbol_white_list = { NULL },
-},
-/* Do not export init/exit functions or data */
-{
-	.fromsec = { "__ksymtab*", NULL },
-	.bad_tosec = { INIT_SECTIONS, EXIT_SECTIONS, NULL },
-	.mismatch = EXPORT_TO_INIT_EXIT,
-	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
-},
-{
-	.fromsec = { "__ex_table", NULL },
-	/* If you're adding any new black-listed sections in here, consider
-	 * adding a special 'printer' for them in scripts/check_extable.
-	 */
-	.bad_tosec = { ".altinstr_replacement", NULL },
-	.good_tosec = {ALL_TEXT_SECTIONS , NULL},
-	.mismatch = EXTABLE_TO_NON_TEXT,
-	.handler = extable_mismatch_handler,
-}
-};
-
-static const struct sectioncheck *section_mismatch(
-		const char *fromsec, const char *tosec)
-{
-	int i;
-	int elems = sizeof(sectioncheck) / sizeof(struct sectioncheck);
-	const struct sectioncheck *check = &sectioncheck[0];
-
-	/*
-	 * The target section could be the SHT_NUL section when we're
-	 * handling relocations to un-resolved symbols, trying to match it
-	 * doesn't make much sense and causes build failures on parisc
-	 * architectures.
-	 */
-	if (*tosec == '\0')
-		return NULL;
-
-	for (i = 0; i < elems; i++) {
-		if (match(fromsec, check->fromsec)) {
-			if (check->bad_tosec[0] && match(tosec, check->bad_tosec))
-				return check;
-			if (check->good_tosec[0] && !match(tosec, check->good_tosec))
-				return check;
-		}
-		check++;
-	}
-	return NULL;
-}
-
-/**
- * Whitelist to allow certain references to pass with no warning.
- *
- * Pattern 1:
- *   If a module parameter is declared __initdata and permissions=0
- *   then this is legal despite the warning generated.
- *   We cannot see value of permissions here, so just ignore
- *   this pattern.
- *   The pattern is identified by:
- *   tosec   = .init.data
- *   fromsec = .data*
- *   atsym   =__param*
- *
- * Pattern 1a:
- *   module_param_call() ops can refer to __init set function if permissions=0
- *   The pattern is identified by:
- *   tosec   = .init.text
- *   fromsec = .data*
- *   atsym   = __param_ops_*
- *
- * Pattern 2:
- *   Many drivers utilise a *driver container with references to
- *   add, remove, probe functions etc.
- *   the pattern is identified by:
- *   tosec   = init or exit section
- *   fromsec = data section
- *   atsym = *driver, *_template, *_sht, *_ops, *_probe,
- *           *probe_one, *_console, *_timer
- *
- * Pattern 3:
- *   Whitelist all references from .head.text to any init section
- *
- * Pattern 4:
- *   Some symbols belong to init section but still it is ok to reference
- *   these from non-init sections as these symbols don't have any memory
- *   allocated for them and symbol address and value are same. So even
- *   if init section is freed, its ok to reference those symbols.
- *   For ex. symbols marking the init section boundaries.
- *   This pattern is identified by
- *   refsymname = __init_begin, _sinittext, _einittext
- *
- * Pattern 5:
- *   GCC may optimize static inlines when fed constant arg(s) resulting
- *   in functions like cpumask_empty() -- generating an associated symbol
- *   cpumask_empty.constprop.3 that appears in the audit.  If the const that
- *   is passed in comes from __init, like say nmi_ipi_mask, we get a
- *   meaningless section warning.  May need to add isra symbols too...
- *   This pattern is identified by
- *   tosec   = init section
- *   fromsec = text section
- *   refsymname = *.constprop.*
- *
- * Pattern 6:
- *   Hide section mismatch warnings for ELF local symbols.  The goal
- *   is to eliminate false positive modpost warnings caused by
- *   compiler-generated ELF local symbol names such as ".LANCHOR1".
- *   Autogenerated symbol names bypass modpost's "Pattern 2"
- *   whitelisting, which relies on pattern-matching against symbol
- *   names to work.  (One situation where gcc can autogenerate ELF
- *   local symbols is when "-fsection-anchors" is used.)
- **/
-static int secref_whitelist(const struct sectioncheck *mismatch,
-			    const char *fromsec, const char *fromsym,
-			    const char *tosec, const char *tosym)
-{
-	/* Check for pattern 1 */
-	if (match(tosec, init_data_sections) &&
-	    match(fromsec, data_sections) &&
-	    strstarts(fromsym, "__param"))
-		return 0;
-
-	/* Check for pattern 1a */
-	if (strcmp(tosec, ".init.text") == 0 &&
-	    match(fromsec, data_sections) &&
-	    strstarts(fromsym, "__param_ops_"))
-		return 0;
-
-	/* Check for pattern 2 */
-	if (match(tosec, init_exit_sections) &&
-	    match(fromsec, data_sections) &&
-	    match(fromsym, mismatch->symbol_white_list))
-		return 0;
-
-	/* Check for pattern 3 */
-	if (match(fromsec, head_sections) &&
-	    match(tosec, init_sections))
-		return 0;
-
-	/* Check for pattern 4 */
-	if (match(tosym, linker_symbols))
-		return 0;
-
-	/* Check for pattern 5 */
-	if (match(fromsec, text_sections) &&
-	    match(tosec, init_sections) &&
-	    match(fromsym, optim_symbols))
-		return 0;
-
-	/* Check for pattern 6 */
-	if (strstarts(fromsym, ".L"))
-		return 0;
-
-	return 1;
-}
-
-static inline int is_arm_mapping_symbol(const char *str)
-{
-	return str[0] == '$' && strchr("axtd", str[1])
-	       && (str[2] == '\0' || str[2] == '.');
-}
-
-/*
- * If there's no name there, ignore it; likewise, ignore it if it's
- * one of the magic symbols emitted used by current ARM tools.
- *
- * Otherwise if find_symbols_between() returns those symbols, they'll
- * fail the whitelist tests and cause lots of false alarms ... fixable
- * only by merging __exit and __init sections into __text, bloating
- * the kernel (which is especially evil on embedded platforms).
- */
-static inline int is_valid_name(struct elf_info *elf, Elf_Sym *sym)
-{
-	const char *name = elf->strtab + sym->st_name;
-
-	if (!name || !strlen(name))
-		return 0;
-	return !is_arm_mapping_symbol(name);
-}
-
-/**
- * Find symbol based on relocation record info.
- * In some cases the symbol supplied is a valid symbol so
- * return refsym. If st_name != 0 we assume this is a valid symbol.
- * In other cases the symbol needs to be looked up in the symbol table
- * based on section and address.
- *  **/
-static Elf_Sym *find_elf_symbol(struct elf_info *elf, Elf64_Sword addr,
-				Elf_Sym *relsym)
-{
-	Elf_Sym *sym;
-	Elf_Sym *near = NULL;
-	Elf64_Sword distance = 20;
-	Elf64_Sword d;
-	unsigned int relsym_secindex;
-
-	if (relsym->st_name != 0)
-		return relsym;
-
-	relsym_secindex = get_secindex(elf, relsym);
-	for (sym = elf->symtab_start; sym < elf->symtab_stop; sym++) {
-		if (get_secindex(elf, sym) != relsym_secindex)
-			continue;
-		if (ELF_ST_TYPE(sym->st_info) == STT_SECTION)
-			continue;
-		if (!is_valid_name(elf, sym))
-			continue;
-		if (sym->st_value == addr)
-			return sym;
-		/* Find a symbol nearby - addr are maybe negative */
-		d = sym->st_value - addr;
-		if (d < 0)
-			d = addr - sym->st_value;
-		if (d < distance) {
-			distance = d;
-			near = sym;
-		}
-	}
-	/* We need a close match */
-	if (distance < 20)
-		return near;
-	else
-		return NULL;
-}
-
-/*
- * Find symbols before or equal addr and after addr - in the section sec.
- * If we find two symbols with equal offset prefer one with a valid name.
- * The ELF format may have a better way to detect what type of symbol
- * it is, but this works for now.
- **/
-static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
-				 const char *sec)
-{
-	Elf_Sym *sym;
-	Elf_Sym *near = NULL;
-	Elf_Addr distance = ~0;
-
-	for (sym = elf->symtab_start; sym < elf->symtab_stop; sym++) {
-		const char *symsec;
-
-		if (is_shndx_special(sym->st_shndx))
-			continue;
-		symsec = sec_name(elf, get_secindex(elf, sym));
-		if (strcmp(symsec, sec) != 0)
-			continue;
-		if (!is_valid_name(elf, sym))
-			continue;
-		if (sym->st_value <= addr) {
-			if ((addr - sym->st_value) < distance) {
-				distance = addr - sym->st_value;
-				near = sym;
-			} else if ((addr - sym->st_value) == distance) {
-				near = sym;
-			}
-		}
-	}
-	return near;
-}
-
-/*
- * Convert a section name to the function/data attribute
- * .init.text => __init
- * .memexitconst => __memconst
- * etc.
- *
- * The memory of returned value has been allocated on a heap. The user of this
- * method should free it after usage.
-*/
-static char *sec2annotation(const char *s)
-{
-	if (match(s, init_exit_sections)) {
-		char *p = NOFAIL(malloc(20));
-		char *r = p;
-
-		*p++ = '_';
-		*p++ = '_';
-		if (*s == '.')
-			s++;
-		while (*s && *s != '.')
-			*p++ = *s++;
-		*p = '\0';
-		if (*s == '.')
-			s++;
-		if (strstr(s, "rodata") != NULL)
-			strcat(p, "const ");
-		else if (strstr(s, "data") != NULL)
-			strcat(p, "data ");
-		else
-			strcat(p, " ");
-		return r;
-	} else {
-		return NOFAIL(strdup(""));
-	}
-}
-
-static int is_function(Elf_Sym *sym)
-{
-	if (sym)
-		return ELF_ST_TYPE(sym->st_info) == STT_FUNC;
-	else
-		return -1;
-}
-
-static void print_section_list(const char * const list[20])
-{
-	const char *const *s = list;
-
-	while (*s) {
-		fprintf(stderr, "%s", *s);
-		s++;
-		if (*s)
-			fprintf(stderr, ", ");
-	}
-	fprintf(stderr, "\n");
-}
-
-static inline void get_pretty_name(int is_func, const char** name, const char** name_p)
-{
-	switch (is_func) {
-	case 0:	*name = "variable"; *name_p = ""; break;
-	case 1:	*name = "function"; *name_p = "()"; break;
-	default: *name = "(unknown reference)"; *name_p = ""; break;
-	}
-}
-
-/*
- * Print a warning about a section mismatch.
- * Try to find symbols near it so user can find it.
- * Check whitelist before warning - it may be a false positive.
- */
-static void report_sec_mismatch(const char *modname,
-				const struct sectioncheck *mismatch,
-				const char *fromsec,
-				unsigned long long fromaddr,
-				const char *fromsym,
-				int from_is_func,
-				const char *tosec, const char *tosym,
-				int to_is_func)
-{
-	const char *from, *from_p;
-	const char *to, *to_p;
-	char *prl_from;
-	char *prl_to;
-
-	sec_mismatch_count++;
-
-	get_pretty_name(from_is_func, &from, &from_p);
-	get_pretty_name(to_is_func, &to, &to_p);
-
-	warn("%s(%s+0x%llx): Section mismatch in reference from the %s %s%s "
-	     "to the %s %s:%s%s\n",
-	     modname, fromsec, fromaddr, from, fromsym, from_p, to, tosec,
-	     tosym, to_p);
-
-	switch (mismatch->mismatch) {
-	case TEXT_TO_ANY_INIT:
-		prl_from = sec2annotation(fromsec);
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The function %s%s() references\n"
-		"the %s %s%s%s.\n"
-		"This is often because %s lacks a %s\n"
-		"annotation or the annotation of %s is wrong.\n",
-		prl_from, fromsym,
-		to, prl_to, tosym, to_p,
-		fromsym, prl_to, tosym);
-		free(prl_from);
-		free(prl_to);
-		break;
-	case DATA_TO_ANY_INIT: {
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The variable %s references\n"
-		"the %s %s%s%s\n"
-		"If the reference is valid then annotate the\n"
-		"variable with __init* or __refdata (see linux/init.h) "
-		"or name the variable:\n",
-		fromsym, to, prl_to, tosym, to_p);
-		print_section_list(mismatch->symbol_white_list);
-		free(prl_to);
-		break;
-	}
-	case TEXT_TO_ANY_EXIT:
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The function %s() references a %s in an exit section.\n"
-		"Often the %s %s%s has valid usage outside the exit section\n"
-		"and the fix is to remove the %sannotation of %s.\n",
-		fromsym, to, to, tosym, to_p, prl_to, tosym);
-		free(prl_to);
-		break;
-	case DATA_TO_ANY_EXIT: {
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The variable %s references\n"
-		"the %s %s%s%s\n"
-		"If the reference is valid then annotate the\n"
-		"variable with __exit* (see linux/init.h) or "
-		"name the variable:\n",
-		fromsym, to, prl_to, tosym, to_p);
-		print_section_list(mismatch->symbol_white_list);
-		free(prl_to);
-		break;
-	}
-	case XXXINIT_TO_SOME_INIT:
-	case XXXEXIT_TO_SOME_EXIT:
-		prl_from = sec2annotation(fromsec);
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The %s %s%s%s references\n"
-		"a %s %s%s%s.\n"
-		"If %s is only used by %s then\n"
-		"annotate %s with a matching annotation.\n",
-		from, prl_from, fromsym, from_p,
-		to, prl_to, tosym, to_p,
-		tosym, fromsym, tosym);
-		free(prl_from);
-		free(prl_to);
-		break;
-	case ANY_INIT_TO_ANY_EXIT:
-		prl_from = sec2annotation(fromsec);
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The %s %s%s%s references\n"
-		"a %s %s%s%s.\n"
-		"This is often seen when error handling "
-		"in the init function\n"
-		"uses functionality in the exit path.\n"
-		"The fix is often to remove the %sannotation of\n"
-		"%s%s so it may be used outside an exit section.\n",
-		from, prl_from, fromsym, from_p,
-		to, prl_to, tosym, to_p,
-		prl_to, tosym, to_p);
-		free(prl_from);
-		free(prl_to);
-		break;
-	case ANY_EXIT_TO_ANY_INIT:
-		prl_from = sec2annotation(fromsec);
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The %s %s%s%s references\n"
-		"a %s %s%s%s.\n"
-		"This is often seen when error handling "
-		"in the exit function\n"
-		"uses functionality in the init path.\n"
-		"The fix is often to remove the %sannotation of\n"
-		"%s%s so it may be used outside an init section.\n",
-		from, prl_from, fromsym, from_p,
-		to, prl_to, tosym, to_p,
-		prl_to, tosym, to_p);
-		free(prl_from);
-		free(prl_to);
-		break;
-	case EXPORT_TO_INIT_EXIT:
-		prl_to = sec2annotation(tosec);
-		fprintf(stderr,
-		"The symbol %s is exported and annotated %s\n"
-		"Fix this by removing the %sannotation of %s "
-		"or drop the export.\n",
-		tosym, prl_to, prl_to, tosym);
-		free(prl_to);
-		break;
-	case EXTABLE_TO_NON_TEXT:
-		fatal("There's a special handler for this mismatch type, "
-		      "we should never get here.");
-		break;
-	}
-	fprintf(stderr, "\n");
-}
-
-static void default_mismatch_handler(const char *modname, struct elf_info *elf,
-				     const struct sectioncheck* const mismatch,
-				     Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
-{
-	const char *tosec;
-	Elf_Sym *to;
-	Elf_Sym *from;
-	const char *tosym;
-	const char *fromsym;
-
-	from = find_elf_symbol2(elf, r->r_offset, fromsec);
-	fromsym = sym_name(elf, from);
-
-	if (strstarts(fromsym, "reference___initcall"))
-		return;
-
-	tosec = sec_name(elf, get_secindex(elf, sym));
-	to = find_elf_symbol(elf, r->r_addend, sym);
-	tosym = sym_name(elf, to);
-
-	/* check whitelist - we may ignore it */
-	if (secref_whitelist(mismatch,
-			     fromsec, fromsym, tosec, tosym)) {
-		report_sec_mismatch(modname, mismatch,
-				    fromsec, r->r_offset, fromsym,
-				    is_function(from), tosec, tosym,
-				    is_function(to));
-	}
-}
-
-static int is_executable_section(struct elf_info* elf, unsigned int section_index)
-{
-	if (section_index > elf->num_sections)
-		fatal("section_index is outside elf->num_sections!\n");
-
-	return ((elf->sechdrs[section_index].sh_flags & SHF_EXECINSTR) == SHF_EXECINSTR);
-}
-
-/*
- * We rely on a gross hack in section_rel[a]() calling find_extable_entry_size()
- * to know the sizeof(struct exception_table_entry) for the target architecture.
- */
-static unsigned int extable_entry_size = 0;
-static void find_extable_entry_size(const char* const sec, const Elf_Rela* r)
-{
-	/*
-	 * If we're currently checking the second relocation within __ex_table,
-	 * that relocation offset tells us the offsetof(struct
-	 * exception_table_entry, fixup) which is equal to sizeof(struct
-	 * exception_table_entry) divided by two.  We use that to our advantage
-	 * since there's no portable way to get that size as every architecture
-	 * seems to go with different sized types.  Not pretty but better than
-	 * hard-coding the size for every architecture..
-	 */
-	if (!extable_entry_size)
-		extable_entry_size = r->r_offset * 2;
-}
-
-static inline bool is_extable_fault_address(Elf_Rela *r)
-{
-	/*
-	 * extable_entry_size is only discovered after we've handled the
-	 * _second_ relocation in __ex_table, so only abort when we're not
-	 * handling the first reloc and extable_entry_size is zero.
-	 */
-	if (r->r_offset && extable_entry_size == 0)
-		fatal("extable_entry size hasn't been discovered!\n");
-
-	return ((r->r_offset == 0) ||
-		(r->r_offset % extable_entry_size == 0));
-}
-
-#define is_second_extable_reloc(Start, Cur, Sec)			\
-	(((Cur) == (Start) + 1) && (strcmp("__ex_table", (Sec)) == 0))
-
-static void report_extable_warnings(const char* modname, struct elf_info* elf,
-				    const struct sectioncheck* const mismatch,
-				    Elf_Rela* r, Elf_Sym* sym,
-				    const char* fromsec, const char* tosec)
-{
-	Elf_Sym* fromsym = find_elf_symbol2(elf, r->r_offset, fromsec);
-	const char* fromsym_name = sym_name(elf, fromsym);
-	Elf_Sym* tosym = find_elf_symbol(elf, r->r_addend, sym);
-	const char* tosym_name = sym_name(elf, tosym);
-	const char* from_pretty_name;
-	const char* from_pretty_name_p;
-	const char* to_pretty_name;
-	const char* to_pretty_name_p;
-
-	get_pretty_name(is_function(fromsym),
-			&from_pretty_name, &from_pretty_name_p);
-	get_pretty_name(is_function(tosym),
-			&to_pretty_name, &to_pretty_name_p);
-
-	warn("%s(%s+0x%lx): Section mismatch in reference"
-	     " from the %s %s%s to the %s %s:%s%s\n",
-	     modname, fromsec, (long)r->r_offset, from_pretty_name,
-	     fromsym_name, from_pretty_name_p,
-	     to_pretty_name, tosec, tosym_name, to_pretty_name_p);
-
-	if (!match(tosec, mismatch->bad_tosec) &&
-	    is_executable_section(elf, get_secindex(elf, sym)))
-		fprintf(stderr,
-			"The relocation at %s+0x%lx references\n"
-			"section \"%s\" which is not in the list of\n"
-			"authorized sections.  If you're adding a new section\n"
-			"and/or if this reference is valid, add \"%s\" to the\n"
-			"list of authorized sections to jump to on fault.\n"
-			"This can be achieved by adding \"%s\" to \n"
-			"OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.\n",
-			fromsec, (long)r->r_offset, tosec, tosec, tosec);
-}
-
-static void extable_mismatch_handler(const char* modname, struct elf_info *elf,
-				     const struct sectioncheck* const mismatch,
-				     Elf_Rela* r, Elf_Sym* sym,
-				     const char *fromsec)
-{
-	const char* tosec = sec_name(elf, get_secindex(elf, sym));
-
-	sec_mismatch_count++;
-
-	report_extable_warnings(modname, elf, mismatch, r, sym, fromsec, tosec);
-
-	if (match(tosec, mismatch->bad_tosec))
-		fatal("The relocation at %s+0x%lx references\n"
-		      "section \"%s\" which is black-listed.\n"
-		      "Something is seriously wrong and should be fixed.\n"
-		      "You might get more information about where this is\n"
-		      "coming from by using scripts/check_extable.sh %s\n",
-		      fromsec, (long)r->r_offset, tosec, modname);
-	else if (!is_executable_section(elf, get_secindex(elf, sym))) {
-		if (is_extable_fault_address(r))
-			fatal("The relocation at %s+0x%lx references\n"
-			      "section \"%s\" which is not executable, IOW\n"
-			      "it is not possible for the kernel to fault\n"
-			      "at that address.  Something is seriously wrong\n"
-			      "and should be fixed.\n",
-			      fromsec, (long)r->r_offset, tosec);
-		else
-			fatal("The relocation at %s+0x%lx references\n"
-			      "section \"%s\" which is not executable, IOW\n"
-			      "the kernel will fault if it ever tries to\n"
-			      "jump to it.  Something is seriously wrong\n"
-			      "and should be fixed.\n",
-			      fromsec, (long)r->r_offset, tosec);
-	}
-}
-
-static void check_section_mismatch(const char *modname, struct elf_info *elf,
-				   Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
-{
-	const char *tosec = sec_name(elf, get_secindex(elf, sym));
-	const struct sectioncheck *mismatch = section_mismatch(fromsec, tosec);
-
-	if (mismatch) {
-		if (mismatch->handler)
-			mismatch->handler(modname, elf,  mismatch,
-					  r, sym, fromsec);
-		else
-			default_mismatch_handler(modname, elf, mismatch,
-						 r, sym, fromsec);
-	}
-}
-
-static unsigned int *reloc_location(struct elf_info *elf,
-				    Elf_Shdr *sechdr, Elf_Rela *r)
-{
-	return sym_get_data_by_offset(elf, sechdr->sh_info, r->r_offset);
-}
-
-static int addend_386_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
-{
-	unsigned int r_typ = ELF_R_TYPE(r->r_info);
-	unsigned int *location = reloc_location(elf, sechdr, r);
-
-	switch (r_typ) {
-	case R_386_32:
-		r->r_addend = TO_NATIVE(*location);
-		break;
-	case R_386_PC32:
-		r->r_addend = TO_NATIVE(*location) + 4;
-		/* For CONFIG_RELOCATABLE=y */
-		if (elf->hdr->e_type == ET_EXEC)
-			r->r_addend += r->r_offset;
-		break;
-	}
-	return 0;
-}
-
-#ifndef R_ARM_CALL
-#define R_ARM_CALL	28
-#endif
-#ifndef R_ARM_JUMP24
-#define R_ARM_JUMP24	29
-#endif
-
-#ifndef	R_ARM_THM_CALL
-#define	R_ARM_THM_CALL		10
-#endif
-#ifndef	R_ARM_THM_JUMP24
-#define	R_ARM_THM_JUMP24	30
-#endif
-#ifndef	R_ARM_THM_JUMP19
-#define	R_ARM_THM_JUMP19	51
-#endif
-
-static int addend_arm_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
-{
-	unsigned int r_typ = ELF_R_TYPE(r->r_info);
-
-	switch (r_typ) {
-	case R_ARM_ABS32:
-		/* From ARM ABI: (S + A) | T */
-		r->r_addend = (int)(long)
-			      (elf->symtab_start + ELF_R_SYM(r->r_info));
-		break;
-	case R_ARM_PC24:
-	case R_ARM_CALL:
-	case R_ARM_JUMP24:
-	case R_ARM_THM_CALL:
-	case R_ARM_THM_JUMP24:
-	case R_ARM_THM_JUMP19:
-		/* From ARM ABI: ((S + A) | T) - P */
-		r->r_addend = (int)(long)(elf->hdr +
-			      sechdr->sh_offset +
-			      (r->r_offset - sechdr->sh_addr));
-		break;
-	default:
-		return 1;
-	}
-	return 0;
-}
-
-static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
-{
-	unsigned int r_typ = ELF_R_TYPE(r->r_info);
-	unsigned int *location = reloc_location(elf, sechdr, r);
-	unsigned int inst;
-
-	if (r_typ == R_MIPS_HI16)
-		return 1;	/* skip this */
-	inst = TO_NATIVE(*location);
-	switch (r_typ) {
-	case R_MIPS_LO16:
-		r->r_addend = inst & 0xffff;
-		break;
-	case R_MIPS_26:
-		r->r_addend = (inst & 0x03ffffff) << 2;
-		break;
-	case R_MIPS_32:
-		r->r_addend = inst;
-		break;
-	}
-	return 0;
-}
-
-#ifndef EM_RISCV
-#define EM_RISCV		243
-#endif
-
-#ifndef R_RISCV_SUB32
-#define R_RISCV_SUB32		39
-#endif
-
-static void section_rela(const char *modname, struct elf_info *elf,
-			 Elf_Shdr *sechdr)
-{
-	Elf_Sym  *sym;
-	Elf_Rela *rela;
-	Elf_Rela r;
-	unsigned int r_sym;
-	const char *fromsec;
-
-	Elf_Rela *start = (void *)elf->hdr + sechdr->sh_offset;
-	Elf_Rela *stop  = (void *)start + sechdr->sh_size;
-
-	fromsec = sech_name(elf, sechdr);
-	fromsec += strlen(".rela");
-	/* if from section (name) is know good then skip it */
-	if (match(fromsec, section_white_list))
-		return;
-
-	for (rela = start; rela < stop; rela++) {
-		r.r_offset = TO_NATIVE(rela->r_offset);
-#if KERNEL_ELFCLASS == ELFCLASS64
-		if (elf->hdr->e_machine == EM_MIPS) {
-			unsigned int r_typ;
-			r_sym = ELF64_MIPS_R_SYM(rela->r_info);
-			r_sym = TO_NATIVE(r_sym);
-			r_typ = ELF64_MIPS_R_TYPE(rela->r_info);
-			r.r_info = ELF64_R_INFO(r_sym, r_typ);
-		} else {
-			r.r_info = TO_NATIVE(rela->r_info);
-			r_sym = ELF_R_SYM(r.r_info);
-		}
-#else
-		r.r_info = TO_NATIVE(rela->r_info);
-		r_sym = ELF_R_SYM(r.r_info);
-#endif
-		r.r_addend = TO_NATIVE(rela->r_addend);
-		switch (elf->hdr->e_machine) {
-		case EM_RISCV:
-			if (!strcmp("__ex_table", fromsec) &&
-			    ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)
-				continue;
-			break;
-		}
-		sym = elf->symtab_start + r_sym;
-		/* Skip special sections */
-		if (is_shndx_special(sym->st_shndx))
-			continue;
-		if (is_second_extable_reloc(start, rela, fromsec))
-			find_extable_entry_size(fromsec, &r);
-		check_section_mismatch(modname, elf, &r, sym, fromsec);
-	}
-}
-
-static void section_rel(const char *modname, struct elf_info *elf,
-			Elf_Shdr *sechdr)
-{
-	Elf_Sym *sym;
-	Elf_Rel *rel;
-	Elf_Rela r;
-	unsigned int r_sym;
-	const char *fromsec;
-
-	Elf_Rel *start = (void *)elf->hdr + sechdr->sh_offset;
-	Elf_Rel *stop  = (void *)start + sechdr->sh_size;
-
-	fromsec = sech_name(elf, sechdr);
-	fromsec += strlen(".rel");
-	/* if from section (name) is know good then skip it */
-	if (match(fromsec, section_white_list))
-		return;
-
-	for (rel = start; rel < stop; rel++) {
-		r.r_offset = TO_NATIVE(rel->r_offset);
-#if KERNEL_ELFCLASS == ELFCLASS64
-		if (elf->hdr->e_machine == EM_MIPS) {
-			unsigned int r_typ;
-			r_sym = ELF64_MIPS_R_SYM(rel->r_info);
-			r_sym = TO_NATIVE(r_sym);
-			r_typ = ELF64_MIPS_R_TYPE(rel->r_info);
-			r.r_info = ELF64_R_INFO(r_sym, r_typ);
-		} else {
-			r.r_info = TO_NATIVE(rel->r_info);
-			r_sym = ELF_R_SYM(r.r_info);
-		}
-#else
-		r.r_info = TO_NATIVE(rel->r_info);
-		r_sym = ELF_R_SYM(r.r_info);
-#endif
-		r.r_addend = 0;
-		switch (elf->hdr->e_machine) {
-		case EM_386:
-			if (addend_386_rel(elf, sechdr, &r))
-				continue;
-			break;
-		case EM_ARM:
-			if (addend_arm_rel(elf, sechdr, &r))
-				continue;
-			break;
-		case EM_MIPS:
-			if (addend_mips_rel(elf, sechdr, &r))
-				continue;
-			break;
-		}
-		sym = elf->symtab_start + r_sym;
-		/* Skip special sections */
-		if (is_shndx_special(sym->st_shndx))
-			continue;
-		if (is_second_extable_reloc(start, rel, fromsec))
-			find_extable_entry_size(fromsec, &r);
-		check_section_mismatch(modname, elf, &r, sym, fromsec);
-	}
-}
-
-/**
- * A module includes a number of sections that are discarded
- * either when loaded or when used as built-in.
- * For loaded modules all functions marked __init and all data
- * marked __initdata will be discarded when the module has been initialized.
- * Likewise for modules used built-in the sections marked __exit
- * are discarded because __exit marked function are supposed to be called
- * only when a module is unloaded which never happens for built-in modules.
- * The check_sec_ref() function traverses all relocation records
- * to find all references to a section that reference a section that will
- * be discarded and warns about it.
- **/
-static void check_sec_ref(struct module *mod, const char *modname,
-			  struct elf_info *elf)
-{
-	int i;
-	Elf_Shdr *sechdrs = elf->sechdrs;
-
-	/* Walk through all sections */
-	for (i = 0; i < elf->num_sections; i++) {
-		check_section(modname, elf, &elf->sechdrs[i]);
-		/* We want to process only relocation sections and not .init */
-		if (sechdrs[i].sh_type == SHT_RELA)
-			section_rela(modname, elf, &elf->sechdrs[i]);
-		else if (sechdrs[i].sh_type == SHT_REL)
-			section_rel(modname, elf, &elf->sechdrs[i]);
-	}
-}
-
 static char *remove_dot(char *s)
 {
 	size_t n = strcspn(s, ".");
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index d9daeff07b83..ffa4512e992f 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -52,28 +52,6 @@
 #define ELF_R_TYPE  ELF64_R_TYPE
 #endif
 
-/* The 64-bit MIPS ELF ABI uses an unusual reloc format. */
-typedef struct
-{
-	Elf32_Word    r_sym;	/* Symbol index */
-	unsigned char r_ssym;	/* Special symbol for 2nd relocation */
-	unsigned char r_type3;	/* 3rd relocation type */
-	unsigned char r_type2;	/* 2nd relocation type */
-	unsigned char r_type1;	/* 1st relocation type */
-} _Elf64_Mips_R_Info;
-
-typedef union
-{
-	Elf64_Xword		r_info_number;
-	_Elf64_Mips_R_Info	r_info_fields;
-} _Elf64_Mips_R_Info_union;
-
-#define ELF64_MIPS_R_SYM(i) \
-  ((__extension__ (_Elf64_Mips_R_Info_union)(i)).r_info_fields.r_sym)
-
-#define ELF64_MIPS_R_TYPE(i) \
-  ((__extension__ (_Elf64_Mips_R_Info_union)(i)).r_info_fields.r_type1)
-
 #if KERNEL_ELFDATA != HOST_ELFDATA
 
 static inline void __endian(const void *src, void *dest, unsigned int size)
@@ -96,6 +74,7 @@ static inline void __endian(const void *src, void *dest, unsigned int size)
 
 #endif
 
+#define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
 #define NOFAIL(ptr)   do_nofail((ptr), #ptr)
 void *do_nofail(void *ptr, const char *expr);
 
@@ -173,6 +152,10 @@ static inline unsigned int get_secindex(const struct elf_info *info,
 	return info->symtab_shndx_start[sym - info->symtab_start];
 }
 
+/* section-check.c */
+void check_sec_ref(struct module *mod, const char *modname,
+		   struct elf_info *elf);
+
 /* file2alias.c */
 void handle_moddevtable(struct module *mod, struct elf_info *info,
 			Elf_Sym *sym, const char *symname);
@@ -182,6 +165,13 @@ void add_moddevtable(struct buffer *buf, struct module *mod);
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
 /* from modpost.c */
+extern int sec_mismatch_count;
+
+void *sym_get_data_by_offset(const struct elf_info *info,
+			     unsigned int secindex, unsigned long offset);
+const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr);
+const char *sec_name(const struct elf_info *info, int secindex);
+
 char *read_text_file(const char *filename);
 char *get_line(char **stringp);
 
diff --git a/scripts/mod/section-check.c b/scripts/mod/section-check.c
new file mode 100644
index 000000000000..c7467fe9af74
--- /dev/null
+++ b/scripts/mod/section-check.c
@@ -0,0 +1,1222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2006-2008  Sam Ravnborg
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "modpost.h"
+
+/* The 64-bit MIPS ELF ABI uses an unusual reloc format. */
+typedef struct
+{
+	Elf32_Word    r_sym;	/* Symbol index */
+	unsigned char r_ssym;	/* Special symbol for 2nd relocation */
+	unsigned char r_type3;	/* 3rd relocation type */
+	unsigned char r_type2;	/* 2nd relocation type */
+	unsigned char r_type1;	/* 1st relocation type */
+} _Elf64_Mips_R_Info;
+
+typedef union
+{
+	Elf64_Xword		r_info_number;
+	_Elf64_Mips_R_Info	r_info_fields;
+} _Elf64_Mips_R_Info_union;
+
+#define ELF64_MIPS_R_SYM(i) \
+  ((__extension__ (_Elf64_Mips_R_Info_union)(i)).r_info_fields.r_sym)
+
+#define ELF64_MIPS_R_TYPE(i) \
+  ((__extension__ (_Elf64_Mips_R_Info_union)(i)).r_info_fields.r_type1)
+
+/**
+ * Test if string s ends in string sub
+ * return 0 if match
+ **/
+static int strrcmp(const char *s, const char *sub)
+{
+	int slen, sublen;
+
+	if (!s || !sub)
+		return 1;
+
+	slen = strlen(s);
+	sublen = strlen(sub);
+
+	if ((slen == 0) || (sublen == 0))
+		return 1;
+
+	if (sublen > slen)
+		return 1;
+
+	return memcmp(s + slen - sublen, sub, sublen);
+}
+
+static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
+{
+	if (sym)
+		return elf->strtab + sym->st_name;
+	else
+		return "(unknown)";
+}
+
+/* The pattern is an array of simple patterns.
+ * "foo" will match an exact string equal to "foo"
+ * "*foo" will match a string that ends with "foo"
+ * "foo*" will match a string that begins with "foo"
+ * "*foo*" will match a string that contains "foo"
+ */
+static int match(const char *sym, const char * const pat[])
+{
+	const char *p;
+	while (*pat) {
+		const char *endp;
+
+		p = *pat++;
+		endp = p + strlen(p) - 1;
+
+		/* "*foo*" */
+		if (*p == '*' && *endp == '*') {
+			char *bare = NOFAIL(strndup(p + 1, strlen(p) - 2));
+			char *here = strstr(sym, bare);
+
+			free(bare);
+			if (here != NULL)
+				return 1;
+		}
+		/* "*foo" */
+		else if (*p == '*') {
+			if (strrcmp(sym, p + 1) == 0)
+				return 1;
+		}
+		/* "foo*" */
+		else if (*endp == '*') {
+			if (strncmp(sym, p, strlen(p) - 1) == 0)
+				return 1;
+		}
+		/* no wildcards */
+		else {
+			if (strcmp(p, sym) == 0)
+				return 1;
+		}
+	}
+	/* no match */
+	return 0;
+}
+
+/* sections that we do not want to do full section mismatch check on */
+static const char *const section_white_list[] =
+{
+	".comment*",
+	".debug*",
+	".cranges",		/* sh64 */
+	".zdebug*",		/* Compressed debug sections. */
+	".GCC.command.line",	/* record-gcc-switches */
+	".mdebug*",        /* alpha, score, mips etc. */
+	".pdr",            /* alpha, score, mips etc. */
+	".stab*",
+	".note*",
+	".got*",
+	".toc*",
+	".xt.prop",				 /* xtensa */
+	".xt.lit",         /* xtensa */
+	".arcextmap*",			/* arc */
+	".gnu.linkonce.arcext*",	/* arc : modules */
+	".cmem*",			/* EZchip */
+	".fmt_slot*",			/* EZchip */
+	".gnu.lto*",
+	".discard.*",
+	NULL
+};
+
+/*
+ * This is used to find sections missing the SHF_ALLOC flag.
+ * The cause of this is often a section specified in assembler
+ * without "ax" / "aw".
+ */
+static void check_section(const char *modname, struct elf_info *elf,
+			  Elf_Shdr *sechdr)
+{
+	const char *sec = sech_name(elf, sechdr);
+
+	if (sechdr->sh_type == SHT_PROGBITS &&
+	    !(sechdr->sh_flags & SHF_ALLOC) &&
+	    !match(sec, section_white_list)) {
+		warn("%s (%s): unexpected non-allocatable section.\n"
+		     "Did you forget to use \"ax\"/\"aw\" in a .S file?\n"
+		     "Note that for example <linux/init.h> contains\n"
+		     "section definitions for use in .S files.\n\n",
+		     modname, sec);
+	}
+}
+
+
+
+#define ALL_INIT_DATA_SECTIONS \
+	".init.setup", ".init.rodata", ".meminit.rodata", \
+	".init.data", ".meminit.data"
+#define ALL_EXIT_DATA_SECTIONS \
+	".exit.data", ".memexit.data"
+
+#define ALL_INIT_TEXT_SECTIONS \
+	".init.text", ".meminit.text"
+#define ALL_EXIT_TEXT_SECTIONS \
+	".exit.text", ".memexit.text"
+
+#define ALL_PCI_INIT_SECTIONS	\
+	".pci_fixup_early", ".pci_fixup_header", ".pci_fixup_final", \
+	".pci_fixup_enable", ".pci_fixup_resume", \
+	".pci_fixup_resume_early", ".pci_fixup_suspend"
+
+#define ALL_XXXINIT_SECTIONS MEM_INIT_SECTIONS
+#define ALL_XXXEXIT_SECTIONS MEM_EXIT_SECTIONS
+
+#define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
+#define ALL_EXIT_SECTIONS EXIT_SECTIONS, ALL_XXXEXIT_SECTIONS
+
+#define DATA_SECTIONS ".data", ".data.rel"
+#define TEXT_SECTIONS ".text", ".text.unlikely", ".sched.text", \
+		".kprobes.text", ".cpuidle.text", ".noinstr.text"
+#define OTHER_TEXT_SECTIONS ".ref.text", ".head.text", ".spinlock.text", \
+		".fixup", ".entry.text", ".exception.text", ".text.*", \
+		".coldtext", ".softirqentry.text"
+
+#define INIT_SECTIONS      ".init.*"
+#define MEM_INIT_SECTIONS  ".meminit.*"
+
+#define EXIT_SECTIONS      ".exit.*"
+#define MEM_EXIT_SECTIONS  ".memexit.*"
+
+#define ALL_TEXT_SECTIONS  ALL_INIT_TEXT_SECTIONS, ALL_EXIT_TEXT_SECTIONS, \
+		TEXT_SECTIONS, OTHER_TEXT_SECTIONS
+
+/* init data sections */
+static const char *const init_data_sections[] =
+	{ ALL_INIT_DATA_SECTIONS, NULL };
+
+/* all init sections */
+static const char *const init_sections[] = { ALL_INIT_SECTIONS, NULL };
+
+/* All init and exit sections (code + data) */
+static const char *const init_exit_sections[] =
+	{ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS, NULL };
+
+/* all text sections */
+static const char *const text_sections[] = { ALL_TEXT_SECTIONS, NULL };
+
+/* data section */
+static const char *const data_sections[] = { DATA_SECTIONS, NULL };
+
+
+/* symbols in .data that may refer to init/exit sections */
+#define DEFAULT_SYMBOL_WHITE_LIST					\
+	"*driver",							\
+	"*_template", /* scsi uses *_template a lot */			\
+	"*_timer",    /* arm uses ops structures named _timer a lot */	\
+	"*_sht",      /* scsi also used *_sht to some extent */		\
+	"*_ops",							\
+	"*_probe",							\
+	"*_probe_one",							\
+	"*_console"
+
+static const char *const head_sections[] = { ".head.text*", NULL };
+static const char *const linker_symbols[] =
+	{ "__init_begin", "_sinittext", "_einittext", NULL };
+static const char *const optim_symbols[] = { "*.constprop.*", NULL };
+
+enum mismatch {
+	TEXT_TO_ANY_INIT,
+	DATA_TO_ANY_INIT,
+	TEXT_TO_ANY_EXIT,
+	DATA_TO_ANY_EXIT,
+	XXXINIT_TO_SOME_INIT,
+	XXXEXIT_TO_SOME_EXIT,
+	ANY_INIT_TO_ANY_EXIT,
+	ANY_EXIT_TO_ANY_INIT,
+	EXPORT_TO_INIT_EXIT,
+	EXTABLE_TO_NON_TEXT,
+};
+
+/**
+ * Describe how to match sections on different criteria:
+ *
+ * @fromsec: Array of sections to be matched.
+ *
+ * @bad_tosec: Relocations applied to a section in @fromsec to a section in
+ * this array is forbidden (black-list).  Can be empty.
+ *
+ * @good_tosec: Relocations applied to a section in @fromsec must be
+ * targeting sections in this array (white-list).  Can be empty.
+ *
+ * @mismatch: Type of mismatch.
+ *
+ * @symbol_white_list: Do not match a relocation to a symbol in this list
+ * even if it is targeting a section in @bad_to_sec.
+ *
+ * @handler: Specific handler to call when a match is found.  If NULL,
+ * default_mismatch_handler() will be called.
+ *
+ */
+struct sectioncheck {
+	const char *fromsec[20];
+	const char *bad_tosec[20];
+	const char *good_tosec[20];
+	enum mismatch mismatch;
+	const char *symbol_white_list[20];
+	void (*handler)(const char *modname, struct elf_info *elf,
+			const struct sectioncheck* const mismatch,
+			Elf_Rela *r, Elf_Sym *sym, const char *fromsec);
+
+};
+
+static void extable_mismatch_handler(const char *modname, struct elf_info *elf,
+				     const struct sectioncheck* const mismatch,
+				     Elf_Rela *r, Elf_Sym *sym,
+				     const char *fromsec);
+
+static const struct sectioncheck sectioncheck[] = {
+/* Do not reference init/exit code/data from
+ * normal code and data
+ */
+{
+	.fromsec = { TEXT_SECTIONS, NULL },
+	.bad_tosec = { ALL_INIT_SECTIONS, NULL },
+	.mismatch = TEXT_TO_ANY_INIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+{
+	.fromsec = { DATA_SECTIONS, NULL },
+	.bad_tosec = { ALL_XXXINIT_SECTIONS, NULL },
+	.mismatch = DATA_TO_ANY_INIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+{
+	.fromsec = { DATA_SECTIONS, NULL },
+	.bad_tosec = { INIT_SECTIONS, NULL },
+	.mismatch = DATA_TO_ANY_INIT,
+	.symbol_white_list = {
+		"*_template", "*_timer", "*_sht", "*_ops",
+		"*_probe", "*_probe_one", "*_console", NULL
+	},
+},
+{
+	.fromsec = { TEXT_SECTIONS, NULL },
+	.bad_tosec = { ALL_EXIT_SECTIONS, NULL },
+	.mismatch = TEXT_TO_ANY_EXIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+{
+	.fromsec = { DATA_SECTIONS, NULL },
+	.bad_tosec = { ALL_EXIT_SECTIONS, NULL },
+	.mismatch = DATA_TO_ANY_EXIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+/* Do not reference init code/data from meminit code/data */
+{
+	.fromsec = { ALL_XXXINIT_SECTIONS, NULL },
+	.bad_tosec = { INIT_SECTIONS, NULL },
+	.mismatch = XXXINIT_TO_SOME_INIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+/* Do not reference exit code/data from memexit code/data */
+{
+	.fromsec = { ALL_XXXEXIT_SECTIONS, NULL },
+	.bad_tosec = { EXIT_SECTIONS, NULL },
+	.mismatch = XXXEXIT_TO_SOME_EXIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+/* Do not use exit code/data from init code */
+{
+	.fromsec = { ALL_INIT_SECTIONS, NULL },
+	.bad_tosec = { ALL_EXIT_SECTIONS, NULL },
+	.mismatch = ANY_INIT_TO_ANY_EXIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+/* Do not use init code/data from exit code */
+{
+	.fromsec = { ALL_EXIT_SECTIONS, NULL },
+	.bad_tosec = { ALL_INIT_SECTIONS, NULL },
+	.mismatch = ANY_EXIT_TO_ANY_INIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+{
+	.fromsec = { ALL_PCI_INIT_SECTIONS, NULL },
+	.bad_tosec = { INIT_SECTIONS, NULL },
+	.mismatch = ANY_INIT_TO_ANY_EXIT,
+	.symbol_white_list = { NULL },
+},
+/* Do not export init/exit functions or data */
+{
+	.fromsec = { "__ksymtab*", NULL },
+	.bad_tosec = { INIT_SECTIONS, EXIT_SECTIONS, NULL },
+	.mismatch = EXPORT_TO_INIT_EXIT,
+	.symbol_white_list = { DEFAULT_SYMBOL_WHITE_LIST, NULL },
+},
+{
+	.fromsec = { "__ex_table", NULL },
+	/* If you're adding any new black-listed sections in here, consider
+	 * adding a special 'printer' for them in scripts/check_extable.
+	 */
+	.bad_tosec = { ".altinstr_replacement", NULL },
+	.good_tosec = {ALL_TEXT_SECTIONS , NULL},
+	.mismatch = EXTABLE_TO_NON_TEXT,
+	.handler = extable_mismatch_handler,
+}
+};
+
+static const struct sectioncheck *section_mismatch(
+		const char *fromsec, const char *tosec)
+{
+	int i;
+	int elems = sizeof(sectioncheck) / sizeof(struct sectioncheck);
+	const struct sectioncheck *check = &sectioncheck[0];
+
+	/*
+	 * The target section could be the SHT_NUL section when we're
+	 * handling relocations to un-resolved symbols, trying to match it
+	 * doesn't make much sense and causes build failures on parisc
+	 * architectures.
+	 */
+	if (*tosec == '\0')
+		return NULL;
+
+	for (i = 0; i < elems; i++) {
+		if (match(fromsec, check->fromsec)) {
+			if (check->bad_tosec[0] && match(tosec, check->bad_tosec))
+				return check;
+			if (check->good_tosec[0] && !match(tosec, check->good_tosec))
+				return check;
+		}
+		check++;
+	}
+	return NULL;
+}
+
+/**
+ * Whitelist to allow certain references to pass with no warning.
+ *
+ * Pattern 1:
+ *   If a module parameter is declared __initdata and permissions=0
+ *   then this is legal despite the warning generated.
+ *   We cannot see value of permissions here, so just ignore
+ *   this pattern.
+ *   The pattern is identified by:
+ *   tosec   = .init.data
+ *   fromsec = .data*
+ *   atsym   =__param*
+ *
+ * Pattern 1a:
+ *   module_param_call() ops can refer to __init set function if permissions=0
+ *   The pattern is identified by:
+ *   tosec   = .init.text
+ *   fromsec = .data*
+ *   atsym   = __param_ops_*
+ *
+ * Pattern 2:
+ *   Many drivers utilise a *driver container with references to
+ *   add, remove, probe functions etc.
+ *   the pattern is identified by:
+ *   tosec   = init or exit section
+ *   fromsec = data section
+ *   atsym = *driver, *_template, *_sht, *_ops, *_probe,
+ *           *probe_one, *_console, *_timer
+ *
+ * Pattern 3:
+ *   Whitelist all references from .head.text to any init section
+ *
+ * Pattern 4:
+ *   Some symbols belong to init section but still it is ok to reference
+ *   these from non-init sections as these symbols don't have any memory
+ *   allocated for them and symbol address and value are same. So even
+ *   if init section is freed, its ok to reference those symbols.
+ *   For ex. symbols marking the init section boundaries.
+ *   This pattern is identified by
+ *   refsymname = __init_begin, _sinittext, _einittext
+ *
+ * Pattern 5:
+ *   GCC may optimize static inlines when fed constant arg(s) resulting
+ *   in functions like cpumask_empty() -- generating an associated symbol
+ *   cpumask_empty.constprop.3 that appears in the audit.  If the const that
+ *   is passed in comes from __init, like say nmi_ipi_mask, we get a
+ *   meaningless section warning.  May need to add isra symbols too...
+ *   This pattern is identified by
+ *   tosec   = init section
+ *   fromsec = text section
+ *   refsymname = *.constprop.*
+ *
+ * Pattern 6:
+ *   Hide section mismatch warnings for ELF local symbols.  The goal
+ *   is to eliminate false positive modpost warnings caused by
+ *   compiler-generated ELF local symbol names such as ".LANCHOR1".
+ *   Autogenerated symbol names bypass modpost's "Pattern 2"
+ *   whitelisting, which relies on pattern-matching against symbol
+ *   names to work.  (One situation where gcc can autogenerate ELF
+ *   local symbols is when "-fsection-anchors" is used.)
+ **/
+static int secref_whitelist(const struct sectioncheck *mismatch,
+			    const char *fromsec, const char *fromsym,
+			    const char *tosec, const char *tosym)
+{
+	/* Check for pattern 1 */
+	if (match(tosec, init_data_sections) &&
+	    match(fromsec, data_sections) &&
+	    strstarts(fromsym, "__param"))
+		return 0;
+
+	/* Check for pattern 1a */
+	if (strcmp(tosec, ".init.text") == 0 &&
+	    match(fromsec, data_sections) &&
+	    strstarts(fromsym, "__param_ops_"))
+		return 0;
+
+	/* Check for pattern 2 */
+	if (match(tosec, init_exit_sections) &&
+	    match(fromsec, data_sections) &&
+	    match(fromsym, mismatch->symbol_white_list))
+		return 0;
+
+	/* Check for pattern 3 */
+	if (match(fromsec, head_sections) &&
+	    match(tosec, init_sections))
+		return 0;
+
+	/* Check for pattern 4 */
+	if (match(tosym, linker_symbols))
+		return 0;
+
+	/* Check for pattern 5 */
+	if (match(fromsec, text_sections) &&
+	    match(tosec, init_sections) &&
+	    match(fromsym, optim_symbols))
+		return 0;
+
+	/* Check for pattern 6 */
+	if (strstarts(fromsym, ".L"))
+		return 0;
+
+	return 1;
+}
+
+static inline int is_arm_mapping_symbol(const char *str)
+{
+	return str[0] == '$' && strchr("axtd", str[1])
+	       && (str[2] == '\0' || str[2] == '.');
+}
+
+/*
+ * If there's no name there, ignore it; likewise, ignore it if it's
+ * one of the magic symbols emitted used by current ARM tools.
+ *
+ * Otherwise if find_symbols_between() returns those symbols, they'll
+ * fail the whitelist tests and cause lots of false alarms ... fixable
+ * only by merging __exit and __init sections into __text, bloating
+ * the kernel (which is especially evil on embedded platforms).
+ */
+static inline int is_valid_name(struct elf_info *elf, Elf_Sym *sym)
+{
+	const char *name = elf->strtab + sym->st_name;
+
+	if (!name || !strlen(name))
+		return 0;
+	return !is_arm_mapping_symbol(name);
+}
+
+/**
+ * Find symbol based on relocation record info.
+ * In some cases the symbol supplied is a valid symbol so
+ * return refsym. If st_name != 0 we assume this is a valid symbol.
+ * In other cases the symbol needs to be looked up in the symbol table
+ * based on section and address.
+ *  **/
+static Elf_Sym *find_elf_symbol(struct elf_info *elf, Elf64_Sword addr,
+				Elf_Sym *relsym)
+{
+	Elf_Sym *sym;
+	Elf_Sym *near = NULL;
+	Elf64_Sword distance = 20;
+	Elf64_Sword d;
+	unsigned int relsym_secindex;
+
+	if (relsym->st_name != 0)
+		return relsym;
+
+	relsym_secindex = get_secindex(elf, relsym);
+	for (sym = elf->symtab_start; sym < elf->symtab_stop; sym++) {
+		if (get_secindex(elf, sym) != relsym_secindex)
+			continue;
+		if (ELF_ST_TYPE(sym->st_info) == STT_SECTION)
+			continue;
+		if (!is_valid_name(elf, sym))
+			continue;
+		if (sym->st_value == addr)
+			return sym;
+		/* Find a symbol nearby - addr are maybe negative */
+		d = sym->st_value - addr;
+		if (d < 0)
+			d = addr - sym->st_value;
+		if (d < distance) {
+			distance = d;
+			near = sym;
+		}
+	}
+	/* We need a close match */
+	if (distance < 20)
+		return near;
+	else
+		return NULL;
+}
+
+/*
+ * Find symbols before or equal addr and after addr - in the section sec.
+ * If we find two symbols with equal offset prefer one with a valid name.
+ * The ELF format may have a better way to detect what type of symbol
+ * it is, but this works for now.
+ **/
+static Elf_Sym *find_elf_symbol2(struct elf_info *elf, Elf_Addr addr,
+				 const char *sec)
+{
+	Elf_Sym *sym;
+	Elf_Sym *near = NULL;
+	Elf_Addr distance = ~0;
+
+	for (sym = elf->symtab_start; sym < elf->symtab_stop; sym++) {
+		const char *symsec;
+
+		if (is_shndx_special(sym->st_shndx))
+			continue;
+		symsec = sec_name(elf, get_secindex(elf, sym));
+		if (strcmp(symsec, sec) != 0)
+			continue;
+		if (!is_valid_name(elf, sym))
+			continue;
+		if (sym->st_value <= addr) {
+			if ((addr - sym->st_value) < distance) {
+				distance = addr - sym->st_value;
+				near = sym;
+			} else if ((addr - sym->st_value) == distance) {
+				near = sym;
+			}
+		}
+	}
+	return near;
+}
+
+/*
+ * Convert a section name to the function/data attribute
+ * .init.text => __init
+ * .memexitconst => __memconst
+ * etc.
+ *
+ * The memory of returned value has been allocated on a heap. The user of this
+ * method should free it after usage.
+*/
+static char *sec2annotation(const char *s)
+{
+	if (match(s, init_exit_sections)) {
+		char *p = NOFAIL(malloc(20));
+		char *r = p;
+
+		*p++ = '_';
+		*p++ = '_';
+		if (*s == '.')
+			s++;
+		while (*s && *s != '.')
+			*p++ = *s++;
+		*p = '\0';
+		if (*s == '.')
+			s++;
+		if (strstr(s, "rodata") != NULL)
+			strcat(p, "const ");
+		else if (strstr(s, "data") != NULL)
+			strcat(p, "data ");
+		else
+			strcat(p, " ");
+		return r;
+	} else {
+		return NOFAIL(strdup(""));
+	}
+}
+
+static int is_function(Elf_Sym *sym)
+{
+	if (sym)
+		return ELF_ST_TYPE(sym->st_info) == STT_FUNC;
+	else
+		return -1;
+}
+
+static void print_section_list(const char * const list[20])
+{
+	const char *const *s = list;
+
+	while (*s) {
+		fprintf(stderr, "%s", *s);
+		s++;
+		if (*s)
+			fprintf(stderr, ", ");
+	}
+	fprintf(stderr, "\n");
+}
+
+static inline void get_pretty_name(int is_func, const char** name, const char** name_p)
+{
+	switch (is_func) {
+	case 0:	*name = "variable"; *name_p = ""; break;
+	case 1:	*name = "function"; *name_p = "()"; break;
+	default: *name = "(unknown reference)"; *name_p = ""; break;
+	}
+}
+
+/*
+ * Print a warning about a section mismatch.
+ * Try to find symbols near it so user can find it.
+ * Check whitelist before warning - it may be a false positive.
+ */
+static void report_sec_mismatch(const char *modname,
+				const struct sectioncheck *mismatch,
+				const char *fromsec,
+				unsigned long long fromaddr,
+				const char *fromsym,
+				int from_is_func,
+				const char *tosec, const char *tosym,
+				int to_is_func)
+{
+	const char *from, *from_p;
+	const char *to, *to_p;
+	char *prl_from;
+	char *prl_to;
+
+	sec_mismatch_count++;
+
+	get_pretty_name(from_is_func, &from, &from_p);
+	get_pretty_name(to_is_func, &to, &to_p);
+
+	warn("%s(%s+0x%llx): Section mismatch in reference from the %s %s%s "
+	     "to the %s %s:%s%s\n",
+	     modname, fromsec, fromaddr, from, fromsym, from_p, to, tosec,
+	     tosym, to_p);
+
+	switch (mismatch->mismatch) {
+	case TEXT_TO_ANY_INIT:
+		prl_from = sec2annotation(fromsec);
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The function %s%s() references\n"
+		"the %s %s%s%s.\n"
+		"This is often because %s lacks a %s\n"
+		"annotation or the annotation of %s is wrong.\n",
+		prl_from, fromsym,
+		to, prl_to, tosym, to_p,
+		fromsym, prl_to, tosym);
+		free(prl_from);
+		free(prl_to);
+		break;
+	case DATA_TO_ANY_INIT: {
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The variable %s references\n"
+		"the %s %s%s%s\n"
+		"If the reference is valid then annotate the\n"
+		"variable with __init* or __refdata (see linux/init.h) "
+		"or name the variable:\n",
+		fromsym, to, prl_to, tosym, to_p);
+		print_section_list(mismatch->symbol_white_list);
+		free(prl_to);
+		break;
+	}
+	case TEXT_TO_ANY_EXIT:
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The function %s() references a %s in an exit section.\n"
+		"Often the %s %s%s has valid usage outside the exit section\n"
+		"and the fix is to remove the %sannotation of %s.\n",
+		fromsym, to, to, tosym, to_p, prl_to, tosym);
+		free(prl_to);
+		break;
+	case DATA_TO_ANY_EXIT: {
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The variable %s references\n"
+		"the %s %s%s%s\n"
+		"If the reference is valid then annotate the\n"
+		"variable with __exit* (see linux/init.h) or "
+		"name the variable:\n",
+		fromsym, to, prl_to, tosym, to_p);
+		print_section_list(mismatch->symbol_white_list);
+		free(prl_to);
+		break;
+	}
+	case XXXINIT_TO_SOME_INIT:
+	case XXXEXIT_TO_SOME_EXIT:
+		prl_from = sec2annotation(fromsec);
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The %s %s%s%s references\n"
+		"a %s %s%s%s.\n"
+		"If %s is only used by %s then\n"
+		"annotate %s with a matching annotation.\n",
+		from, prl_from, fromsym, from_p,
+		to, prl_to, tosym, to_p,
+		tosym, fromsym, tosym);
+		free(prl_from);
+		free(prl_to);
+		break;
+	case ANY_INIT_TO_ANY_EXIT:
+		prl_from = sec2annotation(fromsec);
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The %s %s%s%s references\n"
+		"a %s %s%s%s.\n"
+		"This is often seen when error handling "
+		"in the init function\n"
+		"uses functionality in the exit path.\n"
+		"The fix is often to remove the %sannotation of\n"
+		"%s%s so it may be used outside an exit section.\n",
+		from, prl_from, fromsym, from_p,
+		to, prl_to, tosym, to_p,
+		prl_to, tosym, to_p);
+		free(prl_from);
+		free(prl_to);
+		break;
+	case ANY_EXIT_TO_ANY_INIT:
+		prl_from = sec2annotation(fromsec);
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The %s %s%s%s references\n"
+		"a %s %s%s%s.\n"
+		"This is often seen when error handling "
+		"in the exit function\n"
+		"uses functionality in the init path.\n"
+		"The fix is often to remove the %sannotation of\n"
+		"%s%s so it may be used outside an init section.\n",
+		from, prl_from, fromsym, from_p,
+		to, prl_to, tosym, to_p,
+		prl_to, tosym, to_p);
+		free(prl_from);
+		free(prl_to);
+		break;
+	case EXPORT_TO_INIT_EXIT:
+		prl_to = sec2annotation(tosec);
+		fprintf(stderr,
+		"The symbol %s is exported and annotated %s\n"
+		"Fix this by removing the %sannotation of %s "
+		"or drop the export.\n",
+		tosym, prl_to, prl_to, tosym);
+		free(prl_to);
+		break;
+	case EXTABLE_TO_NON_TEXT:
+		fatal("There's a special handler for this mismatch type, "
+		      "we should never get here.");
+		break;
+	}
+	fprintf(stderr, "\n");
+}
+
+static void default_mismatch_handler(const char *modname, struct elf_info *elf,
+				     const struct sectioncheck* const mismatch,
+				     Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
+{
+	const char *tosec;
+	Elf_Sym *to;
+	Elf_Sym *from;
+	const char *tosym;
+	const char *fromsym;
+
+	from = find_elf_symbol2(elf, r->r_offset, fromsec);
+	fromsym = sym_name(elf, from);
+
+	if (strstarts(fromsym, "reference___initcall"))
+		return;
+
+	tosec = sec_name(elf, get_secindex(elf, sym));
+	to = find_elf_symbol(elf, r->r_addend, sym);
+	tosym = sym_name(elf, to);
+
+	/* check whitelist - we may ignore it */
+	if (secref_whitelist(mismatch,
+			     fromsec, fromsym, tosec, tosym)) {
+		report_sec_mismatch(modname, mismatch,
+				    fromsec, r->r_offset, fromsym,
+				    is_function(from), tosec, tosym,
+				    is_function(to));
+	}
+}
+
+static int is_executable_section(struct elf_info* elf, unsigned int section_index)
+{
+	if (section_index > elf->num_sections)
+		fatal("section_index is outside elf->num_sections!\n");
+
+	return ((elf->sechdrs[section_index].sh_flags & SHF_EXECINSTR) == SHF_EXECINSTR);
+}
+
+/*
+ * We rely on a gross hack in section_rel[a]() calling find_extable_entry_size()
+ * to know the sizeof(struct exception_table_entry) for the target architecture.
+ */
+static unsigned int extable_entry_size = 0;
+static void find_extable_entry_size(const char* const sec, const Elf_Rela* r)
+{
+	/*
+	 * If we're currently checking the second relocation within __ex_table,
+	 * that relocation offset tells us the offsetof(struct
+	 * exception_table_entry, fixup) which is equal to sizeof(struct
+	 * exception_table_entry) divided by two.  We use that to our advantage
+	 * since there's no portable way to get that size as every architecture
+	 * seems to go with different sized types.  Not pretty but better than
+	 * hard-coding the size for every architecture..
+	 */
+	if (!extable_entry_size)
+		extable_entry_size = r->r_offset * 2;
+}
+
+static inline bool is_extable_fault_address(Elf_Rela *r)
+{
+	/*
+	 * extable_entry_size is only discovered after we've handled the
+	 * _second_ relocation in __ex_table, so only abort when we're not
+	 * handling the first reloc and extable_entry_size is zero.
+	 */
+	if (r->r_offset && extable_entry_size == 0)
+		fatal("extable_entry size hasn't been discovered!\n");
+
+	return ((r->r_offset == 0) ||
+		(r->r_offset % extable_entry_size == 0));
+}
+
+#define is_second_extable_reloc(Start, Cur, Sec)			\
+	(((Cur) == (Start) + 1) && (strcmp("__ex_table", (Sec)) == 0))
+
+static void report_extable_warnings(const char* modname, struct elf_info* elf,
+				    const struct sectioncheck* const mismatch,
+				    Elf_Rela* r, Elf_Sym* sym,
+				    const char* fromsec, const char* tosec)
+{
+	Elf_Sym* fromsym = find_elf_symbol2(elf, r->r_offset, fromsec);
+	const char* fromsym_name = sym_name(elf, fromsym);
+	Elf_Sym* tosym = find_elf_symbol(elf, r->r_addend, sym);
+	const char* tosym_name = sym_name(elf, tosym);
+	const char* from_pretty_name;
+	const char* from_pretty_name_p;
+	const char* to_pretty_name;
+	const char* to_pretty_name_p;
+
+	get_pretty_name(is_function(fromsym),
+			&from_pretty_name, &from_pretty_name_p);
+	get_pretty_name(is_function(tosym),
+			&to_pretty_name, &to_pretty_name_p);
+
+	warn("%s(%s+0x%lx): Section mismatch in reference"
+	     " from the %s %s%s to the %s %s:%s%s\n",
+	     modname, fromsec, (long)r->r_offset, from_pretty_name,
+	     fromsym_name, from_pretty_name_p,
+	     to_pretty_name, tosec, tosym_name, to_pretty_name_p);
+
+	if (!match(tosec, mismatch->bad_tosec) &&
+	    is_executable_section(elf, get_secindex(elf, sym)))
+		fprintf(stderr,
+			"The relocation at %s+0x%lx references\n"
+			"section \"%s\" which is not in the list of\n"
+			"authorized sections.  If you're adding a new section\n"
+			"and/or if this reference is valid, add \"%s\" to the\n"
+			"list of authorized sections to jump to on fault.\n"
+			"This can be achieved by adding \"%s\" to \n"
+			"OTHER_TEXT_SECTIONS in scripts/mod/modpost.c.\n",
+			fromsec, (long)r->r_offset, tosec, tosec, tosec);
+}
+
+static void extable_mismatch_handler(const char* modname, struct elf_info *elf,
+				     const struct sectioncheck* const mismatch,
+				     Elf_Rela* r, Elf_Sym* sym,
+				     const char *fromsec)
+{
+	const char* tosec = sec_name(elf, get_secindex(elf, sym));
+
+	sec_mismatch_count++;
+
+	report_extable_warnings(modname, elf, mismatch, r, sym, fromsec, tosec);
+
+	if (match(tosec, mismatch->bad_tosec))
+		fatal("The relocation at %s+0x%lx references\n"
+		      "section \"%s\" which is black-listed.\n"
+		      "Something is seriously wrong and should be fixed.\n"
+		      "You might get more information about where this is\n"
+		      "coming from by using scripts/check_extable.sh %s\n",
+		      fromsec, (long)r->r_offset, tosec, modname);
+	else if (!is_executable_section(elf, get_secindex(elf, sym))) {
+		if (is_extable_fault_address(r))
+			fatal("The relocation at %s+0x%lx references\n"
+			      "section \"%s\" which is not executable, IOW\n"
+			      "it is not possible for the kernel to fault\n"
+			      "at that address.  Something is seriously wrong\n"
+			      "and should be fixed.\n",
+			      fromsec, (long)r->r_offset, tosec);
+		else
+			fatal("The relocation at %s+0x%lx references\n"
+			      "section \"%s\" which is not executable, IOW\n"
+			      "the kernel will fault if it ever tries to\n"
+			      "jump to it.  Something is seriously wrong\n"
+			      "and should be fixed.\n",
+			      fromsec, (long)r->r_offset, tosec);
+	}
+}
+
+static void check_section_mismatch(const char *modname, struct elf_info *elf,
+				   Elf_Rela *r, Elf_Sym *sym, const char *fromsec)
+{
+	const char *tosec = sec_name(elf, get_secindex(elf, sym));
+	const struct sectioncheck *mismatch = section_mismatch(fromsec, tosec);
+
+	if (mismatch) {
+		if (mismatch->handler)
+			mismatch->handler(modname, elf,  mismatch,
+					  r, sym, fromsec);
+		else
+			default_mismatch_handler(modname, elf, mismatch,
+						 r, sym, fromsec);
+	}
+}
+
+static unsigned int *reloc_location(struct elf_info *elf,
+				    Elf_Shdr *sechdr, Elf_Rela *r)
+{
+	return sym_get_data_by_offset(elf, sechdr->sh_info, r->r_offset);
+}
+
+static int addend_386_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
+{
+	unsigned int r_typ = ELF_R_TYPE(r->r_info);
+	unsigned int *location = reloc_location(elf, sechdr, r);
+
+	switch (r_typ) {
+	case R_386_32:
+		r->r_addend = TO_NATIVE(*location);
+		break;
+	case R_386_PC32:
+		r->r_addend = TO_NATIVE(*location) + 4;
+		/* For CONFIG_RELOCATABLE=y */
+		if (elf->hdr->e_type == ET_EXEC)
+			r->r_addend += r->r_offset;
+		break;
+	}
+	return 0;
+}
+
+#ifndef R_ARM_CALL
+#define R_ARM_CALL	28
+#endif
+#ifndef R_ARM_JUMP24
+#define R_ARM_JUMP24	29
+#endif
+
+#ifndef	R_ARM_THM_CALL
+#define	R_ARM_THM_CALL		10
+#endif
+#ifndef	R_ARM_THM_JUMP24
+#define	R_ARM_THM_JUMP24	30
+#endif
+#ifndef	R_ARM_THM_JUMP19
+#define	R_ARM_THM_JUMP19	51
+#endif
+
+static int addend_arm_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
+{
+	unsigned int r_typ = ELF_R_TYPE(r->r_info);
+
+	switch (r_typ) {
+	case R_ARM_ABS32:
+		/* From ARM ABI: (S + A) | T */
+		r->r_addend = (int)(long)
+			      (elf->symtab_start + ELF_R_SYM(r->r_info));
+		break;
+	case R_ARM_PC24:
+	case R_ARM_CALL:
+	case R_ARM_JUMP24:
+	case R_ARM_THM_CALL:
+	case R_ARM_THM_JUMP24:
+	case R_ARM_THM_JUMP19:
+		/* From ARM ABI: ((S + A) | T) - P */
+		r->r_addend = (int)(long)(elf->hdr +
+			      sechdr->sh_offset +
+			      (r->r_offset - sechdr->sh_addr));
+		break;
+	default:
+		return 1;
+	}
+	return 0;
+}
+
+static int addend_mips_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Rela *r)
+{
+	unsigned int r_typ = ELF_R_TYPE(r->r_info);
+	unsigned int *location = reloc_location(elf, sechdr, r);
+	unsigned int inst;
+
+	if (r_typ == R_MIPS_HI16)
+		return 1;	/* skip this */
+	inst = TO_NATIVE(*location);
+	switch (r_typ) {
+	case R_MIPS_LO16:
+		r->r_addend = inst & 0xffff;
+		break;
+	case R_MIPS_26:
+		r->r_addend = (inst & 0x03ffffff) << 2;
+		break;
+	case R_MIPS_32:
+		r->r_addend = inst;
+		break;
+	}
+	return 0;
+}
+
+#ifndef EM_RISCV
+#define EM_RISCV		243
+#endif
+
+#ifndef R_RISCV_SUB32
+#define R_RISCV_SUB32		39
+#endif
+
+static void section_rela(const char *modname, struct elf_info *elf,
+			 Elf_Shdr *sechdr)
+{
+	Elf_Sym  *sym;
+	Elf_Rela *rela;
+	Elf_Rela r;
+	unsigned int r_sym;
+	const char *fromsec;
+
+	Elf_Rela *start = (void *)elf->hdr + sechdr->sh_offset;
+	Elf_Rela *stop  = (void *)start + sechdr->sh_size;
+
+	fromsec = sech_name(elf, sechdr);
+	fromsec += strlen(".rela");
+	/* if from section (name) is know good then skip it */
+	if (match(fromsec, section_white_list))
+		return;
+
+	for (rela = start; rela < stop; rela++) {
+		r.r_offset = TO_NATIVE(rela->r_offset);
+#if KERNEL_ELFCLASS == ELFCLASS64
+		if (elf->hdr->e_machine == EM_MIPS) {
+			unsigned int r_typ;
+			r_sym = ELF64_MIPS_R_SYM(rela->r_info);
+			r_sym = TO_NATIVE(r_sym);
+			r_typ = ELF64_MIPS_R_TYPE(rela->r_info);
+			r.r_info = ELF64_R_INFO(r_sym, r_typ);
+		} else {
+			r.r_info = TO_NATIVE(rela->r_info);
+			r_sym = ELF_R_SYM(r.r_info);
+		}
+#else
+		r.r_info = TO_NATIVE(rela->r_info);
+		r_sym = ELF_R_SYM(r.r_info);
+#endif
+		r.r_addend = TO_NATIVE(rela->r_addend);
+		switch (elf->hdr->e_machine) {
+		case EM_RISCV:
+			if (!strcmp("__ex_table", fromsec) &&
+			    ELF_R_TYPE(r.r_info) == R_RISCV_SUB32)
+				continue;
+			break;
+		}
+		sym = elf->symtab_start + r_sym;
+		/* Skip special sections */
+		if (is_shndx_special(sym->st_shndx))
+			continue;
+		if (is_second_extable_reloc(start, rela, fromsec))
+			find_extable_entry_size(fromsec, &r);
+		check_section_mismatch(modname, elf, &r, sym, fromsec);
+	}
+}
+
+static void section_rel(const char *modname, struct elf_info *elf,
+			Elf_Shdr *sechdr)
+{
+	Elf_Sym *sym;
+	Elf_Rel *rel;
+	Elf_Rela r;
+	unsigned int r_sym;
+	const char *fromsec;
+
+	Elf_Rel *start = (void *)elf->hdr + sechdr->sh_offset;
+	Elf_Rel *stop  = (void *)start + sechdr->sh_size;
+
+	fromsec = sech_name(elf, sechdr);
+	fromsec += strlen(".rel");
+	/* if from section (name) is know good then skip it */
+	if (match(fromsec, section_white_list))
+		return;
+
+	for (rel = start; rel < stop; rel++) {
+		r.r_offset = TO_NATIVE(rel->r_offset);
+#if KERNEL_ELFCLASS == ELFCLASS64
+		if (elf->hdr->e_machine == EM_MIPS) {
+			unsigned int r_typ;
+			r_sym = ELF64_MIPS_R_SYM(rel->r_info);
+			r_sym = TO_NATIVE(r_sym);
+			r_typ = ELF64_MIPS_R_TYPE(rel->r_info);
+			r.r_info = ELF64_R_INFO(r_sym, r_typ);
+		} else {
+			r.r_info = TO_NATIVE(rel->r_info);
+			r_sym = ELF_R_SYM(r.r_info);
+		}
+#else
+		r.r_info = TO_NATIVE(rel->r_info);
+		r_sym = ELF_R_SYM(r.r_info);
+#endif
+		r.r_addend = 0;
+		switch (elf->hdr->e_machine) {
+		case EM_386:
+			if (addend_386_rel(elf, sechdr, &r))
+				continue;
+			break;
+		case EM_ARM:
+			if (addend_arm_rel(elf, sechdr, &r))
+				continue;
+			break;
+		case EM_MIPS:
+			if (addend_mips_rel(elf, sechdr, &r))
+				continue;
+			break;
+		}
+		sym = elf->symtab_start + r_sym;
+		/* Skip special sections */
+		if (is_shndx_special(sym->st_shndx))
+			continue;
+		if (is_second_extable_reloc(start, rel, fromsec))
+			find_extable_entry_size(fromsec, &r);
+		check_section_mismatch(modname, elf, &r, sym, fromsec);
+	}
+}
+
+/**
+ * A module includes a number of sections that are discarded
+ * either when loaded or when used as built-in.
+ * For loaded modules all functions marked __init and all data
+ * marked __initdata will be discarded when the module has been initialized.
+ * Likewise for modules used built-in the sections marked __exit
+ * are discarded because __exit marked function are supposed to be called
+ * only when a module is unloaded which never happens for built-in modules.
+ * The check_sec_ref() function traverses all relocation records
+ * to find all references to a section that reference a section that will
+ * be discarded and warns about it.
+ **/
+void check_sec_ref(struct module *mod, const char *modname,
+		   struct elf_info *elf)
+{
+	int i;
+	Elf_Shdr *sechdrs = elf->sechdrs;
+
+	/* Walk through all sections */
+	for (i = 0; i < elf->num_sections; i++) {
+		check_section(modname, elf, &elf->sechdrs[i]);
+		/* We want to process only relocation sections and not .init */
+		if (sechdrs[i].sh_type == SHT_RELA)
+			section_rela(modname, elf, &elf->sechdrs[i]);
+		else if (sechdrs[i].sh_type == SHT_REL)
+			section_rel(modname, elf, &elf->sechdrs[i]);
+	}
+}
-- 
2.32.0

