Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E425F3E8648
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Aug 2021 01:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbhHJXCA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Aug 2021 19:02:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:46936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235224AbhHJXCA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Aug 2021 19:02:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76C1661008;
        Tue, 10 Aug 2021 23:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628636497;
        bh=J/a++S/kpY/eEAyVDHTVPqmTmgeQQpm1W7wfR2mI6+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YOsC8JE3/o1F380LPto79cDG37kpoVxNML14J3xud0gJDiwsaxAaZ3wWayB2j9Fa3
         cZlC/GioOq9k5t8wUHTjzwT1NuHKw/jjfJP5QeErZLq1j16nndBiCyNdf4JTNBFLDN
         Ljd4SZOphzzOMupDkg/DUWJLhJDjIRDRPPz2dfU8pWPB3ImoJpd9JwdLX9ilMRWyEg
         qWpTZrT5JjOmvcYrSYnobWG++ANYZXG9sppmdnPSH43srYWym4Q9asqQmKpu+DC4jE
         +lWEDqMj4yAMkuPGGlgTIKiX8mhY4lGjqAnB85P6lqUNgjZZwiaPxxhof/5G13Lzyt
         K0VOyBtzbSwhA==
Date:   Tue, 10 Aug 2021 16:01:34 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
Message-ID: <YRMFTm3EJWRqwZkM@Ryzen-9-3900X.localdomain>
References: <20210810204240.4008685-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810204240.4008685-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 10, 2021 at 01:42:37PM -0700, Nick Desaulniers wrote:
> cc-option, cc-option-yn, and cc-disable-warning all invoke the compiler
> during build time, and can slow down the build when these checks become
> stale for our supported compilers, whose minimally supported versions
> increases over time. See Documentation/process/changes.rst for the
> current supported minimal versions (GCC 4.9+, clang 10.0.1+). Compiler
> version support for these flags may be verified on godbolt.org.
> 
> The following flags are GCC only and supported since at least GCC 4.9.
> Remove cc-option and cc-disable-warning tests.
> * -fno-tree-loop-im
> * -Wno-maybe-uninitialized
> * -fno-reorder-blocks
> * -fno-ipa-cp-clone
> * -fno-partial-inlining
> * -femit-struct-debug-baseonly
> * -fno-inline-functions-called-once
> * -fconserve-stack
> 
> The following flags are supported by all supported versions of GCC and
> Clang. Remove their cc-option, cc-option-yn, and cc-disable-warning tests.
> * -fno-delete-null-pointer-checks
> * -fno-var-tracking
> * -mfentry
> * -Wno-array-bounds
> 
> The following configs are made dependent on GCC, since they use GCC
> specific flags.
> * READABLE_ASM
> * DEBUG_SECTION_MISMATCH
> 
> --param=allow-store-data-races=0 was renamed to --allow-store-data-races
> in the GCC 10 release.
> 
> Also, base RETPOLINE_CFLAGS and RETPOLINE_VDSO_CFLAGS on CONFIC_CC_IS_*
> then remove cc-option tests for Clang.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1436
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Fewer pointless calls to the compiler is always a good thing :)

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Small comments inline.

> ---
> Note: It may be preferred to move the test for
> -fno-inline-functions-called-once for DEBUG_SECTION_MISMATCH into
> Kconfig. That one does seem relatively more reasonable to implement in
> Clang.
> 
>  Makefile          | 55 ++++++++++++++++++++++++++---------------------
>  lib/Kconfig.debug |  2 ++
>  2 files changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 027fdf2a14fe..3e3fb4affba1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -730,9 +730,10 @@ endif # KBUILD_EXTMOD
>  # Defaults to vmlinux, but the arch makefile usually adds further targets
>  all: vmlinux
>  
> -CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage \
> -	$(call cc-option,-fno-tree-loop-im) \
> -	$(call cc-disable-warning,maybe-uninitialized,)
> +CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
> +ifdef CONFIG_CC_IS_GCC
> +CFLAGS_GCOV	+= -fno-tree-loop-im
> +endif

Eliminating -Wno-maybe-uninitialized might warrant a comment in the
commit message as I was initially confused then I realized that it is
unconditionally added later.

>  export CFLAGS_GCOV
>  
>  # The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
> @@ -740,12 +741,14 @@ ifdef CONFIG_FUNCTION_TRACER
>    CC_FLAGS_FTRACE := -pg
>  endif
>  
> -RETPOLINE_CFLAGS_GCC := -mindirect-branch=thunk-extern -mindirect-branch-register
> -RETPOLINE_VDSO_CFLAGS_GCC := -mindirect-branch=thunk-inline -mindirect-branch-register
> -RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
> -RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
> -RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
> -RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
> +ifdef CONFIG_CC_IS_GCC
> +RETPOLINE_CFLAGS	:= $(call cc-option,-mindirect-branch=thunk-extern -mindirect-branch-register)
> +RETPOLINE_VDSO_CFLAGS	:= $(call cc-option,-mindirect-branch=thunk-inline -mindirect-branch-register)
> +endif
> +ifdef CONFIG_CC_IS_CLANG
> +RETPOLINE_CFLAGS	:= -mretpoline-external-thunk
> +RETPOLINE_VDSO_CFLAGS	:= -mretpoline
> +endif
>  export RETPOLINE_CFLAGS
>  export RETPOLINE_VDSO_CFLAGS
>  
> @@ -798,7 +801,7 @@ include/config/auto.conf:
>  endif # may-sync-config
>  endif # need-config
>  
> -KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
> +KBUILD_CFLAGS	+= -fno-delete-null-pointer-checks
>  KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, format-overflow)
> @@ -844,17 +847,17 @@ KBUILD_RUSTFLAGS += -Copt-level=z

Looks like this was generated against -next as it includes the rust
patchset. I was able to apply it to mainline without any complaints but
any follow ups should probably be based on Masahiro's tree.

>  endif
>  
>  # Tell gcc to never replace conditional load with a non-conditional one
> -KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
> +ifdef CONFIG_CC_IS_GCC
> +KBUILD_CFLAGS	+= $(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)
>  KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
> +endif
>  
>  ifdef CONFIG_READABLE_ASM
>  # Disable optimizations that make assembler listings hard to read.
>  # reorder blocks reorders the control in the function
>  # ipa clone creates specialized cloned functions
>  # partial inlining inlines only parts of functions
> -KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
> -                 $(call cc-option,-fno-ipa-cp-clone,) \
> -                 $(call cc-option,-fno-partial-inlining)
> +KBUILD_CFLAGS += -fno-reorder-blocks -fno-ipa-cp-clone -fno-partial-inlining
>  endif
>  
>  ifneq ($(CONFIG_FRAME_WARN),0)
> @@ -959,8 +962,10 @@ DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
>  endif
>  
>  ifdef CONFIG_DEBUG_INFO_REDUCED
> -DEBUG_CFLAGS	+= $(call cc-option, -femit-struct-debug-baseonly) \
> -		   $(call cc-option,-fno-var-tracking)
> +DEBUG_CFLAGS	+= -fno-var-tracking
> +ifdef CONFIG_CC_IS_GCC
> +DEBUG_CFLAGS	+= -femit-struct-debug-baseonly
> +endif
>  endif
>  
>  ifdef CONFIG_DEBUG_INFO_COMPRESSED
> @@ -997,10 +1002,8 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>    endif
>  endif
>  ifdef CONFIG_HAVE_FENTRY
> -  ifeq ($(call cc-option-yn, -mfentry),y)
> -    CC_FLAGS_FTRACE	+= -mfentry
> -    CC_FLAGS_USING	+= -DCC_USING_FENTRY
> -  endif
> +  CC_FLAGS_FTRACE	+= -mfentry
> +  CC_FLAGS_USING	+= -DCC_USING_FENTRY
>  endif
>  export CC_FLAGS_FTRACE
>  KBUILD_CFLAGS	+= $(CC_FLAGS_FTRACE) $(CC_FLAGS_USING)
> @@ -1009,7 +1012,7 @@ endif
>  
>  # We trigger additional mismatches with less inlining
>  ifdef CONFIG_DEBUG_SECTION_MISMATCH
> -KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
> +KBUILD_CFLAGS += -fno-inline-functions-called-once
>  endif
>  
>  ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> @@ -1088,14 +1091,16 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
>  
>  # We'll want to enable this eventually, but it's not going away for 5.7 at least
>  KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
> -KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
> +KBUILD_CFLAGS += -Wno-array-bounds
>  KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
>  
>  # Another good warning that we'll want to enable eventually
>  KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
>  
>  # Enabled with W=2, disabled by default as noisy
> -KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
> +ifdef CONFIG_CC_IS_GCC
> +KBUILD_CFLAGS += -Wno-maybe-uninitialized
> +endif
>  
>  # disable invalid "can't wrap" optimizations for signed / pointers
>  KBUILD_CFLAGS	+= -fno-strict-overflow
> @@ -1104,7 +1109,9 @@ KBUILD_CFLAGS	+= -fno-strict-overflow
>  KBUILD_CFLAGS  += -fno-stack-check
>  
>  # conserve stack if available
> -KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
> +ifdef CONFIG_CC_IS_GCC
> +KBUILD_CFLAGS   += -fconserve-stack
> +endif
>  
>  # Prohibit date/time macros, which would make the build non-deterministic
>  KBUILD_CFLAGS   += -Werror=date-time
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index b6b951b0ed46..a4a431606be2 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -364,6 +364,7 @@ config STRIP_ASM_SYMS
>  config READABLE_ASM
>  	bool "Generate readable assembler code"
>  	depends on DEBUG_KERNEL
> +	depends on CC_IS_GCC
>  	help
>  	  Disable some compiler optimizations that tend to generate human unreadable
>  	  assembler output. This may make the kernel slightly slower, but it helps
> @@ -382,6 +383,7 @@ config HEADERS_INSTALL
>  
>  config DEBUG_SECTION_MISMATCH
>  	bool "Enable full Section mismatch analysis"
> +	depends on CC_IS_GCC
>  	help
>  	  The section mismatch analysis checks if there are illegal
>  	  references from one section to another section.
> -- 
> 2.32.0.605.g8dce9f2422-goog
