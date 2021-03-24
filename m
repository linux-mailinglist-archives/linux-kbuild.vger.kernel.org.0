Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004913484D4
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 23:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238881AbhCXWpv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 18:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238873AbhCXWpg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 18:45:36 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CF0C06174A;
        Wed, 24 Mar 2021 15:45:36 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o5so45273qkb.0;
        Wed, 24 Mar 2021 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hh26ULFb4wq8BYHUWw0+QpzKKrkXdQqjX8h/lbFDYEU=;
        b=iH54P25ntpvVjviAnClmCW1o71Q8VoEHNJvYAe/C2ouayJ0wMAGfThDSF8db8xYeE8
         AzCp4bkFHyawLz42l/HiLd43JP5/6qheRX/aSxKIWxYx8DYGNjGKjyJBYFRDA0vJ8REE
         oMWLSQqhOVDe6o+Ed7VmrQe2TIyFWzChl0n9w8qEuZ7e+fgJrlDPTpGRKaMD/NItuHjF
         AnJCpjZD87iWJl2ke7ZWi35WWVMbJMxK1C5Uq8lWl0dYDmPIQht/5ClIeiqiNllF3tQw
         q8py2hsH8bQU6VQrJcR1bInLfF1vNikdXc2+gea5dilDKdyet+kSaHK5ShB01CQ4pNEB
         V94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hh26ULFb4wq8BYHUWw0+QpzKKrkXdQqjX8h/lbFDYEU=;
        b=ODF9YNp4z8ksjkQVDL9HQD0JyMo6wEaVFoskyfYZNlAGHwPAMNru6OzQUt0rlUUMWt
         SnMW1qspJOpslAW9Ts2DU118C1ZFkJYqj3H2veB9EqSeQlKrxJ4qZlP68U800JWMpNOh
         kR5vy4p1d7qQsnDMItxuQH88khEpDjFHRIyk7AKIAR3g7ulVe/d8IvLYQYQRPJUfdC9P
         xQClo3fcwRYMP8XvlktTQVg3uy1B5htYP5mXmDvkL1bHADaHUEWC15KIXioHHpGR0az8
         3jHvy25S9NIA/xjsNRQsONVVoP/R9GkvMhXJXJ/csz0+1QlDfe2Y8IfUrWIy165Vz/ah
         u0EQ==
X-Gm-Message-State: AOAM532UtPK3X6TWxeYnIMKp59OapJBK7ZJ+hPgMb7L8MU55PgBPm+i7
        4I00eBeGWiYuC1b7Z/oS3e8=
X-Google-Smtp-Source: ABdhPJxyMmEaltxjhHYfydLE6/aXk0Eow2tJzvZFTUp4GSdzNgraqf2eiIQXNGRBN1mcJA4fE5+P7g==
X-Received: by 2002:a37:660e:: with SMTP id a14mr5239578qkc.35.1616625935999;
        Wed, 24 Mar 2021 15:45:35 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id z2sm2948376qkg.22.2021.03.24.15.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 15:45:35 -0700 (PDT)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
From:   Frank Rowand <frowand.list@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
 <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
 <98697a33-a07d-6c5f-3f21-97a92ac68d3e@gmail.com>
 <20210316054236.2blnleucwr4eidfi@vireshk-i7>
 <077b75aa-6ebc-d76d-d76a-3206e7898c8c@gmail.com>
Message-ID: <1ae3b0c3-be85-e6ba-ac17-3f83fc4dd087@gmail.com>
Date:   Wed, 24 Mar 2021 17:45:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <077b75aa-6ebc-d76d-d76a-3206e7898c8c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

On 3/24/21 2:34 AM, Frank Rowand wrote:
> On 3/16/21 12:42 AM, Viresh Kumar wrote:
>> On 16-03-21, 00:36, Frank Rowand wrote:
>>> I should have looked at patch 3/5 more carefully instead of counting on
>>> Masahiro to check it out and simply build testing.
>>>
>>> Patch 3/5 does not seem correct.  I'll look over all the makefile related
>>> changes that have been accepted (if any) and patch 3/5 later today (Tuesday).
>>
>> What is already merged by Rob is what everyone reviewed and it wasn't
>> related to this .dtso/.dtbo discussion we are having. I will resend a
>> new patchset with the stuff left for merging (which will involve the
>> thing we are discussing here), so we can get a clear picture of it.
>>
> 
> Instead of doing what I suggested in my 16-03-21, 00:36 email (only
> partly quoted above), I have made most of the changes to unittest.c
> and drivers/of/unitest/unittest-data/Makefile to allow the unittest
> .dts files to be .dtso source files and .dtbo FDT files, and tested.
> One final step remaining in my work is to actually rename the *.dts
> files to *.dtso.
> 
> I hope to finish this later today (Wednesday) after getting some
> sleep.

I have submitted a patch that I _think_ removes the need for most
of patch 3/5, _other_ than the yaml rule, which I would assume is
still needed, though I did not examine it.

My patch is 
https://lore.kernel.org/r/20210324223713.1334666-1-frowand.list@gmail.com

Can you do a new patch with just the yaml rule (if Rob accepts my patch).

-Frank

