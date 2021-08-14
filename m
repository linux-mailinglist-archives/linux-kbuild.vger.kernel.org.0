Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B854C3EBF5F
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Aug 2021 03:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236362AbhHNBnt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 21:43:49 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58274 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbhHNBns (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 21:43:48 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 17E1h8lu020363;
        Sat, 14 Aug 2021 10:43:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17E1h8lu020363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628905389;
        bh=+NjhW7gdXcyCEG7qCMQcOuOFQ656TJAvaR4knAJwaG8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sVolG7gEl1aKBdPHKpN10QQNFgIaLNv3BMykKHNo4yQ9WxWUhgH0bpEEDKljORdwE
         5ipIIBx/iur1B7Ez7H+DRbWyNwO5m4tASpYe8LUlTrmyQriTtRZ1nmmJVfmv5ixD3I
         Iz4BUmSNlWAu0Tvzz7DcGWXIGtpyn0of7U7zui57mYAFhMUjyRhByrkRZur/J+fdWL
         xatB2IBqXCAyKZdAwfsoz3ORKuywu38D7fWfYFg8unJPgXS9+u5c2IHXnSMNpzKZi/
         VY6+koNBJLx7BK4vVVqVSFIFc6AnfD/Mtq64oCpjFKihDFvG5sLE9f/1DQz35MuMes
         87oMO8zxiTBYw==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso23334327pjb.2;
        Fri, 13 Aug 2021 18:43:09 -0700 (PDT)
X-Gm-Message-State: AOAM533Jlx1iylBesdsYTTNU23eKKUArwBqqj4QdWQ9X41djlwuPGWd6
        wV4wT5OS4XCin/SVJvSYMU0XRD/9z60KDmnkM6E=
X-Google-Smtp-Source: ABdhPJy0YjGqE+HvD8b/dSFm1XFqctw70nHq+z8FuXmpMyYHhlRkf5xDp2NHEJMPgu5Ds093jOPza5R1+zBv6JuGgYY=
X-Received: by 2002:a63:a58:: with SMTP id z24mr4843025pgk.175.1628905388332;
 Fri, 13 Aug 2021 18:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com>
In-Reply-To: <20210810204240.4008685-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 14 Aug 2021 10:42:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASotywVkNjaBC7wYke70QL+a0tMJEVEvRTPpt8dDgHE9Q@mail.gmail.com>
Message-ID: <CAK7LNASotywVkNjaBC7wYke70QL+a0tMJEVEvRTPpt8dDgHE9Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 11, 2021 at 5:42 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
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
> @@ -798,7 +801,7 @@ include/config/auto.conf:
>  endif # may-sync-config
>  endif # need-config
>
> -KBUILD_CFLAGS  += $(call cc-option,-fno-delete-null-pointer-checks,)
> +KBUILD_CFLAGS  += -fno-delete-null-pointer-checks
>  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
> @@ -844,17 +847,17 @@ KBUILD_RUSTFLAGS += -Copt-level=z
>  endif
>
>  # Tell gcc to never replace conditional load with a non-conditional one
> -KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
> +ifdef CONFIG_CC_IS_GCC


Can you insert a comment here?

# GCC 10 renamed --param=allow-store-data-races=0 to --allow-store-data-races


It will remind us of dropping this conditional
in the (long long distant) future.




> +KBUILD_CFLAGS  += $(call cc-option,--allow-store-data-races,--param=allow-store-data-races=0)
>  KBUILD_CFLAGS  += $(call cc-option,-fno-allow-store-data-races)
> +endif
>

-- 
Best Regards
Masahiro Yamada
