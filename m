Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F02C33CD62
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 06:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbhCPFgi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 01:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbhCPFgf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 01:36:35 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A20CC06174A;
        Mon, 15 Mar 2021 22:36:35 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id t16so8977943qvr.12;
        Mon, 15 Mar 2021 22:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=woL6zbu27Z+h9jJa1MEjyfk3mAabMy5L5Oe2TEvDgb4=;
        b=n/ust53ylv2qJX5wCDKAWDUTagH0V54u+0bJnydbTj+aQ9O7qP1nPxZ+OV9UMho4sw
         lbX0BX8mVajospvaaEge0dMf7is/0HUuc7UlX+wwRccc+WW1FalbpJtW3Qqzl13xGqLt
         DLioP1GfgNN1MselSs7uPfUL2snEAliN52akg6rmeBA+sxyefIq//SoEbomhxaJvYnp8
         am/ry+ZW85ppjWONgIvho3+kNh8cKuqYuE6QMujRFuuDLn1FHt5XhHuFAvFSukUqyG7f
         0wT5yHhefbtLSIJ+HEtqfKaJW4Hed5lefiDmSjkBnPoXLziyJD//gbC1RbvWrdMr8D8k
         MyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=woL6zbu27Z+h9jJa1MEjyfk3mAabMy5L5Oe2TEvDgb4=;
        b=aN57TTOk+FzEJVP/6ovT01D7m16nIjEjx0XHJuXz8hm9Ph/pMJX4vNUt0nf45hUAyx
         kOVs6T0L6O4jOAvGLerncHqRXC2PCOQReyWV03XQWrJwW4Deb9zF2lV2gld71d6SDtqs
         nxHJQjWtHoSGA21TKuUVHt8a8dqGrYxY3JBORnL0nFmEPyuDFTWRLyflvZ7KnMbZ0MSU
         mMiJV5xZZUhVxBz3cwrxud7vLaC3LS42Mn8TO00OmkQHAYOfcXalOelbnYwTJoflt+ur
         Ag3ZEKUoVsl235Ni6r+JVazhwzXf3vYtBHiR3ksUuhWZkhwH0Rfy8fByO0BfuUy9W9va
         VhRA==
X-Gm-Message-State: AOAM530Mn/m7GQbD/2jZYF5jARkRkvarV4duFMygb0/xW343NHD15UEM
        YaOQwORH/l5Yk6PJT/gEs1V4xF9szI4=
X-Google-Smtp-Source: ABdhPJwiJK71OJsweC5xKAQhgwUN/EfizlOPVrFJaAVhbG9+6ihtAgbKe2BB5+JcCMUUL5QIfWXbvA==
X-Received: by 2002:a05:6214:f69:: with SMTP id iy9mr14218210qvb.15.1615872993880;
        Mon, 15 Mar 2021 22:36:33 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id j24sm14091946qka.67.2021.03.15.22.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 22:36:33 -0700 (PDT)
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
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
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
 <20210312044712.srmqfuie7fae55pb@vireshk-i7>
 <17c65559-865f-f742-660f-0ab30ed45d90@gmail.com>
 <4d9bee7a-416e-50a1-65a5-0674ae83d42e@gmail.com>
 <20210312071325.zosmlttse4ym7sit@vireshk-i7>
 <6f093bb1-1a80-a906-fb4c-3f6fdeed4838@gmail.com>
 <9068520f-76d6-ec94-716c-02383422ac85@gmail.com>
 <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <98697a33-a07d-6c5f-3f21-97a92ac68d3e@gmail.com>
Date:   Tue, 16 Mar 2021 00:36:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210315064051.otcjt3x6vkfdrio6@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/15/21 1:40 AM, Viresh Kumar wrote:
> On 14-03-21, 20:16, Frank Rowand wrote:
>> On 3/12/21 11:11 PM, Frank Rowand wrote:
>>> On 3/12/21 1:13 AM, Viresh Kumar wrote:
>>>> On 12-03-21, 01:09, Frank Rowand wrote:
>>>>> I suggested having the .dtso files include the .dts file because that is a relatively
>>>>> small and easy change to test.  What would probably make more sense is the rename
>>>>> the existing overlay .dts files to be .dtso files and then for each overlay .dtso
>>>>> file create a new .dts file that #includes the corresponding .dtso file.  This is
>>>>> more work and churn, but easier to document that the .dts files are a hack that is
>>>>> needed so that the corresponding .dtb.S files will be generated.
>>>>
>>>> What about creating links instead then ?
>>>>
>>>
>>> I don't really like the idea of using links here.
>>>
>>> Maybe it is best to make the changes needed to allow the unittest
>>> overlays to be .dtso instead of .dts.
>>>
>>> Off the top of my head:
>>>
>>>   scripts/Makefile.lib:
>>>      The rule for %.dtb.S invokes cmd_dt_S_dtb, which puts the
>>>      overlay data in section .dtb.init.rodata, with a label
>>>      pointing to the beginning of the overlay __dtb_XXX_begin and
>>>      a label pointing to the end of the overlay __dtb_XXX_end,
>>>      for the overlay named XXX.  I _think_ that you could simply
>>>      add a corresponding rule for %.dtbo.S using a new command
>>>      cmd_dt_S_dtbo (the same as cmd_dt_S_dtb, except use labels
>>>      __dtbo_XXX_begin and __dtbo_XXX_end).
>>
>> If you do the above, please put it in drivers/of/unittest-data/Makefile
>> instead of scripts/Makefile.lib because it is unittest.c specific and
>> not meant to be anywhere else in the kernel.
> 
> What about doing this then in unittest's Makefile instead (which I
> already suggested earlier), that will make everything work just fine
> without any other changes ?
> 
> +# Required for of unittest files as they can't be renamed to .dtso
> +$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> +       $(call if_changed_dep,dtc)
> 

I should have looked at patch 3/5 more carefully instead of counting on
Masahiro to check it out and simply build testing.

Patch 3/5 does not seem correct.  I'll look over all the makefile related
changes that have been accepted (if any) and patch 3/5 later today (Tuesday).

-Frank
