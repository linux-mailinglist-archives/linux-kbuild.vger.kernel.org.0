Return-Path: <linux-kbuild+bounces-2614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9FA93850F
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 16:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9FC1C20A2A
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 14:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BD627453;
	Sun, 21 Jul 2024 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="snakp6fN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A569460;
	Sun, 21 Jul 2024 14:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721573862; cv=none; b=GA9Brz0dPIda9M6wwtm+GDaRngwL5QNNzXrJDq5sDXadSj2NHQl2AEuwG13wpqzDaoToQWb6r8GRDvRAju6bMZRaeXo/We8xZ5iWz9ul5qmm7G4dwLRy4wZHgd2aUQEnZK6rGqr0I3bEQ21/MVXqpQo5ZLEFEiucXQB3EoqyXAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721573862; c=relaxed/simple;
	bh=D54RaVxUXHr4buhNqvebTv7kMRmOfSyH9wezaMcVd4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFv1FUAViFRZWEvpR6QQls0Y5sL0RJ318xHZjF7AvhoKjXbXPxl3rYAfKXaRw18B//8ip0fzHNwj0xFlXwMrQUyg7s/esGsc3pSTTcH61do3QV06RBNkaaKDj5+vodw/gawS0T4wZTWENk9nQ/u5rY0mtylpW7kizaju6ZMkmik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=snakp6fN; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721573849;
	bh=D54RaVxUXHr4buhNqvebTv7kMRmOfSyH9wezaMcVd4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snakp6fNSDbZdGVMwGvhcUS2ic2+Eam7fvcgtG6PbH4Gva7+ijB4N9bjS14E+tDVj
	 +kD5hH6yMFB+uBn5yIBLesxcrnIaLsbZajP4w3ip7KzV72JoV0iLywN3Axmhpynki/
	 ZMwUeEQ/YU9QwOXRHx7OB6tJmGCrkbBHJ/AkhnjY=
Date: Sun, 21 Jul 2024 16:57:29 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v7] kbuild: add script and target to generate pacman
 package
Message-ID: <5db8b1e9-894b-4626-b635-420078df10ce@t-8ch.de>
References: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>
 <20240721033209.GA545406@thelio-3990X>
 <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>
 <20240721121109.GA3599565@thelio-3990X>
 <CAK7LNAQyRaMgcgg5urnJU8ePqULAOB6TkFDjRVEwjEZEvT6s-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQyRaMgcgg5urnJU8ePqULAOB6TkFDjRVEwjEZEvT6s-g@mail.gmail.com>

On 2024-07-21 22:42:12+0000, Masahiro Yamada wrote:
> On Sun, Jul 21, 2024 at 9:11 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Hi Masahiro,
> >
> > On Sun, Jul 21, 2024 at 03:58:49PM +0900, Masahiro Yamada wrote:
> > > On Sun, Jul 21, 2024 at 12:32 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > On Sat, Jul 20, 2024 at 11:18:12AM +0200, Thomas Weißschuh wrote:
> > > > > pacman is the package manager used by Arch Linux and its derivates.
> > > > > Creating native packages from the kernel tree has multiple advantages:
> > > > >
> > > > > * The package triggers the correct hooks for initramfs generation and
> > > > >   bootloader configuration
> > > > > * Uninstallation is complete and also invokes the relevant hooks
> > > > > * New UAPI headers can be installed without any manual bookkeeping
> > > > >
> > > > > The PKGBUILD file is a modified version of the one used for the
> > > > > downstream Arch Linux "linux" package.
> > > > > Extra steps that should not be necessary for a development kernel have
> > > > > been removed and an UAPI header package has been added.
> > > > >
> > > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > > ---
> > > >
> > > > I think this looks really solid now, thanks again for the PACMAN_PKGBASE
> > > > addition.
> > > >
> > > > I tested building Arch Linux's configuration for x86_64 and booting it
> > > > in a VM. I built Fedora's configuration for aarch64 just to test the
> > > > cross building aspect and making sure the result of various bits that we
> > > > added that would not affect x86 (such as the dtb installation) looked
> > > > reasonable.
> > > >
> > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > I believe this is a separate issue, but
> > > Debian/Ubuntu provides a 'makepkg' package, which fails
> > > with 'User defined signal 1' error.
> > >
> > > After 'sudo apt install makepkg',
> > >
> > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ cat
> > > /etc/os-release
> > > PRETTY_NAME="Ubuntu 24.04 LTS"
> > > NAME="Ubuntu"
> > > VERSION_ID="24.04"
> > > VERSION="24.04 LTS (Noble Numbat)"
> > > VERSION_CODENAME=noble
> > > ID=ubuntu
> > > ID_LIKE=debian
> > > HOME_URL="https://www.ubuntu.com/"
> > > SUPPORT_URL="https://help.ubuntu.com/"
> > > BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
> > > PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
> > > UBUNTU_CODENAME=noble
> > > LOGO=ubuntu-logo
> > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > > makepkg --version
> > > makepkg (pacman) 6.0.2
> > > Copyright (c) 2006-2021 Pacman Development Team <pacman-dev@archlinux.org>.
> > > Copyright (C) 2002-2006 Judd Vinet <jvinet@zeroflux.org>.
> > >
> > > This is free software; see the source for copying conditions.
> > > There is NO WARRANTY, to the extent permitted by law.
> > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ git
> > > log --oneline -2
> > > 5dcaebb67ad9 (HEAD) kbuild: add script and target to generate pacman package
> > > 41c196e567fb (tag: next-20240719, origin/master, origin/HEAD) Add
> > > linux-next specific files for 20240719
> > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > > make defconfig  pacman-pkg
> > > *** Default configuration is based on 'x86_64_defconfig'
> > > #
> > > # No change to .config
> > > #
> > > objtree="/home/masahiro/ref/linux-next" \
> > > BUILDDIR="" \
> >
> > It is not related to this issue but I don't think this should be empty.
> > 'realpath pacman' does not appear to work here, I was able to fix this
> > with the following diff:
> >
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index 94357f47d2fa..b0fd44a40075 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -148,7 +148,7 @@ PHONY += pacman-pkg
> >  pacman-pkg:
> >         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> >         +objtree="$(realpath $(objtree))" \
> > -               BUILDDIR="$(realpath pacman)" \
> > +               BUILDDIR="$(realpath $(objtree))/pacman" \
> 
> 
> Right.
> 
> $(realpath pacman) expands to empty
> if 'pacman' does not exist yet.
> Your fix is correct.

I'm wondering how it worked for me, as I specifically tested this case.
But I'm fine with the proposal.

Shouldn't it be "$(realpath ./pacman)" though?

> 
> >                 CARCH="$(UTS_MACHINE)" \
> >                 KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> >                 KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> >
> >
> > > CARCH="x86_64" \
> > > KBUILD_MAKEFLAGS="rR --no-print-directory" \
> > > KBUILD_REVISION="4" \
> > > makepkg
> > >
> > > ==> ERROR: An unknown error has occurred. Exiting...
> > > User defined signal 1
> > > make[3]: *** [scripts/Makefile.package:150: pacman-pkg] Error 138
> > > make[2]: *** [Makefile:1538: pacman-pkg] Error 2
> > > make[1]: *** [/home/masahiro/ref/linux-next/Makefile:347:
> > > __build_one_by_one] Error 2
> > > make: *** [Makefile:224: __sub-make] Error 2
> > >
> > > Do you know anything?
> >
> > Adding '-x' to the interpreter line in /usr/bin/makepkg shows that
> > pacman is implicitly required for makepkg to function, so you'll need to
> > install pacman-package-manager as well. However, even with it installed,
> > the build will fail because you will be unable to perform the dependency
> > checking (since pacman won't be managing the packages).

It seems very weird that there is no dependency, not even a soft one,
from makepkg to pacman.

> > I think the traditional solution for this situation (building a
> > distribution's package on a distribution other than the one the package
> > is being built for) is using an OPTS variable to allow the user to pass
> > in the dependency checking skip flag (that's what I do for RPM builds on
> > Arch Linux), so perhaps MAKEPKGOPTS so that you can use MAKEPKGOPTS=-d?
> > With this diff and that variable value, the build starts within makepkg
> > for me.
> >
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index b0fd44a40075..4a80584ec771 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -152,7 +152,7 @@ pacman-pkg:
> >                 CARCH="$(UTS_MACHINE)" \
> >                 KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> >                 KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> > -               makepkg
> > +               makepkg $(MAKEPKGOPTS)
> 
> 
> Thank you for delving into this!

Thanks to both of you!

> With -d option, I was able to compile it.
> 
> I previously compile-tested it in an Arch Linux Docker container,
> but this is more convenient.
> 
> 
> Thomas, will you send v8 with Nathan's suggestion?
> 
> Or, I can offer to fold the diff if Thomas agrees.

If you are fine with folding the diff, please do!


Thanks,
Thomas

