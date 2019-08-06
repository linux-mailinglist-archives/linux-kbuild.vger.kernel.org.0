Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A47DF82CCD
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 09:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731807AbfHFHaW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 03:30:22 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43136 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731735AbfHFHaW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 03:30:22 -0400
Received: by mail-oi1-f194.google.com with SMTP id w79so65222950oif.10;
        Tue, 06 Aug 2019 00:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rt7p4w8GRASsTh4L8meL9OiYP/BUIZ+eM+Oj2ozLZX0=;
        b=jNHIHAgNhRMrrc89l8FgqZBib4R88DxCJIa/S/gK0xb0C+QyYDxrNxsJ/aTo9zTQkX
         FzQ9oXsxHVPjfNUQwrMDojCh7gIFqYh3V7XbmTExcVsERJHBGo2LeAscv6P1E8dgxaKo
         DaXV3ImToOknn2cVFB09gANmXfL5s2ng69BNG0K40yD0K+z3xB7LrSPJvhxTXmWCfsg0
         dkmc23aa1tOaaDY8AV2jTxral0OW/oeXVlMIEPHQ3vnNZeXUVF5RN57vrB0LBJ6NXIaK
         dlUyIjHKnB1tMPlHPScrbFKqIWyRNFBc6k5WGrPaK19jTjYdXBP7ct+3YVMLCXgykZjf
         stKg==
X-Gm-Message-State: APjAAAXujK44SfLOxpJ4GLMS0OKls9Y+Xy8uCe4Ev61MQipwBfd6ZlYE
        oCRIErLLB7IjbF/zbY9E43yvrJijXE+VN7himQg=
X-Google-Smtp-Source: APXvYqxf2mIJF0r2WtOWgOXoNk4Ssm0txTKBpp4NeSTCt6wKFUnz/OViHpCBQnDGu1cEhPCsgOUabbz+AFvLaKfo1fs=
X-Received: by 2002:aca:bd43:: with SMTP id n64mr1471003oif.148.1565076621538;
 Tue, 06 Aug 2019 00:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com> <20190731194419.GB4084@kunai>
 <CAK7LNAQ6siWHU+N2c+6gqh7hHEJ_aDrVoiWnrTq1jiXQWSYYBA@mail.gmail.com> <2567a74d-738e-6fed-d91c-cc70743e116d@redhat.com>
In-Reply-To: <2567a74d-738e-6fed-d91c-cc70743e116d@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Aug 2019 09:30:10 +0200
Message-ID: <CAMuHMdX3QqXGt4=31ECZ7vryjsSA7NufuvA_XVLjS91_1q=uqw@mail.gmail.com>
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Javier Martinez Canillas <javierm@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 6, 2019 at 12:48 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 8/1/19 4:17 AM, Masahiro Yamada wrote:
> So I think that we should either:
>
> a) take Kieran's patch or b) remove the i2c_of_match_device_sysfs() fallback
> for OF and require an I2C device table for sysfs instantiation and matching.
>
> > If a driver supports DT and devices are instantiated via DT,
> > in which situation is this useful?
>
> Is useful if you don't have all the I2C devices described in the DT. For example
> a daughterboard with an I2C device is connected to a board through an expansion
> slot or an I2C device connected directly to I2C pins exposed in a machine.
>
> In these cases your I2C devices won't be static so users might want to use the
> sysfs user-space interface to instantiate the I2C devices, i.e:
>
>  # echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-3/new_device
>
> as explained in https://github.com/torvalds/linux/blob/master/Documentation/i2c/instantiating-devices#L207

Does this actually work with DT names, too? E.g.

# echo atmel,24c02 > /sys/bus/i2c/devices/i2c-3/new_device

Still leaves us with legacy names for backwards compatibility.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
