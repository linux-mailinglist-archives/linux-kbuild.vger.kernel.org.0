Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3BB3EDEA7
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhHPU14 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbhHPU14 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:27:56 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFA0C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:27:24 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id bo13-20020a05621414adb029035561c68664so13734424qvb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=8uTPw/oT5qHAdMdt5boTQuI0c3E5jP6CvarW8rtmPjg=;
        b=ka7J9qkV4y/h9IuCvvXFZOBPYhsL1OTJ5evHejxTC870hkP0sSwjikMlBAxoZJUE49
         ur8HDxuQ3o5FGSf0GrF1cOj6cNZy19+4jAHXrzLrvu9o33oiwuHuzhMkolqhyRAl8mzy
         4R/OES2Q2vOodJq+h6rOnjjsBagBkyBJWnmw2/ei7FqecneUL7OMWWmm6z9aDa2y8KXI
         ZWjvPm/hq1l6/TEEym/9zpps4THglTnw+LhmQLoKzCnmhBJB0SIRRBKlHGV65cBywxwK
         +yZkGY0vGvjRUlVRaQI9pQDhNgapW/njSMwtHuohaLP4o1mJv0x0gULymieX2lvjUDU4
         uwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=8uTPw/oT5qHAdMdt5boTQuI0c3E5jP6CvarW8rtmPjg=;
        b=MCnpU5K9BTHe76VbdM/8r/KwJwF8RsBgS+oPYg+KjrE1qlnLe84qW+XiIztDj0IEcf
         JjvZX5n4T+FG5re1dIidTa/Ax/omhMksmtxmpeFRsNTHsgkdVj+rzlLDx4S1lj7xwQzD
         7Bjb0YWOmjmgL3D8qAE/fEJBdvx8s60+U5mwxFs9ovii8LgXSRHHoARGMh6fhdCZBTF2
         wcN3KVUSyU8uJso7FCf/CdnTO0JCI1rFYBoaa4nGXSjsJD4Hwg2nXEiv1TFFiBH344hI
         +TtBUfxKYrmeBLns+6YWPZ9AkCJ1RZz+mK6Yw1TK8B+ly8ty1g/87DcBN0bwH0DCPSFQ
         Di9A==
X-Gm-Message-State: AOAM5303/pjCOW3RWebcRBjSHgUM8BUuxqLlkxq7AS+px7wQxtrxLxUl
        Nczdr/gIXdviipE+g9Rbvn7YcXAH9OckkO0u0dw=
X-Google-Smtp-Source: ABdhPJy318cku7YcZQZCfgmr29Nfm2hAabeAKbS0hM6fRTuc5Yr4eCyT3NH4aQF7WQH8T0fLPZdWJ6Nt+EEc0nfIB2k=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:4b2:: with SMTP id
 w18mr534035qvz.47.1629145643423; Mon, 16 Aug 2021 13:27:23 -0700 (PDT)
Date:   Mon, 16 Aug 2021 13:25:01 -0700
Message-Id: <20210816202504.2228283-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH v2] Makefile: remove stale cc-option checks
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        kernel test robot <lkp@intel.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
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
* -Wno-array-bounds

The following configs are made dependent on GCC, since they use GCC
specific flags.
* READABLE_ASM
* DEBUG_SECTION_MISMATCH

-mfentry was not supported by s390-linux-gnu-gcc until gcc-9+, add a
comment.

--param=allow-store-data-races=0 was renamed to -fno-allow-store-data-races
in the GCC 10 release; add a comment.

-Wmaybe-uninitialized (GCC specific) was being added for CONFIG_GCOV,
then again unconditionally; add it only once.

Also, base RETPOLINE_CFLAGS and RETPOLINE_VDSO_CFLAGS on CONFIC_CC_IS_*
then remove cc-option tests for Clang.

Link: https://github.com/ClangBuiltLinux/linux/issues/1436
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* rebase on linux-kbuild/for-next from linux-next/master; patch was
  dropped from linux-mm:
  https://lore.kernel.org/mm-commits/20210814215814.W_qqW%25akpm@linux-foundation.org/.
* Pick up Miguel & Nathan's AB/RB tags.
* Pick up reports from LKFT/KTR.
* Note in commit message about -Wmaybe-uninitialized as per Masahiro.
* Undo changes to to -mfentry due to LKFT report:
  https://lore.kernel.org/lkml/CA+G9fYtPBp_-Ko_P7NuOX6vN9-66rjJuBt21h3arrLqEaQQn6w@mail.gmail.com/.
* Undo changes to --param=allow-store-data-races=0 &
  -fno-allow-store-data-races due to KTR report:
  https://lore.kernel.org/linux-mm/202108160729.Lx0IJzq3-lkp@intel.com/.
* Add comments to Makefile about -mfentry, -fno-allow-store-data-races,
  note in commit message.

 Makefile          | 50 +++++++++++++++++++++++++++++------------------
 lib/Kconfig.debug |  2 ++
 2 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index 891866af0787..ce5a297ecd7c 100644
--- a/Makefile
+++ b/Makefile
@@ -669,9 +669,10 @@ endif # KBUILD_EXTMOD
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
@@ -679,12 +680,14 @@ ifdef CONFIG_FUNCTION_TRACER
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
 
@@ -737,7 +740,7 @@ include/config/auto.conf:
 endif # may-sync-config
 endif # need-config
 
-KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
+KBUILD_CFLAGS	+= -fno-delete-null-pointer-checks
 KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
@@ -752,17 +755,19 @@ KBUILD_CFLAGS += -Os
 endif
 
 # Tell gcc to never replace conditional load with a non-conditional one
+ifdef CONFIG_CC_IS_GCC
+# gcc-10 renamed --param=allow-store-data-races=0 to
+# -fno-allow-store-data-races.
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
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
@@ -854,8 +859,10 @@ DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
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
@@ -889,6 +896,7 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
   endif
 endif
 ifdef CONFIG_HAVE_FENTRY
+  # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
   ifeq ($(call cc-option-yn, -mfentry),y)
     CC_FLAGS_FTRACE	+= -mfentry
     CC_FLAGS_USING	+= -DCC_USING_FENTRY
@@ -901,7 +909,7 @@ endif
 
 # We trigger additional mismatches with less inlining
 ifdef CONFIG_DEBUG_SECTION_MISMATCH
-KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
+KBUILD_CFLAGS += -fno-inline-functions-called-once
 endif
 
 ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
@@ -980,14 +988,16 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 
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
@@ -996,7 +1006,9 @@ KBUILD_CFLAGS	+= -fno-strict-overflow
 KBUILD_CFLAGS  += -fno-stack-check
 
 # conserve stack if available
-KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
+ifdef CONFIG_CC_IS_GCC
+KBUILD_CFLAGS   += -fconserve-stack
+endif
 
 # Prohibit date/time macros, which would make the build non-deterministic
 KBUILD_CFLAGS   += -Werror=date-time
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5ddd575159fb..7d3d29203a72 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -365,6 +365,7 @@ config STRIP_ASM_SYMS
 config READABLE_ASM
 	bool "Generate readable assembler code"
 	depends on DEBUG_KERNEL
+	depends on CC_IS_GCC
 	help
 	  Disable some compiler optimizations that tend to generate human unreadable
 	  assembler output. This may make the kernel slightly slower, but it helps
@@ -383,6 +384,7 @@ config HEADERS_INSTALL
 
 config DEBUG_SECTION_MISMATCH
 	bool "Enable full Section mismatch analysis"
+	depends on CC_IS_GCC
 	help
 	  The section mismatch analysis checks if there are illegal
 	  references from one section to another section.

base-commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14
-- 
2.33.0.rc1.237.g0d66db33f3-goog

