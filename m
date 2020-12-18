Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEEF2DE089
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 10:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389021AbgLRJov (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 04:44:51 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:34447 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgLRJov (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 04:44:51 -0500
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0BI9hnaF028988;
        Fri, 18 Dec 2020 18:43:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0BI9hnaF028988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608284630;
        bh=alQmUM5+tWJqBj5AGDAC6yCMV4c4CFP866srY1VNulo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uW4s18H/citZM+QfCrscS8WfmMi/Mn4nct5x80/L9fR1m/GWAz3ZEpIJAyXvWBMVw
         F7xYudp8f+khjxr5Pi4qKWlTBzCqmuQHVQeY8hdJCKynAY2+IQ/W4zrpebm3IdkSJC
         1ydLE4+FxHBqvW64Mc/tCRBSgjRbH1T7tpGl9EJeYGM7NtaR62IAyC6MLL8UTpgWjk
         yLnUIGKDC77pA5qEHCUFcJt0ikL0mZJa/oYcOPdvaEpTt4P8IDChI0Wq/mL7yUQh94
         2WWzhahUkHIpKsrcJqLbn0rCBWpWnLboLhZjgBmFQ61I7VOPgaof3PhlljEubwki1k
         1cDlqJgIB1/kw==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id w6so1235918pfu.1;
        Fri, 18 Dec 2020 01:43:50 -0800 (PST)
X-Gm-Message-State: AOAM532SOnYrZ1bLpARS0aONbyyjNZzXdn6Cwsz0WEigWHfh/HDUnZXv
        1Yucjq41FYQbSl4ymbxcx9VFq5q20mIJhRGN5yM=
X-Google-Smtp-Source: ABdhPJxhOqKe4b7iWEFn5mk6GAS2pz/7Os/zKCbpu4MrKTP1oYIv1m0VhMMQWsllL5LQ9mgudsNp7eeM2e/87DkdZO4=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr3370270pgu.175.1608284629399;
 Fri, 18 Dec 2020 01:43:49 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a@eucas1p1.samsung.com>
 <20201203125700.161354-1-masahiroy@kernel.org> <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
In-Reply-To: <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 18 Dec 2020 18:43:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
Message-ID: <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 18, 2020 at 4:58 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi,
>
> On 03.12.2020 13:57, Masahiro Yamada wrote:
> > Linus pointed out a third of the time in the Kconfig parse stage comes
> > from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
> > and directly testing plugin-version.h for existence cuts down the
> > overhead a lot. [2]
> >
> > This commit takes one step further to kill the build test entirely.
> >
> > The small piece of code was probably intended to test the C++ designated
> > initializer, which was not supported until C++20.
> >
> > In fact, with -pedantic option given, both GCC and Clang emit a warning.
> >
> > $ echo 'class test { public: int test; } test = { .test = 1 };' | g++ -x c++ -pedantic - -fsyntax-only
> > <stdin>:1:43: warning: C++ designated initializers only available with '-std=c++2a' or '-std=gnu++2a' [-Wpedantic]
> > $ echo 'class test { public: int test; } test = { .test = 1 };' | clang++ -x c++ -pedantic - -fsyntax-only
> > <stdin>:1:43: warning: designated initializers are a C++20 extension [-Wc++20-designator]
> > class test { public: int test; } test = { .test = 1 };
> >                                            ^
> > 1 warning generated.
> >
> > Otherwise, modern C++ compilers should be able to build the code, and
> > hopefully skipping this test should not make any practical problem.
> >
> > Checking the existence of plugin-version.h is still needed to ensure
> > the plugin-dev package is installed. The test code is now small enough
> > to be embedded in scripts/gcc-plugins/Kconfig.
> >
> > [1] https://lore.kernel.org/lkml/CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com/
> > [2] https://lore.kernel.org/lkml/CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com/
> >
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> This patch landed in linux next-20201217 as commit 1e860048c53e
> ("gcc-plugins: simplify GCC plugin-dev capability test").
>
> It causes a build break with my tests setup, but I'm not sure weather it
> is really an issue of this commit or a toolchain I use. However I've
> checked various versions of the gcc cross-compilers released by Linaro
> at https://releases.linaro.org/components/toolchain/binaries/ and all
> fails with the same error:
>
> $ make ARCH=arm
> CROSS_COMPILE=../../cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/arm-none-eabi-
> zImage
>    HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
> In file included from
> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/gcc-plugin.h:28:0,
>                   from scripts/gcc-plugins/gcc-common.h:7,
>                   from scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/system.h:687:10:
> fatal error: gmp.h: No such file or directory
>   #include <gmp.h>
>            ^~~~~~~
> compilation terminated.
> scripts/gcc-plugins/Makefile:47: recipe for target
> 'scripts/gcc-plugins/arm_ssp_per_task_plugin.so' failed
> make[2]: *** [scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Error 1
> scripts/Makefile.build:496: recipe for target 'scripts/gcc-plugins' failed
> make[1]: *** [scripts/gcc-plugins] Error 2
> Makefile:1190: recipe for target 'scripts' failed
> make: *** [scripts] Error 2
>
> Compilation works if I use the cross-gcc provided by
> gcc-7-arm-linux-gnueabi/gcc-arm-linux-gnueabi Ubuntu packages, which is:
>
> $ arm-linux-gnueabi-gcc --version
> arm-linux-gnueabi-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
>
> Best regards
>
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>


I can compile gcc-plugins with Linaro toolchians.

The version of mine is this:

masahiro@oscar:~/ref/linux-next$
~/tools/arm-linaro-7.5/bin/arm-linux-gnueabihf-gcc --version
arm-linux-gnueabihf-gcc (Linaro GCC 7.5-2019.12) 7.5.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.




Maybe, it depends on the host environment?


Please try this:

$ sudo apt install libgmp-dev



-- 
Best Regards
Masahiro Yamada
