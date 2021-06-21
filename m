Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D1A3AEC8A
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 17:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFUPhn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 11:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhFUPhm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 11:37:42 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AF0C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 08:35:27 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id u18so8569699pfk.11
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Z6um6vSOtXASiA7h2j5aaZlwZWv+UAQVbbl8FBT3SM=;
        b=ffvYO8VWnq3MSBjukp958TsYixRe7qd48kpaRn7fgJOe/7QsngOiqhwV5kYc0cFwfQ
         LzKzGMOWg7X0TvOCgwNEXjkQvu0ZKA1gubVd8iIKMy1EBTGXO9Y6rn/5+YUh2StDVdxK
         h+edQ+VH0AHoXhUt1ZyzooyiPblJndzuzTs0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Z6um6vSOtXASiA7h2j5aaZlwZWv+UAQVbbl8FBT3SM=;
        b=jSWATlOtGzWeQuGPKM60Tpo6tz8Hfpogxs5rhYbf//fdVdiVxNr8Zk/UWvcjPVvHMF
         nVEWrBBMJMAIpgChOCqswl2vh/ZdezUbZ8Fi9G9j1JaYYcq1BBrNSpdMcZPvHPRQ4PkM
         8nSEHadm4DfcfhwsnMQ8RFyhQZ1CRvicJd6Zy6Osb8wtfEgws5YryQUMJxLX0G+NmUmF
         ErEmuv/PXufanjF2rRmd23D1cfQjMLn2qBTI+6Cj4NHETrAY2PKAlIesGdFP4jKTe+xT
         Z5ulK4mWouWWFR1R+znev/CXNkUlpFuEROFFQkPG6cX4aDbXj6eWq3e2oKbfqCHtMRFx
         kdnA==
X-Gm-Message-State: AOAM5312FRRzdtdiyQpgJGGl2zzaJsFB+47ja3fvcQ6hx1sLuiufA+tT
        oIP7Aq7aXjYe+KGUNLzWld1RNA==
X-Google-Smtp-Source: ABdhPJz1vb3hujhC4eOPR46a/Q/L3haHuLhXnVF/0Ibjv+WaXLv2AwdF11r5C72da2EEKHfiMahMxQ==
X-Received: by 2002:a63:921e:: with SMTP id o30mr16620136pgd.346.1624289726620;
        Mon, 21 Jun 2021 08:35:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:9f0f:4fd2:adeb:6f55])
        by smtp.gmail.com with UTF8SMTPSA id f12sm1628243pfc.100.2021.06.21.08.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 08:35:26 -0700 (PDT)
Date:   Mon, 21 Jun 2021 08:35:24 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org
Subject: Re: Looking for help with Kconfig dependencies
Message-ID: <YNCxvElIL0RxreKe@google.com>
References: <YMzSbDL+XvpLPaTb@google.com>
 <dc68833d-e525-eeda-5c7c-fbbd8a3287c8@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc68833d-e525-eeda-5c7c-fbbd8a3287c8@metux.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 21, 2021 at 01:26:01PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 18.06.21 19:05, Matthias Kaehlcke wrote:
> 
> Hi,
> 
> 
> Cc'ing to linux-usb ...
> 
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
> 
> What exactly do you intent to archieve with this ?
> 
> X or !X = 1, isn't it ?
> 
> Why should something depend on something present or absent ?
> 
> Is that depends on ... statement necessary at all ?

I know, it's confusing, I had the same reaction when I first saw that
construct.

Effectively USB_XHCI_PLATFORM can be built without USB_ONBOARD_HUB.
However if USB_ONBOARD_HUB is built as a module then USB_XHCI_PLATFORM
should also be built as a module, which is what the above statement
achieves, unless there are conflicting dependencies.

The same construct is used for CONFIG_USB_XHCI_PCI.

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
> 
> It seems that Kconfig is confused by trying to enforce contradicting
> dependencies.

yep, the purpose of my post was to sort that out :)

> Now for your driver:

TBH I don't think this is the right thread to discuss the driver, this
should be done on the corresponding patches.

> If I understand it correctly, you've got a topology like this:
> 
> 
> root hub -+--> 2ndary hub #0 -+--> usb-dev #0
>           |                   \--> usb-dev #1
>           |                     ..
>           \--> 2ndary hub #1 -+--> usb-dev #3
>                               \--> usb-dev #4
> 
> 
> And in order to get usb-dev #foo running, you need the corresponding
> hub on its path powered (which in turn is platform specific).
> 
> Correct ?

yep

> So, why not reflecting exactly this topology in the device tree ?
> In that case, the power management *IMHO* could pretty automatically
> (assuming you've implemented the corresponding pm functions on the
> 2ndary hub driver).
> 
> Okay, that could become a bit tricky when the usb-dev's are
> automatically enumerated on the root hub and would need to be
> reparented somehow ... @usb folks: it that possible ?

AFAIK the USB devices (including the secondary hubs) are all automatically
enumerated, the representation in the device tree is optional in the vast
majority of cases, so it's a bit of a chicken-egg problem.

> Another option could be implementing this as a regulator that the
> individual usb devices will be attached to. Not completely semantically
> correct (since a hub isn't exactly a regulator :o), but should at least
> do the job: the regulator will be switched on when the device is used
> and can be switched off when it isn't used anymore.

IMO the representation as a hub is preferable, also initialization might
be more complex than switching on a single regulator (e.g. multiple
regulators, GPIOs, clocks, ...)

> The cleanest approach, IMHO, might be adding an hub subsys, somewhat
> similar to the existing phy subsys. I can imagine similar cases with
> other interfaces, not just USB only, at least certainly not specific
> to xhci.
> 
> Or could existing phy subsys already be sufficient for that ?

I'll leave that to the USB maintainers, who seem to be happy/ok with
the current approach. There was discussion about other solutions,
including a revival of the pwrseq series
(https://lore.kernel.org/patchwork/project/lkml/list/?series=314989&state=%2A&archive=both),
which was discarded.

In any case the current solution isn't specific to xHCI. At this point
only xhci-plat is supported, however it could be extended to other
USB controllers if needed.
