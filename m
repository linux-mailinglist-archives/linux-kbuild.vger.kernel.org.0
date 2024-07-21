Return-Path: <linux-kbuild+bounces-2612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56666938494
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 14:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3CF7B20C65
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 12:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFAC27735;
	Sun, 21 Jul 2024 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsZV31fu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0E9B67A;
	Sun, 21 Jul 2024 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721563872; cv=none; b=nUBuRdHJgDgBgddf2jtohAN4HTBUHktIeo+JQdumQqp9cUEgdZKqnWogeqk5cnaR+1yimyv76kpHotczox8ZTLN8gE3Ua8nbiHsml31xkMBULO/b41rgJd4V5VoDc9rfhJhFpUX/85WF+O+A7bMOM7v3xo/yNhpKJ5DNFf/l+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721563872; c=relaxed/simple;
	bh=KEJLmhZjFCH6rHEguK+PeGYbDore5r3JPmdlAZx+8Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okUCAHIZC6zBLSUQ1mwkBWnS6yl2lXTd3ZsnIM91642nNq1UmSN41OjWjZiGY8WhzgipsiWKoVLL6X8e9pguFBpnnuT6Db2m2BafFJ/upbBMZ142tc2eEB5LPs35up0ybuxsjGciwMdhJIPqK0B9xHL2ndgPYV/gsZR72MfmYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsZV31fu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99E3C116B1;
	Sun, 21 Jul 2024 12:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721563871;
	bh=KEJLmhZjFCH6rHEguK+PeGYbDore5r3JPmdlAZx+8Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LsZV31fub9MUmhG7L36kXPdneZhZgvNQAqJx4R8CnE/TlMirz5OQSNfWbHIZjrytV
	 QEUC7v9vZ+zH2C4CgBYH4ZbQRkB9eJVXVG8fm8134OEsjkd5z8Ql1e4BxGVjahs7Cn
	 JLhLZYRBQj9SqBQh0uOCGqYNgVLXvC8fRtMUiBoUqysOyP6OCPy9mdp2ra5Sb/p9lz
	 nz8yMlLq/H0IBfskSSw3haqbhhucii3/w204gZDpbwyOZLrlSkqFEAzSKWK7ztIXkO
	 KvHREOV6lYdUTsTp8tzYYbiDe+8McnMXyd0UxS2N7+AQd2YElW9yHcpXAfrSTkfS7p
	 jxX+FK/4uesLA==
Date: Sun, 21 Jul 2024 05:11:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	Christian Heusel <christian@heusel.eu>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v7] kbuild: add script and target to generate pacman
 package
Message-ID: <20240721121109.GA3599565@thelio-3990X>
References: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>
 <20240721033209.GA545406@thelio-3990X>
 <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>

Hi Masahiro,

On Sun, Jul 21, 2024 at 03:58:49PM +0900, Masahiro Yamada wrote:
> On Sun, Jul 21, 2024 at 12:32 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > On Sat, Jul 20, 2024 at 11:18:12AM +0200, Thomas Weißschuh wrote:
> > > pacman is the package manager used by Arch Linux and its derivates.
> > > Creating native packages from the kernel tree has multiple advantages:
> > >
> > > * The package triggers the correct hooks for initramfs generation and
> > >   bootloader configuration
> > > * Uninstallation is complete and also invokes the relevant hooks
> > > * New UAPI headers can be installed without any manual bookkeeping
> > >
> > > The PKGBUILD file is a modified version of the one used for the
> > > downstream Arch Linux "linux" package.
> > > Extra steps that should not be necessary for a development kernel have
> > > been removed and an UAPI header package has been added.
> > >
> > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > ---
> >
> > I think this looks really solid now, thanks again for the PACMAN_PKGBASE
> > addition.
> >
> > I tested building Arch Linux's configuration for x86_64 and booting it
> > in a VM. I built Fedora's configuration for aarch64 just to test the
> > cross building aspect and making sure the result of various bits that we
> > added that would not affect x86 (such as the dtb installation) looked
> > reasonable.
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> I believe this is a separate issue, but
> Debian/Ubuntu provides a 'makepkg' package, which fails
> with 'User defined signal 1' error.
> 
> After 'sudo apt install makepkg',
> 
> masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ cat
> /etc/os-release
> PRETTY_NAME="Ubuntu 24.04 LTS"
> NAME="Ubuntu"
> VERSION_ID="24.04"
> VERSION="24.04 LTS (Noble Numbat)"
> VERSION_CODENAME=noble
> ID=ubuntu
> ID_LIKE=debian
> HOME_URL="https://www.ubuntu.com/"
> SUPPORT_URL="https://help.ubuntu.com/"
> BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
> PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
> UBUNTU_CODENAME=noble
> LOGO=ubuntu-logo
> masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> makepkg --version
> makepkg (pacman) 6.0.2
> Copyright (c) 2006-2021 Pacman Development Team <pacman-dev@archlinux.org>.
> Copyright (C) 2002-2006 Judd Vinet <jvinet@zeroflux.org>.
> 
> This is free software; see the source for copying conditions.
> There is NO WARRANTY, to the extent permitted by law.
> masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ git
> log --oneline -2
> 5dcaebb67ad9 (HEAD) kbuild: add script and target to generate pacman package
> 41c196e567fb (tag: next-20240719, origin/master, origin/HEAD) Add
> linux-next specific files for 20240719
> masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> make defconfig  pacman-pkg
> *** Default configuration is based on 'x86_64_defconfig'
> #
> # No change to .config
> #
> objtree="/home/masahiro/ref/linux-next" \
> BUILDDIR="" \

It is not related to this issue but I don't think this should be empty.
'realpath pacman' does not appear to work here, I was able to fix this
with the following diff:

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 94357f47d2fa..b0fd44a40075 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -148,7 +148,7 @@ PHONY += pacman-pkg
 pacman-pkg:
 	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
 	+objtree="$(realpath $(objtree))" \
-		BUILDDIR="$(realpath pacman)" \
+		BUILDDIR="$(realpath $(objtree))/pacman" \
 		CARCH="$(UTS_MACHINE)" \
 		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
 		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \


> CARCH="x86_64" \
> KBUILD_MAKEFLAGS="rR --no-print-directory" \
> KBUILD_REVISION="4" \
> makepkg
> 
> ==> ERROR: An unknown error has occurred. Exiting...
> User defined signal 1
> make[3]: *** [scripts/Makefile.package:150: pacman-pkg] Error 138
> make[2]: *** [Makefile:1538: pacman-pkg] Error 2
> make[1]: *** [/home/masahiro/ref/linux-next/Makefile:347:
> __build_one_by_one] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> Do you know anything?

Adding '-x' to the interpreter line in /usr/bin/makepkg shows that
pacman is implicitly required for makepkg to function, so you'll need to
install pacman-package-manager as well. However, even with it installed,
the build will fail because you will be unable to perform the dependency
checking (since pacman won't be managing the packages).

I think the traditional solution for this situation (building a
distribution's package on a distribution other than the one the package
is being built for) is using an OPTS variable to allow the user to pass
in the dependency checking skip flag (that's what I do for RPM builds on
Arch Linux), so perhaps MAKEPKGOPTS so that you can use MAKEPKGOPTS=-d?
With this diff and that variable value, the build starts within makepkg
for me.

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index b0fd44a40075..4a80584ec771 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -152,7 +152,7 @@ pacman-pkg:
 		CARCH="$(UTS_MACHINE)" \
 		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
 		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
-		makepkg
+		makepkg $(MAKEPKGOPTS)
 
 # dir-pkg tar*-pkg - tarball targets
 # ---------------------------------------------------------------------------

Cheers,
Nathan

