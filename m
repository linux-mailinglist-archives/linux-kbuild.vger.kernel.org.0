Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E243AD67E
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Jun 2021 03:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235346AbhFSBdk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Jun 2021 21:33:40 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51530 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbhFSBdj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jun 2021 21:33:39 -0400
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 15J1Uxin022987;
        Sat, 19 Jun 2021 10:30:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 15J1Uxin022987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1624066260;
        bh=Cp7QD+bccHRZtNNHErN/HQu4GsD1ER9UhwYE+8TuDzY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BhBhMJxuK1Y7bX6GGH7ZmTdLRbhHCSQl9LuGXWMRCttYGnYfaL7Hliy8HrNR8AFUD
         /MTtUC7vp8rsXNf5dSGK+IPNH5yBbrPTyaa9QbTlut7Q3vWUAOVOfwfWPzM7hbREc/
         /T/7T9s5zT1Fj3/x/exR4M6dHtBS7cl23yqvLOdAZOuTmO2tvfUJ3+8EiorVvAQj9w
         pJ+SrY4XvH1HxDFQhw2sTznQzeSDxePRIXfX9kyaDF4k+ev9JQFh/epL1Xr709+cv9
         AlqJt7OM1SdAarQ4yiR4oR/t+Rix6ZChYfY4jIDmE42l1aq1n05MRmIQAJ1b3fSE6G
         ZVcTFmyfVqUWg==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id t17so9276795pga.5;
        Fri, 18 Jun 2021 18:30:59 -0700 (PDT)
X-Gm-Message-State: AOAM530WeOUZyDBlIJvoENu645Rfl92ihpSx+crqGgW6Xn/8KzCIypxT
        6w8JXc3PWoOoPV8YGdOzFKNc3eKa4GnqhLQbOPA=
X-Google-Smtp-Source: ABdhPJydj7xls9tK18jSNEBcihG9l/kZR7QQBjMJaWR1qcjQB5NHmrTTqMg41N0S8kL5gULPRk7rSrp96VSSn3G0szw=
X-Received: by 2002:a63:d403:: with SMTP id a3mr12803014pgh.175.1624066258921;
 Fri, 18 Jun 2021 18:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <YMzSbDL+XvpLPaTb@google.com>
In-Reply-To: <YMzSbDL+XvpLPaTb@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 19 Jun 2021 10:30:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARta+3nakY9hiDVqTjD4XFhw+eBmXPOZkHb96wR1f_+bg@mail.gmail.com>
Message-ID: <CAK7LNARta+3nakY9hiDVqTjD4XFhw+eBmXPOZkHb96wR1f_+bg@mail.gmail.com>
Subject: Re: Looking for help with Kconfig dependencies
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 19, 2021 at 2:05 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Hi,
>
> I'm adding a new driver and have an issue with Kconfig dependencies
> that I coulnd't sort out so far.
>
> Patch https://lore.kernel.org/patchwork/patch/1444212/ adds the new
> onboard_usb_hub driver which exports two functions,
> onboard_hub_create_pdevs() and onboard_hub_destroy_pdevs(). It also
> provides stubs for these functions which are used when the driver
> is not selected (CONFIG_USB_ONBOARD_HUB=n).
>
> The new exported functions are called by the xhci-plat driver
> (https://lore.kernel.org/patchwork/patch/1444215/). Since xhci-plat
> now depends on symbols from the onboard_hub_driver the following
> dependency was added to its Kconfig entry:
>
>   config USB_XHCI_PLATFORM
>     tristate "Generic xHCI driver for a platform device"
>     select USB_XHCI_RCAR if ARCH_RENESAS
>  +  depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB
>
> This generally seems to work, however when USB_XHCI_PLATFORM is
> forced to be builtin by another driver that depends on it (e.g.
> USB_DWC3) it is still possible to build the onboard_hub driver
> as a module, which results in unresolved symbols:
>
> aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> `xhci_plat_remove':
> drivers/usb/host/xhci-plat.c:427: undefined reference to
> `onboard_hub_destroy_pdevs'
> drivers/usb/host/xhci-plat.c:427:(.text+0x82c): relocation truncated
> to fit: R_AARCH64_CALL26 against undefined symbol
> `onboard_hub_destroy_pdevs'
> aarch64-linux-gnu-ld: drivers/usb/host/xhci-plat.o: in function
> `xhci_plat_probe':
> drivers/usb/host/xhci-plat.c:379: undefined reference to
> `onboard_hub_create_pdevs'
> drivers/usb/host/xhci-plat.c:379:(.text+0x131c): relocation truncated
> to fit: R_AARCH64_CALL26 against undefined symbol
> `onboard_hub_create_pdevs'
>
> Kconfig generates the following warning with this configuration:
>
> WARNING: unmet direct dependencies detected for USB_XHCI_PLATFORM
>   Depends on [m]: USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && (USB_ONBOARD_HUB [=m] || !USB_ONBOARD_HUB [=m])
>   Selected by [y]:
>   - USB_DWC3 [=y] && USB_SUPPORT [=y] && (USB [=y] || USB_GADGET [=y]) && HAS_DMA [=y] && USB_XHCI_HCD [=y]
>   Selected by [m]:
>   - USB_CDNS_SUPPORT [=m] && USB_SUPPORT [=y] && (USB [=y] || USB_GADGET [=y]) && HAS_DMA [=y] && USB_XHCI_HCD [=y]
>   - USB_BRCMSTB [=m] && USB_SUPPORT [=y] && USB [=y] && (ARCH_BRCMSTB [=y] && PHY_BRCM_USB [=m] || COMPILE_TEST [=y]) && USB_XHCI_HCD [=y]
>   - USB_XHCI_MVEBU [=m] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && HAS_IOMEM [=y] && (ARCH_MVEBU [=y] || COMPILE_TEST [=y])
>
> I read through kconfig-language.rst and experimented a fair bit,
> but haven't found a working solution. Any advice would be
> appreciated.
>
> Thanks
>
> Matthias



This issue should be discussed in the USB ML,
but probably 'depends on USB_XHCI_PLATFORM'
should be used everywhere instead of
'depends on USB_XHCI_PLATFORM'.







--
Best Regards
Masahiro Yamada
