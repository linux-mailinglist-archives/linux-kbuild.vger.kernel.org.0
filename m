Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3D12F21A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 22:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbhAKVSq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 16:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727525AbhAKVSp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 16:18:45 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93A6C06179F
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 13:18:04 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id p12so293486pju.5
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 13:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0qOSbOIoHdN2DZPTqNutcK6F4X/pENnDZjQfdlW5H0c=;
        b=j2/sB7/RU5nL76Pa1L1dp1gCmPW9RtgnhlOkU9CiPL/vgEu0AzN3MnegQM25nqbFZO
         GdzCzXY3KfqY40y9YoRy4JUZ/j60yRTN/7zwg7Uo3PdHlEJS7blWtkjbjnUjohiO+2i5
         HxQ6qaRIV8v12rY/kSwUVK9q2Vd9+FdUTrxewc2nzJ0P1GV2EVo+ansDYxAFpMBtk14/
         NwBf5ewSGbABgg5tXfSizs6Hsx00LlHf8+58gz3epX9LGeFudhkSvXxU59RoDpeIowwK
         uKu61pD7h2broKNQKMpLvxQqdRr4+avLzxtK4epTmhvB//XOnXGXuNuwFI8WOewkw7hy
         OLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0qOSbOIoHdN2DZPTqNutcK6F4X/pENnDZjQfdlW5H0c=;
        b=lfCIVwPVdJTVIT31xbaa4YSmLSYTWlKvMQc9wLLHiarJg2lYTRHvrzfA7papHeT3cK
         rfRhPaa83/Tb5q9HDbqZvA36XSi9jB/gvTyvDQCDH9ONxwFcD7puvTzRG6xg/6gTE9DX
         FK688ryHDrCfDNTt4DI/3v9sSI3EXKeR0PCVekLj142om+Nax8R/9TFl0Y8kIsAa+FE6
         25B1G/Rj0ojUL81DNp2KgBhMxTgwbZRN5cwqi0ywgKNGp+CoI+RKJvED7zs3t2JmsZEj
         rnejRV9zhb42K/WKeHi9ROqiobD3/XIBglMH6+OOIlCOyNFwVbY8neadSGgnSwvFXWbA
         +1qg==
X-Gm-Message-State: AOAM5313SzdHnnyOa/sguAgVU8xuji1tZdDGEk4RmQEuSjEYFr4KE7qn
        8IhtzIztwf2KnHQt7aQYrr+9mOr+LeupVsX0T0NU/A==
X-Google-Smtp-Source: ABdhPJyYZpgnU/gvEartMbBN+7Sn5P8XKvPTxtPvXdocg5hO3oXk45vtvgeULsI39ZYVL2M1L1TiMCvHdHZ/Z9j7/pg=
X-Received: by 2002:a17:90a:cb0b:: with SMTP id z11mr786374pjt.101.1610399884135;
 Mon, 11 Jan 2021 13:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210111210418.GA3660906@ubuntu-m3-large-x86>
In-Reply-To: <20210111210418.GA3660906@ubuntu-m3-large-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 11 Jan 2021 13:17:52 -0800
Message-ID: <CAKwvOdnssY=CV4daRQvGa659AzGvMT+Kb10g5-DDuZjqbp-J5A@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 11, 2021 at 1:04 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 12:18:21AM -0800, Bill Wendling wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > profile, the kernel is instrumented with PGO counters, a representative
> > workload is run, and the raw profile data is collected from
> > /sys/kernel/debug/pgo/profraw.
> >
> > The raw profile data must be processed by clang's "llvm-profdata" tool before
> > it can be used during recompilation:
> >
> >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> >
> > Multiple raw profiles may be merged during this step.
> >
> > The data can be used either by the compiler if LTO isn't enabled:
> >
> >     ... -fprofile-use=vmlinux.profdata ...
> >
> > or by LLD if LTO is enabled:
> >
> >     ... -lto-cs-profile-file=vmlinux.profdata ...
> >
> > This initial submission is restricted to x86, as that's the platform we know
> > works. This restriction can be lifted once other platforms have been verified
> > to work with PGO.
> >
> > Note that this method of profiling the kernel is clang-native and isn't
> > compatible with clang's gcov support in kernel/gcov.
> >
> > [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Co-developed-by: Bill Wendling <morbo@google.com>
> > Signed-off-by: Bill Wendling <morbo@google.com>
>
> I took this for a spin against x86_64_defconfig and ran into two issues:
>
> 1. https://github.com/ClangBuiltLinux/linux/issues/1252

"Cannot split an edge from a CallBrInst"
Looks like that should be fixed first, then we should gate this
feature on clang-12.

>
>    There is also one in drivers/gpu/drm/i915/i915_query.c. For the time
>    being, I added PGO_PROFILE_... := n for those two files.
>
> 2. After doing that, I run into an undefined function error with ld.lld.
>
> How I tested:
>
> $ make -skj"$(nproc)" LLVM=1 defconfig
>
> $ scripts/config -e PGO_CLANG
>
> $ make -skj"$(nproc)" LLVM=1 olddefconfig vmlinux all
> ld.lld: error: undefined symbol: __llvm_profile_instrument_memop

Err...that seems like it should be implemented in
kernel/pgo/instrument.c in this patch in a v2?

> >>> referenced by head64.c
> >>>               arch/x86/kernel/head64.o:(__early_make_pgtable)
> >>> referenced by head64.c
> >>>               arch/x86/kernel/head64.o:(x86_64_start_kernel)
> >>> referenced by head64.c
> >>>               arch/x86/kernel/head64.o:(copy_bootdata)
> >>> referenced 2259 more times
>
> Local diff:
>
> diff --git a/drivers/char/Makefile b/drivers/char/Makefile
> index ffce287ef415..4b2f238770b5 100644
> --- a/drivers/char/Makefile
> +++ b/drivers/char/Makefile
> @@ -4,6 +4,7 @@
>  #
>
>  obj-y                          += mem.o random.o
> +PGO_PROFILE_random.o           := n
>  obj-$(CONFIG_TTY_PRINTK)       += ttyprintk.o
>  obj-y                          += misc.o
>  obj-$(CONFIG_ATARI_DSP56K)     += dsp56k.o
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index e5574e506a5c..d83cacc79b1a 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -168,6 +168,7 @@ i915-y += \
>           i915_vma.o \
>           intel_region_lmem.o \
>           intel_wopcm.o
> +PGO_PROFILE_i915_query.o := n
>
>  # general-purpose microcontroller (GuC) support
>  i915-y += gt/uc/intel_uc.o \

I'd rather have these both sorted out before landing with PGO disabled
on these files.

-- 
Thanks,
~Nick Desaulniers
