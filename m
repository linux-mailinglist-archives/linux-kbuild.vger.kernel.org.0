Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0378828C44F
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 23:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730321AbgJLVst (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 17:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729273AbgJLVst (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 17:48:49 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C705C0613D0;
        Mon, 12 Oct 2020 14:48:49 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j7so4952122pgk.5;
        Mon, 12 Oct 2020 14:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5hpUBhYkynzWSO/MyOJOUvzRQxBbeKodFS5ENFGt1Cw=;
        b=LTRLFCNLVioFU/DVKBPzF3b0xS54PVoSo7PO4zXv9Ign+qVU4TULsnKmBdI4qvOy/K
         pwBGlElzg1R9+sWqnbQQXfVzpsrckEDujiqzp3mQtlJNPNMvZlN9zNpsLq3lxuKdfNa7
         OARt4MdYOUqz02g0z/Esn5buWbAaAR/qSjB56C4pdvnmM29FFMFHiYPGDVD9hg8rGplG
         YUJwD5EpvWwwHXwyvcTvLC8+n0zr8llmK02cgWznQ13JMUcw1SzhTnkjQxz1YaQklGHk
         Nl95KEpncg+Ojoov5rNEx1o0L1HxPARbL9XvxVFhmLTI1ISROf0Fpys5Kua7ZrpF3ZRW
         ax0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5hpUBhYkynzWSO/MyOJOUvzRQxBbeKodFS5ENFGt1Cw=;
        b=NZnfnhy1uuOnKIHixSG+R45bSPikgKujDrXVkRFSb05BNpgQJwGxnfbYVo4zQLBl6e
         LHUpIJ1WY1YARdg2KqZjPqwpgQYgRRt07VYQ2nRqQWIAWLQWV5r9yg7OngJx67NzR95V
         /O6ZmWkY6xLR3jBNNByjHGlF41vR5YAmm2DMpRQtY20jzUFEcDLzOtPWYHP/9Wb9VeGa
         tWY9+bLKyoqOH0kAbxXVuP3jvfgqqdBrfGA7tFO4/5Okv5ndFej4LHC3l6ajklFQnW1I
         y5jJeNE+ZTV26y+/kZhBKf7cUiGZvMEe0NMeX4nbOWSZNWPjyGEUovwWhxXGwdQhnv4p
         hrUA==
X-Gm-Message-State: AOAM5313kDRcIQvykHMgLrHngHrlZGJ9ifdALyn+JxFedY4QIpPxcqbm
        XKPRMxx7j6wtIJyPoIphu/I=
X-Google-Smtp-Source: ABdhPJz5Lp2adF9xI3yV5LRvSTjct73bdnYZ9/vx/AS1+EGaAwshFUhsI9eDn+I6rbF84Pp9iczIxw==
X-Received: by 2002:a17:90a:ec13:: with SMTP id l19mr22866654pjy.51.1602539328974;
        Mon, 12 Oct 2020 14:48:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id y80sm16836402pfb.144.2020.10.12.14.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 14:48:48 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] kbuild: use interpreters to invoke scripts
To:     Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
 <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010122019410.17866@felia>
 <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
 <53b7257e-b192-07da-9dd3-06497ce826f0@petrovitsch.priv.at>
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <4969477f-8833-9b5e-6756-0d72fe59ef4d@gmail.com>
Date:   Tue, 13 Oct 2020 03:18:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <53b7257e-b192-07da-9dd3-06497ce826f0@petrovitsch.priv.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 13/10/20 12:24 am, Bernd Petrovitsch wrote:
> Hi all!
> 
>>>> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
>>>> index 703b1c4f6d12..86d42a2d09cb 100644
>>>> --- a/arch/ia64/Makefile
>>>> +++ b/arch/ia64/Makefile
>>>> @@ -27,8 +27,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>>>>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>>>>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
>>>>
>>>> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>
>>> Here is an instance of what Masahiro-san pointed out being wrong.
>>>
>>> Ujjwal, will you send a v3?
>>
>> Following is the quoted text from the reply mail from Masahiro
>>
>>>> -GAS_STATUS     = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>> +GAS_STATUS     = $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>>>> +KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>>>
>>>
>>>
>>> These changes look wrong to me.
>>>
>>> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
>>>
>>
>> From the above text, I understand as follows:
> 
> Did you actually *test* that (expecially) these lines work
> afterwards as good as before?

Yes, I did check my changes. TBH, I spent a considerable
amount of time in doing so (given that I'm new to the
community). And I explicitly mentioned the ones I couldn't
test in the cover letter.

But I'm afraid this particular change that Masahiro pointed
must have been overlooked by me (and possibly by others
involved in the process). Being the author of the patch I
accept my mistake.

Because this construct was new to me I read about it
thoroughly in the docs.
As soon as it was pointed out to me, I at once realised
that the change proposed by me was wrong (i didn't
have to look at the docs).

> 
>> That my proposed change:
>> $(shell $(src...)    ->  $($(CONFIG_SHELL) $(src...)
>>
>> is WRONG
> 
> Yup, as it's in a Makefile and that's a Makefile construct> 
>> and in the next line he suggested the required correction.
>> That being:
>> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
> 
> Such stuff should generally not be needed as the to-be-used
> shell can be set in Makefiles via a "SHELL = " assignment

It's not about setting shell but rather using it at required
place. The 'shell function' is meant to execute provided 
commands in an environment outside of make; and executing
commands in that environment is somewhat similar to running
commands on a terminal.
Invoking a script file without setting the x bits will give
a permission denied error.
Similar thing happens when 'shell function' tries to invoke
the provided script. So the task was simply to prepend the
$CONFIG_SHELL (or $SHELL whichever is configured; simple sh
would also suffice) with the script file in 'shell function'.

> (defaulting to /bin/sh - what else;-).
> Flags for the shell can BTW set with ".SHELLFLAGS = ".

setting flags might not be the solution either.

> 
> So please
> -) learn basic "Makefile" + "make" before brainlessly patching
>    a Makefile.
> -) actually testy your changes to make sure the patch didn't
>    broke anything
> -) and - last but not least - check if there isn't a shell
>    already set (and which).

btw, I do agree with your points.

> 
> MfG,
> 	Bernd
> 

If I said anything incorrect please correct me.


Thanks
Ujjwal Kumar
