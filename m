Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326792EA331
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Jan 2021 03:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbhAECJD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Jan 2021 21:09:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:51736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbhAECJD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Jan 2021 21:09:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE25A22573;
        Tue,  5 Jan 2021 02:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609812502;
        bh=dec///n8ZMLVHWY8v+++x2RI6qJjcxqMCtixy9ig1+Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cwDIbJhkZgyAgmlqqBG7Yv9Sn3Cnk+TYMttcIpz6CecuM9RlmjnQtc0rI/IEFUe2n
         DPoGdiDRG1T5aWjIsa+7KOFbk/wl6LQpeP7amU7vXnHBfkXACbLIwuxR7rgCfFsoJ9
         Qjz/IGV2eDhNhh0CIj+WtV7/ZKlbeEvFAyeCy1RY4U0hnXajQrD5Ay4RjeHTMZG6DS
         TrtmHBNA8chFOffGaSRKRcqgvauylpeqvo/wIuAr6mFAgBKwIb3qPDQySlNO/qhZKm
         PpHBXFnlcnaCeq2TySxz6NkdSjPQXKGM5ER++NXiH1cNnjx9JIj4DtupY3QZCItHQe
         M3V4Wz2EKEOKw==
Received: by mail-ej1-f45.google.com with SMTP id 6so39329649ejz.5;
        Mon, 04 Jan 2021 18:08:21 -0800 (PST)
X-Gm-Message-State: AOAM531A3TVK30jStFo8ZWBvplu65YBo1kqwu6YT0vFgh2YMhFSPcPAS
        USCLIsLZZDdsMU1ymChtLu/hjXzxJaO/4abPyA==
X-Google-Smtp-Source: ABdhPJwnubR3LrlUWyJOeUCu0SGdf/IcybIxySz3erxk7JJ9r/5zilydM52G3xMb+0s5stBOe5OPaNcVb6dqa1MAeC4=
X-Received: by 2002:a17:906:d784:: with SMTP id pj4mr66885041ejb.360.1609812500509;
 Mon, 04 Jan 2021 18:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20201221144707.4a409618@gmail.com>
In-Reply-To: <20201221144707.4a409618@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 4 Jan 2021 19:08:08 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLCeNVnjgYAHhMEiv79iX552EPC7LGgk7GBrt2JsSYo5Q@mail.gmail.com>
Message-ID: <CAL_JsqLCeNVnjgYAHhMEiv79iX552EPC7LGgk7GBrt2JsSYo5Q@mail.gmail.com>
Subject: Re: Is there a reason not to use -@ to compile devicetrees ?
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 21, 2020 at 7:47 AM Vincent Pelletier <plr.vincent@gmail.com> wrote:
>
> Hello,
>
> Distro: https://raspi.debian.net/ (sid)
> Hardware: Raspberry Pi Zero W
> Kernel version: 5.9.11 (linux-image-5.9.0-4-rpi)
>
> To access a device connected to my pi, I need the spi0 bus, and would
> like to not be doing GPIO bit-banging when there are perfectly good
> spi modules capable of using the SPI alternative mode of these pins.
>
> spi0 is declared in the vanilla devicetree for this device:
> arch/arm/boot/dts/bcm2835-rpi-zero-w.dts ends up including
> arch/arm/boot/dts/bcm283x.dtsi which contains:
>                 spi: spi@7e204000 {
>                         compatible = "brcm,bcm2835-spi";
>                         reg = <0x7e204000 0x200>;
>                         interrupts = <2 22>;
>                         clocks = <&clocks BCM2835_CLOCK_VPU>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         status = "disabled";
>                 };
> To my new-to-devicetree eye, this looks like this is intended to be
> overridden, at least with a
>   status = "okay";
> property (although a bit more is needed).
> As I believe is the correct way, I wrote a devicetree overlay doing
> this and a bit more in order to enable this bus and one of its device
> (the one matching the chip-select monitored by the board I connected).
>
> To confirm that I had no typo in my symbol names I ran fdtoverlay with
> the packaged device tree binary, plus my overlay, but could not get it
> to work, until I took a closer look at the packaged device tree and
> realised it lacks a __symbols__ section.
> So I pulled the source, added "-@" to the cmd_dtc rule in
> scripts/Makefile.lib, built the dtb, tested fdtoverlay against it and
> voila, it worked. I could then reboot with this devicetree, load my
> overlay and use spi0 with no further change.
>
> So now I wonder why this option is not enabled while there are these
> sections which seem to not be usable without an overlay ?
> And further, why it does not seem to be possible to enable with a
> kernel config option ?
>
> I must be missing something obvious, but I'm still failing to see it.

Read the last time this came up:

https://lore.kernel.org/linux-devicetree/71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc/
