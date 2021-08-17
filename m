Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE97E3EE401
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 03:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbhHQB6Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 21:58:24 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29089 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233238AbhHQB6Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 21:58:24 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 17H1vcZ9023256;
        Tue, 17 Aug 2021 10:57:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17H1vcZ9023256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629165458;
        bh=rM8EmfDue098NCNSDFRviWXJD7VPuuExM0AaHT4g0CQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rRgMI5OEGiY1503XIAKUhiyrlw7NUgQtUcWhxpWUu3JcSE6HDoQjnIu3RdKaoSCcU
         4wOl537q8vMwFNbn9zuwijvH9mUzdGF8Zk7gZnQM6wJsNQPx30znbD+vWiJ+91q2/m
         YGRZEakLGOithuFFDogwdsKRxXfixi8B5abwd625PajUL7as+OoHNL2pKRP9CoL2nJ
         Cy3XlJL3/GaCSnXBfVy7CL3Ev93ntFxWtMlLVUSNJ0wBsWXRsOrNNJnvjQXbyjvBwE
         VJcbRboTh9Q2Hl/Kg0OXW5qGlWjCKjGlIlTzljyghlQdS+LtSkPH8jlxZQYlxIIOnw
         oI8FtXnQ8TuxA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id n5so8940907pjt.4;
        Mon, 16 Aug 2021 18:57:38 -0700 (PDT)
X-Gm-Message-State: AOAM530xNz4Bn1WSV/Bl/JDC34mog92GsrNV6B4RVF/pH0uZeqQ1vsBw
        iEbYi1GJr3vr4PJTtA8X+cgWcI/AHaKGU0cbqeE=
X-Google-Smtp-Source: ABdhPJztikoDrehcmsJKB1ynzWcZeHMpJv6F2pwUPq1JwTuCKoMVd6/q37JhzmgCzm0SAAYCIkjQ6aMhaFuh+VQuRis=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr1042455pgj.47.1629165457514;
 Mon, 16 Aug 2021 18:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210816202504.2228283-1-ndesaulniers@google.com>
In-Reply-To: <20210816202504.2228283-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Aug 2021 10:57:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQePg39S1b9=wNE_fHPmGXnJ3CeBT7yucUGRMbLYwbgBw@mail.gmail.com>
Message-ID: <CAK7LNAQePg39S1b9=wNE_fHPmGXnJ3CeBT7yucUGRMbLYwbgBw@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: remove stale cc-option checks
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        kernel test robot <lkp@intel.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 5:27 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
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
> * -Wno-array-bounds
>
> The following configs are made dependent on GCC, since they use GCC
> specific flags.
> * READABLE_ASM
> * DEBUG_SECTION_MISMATCH
>
> -mfentry was not supported by s390-linux-gnu-gcc until gcc-9+, add a
> comment.
>
> --param=allow-store-data-races=0 was renamed to -fno-allow-store-data-races
> in the GCC 10 release; add a comment.
>
> -Wmaybe-uninitialized (GCC specific) was being added for CONFIG_GCOV,
> then again unconditionally; add it only once.
>
> Also, base RETPOLINE_CFLAGS and RETPOLINE_VDSO_CFLAGS on CONFIC_CC_IS_*
> then remove cc-option tests for Clang.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1436


> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>

I dropped these Reported-by.
I think Reported-by should be given
when existing issues are reported.

No issue exists in the main line.
(v1 was temporarily applied in -next, though)



Applied to linux-kbuild.






> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes v1 -> v2:
> * rebase on linux-kbuild/for-next from linux-next/master; patch was
>   dropped from linux-mm:
>   https://lore.kernel.org/mm-commits/20210814215814.W_qqW%25akpm@linux-foundation.org/.
> * Pick up Miguel & Nathan's AB/RB tags.
> * Pick up reports from LKFT/KTR.
> * Note in commit message about -Wmaybe-uninitialized as per Masahiro.
> * Undo changes to to -mfentry due to LKFT report:
>   https://lore.kernel.org/lkml/CA+G9fYtPBp_-Ko_P7NuOX6vN9-66rjJuBt21h3arrLqEaQQn6w@mail.gmail.com/.
> * Undo changes to --param=allow-store-data-races=0 &
>   -fno-allow-store-data-races due to KTR report:
>   https://lore.kernel.org/linux-mm/202108160729.Lx0IJzq3-lkp@intel.com/.
> * Add comments to Makefile about -mfentry, -fno-allow-store-data-races,
>   note in commit message.
>
>  Makefile          | 50 +++++++++++++++++++++++++++++------------------
>  lib/Kconfig.debug |  2 ++
>  2 files changed, 33 insertions(+), 19 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 891866af0787..ce5a297ecd7c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -669,9 +669,10 @@ endif # KBUILD_EXTMOD
>  # Defaults to vmlinux, but the arch makefile usually adds further targets
>  all: vmlinux
>
> -CFLAGS_GCOV    := -fprofile-arcs -ftest-coverage \
> -       $(call cc-option,-fno-tree-loop-im) \
> -       $(call cc-disable-warning,maybe-uninitialized,)
> +CFLAGS_GCOV    := -fprofile-arcs -ftest-coverage
> +ifdef CONFIG_CC_IS_GCC
> +CFLAGS_GCOV    += -fno-tree-loop-im
> +endif
>  export CFLAGS_GCOV
>
>  # The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
> @@ -679,12 +680,14 @@ ifdef CONFIG_FUNCTION_TRACER
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
> +RETPOLINE_CFLAGS       := $(call cc-option,-mindirect-branch=thunk-extern -mindirect-branch-register)
> +RETPOLINE_VDSO_CFLAGS  := $(call cc-option,-mindirect-branch=thunk-inline -mindirect-branch-register)
> +endif
> +ifdef CONFIG_CC_IS_CLANG
> +RETPOLINE_CFLAGS       := -mretpoline-external-thunk
> +RETPOLINE_VDSO_CFLAGS  := -mretpoline
> +endif
>  export RETPOLINE_CFLAGS
>  export RETPOLINE_VDSO_CFLAGS
>
> @@ -737,7 +740,7 @@ include/config/auto.conf:
>  endif # may-sync-config
>  endif # need-config
>
> -KBUILD_CFLAGS  += $(call cc-option,-fno-delete-null-pointer-checks,)
> +KBUILD_CFLAGS  += -fno-delete-null-pointer-checks
>  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
> @@ -752,17 +755,19 @@ KBUILD_CFLAGS += -Os
>  endif
>
>  # Tell gcc to never replace conditional load with a non-conditional one
> +ifdef CONFIG_CC_IS_GCC
> +# gcc-10 renamed --param=allow-store-data-races=0 to
> +# -fno-allow-store-data-races.
>  KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
>  KBUILD_CFLAGS  += $(call cc-option,-fno-allow-store-data-races)
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
> @@ -854,8 +859,10 @@ DEBUG_CFLAGS       += -gdwarf-$(dwarf-version-y)
>  endif
>
>  ifdef CONFIG_DEBUG_INFO_REDUCED
> -DEBUG_CFLAGS   += $(call cc-option, -femit-struct-debug-baseonly) \
> -                  $(call cc-option,-fno-var-tracking)
> +DEBUG_CFLAGS   += -fno-var-tracking
> +ifdef CONFIG_CC_IS_GCC
> +DEBUG_CFLAGS   += -femit-struct-debug-baseonly
> +endif
>  endif
>
>  ifdef CONFIG_DEBUG_INFO_COMPRESSED
> @@ -889,6 +896,7 @@ ifdef CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>    endif
>  endif
>  ifdef CONFIG_HAVE_FENTRY
> +  # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
>    ifeq ($(call cc-option-yn, -mfentry),y)
>      CC_FLAGS_FTRACE    += -mfentry
>      CC_FLAGS_USING     += -DCC_USING_FENTRY
> @@ -901,7 +909,7 @@ endif
>
>  # We trigger additional mismatches with less inlining
>  ifdef CONFIG_DEBUG_SECTION_MISMATCH
> -KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
> +KBUILD_CFLAGS += -fno-inline-functions-called-once
>  endif
>
>  ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> @@ -980,14 +988,16 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
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
>  KBUILD_CFLAGS  += -fno-strict-overflow
> @@ -996,7 +1006,9 @@ KBUILD_CFLAGS      += -fno-strict-overflow
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
> index 5ddd575159fb..7d3d29203a72 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -365,6 +365,7 @@ config STRIP_ASM_SYMS
>  config READABLE_ASM
>         bool "Generate readable assembler code"
>         depends on DEBUG_KERNEL
> +       depends on CC_IS_GCC
>         help
>           Disable some compiler optimizations that tend to generate human unreadable
>           assembler output. This may make the kernel slightly slower, but it helps
> @@ -383,6 +384,7 @@ config HEADERS_INSTALL
>
>  config DEBUG_SECTION_MISMATCH
>         bool "Enable full Section mismatch analysis"
> +       depends on CC_IS_GCC
>         help
>           The section mismatch analysis checks if there are illegal
>           references from one section to another section.
>
> base-commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14
> --
> 2.33.0.rc1.237.g0d66db33f3-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210816202504.2228283-1-ndesaulniers%40google.com.



-- 
Best Regards
Masahiro Yamada
