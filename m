Return-Path: <linux-kbuild+bounces-2499-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB029930960
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 10:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71771C209EB
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 08:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519AD3BB23;
	Sun, 14 Jul 2024 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGN+MIYA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2843B1CABB;
	Sun, 14 Jul 2024 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720947498; cv=none; b=L2SAU/DENXZ7lkswbW1JPA8BE1Y9Z7VGGMwheB0iwzONR8f0nWVuDSnLD7YYMqn9a6Jy+u9iqo8lkJtluYwNY+4NFcd/Cxw7Z27okqV3e5frQ1Po9uh8Pkbc0KE7oYH6ynqssuKiYFJVjdsSObVNzS3KbA40p2A4qtT5rWfWDZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720947498; c=relaxed/simple;
	bh=fUZGzAswBQ8wXozyOygwuvN8lZWA1/H5wdPyz6UTVJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkCbRcJSG2D0q/wKxAKdyWWcGT/WvW5vlwv0/8VbfNcUvyirD6MfdYa8Ax0DD9phYPiYNxNdaZxjbtDVSkxKWFaOiXN6Rlg2Q+7rQNB25PHOdfCQv4J/BJBCRWuEAffyrQCxkJZaKWeDfOhEoBLClbWrxgZaD4iSI822OYag4wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGN+MIYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D174C4AF10;
	Sun, 14 Jul 2024 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720947497;
	bh=fUZGzAswBQ8wXozyOygwuvN8lZWA1/H5wdPyz6UTVJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rGN+MIYAdVVUqUvgXwJzi853NSZGRxQ2iyd13RyJfVkB0tBLU56QV3VTZxcH760I/
	 TfPzquT1f/goh8u2a5wnIFEXSsQxTyxbiK/1P73GntkdFOXeBvuHSCgrzJZJnSSQOl
	 /Vz859x+oVKqBsbLe79TDTJxtSnK4V19lhrDZRefe/PvSbWHA6AB4whxxrlUV+5xSA
	 Agj1yhpTyggsQMJ6Fd2pVPNMGf5UbICYRR1PL+1laGUgVNaCrWUJFakmEFJkuDrbbF
	 2eLH6Ly0HmqjT83NSPe/O76TXxTcYlXcz/mCSOA23wkMsw8tFtneHAA/s75bSTtpyA
	 yQqiemBqOuyzg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52e9f788e7bso3874383e87.0;
        Sun, 14 Jul 2024 01:58:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYk8Od0g67eXFj/eYmn//f2zr3nnqoBtVZNHonmj6mFVeNxCBG3ORkY47d8edz279wUZYVPvD2lvZF/ba97NqC+LtD3bnxGWVbp75a3fQURL382HJ6ArzbWnapS1ZEZ3G+JG4HVWVz0JA3
X-Gm-Message-State: AOJu0YzpdJVkh2+xMRwYVe5QFV5jnB35MkrmbxyO8H1Dt0ywRCOGeumE
	/kvslI/CWt2eOQxYPJtA8gov3HffASUoj/Kjp9ufUB56gVkfAwKpnuUgYiXJrlqA+UMpAmiXk+L
	Tl/J2uIX0VfuK6yyOc4QSUIWY8iA=
X-Google-Smtp-Source: AGHT+IEKLvcFKjcHR3qLvfEwreuHN8SViodH/eEGNWi155RbFQy5cmbbOl0RPnR4ItUs34OYfDEXACbAoFaFOllaqgQ=
X-Received: by 2002:ac2:5e37:0:b0:52e:9fd9:2414 with SMTP id
 2adb3069b0e04-52eb999a6d4mr8012070e87.34.1720947496135; Sun, 14 Jul 2024
 01:58:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710-kbuild-pacman-pkg-v4-1-507bb5b79b2a@weissschuh.net>
In-Reply-To: <20240710-kbuild-pacman-pkg-v4-1-507bb5b79b2a@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 14 Jul 2024 17:57:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbqC2=7Fba1xO0McDpLxmCMNQhoX0ZJByiV9MrNUW87Q@mail.gmail.com>
Message-ID: <CAK7LNAQbqC2=7Fba1xO0McDpLxmCMNQhoX0ZJByiV9MrNUW87Q@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: add script and target to generate pacman package
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 4:32=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
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
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
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


Personally, I prefer the brace form ${MAKE}, but
indeed, there is no treewide consistency.







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
>  .gitignore               |  6 ++++
>  Makefile                 |  2 +-
>  scripts/Makefile.package | 16 ++++++++++
>  scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 106 insertions(+), 1 deletion(-)
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
> index b25b5b44af10..79e8dcec6be9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1497,7 +1497,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.symve=
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
> index bf016af8bf8a..a5b5b899d90c 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -141,6 +141,21 @@ snap-pkg:
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



I really hoped to avoid the symlink and

   makepkg -p $(srctree)/scripts/package/PKGBUILD

would work instead.


However, I got this error.

  makepkg -p /home/masahiro/ref/linux/scripts/package/PKGBUILD
  =3D=3D> ERROR: /home/masahiro/ref/linux/scripts/package/PKGBUILD must be
in the current working directory.



So, the -p option does not seem to be useful here.

I hope somebody in the Arch Linux community would consider
supporting PKGBUILD located in a different directory.






> +       cd $(objtree) && \


objtree is always '.'


You are doing "cd . && makepkg"

It is meaningless.



> +               srctree=3D"$(realpath $(srctree))" \

Is this necessary?


> +               objtree=3D"$(realpath $(objtree))" \
> +               BUILDDIR=3D"$(realpath $(objtree))/pacman" \


     BUILDDIR=3Dpacman


> +               CARCH=3D"$(UTS_MACHINE)" \
> +               KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \


Please explain why this is necessary.


With '!makeflags' dropped from options,
it worked for me without MAKEFLAGS/KBUILD_MAKEFLAGS
conversion.


> +               KBUILD_REVISION=3D"$(shell $(srctree)/init/build-version)=
" \


You are inventing more and more new env variables.

How about this?

   pkgrel=3D"$(${srctree}/init/build-version)"



> +               makepkg
> +
>  # dir-pkg tar*-pkg - tarball targets
>  # ----------------------------------------------------------------------=
-----
>
> @@ -221,6 +236,7 @@ help:
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
> index 000000000000..b0b133ac28eb
> --- /dev/null
> +++ b/scripts/package/PKGBUILD
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Maintainer: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> +
> +pkgbase=3Dlinux-upstream
> +pkgname=3D("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> +pkgver=3D"${KERNELRELEASE//-/_}"
> +pkgrel=3D"$KBUILD_REVISION"
> +pkgdesc=3D'Linux'
> +url=3D'https://www.kernel.org/'
> +arch=3D($CARCH)
> +options=3D(!debug !strip !buildflags !makeflags)
> +license=3D(GPL-2.0-only)


makedepends=3D(
     ...
)

is missing. Is it intentional?




> +build() {
> +  export MAKEFLAGS=3D"$KBUILD_MAKEFLAGS"
> +  cd "$objtree"
> +
> +  # makepkg does a "chmod a-srw", triggering warnings during kbuild
> +  chmod 0755 "$pkgdirbase" || true
> +
> +  $MAKE -f "$srctree/Makefile"

The -f option is unneeded.

Just simply:

      ${MAKE}





> +}
> +
> +package_linux-upstream() {
> +  pkgdesc=3D"The $pkgdesc kernel and modules"
> +
> +  export MAKEFLAGS=3D"$KBUILD_MAKEFLAGS"
> +  cd "$objtree"
> +  local modulesdir=3D"$pkgdir/usr/$MODLIB"
> +
> +  echo "Installing boot image..."
> +  # systemd expects to find the kernel here to allow hibernation
> +  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab812=
8dcf99161d2344
> +  install -Dm644 "$($MAKE -s image_name)" "$modulesdir/vmlinuz"
> +
> +  # Used by mkinitcpio to name the kernel
> +  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
> +
> +  echo "Installing modules..."
> +  $MAKE INSTALL_MOD_PATH=3D"$pkgdir/usr" INSTALL_MOD_STRIP=3D1 \
> +    DEPMOD=3Dtrue modules_install
> +
> +  if $MAKE run-command KBUILD_RUN_COMMAND=3D'test -d $srctree/arch/$SRCA=
RCH/boot/dts' 2>/dev/null; then
> +    echo "Installing dtbs..."
> +    $MAKE INSTALL_DTBS_PATH=3D"$modulesdir/dtb" dtbs_install
> +  fi
> +
> +  # remove build link, will be part of -headers package
> +  rm -f "$modulesdir/build"
> +}
> +
> +package_linux-upstream-headers() {
> +  pkgdesc=3D"Headers and scripts for building modules for the $pkgdesc k=
ernel"
> +
> +  export MAKEFLAGS=3D"$KBUILD_MAKEFLAGS"
> +  cd "$objtree"
> +  local builddir=3D"$pkgdir/usr/$MODLIB/build"
> +
> +  echo "Installing build files..."
> +  "$srctree/scripts/package/install-extmod-build" "$builddir"
> +
> +  echo "Installing System.map and config..."
> +  cp System.map "$builddir/System.map"
> +  cp .config "$builddir/.config"
> +
> +  echo "Adding symlink..."
> +  mkdir -p "$pkgdir/usr/src"
> +  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
> +}
> +
> +package_linux-upstream-api-headers() {
> +  pkgdesc=3D"Kernel headers sanitized for use in userspace"
> +  provides=3D(linux-api-headers)
> +  conflicts=3D(linux-api-headers)
> +
> +  export MAKEFLAGS=3D"$KBUILD_MAKEFLAGS"
> +  cd "$objtree"
> +
> +  $MAKE headers_install INSTALL_HDR_PATH=3D"$pkgdir/usr"
> +}
> +
> +# vim:set ts=3D8 sts=3D2 sw=3D2 et:



Documentation/process/coding-style.rst
discourages this.


 """
        /* vim:set sw=3D8 noet */

 Do not include any of these in source files.
 """




If you need to specify this in .editorconfig



I do not know the style guide of PKGCONFIG.
Does it conventionally use 2-space indentation?






--
Best Regards
Masahiro Yamada

