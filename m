Return-Path: <linux-kbuild+bounces-2385-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB5E927DDB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 21:33:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CBE01C2245D
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 19:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D167344A;
	Thu,  4 Jul 2024 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pigS2z5e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94F131736;
	Thu,  4 Jul 2024 19:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720121611; cv=none; b=MuPMheS3zpzWkU6R3pXmnW2MmkyeI1x/AmehAG3m7Boyug8XIyJMsuM3JA9Xnzyg6i7AXYHx8SVEo1ZAHVs7IjFiwodlJeMkF43I2n+BBweNB3Gc+zR7qNatbw1MfJffOUu/PPYvoQVNJ6BchZehSmXSTLrvRv+Ea1EFNMD6VmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720121611; c=relaxed/simple;
	bh=JUEzBsblFz0LTrgNHbshd4E+vAIOOPSbCwfybvfKwoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2CHtweGwzT9BHfcykZQs3cGum9uBHWcjOTmE5lDXzPK+bdmt7pWTDzdQQvORONOyj464I7nhd1qHa31bV5X9hJOg/0xRea4LhI71D7/aHh68st2hYjH4BNiXQS+7ZqNV29uWxyk9ejg5JgEy9I4pxY3+TiK9QspwLI3C/ybJ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pigS2z5e; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720121606;
	bh=JUEzBsblFz0LTrgNHbshd4E+vAIOOPSbCwfybvfKwoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pigS2z5ezmgcE1AhiGiLJUZ7hPRIA5OPsGBouaMkxm4vz0vW0eWv434JKct0QrORm
	 /5qDwxDevK0Ir3p/MkDZaA+qqU/vZC9xBIavUH0sKCbYl5K9LtGHpXwvX0nEge0j/i
	 LcwJ6nEYKUCpKbnLgTdghMGSQEOZZ618fNWu8G6g=
Date: Thu, 4 Jul 2024 21:33:25 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: add script and target to generate pacman package
Message-ID: <c1aa960c-27de-41f9-bdb3-d5cad954047a@t-8ch.de>
References: <20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net>
 <63c53ab962254e49d0eb3a67a067b48023d679b0.camel@archlinux.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63c53ab962254e49d0eb3a67a067b48023d679b0.camel@archlinux.org>

Hi,

thanks for the review!

On 2024-07-04 21:02:50+0000, Jan Alexander Steffens (heftig) wrote:
> On Thu, 2024-07-04 at 18:36 +0200, Thomas Weißschuh wrote:
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > new file mode 100644
> > index 000000000000..29daf357edc1
> > --- /dev/null
> > +++ b/scripts/package/PKGBUILD
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> 
> Nitpick: Normally these lines are sorted newest to oldest, with the
> current maintainer(s) at the top.

Ack.

> > +
> > +pkgbase=linux-upstream
> > +pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> > +pkgver="${KERNELRELEASE//-/_}"
> > +pkgrel="$KBUILD_REVISION"
> > +pkgdesc='Linux'
> > +url='https://www.kernel.org/'
> > +arch=("$UTS_MACHINE")
> > +options=(!strip)
> 
> You should have !debug !strip here, otherwise makepkg can attempt (and
> will fail) to gather source files, creating an empty
> /usr/src/debug/$pkgbase.

Ack.

> Might also be worth considering !buildflags (to turn off injection of
> CFLAGS etc) and !makeflags (to turn off injection of MAKEFLAGS).

Ack.

!makeflags doesn't really help because the MAKEFLAGS inherited from
Kbuild are still overwritten, but with empty values.
Which is why the KBUILD_MAKEFLAGS variable is used.

But it's still better to have for safety.

> 
> > +license=(GPL-2.0-only)
> > +
> > +build() {
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> 
> I think you can have this export at the top level instead of in each
> function.

That doesn't seem to work, MAKEFLAGS seem to be set before the function
is called.

> 
> > +  cd "$objtree"
> > +
> > +  ${MAKE} -f "${srctree}/Makefile"
> > +
> > +}
> > +
> > +package_linux-upstream() {
> > +  pkgdesc="The $pkgdesc kernel and modules"
> > +
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +  cd "$objtree"
> > +  local modulesdir="$pkgdir/usr/$MODLIB"
> > +
> > +  echo "Installing boot image..."
> > +  # systemd expects to find the kernel here to allow hibernation
> > +  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
> > +  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
> 
> An invocation of make that could also use ${MAKE} for consistency.

Ack, Nathan also proposed this.

> > +
> > +  # Used by mkinitcpio to name the kernel
> > +  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
> > +
> > +  echo "Installing modules..."
> > +  ${MAKE} INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
> > +    DEPMOD=/doesnt/exist modules_install  # Suppress depmod
> > +
> > +  # remove build link
> > +  rm -f "$modulesdir/build"
> > +}
> > +
> > +package_linux-upstream-headers() {
> > +  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
> > +
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +  cd "$objtree"
> > +  local builddir="$pkgdir/usr/$MODLIB/build"
> > +
> > +  echo "Installing build files..."
> > +  "$srctree/scripts/package/install-extmod-build" "$builddir"
> 
> Should we be using this script upstream as well instead of our
> homegrown mess of install commands?

Maybe. It is missing a few things like resolve_btfids.
In the kernel repo if something is missing we can fix the script itself.
Downstream would still require custom logic.

> > +
> > +  echo "Adding symlink..."
> > +  mkdir -p "$pkgdir/usr/src"
> > +  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
> > +}
> > +
> > +package_linux-upstream-api-headers() {
> > +  pkgdesc="Kernel headers sanitized for use in userspace"
> > +  provides=(linux-api-headers)
> > +  conflicts=(linux-api-headers)
> > +
> > +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> > +  cd "$objtree"
> > +
> > +  ${MAKE} headers_install INSTALL_HDR_PATH="$pkgdir/usr"
> > +}
> > +
> > +# vim:set ts=8 sts=2 sw=2 et:

