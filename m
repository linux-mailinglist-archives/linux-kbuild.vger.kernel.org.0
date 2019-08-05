Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9153827B3
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 00:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730147AbfHEWsd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Aug 2019 18:48:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46291 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728922AbfHEWsc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Aug 2019 18:48:32 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so85940303wru.13
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Aug 2019 15:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hJENxI80wN/86YgQghn0VINHjK39PsuKHSLq53FzU0c=;
        b=iiJ6SXNkIqrbYJTlDVDPuIjQ1y9hpBzA0nFInZkP9QKCgnARV1BMuSUUTsus0GzNiH
         qAiXtgfxYOwfbClUunUtZjBa0pw7oQY1GeUgYq2FgfK8jOF+iSqAfFkDPVtX8H/EBQmQ
         tBtbpNIUPNjnGF6QjRDcmX5NfWdIFZLVCounhNsW4Td9syMF0cL0aF/nxY7hX8/uJZI5
         f1IoZTC2Mp6gINY0Z4DOqwebFAcTS0RQ+YMbw9EnT4t6LAvBr8BLZ21gxXtvHlyjC//X
         dypfNcIw5yDzfu7TsLccwLFXXpAi0Yzxn4oc0k0kJc8RIj0afO9ldB2+wfN7H6tyhSL/
         WeqQ==
X-Gm-Message-State: APjAAAUsYOCJLUixqUn5DugOlDOpegfZqsf6YctvSji1KV+w08iVeUuh
        AuanXdU6w4AnzRawHnpTOGfKGQ==
X-Google-Smtp-Source: APXvYqySdg9YV4EiqlDPuqWbtbpBlPFVL1PtOB/3nLSu+w1Ygep569/JFe8N8aLYngb2EaWbgudBkw==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr291879wrw.21.1565045310601;
        Mon, 05 Aug 2019 15:48:30 -0700 (PDT)
Received: from [192.168.0.24] ([181.120.177.224])
        by smtp.gmail.com with ESMTPSA id b8sm115684209wmh.46.2019.08.05.15.48.25
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 15:48:29 -0700 (PDT)
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com>
 <20190731194419.GB4084@kunai>
 <CAK7LNAQ6siWHU+N2c+6gqh7hHEJ_aDrVoiWnrTq1jiXQWSYYBA@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <2567a74d-738e-6fed-d91c-cc70743e116d@redhat.com>
Date:   Tue, 6 Aug 2019 00:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ6siWHU+N2c+6gqh7hHEJ_aDrVoiWnrTq1jiXQWSYYBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Masahiro-san,

On 8/1/19 4:17 AM, Masahiro Yamada wrote:
> Hi.
> 
> On Thu, Aug 1, 2019 at 4:44 AM Wolfram Sang <wsa@the-dreams.de> wrote:
>>
>> Hi Javier,
>>
>> thank you for providing the extra information.
>>
>> (And Kieran, thanks for the patch!)
>>
>>> The other option is to remove i2c_of_match_device() and don't make OF match
>>> to fallback to i2c_of_match_device_sysfs(). This is what happens in the ACPI
>>> case, since i2c_device_match() just calls acpi_driver_match_device() directly
>>> and doesn't have a wrapper function that fallbacks to sysfs matching.
>>>
>>> In this case an I2C device ID table would be required if the devices have to
>>> be instantiated through sysfs. That way the I2C table would be used both for
>>> auto-loading and also to match the device when it doesn't have an of_node.
>>
>> That would probably mean that only a minority of drivers will not add an I2C
>> device ID table because it is easy to add an you get the sysfs feature?
>>
>> Then we are back again with the situation that most drivers will have
>> multiple tables. With the minor change that the I2C device id table is
>> not required anymore by the core, but it will be just very useful to
>> have? Or?
>>
>>> If the former is the correct way to solve this then the patch looks good to me.
>>>
>>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>>
>> For this actual patch from Kieran, I'd like to hear an opinion from the
>> people maintaining modpost.
> 
> 
> As you see 'git log scripts/mod/file2alias.c',
> this file is touched by every subsystem.
> 
> So, the decision is up to you, Wolfram.
> And, you can pick this to your tree if you like.
> 
> 
> The implementation is really trivial.
> 
> 
> As Javier pointed out, this discussion comes down to
> "do we want to fall back to i2c_of_match_device_sysfs()?"
> 

Yes, I think that's the crux of the matter. Basically the matching logic
should be consistent with the modalias uevent exposed to user-space to
auto-load modules.

So I think that we should either:

a) take Kieran's patch or b) remove the i2c_of_match_device_sysfs() fallback
for OF and require an I2C device table for sysfs instantiation and matching.

> If a driver supports DT and devices are instantiated via DT,
> in which situation is this useful?

Is useful if you don't have all the I2C devices described in the DT. For example
a daughterboard with an I2C device is connected to a board through an expansion
slot or an I2C device connected directly to I2C pins exposed in a machine.

In these cases your I2C devices won't be static so users might want to use the
sysfs user-space interface to instantiate the I2C devices, i.e:

 # echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-3/new_device

as explained in https://github.com/torvalds/linux/blob/master/Documentation/i2c/instantiating-devices#L207

> Do legacy non-DT platforms need this?

Yes, can also be used by non-DT platforms. But in this case isn't a problem
because drivers for these platform will already have an I2C device ID table.

> 
> 
> 
>> The aproach looks okay to me, yet I can't
>> tell how "easy" we are with adding new types like 'i2c_of'.
> 
> As far as I understood, this patch provides a shorthand.
> You can save one table, but still get the
> same MODULE_ALIAS in the *.mod.c file.
> You need to add two MODULE_DEVICE_TABLE() though.
> 
> MODULE_DEVICE_TABLE(of, si4713_of_match);
> MODULE_DEVICE_TABLE(i2c_of, si4713_of_match);
>

That's my understanding as well.

Best regards,
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
