Return-Path: <linux-kbuild+bounces-2427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4A92A68A
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 17:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CECB1F21F5C
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 15:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D49144D22;
	Mon,  8 Jul 2024 15:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jdYD5G+X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29787EC7;
	Mon,  8 Jul 2024 15:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454219; cv=none; b=AsLcWuOR+xjVVrT2yEHSTYCOGfswJRvYLgvxIe8NvevInALVjxFNsxTcKgDp0/j+Cfr+DAGv5QmimH+gtIQAUzLTotpmXSIqaynoffStD+q8tyYyT0+32kF4xP3hAnQKW/i7cSZdITFeYYT21sCdllwY9sCcR9fAgNNLNEQr+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454219; c=relaxed/simple;
	bh=ELgLOLfZp8pULd50kbfoMBhVzoyv22ylbX9tUd2mbWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFRcKDlIOywtp6L0pIeKVHlresl2x3Bwqa/oD/4JuSWY8gLeL2uodTwFoS/U5vHQHiNMrLx+BgTfzDfjKbUjoKqIQUNLFVXBiA8OTzDQQCzjKqXPCSF612DxWVYv+t7gSOVNHePsjL5WRZorYQp1srwBzKfhJ6l0T/X4p/F3NhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jdYD5G+X; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720454205;
	bh=ELgLOLfZp8pULd50kbfoMBhVzoyv22ylbX9tUd2mbWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdYD5G+XEtSDuCkLnqmVFG3CYJPO6aMkyq6BE6Iw/odnfeScHELwJbv1/UcQnUpaA
	 iafJA2KJwOupi0gsACrAphm3n8+ziI9h/vQqIQ8b07jHQ4qO2mTS5LVO0NxPT0YXzu
	 IrVwuYBLK9n8h8sbHgfVk9K1e1Yz5q6mICwOKv7s=
Date: Mon, 8 Jul 2024 17:56:44 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add script and target to generate pacman
 package
Message-ID: <9884e892-1d45-4854-971c-5963e4661a1b@t-8ch.de>
References: <20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net>
 <20240708055046.GB1968570@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708055046.GB1968570@thelio-3990X>

Hi Nathan,

On 2024-07-07 22:50:46+0000, Nathan Chancellor wrote:
> On Sat, Jul 06, 2024 at 09:33:46AM +0200, Thomas Weißschuh wrote:
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
> Thanks a lot for addressing my comments. From a PKGBUILD perspective,
> this looks good to me (I have a couple more comments below). I am not as
> familiar with the Kbuild packaging infrastructure, so Masahiro might
> have more comments on that, but it works for me in my basic testing so
> consider it:
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> 
> > ---
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
> >  scripts/Makefile.package | 15 +++++++++
> >  scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 104 insertions(+)

<snip>

> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > new file mode 100644
> > index 000000000000..fe899c77a976
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
> > +arch=(any)
> 
> I see why you went this way but this feels a little dangerous because
> this means the package will be installable on architectures other than
> the one that it is built for. I think a better solution for this problem
> would be moving arch back to $UTS_MACHINE but setting CARCH to that same
> value in scripts/Makefile.package above. This diff works for me,
> allowing me to build an aarch64 package on x86_64:

This is what I used in v1 of the patch.
But I felt that this only works by pure chance.
IMO users of this feature should know what they are doing.

That said, if anybody has strong opinions on this, I'll be happy to change it.

> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 8c0c80f8bec0..a5b5b899d90c 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -151,6 +151,7 @@ pacman-pkg:
>  		srctree="$(realpath $(srctree))" \
>  		objtree="$(realpath $(objtree))" \
>  		BUILDDIR="$(realpath $(objtree))/pacman" \
> +		CARCH="$(UTS_MACHINE)" \
>  		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
>  		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
>  		makepkg
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index fe899c77a976..7f1a4588c3d3 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -8,7 +8,7 @@ pkgver="${KERNELRELEASE//-/_}"
>  pkgrel="$KBUILD_REVISION"
>  pkgdesc='Linux'
>  url='https://www.kernel.org/'
> -arch=(any)
> +arch=($UTS_MACHINE)
>  options=(!debug !strip !buildflags !makeflags)
>  license=(GPL-2.0-only)
>  
> 
> > +options=(!debug !strip !buildflags !makeflags)
> > +license=(GPL-2.0-only)
> > +

<snip>

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
> > +  echo "Installing System.map and config..."
> > +  cp System.map "$builddir/System.map"
> > +  cp .config "$builddir/.config"
> 
> Remove the dot on the installation location so that it is more visible.

This is the location used by the downstream linux-headers package.
I can add a symlink for better visibility, though.

> > +  echo "Adding symlink..."
> > +  mkdir -p "$pkgdir/usr/src"
> > +  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
> > +}
> > +

<snip>

