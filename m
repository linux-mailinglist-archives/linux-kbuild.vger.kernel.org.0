Return-Path: <linux-kbuild+bounces-2470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58E92E7EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2024 14:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7B1BB26249
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2024 12:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6281E1459E3;
	Thu, 11 Jul 2024 12:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="moiHuqMw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0EF14F9E5;
	Thu, 11 Jul 2024 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720699384; cv=none; b=qMAWw9qM3Jv+/Uyd0xSZFXBxYNozWS1Y5XbFgIevKr0+V1SyKobjYciZzaxUCr6wl0fBzXD5ylqLigD5o/TawQt2rypJIcHV6bLN/g8hPll6CTwRaKUqQWgmvzWEScTOQ66lCKcqiTrKt/bBUd3KgTnJFR7DpGGTVP2EY1oR9Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720699384; c=relaxed/simple;
	bh=nEkPBWyn7KlA77ZOsjz5EyUjFNY8YVXd/zsZ4st21h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC8MF5KtHzVPyik3CBjsrH2gdLMUE/8xabJiKdFG+a0m10XwIJc23ghCr4+uxukNgf71GSrYfMzny9pp0ZBr+boTfdiXeRS8ow83aafn+rVNoiVxK1Mr8Lj1Eu88xot8SXQCJNmkScfu+8C7fRz99vbcMtzccXm53JtJfiSI8Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=moiHuqMw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720699377;
	bh=nEkPBWyn7KlA77ZOsjz5EyUjFNY8YVXd/zsZ4st21h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moiHuqMwQ+tLkxoWGKsOPi4TzUmMAGehiYjRXJluGxtvwzJKc1fJdGa2DRQiIm644
	 0/YL2n/7IU0r3WnSWHJHi13fYby1DrDWweKaOSScD0nACD+9NaL+cROIa5YOwI9VOv
	 ASeZrhVt5WC0LFmw/S2yi+nZglnzAZgbss1oU3Cs=
Date: Thu, 11 Jul 2024 14:02:56 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4] kbuild: add script and target to generate pacman
 package
Message-ID: <09e24e13-abd8-4f42-a1a1-b2f86054bb1b@t-8ch.de>
References: <20240710-kbuild-pacman-pkg-v4-1-507bb5b79b2a@weissschuh.net>
 <Zo-Khw3jf-hSdD2S@fjasle.eu>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zo-Khw3jf-hSdD2S@fjasle.eu>

On 2024-07-11 09:32:23+0000, Nicolas Schier wrote:
> Sorry, I sent my last mail to quickly.  Three things below:
> 
> On Wed, Jul 10, 2024 at 09:32:28PM +0200 Thomas Weißschuh wrote:
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
> 
> The package is actually called "linux-upstream", right?

The new in-kernel package is called "linux-upstream", correct.
But the package shipped by Arch Linux itself, which I'm referring to
here, is called "linux".

> > Extra steps that should not be necessary for a development kernel have
> > been removed and an UAPI header package has been added.
> > 
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Changes in v4:
> > - Update MRPROPER_FILES
> > - Unify shell variable syntax
> > - Link to v3: https://lore.kernel.org/r/20240708-kbuild-pacman-pkg-v3-1-885df3cbc740@weissschuh.net
> > 
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
> >  Makefile                 |  2 +-
> >  scripts/Makefile.package | 16 ++++++++++
> >  scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 106 insertions(+), 1 deletion(-)
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
> > diff --git a/Makefile b/Makefile
> > index b25b5b44af10..79e8dcec6be9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1497,7 +1497,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
> >  # Directories & files removed with 'make mrproper'
> >  MRPROPER_FILES += include/config include/generated          \
> >  		  arch/$(SRCARCH)/include/generated .objdiff \
> > -		  debian snap tar-install \
> > +		  debian snap tar-install PKGBUILD pacman \
> 
> (thanks!)
> 
> >  		  .config .config.old .version \
> >  		  Module.symvers \
> >  		  certs/signing_key.pem \
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
> > +	cd $(objtree) && \
> 
> Please prefix this line with a '+' to allow make job-server delegation to
> sub-make called via makepkg.  This will prevent the make warning
> 
>     make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.

I don't see thiss warning in my GNU Make 4.4.1.
(But job-server delegation seems to work)

Maybe it's needed for other make versions or jobserver implementations,
I'll add it.

> > +		srctree="$(realpath $(srctree))" \
> > +		objtree="$(realpath $(objtree))" \
> > +		BUILDDIR="$(realpath $(objtree))/pacman" \
> > +		CARCH="$(UTS_MACHINE)" \
> > +		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> > +		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
> 
> Just a note: In Masahiro's current kbuild tree 'build-version' has been moved
> to scripts/build-version.  But I don't know on which base this patch will
> possibly be applied to.

The patch is based on Linus' tree.
But I expect it to go in via the kbuild tree, so it should be updated.
Thanks for the pointer!

> > +		makepkg
> > +
> >  # dir-pkg tar*-pkg - tarball targets
> >  # ---------------------------------------------------------------------------
> >  
> > @@ -221,6 +236,7 @@ help:
> >  	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
> >  	@echo '  snap-pkg            - Build only the binary kernel snap package'
> >  	@echo '                        (will connect to external hosts)'
> > +	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
> >  	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
> >  	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
> >  	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > new file mode 100644
> > index 000000000000..b0b133ac28eb
> > --- /dev/null
> > +++ b/scripts/package/PKGBUILD
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> 
> I am not familiar enough with makepkg/PKGBUILD: Does it make sense to put
> 'set -e' here, as we (will) do in other kbuild scripts?  ('set -u' breaks
> 'makepkg'.)  Without 'set -e', shellcheck asks for error handling around 'cd'
> commands.

Inside prepare(), build() etc. it is already enabled.
IMO it doesn't make sense to second-guess makepkg here.

> > +
> > +pkgbase=linux-upstream
> > +pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> > +pkgver="${KERNELRELEASE//-/_}"
> > +pkgrel="$KBUILD_REVISION"
> > +pkgdesc='Linux'
> > +url='https://www.kernel.org/'
> > +arch=($CARCH)
> > +options=(!debug !strip !buildflags !makeflags)
> > +license=(GPL-2.0-only)
> > +
> > +build() {
> > +  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
> > +  cd "$objtree"
> > +
> > +  # makepkg does a "chmod a-srw", triggering warnings during kbuild
> > +  chmod 0755 "$pkgdirbase" || true
> > +
> > +  $MAKE -f "$srctree/Makefile"
> > +}
> > +
> > +package_linux-upstream() {
> > +  pkgdesc="The $pkgdesc kernel and modules"
> > +
> > +  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
> > +  cd "$objtree"
> > +  local modulesdir="$pkgdir/usr/$MODLIB"
> > +
> > +  echo "Installing boot image..."
> > +  # systemd expects to find the kernel here to allow hibernation
> > +  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
> > +  install -Dm644 "$($MAKE -s image_name)" "$modulesdir/vmlinuz"
> > +
> > +  # Used by mkinitcpio to name the kernel
> > +  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
> 
> This looks funny, I think I'd just use echo "$pkgbase" >"$modulesdir/pkgbase",
> but this is probably just bike-shedding.

It's from the original PKGBUILD.
But you are right, it looks funky and I'll change it.

> So, all in all it looks good to me, thanks!
> 
> With the jobserver-'+'-prefix added:
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks!

