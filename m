Return-Path: <linux-kbuild+bounces-3070-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7989A9558D0
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 17:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 377E41F21221
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 15:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706C3154429;
	Sat, 17 Aug 2024 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mUubDfZ6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3851537D9;
	Sat, 17 Aug 2024 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723910109; cv=none; b=O0W1ij55G1W79skFY27FSF3VMeHAAItNeC156LApXHddP94G21YtoKYA6ZcUUDmT8U6OUM52MEZc3fFh/r1cz1pxtgcRGxu/WdNoaXoz6nvYPUGRw+u5SOQUnW5kQiEQ/SCGR/DXthCF1GM+hT23k96gSd6RgC6VPdkedUCyJ+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723910109; c=relaxed/simple;
	bh=Pv2kmBCJrCf1bGsREJrDB6o6cv0JyZD/VQoKxKxLPug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR27pxrXp0CTr4rMJ6+zT0Fm+SzTrVy/A3S7rjppX3v1rgfopHlFgddG7LAFfF4dHWsFs1BVA6VVSf5gUg1R6BGeVf4ruq1yFCqTCEiAxCOhdhBxPOt1lvrqv+37VpAA/dWPKSlzVUqipZJpjh1J0S+dtw6lNnGwcKId4FauI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mUubDfZ6; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iPts1Rj7m/aa9fAx0luy8RGZYF61tp2ZWT085zcOXdU=; b=mUubDfZ6Di8mQoT/gvSeqZOrfh
	K8Qmz/+a+vbYEZpKsA1KQylfAY4PkGQmd0EgJ8naFGsa6TamCHVYA1CtC+MvmGdIEa6obT1yTJvoW
	bxcESlb5gYEuHVOXfUCEe4dFWXitQACorlt6+S3XYiUFmvw+36bqHtWBwyhixO6YiQqA0yejxC/yd
	qh4mOnxT8h81Kb2RI+oddVw2F3wVsLg0uYMWx+FX8AfZex0OubaKSyY2UV2IcGLQKustA3qgoAtEl
	x8vw+FSXx49HUu+WjK+wgEu4Fn/qk7DH2M0EhaIXbqZpLHetsJ/MdejvzFlHh/aNAtYn97s4T0WVp
	G73Zy4SA==;
Received: from [2001:9e8:9db:8201:3235:adff:fed0:37e6] (port=45034 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sfLlY-00E1zW-Pc;
	Sat, 17 Aug 2024 17:54:56 +0200
Date: Sat, 17 Aug 2024 17:54:51 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add debug package to pacman PKGBUILD
Message-ID: <20240817-brave-labrador-from-eldorado-e929a8@lindesnes>
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

On Sat, Aug 17, 2024 at 09:11:47AM -0600, Jose Fernandez wrote:
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
> +	mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> +	install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> +}
> +

If you like to also include debug stuff for kernel modules, you might
want to have a look at scripts/package/builddeb's install_linux_image_dbg.

Kind regards,
Nicolas

