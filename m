Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADB23EDCC9
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 20:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhHPSF4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 14:05:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhHPSF4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 14:05:56 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A4D0C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:05:24 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id p21-20020ac846150000b02902982d999bfbso2890011qtn.7
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=WUhrLDawJHutBQtlsVgOUTtq1I0JwrxuJFZxAOpOQh0=;
        b=SBIC7Krjh/VhBl5SaGxVCbuoUREHKzu6zDr3IjUFmXSUOuqfreRC/rZdLIE2r7E4VM
         BCVJp7rNhmur0M/Uc43eucOdLG8igCTSSDGwc6aDsD3AE1WT0GJECDeh4n6ViR7Ik8To
         GnBsBUPrp/MrQhIkshElrv4YCcYD1OjecIEsdS+hs9tk+5p2nGPznYmA2SvjL7d3/7Vs
         OVrQ1GuilvU0fZ+7TXjbWg1GpdPqgyqXqk3BD8+cckMBxeph/XaMrGRKTvQRo+QdI9jX
         61veqXqnlf+uRhA5mPYH1A0cM+TcDnou+aG1rPr6OEbr3NPC1nH7Ep5MJYzo7O1HGgJ0
         AabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=WUhrLDawJHutBQtlsVgOUTtq1I0JwrxuJFZxAOpOQh0=;
        b=eIYIhfVYQ6bOHF5bCv17lvI5KkpboCggnoRxihkp39bKMB2IFtqJHbNTGb3YIWF5T8
         F7jVNTXFlFbAFvfADm4r+jVuqyQwN1yEA5yrdwpakyp/qspukNMnAZzVFPHmkY98E8+8
         ILyKVXPC026CdMSB20Cx3b5cuqDei6k0waKroxwnl/ZvGVr576oDHw/gcloI6tVglTi3
         y1Qh9/Q2ncg7WbRv+IF4PE/Ll6WiaQsyHYhEWBKTVEEXpDiZTPFkQ6tNNUxUZ53z4WTz
         t8FyvXlzp/xAVmJNhdXj01ZqHTme+157eyRNv/CdJbHiJAP6o4YbST6pz44MvFF+WR2K
         kbMA==
X-Gm-Message-State: AOAM531kw2ZtKU6VHCPKJ3ORJa/P33t7YnEwewxZ3kYr90c4YOwADCkP
        zT6NxQYSqAmKX3o5gVlTkpvcLoHQmQKBFNDHPVQ=
X-Google-Smtp-Source: ABdhPJxhKkwy4tIJBPi81JnMtRw9ItdUQCqEs3lJya95irvVe6M8or+msF0I1n8xF4YguHAVXtFyEmeRO47qpZRCe/w=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:5676:2fb8:7851:2301])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:892:: with SMTP id
 cz18mr17100881qvb.60.1629137122793; Mon, 16 Aug 2021 11:05:22 -0700 (PDT)
Date:   Mon, 16 Aug 2021 11:05:19 -0700
Message-Id: <20210816180519.1021311-1-samitolvanen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH v4] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Nathan Chancellor <nathan@kernel.org>,
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
Reviewed-by: Alexander Lobakin <alobakin@pm.me>
Tested-by: Alexander Lobakin <alobakin@pm.me>
---
Changes in v4:
- Added .lto.o to targets to actually fix the use of if_changed.
- Replaced an unnecessary mod-prelink-ext with .lto.

Changes in v3:
- Added missing FORCE.

Changes in v2:
- Fixed a couple of typos.
- Fixed objtool arguments for .lto.o to always include --module.

---
 scripts/Makefile.build    | 28 +++++++++++++++++++++++++++-
 scripts/Makefile.lib      |  7 +++++++
 scripts/Makefile.modfinal | 21 ++-------------------
 scripts/Makefile.modpost  | 22 +++-------------------
 scripts/gen_autoksyms.sh  | 12 ------------
 5 files changed, 39 insertions(+), 51 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 02197cb8e3a7..a6f43afd09bb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -88,6 +88,10 @@ endif
 
 targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
 
+ifdef CONFIG_LTO_CLANG
+targets-for-modules += $(patsubst %.o, %.lto.o, $(filter %.o, $(obj-m)))
+endif
+
 ifdef need-modorder
 targets-for-modules += $(obj)/modules.order
 endif
@@ -271,12 +275,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
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
+		--whole-archive $(filter-out FORCE,$^)
+
+ifdef CONFIG_STACK_VALIDATION
+# objtool was skipped for LLVM bitcode, run it now that we have compiled
+# modules into native code
+cmd_cc_lto_link_modules += ;						\
+	$(objtree)/tools/objtool/objtool $(objtool_args) --module	\
+		$(@:.ko=.lto.o)
+endif
+
+$(obj)/%.lto.o: $(obj)/%.o FORCE
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
index 10950559b223..af1c920a585c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -225,6 +225,13 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
 		 $(addprefix -I,$(DTC_INCLUDE))                          \
 		 -undef -D__DTS__
 
+ifeq ($(CONFIG_LTO_CLANG),y)
+# With CONFIG_LTO_CLANG, .o files in modules might be LLVM bitcode, so we
+# need to run LTO to compile them into native code (.lto.o) before further
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

base-commit: a2824f19e6065a0d3735acd9fe7155b104e7edf5
-- 
2.33.0.rc1.237.g0d66db33f3-goog

