Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77DE2312B33
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 08:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbhBHHkx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 02:40:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:34484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229608AbhBHHkw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 02:40:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95A2164E7A;
        Mon,  8 Feb 2021 07:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612770011;
        bh=jJWiCMP4AV6jIa0eJY/ryaYaLxoOo7FnESwudB3mVTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J02fVcQkD20Dobzo/of33zWeeD2Bkz/ZM9I/oZSJ70bhycCtlx6/hZNbrLI5mwKLW
         v+pLiMqVvcFXnVH1/a88AV/zaLCXLrMgdM+0gQ5b10P/8tTGmqRmvKwTSmq2solPJG
         ucKjkC5DeFnhTRjiIA5k048gbR10YrxfO/nUkAtM=
Date:   Mon, 8 Feb 2021 08:40:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
Message-ID: <YCDq1yJbE52GxrG7@kroah.com>
References: <20210207161352.2044572-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210207161352.2044572-1-sashal@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 07, 2021 at 11:13:52AM -0500, Sasha Levin wrote:
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

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
