Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1B9311D37
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 13:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhBFMzD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 07:55:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:60260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhBFMy4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 07:54:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E50F64E5B;
        Sat,  6 Feb 2021 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612616054;
        bh=7mM3qf/Pf0RM/LAimLxgXrYU+Dct+1fAROehbssm5wU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NFeR78ljqyz2p0DERMkXHgSYLLvMNm4/IfM9mU9aW5dIqTf6CHzwkAEYKHZsbqVv5
         ywX47/OLw9HHEdwhE/BmTWrSfIkhhyS9eVxfRfOwKww31uIfEYTbrPaxv49rR0Tu8Y
         qZy+iawEzRyjP7rn8E+j4mkJwvPE1+5LpsButzFA=
Date:   Sat, 6 Feb 2021 13:54:11 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org, stable@kernel.org
Subject: Re: [PATCH 3/3] kbuild: introduce KERNEL_VERSION2 and
 LINUX_VERSION_CODE2
Message-ID: <YB6Rc+VdLT+wGIR9@kroah.com>
References: <20210206035033.2036180-1-sashal@kernel.org>
 <20210206035033.2036180-3-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206035033.2036180-3-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 05, 2021 at 10:50:33PM -0500, Sasha Levin wrote:
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
> We can't however use the original KERNEL_VERSION and LINUX_VERSION_CODE
> as userspace has created ABI dependency on their structure, and we risk
> breaking this userspace by modifying the layout of the version integers.
> 
> Cc: stable@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Makefile                                       | 8 +++++++-
>  drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
>  drivers/usb/core/hcd.c                         | 4 ++--
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
>  include/linux/usb/composite.h                  | 4 ++--
>  kernel/sys.c                                   | 2 +-
>  tools/perf/tests/bpf-script-example.c          | 2 +-
>  tools/perf/tests/bpf-script-test-kbuild.c      | 2 +-
>  tools/perf/tests/bpf-script-test-prologue.c    | 2 +-
>  9 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 157be50c691e5..2177c548e4c24 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1266,7 +1266,13 @@ define filechk_version.h
>  		expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
>  	fi;                                                              \
>  	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
> -	((c) > 255 ? 255 : (c)))'
> +	((c) > 255 ? 255 : (c)))';                                       \
> +	echo \#define LINUX_VERSION_CODE2 $(shell                        \

Wait, no, who will use LINUX_VERSION_CODE2()?  Why export something like
this to userspace that no one is asking for?

> +	expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
> +	echo \#define LINUX_VERSION_MAJOR $(VERSION);                    \
> +	echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL);            \
> +	echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL);                \

These are good to have, and clean up kernel code.

thanks,

greg k-h
