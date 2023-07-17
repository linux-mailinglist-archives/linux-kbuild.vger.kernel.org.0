Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793C1755E7B
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jul 2023 10:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjGQIa6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Jul 2023 04:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjGQIa5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jul 2023 04:30:57 -0400
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF0218B
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jul 2023 01:30:56 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so11313831a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jul 2023 01:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689582654; x=1692174654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey5FUIL8tx7tACde1gSmtq+Q4hBVFmA7zgp6XNTNhdM=;
        b=Sq3TPotHdcE0zaSaRr1BX+S1fc6p20dCTTtx7xBF7B479CP6kr/7E+ex7o7IDscb4O
         xISxikbAEvB83WyH/DRPInZANQhf9oTKnziY19CLgCG8jrKkr2c3qpqHihLyNML/HG3Y
         H+taNk4WI9DJpmSny6SHHwncr2QGaoeX2+ZAP/dnkEZOEX2FJweQzqy3Ch7dMooshW7K
         LNiMMZVvU8DyYnAsory3opIHLttk5WifEyjqkKyYrqQAwK1oqiliXyGpCQwVOWfL7/hn
         8qPJqmjbnWyXJRSLdNenfnPr1Mne51u1G/gn0uKMar9eURgNNJ4ExTnj+kQqeanC9xZY
         UgYg==
X-Gm-Message-State: ABy/qLZuoLC3xOna5Jv5ND/48VdyIOhr0RhGSIxx8z9s15XNmBn9aSCN
        NE2wcesh6Rj8EHhZD9TJQmI=
X-Google-Smtp-Source: APBJJlF1tEcrQdf6ek0y5ycObNL+BrXFMalFBrNktGy0qhN3Cr7tYp8yS5z6x/p9vExlxida/GjurQ==
X-Received: by 2002:a17:907:62a8:b0:98d:f2c9:a1eb with SMTP id nd40-20020a17090762a800b0098df2c9a1ebmr9864647ejc.24.1689582654245;
        Mon, 17 Jul 2023 01:30:54 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id jw23-20020a17090776b700b009935aba3a9dsm8840192ejc.48.2023.07.17.01.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 01:30:53 -0700 (PDT)
Message-ID: <d57ba55f-20a3-b836-783d-b49c8a161b6e@kernel.org>
Date:   Mon, 17 Jul 2023 10:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: con3270.o is built twice, leading to errors
Content-Language: en-US
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org>
 <CAK7LNAQhORSPEuB=XFa_i5EcQfsJ6uXy0MM5YWo_84eLGcoxNQ@mail.gmail.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <CAK7LNAQhORSPEuB=XFa_i5EcQfsJ6uXy0MM5YWo_84eLGcoxNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 15. 07. 23, 7:04, Masahiro Yamada wrote:
> On Fri, Jul 14, 2023 at 3:33 PM Jiri Slaby <jirislaby@kernel.org> wrote:
>>
>> Hi,
>>
>> if I create an s390 defconfig:
>> mkdir /tmp/s390/
>> make O=/tmp/s390/ ARCH=s390 CROSS_COMPILE=s390x-suse-linux- defconfig
>>
>> And then if I try for a couple times:
>> make O=/tmp/s390/ -j17 ARCH=s390 CROSS_COMPILE=s390x-suse-linux-
>> drivers/s390/char/con3270.o
>>
>> Most of the time, I get:
>> make[1]: Entering directory '/tmp/s390'
>>     GEN     Makefile
>>     CALL    /home/latest/linux/scripts/checksyscalls.sh
>>     CC      drivers/s390/char/con3270.o
>>     CC      drivers/s390/char/con3270.o
>>
>> I.e. it is built twice.
>>
>> Sometimes, I also get an error:
>> fixdep: error opening file: drivers/s390/char/.con3270.o.d: No such file
>> or directory
>> make[4]: *** [/home/latest/linux/scripts/Makefile.build:243:
>> drivers/s390/char/con3270.o] Error 2
>> make[4]: *** Deleting file 'drivers/s390/char/con3270.o'
>> make[3]: *** [/home/latest/linux/scripts/Makefile.build:477: drivers]
>>
>> Obviously due to some race.
>>
>> Any ideas what is going on?
> 
> 
> 
> The reason is because ARCH=s390 descends into
> drivers/s390/ in a non-standard way.
> 
> See arch/s390/Makefile line 122.
> 
> 
> 
> This is a corner case in single builds, and I
> do not know how to make it work.
> 
> 
> 
> I really hope arch maintainers will follow the standard
> obj-y syntax unless there is a strong reason to opt out.
> 
> 
> The following patch will fix the issue.

Tested-by: Jiri Slaby <jirislaby@kernel.org>

Will you send it as a patch?

> diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> index 5ed242897b0d..a53a36ee0731 100644
> --- a/arch/s390/Makefile
> +++ b/arch/s390/Makefile
> @@ -119,7 +119,6 @@ export KBUILD_CFLAGS_DECOMPRESSOR
>   OBJCOPYFLAGS   := -O binary
> 
>   libs-y         += arch/s390/lib/
> -drivers-y      += drivers/s390/
> 
>   boot           := arch/s390/boot
>   syscalls       := arch/s390/kernel/syscalls
> diff --git a/drivers/Makefile b/drivers/Makefile
> index 7241d80a7b29..a7459e77df37 100644
> --- a/drivers/Makefile
> +++ b/drivers/Makefile
> @@ -195,3 +195,5 @@ obj-$(CONFIG_PECI)          += peci/
>   obj-$(CONFIG_HTE)              += hte/
>   obj-$(CONFIG_DRM_ACCEL)                += accel/
>   obj-$(CONFIG_CDX_BUS)          += cdx/
> +
> +obj-$(CONFIG_S390)             += s390/


thanks,
-- 
js
suse labs

