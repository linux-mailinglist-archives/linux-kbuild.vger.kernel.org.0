Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 879F8631CE7
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Nov 2022 10:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbiKUJfM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Nov 2022 04:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiKUJfK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Nov 2022 04:35:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D3A12AEA
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2022 01:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669023256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hSL7iPhqzb6BVRuHX/pf0VlrJ6CrPEm/cfGHRQ6j144=;
        b=OGkpS6l4O9P0o+JcoEd2qYbUFo0F5DPQWGWdcW+qj2gCFCnS8V8n5BQznVHxwLauDQOzKC
        wszU+JT+ZSsDJrJKt576f84P0Nj8c75x1eCt5ASofPYk/qrJVHbnbCH4pCxUOzBE5MiLyn
        j3vGRABt7Yf1HOKbwDf+w6iA/zvleGo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-M9boXARfN_CRZH1vM6T-Wg-1; Mon, 21 Nov 2022 04:34:14 -0500
X-MC-Unique: M9boXARfN_CRZH1vM6T-Wg-1
Received: by mail-ed1-f72.google.com with SMTP id y20-20020a056402271400b004630f3a32c3so6437758edd.15
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2022 01:34:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSL7iPhqzb6BVRuHX/pf0VlrJ6CrPEm/cfGHRQ6j144=;
        b=At2saaDdMOFiAfaHy6FXuBVMCkWWjG5RDVz8OkYbLdPXkHK3Mvj2I85UNCRGYNXpj6
         nRNLCgoN39xuUURLzrADHiJ1tVzW53ZiyGL7cTQGyy4DrOGgSTfRaGnDsy76cYvNXtt4
         kqtFb/zw54dz9Nf9oncqxD/IvXcaQitLxKgmN0pBwynXb8Hj4ODdp3/mfuowKW7wYJp5
         kwbLo/HQx51Q+vZFkDQ6HLByLs/NuXhpm+/5NlZXLB2UDVcsAZmp8DDcOSm9eZoNcr0G
         e1EID2zQeIOYRx+4eoOl338b3CQZx15Rp+5pfgC8qyBQnFfGlUhENYCGDbYkWedxVR1q
         pO+g==
X-Gm-Message-State: ANoB5pkxKtwqe1nrvwAzeNkLDu4KSifEDHE+yEO1bwiZd9t7mhwADHEq
        aOfmLCMyfnNpv8s+zl8Y9ybU/YlCYoP0NUqxvninVY5kRasNPbT/7MSQ1v+bpWa8RODhKz5giG+
        JhOUZNElRxEfu2Y6UvyaFsnkN
X-Received: by 2002:a17:906:eb19:b0:7ad:d7a5:6c2a with SMTP id mb25-20020a170906eb1900b007add7a56c2amr14673257ejb.138.1669023252974;
        Mon, 21 Nov 2022 01:34:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7C/uVEbWPp12RRd1YGX6i9XmBAbrhXrKc/BzE2qEe4hDLf7UlkmcgimNxwOAMjxpgnAS83kQ==
X-Received: by 2002:a17:906:eb19:b0:7ad:d7a5:6c2a with SMTP id mb25-20020a170906eb1900b007add7a56c2amr14673238ejb.138.1669023252731;
        Mon, 21 Nov 2022 01:34:12 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ch28-20020a0564021bdc00b0045d74aa401fsm4993698edb.60.2022.11.21.01.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:34:12 -0800 (PST)
Message-ID: <a1f611fd-28ad-83ef-5d17-94fe2c4a6a7f@redhat.com>
Date:   Mon, 21 Nov 2022 10:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 11/18] platform/x86: int3472: fix object shared between
 several modules
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Lobakin <alobakin@pm.me>,
        linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
        Jens Axboe <axboe@kernel.dk>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Derek Chickles <dchickles@marvell.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Sunil Goutham <sgoutham@marvell.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221119225650.1044591-1-alobakin@pm.me>
 <20221119225650.1044591-12-alobakin@pm.me>
 <Y3oxyUx0UkWVjGvn@smile.fi.intel.com>
 <961a7d7e-c917-86a8-097b-5961428e9ddc@redhat.com>
 <CAK7LNASxxzA1OEGuJR=BU=6G8XaatGx+gDCMe2s9Y3MRcwptYw@mail.gmail.com>
 <87852fc9-0757-7e58-35a2-90cccf970f5c@redhat.com>
 <CAK7LNAROUV6Z6L6yn4WiigfPRJTGU4+j0ujLt6nsxVp9+aCUzw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAK7LNAROUV6Z6L6yn4WiigfPRJTGU4+j0ujLt6nsxVp9+aCUzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 11/21/22 10:06, Masahiro Yamada wrote:
> On Mon, Nov 21, 2022 at 5:12 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/21/22 00:45, Masahiro Yamada wrote:
>>> On Mon, Nov 21, 2022 at 5:55 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 11/20/22 14:55, Andy Shevchenko wrote:
>>>>> On Sat, Nov 19, 2022 at 11:08:17PM +0000, Alexander Lobakin wrote:
>>>>>> common.o is linked to both intel_skl_int3472_{discrete,tps68470}:
>>>>>>
>>>>>>> scripts/Makefile.build:252: ./drivers/platform/x86/intel/int3472/Makefile:
>>>>>>> common.o is added to multiple modules: intel_skl_int3472_discrete
>>>>>>> intel_skl_int3472_tps68470
>>>>>>
>>>>>> Although both drivers share one Kconfig option
>>>>>> (CONFIG_INTEL_SKL_INT3472), it's better to not link one object file
>>>>>> into several modules (and/or vmlinux).
>>>>>> Under certain circumstances, such can lead to the situation fixed by
>>>>>> commit 637a642f5ca5 ("zstd: Fixing mixed module-builtin objects").
>>>>>>
>>>>>> Introduce the new module, intel_skl_int3472_common, to provide the
>>>>>> functions from common.o to both discrete and tps68470 drivers. This
>>>>>> adds only 3 exports and doesn't provide any changes to the actual
>>>>>> code.
>>>>
>>>> Replying to Andy's reply here since I never saw the original submission
>>>> which was not Cc-ed to platform-driver-x86@vger.kernel.org .
>>>>
>>>> As you mention already in the commit msg, the issue from:
>>>>
>>>> commit 637a642f5ca5 ("zstd: Fixing mixed module-builtin objects")
>>>>
>>>> is not an issue here since both modules sharing the .o file are
>>>> behind the same Kconfig option.
>>>>
>>>> So there is not really an issue here and common.o is tiny, so
>>>> small chances are it does not ever increase the .ko size
>>>> when looking a the .ko size rounded up to a multiple of
>>>> the filesystem size.
>>>>
>>>> At the same time adding an extra module does come with significant
>>>> costs, it will eat up at least 1 possibly more then 1 fs blocks
>>>> (I don't know what the module header size overhead is).
>>>>
>>>> And it needs to be loaded separately and module loading is slow;
>>>> and it will grow the /lib/modules/<kver>/modules.* sizes.
>>>>
>>>> So nack from me for this patch, since I really don't see
>>>> it adding any value.
>>>
>>>
>>>
>>>
>>> This does have a value.
>>>
>>> This clarifies the ownership of the common.o,
>>> in other words, makes KBUILD_MODNAME deterministic.
>>>
>>>
>>> If an object belongs to a module,
>>> KBUILD_MODNAME is defined as the module name.
>>>
>>> If an object is always built-in,
>>> KBUILD_MODNAME is defined as the basename of the object.
>>>
>>>
>>>
>>> Here is a question:
>>> if common.o is shared by two modules intel_skl_int3472_discrete
>>> and intel_skl_int3472_tps68470, what should KBUILD_MODNAME be?
>>>
>>>
>>> I see some patch submissions relying on the assumption that
>>> KBUILD_MODNAME is unique.
>>> We cannot determine KBUILD_MODNAME correctly if an object is shared
>>> by multiple modules.
>>>
>>>
>>>
>>>
>>>
>>>
>>> BTW, this patch is not the way I suggested.
>>> The Suggested-by should not have been there
>>> (or at least Reported-by)
>>>
>>>
>>> You argued "common.o is tiny", so I would vote for
>>> making them inline functions, like
>>>
>>>
>>> https://lore.kernel.org/linux-kbuild/20221119225650.1044591-2-alobakin@pm.me/T/#u
>>
>> Yes just moving the contents of common.c to static inline helpers in common.h
>> would be much better.
>>
>> If someone creates such a patch, please do not forget to Cc
>> platform-driver-x86@vger.kernel.org
> 
> 
> 
> I think this patch series should be split
> and sent to each sub-system instead of kbuild.

Yes definitely, the changes are big enough that not merging
this through the subsystem trees is going to cause conflicts.

Regards,

Hans





>>>>> ...
>>>>>
>>>>>> +MODULE_IMPORT_NS(INTEL_SKL_INT3472);
>>>>>> +
>>>>>
>>>>> Redundant blank line. You may put it to be last MODULE_*() in the file, if you
>>>>> think it would be more visible.
>>>>>
>>>>>>  MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI Discrete Device Driver");
>>>>>>  MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
>>>>>>  MODULE_LICENSE("GPL v2");
>>>>>
>>>>> ...
>>>>>
>>>>>> +MODULE_IMPORT_NS(INTEL_SKL_INT3472);
>>>>>> +
>>>>>>  MODULE_DESCRIPTION("Intel SkyLake INT3472 ACPI TPS68470 Device Driver");
>>>>>>  MODULE_AUTHOR("Daniel Scally <djrscally@gmail.com>");
>>>>>>  MODULE_LICENSE("GPL v2");
>>>>>
>>>>> Ditto. And the same to all your patches.
>>>>>
>>>>
>>>
>>>
>>
> 
> 

