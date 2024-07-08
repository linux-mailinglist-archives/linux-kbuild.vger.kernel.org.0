Return-Path: <linux-kbuild+bounces-2429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A82092AA3E
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 22:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 042F41F22E56
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 20:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3C61CABA;
	Mon,  8 Jul 2024 20:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TgsODtK7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AAC7494;
	Mon,  8 Jul 2024 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720468850; cv=none; b=u0SMjW/E3vTvxG7d2bNd5uDD3Ba0mRRHr/y7Xq0yKnejLg8BwUlyeehf2ImrsJIbF+61WjTbZIhWT+I6Wha8GrtBbJZsaZ71uIQt78u+jylXUWZGVUrC/vmvWksUALZwUs6A0t1yb2MQ7XOUf/rKcGlGRuJJoFvH96z6ruqXgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720468850; c=relaxed/simple;
	bh=DuceHzwjAxWY+4M0ma5lxpxvTWPvntTV8l4RN0/Kcek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcMFDsYfi8DgG4hz6S4nJW9T9fsrMnKF/YZ1255U6JQdN3jgQI29L9KwlAroBMYR2GluxcmYDy/UCxwCHB4qnhRwApY7RXNYtRrXkI9PaIvg38LJ5w6C9ULkFTcYjvdydSeZaa7CQUybUGqrZU65SHdwsjWRC6UXnSeMbLXRu4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TgsODtK7; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720468840;
	bh=DuceHzwjAxWY+4M0ma5lxpxvTWPvntTV8l4RN0/Kcek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TgsODtK7AQfwTMAzYmozq+DH13XZFmOW4jOxqdiaVgOJukWVypS3g1bsjfJzt2grZ
	 ljl0Lu3hNw8Zse8/WbQwGJ3pT3QSKrPDBMzJ1AG+QAaX+kiqW/RV9pHyACAcTdIyh6
	 mgbNa0g2AvsISf6W9WPlHf5ds0Lo5+p43QkpRlz0=
Date: Mon, 8 Jul 2024 22:00:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add script and target to generate pacman
 package
Message-ID: <005e1bca-0061-452e-b8ce-0b8e99bda757@t-8ch.de>
References: <20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net>
 <20240708055046.GB1968570@thelio-3990X>
 <9884e892-1d45-4854-971c-5963e4661a1b@t-8ch.de>
 <20240708165342.GA2417540@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708165342.GA2417540@thelio-3990X>

On 2024-07-08 09:53:42+0000, Nathan Chancellor wrote:
> On Mon, Jul 08, 2024 at 05:56:44PM +0200, Thomas Weißschuh wrote:
> > On 2024-07-07 22:50:46+0000, Nathan Chancellor wrote:
> > > On Sat, Jul 06, 2024 at 09:33:46AM +0200, Thomas Weißschuh wrote:

<snip>

> > > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > > new file mode 100644
> > > > index 000000000000..fe899c77a976
> > > > --- /dev/null
> > > > +++ b/scripts/package/PKGBUILD
> > > > @@ -0,0 +1,83 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> > > > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > > > +
> > > > +pkgbase=linux-upstream
> > > > +pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> > > > +pkgver="${KERNELRELEASE//-/_}"
> > > > +pkgrel="$KBUILD_REVISION"
> > > > +pkgdesc='Linux'
> > > > +url='https://www.kernel.org/'
> > > > +arch=(any)
> > > 
> > > I see why you went this way but this feels a little dangerous because
> > > this means the package will be installable on architectures other than
> > > the one that it is built for. I think a better solution for this problem
> > > would be moving arch back to $UTS_MACHINE but setting CARCH to that same
> > > value in scripts/Makefile.package above. This diff works for me,
> > > allowing me to build an aarch64 package on x86_64:
> > 
> > This is what I used in v1 of the patch.
> 
> You had $UTS_MACHINE as arch but I don't see where CARCH was set for
> makepkg? If you tried to cross compile with v1, there was an error
> because the default CARCH value (the host) does not match the arch
> value, but explicitly passing CARCH to makepkg with $UTS_MACHINE should
> allow makepkg to build a package that is only installable on that
> machine?

Indeed.

> > But I felt that this only works by pure chance.
> 
> I don't think it is by pure chance, it should be entirely based off of the
> builder's ARCH value, no? I might be misunderstanding something though.

"Chance" for the fact that UTS_MACHINE and Arch Linux CARCH are
matching.

> > IMO users of this feature should know what they are doing.
> > 
> > That said, if anybody has strong opinions on this, I'll be happy to change it.
> 
> I don't feel strongly about it but I think this is different from pretty
> much all of the other package builds, which only build a package that is
> installable/usable on one archictecture, and the solution seems
> simple/robust enough.

I'll pick up your proposal and will send v3 with it and your tags.

