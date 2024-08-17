Return-Path: <linux-kbuild+bounces-3072-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E57BB955925
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 19:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E7A1F21694
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 17:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D31ECA6B;
	Sat, 17 Aug 2024 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GBi6BlGQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3B4C121;
	Sat, 17 Aug 2024 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723914942; cv=none; b=PfMiShv5KCCjEtiCHcEMaSXRG9EByTSaEkQUr9dlzz+BWLfQAXRI9XV3+x/qbjT7Ccl5AhqGBo/zrEzxtuc8j6SmsNT2p5hljdk/mE9UbA2rStTRhrj5FwnAuQwI4Q8p7vHeTCED3xr5/hgsn92ZJt8Q5eLMJtK1aKB3SgftfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723914942; c=relaxed/simple;
	bh=FExCVIou6Bpaxp4k5WRqM9LyIa/mTp2pjEBC0C4AsKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dI19XajxY95WPIY0ijS2FWphfMSE7LZmCrSeZfbyPF/t8tSfMRXQ9271Fzonz0eQrtL739e5qVNHIs3ltByw7Ud6cpHgMDQUiPPb99yuPHwUBgOEJpQfAhWpRFM3pb1s6/uOo+/fN1oeSq8KRwhGK83WA9a4gyMHr3A1HI8wJDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GBi6BlGQ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723914934;
	bh=FExCVIou6Bpaxp4k5WRqM9LyIa/mTp2pjEBC0C4AsKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBi6BlGQIYKgihgfmLbIbLQ4y9E/5qGLwI4QyObhj+5oelIa4xjeMncvKcsK/PMCY
	 fmKuVCl5HUbnw3NThrD1SRdlLVYk+2iX0TLriBaIGMPun+aWT7kvr8o9WsR190Xqsb
	 eMvDMXKNp/hojLtbU6nH4s0CYgNsUdPM/l9jdCjo=
Date: Sat, 17 Aug 2024 19:15:33 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Christian Heusel <christian@heusel.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add debug package to pacman PKGBUILD
Message-ID: <0dbfa069-a931-416d-ac1f-e9ceaee96b80@t-8ch.de>
References: <20240817151147.156479-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817151147.156479-1-jose.fernandez@linux.dev>

On 2024-08-17 09:11:47+0000, Jose Fernandez wrote:
> Add a new debug package to the PKGBUILD for the pacman-pkg target. The
> debug package includes the non-stripped vmlinux file, providing access
> to debug symbols needed for kernel debugging and profiling. The vmlinux
> file will be installed to /usr/src/debug/${pkgbase}. The debug package
> will be built by default and can be excluded by overriding PACMAN_EXTRAPACKAGES.
> 
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> ---
> v1->v2:
> - Use the new PACMAN_EXTRAPACKAGES [1] variable to allow users to disable the
> debug package if desired, instead of always including it.
> 
> [1] https://lore.kernel.org/lkml/20240813185900.GA140556@thelio-3990X/T/
> 
>  scripts/package/PKGBUILD | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index fbd7eb10a52c..d40d282353de 100644
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
> @@ -106,6 +106,15 @@ _package-api-headers() {
>  	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
>  }
>  
> +_package-debug(){
> +	pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
> +	depends=(${pkgbase}-headers)
> +
> +	cd "${objtree}"

This should make use of _prologue() from 
"kbuild: pacman-pkg: move common commands to a separate function"

https://lore.kernel.org/lkml/20240816141844.1217356-1-masahiroy@kernel.org/

It's not yet part of the kbuild tree, but I guess will be soon.

> +	mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"

The mkdir shouldn't be necessary, as install -D is used.

> +	install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux

Can you also add a symlink to /usr/lib/modules/$(uname -r)/build/vmlinux
for compatibility with the vanilla package?

> +}
> +
>  for _p in "${pkgname[@]}"; do
>  	eval "package_$_p() {
>  		$(declare -f "_package${_p#$pkgbase}")
> 
> base-commit: 869679673d3bbaaf1c2a43dba53930f5241e1d30
> -- 
> 2.46.0
> 

