Return-Path: <linux-kbuild+bounces-2615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A6938570
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 18:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FA952810F6
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 16:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E008C1662EA;
	Sun, 21 Jul 2024 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csFBLt4N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B49944E;
	Sun, 21 Jul 2024 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721577801; cv=none; b=RGE3n1YxD4QQCAhymCZdSw6PdIj9utG4Ju9qYFD4rhlsDQD1JyMwwA+iunvBKL5Exz218Yv5WhXELb2qrOJkjDYJ4ILMvq7/tThmr1/Bx8dQO00cT8OmaZuAKvuBotl87L8Vl994GE9NS6KKp09Gq0SQrZIUpS63pGuOuS3RIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721577801; c=relaxed/simple;
	bh=0ClN6jRuzrfIO6ILFeUAfZ0T30bJppbzd54fvtTLqGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qg16zrgpM4b1iDZ6WoUGxiMHT2QvVaf6M+hlRPCeZFjaUQ7Ra2nmcX4kSD5l/haNFHLC4BZjO4RQTL3g0KmHp0LKT8ZPe3lPJyq3kahT6mS+JpRRIOSKHPg+K+YyzzjeqaYsTLM8Dsxwh/F6PoVQi8fgbc+YGkq9bF/muDUy8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csFBLt4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C76C4AF0F;
	Sun, 21 Jul 2024 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721577801;
	bh=0ClN6jRuzrfIO6ILFeUAfZ0T30bJppbzd54fvtTLqGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=csFBLt4NY8gBuF4o7CGKQ/Q1Vjye1HCij1HOn2TLVY1NbdooPuSRuBSTEDaxXJm97
	 +p/qIwn9g5+P1Q9RAMH79u4rSvy8B4C4fhgB6+XCZEkOz2m3XVyPI8+FKWE6NT1ciI
	 /6hSa92SYX/ym3myFg06AO22PQHrm3xD9Aq7h7dmdisVzSKQZcReTWhgF26xWytl+L
	 y/Sptt0Ocybkg9DYaz/zyDaAVdp3lxbDU7hT615/JVDnCcJrRLC4ndm2iMcS3WpHws
	 qrXo1pZEAoRrtilOurCpNLk6z3AZNqH34ZlOp9836DXbRelMDe5x7I3o4nyXCjus1K
	 ccpPznA40KvWw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52efaae7edfso728295e87.2;
        Sun, 21 Jul 2024 09:03:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgKbxzlv8gJN8kVIiqYw8tSVu/+WMJvLP9ML9MI4/pPshkEddX4AKzjzsZ0zCzO1ZLScKkN2New1TOEfov5ydbreaR+QO51MmRH3ahlv0q0RyQWlHDxjaISNAezclKFVXVf+ukWUdcBTHO
X-Gm-Message-State: AOJu0YyQnssnnmHQnhe8jvfx3wOoSlx/ZDN2B12cpQjRXEbu57MA0dlp
	DLSS7Q145meNxu5TUGSC/oZd9SDFGXzQdyxOAopcNAvZsMGlZH+3eeWWfK//gtFzgTtG0s5BWWp
	usKXEHre5WscWOWyspW4Ti+9wxsc=
X-Google-Smtp-Source: AGHT+IHdUvKbfxZ6MHubWY/CvPBolT5WXLdGD5V7QGoS4B/Tk6M/HYeqXWtpW3sZm6ycVppqydxhp1qRK7AlpOepotU=
X-Received: by 2002:a05:6512:3a81:b0:52e:9f6b:64 with SMTP id
 2adb3069b0e04-52efb8248e5mr2436192e87.34.1721577799678; Sun, 21 Jul 2024
 09:03:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>
 <20240721033209.GA545406@thelio-3990X> <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>
 <20240721121109.GA3599565@thelio-3990X> <CAK7LNAQyRaMgcgg5urnJU8ePqULAOB6TkFDjRVEwjEZEvT6s-g@mail.gmail.com>
 <5db8b1e9-894b-4626-b635-420078df10ce@t-8ch.de>
In-Reply-To: <5db8b1e9-894b-4626-b635-420078df10ce@t-8ch.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 22 Jul 2024 01:02:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5RhUg=ktGZnfGxNLMckJzKM12r1Q=KpCjvFU=_vaZEw@mail.gmail.com>
Message-ID: <CAK7LNAQ5RhUg=ktGZnfGxNLMckJzKM12r1Q=KpCjvFU=_vaZEw@mail.gmail.com>
Subject: Re: [PATCH v7] kbuild: add script and target to generate pacman package
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, Christian Heusel <christian@heusel.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2024 at 11:57=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> On 2024-07-21 22:42:12+0000, Masahiro Yamada wrote:
> > On Sun, Jul 21, 2024 at 9:11=E2=80=AFPM Nathan Chancellor <nathan@kerne=
l.org> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > On Sun, Jul 21, 2024 at 03:58:49PM +0900, Masahiro Yamada wrote:
> > > > On Sun, Jul 21, 2024 at 12:32=E2=80=AFPM Nathan Chancellor <nathan@=
kernel.org> wrote:
> > > > > On Sat, Jul 20, 2024 at 11:18:12AM +0200, Thomas Wei=C3=9Fschuh w=
rote:
> > > > > > pacman is the package manager used by Arch Linux and its deriva=
tes.
> > > > > > Creating native packages from the kernel tree has multiple adva=
ntages:
> > > > > >
> > > > > > * The package triggers the correct hooks for initramfs generati=
on and
> > > > > >   bootloader configuration
> > > > > > * Uninstallation is complete and also invokes the relevant hook=
s
> > > > > > * New UAPI headers can be installed without any manual bookkeep=
ing
> > > > > >
> > > > > > The PKGBUILD file is a modified version of the one used for the
> > > > > > downstream Arch Linux "linux" package.
> > > > > > Extra steps that should not be necessary for a development kern=
el have
> > > > > > been removed and an UAPI header package has been added.
> > > > > >
> > > > > > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > > > > > ---
> > > > >
> > > > > I think this looks really solid now, thanks again for the PACMAN_=
PKGBASE
> > > > > addition.
> > > > >
> > > > > I tested building Arch Linux's configuration for x86_64 and booti=
ng it
> > > > > in a VM. I built Fedora's configuration for aarch64 just to test =
the
> > > > > cross building aspect and making sure the result of various bits =
that we
> > > > > added that would not affect x86 (such as the dtb installation) lo=
oked
> > > > > reasonable.
> > > > >
> > > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > > > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > > >
> > > > I believe this is a separate issue, but
> > > > Debian/Ubuntu provides a 'makepkg' package, which fails
> > > > with 'User defined signal 1' error.
> > > >
> > > > After 'sudo apt install makepkg',
> > > >
> > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ =
cat
> > > > /etc/os-release
> > > > PRETTY_NAME=3D"Ubuntu 24.04 LTS"
> > > > NAME=3D"Ubuntu"
> > > > VERSION_ID=3D"24.04"
> > > > VERSION=3D"24.04 LTS (Noble Numbat)"
> > > > VERSION_CODENAME=3Dnoble
> > > > ID=3Dubuntu
> > > > ID_LIKE=3Ddebian
> > > > HOME_URL=3D"https://www.ubuntu.com/"
> > > > SUPPORT_URL=3D"https://help.ubuntu.com/"
> > > > BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
> > > > PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-polici=
es/privacy-policy"
> > > > UBUNTU_CODENAME=3Dnoble
> > > > LOGO=3Dubuntu-logo
> > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > > > makepkg --version
> > > > makepkg (pacman) 6.0.2
> > > > Copyright (c) 2006-2021 Pacman Development Team <pacman-dev@archlin=
ux.org>.
> > > > Copyright (C) 2002-2006 Judd Vinet <jvinet@zeroflux.org>.
> > > >
> > > > This is free software; see the source for copying conditions.
> > > > There is NO WARRANTY, to the extent permitted by law.
> > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ =
git
> > > > log --oneline -2
> > > > 5dcaebb67ad9 (HEAD) kbuild: add script and target to generate pacma=
n package
> > > > 41c196e567fb (tag: next-20240719, origin/master, origin/HEAD) Add
> > > > linux-next specific files for 20240719
> > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > > > make defconfig  pacman-pkg
> > > > *** Default configuration is based on 'x86_64_defconfig'
> > > > #
> > > > # No change to .config
> > > > #
> > > > objtree=3D"/home/masahiro/ref/linux-next" \
> > > > BUILDDIR=3D"" \
> > >
> > > It is not related to this issue but I don't think this should be empt=
y.
> > > 'realpath pacman' does not appear to work here, I was able to fix thi=
s
> > > with the following diff:
> > >
> > > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > > index 94357f47d2fa..b0fd44a40075 100644
> > > --- a/scripts/Makefile.package
> > > +++ b/scripts/Makefile.package
> > > @@ -148,7 +148,7 @@ PHONY +=3D pacman-pkg
> > >  pacman-pkg:
> > >         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBU=
ILD
> > >         +objtree=3D"$(realpath $(objtree))" \
> > > -               BUILDDIR=3D"$(realpath pacman)" \
> > > +               BUILDDIR=3D"$(realpath $(objtree))/pacman" \
> >
> >
> > Right.
> >
> > $(realpath pacman) expands to empty
> > if 'pacman' does not exist yet.
> > Your fix is correct.
>
> I'm wondering how it worked for me, as I specifically tested this case.
> But I'm fine with the proposal.
>
> Shouldn't it be "$(realpath ./pacman)" though?


No.

Aa I said, $(realpath ./pacman) expands to an empty string
if ./pacman does not exist.


masahiro@zoe:~$ echo '$(info $(realpath ./pacman))' | make -f -

make: *** No targets.  Stop.
masahiro@zoe:~$ mkdir pacman
masahiro@zoe:~$ echo '$(info $(realpath ./pacman))' | make -f -
/home/masahiro/pacman
make: *** No targets.  Stop.








>
> >
> > >                 CARCH=3D"$(UTS_MACHINE)" \
> > >                 KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
> > >                 KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-v=
ersion)" \
> > >
> > >
> > > > CARCH=3D"x86_64" \
> > > > KBUILD_MAKEFLAGS=3D"rR --no-print-directory" \
> > > > KBUILD_REVISION=3D"4" \
> > > > makepkg
> > > >
> > > > =3D=3D> ERROR: An unknown error has occurred. Exiting...
> > > > User defined signal 1
> > > > make[3]: *** [scripts/Makefile.package:150: pacman-pkg] Error 138
> > > > make[2]: *** [Makefile:1538: pacman-pkg] Error 2
> > > > make[1]: *** [/home/masahiro/ref/linux-next/Makefile:347:
> > > > __build_one_by_one] Error 2
> > > > make: *** [Makefile:224: __sub-make] Error 2
> > > >
> > > > Do you know anything?
> > >
> > > Adding '-x' to the interpreter line in /usr/bin/makepkg shows that
> > > pacman is implicitly required for makepkg to function, so you'll need=
 to
> > > install pacman-package-manager as well. However, even with it install=
ed,
> > > the build will fail because you will be unable to perform the depende=
ncy
> > > checking (since pacman won't be managing the packages).
>
> It seems very weird that there is no dependency, not even a soft one,
> from makepkg to pacman.
>
> > > I think the traditional solution for this situation (building a
> > > distribution's package on a distribution other than the one the packa=
ge
> > > is being built for) is using an OPTS variable to allow the user to pa=
ss
> > > in the dependency checking skip flag (that's what I do for RPM builds=
 on
> > > Arch Linux), so perhaps MAKEPKGOPTS so that you can use MAKEPKGOPTS=
=3D-d?
> > > With this diff and that variable value, the build starts within makep=
kg
> > > for me.
> > >
> > > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > > index b0fd44a40075..4a80584ec771 100644
> > > --- a/scripts/Makefile.package
> > > +++ b/scripts/Makefile.package
> > > @@ -152,7 +152,7 @@ pacman-pkg:
> > >                 CARCH=3D"$(UTS_MACHINE)" \
> > >                 KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
> > >                 KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-v=
ersion)" \
> > > -               makepkg
> > > +               makepkg $(MAKEPKGOPTS)
> >
> >
> > Thank you for delving into this!
>
> Thanks to both of you!
>
> > With -d option, I was able to compile it.
> >
> > I previously compile-tested it in an Arch Linux Docker container,
> > but this is more convenient.
> >
> >
> > Thomas, will you send v8 with Nathan's suggestion?
> >
> > Or, I can offer to fold the diff if Thomas agrees.
>
> If you are fine with folding the diff, please do!
>
>
> Thanks,
> Thomas
>


--=20
Best Regards
Masahiro Yamada

