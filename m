Return-Path: <linux-kbuild+bounces-3284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DF0964289
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 13:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C17451F22963
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 11:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A6619049B;
	Thu, 29 Aug 2024 11:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Ll0+hVF2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83847647;
	Thu, 29 Aug 2024 11:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929424; cv=none; b=QaI3b5e05J7AgKPCmAUoRrG3eDVHFFyLQnVHZ6IWj1TGm3jStp0V2UtdEw0OdB2je+k0DDX5Kcm5SqWvgpqibz4NT6PGFa0n8qgzDRQksRfCKXJOPd9UxhiLGp26Kjk5YLz5A3Ul5o+1iYymlNVyudT/qPgsWQAgNuBGaE9hjrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929424; c=relaxed/simple;
	bh=cMMmqrOPuJixgn6uYhJgA7YIfMsfKtFXFvMsFxMdAQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIq6mbMMSowBZm9g8sB9B88oJe44iqKCwQubzSe4TiGSu1n5f5ETDruoihB5vRgjGoAJKxD7io2Fo0dxrErpZnKuOzaHvVsfK2GDrIroFDX/x5D/OfSAHgJl2hYRSUdF0OmyDZWOsidFFlqg2Fe7UkMCdF+w9lExyOeqjdlzKDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Ll0+hVF2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724929418;
	bh=cMMmqrOPuJixgn6uYhJgA7YIfMsfKtFXFvMsFxMdAQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ll0+hVF2qwnAW8cafLp4b0o0ZcuN1r4LXG7OMreX2rtwOJBXYy9U+jGf/GM3h+Tlp
	 Ssy8jZdhpCvL5jOAWgNds7L7ZZhC7zJWbOYU9+Q0R5zTAVmkvTXIohSt4PRyrRzPVl
	 5OYKuwt3XMbuoCTORs0J76dzUrli0PrX9YQE5psU=
Date: Thu, 29 Aug 2024 13:03:38 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Christian Heusel <christian@heusel.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: add debug package to pacman PKGBUILD
Message-ID: <5f02a2e0-342d-472c-8a13-dc369391492d@t-8ch.de>
References: <20240824220756.73091-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240824220756.73091-1-jose.fernandez@linux.dev>

On 2024-08-24 16:07:56+0000, Jose Fernandez wrote:
> Add a new debug package to the PKGBUILD for the pacman-pkg target. The
> debug package includes the non-stripped vmlinux file with debug symbols
> for kernel debugging and profiling. The file is installed at
> /usr/src/debug/${pkgbase}, with a symbolic link at
> /usr/lib/modules/$(uname -r)/build/vmlinux. The debug package is built
> by default.
> 
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks!

> ---
> v2->v3:
> - Remove unnecessary mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> - Use the new _prologue() function [1]
> - Add symbolic link to /usr/lib/modules/$(uname -r)/build/vmlinux
> - Remove the dependency on the headers package
> v1->v2:
> - Use the new PACMAN_EXTRAPACKAGES [2] variable to allow users to disable the
> debug package if desired, instead of always including it.
> 
> [1] https://lore.kernel.org/lkml/20240816141844.1217356-1-masahiroy@kernel.org/
> [2] https://lore.kernel.org/lkml/20240813185900.GA140556@thelio-3990X/T/
> 
>  scripts/package/PKGBUILD | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 839cd5e634d2..f83493838cf9 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -5,7 +5,7 @@
>  pkgbase=${PACMAN_PKGBASE:-linux-upstream}
>  pkgname=("${pkgbase}")
>  
> -_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers}
> +_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers debug}
>  for pkg in $_extrapackages; do
>  	pkgname+=("${pkgbase}-${pkg}")
>  done
> @@ -111,6 +111,19 @@ _package-api-headers() {
>  	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
>  }
>  
> +_package-debug(){
> +	pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> +
> +	local debugdir="${pkgdir}/usr/src/debug/${pkgbase}"
> +	local builddir="${pkgdir}/usr/${MODLIB}/build"
> +
> +	_prologue
> +
> +	install -Dt "${debugdir}" -m644 vmlinux
> +	mkdir -p "${builddir}"
> +	ln -sr "${debugdir}/vmlinux" "${builddir}/vmlinux"
> +}
> +
>  for _p in "${pkgname[@]}"; do
>  	eval "package_$_p() {
>  		$(declare -f "_package${_p#$pkgbase}")
> 
> base-commit: df829331cf5cccb2a1fdd7560eabfcec49f9b990
> -- 
> 2.46.0
> 

