Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C433A1633
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jun 2021 15:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbhFIN5s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Jun 2021 09:57:48 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:39980 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236898AbhFIN5r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Jun 2021 09:57:47 -0400
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 159DtXZJ012079;
        Wed, 9 Jun 2021 22:55:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 159DtXZJ012079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1623246936;
        bh=hcr+Eu7cFxCqa4ADxNq7akOPtlDexVyc+1o3NpX/RWk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jvFWkPSptMfJTrrkoeGd30Rren9o4EvU5Fc+6JP/Ylx1OL7VnGZ32aWNt++QK7qc6
         aUw+FOCCBkgjnOvlcLIqYbsUZIgSzh8r2hN74mkTj7xwSQ2jX0gOhCnlkuNhnvZnCD
         6jhnICuVlV1Nm65TFycloc9hwAsn8FM74OtyQkdm0kNli6GlIEI2BCGUyKO0RyDpih
         YQ433ZPcwXbB6zdPYv2pcOYlGfCox56hOXW4ocPcKNCP6i9WdwQ41GwP1sWttPj51+
         AsHz/3satssGfMLy0ijEyalQ/CzxwvkcfzlLbZ6I+/2I81cZUC+L4Zv+421dCK4rag
         shfyaIUtop84A==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id o9so16697526pgd.2;
        Wed, 09 Jun 2021 06:55:35 -0700 (PDT)
X-Gm-Message-State: AOAM532uNIlIuu0VAcJR7mlhkNGPQzLDIw4nR+9VqQLgf3XcC8oxo4Vy
        yLv8TfjIQ68GKY2XsApE7Nl2J76x5IsWNxHHpcQ=
X-Google-Smtp-Source: ABdhPJxxsiDDGnMiEXR9YbCZEl42/5e351UXFxCRbhTOvbkPUPqmTgbPDyunkL0JkaGGSxpa4JEWwB9yRtSxAn+69Uk=
X-Received: by 2002:a63:6841:: with SMTP id d62mr3995000pgc.7.1623246931360;
 Wed, 09 Jun 2021 06:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2106091033070.5695@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2106091033070.5695@hadrien>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 9 Jun 2021 22:54:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFuRk7zeuPec4F2S2C_0y4FcgPhev8A9xixC9O38--DQ@mail.gmail.com>
Message-ID: <CAK7LNATFuRk7zeuPec4F2S2C_0y4FcgPhev8A9xixC9O38--DQ@mail.gmail.com>
Subject: Re: Makefile: make modules install output
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 9, 2021 at 7:16 PM Julia Lawall <julia.lawall@inria.fr> wrote:
>
> make modules install used to end up with something like
>
>   INSTALL sound/usb/usx2y/snd-usb-usx2y.ko
>   INSTALL sound/x86/snd-hdmi-lpe-audio.ko
>   INSTALL sound/xen/snd_xen_front.ko
>   INSTALL virt/lib/irqbypass.ko
>   DEPMOD  5.12.0-rc2myfix-00015-gc6f886546cb8
>
> From v5.13-rc1, it gives:
>
>   STRIP   /lib/modules/5.13.0-rc1myfix/kernel/fs/btrfs/btrfs.ko
>   STRIP   /lib/modules/5.13.0-rc1myfix/kernel/fs/xfs/xfs.ko
>   STRIP   /lib/modules/5.13.0-rc1myfix/kernel/net/mac80211/mac80211.ko
>   STRIP   /lib/modules/5.13.0-rc1myfix/kernel/drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko
>   STRIP   /lib/modules/5.13.0-rc1myfix/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
>   DEPMOD  /lib/modules/5.13.0-rc1myfix
>
> Is the full path name considered to be an improvement?

I think so.
It is clear where the files are being installed to.

Another motivation was rather to make it aligned with the convention.

Kbuild log convention is this form:

  [ACTION]   [DESTINATION]


For example, when Kbuild is building kernel/foo.c
into kernel/foo.o

  CC      kernel/foo.o

is shown.


In this case, Kbuild is installing kernel/fs/btrfs/btrfs.ko
to /lib/modules/5.13.0-rc1myfix/kernel/fs/btrfs/btrfs.ko

So, I think it is more consistent to show the destination
rather than the source.




> For the names of
> the modules, it doesn't much matter, but the DEPMOD line was a convenient
> way to get the full kernel name for subsequent rebooting.
>
> thanks,
> julia



-- 
Best Regards
Masahiro Yamada
