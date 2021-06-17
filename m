Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C973ABB3E
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 20:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhFQSSd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Jun 2021 14:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbhFQSS3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jun 2021 14:18:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03F29C06175F
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Jun 2021 11:16:21 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso5851005pjx.1
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Jun 2021 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KRi/QXe0LQzMi+6pLeInEK4KzKA0hEwqTLci8VnoWbw=;
        b=KbyM6iG9HXDNGfRNYStr2s8SyPWsQZtjPlPad/4hLqGHkDrCbaOZGleaLH7yVwgmnE
         ECfgkecSAKpwK/B66+nzo5bNna84QPwgFYhu7AmR3LnKnwV3WlgYZmTaVEAuCUbaEqk5
         uClapizSWOCsf6X1YtOqZ+HiL0Z8/VmrFu6ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KRi/QXe0LQzMi+6pLeInEK4KzKA0hEwqTLci8VnoWbw=;
        b=ln0tPpFKplMjcNuwz+HzDHemTtCIbgaJmPaNhRgvt2xhBuJ2GNmG8gs19vuTw9v5uN
         bWFiq6u8LXGkSri5YKcy6e/Sko73sH9HfTXgzIw30W7uDON7SsuCL1a3BUJ+1bRnXsh1
         fOzWELH1xbxiGxTEq9+QJqd0G40VMdy+XwvjLODhaKhR8uJiueH09xjyD4p1HG/tfqDL
         pXvRWPAtjth570Ye65Ckl3fpd6bmFYHRhGRTsK4vOyR6BOljZ8XyAYN/hpavvtXH6TVC
         eFWT8oUoTZ9WBNt4YdJU5APLH9GSQBf+27Q6umhYPV2vYRB3EZ32jexNL4LvrOqgAJbz
         aKgQ==
X-Gm-Message-State: AOAM533ECxTCj3/J8zvD3/rERydZW4jKqDpIiW3gCNCyDM3mi3+3Hhpw
        gD2KHRduVTGksn5+ZpQ2t7DjWg==
X-Google-Smtp-Source: ABdhPJwyJh/y5CCBFcqljYWo6aGyOfV35EucM7MER7B58+2F4yHzGguVOx690nkwweau6nsqLwS7Vw==
X-Received: by 2002:a17:90a:6001:: with SMTP id y1mr17085610pji.5.1623953780486;
        Thu, 17 Jun 2021 11:16:20 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:14b4:cd2e:dd64:19e8])
        by smtp.gmail.com with UTF8SMTPSA id n8sm9069159pjo.1.2021.06.17.11.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 11:16:20 -0700 (PDT)
Date:   Thu, 17 Jun 2021 11:16:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.or, lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org
Subject: Re: [next] [arm64] allmodconfig build failed - xhci-plat.c:427:
 undefined reference to `onboard_hub_destroy_pdevs'
Message-ID: <YMuRcrE8xlWnFSWW@google.com>
References: <CA+G9fYu6er1nZ602gCnrY+-JNtDHrUJk-RH2biPmjRoe06_m4Q@mail.gmail.com>
 <YMtSFVg6UoOpDqIP@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMtSFVg6UoOpDqIP@kroah.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 17, 2021 at 03:45:57PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 17, 2021 at 07:09:15PM +0530, Naresh Kamboju wrote:
> > The arm64 allmodconfig build failed on Linux next 20210617 tag due to
> > the commit,
> > 
> > c950686b382d ("usb: host: xhci-plat: Create platform device for
> > onboard hubs in probe()")
> > 
> > build error:
> > ------------
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
> > make[1]: *** [Makefile:1252: vmlinux] Error 1
> > make[1]: Target '__all' not remade because of errors.
> > make: *** [Makefile:222: __sub-make] Error 2
> > make: Target '__all' not remade because of errors.
> 
> Matthias, this is due to your patch, yet-another config option mis-match
> somewhere. Can you please fix it up?

I can repro this with:

make -j 16 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
  KCONFIG_ALLCONFIG=arch/arm64/configs/defconfig allmodconfig kernel modules

This results in:

CONFIG_USB_XHCI_PLATFORM=y
CONFIG_USB_ONBOARD_HUB=m

The following Kconfig dependency was supposed to prevent this scenario:

config USB_XHCI_PLATFORM
        depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB

But apparently this isn't the case.

With the above allmodconfig command the following warning is emitted:

WARNING: unmet direct dependencies detected for USB_XHCI_PLATFORM
  Depends on [m]: USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && (USB_ONBOARD_HUB [=m] || !USB_ONBOARD_HUB [=m])

I read through kconfig-language.rst multiple times, but it's still not
clear to me how to specify this dependency properly.

Masahiro/Greg, do you have any pointers?
