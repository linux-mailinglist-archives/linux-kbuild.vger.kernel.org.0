Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100C030584E
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314205AbhAZXAk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394697AbhAZS05 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:26:57 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C71DC06174A;
        Tue, 26 Jan 2021 10:26:17 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id n15so12238245qkh.8;
        Tue, 26 Jan 2021 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XqI5CT/DnJOGMvQUgx1q4HMcG5oJyLGiChqHaW7eiXs=;
        b=dbGfmcirlMr7XQ8UCxSwOoJJMLi0Rzh/bjCY+R5ltIEbPKK+t+Ke5/x8JOiE3AsPE9
         63nzAWtjztLpnRaT+hf8blfrqdlsnztgZgzAF3sS4ig/ihLsnFWfHgLVMKaDIi1JaKtb
         jj20eXCopZtvQjniZK1HeGGflqz9Veqt28YsOkp0PiWAF6yTnMZZZbiVIFEHGf1xYjU2
         zUIgcqRXfuXoSLf5g2c8IXA3EUXgmbirXtB0AtA2GPAzDRGof7WQLIRafkAXsTTkKrZW
         qJgQaGGlFq7yIO4+kofGS3Pfd1ta6eTXMuEYuy9jRWt9/ZoUJCIeirvFEcScmwh96Z/h
         AkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XqI5CT/DnJOGMvQUgx1q4HMcG5oJyLGiChqHaW7eiXs=;
        b=gvTW+Fubmw0z6BT2o6VfY/m3rxyh0K8NM+CXyYuNYiLYRHOhTOzl+neYyAl2UhXYPK
         BoRhf/oBTSsVwbRPpyxXD+P8fyey/PxJ+CRNHCd+TWRlELPiDOGn5KOJmPskIz2bFoXD
         0UCOWMSDv1hLbywdsijiXkCzQxKHTiCGaGOm2l8OM+zQQ3EtP4El2lPSTxRK8oJV8QyT
         i6va6cskQ6jnnPAQOtNmvoRE77vA6QhYIPDmOA78sCKFZnrwAFlgFnPI1a1flNNUOqiz
         NZh+Jcrc/7IzEatVhnR8BTH5ztY4bo5+QTuxOligTpcKbEYuP8kY4pjF7AH9+EYP4gNP
         hIlw==
X-Gm-Message-State: AOAM5332YgVC1cSO1OX7rJ3Oj1vKlzOvOCkICbd7NznSr2dkfzSj7uGF
        /EHcYP3T4kQdur9As+go6P8=
X-Google-Smtp-Source: ABdhPJwLdWihoqdNvgl99J+/q85Po4ByMYuL+PNmJr3LhfXQ6Ok+pE9gTWXnRznU0BaxdQDeZ/IF8g==
X-Received: by 2002:a37:4815:: with SMTP id v21mr6997141qka.130.1611685576324;
        Tue, 26 Jan 2021 10:26:16 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id r17sm13537371qta.78.2021.01.26.10.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 10:26:15 -0800 (PST)
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     DTML <devicetree@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>, cyril@debamax.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com>
 <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
 <5e552b57-4e8b-6774-577d-4fa7a8d440ba@gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <98217e0b-e937-f5b3-fa16-57c79b6ae3f6@gmail.com>
Date:   Tue, 26 Jan 2021 12:26:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5e552b57-4e8b-6774-577d-4fa7a8d440ba@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Uwe,

On 1/26/21 12:03 PM, Frank Rowand wrote:
> +frank
> 
> On 1/26/21 1:20 AM, Uwe Kleine-König wrote:
>> Hello Masahiro,
>>
>> On 1/25/21 10:53 PM, Masahiro Yamada wrote:
>>> On Mon, Jan 25, 2021 at 8:07 PM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
>>>>
>>>> Adding the -@ switch to dtc results in the binary devicetrees containing
>>>> a list of symbolic references and their paths. This is necessary to
>>>> apply device tree overlays e.g. on Raspberry Pi as described on
>>>> https://www.raspberrypi.org/documentation/configuration/device-tree.md.
>>>>
>>>> Obviously the downside of this change is an increas of the size of the
>>>> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
>>>>
>>>>          $ du -s arch/arm/boot/dts*
>>>>          101380  arch/arm/boot/dts-pre
>>>>          114308  arch/arm/boot/dts-post
>>>>
>>>> so this is in average an increase of 12.8% in size.
>>>>
>>>> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
>>>
>>>
>>> (CCing DT ML.)
>>
>> makes sense, thanks.
>>
>>> https://www.spinics.net/lists/linux-kbuild/msg27904.html
>>>
>>> See Rob's comment:
>>>
>>> "We've already rejected doing that. Turning on '-@' can grow the dtb
>>> size by a significant amount which could be problematic for some
>>> boards."
>>
>> The patch was created after some conversation on irc which continued
>> after I sent the patch. I added the participating parties to Cc:.

Unfortunately I have not been on irc recently (now rectified).  Do you
perchance have a copy of the irc conversation that you can send me?
(No need to edit out unrelated messages, a simple cut and paste from
the start of the conversation to the end is fine.)

-Frank

>>
>> The (relevant) followups were:
>>
>> Geert suggested to always generate the symbols and provide a way to
>> strip the symbols for installation if and when they are not needed.
>>
>> Rob said: "I'm less concerned with the size increases, but rather that
>> labels go from purely source syntax to an ABI. I'd rather see some
>> decision as to which labels are enabled or not."
>>
>> And then I learned with hints from Rob and Geert that symbols are not
>> really necessary for overlays, you just cannot use named labels. But
>> using
>>
>>     target-path = "/soc/i2c@23473245";
>>
>> or
>>
>>     target = <&{/soc/i2c@23473245}>;
>>
>> instead of
>>
>>     target = <&i2c1>;
>>
>> works fine. (And if you need to add a phandle the &{/path/to/node}
>> construct should work, too (but I didn't test).) Using labels is a tad nicer, but the problem I wanted to address with my patch now has a known different solution.
>>
>> Best regards
>> Uwe
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
> 

