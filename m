Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15FE334BBC
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 23:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbhCJWnD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 17:43:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbhCJWmq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 17:42:46 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC9B7C061574;
        Wed, 10 Mar 2021 14:42:45 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id h26so10053221qtm.5;
        Wed, 10 Mar 2021 14:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3BAyW4ZQuji90UaVp58rM1Dg3+Lnu9lj7lWY4ICJFZo=;
        b=oUn+8UE2hzY9b0+ujTcHnlLhLZYkkmKDCU63eYhdIMF5X0TSlc/1Oj01OwMHVfQsxt
         L/jpabKE9dYtMvfHFdzoFh4DOHqpWbt8Wz2dQCHPKRHZ3cqF0OUeZNtoZOedsJ6ihYlM
         /hCFSzjmATBeqYxC4/xOuoWJKO+ZnuR+mL8t5w1VaKQiRaDxJqUje4/NHG/EqHZOipII
         jicKKYX+28szdbv4mqtS+TUJOqPigvbC9QHAF+sAVetyKEAagdht2TUexVnbgzxDjPhu
         H7kVtIW3YJ40+UCVRTqyyYhlfhuldFfQEAWu5qqIv++HiIrWp8+MW3N4qwJy1wf8zCg8
         Nhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3BAyW4ZQuji90UaVp58rM1Dg3+Lnu9lj7lWY4ICJFZo=;
        b=T0SbUOFOg8nehB2eRxU8pHnOy3Yqq3VynnFTm4gv50ITXD6G99xX6a+HMB+7+l3ouq
         w5znCGkW1Uejvy9zXW0BW9bmaA08Hl+eu56HAfY3Z56imkbJHB2jZIgt2VPRapO0bhLf
         HgahqvOXlx1Mk99qd9kJulAyA0CUph4vMrX3JiryT3zLDmM/hOIvFVSIRXRgAqgoYAZw
         18lzuIDP+PqE3Dpdq+oExdCytAtur1OwUW7Qe1zNZBLmiFbxx8ur+86z13yioukQ9l2t
         SLC5lH2UTOk3STfDV9AkdYop9k3JzLozaCOZroFgIU/b3f9vq86gCK0vxTHw74ChRvxN
         TMuA==
X-Gm-Message-State: AOAM530Nm7jDw7AlhguD5KkYdpW4dnTITc7k/GQJkipGlnyOIoxYa2zA
        wJ92gRkwKw/aD47cw9ikTa/HjxHt6dw=
X-Google-Smtp-Source: ABdhPJww3pZYgo8AGMp5yMWRJEXXP2c7RN7wF4OlXJvXZjA7v0eK1Z4EiRRWZvC62C/5YTDmN9WiCw==
X-Received: by 2002:a05:622a:2d4:: with SMTP id a20mr4866187qtx.217.1615416165053;
        Wed, 10 Mar 2021 14:42:45 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id b65sm535685qkd.120.2021.03.10.14.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Mar 2021 14:42:44 -0800 (PST)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210310144730.5ipzeailoj6nno5h@vireshk-i7>
 <CAK7LNARKdZT+UdCVmZ1_P3T07yT2Ra34rzMf2RwMvkj7hVkfDg@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <8224a5aa-73be-3765-2e03-d640f3464d3a@gmail.com>
Date:   Wed, 10 Mar 2021 16:42:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARKdZT+UdCVmZ1_P3T07yT2Ra34rzMf2RwMvkj7hVkfDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/10/21 9:15 AM, Masahiro Yamada wrote:
> On Wed, Mar 10, 2021 at 11:47 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> On 10-03-21, 20:24, Masahiro Yamada wrote:
>>> On Wed, Mar 10, 2021 at 2:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>>>> index bc045a54a34e..59e86f67f9e0 100644
>>>> --- a/scripts/Makefile.lib
>>>> +++ b/scripts/Makefile.lib
>>>> @@ -339,7 +339,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>>>
>>>>  quiet_cmd_dtc = DTC     $@
>>>>  cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>>>> -       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>>>> +       $(DTC) -I dts -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>>>
>>> Even without "-I dts",
>>>
>>>    inform = guess_input_format(arg, "dts");
>>>
>>> seems to fall back to "dts" anyway,
>>
>> I missed this TBH.
>>
>>> but I guess you wanted to make this explicit, correct?
>>
>> That can be a reason now :)
>>
>>> I will drop the ugly -O.
>>> https://patchwork.kernel.org/project/linux-kbuild/patch/20210310110824.782209-1-masahiroy@kernel.org/
>>
>> But if we are going to depend on DTC to guess it right, then we
>> shouldn't add -I at all..
>>
>>> I will queue it to linux-kbuild/fixes.
>>>
>>>
>>>
>>>>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>>>>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
>>>>         cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
>>>> @@ -347,9 +347,13 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
>>>>  $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
>>>>         $(call if_changed_dep,dtc)
>>>>
>>>> +# Required for of unit-test files as they can't be renamed to .dtso
>>>
>>> If you go with *.dtso, I think you will rename
>>> all *.dts under the drivers/ directory.
>>>
>>> What is blocking you from making this consistent?
>>
>> The unit-test dts files are designed differently (we have had lots of
>> discussion between Frank and David on that) and they aren't purely
>> overlay or base files. They are designed to do some tricky testing and
>> renaming them to .dtso won't be right, we are just reusing them to do
>> static (build time) testing as well.
> 
> 
> I still do not understand.
> 
> If they are not overlay files, why
> do you need to have them suffixed with .dtbo?
> 
> ".dts -> .dtb" should be enough.
> 
> Why do you need to do ".dts  -> .dtbo" ?
> 
> 
> 
> 
>> I think it would be better if we can drop the existing %.dtbo rule
>> here (i.e. dtbo from .dts) and do some magic in unit-test's Makefile,
>> so it is localised at least instead of it here.
>>
>> Any ideas for that ?
> 
> I do not know.
> 


> My impression is you are doing something fishy.

That is accurate.  Devicetree unittest plays some tricks to enable
testing to occur.  These tricks will never be used anywhere else
in the kernel.

-Frank

