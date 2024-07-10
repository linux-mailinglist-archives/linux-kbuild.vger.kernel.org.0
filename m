Return-Path: <linux-kbuild+bounces-2467-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3A92D479
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 16:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A0531C20C03
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 14:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8BF22071;
	Wed, 10 Jul 2024 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="F3+A1OUt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B015E97;
	Wed, 10 Jul 2024 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622785; cv=none; b=EatD/udQT/BDPG6bVyXKmyxzYakXGQ+QkFuVu2Y6mztQAzbAbIsaREjAx2xE7bbbgxIlUxzhlCP1wOsT+cRN/H/U2HQJRM1F4ftz53+VRJOiUQJpVWAhsxW+yrxdB8iNmMeLOLmWctvxEqBmY5XsvpiPWK2+Cehfij4z+MRx4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622785; c=relaxed/simple;
	bh=yOXgcSetJMIuIuBSusBHwSM0RfsFnWWBxADW8NZvzjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kigzpkWW4w3qtZmWJk4GyncdGOm3n4h+E7nE+70U9O7c7h9aS4sPQQKKE0U04dgnoMMkX2Ke9sguVfwLZV2ZCdRJ7TMl7PUlvjRuM4hQttBS3kVPhIo0atBpO9XXnIKIhZecAzmdQlX1YAJAk2ZTF3p9YTQLV5tB32EakB0puYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=F3+A1OUt; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720622778;
	bh=yOXgcSetJMIuIuBSusBHwSM0RfsFnWWBxADW8NZvzjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3+A1OUtKDH/DGbE00XW3xDmkUHn5Xs6zwQJTlhgEWAIu33cBBInYw5Q7/Y2qbhIj
	 xEJ/3mnnbkJ42IMgmIR/hu2po+QGE0dKt3Cd4dBybUuA8JjYXKF3nq+fbUntRXgigO
	 zoRaXiBOEl+w+VnpENcIwIvyI3bLnK+YpF+ux/gM=
Date: Wed, 10 Jul 2024 16:46:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: add script and target to generate pacman
 package
Message-ID: <270d9b2a-4c22-4a6d-be25-66da48c68390@t-8ch.de>
References: <20240708-kbuild-pacman-pkg-v3-1-885df3cbc740@weissschuh.net>
 <Zo6dQQIJmkauRmFM@fjasle.eu>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zo6dQQIJmkauRmFM@fjasle.eu>

On 2024-07-10 16:40:01+0000, Nicolas Schier wrote:
> On Mon, Jul 08, 2024 at 10:11:51PM +0200 Thomas Weißschuh wrote:
> > pacman is the package manager used by Arch Linux and its derivates.
> > Creating native packages from the kernel tree has multiple advantages:
> > 
> > * The package triggers the correct hooks for initramfs generation and
> >   bootloader configuration
> > * Uninstallation is complete and also invokes the relevant hooks
> > * New UAPI headers can be installed without any manual bookkeeping
> > 
> > The PKGBUILD file is a simplified version of the one used for the
> > downstream Arch Linux "linux" package.
> > Extra steps that should not be necessary for a development kernel have
> > been removed and an UAPI header package has been added.
> > 
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Changes in v3:
> > - Enforce matching architectures for installation
> > - Add Reviewed-by and Tested-by from Nathan
> > - Link to v2: https://lore.kernel.org/r/20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net
> > 
> > Changes in v2:
> > - Replace ${MAKE} with $MAKE for consistency with other variables
> > - Use $MAKE for "-s image_name"
> > - Avoid permission warnings from build directory
> > - Clarify reason for /build symlink removal
> > - Install System.map and config
> > - Install dtbs where available
> > - Allow cross-build through arch=any
> > - Sort Contributor/Maintainer chronologically
> > - Disable some unneeded makepkg options
> > - Use DEPMOD=true for consistency with rpm-package
> > - Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net
> > ---
> >  .gitignore               |  6 ++++
> >  scripts/Makefile.package | 16 ++++++++++
> >  scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 105 insertions(+)
> > 
> > diff --git a/.gitignore b/.gitignore
> > index c59dc60ba62e..7902adf4f7f1 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -92,6 +92,12 @@ modules.order
> >  #
> >  /tar-install/
> >  
> > +#
> > +# pacman files (make pacman-pkg)
> > +#
> > +/PKGBUILD
> > +/pacman/
> > +
> >  #
> >  # We don't want to ignore the following even if they are dot-files
> >  #
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index bf016af8bf8a..a5b5b899d90c 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -141,6 +141,21 @@ snap-pkg:
> >  	cd $(objtree)/snap && \
> >  	snapcraft --target-arch=$(UTS_MACHINE)
> >  
> > +# pacman-pkg
> > +# ---------------------------------------------------------------------------
> > +
> > +PHONY += pacman-pkg
> > +pacman-pkg:
> > +	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> 
> Can you please also add PKGBUILD to MRPROPER_FILES in top-level Makefile?

Sure! "pacman" should also go there, no?

Thomas

