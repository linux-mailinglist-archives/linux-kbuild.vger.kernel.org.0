Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50C22F3DB4
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 01:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436850AbhALVhJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 16:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436627AbhALUGD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 15:06:03 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307C4C061575;
        Tue, 12 Jan 2021 12:05:23 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id v126so3043989qkd.11;
        Tue, 12 Jan 2021 12:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Ek/S66n/YPIY8vj0Y9R0VXJUIiyn0553JvDZmdg604=;
        b=iE9TOXX+pavnsc5a91+ztiZIY+jyc00AJWIOS24T9pMAovmK7q1zV/SWxH9EkA1X+q
         cTdT1v/t2imk4Hmt7NNFvgHjTvj+Q97BhcB/bn3Wtp7OwbW15YWByaSrktnttYrJsgBC
         Qsh+kkVeCzcehO0nldJ/i1iwukimzx24pkt6WcregveUBqpiIOABY8wJWBECLauZKTUL
         FJ32CmHZndzsVmAF0gP4stKu6AV//721DMyuI8mLvvcANCboCGoAYfFWSz1YkKNZEV+O
         v/6+8gfOeSiib0OkGhNCdWWg2YRDy4pGevx9f1LNGBlRO8H2HZfz/n5LqmwJpKmxMP0S
         VxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Ek/S66n/YPIY8vj0Y9R0VXJUIiyn0553JvDZmdg604=;
        b=Vewk6U5UstCEkBLbAePWH0Xz5D14xXqqsvQ2mc+9cJJLJ2nBda7Nrkz7LdKxbtCNqJ
         qHE7YUEWJ4iBWWbI0sdPqkAi8zckJ6YYYw9Iw+kYWycpBUMuYeBryFxcHqrnOCUwEysl
         AOUFFghRXFAA7uZsRXJFJ59RVSscC2azzIgAVG3l/E3m8puQ7VPHqeHCLeceBWgIYBWu
         QbG15nwv2MG5OApJn7pJWk+NrVncFvjk/s4gOOcDJLnQO8TWQ7FnXj9LF003HYK1y7aN
         4Z2ux19N7Vr6Xc6UndQTqVwt4w4du9rwKyhns4vm6jPCZHP221mSOM5KGdYZWMr/nFNl
         F5ZQ==
X-Gm-Message-State: AOAM530YUSvKJB0emFAGw2IZFcS8D6sS1WrBcZZeAkCcwQqHeElvKAIA
        SFMD14QWm0zcKWSoFkzQDUUud6WrmclVvg==
X-Google-Smtp-Source: ABdhPJy+URHHl6u2aHVYYDkyqNwaO+EWqI1St4w5BosBHt4oFQuobWz0wYacOIVGGtkzZdpGsd1jFQ==
X-Received: by 2002:a37:9c07:: with SMTP id f7mr1152042qke.234.1610481922303;
        Tue, 12 Jan 2021 12:05:22 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id x20sm1980715qkj.18.2021.01.12.12.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 12:05:21 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
 <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
 <e549c7ce-d01e-08a3-9ed0-7325a34e9c29@gmail.com>
 <CAL_Jsq+W4X5H2myCzX1bGTEqJG9dpwLXdmqbpq6oGm5wpF7WMQ@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <de50f7a5-d0d7-86b0-a1eb-84a91438b586@gmail.com>
Date:   Tue, 12 Jan 2021 14:05:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+W4X5H2myCzX1bGTEqJG9dpwLXdmqbpq6oGm5wpF7WMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/12/21 1:41 PM, Rob Herring wrote:
> On Tue, Jan 12, 2021 at 1:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 1/12/21 8:04 AM, Rob Herring wrote:
>>> On Mon, Jan 11, 2021 at 4:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>
>>>> On 1/8/21 2:41 AM, Viresh Kumar wrote:
>>>>> Now that fdtoverlay is part of the kernel build, start using it to test
>>>>> the unitest overlays we have by applying them statically.
>>>>>
>>>>> The file overlay_base.dtb have symbols of its own and we need to apply
>>>>> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
>>>>> us intermediate-overlay.dtb file.
>>>>>
>>>>> The intermediate-overlay.dtb file along with all other overlays is them
>>>>> applied to testcases.dtb to generate the master.dtb file.
>>>>>
>>>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>>>>
>>>> NACK to this specific patch, in its current form.
>>>>
>>>> There are restrictions on applying an overlay at runtime that do not apply
>>>> to applying an overlay to an FDT that will be loaded by the kernel during
>>>> early boot.  Thus the unittest overlays _must_ be applied using the kernel
>>>> overlay loading methods to test the kernel runtime overlay loading feature.
>>>
>>> This patch doesn't take away from any of that and it completely orthogonal.
>>
>> Mea culpa.  I took the patch header comment at face value, and read more into
>> the header comment than what was written there.  I then skimmed the patch
>> instead of actually reading what it was doing.
>>
>> I incorrectly _assumed_ (bad!) that the intent was to replace applying the
>> individual overlay dtb's with the master.dtb.  Reading more closely, I see
>> that the assumed final step of actually _using_ master.dtb does not exist.
>>
>> So, yes, I agree that the patch as written is orthogonal to my concern.
>>
>> My updated understanding is that this patch is attempting to use the existing
>> unittest overlay dts files as source to test fdtoverlay.  And that the resulting
>> dtb from fdtoverlay is not intended to be consumed by the kernel unittest.
> 
> The goal is not to test fdtoverlay. dtc unittests do that. The goal is
> testing overlays we expect to be able to apply can actually apply and
> doing this at build time. That's also the goal for all the 'real'
> overlays which get added.
> 
>> I do not agree that this is a good approach to testing fdtoverlay.  The
>> unittest overlay dts files are constructed specifically to test various
>> parts of the kernel overlay code and dynamic OF code.  Some of the content
>> of the overlays is constructed to trigger error conditions in that code,
>> and thus will not be able to be processed without error by fdtoverlay.
> 
> Then those should be omitted.
> 
>> Trying to use overlay dts files that are constructed to test runtime kernel
>> code as fdtoverlay input data mixes two different test environments and
>> objectives.  If fdtoverlay test cases are desired, then fdtoverlay specific
>> dts files should be created.
>>
>>>
>>>> I agree that testing fdtoverlay is a good idea.  I have not looked at the
>>>> parent project to see how much testing of fdtoverlay occurs there, but I
>>>> would prefer that fdtoverlay tests reside in the parent project if practical
>>>> and reasonable.  If there is some reason that some fdtoverlay tests are
>>>> more practical in the Linux kernel repository then I am open to adding
>>>> them to the Linux kernel tree.
>>>
>>> If you (or more importantly someone else sending us patches) make
>>> changes to the overlays, you can test that they apply at build time
>>> rather than runtime. I'll take it! So please help on fixing the issue
>>> because I want to apply this.
>>
>> If the tests can be added to the upstream project, I would much prefer
>> they reside there.  If there is some reason a certain test is more
>> suited to be in the Linux kernel source tree then I also would like
>> it to be accepted here.
> 
> Again, this is just about doing sanity checks at build time rather
> than *only* rely on runtime.

I'm fine with adding tests for applying overlays at build time (in
other words, tests of fdtoverlay).

But the constraints on applying an overlay at build time are different
than the runtime constraints.

The existing unittest overlay dts files are not designed to test applying
overlays at build time.  Tests for fdtoverlay should be designed to test
that overlays that meet the build time constraints can be applied
properly by fdtoverlay, and that overlays that fail to meet those
constraints are rejected by fdtoverlay.

Trying to use the same data (dts) files for tests that have different
constraints is likely to make both tests more fragile when a data file
is modified for one environment without careful consideration of the
other environment.

> 
>>>
>>> And yes, dtc has fdtoverlay tests. But this patch shows there's at
>>> least 2 issues,
>>
>>
>>> fdtoverlay can't apply overlays to the root
>>
>> A test of that definitely belongs in the upstream project.
> 
> Yes, agreed.
> 
>>> and using an overlay as the base tree in UML is odd IMO.
>>
>> Am I still not fully understanding the patch?  I'm missing how
>> this patch changes what dtb is used as the base tree in UML.
> 
> This was more my theorising why Viresh is having problems in that
> perhaps fdtoverlay can't take an overlay as a base DT while the kernel
> can and does for UML. The fact that it works for UML seems wrong to
> me.

I'll have to go back and look at UML.  I didn't recall that the base
FDT for UML was an overlay.

-Frank

> 
> Rob
> 

