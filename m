Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9A3482C81
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 09:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731787AbfHFHWv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 03:22:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44668 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731735AbfHFHWv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 03:22:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id b7so39926692otl.11;
        Tue, 06 Aug 2019 00:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thaFZP7CFw87PdGBAS/x5P7euY9O7a6MADouBJzdobA=;
        b=Fb+zwMYtYvsQMRaFQG2I9Nj3NTNqArMnK+39/JMMzxOnKoKWeQU/zqBwYQ6XjhWWzo
         kAzmpClBPLzW/vfpUn1Bvjw9OG2uyeeOaxsvdbHfGotwphxYCjSdT9te+216Rt+CX/EW
         h7yBEJ65QplQfT3eFDCR2lZJILlTImAE32xEuM/u4rgsqPcDfdWWnAypPyQ41MIne2f7
         Vg9LAfegda8+VsyxSYiIYQIqXlXNqxpugG1bVhQ2twVjIq6/k6LUYVWjbFsQT/36GNYq
         cJf6hnY/BHzO5Vab5dega+E9NdvZF8+ospRn4vNf3/GlCppIYuAL8RRPbkP9tSq3loHu
         1ivg==
X-Gm-Message-State: APjAAAUdM5BhoJ3d7FRCf4oWKcY3sMz8lsH2Kned0ZP816msxX9HXR1b
        14wc3Au4HHzbC1qlbuH8nVzauTTXfq+APqcRL88=
X-Google-Smtp-Source: APXvYqw0qhnYdCkCrJv4CVIkE6TUfK9Pkw2Y8ea4/DHFvGNdwc0gdv51OB9qMX+Fu5ypV74krTuV4kZlkx8+LHxm2Hc=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr1687245otk.107.1565076170034;
 Tue, 06 Aug 2019 00:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
 <0e1b6e0b-1c94-4b00-7fda-c2a303ee3816@redhat.com> <20190731194419.GB4084@kunai>
 <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
In-Reply-To: <f4a78e93-6aaa-bc72-cf94-06fc2574451c@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Aug 2019 09:22:39 +0200
Message-ID: <CAMuHMdUA-hjVqSP_c0cB=76cfrucF6xxRi3ymVoEsJ2hbkfT=A@mail.gmail.com>
Subject: Re: [PATCH RFC] modpost: Support I2C Aliases from OF tables
To:     Javier Martinez Canillas <javierm@redhat.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
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

Hi Javier,

On Tue, Aug 6, 2019 at 12:25 AM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> On 7/31/19 9:44 PM, Wolfram Sang wrote:
> > Hi Javier,
> >> The other option is to remove i2c_of_match_device() and don't make OF match
> >> to fallback to i2c_of_match_device_sysfs(). This is what happens in the ACPI
> >> case, since i2c_device_match() just calls acpi_driver_match_device() directly
> >> and doesn't have a wrapper function that fallbacks to sysfs matching.
> >>
> >> In this case an I2C device ID table would be required if the devices have to
> >> be instantiated through sysfs. That way the I2C table would be used both for
> >> auto-loading and also to match the device when it doesn't have an of_node.
> >
> > That would probably mean that only a minority of drivers will not add an I2C
> > device ID table because it is easy to add an you get the sysfs feature?
> >
>
> I believe so yes.

> As Masahiro-san mentioned, this approach will still require to add a new macro
> MODULE_DEVICE_TABLE(i2c_of, bar_of_match) so the OF device table is used twice.
>
> One to expose the "of:N*T*Cfoo,bar" and another one to expose it as "i2c:bar".
>
> I expect that many developers would miss adding this macro for new drivers that
> are DT-only and so sysfs instantiation would not work there. So whatever is the
> approach taken we should clearly document all this so drivers authors are aware.

You could add a new I2C_MODULE_DEVICE_TABLE() that adds both, right?
Makes it a little bit easier to check/enforce this.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
