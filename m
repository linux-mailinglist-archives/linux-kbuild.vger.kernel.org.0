Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1EAC31A9E4
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Feb 2021 05:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhBMEmy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Feb 2021 23:42:54 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:53439 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhBMEmx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 23:42:53 -0500
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11D4fXON003851;
        Sat, 13 Feb 2021 13:41:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11D4fXON003851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613191294;
        bh=VtwzTs7t+yMIoTEyh6Ci+xZr/ph8zDWPG+WEC8xBy3U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=08hJff096gJ1QloTX3xJTuTm84m2BHZzepggAD9CQmbF/8pYZTonUkM+uwWCeW6b6
         5U6HPDO4WGz4/lnvwPsC3s0Yii6HeLuQqRVyauLANRFiUrqhTlCbjtJcokaTJRHH5v
         GC/+X3eQbdl+idgBDNtNuSPcfIof952+Ljqe4uWmKjsffY5HTzlzR5iKhACFBoSLqr
         k0EznIKcOQJiibNjqOHSQoeJjrxHmGfXhNRzkAdyVK0cduVcPRXA33heIkVL82G9F5
         RNVpNlLGZEvvBQlS6TFMI6sNowTWgW1rvt1g7/xh9xsVNHPA/BNgsV3E4tLEv/pHul
         uvE0rsLiYaQog==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id my11so1087482pjb.1;
        Fri, 12 Feb 2021 20:41:33 -0800 (PST)
X-Gm-Message-State: AOAM530WgR89OwoBkJvxdfvvzMoKIQeYTXr7A5HiCmDjuoLoZryNEFl8
        T9G+lRaySCgxaRfMwF5AwAoeMk1IfLhnHxPvmhs=
X-Google-Smtp-Source: ABdhPJzyYF/q+0I82mHrNqBdW/9veWQ/SloqeavOVWSS6qD21FRc7ApcWXMpu4R/UkndY2hOktTsy9Vl6Garz9KHzAc=
X-Received: by 2002:a17:90b:1b50:: with SMTP id nv16mr5488947pjb.153.1613191292991;
 Fri, 12 Feb 2021 20:41:32 -0800 (PST)
MIME-Version: 1.0
References: <20210212162924.2269887-1-sashal@kernel.org>
In-Reply-To: <20210212162924.2269887-1-sashal@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 13 Feb 2021 13:40:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKhxeV-41zENk7aBSmZDBZhAxDoN=SOH4yAgyrSjjVdA@mail.gmail.com>
Message-ID: <CAK7LNARKhxeV-41zENk7aBSmZDBZhAxDoN=SOH4yAgyrSjjVdA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: simplify access to the kernel's version
To:     Sasha Levin <sashal@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 13, 2021 at 1:29 AM Sasha Levin <sashal@kernel.org> wrote:
>
> Instead of storing the version in a single integer and having various
> kernel (and userspace) code how it's constructed, export individual
> (major, patchlevel, sublevel) components and simplify kernel code that
> uses it.
>
> This should also make it easier on userspace.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Makefile                                       | 5 ++++-
>  drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
>  drivers/usb/core/hcd.c                         | 4 ++--
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
>  include/linux/usb/composite.h                  | 4 ++--
>  kernel/sys.c                                   | 2 +-
>  6 files changed, 13 insertions(+), 10 deletions(-)




Applied to linux-kbuild. Thanks.





> diff --git a/Makefile b/Makefile
> index 12607d3891487..1fdd44fe16590 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1255,7 +1255,10 @@ define filechk_version.h
>                 expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
>         fi;                                                              \
>         echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
> -       ((c) > 255 ? 255 : (c)))'
> +       ((c) > 255 ? 255 : (c)))';                                       \
> +       echo \#define LINUX_VERSION_MAJOR $(VERSION);                    \
> +       echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL);            \
> +       echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)
>  endef
>
>  $(version_h): FORCE
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> index ca6f2fc39ea0a..29f886263dc52 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
> @@ -235,8 +235,8 @@ static void mlx5_set_driver_version(struct mlx5_core_dev *dev)
>         remaining_size = max_t(int, 0, driver_ver_sz - strlen(string));
>
>         snprintf(string + strlen(string), remaining_size, "%u.%u.%u",
> -                (u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >> 8) & 0xff),
> -                (u16)(LINUX_VERSION_CODE & 0xffff));
> +               LINUX_VERSION_MAJOR, LINUX_VERSION_PATCHLEVEL,
> +               LINUX_VERSION_SUBLEVEL);
>
>         /*Send the command*/
>         MLX5_SET(set_driver_version_in, in, opcode,
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index ad5a0f405a75c..3f0381344221e 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -111,8 +111,8 @@ DECLARE_WAIT_QUEUE_HEAD(usb_kill_urb_queue);
>   */
>
>  /*-------------------------------------------------------------------------*/
> -#define KERNEL_REL     bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
> -#define KERNEL_VER     bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
> +#define KERNEL_REL     bin2bcd(LINUX_VERSION_MAJOR)
> +#define KERNEL_VER     bin2bcd(LINUX_VERSION_PATCHLEVEL)
>
>  /* usb 3.1 root hub device descriptor */
>  static const u8 usb31_rh_dev_descriptor[18] = {
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> index bfd8e77788e29..5c7dea5e0ff16 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> @@ -46,8 +46,8 @@
>   *    - Make vid/did overridable
>   *    - make it look like usb1 if usb1 mode forced
>   */
> -#define KERNEL_REL     bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
> -#define KERNEL_VER     bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
> +#define KERNEL_REL     bin2bcd(LINUX_VERSION_MAJOR)
> +#define KERNEL_VER     bin2bcd(LINUX_VERSION_PATCHLEVEL)
>
>  enum {
>         AST_VHUB_STR_INDEX_MAX = 4,
> diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
> index a2d229ab63ba5..7531ce7233747 100644
> --- a/include/linux/usb/composite.h
> +++ b/include/linux/usb/composite.h
> @@ -573,8 +573,8 @@ static inline u16 get_default_bcdDevice(void)
>  {
>         u16 bcdDevice;
>
> -       bcdDevice = bin2bcd((LINUX_VERSION_CODE >> 16 & 0xff)) << 8;
> -       bcdDevice |= bin2bcd((LINUX_VERSION_CODE >> 8 & 0xff));
> +       bcdDevice = bin2bcd(LINUX_VERSION_MAJOR) << 8;
> +       bcdDevice |= bin2bcd(LINUX_VERSION_PATCHLEVEL);
>         return bcdDevice;
>  }
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 51f00fe20e4d1..c2225bd405d58 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -1243,7 +1243,7 @@ static int override_release(char __user *release, size_t len)
>                                 break;
>                         rest++;
>                 }
> -               v = ((LINUX_VERSION_CODE >> 8) & 0xff) + 60;
> +               v = LINUX_VERSION_PATCHLEVEL + 60;
>                 copy = clamp_t(size_t, len, 1, sizeof(buf));
>                 copy = scnprintf(buf, copy, "2.6.%u%s", v, rest);
>                 ret = copy_to_user(release, buf, copy + 1);
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
