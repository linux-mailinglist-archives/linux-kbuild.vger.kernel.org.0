Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C24A3992D4
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 20:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhFBSwC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 14:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhFBSwC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 14:52:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51BD461360
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Jun 2021 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622659819;
        bh=KXRvMLiPuMAQBwdv1lf2kfa5OEiQGO0KTAWMBMB0XKU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZBPRmuaFj9DyYGMISAJzPMoM1H/TFoJsHxUTtgz3fheviqcBjU3opk7JJqgzyEt5N
         YvIIQKCUUFhCEzrp40e5PSjyHgdb7tAm4jP47OTPV9HUPlC7AoxfQ/9DJ2STDDO4rV
         X+Bd5W2T6b5rFjy+A5jPoCNR7CymOnK5R9MQNbuuOJLies/Ofxzx4sZW1CgGfehHRn
         7v6gKqxWhfXhZWuTRSxCJ678B0+eeCQyzQa1XnEnK7VwNgJdtn0xyz1VyQE10StQnh
         k6CEWvaZd6dSejdB1Yqr55FbKhuqTLHRIHmqEASFBwxgk0T1+c0+T4KhvEXLL7KDSY
         bv+5ksGvDk/jA==
Received: by mail-wm1-f46.google.com with SMTP id f17so1932765wmf.2
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Jun 2021 11:50:19 -0700 (PDT)
X-Gm-Message-State: AOAM5300wqyKOA9dUw9QQPQ9ii/TiC6A1RpeJ4JIGxqR9W2XuUiwz+eL
        CLroKpSgep0nxalhDRyx33F8RKdBs1DJZk8KUa0=
X-Google-Smtp-Source: ABdhPJxklVVNOCbdezP/jdzQAs2cP25Or+U6txdLK6hhRUA+SNFOT3Iv5p4/kCS1/uBuk3JTouv+OIWpbbze+GoBUrY=
X-Received: by 2002:a1c:7210:: with SMTP id n16mr6290898wmc.75.1622659817854;
 Wed, 02 Jun 2021 11:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <26f81a61-e2eb-47e9-b6e0-3989582bb955n@googlegroups.com> <CAKwvOdmSV34MqtU+3xLSp-7gx4fnnirbsqDCenCXx=f=Tp-2tA@mail.gmail.com>
In-Reply-To: <CAKwvOdmSV34MqtU+3xLSp-7gx4fnnirbsqDCenCXx=f=Tp-2tA@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 2 Jun 2021 20:48:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1BsNEy_Jf18-oxSjU24DPwrwzeLaT7zeujdvpW0B-0Kg@mail.gmail.com>
Message-ID: <CAK8P3a1BsNEy_Jf18-oxSjU24DPwrwzeLaT7zeujdvpW0B-0Kg@mail.gmail.com>
Subject: Re: Building an existing .config (provided for gcc) with clang?
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Mathieu Acher <mathieu.acher@gmail.com>,
        Clang Built Linux <clang-built-linux@googlegroups.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 2, 2021 at 8:31 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> On Wed, Jun 2, 2021 at 3:13 AM Mathieu Acher <mathieu.acher@gmail.com> wrote:
> >
> > tldr; some "fixes" seem needed to build an arbitrary .config with gcc *and* clang
> >
> > I'm investigating a build scenario where I already have a .config typically generated with randconfig and originally set up for building with gcc...
> > And I want to use clang instead to build it.
> > My experience so far is that the --syncconfig Kconfig asks me to fix some options' values
> > first, to choose between INIT_STACK_NONE and INIT_STACK_ALL... and then to choose KCSAN: dynamic data race detector (KCSAN)  or not...
>
> Hi Professor,
> It's a good question, one I don't really have a satisfactory answer for.
>
> I think it's impossible (but would love to be corrected) to reuse
> exactly the same .config with two different compilers (even different
> versions of the same compiler can have differences).  This is because
> KConfig also encodes not just various kernel drivers and features, but
> whether the toolchain supports certain features.  So you can't force
> one compiler to claim to support some compiler flag, then actually use
> it.  If at Kconfig time we detect the compiler has support for say a
> -fsanitize= flag, we encode that in the .config, then during the
> actual build just look that up in the .config and use the -fsanitze=
> flag.
>
> Probably the closest to what you're trying to do is the `olddefconfig`
> make target.

Agreed. In particular, there is no guarantee of ABI compatibility between
kernel modules that are built in a different environment, whether that is
a different compiler (version) or different configuration.

For the purpose of build testing, it is better to run the same commands for
configuring the kernel (defconfig, tinyconfig, allmodconfig, randconfig, ...)
rather than relying on an imported .config file.

> > Two examples below, on Linux kernel 5.8.
> >
> > First, with tinyconfig
> >
> > make CC=gcc tinyconfig
> > gcc --version
> > gcc (Debian 10.2.1-6) 10.2.1 20210110
> >
> > make CC=clang-11
> > scripts/kconfig/conf  --syncconfig Kconfig

side note: when build testing, I would recommend using the '-s' flag to make
in order to have more readable output (no output on success), and using
separate object directories per target/compiler/config tuple.

> > * Restart config...
> > *
> > *
> > * Memory initialization
> > *
> > Initialize kernel stack variables at function entry
> > > 1. no automatic initialization (weakest) (INIT_STACK_NONE)
> >   2. 0xAA-init everything on the stack (strongest) (INIT_STACK_ALL) (NEW)
> > choice[1-2?]: 2
> > Enable heap memory zeroing on allocation by default (INIT_ON_ALLOC_DEFAULT_ON) [N/y/?] n
> > Enable heap memory zeroing on free by default (INIT_ON_FREE_DEFAULT_ON) [N/y/?] n
> >
> > and then the build proceeds...
> >
> > Maybe it's my setup/build environment, but I got errors:
> > CC      arch/x86/events/amd/core.o
> > In file included from arch/x86/events/amd/core.c:12:
> > arch/x86/events/amd/../perf_event.h:854:21: error: invalid output size for constraint '=q'
> >         u64 disable_mask = __this_cpu_read(cpu_hw_events.perf_ctr_virt_mask);
> >                            ^
> > ./include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
> >         raw_cpu_read(pcp);                                              \
> >         ^
> > ./include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
> > #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
> >                                         ^
> > ./include/linux/percpu-defs.h:321:23: note: expanded from macro '__pcpu_size_call_return'
> >         case 1: pscr_ret__ = stem##1(variable); break;                  \
> >                              ^

This is a known bug that has since been fixed.

> > Can we envision to have a generic procedure that would "fix" a .config (gcc oriented) in such a way clang can be used?
> > if it's "just" taking a .config and fixing INIT_STACK and KCSAN, I'm fine :)
>
> I think if you run `make CC=clang olddefconfig` that will reuse as
> much as possible from the previous .config, no matter which toolchain
> it was built with.

Yes, this should always result in a clean kernel build, if it does
not, that is a bug
we have to fix.

However, this does not necessarily result in the intended kernel: a 'tinyconfig'
may be larger, and an 'allmodconfig' or 'randconfig' may produce less build
coverage because it builds only the common subset of the available options.


> -CC_HAS_ASM_GOTO_OUTPUT y

This was added in gcc-11

> -CC_HAS_AUTO_VAR_INIT y
> -CC_HAS_KASAN_SW_TAGS y
> -INIT_STACK_ALL y
>  INIT_STACK_NONE n -> y
> -HAVE_KCSAN_COMPILER y
> -KCSAN n
These depend on the compiler version as well as the target architecture

> -CC_IS_CLANG y
> +CC_IS_GCC y
>  CC_VERSION_TEXT "Debian clang version 11.0.1-2" -> "gcc (Debian 10.2.1-6) 10.2.1 20210110"
>  CLANG_VERSION 110001 -> 0
>  GCC_VERSION 0 -> 100201

These are obviously unavoidable

>  LD_VERSION 235020000 -> 235010000

This one could be avoided by using the same binutils

>  KASAN_STACK 0 -> 1

This is a workaround for known problems in some compilers

       Arnd
