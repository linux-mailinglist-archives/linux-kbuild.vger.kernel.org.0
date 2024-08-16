Return-Path: <linux-kbuild+bounces-3054-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B875E95522D
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 23:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 619C41F22948
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 21:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E14975817;
	Fri, 16 Aug 2024 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mig1kES+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40F55893;
	Fri, 16 Aug 2024 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723842048; cv=none; b=qg+H9xvuWXGbPbx7ZKI5WYnNv81XxpnXkN9+ipxAENUSTC30xAPPTw5UsJtU/MSmB0lwu/VNRIfgGA1b2Wmr87RSOUTVGpPCHk9E71RS7xTrpy1c5yjqkItZdIN9p7M+aN5Bv2/oWU31OR110aWjjHmI8Mi5QQkr2fEVrMeuih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723842048; c=relaxed/simple;
	bh=fIStajP15lLR6F/+mRoFY5G6QrhrOR43neKxIyRLR+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0q2YqYVKTF2OaxkN5DDiW/nPrRHiWCi5xt+eOvUmJ0TBe3Nr3wLFWI2kNY58ggdOc15FYwjKdDMyABBWx5dxbeOeHD6lrGf1c3P3ei6/UFxvUTIhI3OpbVbVJqBHtRcLVY+M7PiP0x3s5P7Sa8nxFO/7Yb5TosF4BOaJPMYdGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mig1kES+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63472C32782;
	Fri, 16 Aug 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723842047;
	bh=fIStajP15lLR6F/+mRoFY5G6QrhrOR43neKxIyRLR+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mig1kES+H3F/9M2uLJXvJdvaS6Xp0iPRa2pnla/YDqvELq1el0Co/hhVoS3LyOZlL
	 IkbGvhF3SCk2x2qrdUFPPNPggBM1JGvZN2wZ6RVMSRI2nvzugFSPyr3Xny1D0xRv/Y
	 BuvaQv1fHaSPn04GERfeg60lwCsmDzOTTbqlQrj928ocU1IedV6NwD6DqS7A9KwYTO
	 qv6x0Zygc98UCDxZlqV8FGfLVVUHqnZbW33hA1HcoWcYZAuMCJ70BpwgKvJkwMh5VZ
	 WtAi3Ot4nd2IQZVUHyDNwhAMM9o0A88b8UQQbE+IMU6GVfMAfLlhrsaNmzJSrFOyL9
	 ndu1Ap3QsEOKw==
Date: Fri, 16 Aug 2024 14:00:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christian Heusel <christian@heusel.eu>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 2/2] kbuild: pacman-pkg: do not override objtree
Message-ID: <20240816210045.GD3870443@thelio-3990X>
References: <20240816141844.1217356-1-masahiroy@kernel.org>
 <20240816141844.1217356-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816141844.1217356-2-masahiroy@kernel.org>

On Fri, Aug 16, 2024 at 11:18:15PM +0900, Masahiro Yamada wrote:
> objtree is defined and exported by the top-level Makefile. I prefer
> not to override it.
> 
> There is no need to pass the absolute pass of objtree. PKGBUILD can
> detect it by itself.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/Makefile.package | 3 +--
>  scripts/package/PKGBUILD | 4 +++-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 4a80584ec771..2c261a0d42b0 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -147,8 +147,7 @@ snap-pkg:
>  PHONY += pacman-pkg
>  pacman-pkg:
>  	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> -	+objtree="$(realpath $(objtree))" \
> -		BUILDDIR="$(realpath $(objtree))/pacman" \
> +	BUILDDIR="$(realpath $(objtree))/pacman" \
>  		CARCH="$(UTS_MACHINE)" \
>  		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
>  		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index e2d9c2601ca9..839cd5e634d2 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -40,7 +40,9 @@ _prologue() {
>  	# MAKEFLAGS from makepkg.conf override the ones inherited from kbuild.
>  	# Bypass this override with a custom variable.
>  	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> -	cd "${objtree}"
> +
> +	# Kbuild works in the output directory, where this PKGBUILD is located.
> +	cd "$(dirname "${BASH_SOURCE[0]}")"
>  }
>  
>  build() {
> -- 
> 2.43.0
> 

