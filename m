Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CD43EF79F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 03:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235253AbhHRBkp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 21:40:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:45542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234723AbhHRBkp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 21:40:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 983DE61056;
        Wed, 18 Aug 2021 01:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629250811;
        bh=YI8mfiwFPl0WAi650tapm83R/R8vugpTBzE0LO23fKI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jBbiCeQh4wFIXSkOKlQlPBrRoLdxTbznvoEn/ty317oq7vMLhsls1cMCttoa2WUNf
         zo1OAiWgW4+h5g+7KAcMbZrJIDZaukxX+u4LNLKJg5B3H1kdviw0JzoU5Mg0hoslDH
         WX0srr5/8nyQ2HVeCt7D7EGb93tUciNhLIiTCTd/4p34MZnUGSRI9yqoQIiu4gCFYX
         LkIPSAQdf4PTZvT2EDzAARQCeeGJwHtYg1zxHbJbPub3gWGlnJnCztwLSZfbK60NXI
         Y6jPMxKRkYn8Fm4vtdusPAWUS2QFnGnhdb3wy2fLsEj81q8jPK/uHeg+P/Cza1pkgI
         alCRrB3yNJr0g==
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Vineet Gupta <vgupta@kernel.org>,
        linux-snps-arc@lists.infradead.org
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com>
 <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
 <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <8b9bf97a-8f6f-80b9-3bab-32bb525adf9e@kernel.org>
Date:   Tue, 17 Aug 2021 18:40:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 8/17/2021 11:07 AM, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Mon, Aug 16, 2021 at 7:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
>>> cc-option-yn can be replaced with cc-option. ie.
>>> Checking for support:
>>> ifeq ($(call cc-option-yn,$(FLAG)),y)
>>> becomes:
>>> ifneq ($(call cc-option,$(FLAG)),)
>>>
>>> Checking for lack of support:
>>> ifeq ($(call cc-option-yn,$(FLAG)),n)
>>> becomes:
>>> ifeq ($(call cc-option,$(FLAG)),)
>>>
>>> This allows us to pursue removing cc-option-yn.
>>>
>>> Cc: Vineet Gupta <vgupta@kernel.org>
>>> Cc: linux-snps-arc@lists.infradead.org
>>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>>> ---
>>>    arch/arc/Makefile | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
>>> index c0d87ac2e221..8782a03f24a8 100644
>>> --- a/arch/arc/Makefile
>>> +++ b/arch/arc/Makefile
>>> @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
>>>    cflags-y                            += $(tune-mcpu-def-y)
>>>    else
>>>    tune-mcpu                           := $(shell echo $(CONFIG_ARC_TUNE_MCPU))
>>> -tune-mcpu-ok                                 := $(call cc-option-yn, $(tune-mcpu))
>>> -ifeq ($(tune-mcpu-ok),y)
>>> +ifneq ($(call cc-option,$(tune-mcpu)),)
>>>    cflags-y                            += $(tune-mcpu)
>>
>> Any reason not to just turn this into
>>
>> cflags-y += $(call cc-option,$(tune-mcpu))
>>
>> ?
> 
> Yes, you'll need to pull up the source; the diff doesn't provide
> enough context. tune-mcpu is used in the body of the else branch
> hinted at by the diff. PTAL

Ah, fair enough. The warning is a little unconventional but oh well :)

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

>>
>> If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.
>>
>>>    else
>>>    # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
>>>
> 
> 
> 
