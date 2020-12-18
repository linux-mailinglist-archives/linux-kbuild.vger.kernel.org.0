Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38EE12DE63E
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 16:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbgLRPKj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 10:10:39 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48535 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgLRPKi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 10:10:38 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201218150945euoutp01eac3a3c90199703a48215baefd474f2f~R2CK2B0Ee0756107561euoutp01f
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Dec 2020 15:09:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201218150945euoutp01eac3a3c90199703a48215baefd474f2f~R2CK2B0Ee0756107561euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608304185;
        bh=fcLQX9TspfQeRqF6u3WHKlKrb3+PiEJSTeszw2vW5Rc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=VcMq4/i2Y7Ly6w3yiqLTfFlxIdHCKkrsWQgG2fmoYwx88qup+585Lfn4C3T4+ZxBc
         l8Qn0o/R19r0XQAEmyU1RwLb3WnobnD5hfgNpfw56BHBau9ueSc8PQx/A0bPPJmuC5
         xiyxkARm8Mkjhh7Hoixz8hJ2LQddIfjBf/nIliIo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201218150937eucas1p1c157400b48bda72f89ba37ba553a695b~R2CDr5MVg1557715577eucas1p1z;
        Fri, 18 Dec 2020 15:09:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C4.C6.45488.136CCDF5; Fri, 18
        Dec 2020 15:09:37 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201218150937eucas1p20195856f2856777b0b8a394e4e5d0fd3~R2CDPZPSu0827408274eucas1p25;
        Fri, 18 Dec 2020 15:09:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201218150937eusmtrp2f74b856c96d14773f19c8056cd421e84~R2CDOt0mF2413224132eusmtrp2M;
        Fri, 18 Dec 2020 15:09:37 +0000 (GMT)
X-AuditID: cbfec7f5-c5fff7000000b1b0-cf-5fdcc631f60e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id CD.9D.21957.136CCDF5; Fri, 18
        Dec 2020 15:09:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201218150936eusmtip11dfd427bae2b8a6d2448113052854fa3~R2CCjDG_e2906429064eusmtip1B;
        Fri, 18 Dec 2020 15:09:36 +0000 (GMT)
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Jon Hunter <jonathanh@nvidia.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <25030057-86b1-5619-25fd-acfa0728b850@samsung.com>
Date:   Fri, 18 Dec 2020 16:09:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7djPc7qGx+7EGyzfp2/x4M1sNouWWYtY
        LM5051rMW/+T0eLPrh1MFpd3zWGz6Pwyi83i4YMbrBYf3pZYfJjwn8ni3Wmg5KO+t+wOPB6z
        Gy6yeOycdZfdY8GmUo89E0+yeWxa1cnmcWLGbxaP3uZ3bB6fN8kFcERx2aSk5mSWpRbp2yVw
        ZfQte8tc8Fy7or/nAnsDY59qFyMHh4SAicSy7d5djFwcQgIrGCXeXNrBBOF8YZRYsWQqkMMJ
        5HxmlHj5JxnEBml4+X4qI0R8OaPE4U0qEA0fGSXmXlrEBpIQFvCUOPV5JTuILSLgL/F73x9G
        kCJmgevMEifb74NNZRMwlOh62wXWwCtgJ7Hm62kWEJtFQFVi+du7YDWiAkkS67t+QNUISpyc
        +YQF5GxOoPrZb8xBwswC8hLb385hhrDFJW49mQ/2gYTAZE6JmUu/MUNc7SKxYdYmFghbWOLV
        8S3sELaMxP+dMA3NjBIPz61lh3B6GCUuN81ghKiylrhz7hcbyGZmAU2J9bv0IcKOEkt3zmSC
        hCOfxI23ghBH8ElM2jadGSLMK9HRJgRRrSYx6/g6uLUHL1xinsCoNAvJZ7OQvDMLyTuzEPYu
        YGRZxSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZjKTv87/nUH44pXH/UOMTJxMB5ilOBg
        VhLhDX1wO16INyWxsiq1KD++qDQntfgQozQHi5I4766ta+KFBNITS1KzU1MLUotgskwcnFIN
        TOrMK43tfh+b8qWAfUKB4hSZ30K/c67W6d83XbCg72q18dNVHT1ytzt2R/pmp1s47tyQxXzi
        REHufZWChWfnudR2WxyouiA5qURE1NVEZ8H2qZtyVl4LWiy4X73VfnPli8bf/iLN2j233OYI
        tXpGvBWO1HdJcs/0nxZkumeR9OKC1kVyhzykw493zLndJyyj7LdkQvGK/+9uCP36mndHh8lQ
        MPLcrRRvcSG/OJk7MkG/lprrsisE3fhtdujx62ctE+QFNy3PCXiyZv/un7PtZxhof7w1Odvr
        QPnzNPNlr5+KrsuJDllTqBuwUmEf+2k7nQ7Tnb9eJgZt0Z+q8eDo9g8l325oWS/Z8GXC+j0W
        1UosxRmJhlrMRcWJAGhrQivUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xu7qGx+7EG0yfwW/x4M1sNouWWYtY
        LM5051rMW/+T0eLPrh1MFpd3zWGz6Pwyi83i4YMbrBYf3pZYfJjwn8ni3Wmg5KO+t+wOPB6z
        Gy6yeOycdZfdY8GmUo89E0+yeWxa1cnmcWLGbxaP3uZ3bB6fN8kFcETp2RTll5akKmTkF5fY
        KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZfQte8tc8Fy7or/nAnsDY59q
        FyMnh4SAicTL91MZuxi5OIQEljJKPJrxhAUiISNxcloDK4QtLPHnWhcbRNF7RonXZ+ezgSSE
        BTwlTn1eyQ5iiwj4SnSsew1WxCxwk1niT9dVqI7PTBJvTm0C62ATMJToetsFZvMK2Ems+Xoa
        bB2LgKrE8rd3mboYOThEBZIkzp4WhCgRlDg5E+QiDg5OoPLZb8xBwswCZhLzNj9khrDlJba/
        nQNli0vcejKfaQKj0Cwk3bOQtMxC0jILScsCRpZVjCKppcW56bnFhnrFibnFpXnpesn5uZsY
        gfG77djPzTsY5736qHeIkYmD8RCjBAezkghv6IPb8UK8KYmVValF+fFFpTmpxYcYTYG+mcgs
        JZqcD0wgeSXxhmYGpoYmZpYGppZmxkrivFvnrokXEkhPLEnNTk0tSC2C6WPi4JRqYFrfO7nv
        mIDCjbT7s9m81A455q99kPdppvjp5+naz1PF44/c+a3BJ1JzqeuExZ4+qVqzwB8LnZhPGp1n
        qA/+t6j3oNysRaZR1koVs7wmas7OMogNKys7vvCFa6Nhs+wZpukd8vUTa3d+do38WasRplQd
        t8DVpGHB6e0c0SWrpBL2/mRxNWFedHAO17rNsjc+p1Xu952Yfo9n9uWja06+Ts/2/5YZfTbY
        Pe7a6VPOhr0ysjc38dfedfBKXLnD486vlXs5XlSFs65evf+txAz5MJmFG8q/fdru9WLCjCKt
        8P06ChOMNrYuuv1u54m7P35NOTa/W9Vh/cZ/f+qmPTJdKFd/4Hjh9verBS9phUbMnrdCiaU4
        I9FQi7moOBEATmCld2gDAAA=
X-CMS-MailID: 20201218150937eucas1p20195856f2856777b0b8a394e4e5d0fd3
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
        <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com>
        <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 18.12.2020 16:03, Jon Hunter wrote:
> On 18/12/2020 10:05, Marek Szyprowski wrote:
>> On 18.12.2020 10:43, Masahiro Yamada wrote:
>>> On Fri, Dec 18, 2020 at 4:58 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 03.12.2020 13:57, Masahiro Yamada wrote:
>>>>> Linus pointed out a third of the time in the Kconfig parse stage comes
>>>>> from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
>>>>> and directly testing plugin-version.h for existence cuts down the
>>>>> overhead a lot. [2]
>>>>>
>>>>> This commit takes one step further to kill the build test entirely.
>>>>>
>>>>> The small piece of code was probably intended to test the C++ designated
>>>>> initializer, which was not supported until C++20.
>>>>>
>>>>> In fact, with -pedantic option given, both GCC and Clang emit a warning.
>>>>>
>>>>> $ echo 'class test { public: int test; } test = { .test = 1 };' | g++ -x c++ -pedantic - -fsyntax-only
>>>>> <stdin>:1:43: warning: C++ designated initializers only available with '-std=c++2a' or '-std=gnu++2a' [-Wpedantic]
>>>>> $ echo 'class test { public: int test; } test = { .test = 1 };' | clang++ -x c++ -pedantic - -fsyntax-only
>>>>> <stdin>:1:43: warning: designated initializers are a C++20 extension [-Wc++20-designator]
>>>>> class test { public: int test; } test = { .test = 1 };
>>>>>                                              ^
>>>>> 1 warning generated.
>>>>>
>>>>> Otherwise, modern C++ compilers should be able to build the code, and
>>>>> hopefully skipping this test should not make any practical problem.
>>>>>
>>>>> Checking the existence of plugin-version.h is still needed to ensure
>>>>> the plugin-dev package is installed. The test code is now small enough
>>>>> to be embedded in scripts/gcc-plugins/Kconfig.
>>>>>
>>>>> [1] https://protect2.fireeye.com/v1/url?k=03db90e1-5c40a828-03da1bae-0cc47a336fae-4cc36f5830aeb78d&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ%40mail.gmail.com%2F
>>>>> [2] https://protect2.fireeye.com/v1/url?k=965b670a-c9c05fc3-965aec45-0cc47a336fae-e34339513ff747c0&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Flore.kernel.org%2Flkml%2FCAHk-%3DwhK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig%3D%2Bvnw%40mail.gmail.com%2F
>>>>>
>>>>> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
>>>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>>> This patch landed in linux next-20201217 as commit 1e860048c53e
>>>> ("gcc-plugins: simplify GCC plugin-dev capability test").
>>>>
>>>> It causes a build break with my tests setup, but I'm not sure weather it
>>>> is really an issue of this commit or a toolchain I use. However I've
>>>> checked various versions of the gcc cross-compilers released by Linaro
>>>> at https://protect2.fireeye.com/v1/url?k=053727b6-5aac1f7f-0536acf9-0cc47a336fae-5bd799e7ce6b1b9b&q=1&e=dfdc1cf9-82d6-4ca5-b35d-1782e918bde3&u=https%3A%2F%2Freleases.linaro.org%2Fcomponents%2Ftoolchain%2Fbinaries%2F and all
>>>> fails with the same error:
>>>>
>>>> $ make ARCH=arm
>>>> CROSS_COMPILE=../../cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/arm-none-eabi-
>>>> zImage
>>>>      HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
>>>> In file included from
>>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/gcc-plugin.h:28:0,
>>>>                     from scripts/gcc-plugins/gcc-common.h:7,
>>>>                     from scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
>>>> /home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/system.h:687:10:
>>>> fatal error: gmp.h: No such file or directory
>>>>     #include <gmp.h>
>>>>              ^~~~~~~
>>>> compilation terminated.
>>>> scripts/gcc-plugins/Makefile:47: recipe for target
>>>> 'scripts/gcc-plugins/arm_ssp_per_task_plugin.so' failed
>>>> make[2]: *** [scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Error 1
>>>> scripts/Makefile.build:496: recipe for target 'scripts/gcc-plugins' failed
>>>> make[1]: *** [scripts/gcc-plugins] Error 2
>>>> Makefile:1190: recipe for target 'scripts' failed
>>>> make: *** [scripts] Error 2
>>>>
>>>> Compilation works if I use the cross-gcc provided by
>>>> gcc-7-arm-linux-gnueabi/gcc-arm-linux-gnueabi Ubuntu packages, which is:
>>>>
>>>> $ arm-linux-gnueabi-gcc --version
>>>> arm-linux-gnueabi-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0
>>>>
>>> I can compile gcc-plugins with Linaro toolchians.
>>>
>>> The version of mine is this:
>>>
>>> masahiro@oscar:~/ref/linux-next$
>>> ~/tools/arm-linaro-7.5/bin/arm-linux-gnueabihf-gcc --version
>>> arm-linux-gnueabihf-gcc (Linaro GCC 7.5-2019.12) 7.5.0
>>> Copyright (C) 2017 Free Software Foundation, Inc.
>>> This is free software; see the source for copying conditions.  There is NO
>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>>
>>>
>>>
>>>
>>> Maybe, it depends on the host environment?
>>>
>>>
>>> Please try this:
>>>
>>> $ sudo apt install libgmp-dev
>> Indeed, it was missing on my setup. Sorry for the noise.
>
> So this change also breaks the build on our farm build machines and
> while we can request that packages are installed on these machines, it
> takes time. Is there anyway to avoid this?

You can temporarily revert 1e860048c53e (this patch).

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

