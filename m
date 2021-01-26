Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492E730587B
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314186AbhAZXA3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393947AbhAZSCi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:02:38 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F87FC061786;
        Tue, 26 Jan 2021 10:01:58 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id k193so16782409qke.6;
        Tue, 26 Jan 2021 10:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yuvRZhoFsIrqsKmSxE4tE0pMVyOG+8tKKITPOWsJ0sg=;
        b=nxJ4mhARVQ3kUwKmPE2nb7NyMwBn79rK+rNLQvuA53V2923AqTjbg/YB++znsnIh6j
         0N6GsOrHMkSFO8dFWM/zCrQuXqmdKYFK4tJlnFGmrKBkoC8csILLBQ4uvMGSk1aHF2Pu
         7aQiM/hPjqIXhnSb1mBGcX6IZ8y2eHHcgxUTdQRtXrQM8/t1p4M/jQAbdPMXBXrXZp65
         kUxWvyu/FcKLN6WiELKodM8McQVaFdzOL+iubzy0YihlukrpeCDk7vnvebEeFf8dLtO1
         ZuFkAXdNlmY+Ar94ifhRW7zd5LlY79otEO5Lak0RHbvLnKE+hife0n5T57y5MnzhbRz2
         rUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yuvRZhoFsIrqsKmSxE4tE0pMVyOG+8tKKITPOWsJ0sg=;
        b=KRqOksBNMjPNEWGudLCA/IyspOvcgHHqudKBwW1NORHkWCq1cwlBDS34c9ZC00aaXi
         vqgkN8Ecu6PWB0Fq6acWr6v9jfFuNnCKJEywub/prDlqyRbsGIflkpDqlcP6Zz1LsVuR
         D6XTW5JFcXBzGiUw+wz7LRMLFB++5nXKDy7SCDfh5gnHtVQNE3E53tdzqvakk4jv3OgP
         Q1JHkkgQd75ON6nAQT32k7vyBVgPhLLlx7EAqCcAGxvnvxdSmYwyFrtpWVKMu7vTLSWh
         49o2xDLP4z84+wloCj2nZrFoEpXyHmGrH87I49b8ygrDhaBsX8hn/cS3Wxjf6UE+5O9w
         BiVw==
X-Gm-Message-State: AOAM531UJ65uofAiP3pn1aOcHsitvvKIgNUZCqIlkV/NuTGXU97v3CO8
        k3kmMXB+POenrKYPKZHYrPk=
X-Google-Smtp-Source: ABdhPJya0SjxdAznSvqCtMwy6fOlVyr4YtJe9xVuzlc3mxZLoHjmT6QmdUUgVYM0e8cOoE6D9bSo5g==
X-Received: by 2002:a37:a053:: with SMTP id j80mr7016988qke.198.1611684117761;
        Tue, 26 Jan 2021 10:01:57 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id o15sm4696989qtp.51.2021.01.26.10.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 10:01:57 -0800 (PST)
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     Cyril Brulebois <cyril@debamax.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <20210125111520.mgqe7u7fh5425ywl@debamax.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <e7e0751f-991f-baa5-0c76-598542d5fdd5@gmail.com>
Date:   Tue, 26 Jan 2021 12:01:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210125111520.mgqe7u7fh5425ywl@debamax.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+frank

On 1/25/21 5:15 AM, Cyril Brulebois wrote:
> Hi,
> 
> Uwe Kleine-König <uwe@kleine-koenig.org> (2021-01-25):
>> Adding the -@ switch to dtc results in the binary devicetrees containing
>> a list of symbolic references and their paths. This is necessary to
>> apply device tree overlays e.g. on Raspberry Pi as described on
>> https://www.raspberrypi.org/documentation/configuration/device-tree.md.
>>
>> Obviously the downside of this change is an increas of the size of the
> 
> (as spotted by Uwe right after sending →) increase
> 
>> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
>>
>> 	$ du -s arch/arm/boot/dts*
>> 	101380	arch/arm/boot/dts-pre
>> 	114308	arch/arm/boot/dts-post
>>
>> so this is in average an increase of 12.8% in size.
>>
>> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> Tested-by: Cyril Brulebois <cyril@debamax.com>
> 
> with:
>  - a Raspberry Pi CM3
>  - a carrier board designed after the official IO Board V3
>  - an RTC accessible over I²C, made functional via a DTB overlay, that
>    can only be enabled once bcm2710-rpi-cm3.dtb has been generated with
>    this patch applied.
> 
> 
> Cheers,
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

