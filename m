Return-Path: <linux-kbuild+bounces-3053-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62295522B
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 23:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D36C1C21628
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 21:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E3B75817;
	Fri, 16 Aug 2024 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhbPqNzZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9016BB39;
	Fri, 16 Aug 2024 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723842015; cv=none; b=irQ8tFWIlerpsWnydolqHe0kMqZhjFhSpViRMv8K8j7Fz1UQBasFykXu4KH54R3+5U5F+8IM0jx9cFX5oOyhvg4cNrYXXwwWBvLbx6VXXlS6tQXh4/CaMbvXtPqnLTiThEmMnf65mydj9feYdAtD8mQcWu4iPWqtJr9agcLP0cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723842015; c=relaxed/simple;
	bh=ze9RuKlloztfH30hjiWNZ17Y8Wic2CNG135cUm76z1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKqusIshrRl7jsvfw0ibE6w8OSm/0FZOKOsECSpabEH2ofphJu0vPg/Ov/93+XDEXPxObJ41Fx129H1JaeRWZgHI4/1+2eMFKDiSRESnScKk1P9WtMXvsxnjJSR9IEzWAPrYPo4L1WObbNwHrAlntsdm2FWsly7MVCSXdxYWKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhbPqNzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9531EC32782;
	Fri, 16 Aug 2024 21:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723842015;
	bh=ze9RuKlloztfH30hjiWNZ17Y8Wic2CNG135cUm76z1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhbPqNzZksShjHclp0eNuMnvUzs2vRUXWTXAVAEfnaQND0y+STUkWJQaEmazRk2Cz
	 vOvbyzQeHtQpXTn9iPESRaBvs2QZrLPcypnKTxtLTZgJaUji7+ECBfxPxULlnH6xGT
	 c5AVvHy6Y8bf4QS++2U3wR82XSc+KAF8OZIC+E4/qQZDaN0QvCSusrcDyMYaxy/H0c
	 Vxyoyc7Yld2kU0QujvBr1KmvHtvvXcDYJI7VtIAAvGUM4UKckwl34brG/empUlzVn4
	 t750H9o1pzmXLsQpXzz9wmz/k2rL/iVZODGfmBs6ud+DASLk//zWnS3G7wg8Hhus9u
	 B6EyYETdEHG3Q==
Date: Fri, 16 Aug 2024 14:00:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Heusel <christian@heusel.eu>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 1/2] kbuild: pacman-pkg: move common commands to a
 separate function
Message-ID: <20240816210012.GC3870443@thelio-3990X>
References: <20240816141844.1217356-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816141844.1217356-1-masahiroy@kernel.org>

On Fri, Aug 16, 2024 at 11:18:14PM +0900, Masahiro Yamada wrote:
> All build and package functions share the following commands:
> 
>   export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
>   cd "${objtree}"
> 
> Factor out the common code.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/package/PKGBUILD | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index fbd7eb10a52c..e2d9c2601ca9 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -36,11 +36,15 @@ makedepends=(
>  )
>  options=(!debug !strip !buildflags !makeflags)
>  
> -build() {
> +_prologue() {
>  	# MAKEFLAGS from makepkg.conf override the ones inherited from kbuild.
>  	# Bypass this override with a custom variable.
>  	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
>  	cd "${objtree}"
> +}
> +
> +build() {
> +	_prologue
>  
>  	${MAKE} KERNELRELEASE="${KERNELRELEASE}" KBUILD_BUILD_VERSION="${pkgrel}"
>  }
> @@ -48,10 +52,10 @@ build() {
>  _package() {
>  	pkgdesc="The ${pkgdesc} kernel and modules"
>  
> -	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> -	cd "${objtree}"
>  	local modulesdir="${pkgdir}/usr/${MODLIB}"
>  
> +	_prologue
> +
>  	echo "Installing boot image..."
>  	# systemd expects to find the kernel here to allow hibernation
>  	# https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
> @@ -76,10 +80,10 @@ _package() {
>  _package-headers() {
>  	pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
>  
> -	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> -	cd "${objtree}"
>  	local builddir="${pkgdir}/usr/${MODLIB}/build"
>  
> +	_prologue
> +
>  	if grep -q CONFIG_MODULES=y include/config/auto.conf; then
>  		echo "Installing build files..."
>  		"${srctree}/scripts/package/install-extmod-build" "${builddir}"
> @@ -100,8 +104,7 @@ _package-api-headers() {
>  	provides=(linux-api-headers)
>  	conflicts=(linux-api-headers)
>  
> -	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> -	cd "${objtree}"
> +	_prologue
>  
>  	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
>  }
> -- 
> 2.43.0
> 

