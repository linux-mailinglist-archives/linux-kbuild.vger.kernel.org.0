Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447E13AEBD5
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 16:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFUO5t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 10:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhFUO5s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 10:57:48 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754E5C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 07:55:33 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h4so2841549pgp.5
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 07:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YKWX9E78t5VwiKzBY9j3I258nFLcqGeYwXCUvNxpHeY=;
        b=NNtwhS+qRYpytkcyBCNgt1UcEVyjek7CJcDS70ngdaOxQCQZYiARvL2e+MfvoluGGO
         zsg2Jnufj4cxJ6nbEz06tmc5TppuVBOnAXhqKA5Yp4ObhepOEEBDEML1wdXNkA98SEmn
         Bw3jYtj8nxec7iq+S0kz63VqyxO/odwOLup6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YKWX9E78t5VwiKzBY9j3I258nFLcqGeYwXCUvNxpHeY=;
        b=IuUF2yy2F4tjwESnnmHqgxtStQpeO++Y0J+fzkVAF5CNQsd6f8Y3JLM5K2Rf2xfeAY
         McSUqBQcm0uSmZQvRzNcOwurGTun7Sn/897apUNjGhydMUSPUm5TCYc+xiMqQkGTBZGo
         ePwGWyV3D0Kyq51O283PJiyRFLyZZ23Wvp79NcO+ojwZHFp5Bum+iFnkKln/Cxy+rLuk
         PtF3owEUamQPJ46F1A4tH+Mi+OLLtzOZxypd3apchhkbZ3wsQMtkOA7OQ2EKcUiZ83IC
         FB09s0oPUxdZRElfbq0DCS+uyUryHRDRa2gXUJ5dqX/cpbbuazmvJaeEUv4aV8Td9Max
         lmNA==
X-Gm-Message-State: AOAM5310fT9OIIQcRNrxDcHRrEDUd+1qQk/ziXyu5W0VvgeHa6gFKVfx
        pNQlYQ0nA5IW7Kgwg+aZUE+SPUXNDymTNg==
X-Google-Smtp-Source: ABdhPJxew9RkUBWkAYt8nUQOG2CbN+kPAKkNCVPsFTsK5Bt9XKTwv7gz2khj/vY5ViqRH4xREtvJTg==
X-Received: by 2002:a63:4b52:: with SMTP id k18mr24663845pgl.190.1624287332943;
        Mon, 21 Jun 2021 07:55:32 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:9f0f:4fd2:adeb:6f55])
        by smtp.gmail.com with UTF8SMTPSA id u1sm15418681pfu.160.2021.06.21.07.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 07:55:32 -0700 (PDT)
Date:   Mon, 21 Jun 2021 07:55:30 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: Looking for help with Kconfig dependencies
Message-ID: <YNCoYnurpk64+jlF@google.com>
References: <YMzSbDL+XvpLPaTb@google.com>
 <CAK7LNARta+3nakY9hiDVqTjD4XFhw+eBmXPOZkHb96wR1f_+bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNARta+3nakY9hiDVqTjD4XFhw+eBmXPOZkHb96wR1f_+bg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 19, 2021 at 10:30:22AM +0900, Masahiro Yamada wrote:
> On Sat, Jun 19, 2021 at 2:05 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Hi,
> >
> > I'm adding a new driver and have an issue with Kconfig dependencies
> > that I coulnd't sort out so far.
> >
> > Patch https://lore.kernel.org/patchwork/patch/1444212/ adds the new
> > onboard_usb_hub driver which exports two functions,
> > onboard_hub_create_pdevs() and onboard_hub_destroy_pdevs(). It also
> > provides stubs for these functions which are used when the driver
> > is not selected (CONFIG_USB_ONBOARD_HUB=n).
> >
> > The new exported functions are called by the xhci-plat driver
> > (https://lore.kernel.org/patchwork/patch/1444215/). Since xhci-plat
> > now depends on symbols from the onboard_hub_driver the following
> > dependency was added to its Kconfig entry:
> >
> >   config USB_XHCI_PLATFORM
> >     tristate "Generic xHCI driver for a platform device"
> >     select USB_XHCI_RCAR if ARCH_RENESAS
> >  +  depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB
> >
> > This generally seems to work, however when USB_XHCI_PLATFORM is
> > forced to be builtin by another driver that depends on it (e.g.
> > USB_DWC3) it is still possible to build the onboard_hub driver
> > as a module, which results in unresolved symbols:
> >
> > aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> > `xhci_plat_remove':
> > drivers/usb/host/xhci-plat.c:427: undefined reference to
> > `onboard_hub_destroy_pdevs'
> > drivers/usb/host/xhci-plat.c:427:(.text+0x82c): relocation truncated
> > to fit: R_AARCH64_CALL26 against undefined symbol
> > `onboard_hub_destroy_pdevs'
> > aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> > `xhci_plat_probe':
> > drivers/usb/host/xhci-plat.c:379: undefined reference to
> > `onboard_hub_create_pdevs'
> > drivers/usb/host/xhci-plat.c:379:(.text+0x131c): relocation truncated
> > to fit: R_AARCH64_CALL26 against undefined symbol
> > `onboard_hub_create_pdevs'
> >
> > Kconfig generates the following warning with this configuration:
> >
> > WARNING: unmet direct dependencies detected for USB_XHCI_PLATFORM
> >   Depends on [m]: USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && (USB_ONBOARD_HUB [=m] || !USB_ONBOARD_HUB [=m])
> >   Selected by [y]:
> >   - USB_DWC3 [=y] && USB_SUPPORT [=y] && (USB [=y] || USB_GADGET [=y]) && HAS_DMA [=y] && USB_XHCI_HCD [=y]
> >   Selected by [m]:
> >   - USB_CDNS_SUPPORT [=m] && USB_SUPPORT [=y] && (USB [=y] || USB_GADGET [=y]) && HAS_DMA [=y] && USB_XHCI_HCD [=y]
> >   - USB_BRCMSTB [=m] && USB_SUPPORT [=y] && USB [=y] && (ARCH_BRCMSTB [=y] && PHY_BRCM_USB [=m] || COMPILE_TEST [=y]) && USB_XHCI_HCD [=y]
> >   - USB_XHCI_MVEBU [=m] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && HAS_IOMEM [=y] && (ARCH_MVEBU [=y] || COMPILE_TEST [=y])
> >
> > I read through kconfig-language.rst and experimented a fair bit,
> > but haven't found a working solution. Any advice would be
> > appreciated.
> >
> > Thanks
> >
> > Matthias
> 
> 
> 
> This issue should be discussed in the USB ML,

That's where it was initially brought up, but it didn't get the attention
of anyone in the position to give advice. Since the issue is more about
kbuild dependencies than USB specifically I brought it up here. The driver
already landed in the USB tree but was reverted due to this issue, I'm
stuck on this problem and really don't want the driver to die on the
finish line.

A workaround could be to make the driver 'bool' rather than 'tristate',
but I'm not sure if that would be acceptable.

> but probably 'depends on USB_XHCI_PLATFORM' should be used everywhere instead of
> 'depends on USB_XHCI_PLATFORM'.

Did you mean 'select USB_XHCI_PLATFORM' rather than 'depends on
USB_XHCI_PLATFORM'? In general that sounds reasonable, since the drivers don't
actually depend on USB_XHCI_PLATFORM from a build perspective, and it's what
some drivers actually do. However it doesn't fix the problem, apparently a
'select X' from CONFIG_Y still results in CONFIG_X being 'y' if CONFIG_Y is
'y' (see the USB_DWC3 case above).
