Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40A33EF54A
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 23:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235384AbhHQVxd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 17:53:33 -0400
Received: from gateway21.websitewelcome.com ([192.185.46.109]:16327 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235435AbhHQVxd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 17:53:33 -0400
X-Greylist: delayed 1227 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Aug 2021 17:53:32 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id E0FC1401C0161
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 16:30:29 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id G6fFmGgcTLjoRG6fFmGJPe; Tue, 17 Aug 2021 16:30:29 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4qKKDtGYKHJHsep4rHStScPnllMJG3PYx0Oahzc9bHw=; b=Vr2FF48pTIhyrluy4S4ilt2Fl4
        /uUIe6uAXGmX+51DjxlP/0ojS4xNndrixaUpJHo4ia1wPS/429U6qPpOqsLY5xELkXjEa4axG86/E
        G8hgvBdcNZSYPUEkA15R63Y1okm9+qdzTT3hrrIdoxshrna6Y4C1jVjRkFYGlmg0m/qwBK13wuzCx
        2Jqwk/iRn9BXuC38WBywC46Ecfp1LsVQHUGY2r6JcXzS+E660Uap2yJG57RBMIRPV3q5h5GAZZWTn
        UbH46i0vYZ5is4pFtdwZdGV1anUj2qpYPdTePWI1VmvMFQpttSiDj3zK+FxRu9HwECtlPo8VqDO4A
        k3FeEJVw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:44370 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1mG6fF-003v0R-7G; Tue, 17 Aug 2021 16:30:29 -0500
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
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
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <71d76c41-7f9b-6d60-ba4f-0cd84596b457@embeddedor.com>
Date:   Tue, 17 Aug 2021 16:33:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1mG6fF-003v0R-7G
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:44370
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 8/17/21 16:17, Masahiro Yamada wrote:
> On Wed, Aug 18, 2021 at 3:25 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On 8/17/2021 11:03 AM, Kees Cook wrote:
>>> On Mon, Aug 16, 2021 at 09:55:28PM -0700, Nathan Chancellor wrote:
>>>> If you/Gustavo would prefer, I can upgrade that check to
>>>>
>>>> ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)
>>>>
>>>> I was just trying to save a call to the compiler, as that is more expensive
>>>> than a shell test call.
>>>
>>> I prefer the option test -- this means no changes are needed on the
>>> kernel build side if it ever finds itself backported to earlier versions
>>> (and it handles the current case of "14" not meaning "absolute latest").
>>>
>>> More specifically, I think you want this (untested):
>>
>> That should work but since -Wunreachable-code-fallthrough is off by
>> default, I did not really see a reason to include it in KBUILD_CFLAGS. I
>> do not have a strong opinion though, your version is smaller than mine
>> is so we can just go with that. I'll defer to Gustavo on it since he has
>> put in all of the work cleaning up the warnings.
> 
> 
> 
> https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
> 
>    did two things:
> 
>  (1) Change the -Wimplicit-fallthrough behavior so that it fits
>       to our use in the kernel
> 
>  (2) Add a new option -Wunreachable-code-fallthrough
>       that works like the previous -Wimplicit-fallthrough of
>       Clang <= 13.0.0
> 
> 
> They are separate things.
> 
> Checking the presence of -Wunreachable-code-fallthrough
> does not make sense since we are only interested in (1) here.
> 
> 
> 
> So, checking the Clang version is sensible and matches
> the explanation in the comment block.
> 
> 
> Moreover, using $(shell test ...) is less expensive than cc-option.
> 
> 
> If you want to make it even faster, you can use only
> built-in functions, like this:
> 
> 
> # Warn about unmarked fall-throughs in switch statement.
> # Clang prior to 14.0.0 warned on unreachable fallthroughs with
> # -Wimplicit-fallthrough, which is unacceptable due to IS_ENABLED().
> # https://bugs.llvm.org/show_bug.cgi?id=51094
> ifeq ($(firstword $(sort $(CONFIG_CLANG_VERSION) 140000)),140000)
> KBUILD_CFLAGS += -Wimplicit-fallthrough
> endif
> 
> 
> 
> The $(sort ...) is alphabetical sort, not numeric sort.
> It works for us because the minimum Clang version is 10.0.1
> (that is CONFIG_CLANG_VERSION is always 6-digit)
> 
> It will break when Clang version 100.0.0 is released.
> 
> But, before that, we will raise the minimum supported clang version,
> and this conditional will go away.

I like this. :)

I'm going to make the 0-day robot test it in my tree, first.

Thanks!
--
Gustavo


