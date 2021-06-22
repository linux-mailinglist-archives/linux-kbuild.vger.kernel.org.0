Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D223B10C9
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jun 2021 01:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFVXv4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Jun 2021 19:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbhFVXvz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Jun 2021 19:51:55 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10E3C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jun 2021 16:49:38 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c5so811436pfv.8
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jun 2021 16:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BoYhYJcoyESGzBZwFcvog/ZaPEUbImqWttNrXwz9hqM=;
        b=E5M8VEzJlXeHS5fRl8ycOg6lcDdG3ieqKqbtfUXOUrNEAJS61ptU3v24wmF2DULJ97
         uNLEYzGC8oLDmHCQKL8x/Y/fV8NpLDJkhNetjmD0DhodgsNm61nEVgvYE6exI905qQIF
         pb4r4+29+jgRh+o7NRyQWnECnYngQiO34iU74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BoYhYJcoyESGzBZwFcvog/ZaPEUbImqWttNrXwz9hqM=;
        b=DVptEFWgv3+IDU1t3V2RU4B6U/9l4X6t85glCWyXQuUzQdzXnm4LZQ1czSxUwJ0E4Q
         2eNSWOxt1m4qh5Vgpgrv14Y2KE+lcqFqljm8khE83B20WqqHA1yGkJU2zXnQyIz3yPOu
         jfSbWQwudFe1vTSbGawDi759UowY//6hNnpm+VBW/6zw5u/wfM7chYiLrZPh04U9kvfK
         rMgRoige4hA40CBl4e7G+7k1+QIXLwiZPqNAVMd4rqxO3kYY0JPwcvxaov7WlYvDMzux
         /rwrWSFpm4eXmkgBw8BqGWXLRhIv5rGdTg/pFtWCdq3VV9wrwhFKHPEmBwR5Jx9fY7yL
         1+Eg==
X-Gm-Message-State: AOAM530vvqXOQLe9TnKuPbntaQq4yiga1QuFAzqeD1gBPqId8Yze4An4
        03qIlS41/l8wwKOqUU7YjfHN+w==
X-Google-Smtp-Source: ABdhPJyM+4uG3YUoJSW1N4ZCJHbEb4TeNqR+HMzw8RInxKM7qsctzHDqKc86TsM2hAfIobORJquliQ==
X-Received: by 2002:a65:4689:: with SMTP id h9mr1046233pgr.347.1624405778177;
        Tue, 22 Jun 2021 16:49:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:dc21:8b6f:f8cd:9070])
        by smtp.gmail.com with UTF8SMTPSA id jz10sm3362167pjb.4.2021.06.22.16.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 16:49:37 -0700 (PDT)
Date:   Tue, 22 Jun 2021 16:49:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: Looking for help with Kconfig dependencies
Message-ID: <YNJ3EBDSbqfT/sAk@google.com>
References: <YMzSbDL+XvpLPaTb@google.com>
 <CAK7LNARta+3nakY9hiDVqTjD4XFhw+eBmXPOZkHb96wR1f_+bg@mail.gmail.com>
 <YNCoYnurpk64+jlF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YNCoYnurpk64+jlF@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 21, 2021 at 07:55:30AM -0700, Matthias Kaehlcke wrote:
> On Sat, Jun 19, 2021 at 10:30:22AM +0900, Masahiro Yamada wrote:
> > On Sat, Jun 19, 2021 at 2:05 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > I'm adding a new driver and have an issue with Kconfig dependencies
> > > that I coulnd't sort out so far.
> > >
> > > Patch https://lore.kernel.org/patchwork/patch/1444212/ adds the new
> > > onboard_usb_hub driver which exports two functions,
> > > onboard_hub_create_pdevs() and onboard_hub_destroy_pdevs(). It also
> > > provides stubs for these functions which are used when the driver
> > > is not selected (CONFIG_USB_ONBOARD_HUB=n).
> > >
> > > The new exported functions are called by the xhci-plat driver
> > > (https://lore.kernel.org/patchwork/patch/1444215/). Since xhci-plat
> > > now depends on symbols from the onboard_hub_driver the following
> > > dependency was added to its Kconfig entry:
> > >
> > >   config USB_XHCI_PLATFORM
> > >     tristate "Generic xHCI driver for a platform device"
> > >     select USB_XHCI_RCAR if ARCH_RENESAS
> > >  +  depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB
> > >
> > > This generally seems to work, however when USB_XHCI_PLATFORM is
> > > forced to be builtin by another driver that depends on it (e.g.
> > > USB_DWC3) it is still possible to build the onboard_hub driver
> > > as a module, which results in unresolved symbols:
> > >
> > > aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> > > `xhci_plat_remove':
> > > drivers/usb/host/xhci-plat.c:427: undefined reference to
> > > `onboard_hub_destroy_pdevs'
> > > drivers/usb/host/xhci-plat.c:427:(.text+0x82c): relocation truncated
> > > to fit: R_AARCH64_CALL26 against undefined symbol
> > > `onboard_hub_destroy_pdevs'
> > > aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> > > `xhci_plat_probe':
> > > drivers/usb/host/xhci-plat.c:379: undefined reference to
> > > `onboard_hub_create_pdevs'
> > > drivers/usb/host/xhci-plat.c:379:(.text+0x131c): relocation truncated
> > > to fit: R_AARCH64_CALL26 against undefined symbol
> > > `onboard_hub_create_pdevs'
> > >
> > > Kconfig generates the following warning with this configuration:
> > >
> > > WARNING: unmet direct dependencies detected for USB_XHCI_PLATFORM
> > >   Depends on [m]: USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && (USB_ONBOARD_HUB [=m] || !USB_ONBOARD_HUB [=m])
> > >   Selected by [y]:
> > >   - USB_DWC3 [=y] && USB_SUPPORT [=y] && (USB [=y] || USB_GADGET [=y]) && HAS_DMA [=y] && USB_XHCI_HCD [=y]
> > >   Selected by [m]:
> > >   - USB_CDNS_SUPPORT [=m] && USB_SUPPORT [=y] && (USB [=y] || USB_GADGET [=y]) && HAS_DMA [=y] && USB_XHCI_HCD [=y]
> > >   - USB_BRCMSTB [=m] && USB_SUPPORT [=y] && USB [=y] && (ARCH_BRCMSTB [=y] && PHY_BRCM_USB [=m] || COMPILE_TEST [=y]) && USB_XHCI_HCD [=y]
> > >   - USB_XHCI_MVEBU [=m] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && HAS_IOMEM [=y] && (ARCH_MVEBU [=y] || COMPILE_TEST [=y])
> > >
> > > I read through kconfig-language.rst and experimented a fair bit,
> > > but haven't found a working solution. Any advice would be
> > > appreciated.
> > >
> > > Thanks
> > >
> > > Matthias
> > 
> > 
> > 
> > This issue should be discussed in the USB ML,
> 
> That's where it was initially brought up, but it didn't get the attention
> of anyone in the position to give advice. Since the issue is more about
> kbuild dependencies than USB specifically I brought it up here. The driver
> already landed in the USB tree but was reverted due to this issue, I'm
> stuck on this problem and really don't want the driver to die on the
> finish line.
> 
> A workaround could be to make the driver 'bool' rather than 'tristate',
> but I'm not sure if that would be acceptable.
> 
> > but probably 'depends on USB_XHCI_PLATFORM' should be used everywhere instead of
> > 'depends on USB_XHCI_PLATFORM'.
> 
> Did you mean 'select USB_XHCI_PLATFORM' rather than 'depends on
> USB_XHCI_PLATFORM'? In general that sounds reasonable, since the drivers don't
> actually depend on USB_XHCI_PLATFORM from a build perspective, and it's what
> some drivers actually do. However it doesn't fix the problem, apparently a
> 'select X' from CONFIG_Y still results in CONFIG_X being 'y' if CONFIG_Y is
> 'y' (see the USB_DWC3 case above).

After some more experimentation it looks like the opposite fixes the conflict,
i.e. changing all instances of 'select USB_XHCI_PLATFORM' to 'depends on
USB_XHCI_PLATFORM'.

That's also in line with the recommendation to limit the use of 'select' to
certain use cases:

  select should be used with care. select will force a symbol to a value without
  visiting the dependencies. By abusing select you are able to select a symbol
  FOO even if FOO depends on BAR that is not set. In general use select only
  for non-visible symbols (no prompts anywhere) and for symbols with no
  dependencies. That will limit the usefulness but on the other hand avoid the
  illegal configurations all over.

  https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html
