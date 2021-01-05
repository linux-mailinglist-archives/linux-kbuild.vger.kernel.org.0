Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0946A2EA194
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Jan 2021 01:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbhAEAr7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Jan 2021 19:47:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbhAEAr7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Jan 2021 19:47:59 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7D1C061574;
        Mon,  4 Jan 2021 16:47:18 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id j13so669825pjz.3;
        Mon, 04 Jan 2021 16:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rc5X9acQFeSGX18I0m+8ytmMlwSYGSKjC0klRBQj/qc=;
        b=oPEvnMHad8w7YJo7KzfyDABsB6qHI9n07KgRl6diBvqizln9b9rHUfbBFoCzjqs+ZE
         8t+26p9hh2MhykQlCxbyqrPfG77ZblQbE6HVMm0rEvULe5N//dnNaYDhGDvMTYA2tUmu
         W6i3WReNZ/R/JGvsvThPLBbZRsCAV5BUvawtugQce2oVP9NOgO+VQx+7BCaHOPWxTXfX
         vdl0z+C9fqtyzKG/pfbSq7uOYh0WuvJtN0ToX1oGAbYylFOFlcmJ6ZEvEq+6ELG5EyjY
         GfFf50oHobhcSGCSx8nIzfPGqLLwHVPKQYiWVi42QAnMa48bgebMfeStbPR4S4woPtbT
         4TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rc5X9acQFeSGX18I0m+8ytmMlwSYGSKjC0klRBQj/qc=;
        b=jjI65JRg2QywmSwfJF+4/vnL7yy1RQ1yeAKjHELhKX62xHsmjEguRFLLTgzmN92+ae
         NuvhW3sec/PR3nk5h5Gb2aHqFjLOHnNJvxra2TZXT4MAClwZe+IBVrQwYUbInUyqfjRf
         vrIcGb95IjO24WVaOJInmXaq5fhZHE2vZAuOcZYK3SfG0Kw8h9EHYIoPzpt1DSoB2biq
         U+t3kyN7BDbePAabxFlbNyztex/nwnOsdFYJx5z7P1NWGnD355WV3sZNsxz9MCfzDfsN
         n3PB0nJ5biu1zRSc3+W5Rf7vNiXvrpi5tLGVa3tBQdTZlvZuufyb9DYUgr+sDOn2zdQr
         EvMQ==
X-Gm-Message-State: AOAM531WG0Qk24KnSwAeeYr8fca1dn2mVb2PO2hvio9NmKsDjJA7xRZ4
        j827uEKvNHSF/srGcZtD7jfHZorEBpPC8g==
X-Google-Smtp-Source: ABdhPJwkWxe75KZ57CLIv64nM9C4AEmsZxY5chE7173VpoZcJBTGjBo392XW2QmUG/ovvAZn9lce3g==
X-Received: by 2002:a17:902:854b:b029:db:c725:edcd with SMTP id d11-20020a170902854bb02900dbc725edcdmr75450086plo.64.1609807638382;
        Mon, 04 Jan 2021 16:47:18 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
        by smtp.gmail.com with ESMTPSA id gb9sm490067pjb.40.2021.01.04.16.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 16:47:17 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
        by localhost.lan (Postfix) with ESMTPSA id 3F5EF9008FF;
        Tue,  5 Jan 2021 00:47:13 +0000 (GMT)
Date:   Tue, 5 Jan 2021 00:47:12 +0000
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Rob Herring <robh@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Is there a reason not to use -@ to compile devicetrees ?
Message-ID: <20210105004712.06d47388@gmail.com>
In-Reply-To: <20201221144707.4a409618@gmail.com>
References: <20201221144707.4a409618@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Ping ?

On Mon, 21 Dec 2020 14:47:07 +0000, Vincent Pelletier <plr.vincent@gmail.com> wrote:
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
-- 
Vincent Pelletier
