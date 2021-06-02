Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2982D399290
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 20:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhFBSdJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 14:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhFBSdJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 14:33:09 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B492C061574
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Jun 2021 11:31:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bn21so3861956ljb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Jun 2021 11:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p/KfO5KINag1CdRXF2skRaiIKT1AFBNN76N3IG3W7uA=;
        b=Wag97yn+OZ6kHXHO21Oey36fKbEbN5Hyem0/yNLzCCwZCj8bEftGUZLycrblsgj6eQ
         g+ninXcyvE0MXnfoEE60941FbsTjIF1i7vxpXlsnHGtJGqoNmhI0ORp5epHyflSGJ63y
         KLOFUg4D93CjKV4PpWuHZioZY6yP4+gYceJY5j1sIyQ4p0KBKLF4K9Wk7NVZ6SCC//2+
         bf9hwCI/HjjdJ3fvz6fLOrYNohz0VlL7jK4jhW6mEWlH30+go6uNVoYT7CjZnISpSz06
         2D4SpnIRWWkkgLNnzktwBBrROSnb1vDbWJVAirEOoo+cCQtY6Pd65k/4EaoJ+ugZ2Q8I
         ovKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/KfO5KINag1CdRXF2skRaiIKT1AFBNN76N3IG3W7uA=;
        b=ZcKSsRlbbc92LWCS0oi0si6ytJA6a9kxbNQ/FohnNtvH+a7OIt16hIpH/Ui4Ma0Rlj
         C4cN/27kULTT4K1KWBDaejeJ5HLFhuznk9EXQEw4OtoB0e1g/rYajl/jpMMrHbZuOPn0
         O8qURjoI7iMz8rD+nyB76SC9e+n102+KXgIVnhsz1paA2DDNWksW4V7jmEoJJv7BjlP5
         LJKQ63NYHncwyAxutxRmA5RN8xO89tUDtMpMSdayMHu35sW289BPWV/Qe2bDQd68qkfL
         tuKthfDOZCqueq7RaRcz3ILUYTjTVXqnAu406Oek1NBGZJ4AQlZAuNrQfZGPGsry8tEc
         1n5g==
X-Gm-Message-State: AOAM533nicqoSQuUzGM6QTvOWXmgRqpRQ1nL17ztpdz/yGjop7BixENj
        1evoxdbd79e3l+UlmSADWxJnftvgRZFUFQRdThUhYavSHrs=
X-Google-Smtp-Source: ABdhPJyHdr/vGXM1lLSSvfQ52z9i3Kj1sVUSsoRqcVLwBC9QWdSgbGQrdOLQsGWuNN4rFSml4RfTZRRwGgAdY6ts7U0=
X-Received: by 2002:a2e:b0f2:: with SMTP id h18mr15316820ljl.244.1622658672840;
 Wed, 02 Jun 2021 11:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <26f81a61-e2eb-47e9-b6e0-3989582bb955n@googlegroups.com>
In-Reply-To: <26f81a61-e2eb-47e9-b6e0-3989582bb955n@googlegroups.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Jun 2021 11:31:01 -0700
Message-ID: <CAKwvOdmSV34MqtU+3xLSp-7gx4fnnirbsqDCenCXx=f=Tp-2tA@mail.gmail.com>
Subject: Re: Building an existing .config (provided for gcc) with clang?
To:     Mathieu Acher <mathieu.acher@gmail.com>
Cc:     Clang Built Linux <clang-built-linux@googlegroups.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 2, 2021 at 3:13 AM Mathieu Acher <mathieu.acher@gmail.com> wrote:
>
> Hi,
>
> tldr; some "fixes" seem needed to build an arbitrary .config with gcc *and* clang
>
> I'm investigating a build scenario where I already have a .config typically generated with randconfig and originally set up for building with gcc...
> And I want to use clang instead to build it.
> My experience so far is that the --syncconfig Kconfig asks me to fix some options' values
> first, to choose between INIT_STACK_NONE and INIT_STACK_ALL... and then to choose KCSAN: dynamic data race detector (KCSAN)  or not...

Hi Professor,
It's a good question, one I don't really have a satisfactory answer for.

I think it's impossible (but would love to be corrected) to reuse
exactly the same .config with two different compilers (even different
versions of the same compiler can have differences).  This is because
KConfig also encodes not just various kernel drivers and features, but
whether the toolchain supports certain features.  So you can't force
one compiler to claim to support some compiler flag, then actually use
it.  If at Kconfig time we detect the compiler has support for say a
-fsanitize= flag, we encode that in the .config, then during the
actual build just look that up in the .config and use the -fsanitze=
flag.

Probably the closest to what you're trying to do is the `olddefconfig`
make target.

>
> Two examples below, on Linux kernel 5.8.
>
> First, with tinyconfig
>
> make CC=gcc tinyconfig
> gcc --version
> gcc (Debian 10.2.1-6) 10.2.1 20210110
>
> make CC=clang-11
> scripts/kconfig/conf  --syncconfig Kconfig
> *
> * Restart config...
> *
> *
> * Memory initialization
> *
> Initialize kernel stack variables at function entry
> > 1. no automatic initialization (weakest) (INIT_STACK_NONE)
>   2. 0xAA-init everything on the stack (strongest) (INIT_STACK_ALL) (NEW)
> choice[1-2?]: 2
> Enable heap memory zeroing on allocation by default (INIT_ON_ALLOC_DEFAULT_ON) [N/y/?] n
> Enable heap memory zeroing on free by default (INIT_ON_FREE_DEFAULT_ON) [N/y/?] n
>
> and then the build proceeds...
>
> Maybe it's my setup/build environment, but I got errors:
> CC      arch/x86/events/amd/core.o
> In file included from arch/x86/events/amd/core.c:12:
> arch/x86/events/amd/../perf_event.h:854:21: error: invalid output size for constraint '=q'
>         u64 disable_mask = __this_cpu_read(cpu_hw_events.perf_ctr_virt_mask);
>                            ^
> ./include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
>         raw_cpu_read(pcp);                                              \
>         ^
> ./include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
> #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
>                                         ^
> ./include/linux/percpu-defs.h:321:23: note: expanded from macro '__pcpu_size_call_return'
>         case 1: pscr_ret__ = stem##1(variable); break;                  \
>                              ^
> <scratch space>:169:1: note: expanded from here
> raw_cpu_read_1
> ^
> ./arch/x86/include/asm/percpu.h:394:30: note: expanded from macro 'raw_cpu_read_1'
> #define raw_cpu_read_1(pcp)             percpu_from_op(, "mov", pcp)
>                                         ^
> ./arch/x86/include/asm/percpu.h:189:15: note: expanded from macro 'percpu_from_op'
>                     : "=q" (pfo_ret__)                  \
>                             ^
> In file included from arch/x86/events/amd/core.c:12:
> arch/x86/events/amd/../perf_event.h:854:21: error: invalid output size for constraint '=q'
> ./include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
>         raw_cpu_read(pcp);                                              \
>         ^
> ./include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
> #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
>                                         ^
> ./include/linux/percpu-defs.h:322:23: note: expanded from macro '__pcpu_size_call_return'
>         case 2: pscr_ret__ = stem##2(variable); break;                  \
>                              ^
> <scratch space>:174:1: note: expanded from here
> raw_cpu_read_2
> ^
> ./arch/x86/include/asm/percpu.h:395:30: note: expanded from macro 'raw_cpu_read_2'
> #define raw_cpu_read_2(pcp)             percpu_from_op(, "mov", pcp)
>                                         ^
> ./arch/x86/include/asm/percpu.h:189:15: note: expanded from macro 'percpu_from_op'
>                     : "=q" (pfo_ret__)                  \
>                             ^
> In file included from arch/x86/events/amd/core.c:12:
> arch/x86/events/amd/../perf_event.h:854:21: error: invalid output size for constraint '=q'
> ./include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
>         raw_cpu_read(pcp);                                              \
>         ^
> ./include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
> #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
>                                         ^
> ./include/linux/percpu-defs.h:323:23: note: expanded from macro '__pcpu_size_call_return'
>         case 4: pscr_ret__ = stem##4(variable); break;                  \
>                              ^
> <scratch space>:179:1: note: expanded from here
> raw_cpu_read_4
> ^
> ./arch/x86/include/asm/percpu.h:396:30: note: expanded from macro 'raw_cpu_read_4'
> #define raw_cpu_read_4(pcp)             percpu_from_op(, "mov", pcp)
>                                         ^
> ./arch/x86/include/asm/percpu.h:189:15: note: expanded from macro 'percpu_from_op'
>                     : "=q" (pfo_ret__)                  \
>                             ^
> 3 errors generated.
> make[3]: *** [scripts/Makefile.build:281: arch/x86/events/amd/core.o] Error 1
> make[2]: *** [scripts/Makefile.build:497: arch/x86/events/amd] Error 2
> make[1]: *** [scripts/Makefile.build:497: arch/x86/events] Error 2
> make: *** [Makefile:1756: arch/x86] Error 2
>
> The difference between the .config (.config with gcc vs manual "fix" of .config with clang) is as follows:
> scripts/diffconfig .config .config.old
> -CC_HAS_ASM_GOTO_OUTPUT y
> -CC_HAS_AUTO_VAR_INIT y
> -CC_HAS_KASAN_SW_TAGS y
> -CC_IS_CLANG y
> -HAVE_KCSAN_COMPILER y
> -INIT_STACK_ALL y
>  CC_VERSION_TEXT "Debian clang version 11.0.1-2" -> "gcc (Debian 10.2.1-6) 10.2.1 20210110"
>  CLANG_VERSION 110001 -> 0
>  GCC_VERSION 0 -> 100201
>  INIT_STACK_NONE n -> y
>  KASAN_STACK 0 -> 1
> +CC_IS_GCC y
>
>
> Interestingly, I've then tried:
> make CC=gcc tinyconfig
> make CC=clang-11 tinyconfig
> scripts/diffconfig .config .config.old
> -X86_PAE n
> +ARCH_ENABLE_MEMORY_HOTPLUG y
> +CRASH_DUMP n
> +DEBUG_HIGHMEM n
> +FRAME_POINTER y
> +HARDENED_USERCOPY n
> +HAVE_ALIGNED_STRUCT_PAGE y
> +HAVE_HARDENED_USERCOPY_ALLOCATOR y
> +HIGHMEM y
> +HIGHPTE n
> +SLAB_FREELIST_HARDENED n
> +SLAB_FREELIST_RANDOM n
> make
>
> and it builds nicely!
> It should be noted that the "diff" between .config is different.
>
> ==
>
> Second example, with a random configuration...
> (I can upload the .config if needs be)
>
> make randconfig # with gcc
> make CC=clang-11 # build was OK this time, manual fix seems effective
> scripts/diffconfig .config .config.old
> -CC_HAS_ASM_GOTO_OUTPUT y
> -CC_HAS_AUTO_VAR_INIT y
> -CC_HAS_KASAN_SW_TAGS y
> -CC_IS_CLANG y
> -HAVE_KCSAN_COMPILER y
> -INIT_STACK_ALL y
> -KCSAN n
>  CC_VERSION_TEXT "Debian clang version 11.0.1-2" -> "gcc (Debian 10.2.1-6) 10.2.1 20210110"
>  CLANG_VERSION 110001 -> 0
>  GCC_VERSION 0 -> 100201
>  INIT_STACK_NONE n -> y
>  KASAN_STACK 0 -> 1
>  LD_VERSION 235020000 -> 235010000
> +CC_IS_GCC y
>
> ===
>
> So my questions...
>
> Can we envision to have a generic procedure that would "fix" a .config (gcc oriented) in such a way clang can be used?
> if it's "just" taking a .config and fixing INIT_STACK and KCSAN, I'm fine :)

I think if you run `make CC=clang olddefconfig` that will reuse as
much as possible from the previous .config, no matter which toolchain
it was built with.

>
> It seems that some options are supported only by clang (and vice versa)...
> It could be useful for the fixing procedure...
> is it possible to list all such options?
>
> More generally, do you have some experiences of building an arbitrary .config with gcc and then clang?
>
> The goal is to investigate how clang may differ from gcc given a configuration (partly discussed at Plumbers https://youtu.be/FFjV9f_Ub9o?t=10761)
>
> Thanks for your help!
>
> Mathieu Acher
>
> Associate Professor
> Univ Rennes, Inria, CNRS, IRISA, France (DiverSE team)
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/26f81a61-e2eb-47e9-b6e0-3989582bb955n%40googlegroups.com.



-- 
Thanks,
~Nick Desaulniers
