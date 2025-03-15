Return-Path: <linux-kbuild+bounces-6178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D2A62EF9
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 16:20:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A1593BD18C
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 15:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFFD1DF994;
	Sat, 15 Mar 2025 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XljJRAP4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AE517995E;
	Sat, 15 Mar 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052012; cv=none; b=EzJYA/+vHdaTNJZLSt4UMxwSzhvnic01pQtXmu0sDRQu7vo3j+65qjG6Zuqm1Ev9m0Pc4YpLK3XB5JPldiAyfeACWsXUURjM20CZ+/KRngy78IcbLT1jHVz416hikftxNZwTnKyuYHHwCoZhgWdtoPWH84RY5+rVlcFHVfYzzNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052012; c=relaxed/simple;
	bh=BLyaZUHseqZRKVrYZFgpsHIaBAuyrPcaGkIm0az2Pfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QcGN8jf86YrtVAImukaP3rxJCKfyHZkXkB1EMcjpBmPhep8Dxjxm0jGHnRsuFEpuoc8o3vf+C7mzkSD2fl3sebl7PG0H8SCcvrAL7aG0OsUULFTkQTYNUCAr9HZcHrkj4PqAobMmA+pFNNa7MNi0ZsjgEIO+ZaMrjiX77blusyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XljJRAP4; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1742052007;
	bh=BLyaZUHseqZRKVrYZFgpsHIaBAuyrPcaGkIm0az2Pfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XljJRAP47ZCovRdeQRQACh8MrqcP1vXA5w1A40LOg/j0KHCxGuSH4H+9b0IorhTpy
	 nnaiTCINCl3K8kNnSvueijsluH0bwI0LzGJNT2xAZ4yiENz/vy7blkbCO3lcb2T/25
	 86U0p6pbicEvQXDg62esKEcQITbRx/hcn7UMpIic=
Date: Sat, 15 Mar 2025 16:20:06 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: pacman-pkg: hardcode module installation path
Message-ID: <82730f15-67af-4425-9320-13e8fa286159@t-8ch.de>
References: <20250315151522.2766939-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315151522.2766939-1-masahiroy@kernel.org>

On 2025-03-16 00:15:20+0900, Masahiro Yamada wrote:
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

Thanks!

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

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

