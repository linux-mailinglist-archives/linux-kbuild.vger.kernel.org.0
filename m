Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1662FAEC6
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 03:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436916AbhASCbZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 21:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436904AbhASCbY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 21:31:24 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1262CC061573;
        Mon, 18 Jan 2021 18:30:44 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id l14so8498954qvh.2;
        Mon, 18 Jan 2021 18:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tcGRKxC+8RSf5VOLfan6hcx4fCQW3bMFK5frePWxInE=;
        b=UkkX9IyfmqDSnqHeydSmTi8+ggVmaGmI5v1YRTKBVjrSMUq7wwITYaNlqAbaagmvJ/
         ajm2aipxA93kzbU1Z6DfunVJi1Y5aNw3cZ2cmMPfyRWo2Dy+FE9DSLC7/YOq5JqsyZ5i
         BU1b/7s70sPm55Hjl8cHZ9RyjOmkEmNTw202u0F+q8Sgl2kCw79H7/k3EGwEvjqE5X9M
         AEJT/EpMW+KlQ+k7OPvz/K127IzL5rbovR68FnFoamtpTZv1Iuickh+RXVlKlWjUAibP
         vWJL2m86IS4VTnILC3nRiI8joSjMbyZ2GMg8O9RxpZO5cvyqwYx3Mra06xv/YdO7gbP5
         Vh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tcGRKxC+8RSf5VOLfan6hcx4fCQW3bMFK5frePWxInE=;
        b=hWmaJJr3/KIe9tJrIXnCRenWyRRpO4eNl8FtFFocNK/8HrQWwDHMRr1/PcE5nfCvaf
         r7TE2NLJO663GmxvjzysALZYYvt9ihPCOfa9cOlsKm4qtkkvdXWOYxikLQf+mMNA8RUS
         LQITouwuyCYRL1zBAK1IPA+QJ26B4esZEk6MrZoQ64PKksgZa6SgkcW5GjoHYBMHv5Bf
         H2Kl3ROLdrpP0R11h2SRr0XLvYjl5c1af9ePVhl4KX37ViQrErH0PIEROSNh2rF2jo+v
         kyPXN/bGL8WKpsECfw/Mo7O+6wzbo9o2QBpZFcrakY/Jc5iAzItgEd/f0f8HBLYVmfft
         t6Cw==
X-Gm-Message-State: AOAM530eFtHv6vw6+5r3aPAESnLiTQPsX9dwpZDT/zkhog6SmY9rK3hY
        oyugR3oXJa1356meqHQjb/0=
X-Google-Smtp-Source: ABdhPJwlZCWbQAujD45z0a44DYJLF+mfnKokiIa5wAQGuwALEKZz/d6tRYATwq6Ood3DycWSjdH49g==
X-Received: by 2002:a05:6214:622:: with SMTP id a2mr2251498qvx.57.1611023443173;
        Mon, 18 Jan 2021 18:30:43 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id x49sm11899683qtx.6.2021.01.18.18.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 18:30:42 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
From:   Frank Rowand <frowand.list@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
 <20210114050309.wokrhw4o3cjxj5uo@vireshk-i7>
 <CAL_JsqJ=jxBo2JsjNTcBnV_8OrGjUc4ZQEpdVWsfFwWb9YzyFQ@mail.gmail.com>
 <20210115054450.ab2xrohlxg7nnzpn@vireshk-i7>
 <310774b2-1df6-b219-1b6d-70b8bdbb2e26@gmail.com>
Message-ID: <86f817a0-0114-94a5-997e-33fbc750abb3@gmail.com>
Date:   Mon, 18 Jan 2021 20:30:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <310774b2-1df6-b219-1b6d-70b8bdbb2e26@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/17/21 9:54 PM, Frank Rowand wrote:
> Hi Viresh,
> 
> On 1/14/21 11:44 PM, Viresh Kumar wrote:
>> +David,
>>
>> On 14-01-21, 09:01, Rob Herring wrote:
>>> On Wed, Jan 13, 2021 at 11:03 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>>
>>>> On 11-01-21, 09:46, Rob Herring wrote:
>>>>> On Fri, Jan 8, 2021 at 2:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>>>>>
>>>>>> Now that fdtoverlay is part of the kernel build, start using it to test
>>>>>> the unitest overlays we have by applying them statically.
>>>>>
>>>>> Nice idea.
>>>>>
>>>>>> The file overlay_base.dtb have symbols of its own and we need to apply
>>>>>> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
>>>>>> us intermediate-overlay.dtb file.
>>>>>
>>>>> Okay? If restructuring things helps we should do that. Frank?
>>>>
>>>> Frank, do we want to do something about it ? Maybe make overlay_base.dts an dtsi
>>>> and include it from testcases.dts like the other ones ?
> 
> I was not able to look at this until tonight.  The unittest world is somewhat
> convoluted and complex.  Not at all a normal OF environment since it is directly
> using both dynamic OF code and overlay apply/remove code.  Not to mention
> deliberately misformed devicetree (.dts) data.  And totally hacking the loading
> of FDTs in additional ways.
> 
> It is late Sunday night here (almost 10:00pm), so I am going to look at this
> first thing Monday morning.

I sent comments in the form of a patch to the original patch email.

-Frank

> 
>>>
>>> No, because overlay_base.dts is an overlay dt.
>>
>> What property of a file makes it an overlay ? Just the presence of /plugin/; ?
> 
> The "/plugin/;" in a dts file is what tells the dtc compiler to process the source
> file as an overlay instead of as a base.
> 
>>
>> David, we are talking about the overlay base[1] file here. The fdtoverlay tool
>> fails to apply it to testcases.dts file (in the same directory) because none of
>> its nodes have the __overlay__ label and the dtc routine overlay_merge() [2]
>> skips them intentionally.
>>
>>> I think we need an
>>> empty, minimal base.dtb to apply overlay_base.dtbo to.
>>
>> One way out is adding an (almost-empty) testcase-data-2 in testcases.dtb, that
>> will make it work.
>>
>>> And then fdtoverlay needs a fix to apply overlays to the root node?
>>
>> It isn't just root node I think, but any node for which the __overlay__ label
>> isn't there.
>>
>> So this can make it all work if everyone is fine with it:
> 
> I'll look this over Monday morning to see what the side effects are in the
> bizarre world of unittest.
> 
>>
>> diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unittest-data/overlay_base.dts
>> index 99ab9d12d00b..59172c4c9e5a 100644
>> --- a/drivers/of/unittest-data/overlay_base.dts
>> +++ b/drivers/of/unittest-data/overlay_base.dts
>> @@ -11,8 +11,7 @@
>>   * dtc will create nodes "/__symbols__" and "/__local_fixups__".
>>   */
>>  
>> -/ {
>> -       testcase-data-2 {
>> +       &overlay_base {
>>                 #address-cells = <1>;
>>                 #size-cells = <1>;
>>  
>> @@ -89,5 +88,3 @@ retail_1: vending@50000 {
>>                 };
>>  
>>         };
>> -};
>> -
>> diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
>> index a85b5e1c381a..539dc7d9eddc 100644
>> --- a/drivers/of/unittest-data/testcases.dts
>> +++ b/drivers/of/unittest-data/testcases.dts
>> @@ -11,6 +11,11 @@ node-remove {
>>                         };
>>                 };
>>         };
>> +
>> +       overlay_base: testcase-data-2 {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +       };
>>
>> -------------------------8<-------------------------
>>
>> And then we can do this to the Makefile over my changes.
>>
>> -------------------------8<-------------------------
>>
>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
>> index 9f3eb30b78f1..8cc23311b778 100644
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
>> @@ -41,7 +41,6 @@ DTC_FLAGS_testcases += -Wno-interrupts_property
>>  
>>  # Apply all overlays (except overlay_bad_* as they are not supposed to apply and
>>  # fail build) statically with fdtoverlay
>> -intermediate-overlay   := overlay.dtb
>>  master                 := overlay_0.dtb overlay_1.dtb overlay_2.dtb \
>>                            overlay_3.dtb overlay_4.dtb overlay_5.dtb \
>>                            overlay_6.dtb overlay_7.dtb overlay_8.dtb \
>> @@ -50,15 +49,12 @@ master                      := overlay_0.dtb overlay_1.dtb overlay_2.dtb \
>>                            overlay_gpio_01.dtb overlay_gpio_02a.dtb \
>>                            overlay_gpio_02b.dtb overlay_gpio_03.dtb \
>>                            overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
>> -                          intermediate-overlay.dtb
>> +                          overlay_base.dtb overlay.dtb
>>  
>>  quiet_cmd_fdtoverlay = fdtoverlay $@
>>        cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
>>  
>> -$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
>> -       $(call if_changed,fdtoverlay)
>> -
>>  $(obj)/master.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(master))
>>         $(call if_changed,fdtoverlay)
>>  
>> -always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
>> +always-$(CONFIG_OF_OVERLAY) += master.dtb
>>
> 
> .
> 

