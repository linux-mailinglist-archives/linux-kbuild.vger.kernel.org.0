Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B06E8380B
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 19:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387765AbfHFRkA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 13:40:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40339 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387737AbfHFRj7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 13:39:59 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so77323471wmj.5
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2019 10:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+GYAfSOb8TtiZxSa6IuLwHMy8VxqimVP3LYovrx/inM=;
        b=DqNGQdyxv/Yh+u04A9N6jJvAMzHJ0eDop9fHRczvfk4jc3Cd3BkdYQZ3vvhWY+WpEg
         IX9R5nOKZ8oF04KNvWTyaTGZ862vyLu7OByaKqkUyEQGby4wGx9LTwj7Jey7ogPI5X8N
         ue0StHHQLQ/wg8EO+Arf8pFhPyOj3x0jwZCDylRGLtfd1hbMOtAMKF/+fs9cJn9UkSNj
         76cCAl6cJgWh+Me95LDOiFj26b2cxZTflsjKDDm8Rt2fznJNFJZBehgAkk9P247KaJq+
         NTuimZm70F8OdZDv+nIHVD3ch4m5dzhw43xVP4Ffz09EE0oD3arD+11PvjqJRB39PKer
         Obtg==
X-Gm-Message-State: APjAAAVwidhf7rEVRk2qFti7Bhym/hWCLf9bmobJbaGq4S9HZ+AZsiHr
        MX22mUyaoB5LMKUhpAtk5uXTpoO3OHo=
X-Google-Smtp-Source: APXvYqz1rDwGYLjMpYg94bmJDxWy5dEJQahmt+BIxoXHp8HC4uWPXoVw2XEfHd9oZBsF6g6da9hcyQ==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr5378480wmg.159.1565113197551;
        Tue, 06 Aug 2019 10:39:57 -0700 (PDT)
Received: from [192.168.0.24] ([181.120.177.224])
        by smtp.gmail.com with ESMTPSA id x18sm80979493wmi.12.2019.08.06.10.39.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 10:39:56 -0700 (PDT)
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
 <2567a74d-738e-6fed-d91c-cc70743e116d@redhat.com>
 <CAMuHMdX3QqXGt4=31ECZ7vryjsSA7NufuvA_XVLjS91_1q=uqw@mail.gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <8df8133c-60c6-d9b5-2594-d7a5715e907a@redhat.com>
Date:   Tue, 6 Aug 2019 19:39:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX3QqXGt4=31ECZ7vryjsSA7NufuvA_XVLjS91_1q=uqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Geert,

On 8/6/19 9:30 AM, Geert Uytterhoeven wrote:
> On Tue, Aug 6, 2019 at 12:48 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> On 8/1/19 4:17 AM, Masahiro Yamada wrote:
>> So I think that we should either:
>>
>> a) take Kieran's patch or b) remove the i2c_of_match_device_sysfs() fallback
>> for OF and require an I2C device table for sysfs instantiation and matching.
>>
>>> If a driver supports DT and devices are instantiated via DT,
>>> in which situation is this useful?
>>
>> Is useful if you don't have all the I2C devices described in the DT. For example
>> a daughterboard with an I2C device is connected to a board through an expansion
>> slot or an I2C device connected directly to I2C pins exposed in a machine.
>>
>> In these cases your I2C devices won't be static so users might want to use the
>> sysfs user-space interface to instantiate the I2C devices, i.e:
>>
>>  # echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-3/new_device
>>
>> as explained in https://github.com/torvalds/linux/blob/master/Documentation/i2c/instantiating-devices#L207
> 
> Does this actually work with DT names, too? E.g.
> 
> # echo atmel,24c02 > /sys/bus/i2c/devices/i2c-3/new_device
>

My understanding is that it does. If I'm reading the code correctly the
i2c_of_match_device_sysfs() function first attempts to match using both
the vendor and device part of the compatible string and if that fails,
it strips the vendor part and try to match only using the device part.

So you could use any of the following:

# echo 24c02 0x50 > /sys/bus/i2c/devices/i2c-3/new_device

# echo atmel,24c02 0x50 > /sys/bus/i2c/devices/i2c-3/new_device

Best regards, 
-- 
Javier Martinez Canillas
Software Engineer - Desktop Hardware Enablement
Red Hat
