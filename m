Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E522FAAFE
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 21:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388241AbhARKod (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 05:44:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:53614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388619AbhARJWF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 04:22:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91C6420829;
        Mon, 18 Jan 2021 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610961679;
        bh=AxtaIOUwBp1fZah3fw/1D/bRwjy4Z75UqBrLW6p6+jM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lUhQKJpuAihyaw+dsZ8nY8IuZKHyajh3Ytr7xKz4+BS0AIo30T9RnsFFp8m4jwpy2
         NIedQU5z9cEkRIhYo/5bMeziWqCmV66FbWGxAidMUpkpmcsrKC3UXZ2ihQmXNMvzwp
         UgXh0tNhpg+HabzEnCHoVAsi8pLtMN6c69GFy6TM=
Date:   Mon, 18 Jan 2021 10:21:16 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
Message-ID: <YAVTDETPaJuaRPfc@kroah.com>
References: <20210118014951.250815-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118014951.250815-1-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jan 17, 2021 at 08:49:51PM -0500, Sasha Levin wrote:
> SUBLEVEL only has 8 bits of space, which means that we'll overflow it
> once it reaches 256.
> 
> Few of the stable branches will imminently overflow SUBLEVEL while
> there's no risk of overflowing VERSION.
> 
> Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
> should create a better balance between the different version numbers we
> use.
> 
> The downside here is that Linus will have 8 bits less to play with, but
> given our current release cadence (~10 weeks), the number of Linus's
> fingers & toes (20), and the current VERSION (5) we can calculate that
> VERSION will overflow in just over 1,000 years, so I'm kicking this can
> down the road.
> 
> Cc: stable@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 9e73f82e0d863..dc2bad7a440d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1252,8 +1252,8 @@ endef
>  
>  define filechk_version.h
>  	echo \#define LINUX_VERSION_CODE $(shell                         \
> -	expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> -	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
> +	expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
> +	echo '#define KERNEL_VERSION(a,b,c) (((a) << 24) + ((b) << 16) + (c))'

As much as I agree, this will break in-tree users of LINUX_VERSION_CODE
that try to suck out the version/patchlevel number of the kernel release
into their own fields.  Things like USB host controller strings, v4l
ioctl reports, scsi driver ioctls, and other places do fun bit-movements
to try to unreverse this bit packing.

So how about we just provide a "real" version/subversion/revision
#define as well, and clean up all in-kernel users, so we can get this to
work, and we can change it in the future more easily.

thanks,

greg k-h
