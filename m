Return-Path: <linux-kbuild+bounces-2819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00331947C63
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 16:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2FB1F234E1
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 14:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B35213A26F;
	Mon,  5 Aug 2024 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Xguii6Mv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33A2381D4;
	Mon,  5 Aug 2024 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722866509; cv=none; b=EeJBlfi2nXeAV3lcdIE3ApJKW8OOl1B2ONpG0EWHauXCwP8szNyjAXAf9w/5YeNfJihNmLNc9ry8fTo8/u7fkrYG5SkZ2eZeX0CP6eiD1FOUuMLacLApBkrOSewaVyIzvcAIQ9tNDTctvrEBdPm2aSFUQO38eAHiaO9XPasfJuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722866509; c=relaxed/simple;
	bh=aHSrvx4Jeri1JfHkmGjMJCo9xwx0M5IOtiHv+g09qLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phq4r281iJj58FKHx2dUsRzo3fE8jttJH8OSYVjGIa9pHilfDo62oSk5A7BZtjKgmKm33Vc2ZMpRGPFfqQFIRJ87cL4IAbAmTz9FYJimfEMcHmuQlL1EMMfa4V8hD6gF4qL7lExhUXIYnp+9Bnt5f9SHDFOe8gMDDH1ivWVYiqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Xguii6Mv; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722866504;
	bh=aHSrvx4Jeri1JfHkmGjMJCo9xwx0M5IOtiHv+g09qLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xguii6Mvc9SQXgLoxWm1En8dVk50ouciwDzko4tG6KIBZPT3ddYn5lSdakkqE2g//
	 49sIdAYQEw5U8sInZO4Ze3uCX2/uC75CBmVjXB+ycDesfR2U/UeHJe1yBapFuvFFiR
	 gu3eqoq9E66zLMh80e+HGVLBa9bM7BeODSU3kmNc=
Date: Mon, 5 Aug 2024 16:01:44 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <c41e3856-29f4-438f-a796-43aa957215d1@t-8ch.de>
References: <20240804000130.841636-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804000130.841636-1-jose.fernandez@linux.dev>

Hi Jose,

On 2024-08-03 18:01:25+0000, Jose Fernandez wrote:
> Introduce a new variable, PACMAN_EXTRAPACKAGES, in the Makefile.package
> to control the creation of additional packages by the pacman-pkg target.
> 
> This changes the behavior of the pacman-pkg target to only create the
> main kernel package by default. The rest of the packages will be opt-in
> going forward.

I had the impression that by default all extrapackages should be
built. The variable can then be used by expert users where needed.
Other Opinions?

> In a previous patch, there was concern that adding a new debug package
> would increase the package time. To address this concern and provide
> more flexibility, this change has been added to allow users to decide
> which extra packages to include before introducing an optional debug
> package [1].

This paragraph seems like it shouldn't be part of the final commit.
If you put it after a line with "---" it will be dropped from the
commit, like so:

---

In a previous patch, ...

> 
> [1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990X/T/
> 
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> ---
>  scripts/Makefile.package |  5 +++++
>  scripts/package/PKGBUILD | 11 ++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 4a80584ec771..146e828cb4f1 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -144,6 +144,10 @@ snap-pkg:
>  # pacman-pkg
>  # ---------------------------------------------------------------------------
>  
> +# Space-separated list of extra packages to build
> +# The available extra packages are: headers api-headers
> +PACMAN_EXTRAPACKAGES ?=

The assignment doesn't do anything.
Do we need the documentation if the default enables all subpackages?

> +
>  PHONY += pacman-pkg
>  pacman-pkg:
>  	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> @@ -152,6 +156,7 @@ pacman-pkg:
>  		CARCH="$(UTS_MACHINE)" \
>  		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
>  		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> +		PACMAN_EXTRAPACKAGES="$(PACMAN_EXTRAPACKAGES)" \

This line is superfluous.

>  		makepkg $(MAKEPKGOPTS)
>  
>  # dir-pkg tar*-pkg - tarball targets
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 663ce300dd06..41bd0d387f0a 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -3,10 +3,15 @@
>  # Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
>  
>  pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> -pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> -if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> -	pkgname+=("${pkgbase}-headers")
> +pkgname=("${pkgbase}")
> +
> +_extrapackages=${PACMAN_EXTRAPACKAGES:-}
> +if [ -n "$_extrapackages" ]; then

No need for this check. The loop over an empty variable work fine.

> +	for pkg in $_extrapackages; do
> +		pkgname+=("${pkgbase}-$pkg")

Use consistent variable references: "${pkgbase}-${pkg}"

> +	done
>  fi
> +
>  pkgver="${KERNELRELEASE//-/_}"
>  # The PKGBUILD is evaluated multiple times.
>  # Running scripts/build-version from here would introduce inconsistencies.
> -- 
> 2.46.0
> 

