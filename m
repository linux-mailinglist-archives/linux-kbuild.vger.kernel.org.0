Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7BD313D14
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 19:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbhBHSSf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 13:18:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:52654 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235572AbhBHSR4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 13:17:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABFF860232;
        Mon,  8 Feb 2021 18:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808236;
        bh=qsSUINw5d0ZIbqSO/YSUJD36GYqCRNUaAbAJxQ0z3w0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QJk0JGu/Y/A852FWTAXArleghZ1hdLOUpTtnAU5eEBvyHF3pkax7iYY9oy1imY5Qe
         YQAxA9xvdys7+6mw/6WIohjRsX7VkTtutGpvFEPmWuw/ETOKPjDu+s2o2SRf8tKlnX
         igB0n1GFalZwSSZRIqEl6Y6fJbkKMDrjAknWn0jqITAvyNdZ8ji7dQb2MhS9whDNg2
         RPXS2CQNK5wTlu30/hP6Z4leOzvD+yySHVbi2iQuegc2mO5iHMSYraEESE9tRDNJy0
         igDSofK4N3fHFKf2z+Nbo1J8Wy0e1WIa9v+anqO7b437I7Fac85/EhqH++0AvatxkG
         640CqT2fY4+4Q==
Date:   Mon, 8 Feb 2021 13:17:14 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
Message-ID: <20210208181714.GZ4035784@sasha-vm>
References: <CA+icZUW5=1sTpo5XinSrjD5_J6o0QmoR5RsPUcnQXxdhcZdv1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CA+icZUW5=1sTpo5XinSrjD5_J6o0QmoR5RsPUcnQXxdhcZdv1A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 08, 2021 at 04:28:00AM +0100, Sedat Dilek wrote:
>[ Please CC me directly ]
>
>Hi Sasha,
>
>I like that patch from [1].
>
>What was the Linux-source base?
>
>Searching in Linux v5.11-rc7:
>
>$ git grep -E 'LINUX_VERSION_CODE >> (16|8)'
>drivers/net/ethernet/mellanox/mlx5/core/main.c:
>(u8)((LINUX_VERSION_CODE >> 16) & 0xff), (u8)((LINUX_VERSION_CODE >>
>8) & 0xff),
>drivers/scsi/gdth.c:        osv.version = (u8)(LINUX_VERSION_CODE >> 16);
>drivers/scsi/gdth.c:        osv.subversion = (u8)(LINUX_VERSION_CODE >> 8);
>drivers/usb/core/hcd.c:#define KERNEL_REL
>bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
>drivers/usb/core/hcd.c:#define KERNEL_VER
>bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
>drivers/usb/gadget/udc/aspeed-vhub/hub.c:#define KERNEL_REL
>bin2bcd(((LINUX_VERSION_CODE >> 16) & 0x0ff))
>drivers/usb/gadget/udc/aspeed-vhub/hub.c:#define KERNEL_VER
>bin2bcd(((LINUX_VERSION_CODE >> 8) & 0x0ff))
>include/linux/usb/composite.h:  bcdDevice =
>bin2bcd((LINUX_VERSION_CODE >> 16 & 0xff)) << 8;
>include/linux/usb/composite.h:  bcdDevice |=
>bin2bcd((LINUX_VERSION_CODE >> 8 & 0xff));
>kernel/sys.c:           v = ((LINUX_VERSION_CODE >> 8) & 0xff) + 60;
>
>So, drivers/scsi/gdth.c file is missing in your list of file:

Right. It's on it's way out: 0653c358d2dc ("scsi: Drop gdth driver").

In theory I should have fixed it too, but given that this patch is
cosmetic I just wanted to avoid unnecessary conflicts for SFR... If it
doesn't end up being removed we can always fix it up there.

-- 
Thanks,
Sasha
