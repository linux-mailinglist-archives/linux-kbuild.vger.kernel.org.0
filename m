Return-Path: <linux-kbuild+bounces-2574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19A934061
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504AE283062
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1569A181BA2;
	Wed, 17 Jul 2024 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="X30IaqNl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C84180048;
	Wed, 17 Jul 2024 16:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721233597; cv=none; b=dQo8b4LGpW+0ggAOSAkYoDRvp/vVOalx72O1KsxftFvJDSdd9+2jVkI+sQpXxvoRSGj33lLg8vWcuwDyEftjbyHkPZ18n3IXDvWwTC0mbiMl7VbPZUKxT3Ua0E2coD7mKVRBT5o8HYG77EkBwdxNG/zIlvtILFb5M3e310nyI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721233597; c=relaxed/simple;
	bh=ECSWe8Ie78lKI4I4s+n/8RNcHhC1LaiWsiWtDNU4PlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1wrA+QY/X+hDT8MRPAAZyAW9mV+NyM/My6udUltHUbg12pQItLzK4SeoEXOSwJvmknldxGpjL0efqEw1NswR/+bA/jvvPe0FPiw/eulgfmMXy7kGto4K5wXWLo7+w4/oPG+rN3epyAQi+PJXbktwfCNfxlJCtPOBfldrC0nwrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=X30IaqNl; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721233590;
	bh=ECSWe8Ie78lKI4I4s+n/8RNcHhC1LaiWsiWtDNU4PlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X30IaqNloho99Kelfts/4do634O+I6pkc3fzeWzoQVmC3X4y6B/5F7pvo4oV2mHv/
	 4vhsoSYObyk5zQbOl69VeIaeGi5w6e2f5SEGdqMpG11YaCngacK0w4buhAy2irY031
	 mvwrhTA13c8sVc8C1624pbF9IZiQbZxHEqaRjhIM=
Date: Wed, 17 Jul 2024 18:26:29 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Christian Heusel <christian@heusel.eu>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <c61c5996-592d-4669-a991-d9eb22cca88d@t-8ch.de>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <e8786093-384a-4a7e-a536-3915cd4f933f@heusel.eu>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8786093-384a-4a7e-a536-3915cd4f933f@heusel.eu>

On 2024-07-17 15:48:05+0000, Christian Heusel wrote:
> On 24/07/16 07:52PM, Thomas Weißschuh wrote:
> > pacman is the package manager used by Arch Linux and its derivates.
> > Creating native packages from the kernel tree has multiple advantages:
> >
> > * The package triggers the correct hooks for initramfs generation and
> >   bootloader configuration
> > * Uninstallation is complete and also invokes the relevant hooks
> > * New UAPI headers can be installed without any manual bookkeeping
> 
> Additionally, to what already has been mentioned above, this would also
> greatly simplify the instructions and the needed setup for bisection if
> people run into regressions, as for example in the following documents:
> 
> - https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html
> - https://wiki.archlinux.org/title/Bisecting_bugs_with_Git
> 
> So thank you (up front) for your effort's here, this could greatly help
> to improve the debugging experience!

Sounds reasonable, but IMO this can be done after the original
implementation is done.

> I have tested this patch by just running "make pacman-pkg" and
> everything worked as expected (currently booted from the generated
> kernel).

Thanks for the test!

> As noted in another mail in this thread it would also be cool if just
> plain makepkg could be executed (i.e. -s/--syncdeps, -i/--install and
> --packagelist) would be interesting, but I think with the current setup
> this could become a bit complicated 🤔

Yes, this will be complicated, given some variables are set before
executing makepkg.

> Maybe it's a possiblity to have a "make pacman-pkgbuild" and then expect
> the user to interact with the created PKGBUILD..? Idk if that is
> actually better

This would be different from the other `foo-pkg` targets.
And it would still not be clear how to handle the overriden variables.

> Also is there a canonical way to be notified whenever people report
> issues with this or there are patches to it? I'd love to help out if
> that is desirable from your side ..

I've added you to my Cc list.

> Also I have written some more comments inline below...
> 
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
> >  		  arch/$(SRCARCH)/include/generated .objdiff \
> > -		  debian snap tar-install \
> > +		  debian snap tar-install PKGBUILD pacman \
> >  		  .config .config.old .version \
> >  		  Module.symvers \
> >  		  certs/signing_key.pem \
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index bf016af8bf8a..0aaa0832279c 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -141,6 +141,19 @@ snap-pkg:
> >  	cd $(objtree)/snap && \
> >  	snapcraft --target-arch=$(UTS_MACHINE)
> >  
> > +# pacman-pkg
> > +# ---------------------------------------------------------------------------
> > +
> > +PHONY += pacman-pkg
> > +pacman-pkg:
> > +	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> > +	+objtree="$(realpath $(objtree))" \
> > +		BUILDDIR=pacman \
> > +		CARCH="$(UTS_MACHINE)" \
> > +		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> > +		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> > +		makepkg
> > +
> >  # dir-pkg tar*-pkg - tarball targets
> >  # ---------------------------------------------------------------------------
> >  
> > @@ -221,6 +234,7 @@ help:
> >  	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
> >  	@echo '  snap-pkg            - Build only the binary kernel snap package'
> >  	@echo '                        (will connect to external hosts)'
> > +	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
> >  	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
> >  	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
> >  	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
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
> 
> I just wondered whether the version format was chosen deliberatly
> here, as it yields something like 6.10.0_04474_ga1cc539bf882-6 for
> example. A similar output is generated by the pkgver() function
> suggested in the Wiki which would give something like this:
> v6.8.rc5.r84.g9b9c280-1.
> 
> https://wiki.archlinux.org/title/VCS_package_guidelines#Git
> 
> The most notable difference is the usage of underscores vs. dots, which
> is not an issue but also not usually a thing with arch packages.

It was chosen to be similar to the other `foo-pkg` targets.
But if there is a documented standard way for Arch, I'm in favor of
using it.

> > +# The PKGBUILD is evaluated multiple times.
> > +# Running scripts/build-version from here would introduce inconsistencies.
> > +pkgrel="${KBUILD_REVISION}"
> 
> As far as I understand this means that the pkgrel is incremented on
> every build, which is not really usual. The 'pkgrel' variable is
> typically used to indicate changes to the binary package that are
> besides an upstream release, i.e. when one changes a compile flag or
> similar.
> 
> Also on a new upstream release this flag would be reset to 1, while here
> we increment the variable monotonically.
> 
> So this is not an issue per-se, just a bit unusual compared to how we
> handle packages in Arch itself.

It is unusual for Arch, but IMO the best fit.
The other alternative would be to fix pkgrel to "1" and integrate the
version counter into the version itself.

> See https://wiki.archlinux.org/title/PKGBUILD#pkgrel
> 
> > +pkgdesc='Linux'
> 
> Maybe expand the description here a little to something like "The Linux
> kernel and modules as built from the upstream PKGBUILD", just "Linux"
> seems to be a bit short.

Ack.

> > +url='https://www.kernel.org/'
> > +# Enable flexible cross-compilation
> > +arch=(${CARCH})
> > +license=(GPL-2.0-only)
> > +makedepends=(
> > +	base-devel
> > +	bc
> > +	cpio
> > +	gettext
> > +	libelf
> > +	openssl
> > +	pahole
> > +	perl
> > +	python
> > +	rsync
> > +	tar
> > +)
> 
> Including base-devel is to the makedepends is pretty sneaky, although
> none of the make dependencies will ever be installed as we do not sync
> the dependencies for the packagebuild as I have noted on the beginning
> of this mail (--syncdeps).

They won't be installed, but still be validated.

