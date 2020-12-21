Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D522DFFE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 19:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgLUSfo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 13:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgLUSfo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 13:35:44 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB333C0613D3;
        Mon, 21 Dec 2020 10:35:03 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id 15so12221026oix.8;
        Mon, 21 Dec 2020 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=UdOteWnW7i/kwmgLmK54m6KZ8j6I+N2J/FJ9u7HtzMI=;
        b=TPewVy12QJRbsxEyeO1fA/DB3Nf6YeGsz65pQo+aB+IR5JFV9UVhMWhZ27kAW/sIP2
         zJhQNVOHGvGSqbWRbRJPY7EC0er86uPEzI0CEIXDMQgN/XDZov6ZWn55ohSYzOdBdeW9
         r+nrcRpZnkNfElx8CmbQXq9vWVhBQVtgTW6E05MuuD1+TCfLg631plwubrr3+TMDHrwx
         3yiBRIAvewf9OyRpROGSM7/pNkU83L5TIh5nPWmNjW9AELb0/T2FgtEJm8cTzvHahg0J
         oUl7rHZz6XN09+Qdyms4dm780YyqH7G8z+kBfoyPydDGmgwPJRP1vr4vspbK63nChmQT
         Sa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=UdOteWnW7i/kwmgLmK54m6KZ8j6I+N2J/FJ9u7HtzMI=;
        b=f0sIEqGOIAU+xd9b813NtTLxBmmkQ0NIAajook4F3p2KKm8sAXQQKuGeJYwldfkIvz
         gaRTAuzXXe6Wvh0AKq9YHC0cjklDUBRExLoFVJZsjnL4P/noiwl9764sBVYmsneR8VRz
         JPsJM4TXg1u/lPs1z/2gVNb0apKTYRgq/sOumUEI+u5YzL8FbDE8hOrz9tMCIdC5cMzP
         zMgCQuYg58ceAakHet+USA74+uT3mXGZQwINRbsrmVfWnjHYyX4NZNPoOkCWbTruY7yy
         PxhHocYeMeAJH325Yk9vsgN9Kbjh1MUlCyt34wI1unHZuiARlb4lumRMZ2+MlvoF00nk
         zlOA==
X-Gm-Message-State: AOAM532ZT8A7ZnjycxL7YtJul4M7RHWdoVrq6O7Taa+u1aXY7VAAjncT
        Y4oVhV265ID0cBHEDk7WxWmJUnV4uhpnow==
X-Google-Smtp-Source: ABdhPJz5QuyDyqADUwKqmV1WpT9WXvJloGrJDRhoT3KWqa5m3zGS2FNR/LFNrW6LBXhHsBinjsQn3w==
X-Received: by 2002:a17:90a:6589:: with SMTP id k9mr17381640pjj.100.1608562032476;
        Mon, 21 Dec 2020 06:47:12 -0800 (PST)
Received: from localhost.lan (p8006072-ipngn42301marunouchi.tokyo.ocn.ne.jp. [180.34.60.72])
        by smtp.gmail.com with ESMTPSA id n7sm16898928pfn.141.2020.12.21.06.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 06:47:11 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
        by localhost.lan (Postfix) with ESMTPSA id 8901B90088B;
        Mon, 21 Dec 2020 14:47:07 +0000 (GMT)
Date:   Mon, 21 Dec 2020 14:47:07 +0000
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Rob Herring <robh@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Is there a reason not to use -@ to compile devicetrees ?
Message-ID: <20201221144707.4a409618@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

Distro: https://raspi.debian.net/ (sid)
Hardware: Raspberry Pi Zero W
Kernel version: 5.9.11 (linux-image-5.9.0-4-rpi)

To access a device connected to my pi, I need the spi0 bus, and would
like to not be doing GPIO bit-banging when there are perfectly good
spi modules capable of using the SPI alternative mode of these pins.

spi0 is declared in the vanilla devicetree for this device:
arch/arm/boot/dts/bcm2835-rpi-zero-w.dts ends up including
arch/arm/boot/dts/bcm283x.dtsi which contains:
                spi: spi@7e204000 {
                        compatible = "brcm,bcm2835-spi";
                        reg = <0x7e204000 0x200>;
                        interrupts = <2 22>;
                        clocks = <&clocks BCM2835_CLOCK_VPU>;
                        #address-cells = <1>;
                        #size-cells = <0>;
                        status = "disabled";
                };
To my new-to-devicetree eye, this looks like this is intended to be
overridden, at least with a
  status = "okay";
property (although a bit more is needed).
As I believe is the correct way, I wrote a devicetree overlay doing
this and a bit more in order to enable this bus and one of its device
(the one matching the chip-select monitored by the board I connected).

To confirm that I had no typo in my symbol names I ran fdtoverlay with
the packaged device tree binary, plus my overlay, but could not get it
to work, until I took a closer look at the packaged device tree and
realised it lacks a __symbols__ section.
So I pulled the source, added "-@" to the cmd_dtc rule in
scripts/Makefile.lib, built the dtb, tested fdtoverlay against it and
voila, it worked. I could then reboot with this devicetree, load my
overlay and use spi0 with no further change.

So now I wonder why this option is not enabled while there are these
sections which seem to not be usable without an overlay ?
And further, why it does not seem to be possible to enable with a
kernel config option ?

I must be missing something obvious, but I'm still failing to see it.

Regards,
-- 
Vincent Pelletier
