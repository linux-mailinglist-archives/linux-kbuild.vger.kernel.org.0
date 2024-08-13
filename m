Return-Path: <linux-kbuild+bounces-2967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E028950CB2
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 20:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE738B26697
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 18:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF301A3BD8;
	Tue, 13 Aug 2024 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGJaTSIY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298D1A38EC;
	Tue, 13 Aug 2024 18:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723575542; cv=none; b=s0BhcZNCD+ttebszvgvO9TmgBPZQpOyFje5q4OsuwOzcbxNnkkd53572N3vcX9M95cyqHyrcIRk7XLnGeUn7UzAJCi3fVJJLzlPG9y7FvtFKlVS7aZvUmr5dw5nFHnaJQrzGhgWqGtgJXsKGGyxXorbDsYwDpMr6qO/PN9PfRDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723575542; c=relaxed/simple;
	bh=u0e+IY76TSMq9RkpjNUT05BeEFxGmPaO4BRne1/LBms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XI1aCkvZ6QHY+cIuKHpcVf6//w8lLV4SVVX1SSDOhEjejIzz0rEfZnY8jbxv2hWBBwV7XTAgOQbpcx91mLiAGEPIZC4L4V4UC/fIYjex44y1aIUC9cFpQjwTsz448z/dV3ybnZ+V3qnbgRYL10lYgxl+Xe8hBzdtRh4ZGCYaTM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGJaTSIY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBDCC32782;
	Tue, 13 Aug 2024 18:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723575542;
	bh=u0e+IY76TSMq9RkpjNUT05BeEFxGmPaO4BRne1/LBms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGJaTSIYK3/PK/xB4rOOIpeDARz63w5H5K87yyH5UNbs2vkk5Q0/sQBz1xuU0N+V7
	 vBqZeoo0ttM8nkPJTAN82C82akx7F3R+TlxittIFGKNX15aiRuZvmF2l77ANqPOHeq
	 5aXloILxW/9hcW4pUU2rHfN8D4wxDoPiCy7b1PjNlP7jXhnvQqA1xJ5o1OAbj0lhPZ
	 +tc4nIHlQig5xQrX+zWg4g3zByIjXFkMpc6cSItUE2J9OeQqFKXWnO7CXEaQoqXyba
	 4OQKE+KoZWqoRu9SRZZYueTk8WuUk5cqJ8GUMThTGG0fbDhqTi/n8DlNfb3KL++lrL
	 zpp+DQuzfcFmQ==
Date: Tue, 13 Aug 2024 11:59:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <20240813185900.GA140556@thelio-3990X>
References: <20240813011619.13857-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813011619.13857-1-jose.fernandez@linux.dev>

On Mon, Aug 12, 2024 at 07:16:19PM -0600, Jose Fernandez wrote:
> Introduce the PACMAN_EXTRAPACKAGES variable in PKGBUILD to allow users
> to specify which additional packages are built by the pacman-pkg target.
> 
> Previously, the api-headers package was always included, and the headers
> package was included only if CONFIG_MODULES=y. With this change, both
> headers and api-headers packages are included by default. Users can now
> control this behavior by setting PACMAN_EXTRAPACKAGES to a
> space-separated list of desired extra packages or leaving it empty to
> exclude all.
> 
> For example, to build only the base package without extras:
> 
> make pacman-pkg PACMAN_EXTRAPACKAGES=""
> 
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> v1->v2:
> - Build all extra packages by default
> - Remove unnecessary lines
> v2->v3:
> - Move the default PACMAN_EXTRAPACKAGES value to PKGBUILD
> - Remove all changes done to Makefile.package
> - Conditionally run the install-extmod-build script if CONFIG_MODULES=y
> - Add explicit `mkdir -p "${builddir}"` prior to copying System.map and .config
> 
> This patch gives users control over which extra packages are built, addressing
> concerns about build time from adding a new debug package [1]. It allows
> selective inclusion of extra packages before introducing an optional debug
> package.
> 
> [1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990X/T/
> 
>  scripts/package/PKGBUILD | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 663ce300dd06..fbd7eb10a52c 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -3,10 +3,13 @@
>  # Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
>  
>  pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> -pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> -if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> -	pkgname+=("${pkgbase}-headers")
> -fi
> +pkgname=("${pkgbase}")
> +
> +_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers}
> +for pkg in $_extrapackages; do
> +	pkgname+=("${pkgbase}-${pkg}")
> +done
> +
>  pkgver="${KERNELRELEASE//-/_}"
>  # The PKGBUILD is evaluated multiple times.
>  # Running scripts/build-version from here would introduce inconsistencies.
> @@ -77,10 +80,13 @@ _package-headers() {
>  	cd "${objtree}"
>  	local builddir="${pkgdir}/usr/${MODLIB}/build"
>  
> -	echo "Installing build files..."
> -	"${srctree}/scripts/package/install-extmod-build" "${builddir}"
> +	if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> +		echo "Installing build files..."
> +		"${srctree}/scripts/package/install-extmod-build" "${builddir}"
> +	fi
>  
>  	echo "Installing System.map and config..."
> +	mkdir -p "${builddir}"
>  	cp System.map "${builddir}/System.map"
>  	cp .config "${builddir}/.config"
>  
> 
> base-commit: 7809144639f6c92bcb11bd3284b7806a42cc67fe
> -- 
> 2.46.0
> 

