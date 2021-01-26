Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B947E30587C
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314191AbhAZXAe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392481AbhAZSEA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:04:00 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B6AC061573;
        Tue, 26 Jan 2021 10:03:17 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id z22so12876624qto.7;
        Tue, 26 Jan 2021 10:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HtLia3tqHgEA0fRcdYJwmH1U27RukYWW2gTi/zikuJ8=;
        b=Vzsj/7J9KgidbhduxBCJF0BaKx0+VqkhE7gIWstP4odzRZTtBuyZidDGwwEykIKqSp
         JR7PLPwLd25jzgJqdeZgZkR5AZ9+/BcRr1cpNaqOMIPol02NTFzPyVN8GX8N2S1l+AXw
         8zWiPXPbGnJnIw2vqLZBPvzj7YPl1BFmPAOfxTlQ+4tFbUUr5p3yJT9eHgDnwUJMropL
         iCmuWsvfLtclGiZP23oWA7FPSAo2WJfWdMZxBCQHGe96nNFDQ5W8vc3ezPCaOVKa8qfQ
         7fGi9wd9P6slTOTfLKEbpAqunoyQ6VqtKU6/Gux1in45U9qhs8rAi/ceMg9cbisI+Nc8
         cVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HtLia3tqHgEA0fRcdYJwmH1U27RukYWW2gTi/zikuJ8=;
        b=KG+IVdcqN8SjswdKklELWIFBBV2iY5P4avmwVgVQJwFK8igu06QQhRn6EhJGqpY/b1
         JGzuwdAQI6HmUSCmpj1Le9O5GVs0EktsycviyLZLZjrqcBl7xaQFNew+XBlz+8+oVZL3
         R8RKHrktIJxOooE/zTfARks1JnAuIPlCMBV0lafbxPS40tYnp89+IfzHEgDCay5MnSxe
         0rL0OxxGWEOooN9XanHYzg2urPQt0RD6yPpMBAS4Ol1dF1Jxb3WoG+hCUJJc7bNxA4Y+
         ARwXeZqx95OwJH8jfwa9SzpLNvsoLibyc37XPMGBXoiyEKB2XnwnbxgRZlGvzZEKyTlY
         2xPw==
X-Gm-Message-State: AOAM530hKS6rAQ6Z4Ihvb+TenUs4VDnUYG44/1c8VjobxFcL7mSKoQpi
        YqYT1ofu6mfVofDJVp9IuDs=
X-Google-Smtp-Source: ABdhPJyMtMMMqrLeE5xLSnj9c88fGXDMBwgQdtWPVEpqvVgIpvL/YbNgfRhVRuw0zkTsfe3cF1Lqyg==
X-Received: by 2002:ac8:59cb:: with SMTP id f11mr6261381qtf.70.1611684196510;
        Tue, 26 Jan 2021 10:03:16 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id y67sm14700409qka.68.2021.01.26.10.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 10:03:16 -0800 (PST)
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
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <5e552b57-4e8b-6774-577d-4fa7a8d440ba@gmail.com>
Date:   Tue, 26 Jan 2021 12:03:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+frank

On 1/26/21 1:20 AM, Uwe Kleine-König wrote:
> Hello Masahiro,
> 
> On 1/25/21 10:53 PM, Masahiro Yamada wrote:
>> On Mon, Jan 25, 2021 at 8:07 PM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
>>>
>>> Adding the -@ switch to dtc results in the binary devicetrees containing
>>> a list of symbolic references and their paths. This is necessary to
>>> apply device tree overlays e.g. on Raspberry Pi as described on
>>> https://www.raspberrypi.org/documentation/configuration/device-tree.md.
>>>
>>> Obviously the downside of this change is an increas of the size of the
>>> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
>>>
>>>          $ du -s arch/arm/boot/dts*
>>>          101380  arch/arm/boot/dts-pre
>>>          114308  arch/arm/boot/dts-post
>>>
>>> so this is in average an increase of 12.8% in size.
>>>
>>> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
>>
>>
>> (CCing DT ML.)
> 
> makes sense, thanks.
> 
>> https://www.spinics.net/lists/linux-kbuild/msg27904.html
>>
>> See Rob's comment:
>>
>> "We've already rejected doing that. Turning on '-@' can grow the dtb
>> size by a significant amount which could be problematic for some
>> boards."
> 
> The patch was created after some conversation on irc which continued
> after I sent the patch. I added the participating parties to Cc:.
> 
> The (relevant) followups were:
> 
> Geert suggested to always generate the symbols and provide a way to
> strip the symbols for installation if and when they are not needed.
> 
> Rob said: "I'm less concerned with the size increases, but rather that
> labels go from purely source syntax to an ABI. I'd rather see some
> decision as to which labels are enabled or not."
> 
> And then I learned with hints from Rob and Geert that symbols are not
> really necessary for overlays, you just cannot use named labels. But
> using
> 
>     target-path = "/soc/i2c@23473245";
> 
> or
> 
>     target = <&{/soc/i2c@23473245}>;
> 
> instead of
> 
>     target = <&i2c1>;
> 
> works fine. (And if you need to add a phandle the &{/path/to/node}
> construct should work, too (but I didn't test).) Using labels is a tad nicer, but the problem I wanted to address with my patch now has a known different solution.
> 
> Best regards
> Uwe
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

