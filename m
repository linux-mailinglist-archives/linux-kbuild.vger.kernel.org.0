Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7532DDF4D
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 08:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732304AbgLRH64 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 02:58:56 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46225 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732259AbgLRH64 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 02:58:56 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201218075804euoutp02d9e0fea3beba050b67d97c895ebf39aa~RwJQWLPTn2403624036euoutp02Y
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Dec 2020 07:58:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201218075804euoutp02d9e0fea3beba050b67d97c895ebf39aa~RwJQWLPTn2403624036euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608278284;
        bh=WVgo2j4yEAz/CQJbmxUOMmEfrN6rEAfENZPr5nFB8f8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=JQ3leB4pKyiOtmFo6iR6MXtpC0UNT1X6Iw2h4QjkR9bWuEzvEuKW1I1EzO/9zU3Tj
         cWX2pCJlAn4L+8DY25OlbMN668PTepN9IAVvBJ/05buQGhUl4e+05I5xy9VLtssyxQ
         Lc4/0aHptvTOzOnBiuTQM28MxYxwX+SHSIshu7kk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201218075759eucas1p13b53bd2334e1df2d8764b58f721fbc02~RwJLlJyBe0410204102eucas1p1J;
        Fri, 18 Dec 2020 07:57:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5A.C3.44805.6016CDF5; Fri, 18
        Dec 2020 07:57:58 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a~RwJK3PiXF0420804208eucas1p16;
        Fri, 18 Dec 2020 07:57:58 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201218075758eusmtrp23d5093d1b90924d296e171355affbd34~RwJK2kyj71476614766eusmtrp29;
        Fri, 18 Dec 2020 07:57:58 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-d5-5fdc6106d1e4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C4.3C.21957.6016CDF5; Fri, 18
        Dec 2020 07:57:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201218075757eusmtip1489b8cf5f0d2309e97745745cc18b3a3~RwJKQg_d81315313153eusmtip1X;
        Fri, 18 Dec 2020 07:57:57 +0000 (GMT)
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
Date:   Fri, 18 Dec 2020 08:57:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201203125700.161354-1-masahiroy@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCKsWRmVeSWpSXmKPExsWy7djP87rsiXfiDbrkLR68mc1mcaY712Le
        +p+MFn927WCyuLxrDpvFwwc3WC0+vC2x+DDhP5PFu9NA8Ud9b9kduDxmN1xk8dg56y67x4JN
        pR57Jp5k89i0qpPN48SM3ywenzfJBbBHcdmkpOZklqUW6dslcGWc3XmZuaBNtuLg5TamBsYT
        El2MnBwSAiYSd67vYe1i5OIQEljBKHH16E12COcLo8Se5bsYIZzPjBKNq56yw7Q8uzsTqmo5
        o8TsHVtZQRJCAh8ZJR7eiQGxhQU8JU59XglWJCKwiVFi9dOVLCAOs8AlRolHq54wg1SxCRhK
        dL3tYuti5ODgFbCT2NmtBRJmEVCVeDVtAthQUYEkifVdP9hAbF4BQYmTM5+wgNicAtYSi6+9
        AxvDLCAv0bx1NpQtLnHryXwmkF0SAv85JGas72KGONtF4vPU11AvCEu8Or4FypaR+L8TpqEZ
        6INza9khnB5GictNMxghqqwl7pz7BXYps4CmxPpd+hBhR4mlO2cygYQlBPgkbrwVhDiCT2LS
        tunMEGFeiY42IYhqNYlZx9fBrT144RLzBEalWUhem4XknVlI3pmFsHcBI8sqRvHU0uLc9NRi
        o7zUcr3ixNzi0rx0veT83E2MwIR1+t/xLzsYl7/6qHeIkYmD8RCjBAezkghv6IPb8UK8KYmV
        ValF+fFFpTmpxYcYpTlYlMR5k7asiRcSSE8sSc1OTS1ILYLJMnFwSjUwMfluPLFNnnlznfM2
        g68//LxtTebZZvUUNy04GZzx5lGxRMTVJXJneIPlXtRrMiyrnHbyCXeMlOmF6Wujzuze67Jz
        V9uVI9GKPM6JCy7K+L/k0ZRdzTGtkFfSVylIYG+577mPX6M039yUuvFhw8HMcta9Osbm5leP
        C/7ind7PMT3u81f+tQERovfeVGibtTmpCP9//89AOJl50grDWG+Hacoz1X80TTg5tynCJlLC
        8LVwbXKlu8OrRf5b9K/P2sz59/B3bYbvK/oCdwf8YXbcHVn34VJm2hf1I+47XNYbFoZPO5X4
        7tqKZm3T7KXBehUaLoIb9vKbXMq4oHlfrMPVIuHs6v0BS0VF1TiX/69SYinOSDTUYi4qTgQA
        HqRQSMcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRmVeSWpSXmKPExsVy+t/xu7psiXfiDe594rZ48GY2m8WZ7lyL
        eet/Mlr82bWDyeLyrjlsFg8f3GC1+PC2xOLDhP9MFu9OA8Uf9b1ld+DymN1wkcVj56y77B4L
        NpV67Jl4ks1j06pONo8TM36zeHzeJBfAHqVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdo
        bB5rZWSqpG9nk5Kak1mWWqRvl6CXcXbnZeaCNtmKg5fbmBoYT0h0MXJySAiYSDy7O5O9i5GL
        Q0hgKaPE9L1bmSASMhInpzWwQtjCEn+udbFBFL1nlFi+/BlYkbCAp8SpzyvBukUENjFKLGm8
        zAjiMAtcYZToWb0DrEpIwEri6fbHYKPYBAwlut6CjOLg4BWwk9jZrQUSZhFQlXg1bQIrSFhU
        IEni7GlBkDCvgKDEyZlPWEBsTgFricXX3jGD2MwCZhLzNj+EsuUlmrfOhrLFJW49mc80gVFo
        FpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzACN127OfmHYzzXn3U
        O8TIxMF4iFGCg1lJhDf0we14Id6UxMqq1KL8+KLSnNTiQ4ymQO9MZJYSTc4Hpoi8knhDMwNT
        QxMzSwNTSzNjJXHerXPXxAsJpCeWpGanphakFsH0MXFwSjUwneA+G7e/qm3ycRXlF8u1fvw9
        vKuxYEP0fZPVc1k1RJQX8835L92byLc3eem0Va/6khkL0148Us9o+Z9x5j3H88fJJk9OlErl
        vfq0T1zpQ/HK4mkbY2dq5jU0sjjm2q2xD1EJPTE17POGewu+JjYfuavpnXFwMiN7tsc3nUep
        0xTtpe69YVzB5zV/Y9/lX+7TLDtKL/PPl+XeILmxpGPxs0/xB3rtrafE3vNdfP+JcV75tgsr
        rqieeJwnxnX5NF+g/4+9rl+meiwRjJutEXhgssGqj1e1Tipvjr8U7qL25GekBGth4wYfdr7l
        JW3Z+gVNmxbpp5dJT+NODOyTeXv18qv2rltis3R/Fn6ukNj3W4mlOCPRUIu5qDgRADVmgClZ
        AwAA
X-CMS-MailID: 20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a
References: <20201203125700.161354-1-masahiroy@kernel.org>
        <CGME20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 03.12.2020 13:57, Masahiro Yamada wrote:
> Linus pointed out a third of the time in the Kconfig parse stage comes
> from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
> and directly testing plugin-version.h for existence cuts down the
> overhead a lot. [2]
>
> This commit takes one step further to kill the build test entirely.
>
> The small piece of code was probably intended to test the C++ designated
> initializer, which was not supported until C++20.
>
> In fact, with -pedantic option given, both GCC and Clang emit a warning.
>
> $ echo 'class test { public: int test; } test = { .test = 1 };' | g++ -x c++ -pedantic - -fsyntax-only
> <stdin>:1:43: warning: C++ designated initializers only available with '-std=c++2a' or '-std=gnu++2a' [-Wpedantic]
> $ echo 'class test { public: int test; } test = { .test = 1 };' | clang++ -x c++ -pedantic - -fsyntax-only
> <stdin>:1:43: warning: designated initializers are a C++20 extension [-Wc++20-designator]
> class test { public: int test; } test = { .test = 1 };
>                                            ^
> 1 warning generated.
>
> Otherwise, modern C++ compilers should be able to build the code, and
> hopefully skipping this test should not make any practical problem.
>
> Checking the existence of plugin-version.h is still needed to ensure
> the plugin-dev package is installed. The test code is now small enough
> to be embedded in scripts/gcc-plugins/Kconfig.
>
> [1] https://lore.kernel.org/lkml/CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com/
> [2] https://lore.kernel.org/lkml/CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com/
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This patch landed in linux next-20201217 as commit 1e860048c53e 
("gcc-plugins: simplify GCC plugin-dev capability test").

It causes a build break with my tests setup, but I'm not sure weather it 
is really an issue of this commit or a toolchain I use. However I've 
checked various versions of the gcc cross-compilers released by Linaro 
at https://releases.linaro.org/components/toolchain/binaries/ and all 
fails with the same error:

$ make ARCH=arm 
CROSS_COMPILE=../../cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/arm-none-eabi- 
zImage
   HOSTCXX scripts/gcc-plugins/arm_ssp_per_task_plugin.so
In file included from 
/home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/gcc-plugin.h:28:0,
                  from scripts/gcc-plugins/gcc-common.h:7,
                  from scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
/home/mszyprow/dev/cross/gcc-arm-10.2-2020.11-x86_64-arm-none-eabi/bin/../lib/gcc/arm-none-eabi/10.2.1/plugin/include/system.h:687:10: 
fatal error: gmp.h: No such file or directory
  #include <gmp.h>
           ^~~~~~~
compilation terminated.
scripts/gcc-plugins/Makefile:47: recipe for target 
'scripts/gcc-plugins/arm_ssp_per_task_plugin.so' failed
make[2]: *** [scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Error 1
scripts/Makefile.build:496: recipe for target 'scripts/gcc-plugins' failed
make[1]: *** [scripts/gcc-plugins] Error 2
Makefile:1190: recipe for target 'scripts' failed
make: *** [scripts] Error 2

Compilation works if I use the cross-gcc provided by 
gcc-7-arm-linux-gnueabi/gcc-arm-linux-gnueabi Ubuntu packages, which is:

$ arm-linux-gnueabi-gcc --version
arm-linux-gnueabi-gcc (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

