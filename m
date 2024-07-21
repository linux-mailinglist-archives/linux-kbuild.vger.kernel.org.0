Return-Path: <linux-kbuild+bounces-2613-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4C9384D3
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 15:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1945C1F21196
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 13:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3777D161339;
	Sun, 21 Jul 2024 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sEjVaIOM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5548C0B;
	Sun, 21 Jul 2024 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721569371; cv=none; b=fbJiLJM/7vVJOKHWQauYGXLY1Y989MH0f/w/hW5duxSB96vYViDBjWZf1D3piSejj+SdCqlO2xr86C0WYsPaCM3ZiUUU/k4C7BPDWAnYNlYU8LSm/ZuQZ8QfCDSOCPTCt36DEnbJ8ahJ00zdAFQVsbL6f5Pp7kePlK2msb/98LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721569371; c=relaxed/simple;
	bh=tIaRmzxBsPWpTelTdNyQBOizgymJEOUTCdwWZphN608=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vd53msK9QPdiT7Rmq8+I6ith29TfjlEgaat6FaF6SEp7+FgVlmpXVbigyzWRwVYj1fJWzHwakuaysUeuQry7AThfQJXnJzP5Yk3XyH6ys4GPVlRhnEAKmzyvezbGJbFYSSbEGtL08yImFKSMZTtNjnM6WJo0Z22vDY7lqUfqhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sEjVaIOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6AFC4AF0F;
	Sun, 21 Jul 2024 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721569370;
	bh=tIaRmzxBsPWpTelTdNyQBOizgymJEOUTCdwWZphN608=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sEjVaIOM/pYjSNHGVZnDwP7BJHQZy+f0QzUwWcR0LkNJQ99E8bRQAYvClVcU3q56f
	 zKyTYvhwm0qURKbUOuYo1rAroE5SP8SkgFjGp0VypB22jV6tZTq9F+YUOoVsR9pkqs
	 ROy26lTIY20m/j/GNFHbUpL7XQlvghXQQXgDgvPvJFSPV0dV53sCHpSFKUbIzitUaP
	 M+KwqVWkVjY2x13mU6NEXEnnuoAzvsYjt5+rHafcg3o92s6hym4XmG9mfLvj4/ErvY
	 OxSTAMGH3AzwFQBQAs3GB7dMUNAG9Qhu0VL/b8iUKuufdSrZ+mYJxjimnp+r6xNXVG
	 FI+bFy/hBG/Vg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efbb55d24so1264841e87.1;
        Sun, 21 Jul 2024 06:42:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2J9xymdjPwG1i40ACHgYKwqLeKxnnPejYPAiCzcf7LbhivyECK2aP82Fpa75R9p0E7mP/1rWX4t+Okaz3yk9TjHoF3nZhU4x+wgWx2hEPi/+xGCYKDtG/V0US/vh7aJGnaS68BT767Ccf
X-Gm-Message-State: AOJu0Yxc/LUPQJnmvoGMCu55W+J5kjpks1QGi1dgKxmZvU9k1kPvLBV6
	62Po2RqzErEfM6UrixHJMURBJLf3nLHb4rcHLo49o/EV0p+n1FeUjuQMfIG3MWyOUh18dGn466G
	/TM2grIfyTnsPX2+HgECmURx2UIM=
X-Google-Smtp-Source: AGHT+IHZlpT1P4aCgVvRZS0vcpeGNqzURlpG7RqaskIdm9glR6y4/6VGkKtMhlJO8HeSoCvVdbv+CBsr22hIXAq4rhM=
X-Received: by 2002:a05:6512:6d4:b0:52d:582e:4111 with SMTP id
 2adb3069b0e04-52efb53bac4mr3527790e87.18.1721569369133; Sun, 21 Jul 2024
 06:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>
 <20240721033209.GA545406@thelio-3990X> <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>
 <20240721121109.GA3599565@thelio-3990X>
In-Reply-To: <20240721121109.GA3599565@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 21 Jul 2024 22:42:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyRaMgcgg5urnJU8ePqULAOB6TkFDjRVEwjEZEvT6s-g@mail.gmail.com>
Message-ID: <CAK7LNAQyRaMgcgg5urnJU8ePqULAOB6TkFDjRVEwjEZEvT6s-g@mail.gmail.com>
Subject: Re: [PATCH v7] kbuild: add script and target to generate pacman package
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, Christian Heusel <christian@heusel.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2024 at 9:11=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Masahiro,
>
> On Sun, Jul 21, 2024 at 03:58:49PM +0900, Masahiro Yamada wrote:
> > On Sun, Jul 21, 2024 at 12:32=E2=80=AFPM Nathan Chancellor <nathan@kern=
el.org> wrote:
> > > On Sat, Jul 20, 2024 at 11:18:12AM +0200, Thomas Wei=C3=9Fschuh wrote=
:
> > > > pacman is the package manager used by Arch Linux and its derivates.
> > > > Creating native packages from the kernel tree has multiple advantag=
es:
> > > >
> > > > * The package triggers the correct hooks for initramfs generation a=
nd
> > > >   bootloader configuration
> > > > * Uninstallation is complete and also invokes the relevant hooks
> > > > * New UAPI headers can be installed without any manual bookkeeping
> > > >
> > > > The PKGBUILD file is a modified version of the one used for the
> > > > downstream Arch Linux "linux" package.
> > > > Extra steps that should not be necessary for a development kernel h=
ave
> > > > been removed and an UAPI header package has been added.
> > > >
> > > > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > > > ---
> > >
> > > I think this looks really solid now, thanks again for the PACMAN_PKGB=
ASE
> > > addition.
> > >
> > > I tested building Arch Linux's configuration for x86_64 and booting i=
t
> > > in a VM. I built Fedora's configuration for aarch64 just to test the
> > > cross building aspect and making sure the result of various bits that=
 we
> > > added that would not affect x86 (such as the dtb installation) looked
> > > reasonable.
> > >
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > Tested-by: Nathan Chancellor <nathan@kernel.org>
> >
> > I believe this is a separate issue, but
> > Debian/Ubuntu provides a 'makepkg' package, which fails
> > with 'User defined signal 1' error.
> >
> > After 'sudo apt install makepkg',
> >
> > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ cat
> > /etc/os-release
> > PRETTY_NAME=3D"Ubuntu 24.04 LTS"
> > NAME=3D"Ubuntu"
> > VERSION_ID=3D"24.04"
> > VERSION=3D"24.04 LTS (Noble Numbat)"
> > VERSION_CODENAME=3Dnoble
> > ID=3Dubuntu
> > ID_LIKE=3Ddebian
> > HOME_URL=3D"https://www.ubuntu.com/"
> > SUPPORT_URL=3D"https://help.ubuntu.com/"
> > BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
> > PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/p=
rivacy-policy"
> > UBUNTU_CODENAME=3Dnoble
> > LOGO=3Dubuntu-logo
> > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > makepkg --version
> > makepkg (pacman) 6.0.2
> > Copyright (c) 2006-2021 Pacman Development Team <pacman-dev@archlinux.o=
rg>.
> > Copyright (C) 2002-2006 Judd Vinet <jvinet@zeroflux.org>.
> >
> > This is free software; see the source for copying conditions.
> > There is NO WARRANTY, to the extent permitted by law.
> > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ git
> > log --oneline -2
> > 5dcaebb67ad9 (HEAD) kbuild: add script and target to generate pacman pa=
ckage
> > 41c196e567fb (tag: next-20240719, origin/master, origin/HEAD) Add
> > linux-next specific files for 20240719
> > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > make defconfig  pacman-pkg
> > *** Default configuration is based on 'x86_64_defconfig'
> > #
> > # No change to .config
> > #
> > objtree=3D"/home/masahiro/ref/linux-next" \
> > BUILDDIR=3D"" \
>
> It is not related to this issue but I don't think this should be empty.
> 'realpath pacman' does not appear to work here, I was able to fix this
> with the following diff:
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 94357f47d2fa..b0fd44a40075 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -148,7 +148,7 @@ PHONY +=3D pacman-pkg
>  pacman-pkg:
>         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
>         +objtree=3D"$(realpath $(objtree))" \
> -               BUILDDIR=3D"$(realpath pacman)" \
> +               BUILDDIR=3D"$(realpath $(objtree))/pacman" \


Right.

$(realpath pacman) expands to empty
if 'pacman' does not exist yet.
Your fix is correct.








>                 CARCH=3D"$(UTS_MACHINE)" \
>                 KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
>                 KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-versi=
on)" \
>
>
> > CARCH=3D"x86_64" \
> > KBUILD_MAKEFLAGS=3D"rR --no-print-directory" \
> > KBUILD_REVISION=3D"4" \
> > makepkg
> >
> > =3D=3D> ERROR: An unknown error has occurred. Exiting...
> > User defined signal 1
> > make[3]: *** [scripts/Makefile.package:150: pacman-pkg] Error 138
> > make[2]: *** [Makefile:1538: pacman-pkg] Error 2
> > make[1]: *** [/home/masahiro/ref/linux-next/Makefile:347:
> > __build_one_by_one] Error 2
> > make: *** [Makefile:224: __sub-make] Error 2
> >
> > Do you know anything?
>
> Adding '-x' to the interpreter line in /usr/bin/makepkg shows that
> pacman is implicitly required for makepkg to function, so you'll need to
> install pacman-package-manager as well. However, even with it installed,
> the build will fail because you will be unable to perform the dependency
> checking (since pacman won't be managing the packages).
>
> I think the traditional solution for this situation (building a
> distribution's package on a distribution other than the one the package
> is being built for) is using an OPTS variable to allow the user to pass
> in the dependency checking skip flag (that's what I do for RPM builds on
> Arch Linux), so perhaps MAKEPKGOPTS so that you can use MAKEPKGOPTS=3D-d?
> With this diff and that variable value, the build starts within makepkg
> for me.
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index b0fd44a40075..4a80584ec771 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -152,7 +152,7 @@ pacman-pkg:
>                 CARCH=3D"$(UTS_MACHINE)" \
>                 KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
>                 KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-versi=
on)" \
> -               makepkg
> +               makepkg $(MAKEPKGOPTS)


Thank you for delving into this!

With -d option, I was able to compile it.

I previously compile-tested it in an Arch Linux Docker container,
but this is more convenient.


Thomas, will you send v8 with Nathan's suggestion?

Or, I can offer to fold the diff if Thomas agrees.



--=20
Best Regards
Masahiro Yamada

