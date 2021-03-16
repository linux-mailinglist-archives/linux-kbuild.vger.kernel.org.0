Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE0833CD68
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 06:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235520AbhCPFju (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 01:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232611AbhCPFjs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 01:39:48 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FC0C06174A;
        Mon, 15 Mar 2021 22:39:48 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id x27so8970665qvd.2;
        Mon, 15 Mar 2021 22:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zJcTHz7kYrfmDocC0YMD6DKNt4P/3IW8HObvtAFpcdc=;
        b=Cble/LlvuwdJzhgf8wGEjZAB7NvmWo27zj1t4PJcPmUckYEVQpZ9AefR7/Ppt/eAFy
         JHH+RuOjsfGE2YdNPFU6EqDe239EPOjxO3tajLqTBR3NFiZV5pRUQjjM08rSnSv6hcV6
         3w6x6yEIPApvgY5D2yAP2TvpkBhWFNr3uI4EUeos5mtUay7H5aaNDwqg5Hqu6y8EAGgh
         ZkV0XuVselCLuWSirZ6zWCshXN5YEBwVbSZPdjFCgqja0hLB2cq+md3Auw6SyEquACtd
         XyHlr8Ppvfp6lzgikvC8lL+um5DRRbF3A5rQA9qt2xkpUsJdNwwNsgBf+yAcGUQyVV33
         YjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zJcTHz7kYrfmDocC0YMD6DKNt4P/3IW8HObvtAFpcdc=;
        b=q8jfCDbyrt2WXhWtQjRCoaWuKYcDXeoAMWMe+MZym17qzgiexg3/vvh/Wn4AcMviMO
         G3qocNrw+1YoBQP2k35Mx0SnUwCaX/0bytxHoD/yQqXraSQuj/MUTqrAletH55cdG1uT
         ViIu8EEdBYc0oqQalLBtKSXpZg2I3JAp3Y7ynPjDOMzJCpEdUrETZ3FZ4DS/FeyDNC7K
         5RjlqfCnMFLKd2JqghjzB0fohen8ZqbOBqpG5cJdrLySEznd9wohG7mH4Oa27CJ5+6Nl
         1NO/RXwh4iraEXPbwBApQoq1jlTyHlI/8GLt/rv+H2r8c1fKV34KX4rfc/Lxp4jTA31i
         e7Mw==
X-Gm-Message-State: AOAM530mbVkayJbsBMRJc1Vg1M2DI73WRREpwvmK7C0vKqF/VfYnoBNk
        gfr62QaVz7T+DBoHz+x64ZM=
X-Google-Smtp-Source: ABdhPJwpBmUh1h1HV2xb1KpeGpBRHOgyNwlWUtRBfGCajf/jxsWv7f8odsKb7FXD2xsvWk10zyIw3g==
X-Received: by 2002:a05:6214:2623:: with SMTP id gv3mr13783233qvb.35.1615873187467;
        Mon, 15 Mar 2021 22:39:47 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id z14sm12280829qti.87.2021.03.15.22.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 22:39:47 -0700 (PDT)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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
 <CAK7LNASHHNmZJ4FXz4Q5-UMEbSSyb_aG+kmfhJQZtCgkSZ_GAQ@mail.gmail.com>
 <YE/bzbU4jbgd6uNW@pendragon.ideasonboard.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <e08f4006-af23-6c58-8557-263901193229@gmail.com>
Date:   Tue, 16 Mar 2021 00:39:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YE/bzbU4jbgd6uNW@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/15/21 5:12 PM, Laurent Pinchart wrote:
> Hi Yamada-san,
> 
> On Tue, Mar 16, 2021 at 02:43:45AM +0900, Masahiro Yamada wrote:
>> On Mon, Mar 15, 2021 at 3:40 PM Viresh Kumar wrote:
>>> On 14-03-21, 20:16, Frank Rowand wrote:
>>>> On 3/12/21 11:11 PM, Frank Rowand wrote:
>>>>> On 3/12/21 1:13 AM, Viresh Kumar wrote:
>>>>>> On 12-03-21, 01:09, Frank Rowand wrote:
>>>>>>> I suggested having the .dtso files include the .dts file because that is a relatively
>>>>>>> small and easy change to test.  What would probably make more sense is the rename
>>>>>>> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
>>>>>>> file create a new .dts file that #includes the corresponding .dtso file.  This is
>>>>>>> more work and churn, but easier to document that the .dts files are a hack that is
>>>>>>> needed so that the corresponding .dtb.S files will be generated.
>>>>>>
>>>>>> What about creating links instead then ?
>>>>>>
>>>>>
>>>>> I don't really like the idea of using links here.
>>>>>
>>>>> Maybe it is best to make the changes needed to allow the unittest
>>>>> overlays to be .dtso instead of .dts.
>>>>>
>>>>> Off the top of my head:
>>>>>
>>>>>   scripts/Makefile.lib:
>>>>>      The rule for %.dtb.S invokes cmd_dt_S_dtb, which puts the
>>>>>      overlay data in section .dtb.init.rodata, with a label
>>>>>      pointing to the beginning of the overlay __dtb_XXX_begin and
>>>>>      a label pointing to the end of the overlay __dtb_XXX_end,
>>>>>      for the overlay named XXX.  I _think_ that you could simply
>>>>>      add a corresponding rule for %.dtbo.S using a new command
>>>>>      cmd_dt_S_dtbo (the same as cmd_dt_S_dtb, except use labels
>>>>>      __dtbo_XXX_begin and __dtbo_XXX_end).
>>>>
>>>> If you do the above, please put it in drivers/of/unittest-data/Makefile
>>>> instead of scripts/Makefile.lib because it is unittest.c specific and
>>>> not meant to be anywhere else in the kernel.
>>>
>>> What about doing this then in unittest's Makefile instead (which I
>>> already suggested earlier), that will make everything work just fine
>>> without any other changes ?
>>>
>>> +# Required for of unittest files as they can't be renamed to .dtso
>>> +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
>>> +       $(call if_changed_dep,dtc)
>>>
>>
>> If those rules are only needed by drivers/of/unittest-data/Makefile,
>> they should not be located in scripts/Makefile.lib.
>>
>> But how can we fix drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a779*.dts
>> if these are doing bad things.
>> They seem to be overlay files even though the file name suffix is .dts
> 
> That is correct, they are overlays. I have no issue with those files
> being renamed to .dtso if that can help (but I haven't checked if that
> would have any adverse effect on the R-Car DU driver).

As Laurent replied, yes these are overlays.  They were grandfathered in
as a deprecated use of overlays.

> 
> These files are there to ensure backward compatibility with older DT
> bindings. The change was made 3 years ago and I wouldn't object to
> dropping this completely, but I understand I may not be the most
> cautious person when it comes to ensuring DT backward compatibility :-)

My memory is that the goal was to eventually remove these overlays
at some point in the future.  If everyone agrees that today is the
proper time, it would be helpful to go ahead and remove these .dts
files and the code that uses them.

-Frank

> 
>> $ find drivers -name '*.dts'
>> drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts
>> drivers/staging/mt7621-dts/gbpc2.dts
>> drivers/staging/mt7621-dts/gbpc1.dts
>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
>> drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>> drivers/of/unittest-data/overlay_1.dts
>> drivers/of/unittest-data/testcases.dts
>> drivers/of/unittest-data/overlay_bad_add_dup_node.dts
>> drivers/of/unittest-data/overlay_bad_symbol.dts
>> drivers/of/unittest-data/overlay_0.dts
>> drivers/of/unittest-data/overlay_11.dts
>> drivers/of/unittest-data/overlay_gpio_03.dts
>> drivers/of/unittest-data/overlay_gpio_04a.dts
>> drivers/of/unittest-data/overlay_gpio_04b.dts
>> drivers/of/unittest-data/overlay_5.dts
>> drivers/of/unittest-data/overlay_bad_add_dup_prop.dts
>> drivers/of/unittest-data/overlay_gpio_01.dts
>> drivers/of/unittest-data/overlay_10.dts
>> drivers/of/unittest-data/overlay_7.dts
>> drivers/of/unittest-data/overlay_bad_phandle.dts
>> drivers/of/unittest-data/overlay_3.dts
>> drivers/of/unittest-data/overlay_6.dts
>> drivers/of/unittest-data/overlay_8.dts
>> drivers/of/unittest-data/overlay_12.dts
>> drivers/of/unittest-data/overlay_gpio_02a.dts
>> drivers/of/unittest-data/overlay_gpio_02b.dts
>> drivers/of/unittest-data/overlay_4.dts
>> drivers/of/unittest-data/overlay.dts
>> drivers/of/unittest-data/overlay_9.dts
>> drivers/of/unittest-data/overlay_2.dts
>> drivers/of/unittest-data/overlay_15.dts
>> drivers/of/unittest-data/overlay_base.dts
>> drivers/of/unittest-data/overlay_13.dts
> 

