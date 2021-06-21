Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B678C3AE819
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 13:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhFUL2Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 07:28:24 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:42027 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhFUL2W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 07:28:22 -0400
Received: from [192.168.1.155] ([95.118.106.223]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MCbVD-1m4sS92Y2l-009jg5; Mon, 21 Jun 2021 13:26:02 +0200
Subject: Re: Looking for help with Kconfig dependencies
To:     Matthias Kaehlcke <mka@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org
References: <YMzSbDL+XvpLPaTb@google.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <dc68833d-e525-eeda-5c7c-fbbd8a3287c8@metux.net>
Date:   Mon, 21 Jun 2021 13:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMzSbDL+XvpLPaTb@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4mUa0pTKHzfbHEWaQMxLtXFYZPEqZQ1iMJxpriWtBw/1ulBeBCz
 xNI9SMzpVn9szFaOei4FBVkpUlRPRr14GXLMht3FkWuoUHa7S4EwkQoNtKFvng3mSJeYi/R
 GWOZWjvmyaM3OYwnHW26mB+fAPxACQzziiRI+wAtVEIlDEV2khvbyRTE5h4HbN6lOf+KYLe
 R5gY/Gh9KPEv1O88lZFUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9bvZY4asq6o=:8kKwgekt6qI/toeWd+zyGV
 LU6GEZeYHEIsg/YOCWZdpsiOMqKUos2YpAk8AZCoVs1x1W4KXxqitIkBBoe6gjtbBy3NZorxT
 IVgxXNs0EVe4SqhuJoQx0G7g4ZR6iku7PtfftpnkClA26xnEhdhLVxmhFvAISi/A/9DR4V6j2
 1g4FOLzxIIoVENahXLHnMoV5dcQgngFjBt2taig+Ud6mj1E8DkCZnodd5SaZannWmUd34ENXk
 +XyYi52JC+YjkvUi/iZFCUd3WUPKqU6ZTnXrkWJ9UPydkb8iq5jyj/BhwbkhT5A4uWsjsIZRY
 zR7jYU+kExcoe3Oir7l1AlLmM6T+la1FWeU51/vpuygg81FYAyx6G7MzetoaxIWp4PYr8Tz5q
 O4598sCZMnpBhq0jjspfhJO12lqdTYQbmguQXxiUNXlH40fvnMCpOrqNhS9s5gurUviWQ5XiY
 CYYXsy+PfQuJDG9lIWH4UzezEok+76vumA44WQvjQpwbqu2RPzVQ7D31a91zTQOsTiGyLigfG
 aK3VSOQqd0oQMZm9bOBH1Y=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 18.06.21 19:05, Matthias Kaehlcke wrote:

Hi,


Cc'ing to linux-usb ...

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

What exactly do you intent to archieve with this ?

X or !X = 1, isn't it ?

Why should something depend on something present or absent ?

Is that depends on ... statement necessary at all ?

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

It seems that Kconfig is confused by trying to enforce contradicting
dependencies.


Now for your driver:

If I understand it correctly, you've got a topology like this:


root hub -+--> 2ndary hub #0 -+--> usb-dev #0
          |                   \--> usb-dev #1
          |                     ..
          \--> 2ndary hub #1 -+--> usb-dev #3
                              \--> usb-dev #4


And in order to get usb-dev #foo running, you need the corresponding
hub on its path powered (which in turn is platform specific).

Correct ?

So, why not reflecting exactly this topology in the device tree ?
In that case, the power management *IMHO* could pretty automatically
(assuming you've implemented the corresponding pm functions on the
2ndary hub driver).

Okay, that could become a bit tricky when the usb-dev's are
automatically enumerated on the root hub and would need to be
reparented somehow ... @usb folks: it that possible ?

Another option could be implementing this as a regulator that the
individual usb devices will be attached to. Not completely semantically
correct (since a hub isn't exactly a regulator :o), but should at least
do the job: the regulator will be switched on when the device is used
and can be switched off when it isn't used anymore.

The cleanest approach, IMHO, might be adding an hub subsys, somewhat
similar to the existing phy subsys. I can imagine similar cases with
other interfaces, not just USB only, at least certainly not specific
to xhci.

Or could existing phy subsys already be sufficient for that ?


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
