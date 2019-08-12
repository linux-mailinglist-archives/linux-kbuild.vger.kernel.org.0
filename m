Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72D9389FC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 15:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbfHLNdU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 09:33:20 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57258 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728826AbfHLNdU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 09:33:20 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id A91A628A2F1
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the
 environment
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mark Brown <broonie@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel@collabora.com
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com>
 <20190809051552.GA44466@archlinux-threadripper>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <b2ac60fb-94f7-1273-e1a3-825172c3cc00@collabora.com>
Date:   Mon, 12 Aug 2019 15:33:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809051552.GA44466@archlinux-threadripper>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 09/08/2019 07:15, Nathan Chancellor wrote:
> On Thu, Aug 08, 2019 at 03:42:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
>> On Thu, Aug 8, 2019 at 2:07 PM Guillaume Tucker
>> <guillaume.tucker@collabora.com> wrote:
>>>
>>> Only use gcc/g++ for HOSTCC, HOSTCXX and CC by default if they are not
>>> already defined in the environment.  This fixes cases such as building
>>> host tools with clang without having gcc installed.
>>>
>>> The issue was initially hit when running merge_config.sh with clang
>>> only as it failed to build "HOSTCC scripts/basic/fixdep".
>>
>> Thanks for the patch.  I don't quite follow the exact error.
>>
>> When building with Clang, I usually do:
>>
>> $ make CC=clang HOSTCC=clang ...
>>
>> are you trying to fix the case where you do:
>>
>> $ make CC=clang ...
>> <no HOSTCC set>
>> when GCC is not installed?  Because if so, I think it would be easier
>> to just specify HOSTCC=clang, but maybe I'm misunderstanding the
>> issue?
> 
> As I understand it,
> 
> $ make CC=clang HOSTCC=clang
> 
> works fine. What doesn't currently work is:
> 
> $ export CC=clang
> $ export HOSTCC=clang
> $ make
> 
> This is problematic because there is no way for CC, HOSTCC, and HOSTCXX
> to be passed to make within scripts/kconfig/merge_config.sh.
> 
> A quick test before and after the patch:
> 
> $ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
> ...
>   gcc -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes...
>   gcc -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes...
> ...
> $ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
> ...
>   clang -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
>   clang -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
> ...
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the review.

> I wonder if all variable should be converted to that scheme or just the
> ones that are needed in this instance. I also wonder if this will cause

This is what Mark also asked.  If we want to use ?= then I can
send another patch to cover all the other variables.  It also
makes sense to be able to choose an alternative linker, in
particular LLVM's ld.lld was brought up recently in some KernelCI
discussions.

> any issues with people who define these variables in their environment
> already; if so, maybe merge_config.sh should be updated to support
> passing CC, HOSTCC, and HOSTCXX to make.

I think the reason for the RFC essentially boils down to this.
On the other hand, if someone exports HOSTCC or CC to use some
specific compiler, they would expect it to be used.  It would
seem like a bit strange to export one value for a variable and
then pass another one to make (i.e. "export CC=gcc; make
CC=clang").  Also, passing all the variables to make in
merge_config.sh as well as any other place where this may happen
is likely to be rather error-prone and hard to maintain, say if
new variables get introduced in the Makefile or if some new
scripts start calling make.

So I'll prepare a new patch using the ?= approach.  Meanwhile
we'll see if someone can find a good reason why this can actually
be problematic.

Best wishes,
Guillaume
