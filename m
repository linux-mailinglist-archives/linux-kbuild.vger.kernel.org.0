Return-Path: <linux-kbuild+bounces-2428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE692A7A6
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 18:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1175B2090C
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 16:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1431465BD;
	Mon,  8 Jul 2024 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmhgnyXz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A514532B;
	Mon,  8 Jul 2024 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720457626; cv=none; b=Y+gEQfU0mNEUwrf32BfHM9cgMzwKo2a11L17dHS70fqFIdFXsjgAE9C8phNMaD/qQgtKF6/lJ8ig6H1O02PL782kWqA3vbG5o8OfuFyOo6ceQ+cvY6YgsWY/9OYwTa+YpOxFA8qlWMWjvLFVgLcLJqYAzaL8E2x0RPcy/409Bko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720457626; c=relaxed/simple;
	bh=FCryOTObg5pKp7VCt0NeoJMhOHHA4GbhkZTncEgyNQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzV3g/TNSx1CIS5I2j2N/PZxuf5VPmq8SbI6uRoOgLm4Ch86CMgRSml/s12qCb8ZAqL5miJxRDvFFD6+st81KF1GwoToueQMtVc/YqqAN4M9+Veutao+N0hSd6/51TM8lPJhdgawmyuEqSioEuZbow06z067qNBkCmOyRZxMRxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmhgnyXz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F8DC116B1;
	Mon,  8 Jul 2024 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720457625;
	bh=FCryOTObg5pKp7VCt0NeoJMhOHHA4GbhkZTncEgyNQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmhgnyXz02DisVxG5jMEKvqdnM7ZS6pKqa4VKSxai/AI8RbLrfyv8I9OViPo2pjKh
	 kuP5KgZkcjKy+OihckUTDl2m/Yi7PElPK7ezbau+x/UucY/JAGfpBO2ueBtgBxeUu6
	 lQeUXVbMQEg3zLfLGfIssijFPnfGEoE3YvVCPxEgBTlVyyO5o5Xt8jDd/UxipEzfZP
	 V6hrDC9iqCTO+B6fB+OZHmd0fi9nJSs4KK2esLsrqlmwaWPmaywq9XSTZ7nYU+N1lz
	 q8wO+WMdGDY4ps6nUBY+3Z3WlyXXfB6yM39l9wAGs9l9hUi37qURyGV1Bj2fxDGCl3
	 bW7xkJQ9KYdVw==
Date: Mon, 8 Jul 2024 09:53:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add script and target to generate pacman
 package
Message-ID: <20240708165342.GA2417540@thelio-3990X>
References: <20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net>
 <20240708055046.GB1968570@thelio-3990X>
 <9884e892-1d45-4854-971c-5963e4661a1b@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9884e892-1d45-4854-971c-5963e4661a1b@t-8ch.de>

On Mon, Jul 08, 2024 at 05:56:44PM +0200, Thomas Weiﬂschuh wrote:
> Hi Nathan,
> 
> On 2024-07-07 22:50:46+0000, Nathan Chancellor wrote:
> > On Sat, Jul 06, 2024 at 09:33:46AM +0200, Thomas Weiﬂschuh wrote:
> > > pacman is the package manager used by Arch Linux and its derivates.
> > > Creating native packages from the kernel tree has multiple advantages:
> > > 
> > > * The package triggers the correct hooks for initramfs generation and
> > >   bootloader configuration
> > > * Uninstallation is complete and also invokes the relevant hooks
> > > * New UAPI headers can be installed without any manual bookkeeping
> > > 
> > > The PKGBUILD file is a simplified version of the one used for the
> > > downstream Arch Linux "linux" package.
> > > Extra steps that should not be necessary for a development kernel have
> > > been removed and an UAPI header package has been added.
> > > 
> > > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > 
> > Thanks a lot for addressing my comments. From a PKGBUILD perspective,
> > this looks good to me (I have a couple more comments below). I am not as
> > familiar with the Kbuild packaging infrastructure, so Masahiro might
> > have more comments on that, but it works for me in my basic testing so
> > consider it:
> > 
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks!
> 
> > 
> > > ---
> > > Changes in v2:
> > > - Replace ${MAKE} with $MAKE for consistency with other variables
> > > - Use $MAKE for "-s image_name"
> > > - Avoid permission warnings from build directory
> > > - Clarify reason for /build symlink removal
> > > - Install System.map and config
> > > - Install dtbs where available
> > > - Allow cross-build through arch=any
> > > - Sort Contributor/Maintainer chronologically
> > > - Disable some unneeded makepkg options
> > > - Use DEPMOD=true for consistency with rpm-package
> > > - Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net
> > > ---
> > >  .gitignore               |  6 ++++
> > >  scripts/Makefile.package | 15 +++++++++
> > >  scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 104 insertions(+)
> 
> <snip>
> 
> > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > new file mode 100644
> > > index 000000000000..fe899c77a976
> > > --- /dev/null
> > > +++ b/scripts/package/PKGBUILD
> > > @@ -0,0 +1,83 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +# Maintainer: Thomas Weiﬂschuh <linux@weissschuh.net>
> > > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > > +
> > > +pkgbase=linux-upstream
> > > +pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> > > +pkgver="${KERNELRELEASE//-/_}"
> > > +pkgrel="$KBUILD_REVISION"
> > > +pkgdesc='Linux'
> > > +url='https://www.kernel.org/'
> > > +arch=(any)
> > 
> > I see why you went this way but this feels a little dangerous because
> > this means the package will be installable on architectures other than
> > the one that it is built for. I think a better solution for this problem
> > would be moving arch back to $UTS_MACHINE but setting CARCH to that same
> > value in scripts/Makefile.package above. This diff works for me,
> > allowing me to build an aarch64 package on x86_64:
> 
> This is what I used in v1 of the patch.

You had $UTS_MACHINE as arch but I don't see where CARCH was set for
makepkg? If you tried to cross compile with v1, there was an error
because the default CARCH value (the host) does not match the arch
value, but explicitly passing CARCH to makepkg with $UTS_MACHINE should
allow makepkg to build a package that is only installable on that
machine?

> But I felt that this only works by pure chance.

I don't think it is by pure chance, it should be entirely based off of the
builder's ARCH value, no? I might be misunderstanding something though.

> IMO users of this feature should know what they are doing.
> 
> That said, if anybody has strong opinions on this, I'll be happy to change it.

I don't feel strongly about it but I think this is different from pretty
much all of the other package builds, which only build a package that is
installable/usable on one archictecture, and the solution seems
simple/robust enough.

> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index 8c0c80f8bec0..a5b5b899d90c 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -151,6 +151,7 @@ pacman-pkg:
> >  		srctree="$(realpath $(srctree))" \
> >  		objtree="$(realpath $(objtree))" \
> >  		BUILDDIR="$(realpath $(objtree))/pacman" \
> > +		CARCH="$(UTS_MACHINE)" \
> >  		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> >  		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
> >  		makepkg
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > index fe899c77a976..7f1a4588c3d3 100644
> > --- a/scripts/package/PKGBUILD
> > +++ b/scripts/package/PKGBUILD
> > @@ -8,7 +8,7 @@ pkgver="${KERNELRELEASE//-/_}"
> >  pkgrel="$KBUILD_REVISION"
> >  pkgdesc='Linux'
> >  url='https://www.kernel.org/'
> > -arch=(any)
> > +arch=($UTS_MACHINE)
> >  options=(!debug !strip !buildflags !makeflags)
> >  license=(GPL-2.0-only)
> >  
> > 
> > > +options=(!debug !strip !buildflags !makeflags)
> > > +license=(GPL-2.0-only)
> > > +
> 
> <snip>
> 
> > > +
> > > +package_linux-upstream-headers() {
> > > +  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
> > > +
> > > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > > +  cd "$objtree"
> > > +  local builddir="$pkgdir/usr/$MODLIB/build"
> > > +
> > > +  echo "Installing build files..."
> > > +  "$srctree/scripts/package/install-extmod-build" "$builddir"
> > > +
> > > +  echo "Installing System.map and config..."
> > > +  cp System.map "$builddir/System.map"
> > > +  cp .config "$builddir/.config"
> > 
> > Remove the dot on the installation location so that it is more visible.
> 
> This is the location used by the downstream linux-headers package.

Ah, I did not realize that!

> I can add a symlink for better visibility, though.

It probably isn't that big of a deal if it is in the package somewhere,
I don't feel strongly enough about it.

> > > +  echo "Adding symlink..."
> > > +  mkdir -p "$pkgdir/usr/src"
> > > +  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
> > > +}
> > > +
> 
> <snip>

