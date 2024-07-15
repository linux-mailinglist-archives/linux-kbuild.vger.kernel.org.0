Return-Path: <linux-kbuild+bounces-2521-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F44930EF5
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 09:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B56C61F21184
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 07:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D733D579;
	Mon, 15 Jul 2024 07:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="kJPZT74y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E272B9B9;
	Mon, 15 Jul 2024 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721029126; cv=none; b=giPDFOaqvLLvcmH13fW/5yNnuUKMqTH0Ity5YeqQz+gWOEckAvF0G4Pf3vU9X7i71nbi9YQXMXApU/2+IV/yvqxCS8BLjdEMfEiCCwXqUClPGYVWEK4qtIrj4lfU3opMgInrIwhQOCpGL7jX1WSLDh274dmHEW4UoAkU9UIjtcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721029126; c=relaxed/simple;
	bh=JLs4yFfwlNsdYFahJ4CzvsWGgIsDlbYr6SdonIln/2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bINW5JucC0IoT19I+zepanLHoYcA7QxDvnllrv+1JGD13Xg6LZxxaxTx51OFJAkmuuPli8yCzF9nBn+J0Zb35mQnhu6RZfv40biAi3PUizXs+Lxs73W3uIsm3kB6/RTb+lCh7N45OKZdsVOmGfcS6osarPUbYd/u6bdQZcA4VK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=kJPZT74y; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721029119;
	bh=JLs4yFfwlNsdYFahJ4CzvsWGgIsDlbYr6SdonIln/2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJPZT74ykv0xWqaDZGMjXeAFBaje48OBbI79V141b6N7RuU1qWKLoAEE1DbjQJQgf
	 PFPnjKyVibErQKEODbFys1m+Cb7cUfaEgPogg+YRTG7hKyCOeS8SlM6EeGwS+QbN2x
	 VGTEo7Ps3mL97dQ4jtqkktw1igpp3P93SZYcLyiE=
Date: Mon, 15 Jul 2024 09:38:38 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v4] kbuild: add script and target to generate pacman
 package
Message-ID: <221289d6-790f-4b26-aa88-3c502566cf8a@t-8ch.de>
References: <20240710-kbuild-pacman-pkg-v4-1-507bb5b79b2a@weissschuh.net>
 <CAK7LNAQbqC2=7Fba1xO0McDpLxmCMNQhoX0ZJByiV9MrNUW87Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQbqC2=7Fba1xO0McDpLxmCMNQhoX0ZJByiV9MrNUW87Q@mail.gmail.com>

On 2024-07-14 17:57:39+0000, Masahiro Yamada wrote:
> On Thu, Jul 11, 2024 at 4:32 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> >
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
> 
> 
> Personally, I prefer the brace form ${MAKE}, but
> indeed, there is no treewide consistency.

Ack, I'll change it for all variables.

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
> >                   arch/$(SRCARCH)/include/generated .objdiff \
> > -                 debian snap tar-install \
> > +                 debian snap tar-install PKGBUILD pacman \
> >                   .config .config.old .version \
> >                   Module.symvers \
> >                   certs/signing_key.pem \
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index bf016af8bf8a..a5b5b899d90c 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -141,6 +141,21 @@ snap-pkg:
> >         cd $(objtree)/snap && \
> >         snapcraft --target-arch=$(UTS_MACHINE)
> >
> > +# pacman-pkg
> > +# ---------------------------------------------------------------------------
> > +
> > +PHONY += pacman-pkg
> > +pacman-pkg:
> > +       @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> 
> 
> 
> I really hoped to avoid the symlink and
> 
>    makepkg -p $(srctree)/scripts/package/PKGBUILD
> 
> would work instead.
> 
> 
> However, I got this error.
> 
>   makepkg -p /home/masahiro/ref/linux/scripts/package/PKGBUILD
>   ==> ERROR: /home/masahiro/ref/linux/scripts/package/PKGBUILD must be
> in the current working directory.
> 
> So, the -p option does not seem to be useful here.
> 
> I hope somebody in the Arch Linux community would consider
> supporting PKGBUILD located in a different directory.

This seems intentional as it's mentioned in the error message and the
manpage.
Other buildsystems seem to have the same restriction.

> > +       cd $(objtree) && \
> 
> 
> objtree is always '.'
> 
> 
> You are doing "cd . && makepkg"
> 
> It is meaningless.

Ack.

> 
> 
> 
> > +               srctree="$(realpath $(srctree))" \
> 
> Is this necessary?

It was at some point, not anymore. Thanks.

> 
> > +               objtree="$(realpath $(objtree))" \
> > +               BUILDDIR="$(realpath $(objtree))/pacman" \
> 
> 
>      BUILDDIR=pacman

Ack.

> > +               CARCH="$(UTS_MACHINE)" \
> > +               KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> 
> 
> Please explain why this is necessary.
> 
> 
> With '!makeflags' dropped from options,
> it worked for me without MAKEFLAGS/KBUILD_MAKEFLAGS
> conversion.

For me I have to drop both !makeflags and !buildflags for the MAKEFLAGS
from kbuild to be passed through.
Furthermore, as soon as MAKEFLAGS is set in /etc/makepkg.conf then that
will override MAKEFLAGS from Kbuild.

> > +               KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
> 
> 
> You are inventing more and more new env variables.
> 
> How about this?
> 
>    pkgrel="$(${srctree}/init/build-version)"

The PKBUILD is evaluated multiple times. So if init/build-version is
executed from there, the versions will have gaps and be inconsistent.

I can add some explanation. But the Makefile doesn't seem to be the
right place. Is the PKGBUILD fine for it?

> > +               makepkg
> > +
> >  # dir-pkg tar*-pkg - tarball targets
> >  # ---------------------------------------------------------------------------
> >
> > @@ -221,6 +236,7 @@ help:
> >         @echo '  bindeb-pkg          - Build only the binary kernel deb package'
> >         @echo '  snap-pkg            - Build only the binary kernel snap package'
> >         @echo '                        (will connect to external hosts)'
> > +       @echo '  pacman-pkg          - Build only the binary kernel pacman package'
> >         @echo '  dir-pkg             - Build the kernel as a plain directory structure'
> >         @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
> >         @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > new file mode 100644
> > index 000000000000..b0b133ac28eb
> > --- /dev/null
> > +++ b/scripts/package/PKGBUILD
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
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
> 
> 
> makedepends=(
>      ...
> )
> 
> is missing. Is it intentional?

Yes. This also depends on the chosen configuration.
If you prefer I can add it back.

> > +build() {
> > +  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
> > +  cd "$objtree"
> > +
> > +  # makepkg does a "chmod a-srw", triggering warnings during kbuild
> > +  chmod 0755 "$pkgdirbase" || true
> > +
> > +  $MAKE -f "$srctree/Makefile"
> 
> The -f option is unneeded.
> 
> Just simply:
> 
>       ${MAKE}

Ack.

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
> > +
> > +  echo "Installing modules..."
> > +  $MAKE INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
> > +    DEPMOD=true modules_install
> > +
> > +  if $MAKE run-command KBUILD_RUN_COMMAND='test -d $srctree/arch/$SRCARCH/boot/dts' 2>/dev/null; then
> > +    echo "Installing dtbs..."
> > +    $MAKE INSTALL_DTBS_PATH="$modulesdir/dtb" dtbs_install
> > +  fi
> > +
> > +  # remove build link, will be part of -headers package
> > +  rm -f "$modulesdir/build"
> > +}
> > +
> > +package_linux-upstream-headers() {
> > +  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
> > +
> > +  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
> > +  cd "$objtree"
> > +  local builddir="$pkgdir/usr/$MODLIB/build"
> > +
> > +  echo "Installing build files..."
> > +  "$srctree/scripts/package/install-extmod-build" "$builddir"
> > +
> > +  echo "Installing System.map and config..."
> > +  cp System.map "$builddir/System.map"
> > +  cp .config "$builddir/.config"
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
> > +  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
> > +  cd "$objtree"
> > +
> > +  $MAKE headers_install INSTALL_HDR_PATH="$pkgdir/usr"
> > +}
> > +
> > +# vim:set ts=8 sts=2 sw=2 et:
> 
> 
> 
> Documentation/process/coding-style.rst
> discourages this.
> 
> 
>  """
>         /* vim:set sw=8 noet */
> 
>  Do not include any of these in source files.
>  """
> 
> If you need to specify this in .editorconfig
> 
> I do not know the style guide of PKGCONFIG.
> Does it conventionally use 2-space indentation?

Ack.

I don't think it's important.
PKGBUILD(5) even uses 8 spaces.
I'll align it to kernel conventions and drop the config line.

