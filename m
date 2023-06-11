Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD5D72B29C
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Jun 2023 17:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbjFKPvs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Jun 2023 11:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbjFKPvj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Jun 2023 11:51:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B311FDE;
        Sun, 11 Jun 2023 08:51:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96AA36111F;
        Sun, 11 Jun 2023 15:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A4EAC433D2;
        Sun, 11 Jun 2023 15:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686498684;
        bh=D4JclwTFZVJVLf/AoE8VN2KqLbenqZTh9SX+WpELnNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LF50eClSmYSjbYOay+l9rEGdbjX1NILuaYh0QKA3QNnZUv02uHyAaOS7OE2fLg0ZN
         MRJcHCPeHQRQZ0E15XftRjkmeH8j84f/eJctCbJBk6xvifyU7eAGA1RgBB0HUiRjiS
         NuIXhTz87PHD8MRT8iNtGrh0MwXHrt81uxMypjbrZA0F2Kwre8sGSUE9hiV3g9E/Os
         wmtQGeA2hh6rw1MTQMyIfJjlXkuEnORey88oq4x53e8Qj+HmtmDbtMpBEU5f91MFVf
         eC4A/7p0Hj5VNAYMH5c3HYEYianKCjl7T4kqO4Vvf9rN+PUCDTgJHJL+yjDjj+JwvE
         7SyeRUwUhBspw==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-snps-arc@lists.infradead.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v9 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
Date:   Mon, 12 Jun 2023 00:50:57 +0900
Message-Id: <20230611155100.2553804-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230611155100.2553804-1-masahiroy@kernel.org>
References: <20230611155100.2553804-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CONFIG_TRIM_UNUSED_KSYMS is enabled, Kbuild recursively traverses
the directory tree to determine which EXPORT_SYMBOL to trim. If an
EXPORT_SYMBOL turns out to be unused by anyone, Kbuild begins the
second traverse, where some source files are recompiled with their
EXPORT_SYMBOL() tuned into a no-op.

Linus stated negative opinions about this slowness in commits:

 - 5cf0fd591f2e ("Kbuild: disable TRIM_UNUSED_KSYMS option")
 - a555bdd0c58c ("Kbuild: enable TRIM_UNUSED_KSYMS again, with some guarding")

We can do this better now. The final data structures of EXPORT_SYMBOL
are generated by the modpost stage, so modpost can selectively emit
KSYMTAB entries that are really used by modules.

Commit f73edc8951b2 ("kbuild: unify two modpost invocations") is another
ground-work to do this in a one-pass algorithm. With the list of modules,
modpost sets sym->used if it is used by a module. modpost emits KSYMTAB
only for symbols with sym->used==true.

BTW, Nicolas explained why the trimming was implemented with recursion:

  https://lore.kernel.org/all/2o2rpn97-79nq-p7s2-nq5-8p83391473r@syhkavp.arg/

Actually, we never achieved that level of optimization where the chain
reaction of trimming comes into play because:

 - CONFIG_LTO_CLANG cannot remove any unused symbols
 - CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is enabled only for vmlinux,
   but not modules

If deeper trimming is required, we need to revisit this, but I guess
that is unlikely to happen.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v9:
  - fix short options in getopt()
  - Do not dump trimmed symbols into Module.symvers

Changes in v7:
  - Remove *.usyms

Changes in v5:
  - Clean up more

 .gitignore                  |  2 -
 Makefile                    | 22 ++---------
 include/linux/export.h      | 67 +++++-----------------------------
 scripts/Makefile.build      | 15 +-------
 scripts/Makefile.modpost    |  7 ++++
 scripts/adjust_autoksyms.sh | 73 -------------------------------------
 scripts/basic/fixdep.c      |  3 +-
 scripts/gen_autoksyms.sh    | 62 -------------------------------
 scripts/gen_ksymdeps.sh     | 30 ---------------
 scripts/mod/modpost.c       | 57 ++++++++++++++++++++++++++---
 scripts/remove-stale-files  |  4 ++
 11 files changed, 78 insertions(+), 264 deletions(-)
 delete mode 100755 scripts/adjust_autoksyms.sh
 delete mode 100755 scripts/gen_autoksyms.sh
 delete mode 100755 scripts/gen_ksymdeps.sh

diff --git a/.gitignore b/.gitignore
index 7f86e0837909..c3ce78ca20d2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -51,7 +51,6 @@
 *.symversions
 *.tab.[ch]
 *.tar
-*.usyms
 *.xz
 *.zst
 Module.symvers
@@ -112,7 +111,6 @@ modules.order
 #
 /include/config/
 /include/generated/
-/include/ksym/
 /arch/*/include/generated/
 
 # stgit generated dirs
diff --git a/Makefile b/Makefile
index f836936fb4d8..cc3fe09c4dec 100644
--- a/Makefile
+++ b/Makefile
@@ -1193,28 +1193,12 @@ endif
 export KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
-# Recurse until adjust_autoksyms.sh is satisfied
-PHONY += autoksyms_recursive
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 # For the kernel to actually contain only the needed exported symbols,
 # we have to build modules as well to determine what those symbols are.
-# (this can be evaluated only once include/config/auto.conf has been included)
 KBUILD_MODULES := 1
-
-autoksyms_recursive: $(build-dir) modules.order
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
-	  "$(MAKE) -f $(srctree)/Makefile autoksyms_recursive"
 endif
 
-autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
-
-quiet_cmd_autoksyms_h = GEN     $@
-      cmd_autoksyms_h = mkdir -p $(dir $@); \
-			$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
-
-$(autoksyms_h):
-	$(call cmd,autoksyms_h)
-
 # '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
@@ -1223,7 +1207,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
 	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += vmlinux.a
-vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt autoksyms_recursive FORCE
+vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
 	$(call if_changed,ar_vmlinux.a)
 
 PHONY += vmlinux_o
@@ -1279,7 +1263,7 @@ scripts: scripts_basic scripts_dtc
 PHONY += prepare archprepare
 
 archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
-	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h \
+	asm-generic $(version_h) include/generated/utsrelease.h \
 	include/generated/compile.h include/generated/autoconf.h remove-stale-files
 
 prepare0: archprepare
@@ -2039,7 +2023,7 @@ clean: $(clean-dirs)
 		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
 		-o -name '*.dt.yaml' \
 		-o -name '*.dwo' -o -name '*.lst' \
-		-o -name '*.su' -o -name '*.mod' -o -name '*.usyms' \
+		-o -name '*.su' -o -name '*.mod' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name '*.asn1.[ch]' \
diff --git a/include/linux/export.h b/include/linux/export.h
index a01868136717..1de600734071 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -42,7 +42,7 @@ extern struct module __this_module;
 	.long sym
 #endif
 
-#define ____EXPORT_SYMBOL(sym, license, ns)		\
+#define ___EXPORT_SYMBOL(sym, license, ns)		\
 	.section ".export_symbol","a"		ASM_NL	\
 	__export_symbol_##sym:			ASM_NL	\
 		.asciz license			ASM_NL	\
@@ -50,24 +50,6 @@ extern struct module __this_module;
 		__EXPORT_SYMBOL_REF(sym)	ASM_NL	\
 	.previous
 
-#ifdef __GENKSYMS__
-
-#define ___EXPORT_SYMBOL(sym, sec, ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
-
-#elif defined(__ASSEMBLY__)
-
-#define ___EXPORT_SYMBOL(sym, license, ns) \
-	____EXPORT_SYMBOL(sym, license, ns)
-
-#else
-
-#define ___EXPORT_SYMBOL(sym, license, ns)			\
-	extern typeof(sym) sym;					\
-	__ADDRESSABLE(sym)					\
-	asm(__stringify(____EXPORT_SYMBOL(sym, license, ns)))
-
-#endif
-
 #if !defined(CONFIG_MODULES) || defined(__DISABLE_EXPORTS)
 
 /*
@@ -77,50 +59,21 @@ extern struct module __this_module;
  */
 #define __EXPORT_SYMBOL(sym, sec, ns)
 
-#elif defined(CONFIG_TRIM_UNUSED_KSYMS)
+#elif defined(__GENKSYMS__)
 
-#include <generated/autoksyms.h>
+#define __EXPORT_SYMBOL(sym, sec, ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
 
-/*
- * For fine grained build dependencies, we want to tell the build system
- * about each possible exported symbol even if they're not actually exported.
- * We use a symbol pattern __ksym_marker_<symbol> that the build system filters
- * from the $(NM) output (see scripts/gen_ksymdeps.sh). These symbols are
- * discarded in the final link stage.
- */
+#elif defined(__ASSEMBLY__)
 
-#ifdef __ASSEMBLY__
-
-#define __ksym_marker(sym)					\
-	.section ".discard.ksym","a" ;				\
-__ksym_marker_##sym: ;						\
-	.previous
+#define __EXPORT_SYMBOL(sym, license, ns) \
+	___EXPORT_SYMBOL(sym, license, ns)
 
 #else
 
-#define __ksym_marker(sym)	\
-	static int __ksym_marker_##sym[0] __section(".discard.ksym") __used
-
-#endif
-
-#define __EXPORT_SYMBOL(sym, sec, ns)					\
-	__ksym_marker(sym);						\
-	__cond_export_sym(sym, sec, ns, __is_defined(__KSYM_##sym))
-#define __cond_export_sym(sym, sec, ns, conf)				\
-	___cond_export_sym(sym, sec, ns, conf)
-#define ___cond_export_sym(sym, sec, ns, enabled)			\
-	__cond_export_sym_##enabled(sym, sec, ns)
-#define __cond_export_sym_1(sym, sec, ns) ___EXPORT_SYMBOL(sym, sec, ns)
-
-#ifdef __GENKSYMS__
-#define __cond_export_sym_0(sym, sec, ns) __GENKSYMS_EXPORT_SYMBOL(sym)
-#else
-#define __cond_export_sym_0(sym, sec, ns) /* nothing */
-#endif
-
-#else
-
-#define __EXPORT_SYMBOL(sym, sec, ns)	___EXPORT_SYMBOL(sym, sec, ns)
+#define __EXPORT_SYMBOL(sym, license, ns)			\
+	extern typeof(sym) sym;					\
+	__ADDRESSABLE(sym)					\
+	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
 
 #endif /* CONFIG_MODULES */
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 210142c3ff00..4735b958097a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -82,7 +82,7 @@ ifdef need-builtin
 targets-for-builtin += $(obj)/built-in.a
 endif
 
-targets-for-modules := $(foreach x, o mod $(if $(CONFIG_TRIM_UNUSED_KSYMS), usyms), \
+targets-for-modules := $(foreach x, o mod, \
 				$(patsubst %.o, %.$x, $(filter %.o, $(obj-m))))
 
 ifdef need-modorder
@@ -217,18 +217,12 @@ is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(basetar
 
 $(obj)/%.o: objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
 
-ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_gen_ksymdeps = \
-	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
-endif
-
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 cmd_warn_shared_object = $(if $(word 2, $(modname-multi)),$(warning $(kbuild-file): $*.o is added to multiple modules: $(modname-multi)))
 endif
 
 define rule_cc_o_c
 	$(call cmd_and_fixdep,cc_o_c)
-	$(call cmd,gen_ksymdeps)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
 	$(call cmd,gen_objtooldep)
@@ -239,7 +233,6 @@ endef
 
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
-	$(call cmd,gen_ksymdeps)
 	$(call cmd,gen_objtooldep)
 	$(call cmd,gen_symversions_S)
 	$(call cmd,warn_shared_object)
@@ -258,12 +251,6 @@ cmd_mod = printf '%s\n' $(call real-search, $*.o, .o, -objs -y -m) | \
 $(obj)/%.mod: FORCE
 	$(call if_changed,mod)
 
-# List module undefined symbols
-cmd_undefined_syms = $(NM) $< | sed -n 's/^  *U //p' > $@
-
-$(obj)/%.usyms: $(obj)/%.o FORCE
-	$(call if_changed,undefined_syms)
-
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
 		     $(CONFIG_SHELL) $(srctree)/scripts/makelst $*.o \
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 074e27c0c140..39472e834b63 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -91,6 +91,13 @@ targets += .vmlinux.objs
 .vmlinux.objs: vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
 	$(call if_changed,vmlinux_objs)
 
+ifdef CONFIG_TRIM_UNUSED_KSYMS
+ksym-wl := $(CONFIG_UNUSED_KSYMS_WHITELIST)
+ksym-wl := $(if $(filter-out /%, $(ksym-wl)),$(srctree)/)$(ksym-wl)
+modpost-args += -t $(addprefix -u , $(ksym-wl))
+modpost-deps += $(ksym-wl)
+endif
+
 ifeq ($(wildcard vmlinux.o),)
 missing-input := vmlinux.o
 output-symdump := modules-only.symvers
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
deleted file mode 100755
index f1b5ac818411..000000000000
--- a/scripts/adjust_autoksyms.sh
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-only
-
-# Script to update include/generated/autoksyms.h and dependency files
-#
-# Copyright:	(C) 2016  Linaro Limited
-# Created by:	Nicolas Pitre, January 2016
-#
-
-# Update the include/generated/autoksyms.h file.
-#
-# For each symbol being added or removed, the corresponding dependency
-# file's timestamp is updated to force a rebuild of the affected source
-# file. All arguments passed to this script are assumed to be a command
-# to be exec'd to trigger a rebuild of those files.
-
-set -e
-
-cur_ksyms_file="include/generated/autoksyms.h"
-new_ksyms_file="include/generated/autoksyms.h.tmpnew"
-
-info() {
-	if [ "$quiet" != "silent_" ]; then
-		printf "  %-7s %s\n" "$1" "$2"
-	fi
-}
-
-info "CHK" "$cur_ksyms_file"
-
-# Use "make V=1" to debug this script.
-case "$KBUILD_VERBOSE" in
-*1*)
-	set -x
-	;;
-esac
-
-# Generate a new symbol list file
-$CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh --modorder "$new_ksyms_file"
-
-# Extract changes between old and new list and touch corresponding
-# dependency files.
-changed=$(
-count=0
-sort "$cur_ksyms_file" "$new_ksyms_file" | uniq -u |
-sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' |
-while read sympath; do
-	if [ -z "$sympath" ]; then continue; fi
-	depfile="include/ksym/${sympath}"
-	mkdir -p "$(dirname "$depfile")"
-	touch "$depfile"
-	# Filesystems with coarse time precision may create timestamps
-	# equal to the one from a file that was very recently built and that
-	# needs to be rebuild. Let's guard against that by making sure our
-	# dep files are always newer than the first file we created here.
-	while [ ! "$depfile" -nt "$new_ksyms_file" ]; do
-		touch "$depfile"
-	done
-	echo $((count += 1))
-done | tail -1 )
-changed=${changed:-0}
-
-if [ $changed -gt 0 ]; then
-	# Replace the old list with tne new one
-	old=$(grep -c "^#define __KSYM_" "$cur_ksyms_file" || true)
-	new=$(grep -c "^#define __KSYM_" "$new_ksyms_file" || true)
-	info "KSYMS" "symbols: before=$old, after=$new, changed=$changed"
-	info "UPD" "$cur_ksyms_file"
-	mv -f "$new_ksyms_file" "$cur_ksyms_file"
-	# Then trigger a rebuild of affected source files
-	exec $@
-else
-	rm -f "$new_ksyms_file"
-fi
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index fa562806c2be..84b6efa849f4 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -246,8 +246,7 @@ static void *read_file(const char *filename)
 /* Ignore certain dependencies */
 static int is_ignored_file(const char *s, int len)
 {
-	return str_ends_with(s, len, "include/generated/autoconf.h") ||
-	       str_ends_with(s, len, "include/generated/autoksyms.h");
+	return str_ends_with(s, len, "include/generated/autoconf.h");
 }
 
 /* Do not parse these files */
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
deleted file mode 100755
index 12bcfae940ee..000000000000
--- a/scripts/gen_autoksyms.sh
+++ /dev/null
@@ -1,62 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-only
-
-# Create an autoksyms.h header file from the list of all module's needed symbols
-# as recorded in *.usyms files and the user-provided symbol whitelist.
-
-set -e
-
-# Use "make V=1" to debug this script.
-case "$KBUILD_VERBOSE" in
-*1*)
-	set -x
-	;;
-esac
-
-read_modorder=
-
-if [ "$1" = --modorder ]; then
-	shift
-	read_modorder=1
-fi
-
-output_file="$1"
-
-needed_symbols=
-
-# Special case for modversions (see modpost.c)
-if grep -q "^CONFIG_MODVERSIONS=y$" include/config/auto.conf; then
-	needed_symbols="$needed_symbols module_layout"
-fi
-
-ksym_wl=$(sed -n 's/^CONFIG_UNUSED_KSYMS_WHITELIST=\(.*\)$/\1/p' include/config/auto.conf)
-if [ -n "$ksym_wl" ]; then
-	[ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
-	if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
-		echo "ERROR: '$ksym_wl' whitelist file not found" >&2
-		exit 1
-	fi
-fi
-
-# Generate a new ksym list file with symbols needed by the current
-# set of modules.
-cat > "$output_file" << EOT
-/*
- * Automatically generated file; DO NOT EDIT.
- */
-
-EOT
-
-{
-	[ -n "${read_modorder}" ] && sed 's/o$/usyms/' modules.order | xargs cat
-	echo "$needed_symbols"
-	[ -n "$ksym_wl" ] && cat "$ksym_wl"
-} | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
-# Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
-# point addresses.
-sed -e 's/^\.//' |
-sort -u |
-# Ignore __this_module. It's not an exported symbol, and will be resolved
-# when the final .ko's are linked.
-grep -v '^__this_module$' |
-sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
deleted file mode 100755
index 8ee533f33659..000000000000
--- a/scripts/gen_ksymdeps.sh
+++ /dev/null
@@ -1,30 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-set -e
-
-# List of exported symbols
-#
-# If the object has no symbol, $NM warns 'no symbols'.
-# Suppress the stderr.
-# TODO:
-#   Use -q instead of 2>/dev/null when we upgrade the minimum version of
-#   binutils to 2.37, llvm to 13.0.0.
-ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p')
-
-if [ -z "$ksyms" ]; then
-	exit 0
-fi
-
-echo
-echo "ksymdeps_$1 := \\"
-
-for s in $ksyms
-do
-	printf '    $(wildcard include/ksym/%s) \\\n' "$s"
-done
-
-echo
-echo "$1: \$(ksymdeps_$1)"
-echo
-echo "\$(ksymdeps_$1):"
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 051ff67875ec..50d950e904a4 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -35,6 +35,9 @@ static bool warn_unresolved;
 
 static int sec_mismatch_count;
 static bool sec_mismatch_warn_only = true;
+/* Trim EXPORT_SYMBOLs that are unused by in-tree modules */
+static bool trim_unused_exports;
+
 /* ignore missing files */
 static bool ignore_missing_files;
 /* If set to 1, only warn (instead of error) about missing ns imports */
@@ -219,6 +222,7 @@ struct symbol {
 	bool weak;
 	bool is_func;
 	bool is_gpl_only;	/* exported by EXPORT_SYMBOL_GPL */
+	bool used;		/* there exists a user of this symbol */
 	char name[];
 };
 
@@ -1826,6 +1830,7 @@ static void check_exports(struct module *mod)
 			continue;
 		}
 
+		exp->used = true;
 		s->module = exp->module;
 		s->crc_valid = exp->crc_valid;
 		s->crc = exp->crc;
@@ -1849,6 +1854,23 @@ static void check_exports(struct module *mod)
 	}
 }
 
+static void handle_white_list_exports(const char *white_list)
+{
+	char *buf, *p, *name;
+
+	buf = read_text_file(white_list);
+	p = buf;
+
+	while ((name = strsep(&p, "\n"))) {
+		struct symbol *sym = find_symbol(name);
+
+		if (sym)
+			sym->used = true;
+	}
+
+	free(buf);
+}
+
 static void check_modname_len(struct module *mod)
 {
 	const char *mod_name;
@@ -1919,10 +1941,14 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 
 	/* generate struct for exported symbols */
 	buf_printf(buf, "\n");
-	list_for_each_entry(sym, &mod->exported_symbols, list)
+	list_for_each_entry(sym, &mod->exported_symbols, list) {
+		if (trim_unused_exports && !sym->used)
+			continue;
+
 		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
 			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+	}
 
 	if (!modversions)
 		return;
@@ -1930,6 +1956,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 	/* record CRCs for exported symbols */
 	buf_printf(buf, "\n");
 	list_for_each_entry(sym, &mod->exported_symbols, list) {
+		if (trim_unused_exports && !sym->used)
+			continue;
+
 		if (!sym->crc_valid)
 			warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n"
 			     "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
@@ -2093,9 +2122,6 @@ static void write_mod_c_file(struct module *mod)
 	char fname[PATH_MAX];
 	int ret;
 
-	check_modname_len(mod);
-	check_exports(mod);
-
 	add_header(&buf, mod);
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
@@ -2187,6 +2213,9 @@ static void write_dump(const char *fname)
 		if (mod->from_dump)
 			continue;
 		list_for_each_entry(sym, &mod->exported_symbols, list) {
+			if (trim_unused_exports && !sym->used)
+				continue;
+
 			buf_printf(&buf, "0x%08x\t%s\t%s\tEXPORT_SYMBOL%s\t%s\n",
 				   sym->crc, sym->name, mod->name,
 				   sym->is_gpl_only ? "_GPL" : "",
@@ -2229,12 +2258,13 @@ int main(int argc, char **argv)
 {
 	struct module *mod;
 	char *missing_namespace_deps = NULL;
+	char *unused_exports_white_list = NULL;
 	char *dump_write = NULL, *files_source = NULL;
 	int opt;
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:mnT:o:aWwENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:to:au:WwENd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2259,6 +2289,12 @@ int main(int argc, char **argv)
 		case 'T':
 			files_source = optarg;
 			break;
+		case 't':
+			trim_unused_exports = true;
+			break;
+		case 'u':
+			unused_exports_white_list = optarg;
+			break;
 		case 'W':
 			extra_warn = true;
 			break;
@@ -2291,6 +2327,17 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
+	list_for_each_entry(mod, &modules, list) {
+		if (mod->from_dump || mod->is_vmlinux)
+			continue;
+
+		check_modname_len(mod);
+		check_exports(mod);
+	}
+
+	if (unused_exports_white_list)
+		handle_white_list_exports(unused_exports_white_list);
+
 	list_for_each_entry(mod, &modules, list) {
 		if (mod->from_dump)
 			continue;
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index 7f432900671a..f3659ea0335b 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -33,3 +33,7 @@ rm -f rust/target.json
 rm -f scripts/bin2c
 
 rm -f .scmversion
+
+rm -rf include/ksym
+
+find . -name '*.usyms' | xargs rm -f
-- 
2.39.2

