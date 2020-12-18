Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3AE2DE6E0
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 16:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgLRPod (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 10:44:33 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52737 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgLRPod (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 10:44:33 -0500
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0BIFhVX6002358;
        Sat, 19 Dec 2020 00:43:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0BIFhVX6002358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608306212;
        bh=epnuC2GrrnX/tctb0pjbgEu0p6DNG4x3M6lhcUKMF84=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I9I362EvTJ5ekuAzzcwU1otHzeG1cnY/UWVFVokD/xKgHAL2brnE8M1IbthsxDv/Z
         JvFeiVXR871+U3Rm0z4VGqpL7YDGWQi9CBhzO3+VIJqtoFLMMF9jj1KFWj6x6kulYz
         Askr1UL769OpkC41hQPO7/pCMNAsa1hEax34zf86/oWUiwSK6hFYNs/x7Fcf1TdOaq
         IAuYKjrAbpJVgnutcidojieaAuMHONZyVT/hYSm1omnc7R7pfSFPi0fDXlF6KYu3no
         ZNK87cMIwBN4rG+zZqZCUcxEXXV42XU6csaS2kYXCiSjLkkCqm9XjzlqhWb6AsXKxF
         oZp+7nzoYGnyQ==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id n7so1564170pgg.2;
        Fri, 18 Dec 2020 07:43:31 -0800 (PST)
X-Gm-Message-State: AOAM532lF4G7URpDajVwws+rfX54FtPsKG3haQUCmUefxZWPmCCDKqMA
        g/XOto8i6M+u1J/XQdnZ5H8Vlz3xFK/TPhTBiIQ=
X-Google-Smtp-Source: ABdhPJxBr4YZioNIVBwKffC+Zz7sroi6t3rssL3Rbm64MtBtIdQBeJ0LWP/TUDGyZvJ5uMAAoEz8QoIAnSsUVr8vHJw=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr4644370pgu.175.1608306210700;
 Fri, 18 Dec 2020 07:43:30 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a@eucas1p1.samsung.com>
 <20201203125700.161354-1-masahiroy@kernel.org> <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
 <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
 <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com> <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
 <25030057-86b1-5619-25fd-acfa0728b850@samsung.com> <4ab4f62f-8b37-01e1-f81c-270155b13a51@nvidia.com>
 <7e691a61-bf4b-0594-8d6d-36d62a5def0b@nvidia.com>
In-Reply-To: <7e691a61-bf4b-0594-8d6d-36d62a5def0b@nvidia.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 19 Dec 2020 00:42:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6pzMGm=L9389Xtfghjfjr_wDqRntZC2XqP3JDQuhLhQ@mail.gmail.com>
Message-ID: <CAK7LNAQ6pzMGm=L9389Xtfghjfjr_wDqRntZC2XqP3JDQuhLhQ@mail.gmail.com>
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Dec 19, 2020 at 12:33 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
>
> On 18/12/2020 15:12, Jon Hunter wrote:
> >
> > On 18/12/2020 15:09, Marek Szyprowski wrote:
> >>
> >> On 18.12.2020 16:03, Jon Hunter wrote:
> >>> On 18/12/2020 10:05, Marek Szyprowski wrote:
> >>>> On 18.12.2020 10:43, Masahiro Yamada wrote:
> >>>>> On Fri, Dec 18, 2020 at 4:58 PM Marek Szyprowski
> >>>>> <m.szyprowski@samsung.com> wrote:
> >>>>>> On 03.12.2020 13:57, Masahiro Yamada wrote:
> >>>>>>> Linus pointed out a third of the time in the Kconfig parse stage =
comes
> >>>>>>> from the single invocation of cc1plus in scripts/gcc-plugin.sh [1=
],
> >>>>>>> and directly testing plugin-version.h for existence cuts down the
> >>>>>>> overhead a lot. [2]
> >>>>>>>
> >>>>>>> This commit takes one step further to kill the build test entirel=
y.
> >>>>>>>
> >>>>>>> The small piece of code was probably intended to test the C++ des=
ignated
> >>>>>>> initializer, which was not supported until C++20.
> >>>>>>>
> >>>>>>> In fact, with -pedantic option given, both GCC and Clang emit a w=
arning.
> >>>>>>>
> >>>>>>> $ echo 'class test { public: int test; } test =3D { .test =3D 1 }=
;' | g++ -x c++ -pedantic - -fsyntax-only
> >>>>>>> <stdin>:1:43: warning: C++ designated initializers only available=
 with '-std=3Dc++2a' or '-std=3Dgnu++2a' [-Wpedantic]
> >>>>>>> $ echo 'class test { public: int test; } test =3D { .test =3D 1 }=
;' | clang++ -x c++ -pedantic - -fsyntax-only
> >>>>>>> <stdin>:1:43: warning: designated initializers are a C++20 extens=
ion [-Wc++20-designator]
> >>>>>>> class test { public: int test; } test =3D { .test =3D 1 };
> >>>>>>>                                              ^
> >>>>>>> 1 warning generated.
> >>>>>>>
> >>>>>>> Otherwise, modern C++ compilers should be able to build the code,=
 and
> >>>>>>> hopefully skipping this test should not make any practical proble=
m.
> >>>>>>>
> >>>>>>> Checking the existence of plugin-version.h is still needed to ens=
ure
> >>>>>>> the plugin-dev package is installed. The test code is now small e=
nough
> >>>>>>> to be embedded in scripts/gcc-plugins/Kconfig.
> >>>>>>>
> >>>>>>> [1] https://protect2.fireeye.com/v1/url?k=3D03db90e1-5c40a828-03d=
a1bae-0cc47a336fae-4cc36f5830aeb78d&q=3D1&e=3Ddfdc1cf9-82d6-4ca5-b35d-1782e=
918bde3&u=3Dhttps%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwjU4DCuwQ4pXshRb=
wDCUQB31ScaeuDo1tjoZ0_PjhLHzQ%40mail.gmail.com%2F
> >>>>>>> [2] https://protect2.fireeye.com/v1/url?k=3D965b670a-c9c05fc3-965=
aec45-0cc47a336fae-e34339513ff747c0&q=3D1&e=3Ddfdc1cf9-82d6-4ca5-b35d-1782e=
918bde3&u=3Dhttps%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwhK0aQxs6Q5ijJmY=
F1n2ch8cVFSUzU5yUM_HOjig%3D%2Bvnw%40mail.gmail.com%2F
> >>>>>>>
> >>>>>>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> >>>>>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >>>>>> This patch landed in linux next-20201217 as commit 1e860048c53e
> >>>>>> ("gcc-plugins: simplify GCC plugin-dev capability test").
> >>>>>>
> >>>>>> It causes a build break with my tests setup, but I'm not sure weat=
her it
> >>>>>> is really an issue of this commit or a toolchain I use. However I'=
ve
> >>>>>> checked various versions of the gcc cross-compilers released by Li=
naro
> >>>>>> at https://protect2.fireeye.com/v1/url?k=3D053727b6-5aac1f7f-0536a=
cf9-0cc47a336fae-5bd799e7ce6b1b9b&q=3D1&e=3Ddfdc1cf9-82d6-4ca5-b35d-1782e91=
8bde3&u=3Dhttps%3A%2F%2Freleases.linaro.org%2Fcomponents%2Ftoolchain%2Fbina=
ries%2F and all
> >>>>>> fails with the same error:
> >>>>>>
> >>>>>> $ make ARCH=3Darm
> >>>>>> CROSS_COMPILE=3D../../cross/gcc-arm-10.2-2020.11-x86_64-arm-none-e=
abi/bin/arm-none-eabi-
> >>>>>> zImage
> >>>>>>      HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
> >>>>>> In file included from
> >>>>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi=
/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/gcc-plugin.h:28:0,
> >>>>>>                     from scripts/gcc-plugins/gcc-common.h:7,
> >>>>>>                     from scripts/gcc-plugins/arm_ssp_per_task_plug=
in.c:3:
> >>>>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi=
/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/system.h:687:10:
> >>>>>> fatal error: gmp.h: No such file or directory
> >>>>>>     #include <gmp.h>
> >>>>>>              ^~~~~~~
> >>>>>> compilation terminated.
> >>>>>> scripts/gcc-plugins/Makefile:47: recipe for target
> >>>>>> 'scripts/gcc-plugins/arm_ssp_per_task_plugin.so' failed
> >>>>>> make[2]: *** [scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Erro=
r 1
> >>>>>> scripts/Makefile.build:496: recipe for target 'scripts/gcc-plugins=
' failed
> >>>>>> make[1]: *** [scripts/gcc-plugins] Error 2
> >>>>>> Makefile:1190: recipe for target 'scripts' failed
> >>>>>> make: *** [scripts] Error 2
> >>>>>>
> >>>>>> Compilation works if I use the cross-gcc provided by
> >>>>>> gcc-7-arm-linux-gnueabi/gcc-arm-linux-gnueabi Ubuntu packages, whi=
ch is:
> >>>>>>
> >>>>>> $ arm-linux-gnueabi-gcc --version
> >>>>>> arm-linux-gnueabi-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
> >>>>>>
> >>>>> I can compile gcc-plugins with Linaro toolchians.
> >>>>>
> >>>>> The version of mine is this:
> >>>>>
> >>>>> masahiro@oscar:~/ref/linux-next$
> >>>>> ~/tools/arm-linaro-7.5/bin/arm-linux-gnueabihf-gcc --version
> >>>>> arm-linux-gnueabihf-gcc (Linaro GCC 7.5-2019.12) 7.5.0
> >>>>> Copyright (C) 2017 Free Software Foundation, Inc.
> >>>>> This is free software; see the source for copying conditions.  Ther=
e is NO
> >>>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR =
PURPOSE.
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>> Maybe, it depends on the host environment?
> >>>>>
> >>>>>
> >>>>> Please try this:
> >>>>>
> >>>>> $ sudo apt install libgmp-dev
> >>>> Indeed, it was missing on my setup. Sorry for the noise.
> >>>
> >>> So this change also breaks the build on our farm build machines and
> >>> while we can request that packages are installed on these machines, i=
t
> >>> takes time. Is there anyway to avoid this?
> >>
> >> You can temporarily revert 1e860048c53e (this patch).
> >
> >
> > Again that works locally, but these automated builders just pull the
> > latest -next branch and build.
>
>
> However, if you are saying that this is a problem/bug with our builders,
> then of course we will have to get this fixed.
>


Yes, please do so.


Kconfig evaluates $(CC) capabilities, and
hides CONFIG options it cannot support.


In contrast, we do not do that for $(HOSTCC)
capabilities because it is just a matter of some
missing packages.


For example, if you enable CONFIG_SYSTEM_TRUSTED_KEYRING
and fail to build scripts/extrace-cert.c
due to missing <openssl/bio.h>,
you need to install the openssl dev package.

It is the same pattern.


--=20
Best Regards
Masahiro Yamada
