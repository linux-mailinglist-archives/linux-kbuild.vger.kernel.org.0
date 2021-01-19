Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761CD2FAEC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 03:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436460AbhASC3x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 21:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393946AbhASC3u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 21:29:50 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41F1C061573;
        Mon, 18 Jan 2021 18:29:09 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id 143so20555788qke.10;
        Mon, 18 Jan 2021 18:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A5a96MBup6onuSUFaA61fgXvDT8Dulg/5bJ/NYaThbE=;
        b=Wcp0hDKBXhyfgkunNoruGLJYVl8TyNcBXCs4AU3ookkXd+zxYM2+2Uh3nuy84xkaaZ
         n0VHycTF9BVU4BYdrpBCcrfpwyVZdPEZpFztbQ8oa2doY+8EjYLVG/8N7w1mSPdwyVVa
         ABxCshfxmTMM2FmkGkpsmD3zfqpe7H2MP3HbRhoTlwi3bF9fLN+8qjnRxpZup2qJmd59
         JuCBeOKB/PxKLW+uT3lbS1k90p3/xBy5/m+VGVoFtqngylTFanlkQTXDhtS3YgTXK+T0
         MWFy1VqK15+vQLrnPALmFg5yuPIn0Eapy40W6928ACkB10iLbmGCyNWo2iiJtth2hp96
         uNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A5a96MBup6onuSUFaA61fgXvDT8Dulg/5bJ/NYaThbE=;
        b=bnKlBMgfvgc195nwd0kdnP5b/K+MPz0SHYhoZQGv7wfkkyRBRGwqNNNoc9E1Zh2nWK
         4RY7dlwyarIpuw3rapHJ+jE3KIKHOrBsROeScFD98ryHJ5miryq8e5DiEBlLZHM0WDMA
         WITUTUbDgg1rKPJ5TH5gBsPWwo+XpV4oXNy88mqAKDZE4CfXMMQfYuGqOFbSz/QPjFEG
         AXzUsH9kpvGK8JIGAAr7fIJ2QgV+l47OEv+KBLDI292cTaIQPuprMHL5p3nu/SHLGcd/
         lDDJ/4wQG2EhOtjygyCAyAAWsxqZM+WAzViFuiOX0tmptY9X6PHOE/o4aLGNbrAaulhC
         qHWg==
X-Gm-Message-State: AOAM533dWhIEcrEoLIVpbbUtVT3T8SNV/lVl7yjPaxFdx4b4TovCh3p2
        rd7UENpp++tKAkqjGKy7avfgtiw2Vxsu0Q==
X-Google-Smtp-Source: ABdhPJyhr5A42Rg4fW26sOFuezTpP4GJC+EKPO97BS/haJX8NoMWk6/9QQX3vE7PohXzXz2TvBh8oQ==
X-Received: by 2002:a37:b6c6:: with SMTP id g189mr2453006qkf.432.1611023348890;
        Mon, 18 Jan 2021 18:29:08 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id b13sm5183477qto.43.2021.01.18.18.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 18:29:08 -0800 (PST)
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     David Gibson <david@gibson.dropbear.id.au>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
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
 <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
 <20210114050309.wokrhw4o3cjxj5uo@vireshk-i7>
 <CAL_JsqJ=jxBo2JsjNTcBnV_8OrGjUc4ZQEpdVWsfFwWb9YzyFQ@mail.gmail.com>
 <20210115054450.ab2xrohlxg7nnzpn@vireshk-i7>
 <20210118063025.GI2089552@yekko.fritz.box>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <98adbc34-4d34-bec3-bace-151d7e94ee2a@gmail.com>
Date:   Mon, 18 Jan 2021 20:29:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118063025.GI2089552@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 1/18/21 12:30 AM, David Gibson wrote:
> On Fri, Jan 15, 2021 at 11:14:50AM +0530, Viresh Kumar wrote:
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
>>>
>>> No, because overlay_base.dts is an overlay dt.
> 
> So.. I was confused for a bit here, because the overlay_base.dts
> you're discussing is the one in the kernel tree, not the one in the
> dtc tree.
> 
> The kernel file is confusing to me.  It has the /plugin/ tag which

It should be confusing to you, without having dug deeply into the
evil things that unittest does.  Unittest does a bunch of contortions
and abuse of direct access into the kernel devicetree code internals
to be able to create and test for abnormal conditions.  No other code
should emulate the bizarre things that unittest does.

-Frank

> should be used for overlays, but the rest of the file looks like a
> base tree rather than an overlay.  There's even a comment saying "Base
> device tree that overlays will be applied against".  But it goes on to
> talk about __fixups__ and __local__fixups__ which will never be
> generated for a based tree.
> 
> Oh.. and then there's terminology confusion.  dtc has had compile time
> resolved overlays for a very long time.  Those are usually .dtsi
> files, and should generally not have /plugin/.
> 
> More recent is the support for run-time overlays - .dtbo output files,
> which are usually generated from a .dts with /plugin/.  They usually
> should *not* have a "/ { ... } " stanza, since that indicates the base
> portion of the tree.
> 
>> What property of a file makes it an overlay ? Just the presence of
>> /plugin/; ?
> 
> Yes and no.  Generally that's how it should work , but it looks to me
> like the presence of /plugin/ there is just wrong.  /plugin/ basically
> just activates some extra dtc features, though, so it is possible to
> "manually" construct a valid overlay without it.
> 
>> David, we are talking about the overlay base[1] file here. The
>> fdtoverlay tool
>> fails to apply it to testcases.dts file (in the same directory) because none of
>> its nodes have the __overlay__ label and the dtc routine overlay_merge() [2]
>> skips them intentionally.
> 
> testcases.dts also has /plugin/ and again, it's not really clear if
> that's right.
> 
> The point of /plugin/ is that it will automatically generate the
> __overlay__ subnodes from dtc's &label { ... } or &{/path} { ... }
> syntax, so you wouldn't expect to see __overlay__ in the source.
> 
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

