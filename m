Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14DE2324890
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Feb 2021 02:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235934AbhBYBdi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Feb 2021 20:33:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbhBYBd2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Feb 2021 20:33:28 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2ACC06174A;
        Wed, 24 Feb 2021 17:32:47 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id b14so4313731qkk.0;
        Wed, 24 Feb 2021 17:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sxobYNDdmnitT8UneGE6qosre2Zhd+o312D7yIEQ2XY=;
        b=FxrO57kKWEkgNi+GoGWWDcpQQmM6Uai7nlVTg0v2HSTH9lqB35/uRJBTScb2C7bl4Q
         Ep+O7YX2Fd6ws2IRZMvqXu4REQ9mfEMjn/pNuiQrSp/deWytosNL3r98efjGEwYJ04Au
         WkzlZKM3u4QhwsrY+fMUFJ5FjIZ9wHK5EX9eFq4zPfbK7UhvguRriXSFEjZiNTI7pI46
         sObQkDGSId0SfbL0o2miSN7utDbPOWBLSMmLx/jrD7dYAFEIWYmJv4gpEly0/1YLUPaH
         Z0Jfetu0y/c+dCcKfehCDhQsQNWXV/bkhafvl/qisxx7sYzWR3zQWPSwg+n2O2+djYZ8
         aX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sxobYNDdmnitT8UneGE6qosre2Zhd+o312D7yIEQ2XY=;
        b=JqoKR9sMcd0BgqUhJgbDXzW2ay4yyl420A0S2xi1PoiG8wxJxMNloFAp/pxZv8fcfT
         j3/ad0uyNgwYKLqxlEFBe8hLpuuAyfSls67KCVgdjCVT9XmP+aibKaFTvn8CSCKAI7Cg
         MHjNVqtEORkqmNqwfAHODSBzZP3onxNFCHemuPuqpUNh8Kw4yXxrleoSKdUxEmPJNprY
         DyBEuEJpA2+CNMbLNTx3TR1jMbckUIuUF620sRz97nfnO5x2oUrIzp3vGYBiC1ZN7ReE
         JA6Kd7pJlE5TvLeNbKvle/hbw0LahAbMyJ1DKleyfyjy8Xqfdw0NxG1agHjdZ6yXjoqd
         oYdQ==
X-Gm-Message-State: AOAM533itB/4TJ7Te3SCj7+xekzhY+8f26u51E3PmxfsKshCH0NolSxp
        tEaDuhlfXF00Q3C+Ops5VXQ=
X-Google-Smtp-Source: ABdhPJy38UBebVlJgO74jAIKdWKJJZB8cF/oQfac/xHznukwAjqdTTPWWVVFhl7DoXSXrjFd1wNf/w==
X-Received: by 2002:a05:620a:a19:: with SMTP id i25mr806122qka.136.1614216766901;
        Wed, 24 Feb 2021 17:32:46 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id u4sm2903628qkc.42.2021.02.24.17.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 17:32:46 -0800 (PST)
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
To:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
References: <cover.1611904394.git.viresh.kumar@linaro.org>
 <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
 <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
 <20210205095545.woevnkxg3ar7ctys@vireshk-i7>
 <CAMuHMdXKT3LD3ojMJEg-oHsEKO5TN5P1BTJMyf2fYkhnC8PU=Q@mail.gmail.com>
 <20210205210814.GA3707622@robh.at.kernel.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <02728dac-5666-9c2b-bd46-9c2eabbb2ed8@gmail.com>
Date:   Wed, 24 Feb 2021 19:32:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205210814.GA3707622@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2/5/21 3:08 PM, Rob Herring wrote:
> On Fri, Feb 05, 2021 at 11:17:10AM +0100, Geert Uytterhoeven wrote:
>> Hi Viresh,
>>
>> On Fri, Feb 5, 2021 at 10:55 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>> On 05-02-21, 10:41, Geert Uytterhoeven wrote:
>>>> On Fri, Feb 5, 2021 at 10:25 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>>> On 05-02-21, 10:02, Geert Uytterhoeven wrote:
>>>>>> Thanks for your patch
>>>>>> (which I only noticed because it appeared in dt-rh/for-next ;-)
>>>>>>
>>>>>> On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>>>>> Add support for building DT overlays (%.dtbo). The overlay's source file
>>>>>>> will have the usual extension, i.e. .dts, though the blob will have
>>>>>>
>>>>>> Why use .dts and not .dtso for overlays?
>>>>>> Because you originally (until v5) had a single rule for building .dtb
>>>>>> and .dtbo files?
>>>>>
>>>>> I am fine with doing that as well if Rob and David agree to it. Rob
>>>>> did suggest that at one point but we didn't do much about it later on
>>>>> for some reason.
>>>>>
>>>>> FWIW, this will also require a change in the DTC compiler.
>>>>
>>>> Care to explain why? I've been using .dtsi for ages in
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays
>>>
>>> I don't see you building them anywhere, they aren't added to the
>>> Makefile ever. What am I missing ?
>>>
>>> actually none of the dtso's were added to any makefile in that branch.
>>
>> E.g. "ARM: dts: Build all overlays if OF_OVERLAY=y"?
>> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=597ee90971687a45678cca8d16bf624d174a99eb
>>
>>> Anyway, the DTC needs to know how to treat the dtso format and it will
>>> error out currently with unknown format kind of errors.
>>>
>>> Below email [1] have some information on the kind of changes required
>>> here. Also note that we had to do similar changes for dtbo earlier
>>> [2].
>>>
>>> --
>>> viresh
>>>
>>> [1] https://lore.kernel.org/lkml/CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com/
>>
>> -@ is handled by "kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used"
>> https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=91e9d998514f3743125a707013a30d5f83054579
>>
>>> [2] https://lore.kernel.org/lkml/30fd0e5f2156665c713cf191c5fea9a5548360c0.1609926856.git.viresh.kumar@linaro.org/
>>
>> I never had a need for those changes to dtc. .dtso/.dtbo work fine regardless.
> 
> I think what Viresh means is dtc won't automatically set the input type 
> to dts if not .dts.
> 
> We stuck with .dtbo as it's already widely used. I don't know about 
> dtso though. If there's strong consensus to use .dtso, then let's do 
> that. Whatever color for this shed you like.

I overlooked this and mistakenly thought that the move to .dtbo also
involved changing to .dtso.  My bad.

My favorite color here is to use .dtso for the source file that will
be compiled to create a .dtbo.

Linus has already accepted patch 4/6 to 5.12-rc1, so changing to .dtso
will require another patch.

-Frank

> 
> Rob
> 

