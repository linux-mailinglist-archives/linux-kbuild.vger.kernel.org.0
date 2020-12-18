Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F942DE0B8
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 11:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgLRKGX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 05:06:23 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:56736 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgLRKGW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 05:06:22 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201218100528euoutp020a5357204f305a3baaca1c42b9fdbe2e~Rx4fbj-_d0528705287euoutp02D
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Dec 2020 10:05:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201218100528euoutp020a5357204f305a3baaca1c42b9fdbe2e~Rx4fbj-_d0528705287euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608285928;
        bh=S9pk/V38+14aiE6pntomV50spJ9B875dCSkKTkEeOP4=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Af2xlqDNZ71yf1UvkcozhN6XGPr2LTaGLVr1ayw1LMgvJOGWhTeKnNzn1tCE40lzo
         NAcKYcz6nJYGvkky+2FulioXY7tgnH3WcUKH9+ODZeAIYw6+Z2bkY7uprCm5hMzBBR
         Z2Oeggdj4LQV73sw4wOpK1lfRghG9W2rjqLuSe/s=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201218100523eucas1p2a1005fc0e7eb87baaf906068f971e1bb~Rx4akRf0O3270732707eucas1p2a;
        Fri, 18 Dec 2020 10:05:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 54.96.45488.2EE7CDF5; Fri, 18
        Dec 2020 10:05:22 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201218100522eucas1p1e27bcf5daf8c771afb098cb9583826bf~Rx4aJdk7b1143611436eucas1p1b;
        Fri, 18 Dec 2020 10:05:22 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201218100522eusmtrp29c131ba75e4d068edee7b1f9d2180f3d~Rx4aIuhDa2025320253eusmtrp2K;
        Fri, 18 Dec 2020 10:05:22 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-94-5fdc7ee24e5b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.7E.16282.2EE7CDF5; Fri, 18
        Dec 2020 10:05:22 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201218100521eusmtip1848e0a2add27f5dab494f89c90820836~Rx4ZgAbaU2048120481eusmtip1O;
        Fri, 18 Dec 2020 10:05:21 +0000 (GMT)
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com>
Date:   Fri, 18 Dec 2020 11:05:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRmVeSWpSXmKPExsWy7djP87qP6u7EG+x4aWnx4M1sNosz3bkW
        89b/ZLT4s2sHk8XlXXPYLB4+uMFq8eFticWHCf+ZLN6dBoo/6nvL7sDlMbvhIovHzll32T0W
        bCr12DPxJJvHplWdbB4nZvxm8fi8SS6APYrLJiU1J7MstUjfLoEr4+DufsaC6+oVV56vZmxg
        PKLYxcjJISFgIjGvfzpLFyMXh5DACkaJ6183MYIkhAS+MErc75aBSHxmlJh8bCozTMeaj5uZ
        IBLLGSWa/jaxQjgfGSWW7FnHClIlLOApcerzSnYQW0RAS+LO0g6wImaBVcwSr0/uAUuwCRhK
        dL3tYgOxeQXsJJYtmQlmswioSizY+wdskKhAksT6rh9QNYISJ2c+YQGxOQUCJa6vfAUWZxaQ
        l9j+dg4zhC0ucevJfLDzJAT+c0gs/vSFHeJuF4k1rdOhfhCWeHV8C1RcRuL/TpiGZkaJh+fW
        skM4PYwSl5tmMEJUWUvcOfcLaB0H0ApNifW79CHCjhJLd85kAglLCPBJ3HgrCHEEn8SkbSC7
        QMK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5C8NgvJO7OQvDMLYe8CRpZVjOKppcW56anFxnmp
        5XrFibnFpXnpesn5uZsYgSnr9L/jX3cwrnj1Ue8QIxMH4yFGCQ5mJRHe0Ae344V4UxIrq1KL
        8uOLSnNSiw8xSnOwKInz7tq6Jl5IID2xJDU7NbUgtQgmy8TBKdXAZNUyT2bDZu7LPWtdvz9Z
        M+eJd9m/gIUbLxbesn8yeaL8sw3b5hhb3Y67OHviqw8mKwOeVP/hWp1ap6WrfdnoqaBHfIZo
        d3mH0byDJ1azKf+/Y3r5xQOdz9usbGaLb/qp7nl63Zf7URcn7bz2J3FHz85HjbfaaorFJiVN
        1LvetiS852BxSF2am6Pb1HN37KtMbL8851u2eueeP8f7JornV6aU3tta+XdiebOlVONuqYgL
        p6z/b065cPzl0Yt1kav079oe9Tf+5W20JK9B0fz2gk+2Cz6p9y/g1GnlNHboO/mw2y3s9y/+
        V0d+MVxlYGgOrmi7tvaFZkSeQ8l/kQmxwQfjTx99NNWeocNvFtuZ10ZKLMUZiYZazEXFiQB7
        zAYByAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7qP6u7EG2w+K2nx4M1sNosz3bkW
        89b/ZLT4s2sHk8XlXXPYLB4+uMFq8eFticWHCf+ZLN6dBoo/6nvL7sDlMbvhIovHzll32T0W
        bCr12DPxJJvHplWdbB4nZvxm8fi8SS6APUrPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q
        2DzWyshUSd/OJiU1J7MstUjfLkEv4+DufsaC6+oVV56vZmxgPKLYxcjJISFgIrHm42amLkYu
        DiGBpYwS//4dYYRIyEicnNbACmELS/y51sUGUfSeUaLz6gEWkISwgKfEqc8r2UFsEQEtiTtL
        O1hBipgF1jBLrLpznxGio4tJ4svvK2AdbAKGEl1vQUZxcvAK2EksWzITzGYRUJVYsPcPUDcH
        h6hAksTZ04IQJYISJ2c+AWvlFAiUuL7yFVg5s4CZxLzND5khbHmJ7W/nQNniEreezGeawCg0
        C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGRXnFibnFpXrpecn7uJkZgjG479nPLDsaVrz7q
        HWJk4mA8xCjBwawkwhv64Ha8EG9KYmVValF+fFFpTmrxIUZToHcmMkuJJucDk0ReSbyhmYGp
        oYmZpYGppZmxkjivyZE18UIC6YklqdmpqQWpRTB9TBycUg1M7CcPrWUReaDr+fqRy335gCuM
        NzbHicecV9ivrjJ/pvYbj1spHkul7xX7/Vr0bXfCapvnUav3rXp0Ourg/+27tP+IGXq7cHmc
        5guwvnTLVzc/O+MGn5Hoc4Fqp4NKxUWJc3dNK7vy5f+U1490iw/ffPSy5HaVzHLmF/+NN3xa
        vLBkxqe8hft+BrNYCv+vPJNg5x7AmJcX0LKv6OTeHdfP+S0Uy95s7ZOYMLHlLfsEiV13yvps
        H/fNYBOWNS/IfvFb9bCX5gTVXrmZL7cw+mR8cj7XnHPP7/mTsAafx7OPWNQyXtaze/Tmq5hD
        n2L6SaH8Y9/E6j7sDNJs/pD2gesKA/OLK6Uv5njrXtHeJ2hcrcRSnJFoqMVcVJwIAG/xEzla
        AwAA
X-CMS-MailID: 20201218100522eucas1p1e27bcf5daf8c771afb098cb9583826bf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a
References: <CGME20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a@eucas1p1.samsung.com>
        <20201203125700.161354-1-masahiroy@kernel.org>
        <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
        <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 18.12.2020 10:43, Masahiro Yamada wrote:
> On Fri, Dec 18, 2020 at 4:58 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 03.12.2020 13:57, Masahiro Yamada wrote:
>>> Linus pointed out a third of the time in the Kconfig parse stage comes
>>> from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
>>> and directly testing plugin-version.h for existence cuts down the
>>> overhead a lot. [2]
>>>
>>> This commit takes one step further to kill the build test entirely.
>>>
>>> The small piece of code was probably intended to test the C++ designated
>>> initializer, which was not supported until C++20.
>>>
>>> In fact, with -pedantic option given, both GCC and Clang emit a warning.
>>>
>>> $ echo 'class test { public: int test; } test = { .test = 1 };' | g++ -x c++ -pedantic - -fsyntax-only
>>> <stdin>:1:43: warning: C++ designated initializers only available with '-std=c++2a' or '-std=gnu++2a' [-Wpedantic]
>>> $ echo 'class test { public: int test; } test = { .test = 1 };' | clang++ -x c++ -pedantic - -fsyntax-only
>>> <stdin>:1:43: warning: designated initializers are a C++20 extension [-Wc++20-designator]
>>> class test { public: int test; } test = { .test = 1 };
>>>                                             ^
>>> 1 warning generated.
>>>
>>> Otherwise, modern C++ compilers should be able to build the code, and
>>> hopefully skipping this test should not make any practical problem.
>>>
>>> Checking the existence of plugin-version.h is still needed to ensure
>>> the plugin-dev package is installed. The test code is now small enough
>>> to be embedded in scripts/gcc-plugins/Kconfig.
>>>
>>> [1] https://protect2.fireeye.com/v1/url?k=03db90e1-5c40a828-03da1bae-0cc47a336fae-4cc36f5830aeb78d&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ%40mail.gmail.com%2F
>>> [2] https://protect2.fireeye.com/v1/url?k=965b670a-c9c05fc3-965aec45-0cc47a336fae-e34339513ff747c0&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwhK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig%3D%2Bvnw%40mail.gmail.com%2F
>>>
>>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> This patch landed in linux next-20201217 as commit 1e860048c53e
>> ("gcc-plugins: simplify GCC plugin-dev capability test").
>>
>> It causes a build break with my tests setup, but I'm not sure weather it
>> is really an issue of this commit or a toolchain I use. However I've
>> checked various versions of the gcc cross-compilers released by Linaro
>> at https://protect2.fireeye.com/v1/url?k=053727b6-5aac1f7f-0536acf9-0cc47a336fae-5bd799e7ce6b1b9b&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Freleases.linaro.org%2Fcomponents%2Ftoolchain%2Fbinaries%2F and all
>> fails with the same error:
>>
>> $ make ARCH=arm
>> CROSS_COMPILE=../../cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/arm-none-eabi-
>> zImage
>>     HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
>> In file included from
>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/gcc-plugin.h:28:0,
>>                    from scripts/gcc-plugins/gcc-common.h:7,
>>                    from scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/system.h:687:10:
>> fatal error: gmp.h: No such file or directory
>>    #include <gmp.h>
>>             ^~~~~~~
>> compilation terminated.
>> scripts/gcc-plugins/Makefile:47: recipe for target
>> 'scripts/gcc-plugins/arm_ssp_per_task_plugin.so' failed
>> make[2]: *** [scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Error 1
>> scripts/Makefile.build:496: recipe for target 'scripts/gcc-plugins' failed
>> make[1]: *** [scripts/gcc-plugins] Error 2
>> Makefile:1190: recipe for target 'scripts' failed
>> make: *** [scripts] Error 2
>>
>> Compilation works if I use the cross-gcc provided by
>> gcc-7-arm-linux-gnueabi/gcc-arm-linux-gnueabi Ubuntu packages, which is:
>>
>> $ arm-linux-gnueabi-gcc --version
>> arm-linux-gnueabi-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
>>
>
> I can compile gcc-plugins with Linaro toolchians.
>
> The version of mine is this:
>
> masahiro@oscar:~/ref/linux-next$
> ~/tools/arm-linaro-7.5/bin/arm-linux-gnueabihf-gcc --version
> arm-linux-gnueabihf-gcc (Linaro GCC 7.5-2019.12) 7.5.0
> Copyright (C) 2017 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>
>
>
>
> Maybe, it depends on the host environment?
>
>
> Please try this:
>
> $ sudo apt install libgmp-dev

Indeed, it was missing on my setup. Sorry for the noise.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

