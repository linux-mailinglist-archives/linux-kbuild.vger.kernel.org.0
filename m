Return-Path: <linux-kbuild+bounces-2610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BFD9383A4
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 08:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B678B20EDA
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 06:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBAD6FD0;
	Sun, 21 Jul 2024 06:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u37xlAGX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E946FB0;
	Sun, 21 Jul 2024 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721545168; cv=none; b=qa0qGmtB3HKBqKvY5aKMQVqlFZXbaAtmSbHpMLjfkdDzfa+wTpAS9qukRsbeoqEFPjT7S/nrzwo2ePLtHnzEIWKBEZK6/ENpiwfBxTPyH0WZZHgkDX3xAWiIJ49EZOplO9XRttZ3NlQMB2nEgTiPLD7UVxxUZq0P5YoKBKb7ls0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721545168; c=relaxed/simple;
	bh=ycCmG3no4pSXFEj8alGwkugIIUxQ6k6PlbR2klzFHeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTtTq55Pzh+jzkK1qRh58Ub/mk+XgvZLBOGRXJiYzztV8RMIY27K0VWYpduL1co+rAzmwWnUxbrvob3wQrgTfI5JsUMuSxW4j3R/1wcO8VOhXYjsApMwgW/VMyDQPHlDX+U9QzCMYXjw0dvjawg90yI/nXVk11cuWr1QmLn3h7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u37xlAGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE2CC4AF09;
	Sun, 21 Jul 2024 06:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721545167;
	bh=ycCmG3no4pSXFEj8alGwkugIIUxQ6k6PlbR2klzFHeM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u37xlAGXXTEOhHDGkOSKWUOIASyNLmHqJ6ijxeOaKbHA+y6Cu9hc5C05H5lHg2NN9
	 gZBFjO27wtCv5BH0ZhIJhn5gS9xChTmDw8oPBp/4xNCW1bc48lmbo73NCAiHn8zmxI
	 Rqu021N/KbpZ3JnA92gjRalV0wXQTIK1NNxnPCAGLdm/BDVf8eaTubDoo0bNn8Bxvn
	 BeBWg8XhrLDSk/7TAyiPSbgP2U4A6keEUP1UUraZanofME2+kviCMA1BXa02cj/k7r
	 AjmLStepFd1xViiB1Y/P54xOdkR47a/WmzixQT1TfJYb8+7VroWC9UwYXsW6s5035P
	 5y2XNRdHszk+w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ee817dac89so28590821fa.1;
        Sat, 20 Jul 2024 23:59:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvT1zc9ovUP3OluZDht/R7QvcNGdqghqePTl+hgbTu8KR33Xeds90+2bMKYxMTPeVvM/frK30x8mljP12ASciuWqZQJPk9bvda316Y395tYMkUHlN/Ws1fi8gbkXRk1XYPsVoJMlLPYzye
X-Gm-Message-State: AOJu0YzntSLQ8FxLzM/0tXyqd9UhzSzC0t0V9Wh0Af6scAVrsMTmcUsx
	n8zKX+fiI6lzzUlq85/N+JPVCJrnN4iM/zbBz4DucXBuDZwIResDtOWn5edPERRuXgR0zH1Ihwk
	tXFRWgJ4BmToBbBvPvH4xYzoUZYI=
X-Google-Smtp-Source: AGHT+IGoCfBxupU/6yRUDF1nAiP6/nAJxO3tl0LZJtxuDUP8k0i6IF8wxW/1X86vy8CJ9dtGDKUtH7Z5XJ5algnQFPc=
X-Received: by 2002:a05:6512:39c9:b0:52f:25b:b161 with SMTP id
 2adb3069b0e04-52f025bb44dmr100323e87.6.1721545166144; Sat, 20 Jul 2024
 23:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net> <20240721033209.GA545406@thelio-3990X>
In-Reply-To: <20240721033209.GA545406@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 21 Jul 2024 15:58:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>
Message-ID: <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>
Subject: Re: [PATCH v7] kbuild: add script and target to generate pacman package
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, Christian Heusel <christian@heusel.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 21, 2024 at 12:32=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hi Thomas,
>
> On Sat, Jul 20, 2024 at 11:18:12AM +0200, Thomas Wei=C3=9Fschuh wrote:
> > pacman is the package manager used by Arch Linux and its derivates.
> > Creating native packages from the kernel tree has multiple advantages:
> >
> > * The package triggers the correct hooks for initramfs generation and
> >   bootloader configuration
> > * Uninstallation is complete and also invokes the relevant hooks
> > * New UAPI headers can be installed without any manual bookkeeping
> >
> > The PKGBUILD file is a modified version of the one used for the
> > downstream Arch Linux "linux" package.
> > Extra steps that should not be necessary for a development kernel have
> > been removed and an UAPI header package has been added.
> >
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > ---
>
> I think this looks really solid now, thanks again for the PACMAN_PKGBASE
> addition.
>
> I tested building Arch Linux's configuration for x86_64 and booting it
> in a VM. I built Fedora's configuration for aarch64 just to test the
> cross building aspect and making sure the result of various bits that we
> added that would not affect x86 (such as the dtb installation) looked
> reasonable.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>


I believe this is a separate issue, but
Debian/Ubuntu provides a 'makepkg' package, which fails
with 'User defined signal 1' error.


After 'sudo apt install makepkg',


masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ cat
/etc/os-release
PRETTY_NAME=3D"Ubuntu 24.04 LTS"
NAME=3D"Ubuntu"
VERSION_ID=3D"24.04"
VERSION=3D"24.04 LTS (Noble Numbat)"
VERSION_CODENAME=3Dnoble
ID=3Dubuntu
ID_LIKE=3Ddebian
HOME_URL=3D"https://www.ubuntu.com/"
SUPPORT_URL=3D"https://help.ubuntu.com/"
BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/priva=
cy-policy"
UBUNTU_CODENAME=3Dnoble
LOGO=3Dubuntu-logo
masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
makepkg --version
makepkg (pacman) 6.0.2
Copyright (c) 2006-2021 Pacman Development Team <pacman-dev@archlinux.org>.
Copyright (C) 2002-2006 Judd Vinet <jvinet@zeroflux.org>.

This is free software; see the source for copying conditions.
There is NO WARRANTY, to the extent permitted by law.
masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ git
log --oneline -2
5dcaebb67ad9 (HEAD) kbuild: add script and target to generate pacman packag=
e
41c196e567fb (tag: next-20240719, origin/master, origin/HEAD) Add
linux-next specific files for 20240719
masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
make defconfig  pacman-pkg
*** Default configuration is based on 'x86_64_defconfig'
#
# No change to .config
#
objtree=3D"/home/masahiro/ref/linux-next" \
BUILDDIR=3D"" \
CARCH=3D"x86_64" \
KBUILD_MAKEFLAGS=3D"rR --no-print-directory" \
KBUILD_REVISION=3D"4" \
makepkg

=3D=3D> ERROR: An unknown error has occurred. Exiting...
User defined signal 1
make[3]: *** [scripts/Makefile.package:150: pacman-pkg] Error 138
make[2]: *** [Makefile:1538: pacman-pkg] Error 2
make[1]: *** [/home/masahiro/ref/linux-next/Makefile:347:
__build_one_by_one] Error 2
make: *** [Makefile:224: __sub-make] Error 2



Do you know anything?







--=20
Best Regards
Masahiro Yamada

