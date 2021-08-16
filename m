Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF313EDD2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 20:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhHPSiL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 14:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbhHPSiI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 14:38:08 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E9D1C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:37:36 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a7so28648614ljq.11
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XndSTNBGC/OVGDPTeJO5zkDBc6MmDsbiG3f/bm1ches=;
        b=clzrAfCZGa3epa+0RLcPiQ4pi+6Gx2p6G43vR036knzDySj2wP8xKyxaBq39YlRTzJ
         3pEBUaA80Qkoy/SavugPvt70guj0agCPXW5EDqiYtBqYIcdla6Ma9fTVrlaSjb6u8IDo
         HG4VZ7AfeXb4XRWmn05hGtvmg0u+J9+hAWrWbtb0O7MYdJApBjCzf8MgsGP4iByf24qv
         ftePr9bpnqdl0nuwour04fZa2b0LQ11bRt83wgbjaryUH6o1ALB9eS7Qi4ZUySBEYHCq
         3s8wCUv9obZhqu0uIs7r0jhmI1w9ALjMbjG0YIG4xEdjxg8ldHHmXIM2JEv8c1fmATVN
         jazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XndSTNBGC/OVGDPTeJO5zkDBc6MmDsbiG3f/bm1ches=;
        b=S4/pmCqcqAmJMKF9Nzcl0j1dIcR9lT3hOI8+Fscwak3ZhgHMaFCfjHnQvT26EfhjUr
         apBGA3rs2ws60KLr39XMrHz3PjP9A41PkeiMDUn6xd9ZB7GRjutkKeCnxFWhdEyvZfru
         /eyY1QAWXhTiPSZ3kCeBzhDdO24OuB7T3YYg9Q8WuCQA0drDh1HK9YysmL3uShE31VKW
         GXsMcq67iarF0Kax8oXF289A4JWimFTD91WTyHN5f2eikm30/BQrJ+uWBVroz9v5i31J
         PQGcJbppSRrC0rcUdMHM9IDc/cgaSgHdxiyiA7niDcrWNLBvrImnFDYGcwbgwHT4J5CV
         5XyA==
X-Gm-Message-State: AOAM5325Ixs9WYYsyzjo3OOMc/uWoWPPgEyNNqirvubl0qj8ExiWcFN9
        y4TMkVWrYIzJTnPWnf75zIdAtBnzER2SZBSiZ1H4Bw==
X-Google-Smtp-Source: ABdhPJxWq2tjkwNatdZ+tDOMdg4OI7qWWNlv0xhJqOSWsL1yWF0cClzplPmteJay2aA3uBLdV47tklHjELuhCZD47Y4=
X-Received: by 2002:a2e:9ec1:: with SMTP id h1mr48136ljk.0.1629139054576; Mon,
 16 Aug 2021 11:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210810204240.4008685-1-ndesaulniers@google.com> <CA+G9fYtPBp_-Ko_P7NuOX6vN9-66rjJuBt21h3arrLqEaQQn6w@mail.gmail.com>
In-Reply-To: <CA+G9fYtPBp_-Ko_P7NuOX6vN9-66rjJuBt21h3arrLqEaQQn6w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Aug 2021 11:37:23 -0700
Message-ID: <CAKwvOdkckey1=VUHApTcJYufyhdRJ=jb4qYs52f59g6ha7qphw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        linux-kbuild@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 14, 2021 at 4:02 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> On Wed, 11 Aug 2021 at 02:12, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > cc-option, cc-option-yn, and cc-disable-warning all invoke the compiler
> > during build time, and can slow down the build when these checks become
> > stale for our supported compilers, whose minimally supported versions
> > increases over time. See Documentation/process/changes.rst for the
> > current supported minimal versions (GCC 4.9+, clang 10.0.1+). Compiler
> > version support for these flags may be verified on godbolt.org.
> >
> > The following flags are GCC only and supported since at least GCC 4.9.
> > Remove cc-option and cc-disable-warning tests.
> > * -fno-tree-loop-im
> > * -Wno-maybe-uninitialized
> > * -fno-reorder-blocks
> > * -fno-ipa-cp-clone
> > * -fno-partial-inlining
> > * -femit-struct-debug-baseonly
> > * -fno-inline-functions-called-once
> > * -fconserve-stack
> >
> > The following flags are supported by all supported versions of GCC and
> > Clang. Remove their cc-option, cc-option-yn, and cc-disable-warning tests.
> > * -fno-delete-null-pointer-checks
> > * -fno-var-tracking
> > * -mfentry
> > * -Wno-array-bounds
> >
> > The following configs are made dependent on GCC, since they use GCC
> > specific flags.
> > * READABLE_ASM
> > * DEBUG_SECTION_MISMATCH
> >
> > --param=allow-store-data-races=0 was renamed to --allow-store-data-races
> > in the GCC 10 release.
>
> [Please ignore this if it is already reported]
>
> Linux next 20210813 tag s390 build failed with gcc-8 but pass with
> gcc-9 and gcc-10.
>
>  s390 (defconfig) with gcc-8 FAILED
>  s390 (defconfig) with gcc-9 PASS
>  s390 (defconfig) with gcc-10 PASS

Thanks for the report. Andrew has dropped the patch from mm-next.
Looks like it's too soon to remove build configuration tests for
-mfentry.

>
> Build error:
> -----------
> s390x-linux-gnu-gcc: error: unrecognized command line option
> '-mfentry'; did you mean '--entry'?
> make[2]: *** [/builds/linux/scripts/Makefile.build:272:
> scripts/mod/empty.o] Error 1
> s390x-linux-gnu-gcc: error: unrecognized command line option
> '-mfentry'; did you mean '--entry'?
> make[2]: *** [/builds/linux/scripts/Makefile.build:118:
> scripts/mod/devicetable-offsets.s] Error 1
> make[2]: Target '__build' not remade because of errors.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build log,
> https://builds.tuxbuild.com/1wfNcaYbsp29k3RvYuPXzxrM4vs/
>
> metadata:
> --------
>     git_describe: next-20210813
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_short_log: 4b358aabb93a (\Add linux-next specific files for 20210813\)
>     target_arch: s390
>     toolchain: gcc-8
>
>
> Steps to reproduce:
> -------------------
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
>
>
> tuxmake --runtime podman --target-arch s390 --toolchain gcc-8
> --kconfig defconfig
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CA%2BG9fYtPBp_-Ko_P7NuOX6vN9-66rjJuBt21h3arrLqEaQQn6w%40mail.gmail.com.



-- 
Thanks,
~Nick Desaulniers
