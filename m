Return-Path: <linux-kbuild+bounces-5370-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C4A01275
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2025 06:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64DB0163CDF
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jan 2025 05:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EBBAD27;
	Sat,  4 Jan 2025 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Psc4ww0s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D8B8467;
	Sat,  4 Jan 2025 05:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735967119; cv=none; b=AelbZPlj6EbeUy1Lt0UrtDj0QEMaatfhLPSU+Vcib6ZMVI+WpO3YMD0wGTd4wN2gJ5frWBvWsp9pb2XvU1EpNI3r8ldeoICcxu3S9aTLoku8uMbtsCFO2WS78u3GXECdxcKt1QN/H1qkgepHVl3zKvU7QlqHXsQT+2PIWBl8vOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735967119; c=relaxed/simple;
	bh=SFvvwHZvyXane5xPqQlV/bih6it2oFawzJFgoFFKpIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLHESfTlvz1UccDIC6WtGsXGResXOcowIvHnEdd9tZVpTf4i3+7I7l9BvZDmP2cgBJwZglwtI/d0DbdcclPTibApCxfb2Gsgp9aXAilyi8oyKXzBIHkcPxLoXBvapaofJwg4D7+22EhwmWtYB0P+x/lRZdzZ/mi8FaBr7/3f/EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Psc4ww0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E65C4CED1;
	Sat,  4 Jan 2025 05:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735967117;
	bh=SFvvwHZvyXane5xPqQlV/bih6it2oFawzJFgoFFKpIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Psc4ww0sMraK+0/TFj+uGFSpU3p8AaPse+6AdinNac33KeOkWl0I0fsdcVd8BVw5P
	 oFe3MtHSfw0Wp4AD5B/qbH4HknilPXrx5w9EvC60PzDahUl8EKZ39bpWv8w0tRJQgh
	 WZMKvPypQc/FvIvbGK0Awh4KQwugUhdJOtODYvmZoSJmeiBjCKSxpZbtxv74Jw8J89
	 jegOejG0hbSuEhmrFyrexjnBQxQf1ipCxw2CgTP/2DrK8+BZbbTmFqAMnLrcyHEfw9
	 Kwiilrl8e+0Sas5ULySE7P+n+Q4zzym3i0/34MKRSXeSjKXJN/HA+NB+NsZJ8B5uZp
	 P/WQfI5LjZ6iw==
Date: Fri, 3 Jan 2025 22:05:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Christian Heusel <christian@heusel.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: pacman-pkg: provide versioned linux-api-headers
 package
Message-ID: <20250104050513.GA1889730@ax162>
References: <20250103-kbuild-pacman-pkg-provides-v1-1-d568b4b9cfd5@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250103-kbuild-pacman-pkg-provides-v1-1-d568b4b9cfd5@weissschuh.net>

On Fri, Jan 03, 2025 at 07:20:23PM +0100, Thomas Weiﬂschuh wrote:
> The Arch Linux glibc package contains a versioned dependency on
> "linux-api-headers". If the linux-api-headers package provided by
> pacman-pkg does not specify an explicit version this dependency is not
> satisfied.
> Fix the dependency by providing an explicit version.
> 
> Fixes: c8578539deba ("kbuild: add script and target to generate pacman package")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Makes sense based on my understanding of provides.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/package/PKGBUILD | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index f83493838cf96ac9f209c6fc8f9b219705f9715b..dca706617adc76d01a09a86785815a48db15b099 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -103,7 +103,7 @@ _package-headers() {
>  
>  _package-api-headers() {
>  	pkgdesc="Kernel headers sanitized for use in userspace"
> -	provides=(linux-api-headers)
> +	provides=(linux-api-headers="${pkgver}")
>  	conflicts=(linux-api-headers)
>  
>  	_prologue
> 
> ---
> base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> change-id: 20250103-kbuild-pacman-pkg-provides-06b02d213e75
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

