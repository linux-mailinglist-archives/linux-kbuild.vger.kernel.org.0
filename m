Return-Path: <linux-kbuild+bounces-2383-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B80927D27
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 20:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C47561C20C91
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 18:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802D953389;
	Thu,  4 Jul 2024 18:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="eC8XFyJA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1EC143887;
	Thu,  4 Jul 2024 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720117987; cv=none; b=n27O7UiaCgAJwN0gWTDEv/et6iWIZDaQOSYXkNN+6ZgHgexOByEZ1CnNGUPbN0XtPfd+Mrxj+0fZ+0ht5Pm0ehzXilc+i1lDzWyRglYXL5Pvn5VNUpVDHWkJ5uq+byzT6/11Htimt1KE4p5TF69N++P9FvyH6KUQriXQdX+sd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720117987; c=relaxed/simple;
	bh=VDWWjNgoXv2+npNrbBZ8gNifMvHga4rn8kJmApgzkNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvDl7AJg105t+3mhNjuvGGDPRkglm8nC7siGWiGTcHzCwQuWk1M+6YcznXIjFU8BMTui3QkbXsRCW7YRKq8F1Ur2Mrn3XGjKo63Wot7RtlhedblnTU072TLBifcjDaII9JLbhGFCSz1ZOrPlamCeYjBTHknRQ+hiiepIg6K4D98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=eC8XFyJA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720117982;
	bh=VDWWjNgoXv2+npNrbBZ8gNifMvHga4rn8kJmApgzkNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eC8XFyJAj+Kh//LcEiSPT3MPBSo/GkNYhRwH89ZfQyO+Y0Yci55CR1E1Hymh/T8TA
	 +/2NP5H8bbi0ow9u/A6jidhDtd91Qv49ZZLcEvR7cd0n2HRPYJa8Ky6AbBMTC9teKO
	 AJ3B3imOmFanfpUrfvRP3/Xx12lmXeE4zbZM3ojM=
Date: Thu, 4 Jul 2024 20:33:02 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add script and target to generate pacman package
Message-ID: <48949ab7-7fac-4be1-b28f-87a3e3b6d6a6@t-8ch.de>
References: <20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net>
 <20240704182115.GA300903@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240704182115.GA300903@thelio-3990X>

On 2024-07-04 11:21:15+0000, Nathan Chancellor wrote:
> Hi Thomas,
> 
> On Thu, Jul 04, 2024 at 06:36:34PM +0200, Thomas Weißschuh wrote:
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
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> 
> This is pretty awesome and much needed I think, it would allow me to
> replace my own home grown "build an Arch Linux kernel package" script.
> It should also make it much easier for users of Arch Linux and related
> distributions to build and test mainline kernels for issue reproduction
> and bisecting, which is one of the biggest hurdles I have encountered
> when it comes to working with those users.

Nice to hear!

> The resulting package that I get boots in my virtual machine (I can't
> take down my workstation at the moment).

For the record: It works on my physical machine.

> I notice one warning during the build phase that appears to come from makepkg
> itself? The permissions of the pkg folder are execute only. This is building
> using O=, I haven't had much time to look into it aside from that.
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 O=... olddefconfig pacman-pkg
>   ==> Making package: linux-upstream 6.10.0_rc6_00051_g1dfe225e9af5_dirty-1 (Thu 04 Jul 2024 10:02:14 AM MST)
>   ==> Checking runtime dependencies...
>   ==> Checking buildtime dependencies...
>   ==> Retrieving sources...
>   ==> Extracting sources...
>   ==> Starting build()...
>   find: ‘./pacman/linux-upstream/pkg’: Permission denied
>   ...
> 
>   $ ls -al .../pacman/linux-upstream
>   total 16
>   drwxr-xr-x 4 nathan nathan 4096 Jul  4 10:02 .
>   drwxr-xr-x 3 nathan nathan 4096 Jul  4 10:02 ..
>   d--x--x--x 2 nathan nathan 4096 Jul  4 10:02 pkg
>   drwxr-xr-x 2 nathan nathan 4096 Jul  4 10:02 src
> 
> Not a big deal to me though, it's only a warning.

I'll try to fix it up for v2.

> 
> > ---
> >  .gitignore               |  6 ++++
> >  scripts/Makefile.package | 15 ++++++++++
> >  scripts/package/PKGBUILD | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 93 insertions(+)
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
> > index bf016af8bf8a..8c0c80f8bec0 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -141,6 +141,20 @@ snap-pkg:
> >  	cd $(objtree)/snap && \
> >  	snapcraft --target-arch=$(UTS_MACHINE)
> >  
> > +# pacman-pkg
> > +# ---------------------------------------------------------------------------
> > +
> > +PHONY += pacman-pkg
> > +pacman-pkg:
> > +	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> > +	cd $(objtree) && \
> > +		srctree="$(realpath $(srctree))" \
> > +		objtree="$(realpath $(objtree))" \
> > +		BUILDDIR="$(realpath $(objtree))/pacman" \
> > +		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> > +		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
> > +		makepkg
> > +
> >  # dir-pkg tar*-pkg - tarball targets
> >  # ---------------------------------------------------------------------------
> >  
> > @@ -221,6 +235,7 @@ help:
> >  	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
> >  	@echo '  snap-pkg            - Build only the binary kernel snap package'
> >  	@echo '                        (will connect to external hosts)'
> > +	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
> >  	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
> >  	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
> >  	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > new file mode 100644
> > index 000000000000..29daf357edc1
> > --- /dev/null
> > +++ b/scripts/package/PKGBUILD
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> > +
> > +pkgbase=linux-upstream
> > +pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> > +pkgver="${KERNELRELEASE//-/_}"
> > +pkgrel="$KBUILD_REVISION"
> > +pkgdesc='Linux'
> > +url='https://www.kernel.org/'
> > +arch=("$UTS_MACHINE")
> > +options=(!strip)
> > +license=(GPL-2.0-only)
> > +
> > +build() {
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +  cd "$objtree"
> > +
> > +  ${MAKE} -f "${srctree}/Makefile"
> > +
> > +}
> > +
> > +package_linux-upstream() {
> > +  pkgdesc="The $pkgdesc kernel and modules"
> > +
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +  cd "$objtree"
> > +  local modulesdir="$pkgdir/usr/$MODLIB"
> > +
> > +  echo "Installing boot image..."
> > +  # systemd expects to find the kernel here to allow hibernation
> > +  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
> > +  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
> 
> should this be ${MAKE}? I suppose it does not really matter much.

Make sense for consistency.

> 
> Would it be worth copying the .config and System.map to $modulesdir like
> kernel.spec here as well? I know that upstream does not do this, as it
> enables IKCONFIG in /proc but it would be potentially useful in certain
> scenarios.

Ack.

> One other minor suggestion would be installing the dtbs somewhere if
> the architecture supports them, maybe to $modulesdir/dtbs? Not super
> critical but I know Arch Linux Ports is gaining traction, so it might be
> good to future proof this a little bit.

Ack.

> > +  # Used by mkinitcpio to name the kernel
> > +  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
> > +
> > +  echo "Installing modules..."
> > +  ${MAKE} INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
> > +    DEPMOD=/doesnt/exist modules_install  # Suppress depmod
> > +
> > +  # remove build link
> 
> Perhaps it is worth mentioning that this is done because it will be
> created again/properly in the headers package?

Ack.

> 
> > +  rm -f "$modulesdir/build"
> > +}
> > +
> > +package_linux-upstream-headers() {
> > +  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
> > +
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +  cd "$objtree"
> > +  local builddir="$pkgdir/usr/$MODLIB/build"
> > +
> > +  echo "Installing build files..."
> > +  "$srctree/scripts/package/install-extmod-build" "$builddir"
> > +
> > +  echo "Adding symlink..."
> > +  mkdir -p "$pkgdir/usr/src"
> > +  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
> > +}
> > +
> > +package_linux-upstream-api-headers() {
> > +  pkgdesc="Kernel headers sanitized for use in userspace"
> > +  provides=(linux-api-headers)
> > +  conflicts=(linux-api-headers)
> > +
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +  cd "$objtree"
> > +
> > +  ${MAKE} headers_install INSTALL_HDR_PATH="$pkgdir/usr"
> > +}
> > +
> > +# vim:set ts=8 sts=2 sw=2 et:
> > 
> > ---
> > base-commit: 795c58e4c7fc6163d8fb9f2baa86cfe898fa4b19
> > change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036
> > 
> > Best regards,
> > -- 
> > Thomas Weißschuh <linux@weissschuh.net>
> > 

