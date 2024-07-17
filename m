Return-Path: <linux-kbuild+bounces-2586-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF4934294
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 21:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF706B217E4
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 19:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166051822FF;
	Wed, 17 Jul 2024 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Ic4lKyzy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D922EAF9;
	Wed, 17 Jul 2024 19:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721244436; cv=none; b=Smi787h7wibfXlWaMUmPXj1oGR2NtYiXaq1bgRAlUfoy0vdSFh89CcJwYbKlITGbq6dY5LDoeT+IKZ44t0BYWBFdg+D/nQMdWQCxMj55xAVasklwh8Jc8JdqOt52VLZCMS2nRJdnfx4uWQ7Y6iIMFwKBHLmr0H9qpPWjOtuggbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721244436; c=relaxed/simple;
	bh=CS7TulqDmVmqhtme4yFCDgadTpW8KAWG9ObDftu26Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=andpoktlZm4Ti8XjPNZELY/ia0qXecWoWiwct406gY5SoD2vDWGpx598Ams5M3lfibeK5qcMeZFxVKDev0+2QjrcSUkyU+RS1yHg8EHQxSedha2BH+spR3z88Yd52gphGEyqrV/RFC7+wbhcBKxvp+rZCuJCVJjunVbRSJ9jSGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Ic4lKyzy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721244429;
	bh=CS7TulqDmVmqhtme4yFCDgadTpW8KAWG9ObDftu26Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ic4lKyzyKtb+a/aLKwAmHwRrneiRHmurmFzMZi7psgPy7VhEQU9cHbvLEkSyeMGyC
	 3ovSzcBMG8hg4Idz4OvPlHWzDZjpDzftA4W2nZXcAHub4BY49VrUW52ZS7jEw2C6h1
	 JlkuC+Bd/L2u/nWGxR+9Z5p5x94awdhqyX4ABDI0=
Date: Wed, 17 Jul 2024 21:27:04 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <020f9537-76ad-4e48-8bd1-ce30e5e175a8@t-8ch.de>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <CAK7LNAQk+i+9YUJMa8HkPhGw4gVLZMu=qxjzsT-S8T2b8RMd+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQk+i+9YUJMa8HkPhGw4gVLZMu=qxjzsT-S8T2b8RMd+w@mail.gmail.com>

On 2024-07-18 03:38:17+0000, Masahiro Yamada wrote:
> On Wed, Jul 17, 2024 at 2:52 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
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
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> > Changes in v6:
> > - Drop reference to srctree/Makefile
> > - Drop $(realpath $(srctree))
> > - Make use of the fact that $(objtree) is always "."
> > - Align coding style to kernel and drop vim config line
> > - Drop indirection through `$MAKE run-command`
> > - Unify shell variable syntax to "${var}"
> > - Add explanations to custom variables
> > - Add makedepends
> > - Link to v5: https://lore.kernel.org/r/20240714-kbuild-pacman-pkg-v5-1-0598460bc918@weissschuh.net
> >
> > Changes in v5:
> > - Rebase onto kbuild/for-next
> > - Use new path to build-version script (from kbuild/for-next)
> > - Ensure submake jobserver delegation works
> > - Simplify $modulesdir/pkgbase file creation
> > - Add Reviewed-by from Nicolas
> > - Link to v4: https://lore.kernel.org/r/20240710-kbuild-pacman-pkg-v4-1-507bb5b79b2a@weissschuh.net
> >
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
> >  .gitignore               |  6 +++
> >  Makefile                 |  2 +-
> >  scripts/Makefile.package | 14 +++++++
> >  scripts/package/PKGBUILD | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 120 insertions(+), 1 deletion(-)
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
> > index 7372ea45ed3f..768d3dc107f8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1481,7 +1481,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
> >  # Directories & files removed with 'make mrproper'
> >  MRPROPER_FILES += include/config include/generated          \
> >                   arch/$(SRCARCH)/include/generated .objdiff \
> > -                 debian snap tar-install \
> > +                 debian snap tar-install PKGBUILD pacman \
> >                   .config .config.old .version \
> >                   Module.symvers \
> >                   certs/signing_key.pem \
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index bf016af8bf8a..0aaa0832279c 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -141,6 +141,19 @@ snap-pkg:
> >         cd $(objtree)/snap && \
> >         snapcraft --target-arch=$(UTS_MACHINE)
> >
> > +# pacman-pkg
> > +# ---------------------------------------------------------------------------
> > +
> > +PHONY += pacman-pkg
> > +pacman-pkg:
> > +       @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> > +       +objtree="$(realpath $(objtree))" \
> > +               BUILDDIR=pacman \
> > +               CARCH="$(UTS_MACHINE)" \
> > +               KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> > +               KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> > +               makepkg
> > +
> >  # dir-pkg tar*-pkg - tarball targets
> >  # ---------------------------------------------------------------------------
> >
> > @@ -221,6 +234,7 @@ help:
> >         @echo '  bindeb-pkg          - Build only the binary kernel deb package'
> >         @echo '  snap-pkg            - Build only the binary kernel snap package'
> >         @echo '                        (will connect to external hosts)'
> > +       @echo '  pacman-pkg          - Build only the binary kernel pacman package'
> >         @echo '  dir-pkg             - Build the kernel as a plain directory structure'
> >         @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
> >         @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > new file mode 100644
> > index 000000000000..eb3957fad915
> > --- /dev/null
> > +++ b/scripts/package/PKGBUILD
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > +
> > +pkgbase=linux-upstream
> > +pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
> > +pkgver="${KERNELRELEASE//-/_}"
> > +# The PKGBUILD is evaluated multiple times.
> > +# Running scripts/build-version from here would introduce inconsistencies.
> > +pkgrel="${KBUILD_REVISION}"
> 
> > +pkgdesc='Linux'
> > +url='https://www.kernel.org/'
> > +# Enable flexible cross-compilation
> > +arch=(${CARCH})
> > +license=(GPL-2.0-only)
> > +makedepends=(
> > +       base-devel
> 
> 
> The base-devel group includes autoconf, automake, libtool, etc.
> 
> Kbuild does not use those.
> 
> 
> I like a list of individual packages, as seen in arch linux:
> 
> https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/6.9.9.arch1-1/PKGBUILD?ref_type=tags#L11

From the wiki:

Note:
    The package base-devel is assumed to be already installed when
    building with makepkg. Dependencies of this package should not be
    included in makedepends array.

https://wiki.archlinux.org/title/PKGBUILD

Theoretically this shouldn't even be needed in the makedepends array.
I added it so if users are not aware that makepkg is used under the hood
these basic dependencies are met.
So the linked PKGBUILD assumes that all of this is already installed.

But I can see why you dislike it and will provide a more accurate list
of dependencies.

> > +       bc
> > +       cpio
> > +       gettext
> > +       libelf
> > +       openssl
> > +       pahole
> > +       perl
> > +       python
> > +       rsync
> > +       tar
> > +)
> > +options=(!debug !strip !buildflags !makeflags)
> > +
> > +build() {
> > +       # MAKEFLAGS from makepkg.conf override the ones inherited from kbuild.
> > +       # Bypass this override with a custom variable.
> > +       export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +       cd "${objtree}"
> > +
> > +       # makepkg does a "chmod a-srw", triggering warnings during kbuild
> > +       chmod 0755 "${pkgdirbase}" || true
> 
> 
> Please remove this.
> 
> The warning is emitted by
> 
>   find . -name '*.usyms' | xargs rm -f
> 
> in scripts/remove-stale-files.
> 
> 
> I will apply this first:
> https://lore.kernel.org/linux-kbuild/20240717181340.1518266-1-masahiroy@kernel.org/T/#u

Thank you very much for the analysis and fix!

> > +
> > +       ${MAKE}
> 
> 
> This will cause a revision mismatch between the package and
> 'uname -a' in the installed kernel image.
> 
> You execute scripts/build-version in scripts/Makefile.package,
> and once again during ${MAKE}.
> 
> 
> The revision in include/generated/utsversion.h is bigger
> than ${pkgrel}.
> 
> 
> kernel.spec does like this:
> 
>   %{make} %{makeflags} KERNELRELEASE=%{KERNELRELEASE}
> KBUILD_BUILD_VERSION=%{release}
> 
> 
> 
> You need to do something similar.

Ack, thanks!

