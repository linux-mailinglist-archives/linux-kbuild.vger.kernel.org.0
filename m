Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E39603E8483
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Aug 2021 22:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhHJUnM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Aug 2021 16:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233362AbhHJUnL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Aug 2021 16:43:11 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51181C061798
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Aug 2021 13:42:49 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id d20-20020a05620a1414b02903d24f3e6540so3540283qkj.7
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Aug 2021 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=EW6Q5CaUpfH7HbowLAZVGbAcLqxCVj49fYmRM95UtZI=;
        b=FIdq2p/hy2fZuCOhTU40LIdw6+V8C4Zn7LphQwtkMraZ+YREgFjsQNhhKeXc2aZ1ph
         sEC9DYlBvyLFigsF/XLYbbfM/aTzogCGKKhs8Qh91gpxIBtPBj2pRQHSJG9wAyuEbQUh
         6VfYAdCUIf7FCf70fApYLCEgRb0QsyHX+od0pqrPJHWG95AfC7uiKEhI3ixHGoJUgQwO
         H2Z1lsAQfaQ5HabioMDiYLdOJh9ard8+j0XlNQD+J7RFKA7EcVbgPX7BJqG7OgtLg0jw
         d3n4uuGA68RhU1SIUarrWQ4l8y1GyJ56/GK5A45AD1djXOWrCpvou0uOzoowguQprFBY
         gQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=EW6Q5CaUpfH7HbowLAZVGbAcLqxCVj49fYmRM95UtZI=;
        b=FaRxZ7siry/1vgRKP3jKEGM75AK+E18OWJ105HV2GK6JmTp3Y89pHdST/4IeUDgI4o
         AcdCOp35Do+NWDqO37PtUwPF/SAkoBj67x7fTvzKcWKCnvg4cm4Djh1t3rDUEQfNL+gg
         xhy4YzR+0YjzoyN6IQ1MAyJilWC7Gbyf+wPJHTSADE4R+vDNbh0lcCASIrD9/8DC8c2z
         22sh1Ho+3uSM5eDAAl2fLwjX2rRziDBA4lg4wigRG1Gum7xABV6CLdVoonTnt3kK5+MR
         jEZBTAkUZK2RRGAgriwdXljTq5YcJs1j3forXnlTWOpJo5ARd4gE/K8lJxa8mo6kWa/A
         UqbQ==
X-Gm-Message-State: AOAM530ojud5ezuN0QHXfXVHYdAh4L8sP2P8UDFVTTQ5IiwEWU5DeWUO
        Jje5QRoDtsVWv+knM4NhVlYtOGdfrGVVNx80wik=
X-Google-Smtp-Source: ABdhPJx7MPrepqoYZzWR+7g0XcmonZnK3MONe2hH+CaLcRGvYSa9JQTBH1JuyJJSB/WuJYI4EFWeTy+IFBnppDUPlQE=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f3a2:624c:cdb9:1ee9])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:ff48:: with SMTP id
 y8mr19877957qvt.29.1628628168407; Tue, 10 Aug 2021 13:42:48 -0700 (PDT)
Date:   Tue, 10 Aug 2021 13:42:37 -0700
Message-Id: <20210810204240.4008685-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH] Makefile: remove stale cc-option checks
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cc-option, cc-option-yn, and cc-disable-warning all invoke the compiler
during build time, and can slow down the build when these checks become
stale for our supported compilers, whose minimally supported versions
increases over time. See Documentation/process/changes.rst for the
current supported minimal versions (GCC 4.9+, clang 10.0.1+). Compiler
version support for these flags may be verified on godbolt.org.

The following flags are GCC only and supported since at least GCC 4.9.
Remove cc-option and cc-disable-warning tests.
* -fno-tree-loop-im
* -Wno-maybe-uninitialized
* -fno-reorder-blocks
* -fno-ipa-cp-clone
* -fno-partial-inlining
* -femit-struct-debug-baseonly
* -fno-inline-functions-called-once
* -fconserve-stack

The following flags are supported by all supported versions of GCC and
Clang. Remove their cc-option, cc-option-yn, and cc-disable-warning tests.
* -fno-delete-null-pointer-checks
* -fno-var-tracking
* -mfentry
* -Wno-array-bounds

The following configs are made dependent on GCC, since they use GCC
specific flags.
* READABLE_ASM
* DEBUG_SECTION_MISMATCH

--param=allow-store-data-races=0 was renamed to --allow-store-data-races
in the GCC 10 release.

Also, base RETPOLINE_CFLAGS and RETPOLINE_VDSO_CFLAGS on CONFIC_CC_IS_*
then remove cc-option tests for Clang.

Link: https://github.com/ClangBuiltLinux/linux/issues/1436
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Note: It may be preferred to move the test for
-fno-inline-functions-called-once for DEBUG_SECTION_MISMATCH into
Kconfig. That one does seem relatively more reasonable to implement in
Clang.

 Makefile          | 55 ++++++++++++++++++++++++++---------------------
 lib/Kconfig.debug |  2 ++
 2 files changed, 33 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index 027fdf2a14fe..3e3fb4affba1 100644
--- a/Makefile
+++ b/Makefile
@@ -730,9 +730,10 @@ endif # KBUILD_EXTMOD
 # Defaults to vmlinux, but the arch makefile usually adds further targets
 all: vmlinux
 
-CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage \
-	$(call cc-option,-fno-tree-loop-im) \
-	$(call cc-disable-warning,maybe-uninitialized,)
+CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
+ifdef CONFIG_CC_IS_GCC
+CFLAGS_GCOV	+= -fno-tree-loop-im
+endif
 export CFLAGS_GCOV
 
 # The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
@@ -740,12 +741,14 @@ ifdef CONFIG_FUNCTION_TRACER
   CC_FLAGS_FTRACE := -pg
 endif
 
-RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
-RETPOLINE_VDSO_CFLAGS_GCC := -mindirect-branch=thunk-inline -mindirect-branch-register
-RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
-RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
-RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
-RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
+ifdef CONFIG_CC_IS_GCC
+RETPOLINE_CFLAGS	:= $(call cc-option,-mindirect-branch=thunk-extern -mindirect-branch-register)
+RETPOLINE_VDSO_CFLAGS	:= $(call cc-option,-mindirect-branch=thunk-inline -mindirect-branch-register)
+endif
+ifdef CONFIG_CC_IS_CLANG
+RETPOLINE_CFLAGS	:= -mretpoline-external-thunk
+RETPOLINE_VDSO_CFLAGS	:= -mretpoline
+endif
 export RETPOLINE_CFLAGS
 export RETPOLINE_VDSO_CFLAGS
 
@@ -798,7 +801,7 @@ include/config/auto.conf:
 endif # may-sync-config
 endif # need-config
 
-KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
+KBUILD_CFLAGS	+= -fno-delete-null-pointer-checks
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
@@ -844,17 +847,17 @@ KBUILD_RUSTFLAGS += -Copt-level=z
 endif
 
 # Tell gcc to never replace conditional load with a non-conditional one
-KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS	+= $(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)
 KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
+endif
 
 ifdef CONFIG_READABLE_ASM
 # Disable optimizations that make assembler listings hard to read.
 # reorder blocks reorders the control in the function
 # ipa clone creates specialized cloned functions
 # partial inlining inlines only parts of functions
-KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
-                 $(call cc-option,-fno-ipa-cp-clone,) \
-                 $(call cc-option,-fno-partial-inlining)
+KBUILD_CFLAGS += -fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining
 endif
 
 ifneq ($(CONFIG_FRAME_WARN),0)
@@ -959,8 +962,10 @@ DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
-DEBUG_CFLAGS	+= $(call cc-option, -femit-struct-debug-baseonly) \
-		   $(call cc-option,-fno-var-tracking)
+DEBUG_CFLAGS	+= -fno-var-tracking
+ifdef CONFIG_CC_IS_GCC
+DEBUG_CFLAGS	+= -femit-struct-debug-baseonly
+endif
 endif
 
 ifdef CONFIG_DEBUG_INFO_COMPRESSED
@@ -997,10 +1002,8 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
   endif
 endif
 ifdef CONFIG_HAVE_FENTRY
-  ifeq ($(call cc-option-yn, -mfentry),y)
-    CC_FLAGS_FTRACE	+= -mfentry
-    CC_FLAGS_USING	+= -DCC_USING_FENTRY
-  endif
+  CC_FLAGS_FTRACE	+= -mfentry
+  CC_FLAGS_USING	+= -DCC_USING_FENTRY
 endif
 export CC_FLAGS_FTRACE
 KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
@@ -1009,7 +1012,7 @@ endif
 
 # We trigger additional mismatches with less inlining
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
-KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
+KBUILD_CFLAGS += -fno-inline-functions-called-once
 endif
 
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
@@ -1088,14 +1091,16 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
 # We'll want to enable this eventually, but it's not going away for 5.7 at least
 KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
-KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
+KBUILD_CFLAGS += -Wno-array-bounds
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 
 # Another good warning that we'll want to enable eventually
 KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
 
 # Enabled with W=2, disabled by default as noisy
-KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS += -Wno-maybe-uninitialized
+endif
 
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
@@ -1104,7 +1109,9 @@ KBUILD_CFLAGS	+= -fno-strict-overflow
 KBUILD_CFLAGS  += -fno-stack-check
 
 # conserve stack if available
-KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS   += -fconserve-stack
+endif
 
 # Prohibit date/time macros, which would make the build non-deterministic
 KBUILD_CFLAGS   += -Werror=date-time
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index b6b951b0ed46..a4a431606be2 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -364,6 +364,7 @@ config STRIP_ASM_SYMS
 config READABLE_ASM
 	bool "Generate readable assembler code"
 	depends on DEBUG_KERNEL
+	depends on CC_IS_GCC
 	help
 	  Disable some compiler optimizations that tend to generate human unreadable
 	  assembler output. This may make the kernel slightly slower, but it helps
@@ -382,6 +383,7 @@ config HEADERS_INSTALL
 
 config DEBUG_SECTION_MISMATCH
 	bool "Enable full Section mismatch analysis"
+	depends on CC_IS_GCC
 	help
 	  The section mismatch analysis checks if there are illegal
 	  references from one section to another section.
-- 
2.32.0.605.g8dce9f2422-goog

