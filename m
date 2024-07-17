Return-Path: <linux-kbuild+bounces-2583-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC11A934259
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 20:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE9F71C20FAD
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76491836C4;
	Wed, 17 Jul 2024 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9p5zqr0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE217470;
	Wed, 17 Jul 2024 18:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721241535; cv=none; b=vFMcHtu5UfyBnblv0AGo/gZVWnjxdJiNxjBlBqtRIUc5j5h2ByLxzR7eOwSQXbEKJPXYnWOZLpR0Xntv3cpDItdMCv+uxqD2izyGL76VDB9ICWcKaS9PNFOAe6r0otbxXf9nfCFyyNIAFJat0QlSlGUeXtxiSrEQuSR5P7sC7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721241535; c=relaxed/simple;
	bh=k3SUUvJyP3HAs9jEHJlcAftSzSgHWl5a0MMFSXbp+LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6W71Xk6uZTosaVRmKdyueHMCaMnjxpr4cchneOm4ClYF5QxsRa29L00iiAeVw6/Cpx68eQiElYXyJ1dG7sknfn9c28srd+tHiz6G4QhApMYEIxfz7AZxWvg05yzlovwYim6tYGv6tFFxAoch6yyHf8JnFUbsHPIsjOPPcTm12Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9p5zqr0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AE6C4AF0C;
	Wed, 17 Jul 2024 18:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721241535;
	bh=k3SUUvJyP3HAs9jEHJlcAftSzSgHWl5a0MMFSXbp+LU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z9p5zqr0xPpvzcnFESLLr8KjjNkQj62kACXXth/LZ9ab++x4gkazOIHFJ0WxuYhaF
	 DK6P7HMW9Kp3ZS9AV+5CS+q/YuEqXCDs2/eJsBpCkm9Y/rP8uiss2B9DbGaAVsO/9N
	 D/yoHBolWLOZs7LyehS5dRiJ3RfmE1kzBSaATLll3WBLNirvjZiiqPdP5EMtvLUJFN
	 LlPYb2uhgIsxtNsEwtT9xgSBF3jxNJ4ouaza1/yikPdX0W9iSQP/CVMoXxHc+YPfiT
	 fmFLDPW3X9m7lYMocEWSqwWGvPLtAjQFZkTmRu/iJ1q4Q7ZjGcDjzWkHylPQ7QtiPx
	 UhsU/uaNQ6lVw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eede876fccso367701fa.1;
        Wed, 17 Jul 2024 11:38:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3ynCuFDk0cEnrB/9332vtRZ87rqOGWETBKSJ2fdQpwxgQmYUI5t0GgN33K3TFgp8IQz8MDFcvicd1GWEnrF1PuqmO6xQGu8X89zkGo+LlqAEqOeazGlGsZgPxsWRr1ltVx3P/L51FV0se
X-Gm-Message-State: AOJu0YwJF6nFasIIXbAzC5KvBoKHAG6MQLb/CXR//DhNIdj2KpbVD36M
	XfQiHqUb09/8SjzO03zIXIR/VCNaD1pS0pUgFNHU5NtnlgzeHgHwPz2Z1Tm/Kij6xAOaZZjkIRb
	LVJzVc0SJvGU9T+jFYuPu/ZLoyyg=
X-Google-Smtp-Source: AGHT+IG9unUklWUyOg6G6j+RcsGsD7blz8uIA2AfGHrbBvbHGfOFDpfSU0jZ/VAcRzUyxBTbdYmjwc7Ii/bJm/pFqXA=
X-Received: by 2002:a2e:8384:0:b0:2ee:9115:f535 with SMTP id
 38308e7fff4ca-2ef05d2534emr1800971fa.33.1721241533733; Wed, 17 Jul 2024
 11:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
In-Reply-To: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 18 Jul 2024 03:38:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQk+i+9YUJMa8HkPhGw4gVLZMu=qxjzsT-S8T2b8RMd+w@mail.gmail.com>
Message-ID: <CAK7LNAQk+i+9YUJMa8HkPhGw4gVLZMu=qxjzsT-S8T2b8RMd+w@mail.gmail.com>
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman package
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 2:52=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> pacman is the package manager used by Arch Linux and its derivates.
> Creating native packages from the kernel tree has multiple advantages:
>
> * The package triggers the correct hooks for initramfs generation and
>   bootloader configuration
> * Uninstallation is complete and also invokes the relevant hooks
> * New UAPI headers can be installed without any manual bookkeeping
>
> The PKGBUILD file is a simplified version of the one used for the
> downstream Arch Linux "linux" package.
> Extra steps that should not be necessary for a development kernel have
> been removed and an UAPI header package has been added.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
> Changes in v6:
> - Drop reference to srctree/Makefile
> - Drop $(realpath $(srctree))
> - Make use of the fact that $(objtree) is always "."
> - Align coding style to kernel and drop vim config line
> - Drop indirection through `$MAKE run-command`
> - Unify shell variable syntax to "${var}"
> - Add explanations to custom variables
> - Add makedepends
> - Link to v5: https://lore.kernel.org/r/20240714-kbuild-pacman-pkg-v5-1-0=
598460bc918@weissschuh.net
>
> Changes in v5:
> - Rebase onto kbuild/for-next
> - Use new path to build-version script (from kbuild/for-next)
> - Ensure submake jobserver delegation works
> - Simplify $modulesdir/pkgbase file creation
> - Add Reviewed-by from Nicolas
> - Link to v4: https://lore.kernel.org/r/20240710-kbuild-pacman-pkg-v4-1-5=
07bb5b79b2a@weissschuh.net
>
> Changes in v4:
> - Update MRPROPER_FILES
> - Unify shell variable syntax
> - Link to v3: https://lore.kernel.org/r/20240708-kbuild-pacman-pkg-v3-1-8=
85df3cbc740@weissschuh.net
>
> Changes in v3:
> - Enforce matching architectures for installation
> - Add Reviewed-by and Tested-by from Nathan
> - Link to v2: https://lore.kernel.org/r/20240706-kbuild-pacman-pkg-v2-1-6=
13422a03a7a@weissschuh.net
>
> Changes in v2:
> - Replace ${MAKE} with $MAKE for consistency with other variables
> - Use $MAKE for "-s image_name"
> - Avoid permission warnings from build directory
> - Clarify reason for /build symlink removal
> - Install System.map and config
> - Install dtbs where available
> - Allow cross-build through arch=3Dany
> - Sort Contributor/Maintainer chronologically
> - Disable some unneeded makepkg options
> - Use DEPMOD=3Dtrue for consistency with rpm-package
> - Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1-1-a=
c2f63f5fa7b@weissschuh.net
> ---
>  .gitignore               |  6 +++
>  Makefile                 |  2 +-
>  scripts/Makefile.package | 14 +++++++
>  scripts/package/PKGBUILD | 99 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 120 insertions(+), 1 deletion(-)
>
> diff --git a/.gitignore b/.gitignore
> index c59dc60ba62e..7902adf4f7f1 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -92,6 +92,12 @@ modules.order
>  #
>  /tar-install/
>
> +#
> +# pacman files (make pacman-pkg)
> +#
> +/PKGBUILD
> +/pacman/
> +
>  #
>  # We don't want to ignore the following even if they are dot-files
>  #
> diff --git a/Makefile b/Makefile
> index 7372ea45ed3f..768d3dc107f8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1481,7 +1481,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
rs \
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES +=3D include/config include/generated          \
>                   arch/$(SRCARCH)/include/generated .objdiff \
> -                 debian snap tar-install \
> +                 debian snap tar-install PKGBUILD pacman \
>                   .config .config.old .version \
>                   Module.symvers \
>                   certs/signing_key.pem \
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index bf016af8bf8a..0aaa0832279c 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -141,6 +141,19 @@ snap-pkg:
>         cd $(objtree)/snap && \
>         snapcraft --target-arch=3D$(UTS_MACHINE)
>
> +# pacman-pkg
> +# ----------------------------------------------------------------------=
-----
> +
> +PHONY +=3D pacman-pkg
> +pacman-pkg:
> +       @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> +       +objtree=3D"$(realpath $(objtree))" \
> +               BUILDDIR=3Dpacman \
> +               CARCH=3D"$(UTS_MACHINE)" \
> +               KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
> +               KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-versi=
on)" \
> +               makepkg
> +
>  # dir-pkg tar*-pkg - tarball targets
>  # ----------------------------------------------------------------------=
-----
>
> @@ -221,6 +234,7 @@ help:
>         @echo '  bindeb-pkg          - Build only the binary kernel deb p=
ackage'
>         @echo '  snap-pkg            - Build only the binary kernel snap =
package'
>         @echo '                        (will connect to external hosts)'
> +       @echo '  pacman-pkg          - Build only the binary kernel pacma=
n package'
>         @echo '  dir-pkg             - Build the kernel as a plain direct=
ory structure'
>         @echo '  tar-pkg             - Build the kernel as an uncompresse=
d tarball'
>         @echo '  targz-pkg           - Build the kernel as a gzip compres=
sed tarball'
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> new file mode 100644
> index 000000000000..eb3957fad915
> --- /dev/null
> +++ b/scripts/package/PKGBUILD
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Maintainer: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> +
> +pkgbase=3Dlinux-upstream
> +pkgname=3D("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
> +pkgver=3D"${KERNELRELEASE//-/_}"
> +# The PKGBUILD is evaluated multiple times.
> +# Running scripts/build-version from here would introduce inconsistencie=
s.
> +pkgrel=3D"${KBUILD_REVISION}"








> +pkgdesc=3D'Linux'
> +url=3D'https://www.kernel.org/'
> +# Enable flexible cross-compilation
> +arch=3D(${CARCH})
> +license=3D(GPL-2.0-only)
> +makedepends=3D(
> +       base-devel


The base-devel group includes autoconf, automake, libtool, etc.

Kbuild does not use those.


I like a list of individual packages, as seen in arch linux:

https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/6.9.=
9.arch1-1/PKGBUILD?ref_type=3Dtags#L11






> +       bc
> +       cpio
> +       gettext
> +       libelf
> +       openssl
> +       pahole
> +       perl
> +       python
> +       rsync
> +       tar
> +)
> +options=3D(!debug !strip !buildflags !makeflags)
> +
> +build() {
> +       # MAKEFLAGS from makepkg.conf override the ones inherited from kb=
uild.
> +       # Bypass this override with a custom variable.
> +       export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> +       cd "${objtree}"
> +
> +       # makepkg does a "chmod a-srw", triggering warnings during kbuild
> +       chmod 0755 "${pkgdirbase}" || true


Please remove this.

The warning is emitted by

  find . -name '*.usyms' | xargs rm -f

in scripts/remove-stale-files.


I will apply this first:
https://lore.kernel.org/linux-kbuild/20240717181340.1518266-1-masahiroy@ker=
nel.org/T/#u






> +
> +       ${MAKE}


This will cause a revision mismatch between the package and
'uname -a' in the installed kernel image.

You execute scripts/build-version in scripts/Makefile.package,
and once again during ${MAKE}.


The revision in include/generated/utsversion.h is bigger
than ${pkgrel}.


kernel.spec does like this:

  %{make} %{makeflags} KERNELRELEASE=3D%{KERNELRELEASE}
KBUILD_BUILD_VERSION=3D%{release}



You need to do something similar.





--
Best Regards
Masahiro Yamada

