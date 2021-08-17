Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12603EF615
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 01:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235613AbhHQXYY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 19:24:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhHQXYU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 19:24:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66EE760FD7;
        Tue, 17 Aug 2021 23:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629242624;
        bh=/GnHgdBzB1zvgbKqo8gzvmlUQTPw53iwDmu/OsunGdA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=trSh2BL99Bb9FxJgK31SwOsCbxNuksew8j/Lc39KJmyobbiF/6/fdtg+P7yLX7MfL
         zvBcH+qOAbU4lDZ4lZeC5+/GpqfmNgeB+ySo6gC+rAwmGwUt7MHfpidb0tnPW1ppfh
         dtr5XnLG6E+hCczUg3c8q+NOvnDRiZBLOOuIR14eFqLCE5C6xXoP3+GRl6X8/KvffE
         mjWmDdDmWWz8jsJ4/69ky3VmwQBK6VzHIjo6UwzMy2YvFq55i1+8ASuwKdp+HJe1TG
         hQI6K5Vld7EUxahUkPf12BKG0qm8YSCbxYieKxxo18csSaNjvcUBX+h8A8jr0ohKOo
         tnP6ulT1pVpAg==
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Philip Li <philip.li@intel.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
References: <20210817005624.1455428-1-nathan@kernel.org>
 <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
 <202108171056.EDCE562@keescook>
 <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org>
 <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
 <71d76c41-7f9b-6d60-ba4f-0cd84596b457@embeddedor.com>
 <202108171602.159EB2C7EA@keescook>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <72ae69b4-6069-ade5-a12b-8ee0435f803a@kernel.org>
Date:   Tue, 17 Aug 2021 16:23:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <202108171602.159EB2C7EA@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/17/2021 4:06 PM, Kees Cook wrote:
> On Tue, Aug 17, 2021 at 04:33:25PM -0500, Gustavo A. R. Silva wrote:
>>
>>
>> On 8/17/21 16:17, Masahiro Yamada wrote:
>>> On Wed, Aug 18, 2021 at 3:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>>>
>>>> On 8/17/2021 11:03 AM, Kees Cook wrote:
>>>>> On Mon, Aug 16, 2021 at 09:55:28PM -0700, Nathan Chancellor wrote:
>>>>>> If you/Gustavo would prefer, I can upgrade that check to
>>>>>>
>>>>>> ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)
>>>>>>
>>>>>> I was just trying to save a call to the compiler, as that is more expensive
>>>>>> than a shell test call.
>>>>>
>>>>> I prefer the option test -- this means no changes are needed on the
>>>>> kernel build side if it ever finds itself backported to earlier versions
>>>>> (and it handles the current case of "14" not meaning "absolute latest").
>>>>>
>>>>> More specifically, I think you want this (untested):
>>>>
>>>> That should work but since -Wunreachable-code-fallthrough is off by
>>>> default, I did not really see a reason to include it in KBUILD_CFLAGS. I
>>>> do not have a strong opinion though, your version is smaller than mine
>>>> is so we can just go with that. I'll defer to Gustavo on it since he has
>>>> put in all of the work cleaning up the warnings.
>>>
>>>
>>>
>>> https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
>>>
>>>     did two things:
>>>
>>>   (1) Change the -Wimplicit-fallthrough behavior so that it fits
>>>        to our use in the kernel
>>>
>>>   (2) Add a new option -Wunreachable-code-fallthrough
>>>        that works like the previous -Wimplicit-fallthrough of
>>>        Clang <= 13.0.0
>>>
>>>
>>> They are separate things.
>>>
>>> Checking the presence of -Wunreachable-code-fallthrough
>>> does not make sense since we are only interested in (1) here.
>>>
>>> So, checking the Clang version is sensible and matches
>>> the explanation in the comment block.
> 
> I thought one of the problems (which is quickly draining away) that
> needed to be solved here is that some Clang trunk builds (that report
> as version 14) don't yet have support for -Wunreachable-code-fallthrough
> since they aren't new enough.

Philip, how often is the kernel test robot's clang version rebuilt? 
Would it be possible to bump it to latest ToT or at least 
9ed4a94d6451046a51ef393cd62f00710820a7e8 so that we do not get bit by 
this warning when we go to enable this flag?

I do not know of any other CI aside from ours that is testing with tip 
of tree clang and ours should already have a clang that includes my 
patch since it comes from apt.llvm.org.

>>> # Warn about unmarked fall-throughs in switch statement.
>>> # Clang prior to 14.0.0 warned on unreachable fallthroughs with
>>> # -Wimplicit-fallthrough, which is unacceptable due to IS_ENABLED().
>>> # https://bugs.llvm.org/show_bug.cgi?id=51094
>>> ifeq ($(firstword $(sort $(CONFIG_CLANG_VERSION) 140000)),140000)
>>> KBUILD_CFLAGS += -Wimplicit-fallthrough
>>> endif

Very clever and nifty trick! I have verified that it works for clang 13 
and 14 along with a theoretical clang 15. Gustavo, feel free to stick a

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

if you so desire.

>>>
>>> The $(sort ...) is alphabetical sort, not numeric sort.
>>> It works for us because the minimum Clang version is 10.0.1
>>> (that is CONFIG_CLANG_VERSION is always 6-digit)
>>>
>>> It will break when Clang version 100.0.0 is released.
>>>
>>> But, before that, we will raise the minimum supported clang version,
>>> and this conditional will go away.
> 
> If a version test is preferred, cool; this is a nice trick. :)
> 
>> I like this. :)
>>
>> I'm going to make the 0-day robot test it in my tree, first.
> 
> Sounds good to me!
> 
