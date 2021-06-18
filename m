Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4303AC408
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Jun 2021 08:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbhFRGnE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Jun 2021 02:43:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230408AbhFRGnE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jun 2021 02:43:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B78F60FF4;
        Fri, 18 Jun 2021 06:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623998455;
        bh=I6t3BsuXoW1cps0ZCaiZQV3tOIvkZXAxUoTVJlmGoVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bV8rj8NKR6MT5+dMfX1d3UWWu78qlCZdZJdArcyOc5sixFcTYkFI73RvUPKpYRgbq
         C7VTjsvmwQLugqTAF6z+zKfS2ayJfb0iUTrEo24yVwdMWxXmPxmv8tUJFYYVABMHZZ
         d9dSl9N9eM+mof6SoYrdl9qrP2/HYhskIE36SXbo=
Date:   Fri, 18 Jun 2021 08:40:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.or, lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org
Subject: Re: [next] [arm64] allmodconfig build failed - xhci-plat.c:427:
 undefined reference to `onboard_hub_destroy_pdevs'
Message-ID: <YMw/9NzwwfRhUX/y@kroah.com>
References: <CA+G9fYu6er1nZ602gCnrY+-JNtDHrUJk-RH2biPmjRoe06_m4Q@mail.gmail.com>
 <YMtSFVg6UoOpDqIP@kroah.com>
 <YMuRcrE8xlWnFSWW@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMuRcrE8xlWnFSWW@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 17, 2021 at 11:16:18AM -0700, Matthias Kaehlcke wrote:
> On Thu, Jun 17, 2021 at 03:45:57PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jun 17, 2021 at 07:09:15PM +0530, Naresh Kamboju wrote:
> > > The arm64 allmodconfig build failed on Linux next 20210617 tag due to
> > > the commit,
> > > 
> > > c950686b382d ("usb: host: xhci-plat: Create platform device for
> > > onboard hubs in probe()")
> > > 
> > > build error:
> > > ------------
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
> > > make[1]: *** [Makefile:1252: vmlinux] Error 1
> > > make[1]: Target '__all' not remade because of errors.
> > > make: *** [Makefile:222: __sub-make] Error 2
> > > make: Target '__all' not remade because of errors.
> > 
> > Matthias, this is due to your patch, yet-another config option mis-match
> > somewhere. Can you please fix it up?
> 
> I can repro this with:
> 
> make -j 16 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
>   KCONFIG_ALLCONFIG=arch/arm64/configs/defconfig allmodconfig kernel modules
> 
> This results in:
> 
> CONFIG_USB_XHCI_PLATFORM=y
> CONFIG_USB_ONBOARD_HUB=m
> 
> The following Kconfig dependency was supposed to prevent this scenario:
> 
> config USB_XHCI_PLATFORM
>         depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB
> 
> But apparently this isn't the case.
> 
> With the above allmodconfig command the following warning is emitted:
> 
> WARNING: unmet direct dependencies detected for USB_XHCI_PLATFORM
>   Depends on [m]: USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && (USB_ONBOARD_HUB [=m] || !USB_ONBOARD_HUB [=m])
> 
> I read through kconfig-language.rst multiple times, but it's still not
> clear to me how to specify this dependency properly.
> 
> Masahiro/Greg, do you have any pointers?

Right now, no, sorry, and I don't have the bandwidth to look into this
myself.

I've reverted this series from the tree for now, as this issue isn't ok
for breaking linux-next, and due to the other merge issues with the dts
files.  Please work on fixing this up and resending the series when it
is resolved.

thanks,

greg k-h
