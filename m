Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3788A2DE629
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 16:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731382AbgLRPD6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 10:03:58 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:8220 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731531AbgLRPD5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 10:03:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fdcc4b40001>; Fri, 18 Dec 2020 07:03:16 -0800
Received: from [10.26.73.104] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec
 2020 15:03:09 +0000
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        <linux-hardening@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <CGME20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a@eucas1p1.samsung.com>
 <20201203125700.161354-1-masahiroy@kernel.org>
 <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
 <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
 <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
Date:   Fri, 18 Dec 2020 15:03:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1608303796; bh=i2gqYFm8Es9As6zex1py1RDeyxb0UIj49IrIjubjQnA=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=iczPNr/KjI/Oz8oLjaL78LiLPDQ/RO5BMegfEKhPALNn/bYVQ/pfdNrJl9zUOGKmO
         6hQtceyyfG8fx/eDxrJueUkdNrrThvMrT4hRVge7jDVa5AvZkA6mDnAXWkdQaNsVa+
         y0lZtGLrWzgDuZoXdqTz/4AhBG/a4Q46qCRK+aaBfCN+CHf0ROKaJtLuOF1uWn/2p0
         YXrxNnEgaDxDwLRRfEO3/+imIxr+bGMINBPzlh1qhAU/GehUHt+lgKV6Pj8f7Ep0Uv
         c6cpp0EtRuMDIpTOlewQmhpTVkh7l5MvIVE3XzIX2mPk70AtqHsdU+PvUdTthA2rJJ
         sEggiq2y3ihMw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 18/12/2020 10:05, Marek Szyprowski wrote:
> On 18.12.2020 10:43, Masahiro Yamada wrote:
>> On Fri, Dec 18, 2020 at 4:58 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 03.12.2020 13:57, Masahiro Yamada wrote:
>>>> Linus pointed out a third of the time in the Kconfig parse stage comes
>>>> from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
>>>> and directly testing plugin-version.h for existence cuts down the
>>>> overhead a lot. [2]
>>>>
>>>> This commit takes one step further to kill the build test entirely.
>>>>
>>>> The small piece of code was probably intended to test the C++ designated
>>>> initializer, which was not supported until C++20.
>>>>
>>>> In fact, with -pedantic option given, both GCC and Clang emit a warning.
>>>>
>>>> $ echo 'class test { public: int test; } test = { .test = 1 };' | g++ -x c++ -pedantic - -fsyntax-only
>>>> <stdin>:1:43: warning: C++ designated initializers only available with '-std=c++2a' or '-std=gnu++2a' [-Wpedantic]
>>>> $ echo 'class test { public: int test; } test = { .test = 1 };' | clang++ -x c++ -pedantic - -fsyntax-only
>>>> <stdin>:1:43: warning: designated initializers are a C++20 extension [-Wc++20-designator]
>>>> class test { public: int test; } test = { .test = 1 };
>>>>                                             ^
>>>> 1 warning generated.
>>>>
>>>> Otherwise, modern C++ compilers should be able to build the code, and
>>>> hopefully skipping this test should not make any practical problem.
>>>>
>>>> Checking the existence of plugin-version.h is still needed to ensure
>>>> the plugin-dev package is installed. The test code is now small enough
>>>> to be embedded in scripts/gcc-plugins/Kconfig.
>>>>
>>>> [1] https://protect2.fireeye.com/v1/url?k=03db90e1-5c40a828-03da1bae-0cc47a336fae-4cc36f5830aeb78d&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ%40mail.gmail.com%2F
>>>> [2] https://protect2.fireeye.com/v1/url?k=965b670a-c9c05fc3-965aec45-0cc47a336fae-e34339513ff747c0&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwhK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig%3D%2Bvnw%40mail.gmail.com%2F
>>>>
>>>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>> This patch landed in linux next-20201217 as commit 1e860048c53e
>>> ("gcc-plugins: simplify GCC plugin-dev capability test").
>>>
>>> It causes a build break with my tests setup, but I'm not sure weather it
>>> is really an issue of this commit or a toolchain I use. However I've
>>> checked various versions of the gcc cross-compilers released by Linaro
>>> at https://protect2.fireeye.com/v1/url?k=053727b6-5aac1f7f-0536acf9-0cc47a336fae-5bd799e7ce6b1b9b&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Freleases.linaro.org%2Fcomponents%2Ftoolchain%2Fbinaries%2F and all
>>> fails with the same error:
>>>
>>> $ make ARCH=arm
>>> CROSS_COMPILE=../../cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/arm-none-eabi-
>>> zImage
>>>     HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
>>> In file included from
>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/gcc-plugin.h:28:0,
>>>                    from scripts/gcc-plugins/gcc-common.h:7,
>>>                    from scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/system.h:687:10:
>>> fatal error: gmp.h: No such file or directory
>>>    #include <gmp.h>
>>>             ^~~~~~~
>>> compilation terminated.
>>> scripts/gcc-plugins/Makefile:47: recipe for target
>>> 'scripts/gcc-plugins/arm_ssp_per_task_plugin.so' failed
>>> make[2]: *** [scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Error 1
>>> scripts/Makefile.build:496: recipe for target 'scripts/gcc-plugins' failed
>>> make[1]: *** [scripts/gcc-plugins] Error 2
>>> Makefile:1190: recipe for target 'scripts' failed
>>> make: *** [scripts] Error 2
>>>
>>> Compilation works if I use the cross-gcc provided by
>>> gcc-7-arm-linux-gnueabi/gcc-arm-linux-gnueabi Ubuntu packages, which is:
>>>
>>> $ arm-linux-gnueabi-gcc --version
>>> arm-linux-gnueabi-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
>>>
>>
>> I can compile gcc-plugins with Linaro toolchians.
>>
>> The version of mine is this:
>>
>> masahiro@oscar:~/ref/linux-next$
>> ~/tools/arm-linaro-7.5/bin/arm-linux-gnueabihf-gcc --version
>> arm-linux-gnueabihf-gcc (Linaro GCC 7.5-2019.12) 7.5.0
>> Copyright (C) 2017 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.  There is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>
>>
>>
>>
>> Maybe, it depends on the host environment?
>>
>>
>> Please try this:
>>
>> $ sudo apt install libgmp-dev
> 
> Indeed, it was missing on my setup. Sorry for the noise.


So this change also breaks the build on our farm build machines and
while we can request that packages are installed on these machines, it
takes time. Is there anyway to avoid this?

Cheers
Jon

-- 
nvpublic
