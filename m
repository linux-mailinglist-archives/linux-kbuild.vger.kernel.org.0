Return-Path: <linux-kbuild+bounces-6210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10020A659B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 18:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59D1E168FF1
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Mar 2025 17:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9813F1A5BAB;
	Mon, 17 Mar 2025 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY6YvKpJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEEE186E2D;
	Mon, 17 Mar 2025 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742231277; cv=none; b=DdeQ3xH0pyqKA6OPolHtjVgTID9TEbkGdA9GaC1OtEix3Nk6WZpIqcFpaJeI1vm8F7eylCbUYiLcb5rg16XShEfJEWpYrDDthw+NxIXIR9DPJ2g487x0mPJ6IABFoKx0b99mmAaH97Vn+/Bl0boBQnD/kuG+PpTGhx4kWkMt5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742231277; c=relaxed/simple;
	bh=7cogRGtinGcNBp5bTBUGEzmjHt0hHwqKooY6PjLalzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHeOO2AHJ8We0R63Q84gRny42IqL6pAwr+UlJkNzJXhJxAHREgsuGwXo4Fh/TLNQiWqPyK26gD4864dDJNx2dztjzub+g8j0uoIn2rXKF+kXTsTt9sLS08wfLoBX/Lw7UvrCBc/DM4bTv5lmodNyMcZA8jfzfkzDzTzC2HN/Y/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY6YvKpJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F84C4CEE3;
	Mon, 17 Mar 2025 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742231276;
	bh=7cogRGtinGcNBp5bTBUGEzmjHt0hHwqKooY6PjLalzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aY6YvKpJWXNJo97CXn00Asd9GI7EXhlxfIX2v0jnhXFBXLsU9+wnweymDpyveDsB/
	 1WSmArwMFWF3GBl4NoyuPcMOvFOAvj2RzjL3sGht30ZnaeGdHEs7LnnqVw90xpK5PF
	 6cS6IRnyIXGgeIpiF5V6DUcULSfIUO7sxKDYghNkjirVbojDACF8gXJswTFJ/GEAOl
	 u1ZZ4uW/bio0wnDUrnzTWZo6ZkFIWZpVP6VqjJVxEUr5ZGOazNG7sX2OIJpWLcLheM
	 9AikyOjz+mPFJOe6MtauobVOWrQG5skgoJQ4KvlGtb9gU2gwk3oLphQwJlwKsazjud
	 HFRmW/ac7owww==
Date: Mon, 17 Mar 2025 10:07:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Heusel <christian@heusel.eu>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH] kbuild: pacman-pkg: hardcode module installation path
Message-ID: <20250317170752.GA830988@ax162>
References: <20250315151522.2766939-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315151522.2766939-1-masahiroy@kernel.org>

On Sun, Mar 16, 2025 at 12:15:20AM +0900, Masahiro Yamada wrote:
> 'make pacman-pkg' for architectures with device tree support (i.e., arm,
> arm64, etc.) shows logs like follows:
> 
>   Installing dtbs...
>     INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr//lib/modules/6.14.0-rc6+/dtb/actions/s700-cubieboard7.dtb
>     INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr//lib/modules/6.14.0-rc6+/dtb/actions/s900-bubblegum-96.dtb
>     INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr//lib/modules/6.14.0-rc6+/dtb/airoha/en7581-evb.dtb
>       ...
> 
> The double slashes ('//') between 'usr' and 'lib' are somewhat ugly.
> 
> Let's hardcode the module installation path because the package contents
> should remain unaffected even if ${MODLIB} is overridden. Please note that
> scripts/packages/{builddeb,kernel.spec} also hardcode the module
> installation path.
> 
> With this change, the log will look better, as follows:
> 
>   Installing dtbs...
>     INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr/lib/modules/6.14.0-rc6+/dtb/actions/s700-cubieboard7.dtb
>     INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr/lib/modules/6.14.0-rc6+/dtb/actions/s900-bubblegum-96.dtb
>     INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr/lib/modules/6.14.0-rc6+/dtb/airoha/en7581-evb.dtb
>       ...
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/package/PKGBUILD | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 0cf3a55b05e1..452374d63c24 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -53,7 +53,7 @@ build() {
>  _package() {
>  	pkgdesc="The ${pkgdesc} kernel and modules"
>  
> -	local modulesdir="${pkgdir}/usr/${MODLIB}"
> +	local modulesdir="${pkgdir}/usr/lib/modules/${KERNELRELEASE}"
>  
>  	_prologue
>  
> @@ -81,7 +81,7 @@ _package() {
>  _package-headers() {
>  	pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
>  
> -	local builddir="${pkgdir}/usr/${MODLIB}/build"
> +	local builddir="${pkgdir}/usr/lib/modules/${KERNELRELEASE}/build"
>  
>  	_prologue
>  
> @@ -114,7 +114,7 @@ _package-debug(){
>  	pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
>  
>  	local debugdir="${pkgdir}/usr/src/debug/${pkgbase}"
> -	local builddir="${pkgdir}/usr/${MODLIB}/build"
> +	local builddir="${pkgdir}/usr/lib/modules/${KERNELRELEASE}/build"
>  
>  	_prologue
>  
> -- 
> 2.43.0
> 

