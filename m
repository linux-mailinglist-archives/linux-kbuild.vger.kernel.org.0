Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA2B2EE652
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 20:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbhAGTmw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 14:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbhAGTmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 14:42:52 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA62EC0612F6
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Jan 2021 11:42:11 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id g24so5034099qtq.12
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jan 2021 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CLKyO0V7gDngVlGI7pgl0SlpTEPLmQs9Jw8dHDtXgak=;
        b=ZrGnMcWt5YlDl9xLPUa/NZ2qTa+ZV8kU9SmgDHeQtZcIH3xPBmsNo1pG1z/I4HpNxX
         ZevcNOde/mrT04xMjFFt9+ZTbAQyRwVqGpPDb7PIQHFoe4MjMqH/U+SqwuAHj27L/KJg
         94G2jJFEvmvE1cuX5rTfgKJEYyk89vMLGp6wVC5zAlb2cnH0Qi8QPy2tqpKkqE3WPQBh
         kpwg/iJcOHOTvYLL1f1FOlTAz+TlVaI+ieFCTAAtWzOXW/CzipP4qsd3Yb6RpRDyX0Ti
         qORGuRx18TSYalpg5ehKEeuzaR2uTD3zkkADvkjsgJ2USIeHEElgFJMikGSF/0XT5Qng
         9Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CLKyO0V7gDngVlGI7pgl0SlpTEPLmQs9Jw8dHDtXgak=;
        b=jjCetqwveCGuCNBrEq229Rd63G4JcoZjIBAFgKTDBa9Bj2m2aVGOyvlW3mVHHaOyAa
         +huu/KMfbq03v43KbpIr8sVy23jvPf0p3gpHxn/AZJvnxFdwlFfbLpUhwRaZSB++ztJE
         GFu4ld+7I5pqLiljUz4YZaOT3YrAmAJlgBXzp3qOyeMzyYOHf8wBoHSXEwGgZ8WZ59XF
         fIIie9PKZyyej/PjlXoAQw3Nnq1HopMS0EKX7H8etVSRF8QfoYZSVQcu2/Qcik1HytkL
         LRkHMOCGIK/K+u9y960YPVWtPeSs0+aZVNO/0jvHazIoZyei+1sn4cAMFhx6ydWzUsZi
         AV5Q==
X-Gm-Message-State: AOAM532Kyc1s5hSkywRnnnh/qjB0kjKFmb6HZqgw7F+lMdTNhvOIdJ56
        eS2tvAkSWUgUOmLFhRkfMeqTRA==
X-Google-Smtp-Source: ABdhPJxOXy6evhdqwl97isTQM5M9r4VhmoGo6e1D+pUsNPYP0PivH0cLY6sWlls2AshSXfoZK/Yn1Q==
X-Received: by 2002:ac8:578d:: with SMTP id v13mr170661qta.247.1610048530863;
        Thu, 07 Jan 2021 11:42:10 -0800 (PST)
Received: from ?IPv6:2601:144:4100:fd1:12bf:48ff:fed7:9537? ([2601:144:4100:fd1:12bf:48ff:fed7:9537])
        by smtp.gmail.com with ESMTPSA id x49sm3430907qtx.6.2021.01.07.11.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 11:42:09 -0800 (PST)
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
To:     Rob Herring <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        tero.kristo@gmail.com
References: <cover.1609844956.git.viresh.kumar@linaro.org>
 <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
 <CAL_Jsq+DFF0tRv61XCAGLJYYu=ow8Ah8prd6su=6dpoU_AyMXw@mail.gmail.com>
From:   Bill Mills <bill.mills@linaro.org>
Message-ID: <a01a68c5-fbc9-92dd-e374-6839fd8a93e2@linaro.org>
Date:   Thu, 7 Jan 2021 14:42:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+DFF0tRv61XCAGLJYYu=ow8Ah8prd6su=6dpoU_AyMXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

On 1/7/21 2:02 PM, Rob Herring wrote:
> On Wed, Jan 6, 2021 at 10:35 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Wed, Jan 6, 2021 at 12:21 AM Rob Herring <robh+dt@kernel.org> wrote:
>>>
>>> On Tue, Jan 5, 2021 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>>
>>>> Hello,
>>>>
>>>> Here is an attempt to make some changes in the kernel to allow building
>>>> of device tree overlays.
>>>>
>>>> While at it, I would also like to discuss about how we should mention
>>>> the base DT blobs in the Makefiles for the overlays, so they can be
>>>> build tested to make sure the overlays apply properly.
>>>>
>>>> A simple way is to mention that with -base extension, like this:
>>>>
>>>> $(overlay-file)-base := platform-base.dtb
>>>>
>>>> Any other preference ?
>>
>>
>>
>> Viresh's patch is not enough.
>>
>> We will need to change .gitignore
>> and scripts/Makefile.dtbinst as well.
>>
>>
>> In my understanding, the build rule is completely the same
>> between .dtb and .dtbo
>> As Rob mentioned, I am not sure if we really need/want
>> a separate extension.
>>
>>
>> A counter approach is to use an extension like '.ovl.dtb'
>> It clarifies it is an overlay fragment without changing
>> anything in our build system or the upstream DTC project.

*.dtbo is already a well established defato standard.  I see little 
value in changing it and doing so will likely just bifurcate common usage.

>>
>> We use chained extension in some places, for example,
>> .dt.yaml for schema yaml files.
>>
>>
>>
>> dtb-$(CONFIG_ARCH_FOO) += \
>>      foo-board.dtb \
>>      foo-overlay1.ovl.dtb \
>>      foo-overlay2.ovl.dtb
>>
>>
>> Overlay DT source file names must end with '.ovl.dts'
> 
> I like that suggestion as then it's also clear looking at the source
> files which ones are overlays. Or we'd need .dtso to be consistent.
> 

I don't think there is much of a problem renaming the source side.
Don't know if that helps if the output is still dtbo.

"Be consistent on dtso" sounds good to me.
Can it be enforced via build time checks?

> 
>>> I think we'll want something similar to how '-objs' works for modules:
>>>
>>> foo-board-1-dtbs := foo-board.dtb foo-overlay1.dtbo
>>> foo-board-2-dtbs := foo-board.dtb foo-overlay2.dtbo
>>> foo-board-1-2-dtbs := foo-board.dtb foo-overlay1.dtbo foo-overlay2.dtbo
>>> dtbs-y += foo-board-1.dtb foo-board-2.dtb foo-board-1-2.dtb
>>>
>>> (One difference here is we will want all the intermediate targets
>>> unlike .o files.)
>>>
>>> You wouldn't necessarily have all the above combinations, but you have
>>> to allow for them. I'm not sure how we'd handle applying any common
>>> overlays where the base and overlay are in different directories.
>>
>>
>> I guess the motivation for supporting -dtbs is to
>> add per-board -@ option only when it contains *.dtbo pattern.
> 
> I hadn't thought that far, but yeah, that would be good. Really, I
> just want it to be controlled per SoC family at least.
> 
>> But, as you notice, if the overlay files are located
>> under drivers/, it is difficult to add -@ per board.
> 
> Generally, they shouldn't be. The exceptions are what we already have
> there which are old dt fixups and unittests.
> 
> We want the stripped DT repo (devicetree-rebasing) to have all this
> and drivers/ is stripped out. (Which reminds me, the DT repo will need
> some work to support all this. It's a different build sys.)
> 
>> Another scenario is, some people may want to compile
>> downstream overlay files (i.e. similar concept as external modules),
>> then we have no idea which base board should be given with the -@ flag.
>>
>>
>> I'd rather be tempted to add it globally
>>
>>
>> ifdef CONFIG_OF_OVERLAY
>> DTC_FLAGS += -@
>> endif
> 
> We've already rejected doing that. Turning on '-@' can grow the dtb
> size by a significant amount which could be problematic for some
> boards >
>>> Another thing here is adding all the above is not really going to
>>> scale on arm32 where we have a single dts directory. We need to move
>>> things to per vendor/soc family directories. I have the script to do
>>> this. We just need to agree on the vendor names and get Arnd/Olof to
>>> run it. I also want that so we can enable schema checks by default
>>> once a vendor is warning free (the whole tree is going to take
>>> forever).
>>
>>
>> If this is a big churn, perhaps we could make it extreme
>> to decouple DT and Linux-arch.
> 
> I would be fine with that, but I don't think we'll get agreement
> there. With that amount of change, we'll be discussing git submodule
> again.
> 
> Rereading the thread on vendor directories[1], we may just move boards
> one vendor at a time. We could just make that a prerequisite for
> vendor supporting overlays.
> 
>> arch/*/boot/dts/*.dts
>>   ->  dts/<vendor>/*.dts
>>
>> Documentation/devicetree/bindings
>>   -> dts/Bindings/
>>
>> include/dt-bindings/
>>   -> dts/include/dt-bindings/
>>
>>
>>
>> Then, other project can take dts/
>> to reuse for them.
> 
> This is already possible with devicetree-rebasing.git. Though it is
> still by arch.
> 
> Rob
> 
> [1] https://lore.kernel.org/linux-devicetree/20181204183649.GA5716@bogus/
> 

Thanks for digging up this script!

Bill
