Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE623CBDF7
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jul 2021 22:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhGPUsr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jul 2021 16:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbhGPUsq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jul 2021 16:48:46 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E39C06175F
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jul 2021 13:45:51 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id t6-20020ac80dc60000b029024e988e8277so7051948qti.23
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jul 2021 13:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=6xOtLIYGyLB17xvo4gQCXAgOrNxU3pti+/trSkcx+rg=;
        b=WCi9oN7bpF4MQZ7OHx/eGQ/9jKMyZye3MUnVEtKtWnCo/EpfbBmeGXUd5eOyoNKMQj
         DYN5lmCu3/q8AdyK4rm7xIFJcOwG+uyPzxxf69EKkkn7+wWUfdbLm3lkBE03uNtB4e2i
         gbGuIfiB+qK3e2UfmtsoDBc5ppYrNbm/0PA5qpXL799rAjdUPYvTspivZ75PoXOKcnbf
         VTgAh6DQVlbrP9REEfb9LMbEb2ldntWwb/08ms1Jc0Z7UoiByS6CflUFpBk4fpTsto2a
         QO8C6/3uWmiVU/eY2+ZDG2WQqA0Ty9aZNBAwrbv4CicgH29y1rrkpAE2wq6HgZG5nDya
         QS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=6xOtLIYGyLB17xvo4gQCXAgOrNxU3pti+/trSkcx+rg=;
        b=Q6PAcBEWzfcJ8B++3BYY86NiqCk7BabWmbctWoPxpEB3zpU/kIM4uGa3Q8AKDU3ewL
         puZKXRD0afrhjHeDFp5ADXRz/kBm5MWU5Uh7KVNAuD5COC4HGaEEi8zbeVIi+wBClzcb
         hKSAab69deOK6vySe6dcLwxD7LgdHCYMcnse481wE/LKlVhLbGzUYmJXg6MBwghtW7IA
         cDNOybm1aKz3zpcaaZ8I4oZUhQQfpV3e8YZmuxd2xCK0v3IR71tVRuIXcHjamTdnUebU
         t2EKnLmZV6hUrgyqS7z15ZT2ChF/6V1Hc/wENGhZ4LyfqfooDkZM9Jrq9iVB0g0zGz67
         GpgA==
X-Gm-Message-State: AOAM532mU/qSjK+jsMpBri/vHCViiWxFMc+cBY8BK76IU3SmZ1tleQ2W
        RUtRJSDDgi9QUkCdRCUh72c20aE+l2DyPygCIvg=
X-Google-Smtp-Source: ABdhPJyG16Hp8cGkS8QEH32N9py2egU8HtddEjT0D8YHW7CIh0lajVFGsDMafb0g2+mcgnivV/NSMpsXj58yfyc6/xg=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:1ce:e9d9:963c:dd36])
 (user=samitolvanen job=sendgmr) by 2002:ad4:4949:: with SMTP id
 o9mr12208799qvy.56.1626468350421; Fri, 16 Jul 2021 13:45:50 -0700 (PDT)
Date:   Fri, 16 Jul 2021 13:45:45 -0700
Message-Id: <20210716204545.3536354-1-samitolvanen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
Subject: [PATCH] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_LTO_CLANG, we currently link modules into native
code just before modpost, which means with TRIM_UNUSED_KSYMS
enabled, we still look at the LLVM bitcode in the .o files when
generating the list of used symbols. As the bitcode doesn't
yet have calls to compiler intrinsics and llvm-nm doesn't see
function references that only exist in function-level inline
assembly, we currently need a whitelist for TRIM_UNUSED_KSYMS to
work with LTO.

This change moves module LTO linking to happen earlier, and
thus avoids the issue with LLVM bitcode and TRIM_UNUSED_KSYMS
entirely, allowing us to also drop the whitelist from
gen_autoksyms.sh.

Link: https://github.com/ClangBuiltLinux/linux/issues/1369
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Makefile.build    | 25 ++++++++++++++++++++++++-
 scripts/Makefile.lib      |  7 +++++++
 scripts/Makefile.modfinal | 21 ++-------------------
 scripts/Makefile.modpost  | 22 +++-------------------
 scripts/gen_autoksyms.sh  | 12 ------------
 5 files changed, 36 insertions(+), 51 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 10b2f2380d6f..80e0fa810870 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -202,6 +202,7 @@ sub_cmd_record_mcount =					\
 	if [ $(@) != "scripts/mod/empty.o" ]; then	\
 		$(objtree)/scripts/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)";	\
 	fi;
+/
 recordmcount_source := $(srctree)/scripts/recordmcount.c \
 		    $(srctree)/scripts/recordmcount.h
 else
@@ -271,12 +272,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
 
+ifdef CONFIG_LTO_CLANG
+# Module .o files may contain LLVM bitcode, compile them into native code
+# before ELF processing
+quiet_cmd_cc_lto_link_modules = LTO [M] $@
+cmd_cc_lto_link_modules =						\
+	$(LD) $(ld_flags) -r -o $@					\
+		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
+			echo -T $(@:.lto.o=.o.symversions))		\
+		--whole-archive $^
+
+ifdef CONFIG_STACK_VALIDATION
+# objtool was skipped for LLVM bitcode, run it now that we have compiled
+# modules into native code
+cmd_cc_lto_link_modules += ;						\
+	$(objtree)/tools/objtool/objtool $(objtool_args)		\
+		$(@:.ko=$(mod-prelink-ext).o)
+endif
+
+$(obj)/%.lto.o: $(obj)/%.o
+	$(call if_changed,cc_lto_link_modules)
+endif
+
 cmd_mod = { \
 	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
 	$(undefined_syms) echo; \
 	} > $@
 
-$(obj)/%.mod: $(obj)/%.o FORCE
+$(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o FORCE
 	$(call if_changed,mod)
 
 quiet_cmd_cc_lst_c = MKLST   $@
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 10950559b223..ee985366dddf 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -225,6 +225,13 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
 		 -undef -D__DTS__
 
+ifeq ($(CONFIG_LTO_CLANG),y)
+# With CONFIG_LTO_CLANG, .o files in modules might be LLVM bitcode, so we
+# need to run # LTO to compile them into native code (.lto.o) before further
+# processing.
+mod-prelink-ext := .lto
+endif
+
 # Objtool arguments are also needed for modfinal with LTO, so we define
 # then here to avoid duplication.
 objtool_args =								\
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 5e9b8057fb24..ff805777431c 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -9,7 +9,7 @@ __modfinal:
 include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
-# for c_flags and objtool_args
+# for c_flags and mod-prelink-ext
 include $(srctree)/scripts/Makefile.lib
 
 # find all modules listed in modules.order
@@ -30,23 +30,6 @@ quiet_cmd_cc_o_c = CC [M]  $@
 
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
-ifdef CONFIG_LTO_CLANG
-# With CONFIG_LTO_CLANG, reuse the object file we compiled for modpost to
-# avoid a second slow LTO link
-prelink-ext := .lto
-
-# ELF processing was skipped earlier because we didn't have native code,
-# so let's now process the prelinked binary before we link the module.
-
-ifdef CONFIG_STACK_VALIDATION
-cmd_ld_ko_o +=								\
-	$(objtree)/tools/objtool/objtool $(objtool_args)		\
-		$(@:.ko=$(prelink-ext).o);
-
-endif # CONFIG_STACK_VALIDATION
-
-endif # CONFIG_LTO_CLANG
-
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o +=							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
@@ -72,7 +55,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
-$(modules): %.ko: %$(prelink-ext).o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
+$(modules): %.ko: %$(mod-prelink-ext).o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
 	+$(call if_changed_except,ld_ko_o,vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index c383ba33d837..eef56d629799 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -41,7 +41,7 @@ __modpost:
 include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
-# for ld_flags
+# for mod-prelink-ext
 include $(srctree)/scripts/Makefile.lib
 
 MODPOST = scripts/mod/modpost								\
@@ -118,22 +118,6 @@ $(input-symdump):
 	@echo >&2 '         Modules may not have dependencies or modversions.'
 	@echo >&2 '         You may get many unresolved symbol warnings.'
 
-ifdef CONFIG_LTO_CLANG
-# With CONFIG_LTO_CLANG, .o files might be LLVM bitcode, so we need to run
-# LTO to compile them into native code before running modpost
-prelink-ext := .lto
-
-quiet_cmd_cc_lto_link_modules = LTO [M] $@
-cmd_cc_lto_link_modules =						\
-	$(LD) $(ld_flags) -r -o $@					\
-		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
-			echo -T $(@:.lto.o=.o.symversions))		\
-		--whole-archive $^
-
-%.lto.o: %.o
-	$(call if_changed,cc_lto_link_modules)
-endif
-
 modules := $(sort $(shell cat $(MODORDER)))
 
 # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined symbols
@@ -144,9 +128,9 @@ endif
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 quiet_cmd_modpost = MODPOST $@
-      cmd_modpost = sed 's/\.ko$$/$(prelink-ext)\.o/' $< | $(MODPOST) -T -
+      cmd_modpost = sed 's/\.ko$$/$(mod-prelink-ext)\.o/' $< | $(MODPOST) -T -
 
-$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=$(prelink-ext).o) FORCE
+$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=$(mod-prelink-ext).o) FORCE
 	$(call if_changed,modpost)
 
 targets += $(output-symdump)
diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index da320151e7c3..6ed0d225c8b1 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -26,18 +26,6 @@ if [ -n "$CONFIG_MODVERSIONS" ]; then
 	needed_symbols="$needed_symbols module_layout"
 fi
 
-# With CONFIG_LTO_CLANG, LLVM bitcode has not yet been compiled into a binary
-# when the .mod files are generated, which means they don't yet contain
-# references to certain symbols that will be present in the final binaries.
-if [ -n "$CONFIG_LTO_CLANG" ]; then
-	# intrinsic functions
-	needed_symbols="$needed_symbols memcpy memmove memset"
-	# ftrace
-	needed_symbols="$needed_symbols _mcount"
-	# stack protector symbols
-	needed_symbols="$needed_symbols __stack_chk_fail __stack_chk_guard"
-fi
-
 ksym_wl=
 if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
 	# Use 'eval' to expand the whitelist path and check if it is relative
-- 
2.32.0.402.g57bb445576-goog

