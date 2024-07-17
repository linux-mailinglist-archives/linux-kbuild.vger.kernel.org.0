Return-Path: <linux-kbuild+bounces-2562-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E4193391A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 10:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A371C20DFF
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 08:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1B6381DE;
	Wed, 17 Jul 2024 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdaFLbfA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454C10953;
	Wed, 17 Jul 2024 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721205290; cv=none; b=S1r9lclVqGYW8e/ql7OWOGBYsbz6t8moPWTz7yTzY66Iwx+xrnuu6LOZ7LuTJZauYx2IlFlU9dPpGCQ55MC9CjcKD/a+VjH5NDXdNU+1HdZnWxOVHJYJlB0gJ3pQJF6bgFaXOoCY+OocEEW/MThrlJzUOf7hz9XoQc7Tx9C+vNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721205290; c=relaxed/simple;
	bh=6H9lzkT32xtDE+bRhEMxKNxtHCrmsgr9zWuBVoGFewY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFapjbGP9Ot8nYz3S40+5lypr9fdebhelWJLCFgVnQUl3mcluwOzToCSEh4ZLzbZGufMonZSlSHUizNnfnV4w1QHRoEkaYatm89pSuC/VvsUiYI4zLd9Qz7qk7SRp/GDYXs4l5CbrFpQNyzbxZGkiLxkp+Phd8NoHbbyol98Lqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdaFLbfA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EBBC4AF0D;
	Wed, 17 Jul 2024 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721205289;
	bh=6H9lzkT32xtDE+bRhEMxKNxtHCrmsgr9zWuBVoGFewY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CdaFLbfAqV+6eHAemrsKvy7jRYyeazRSiayTCcMyoPlUwYh9DD/iq/fCFcTdgLkK/
	 T/er5PZYhNeWBf2UNdxd1GzFD6fN73BBfiJkItTRvnuhUi3kTaPZwB/qQnbEGcKeNO
	 dPVOutZMRXL4/whm6ocYdk9Guo7xBaU345013GrycLZgT0kCHbU8RwirwPxyHIwOaK
	 Eb8wtHrm42fnEJqkzCPy2Hg3Eo+1LDxaVpGqxWrjwK4V6C0lw57IZGyMt0FG973GFB
	 kfxQBxqDRRAoHIFLNIFUXGr4m5Lqie3MHGNXZUJ5VKn6NQCZmQHVtSOVd05fLuanCg
	 jwtvKbqGyU+Sg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eeb1051360so60437641fa.0;
        Wed, 17 Jul 2024 01:34:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWnKVzX1LVxXNlAtRAXds0x2eqiJV3Yt+4KPMIyRBOXwcvdtnzhLCWddtXoh0P2TkviqLJAJCpM6Lwe3RXxRAWVmlgXTBQ1WosS/+a4pR/B6b8NxQB/D6dfudNTe/F34KEx5d1R3kE4FIpb
X-Gm-Message-State: AOJu0YxbQLACGMfswgqvUUtUQnYG7bbNUBVMFeqAFcE7iXvlhJR62vAp
	zLWcQ+kSRjVhDwfqzSVB5WxQ4Z/TLKuByknGNMqheQ7G1l+jRG3Yh3ly86i5xN8fMIGASMlHg0b
	pRez5Y6nCZwtl7cPa64T+lr/6FDk=
X-Google-Smtp-Source: AGHT+IESbdt2YJvEd/Oj7Jm8hfdTYdxkrqR6DfzneZAzQzpYGe19v0cERkrU3Jq7v9voEWbpC8eSK2rGmfVbs1U6OdU=
X-Received: by 2002:a2e:904b:0:b0:2ec:3fb8:6a91 with SMTP id
 38308e7fff4ca-2eefd11f9d3mr7398201fa.19.1721205287947; Wed, 17 Jul 2024
 01:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net> <20240717011515.GA1230090@thelio-3990X>
In-Reply-To: <20240717011515.GA1230090@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Jul 2024 17:34:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
Message-ID: <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman package
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 10:15=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Hi Thomas,
>
> On Tue, Jul 16, 2024 at 07:52:14PM +0200, Thomas Wei=C3=9Fschuh wrote:
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
> > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> > ---
> > Changes in v6:
> > - Drop reference to srctree/Makefile
> > - Drop $(realpath $(srctree))
> > - Make use of the fact that $(objtree) is always "."
> > - Align coding style to kernel and drop vim config line
> > - Drop indirection through `$MAKE run-command`
> > - Unify shell variable syntax to "${var}"
> > - Add explanations to custom variables
> > - Add makedepends
> > - Link to v5: https://lore.kernel.org/r/20240714-kbuild-pacman-pkg-v5-1=
-0598460bc918@weissschuh.net
> >
> > Changes in v5:
> > - Rebase onto kbuild/for-next
> > - Use new path to build-version script (from kbuild/for-next)
> > - Ensure submake jobserver delegation works
> > - Simplify $modulesdir/pkgbase file creation
> > - Add Reviewed-by from Nicolas
> > - Link to v4: https://lore.kernel.org/r/20240710-kbuild-pacman-pkg-v4-1=
-507bb5b79b2a@weissschuh.net
> >
> > Changes in v4:
> > - Update MRPROPER_FILES
> > - Unify shell variable syntax
> > - Link to v3: https://lore.kernel.org/r/20240708-kbuild-pacman-pkg-v3-1=
-885df3cbc740@weissschuh.net
> >
> > Changes in v3:
> > - Enforce matching architectures for installation
> > - Add Reviewed-by and Tested-by from Nathan
> > - Link to v2: https://lore.kernel.org/r/20240706-kbuild-pacman-pkg-v2-1=
-613422a03a7a@weissschuh.net
> >
> > Changes in v2:
> > - Replace ${MAKE} with $MAKE for consistency with other variables
> > - Use $MAKE for "-s image_name"
> > - Avoid permission warnings from build directory
> > - Clarify reason for /build symlink removal
> > - Install System.map and config
> > - Install dtbs where available
> > - Allow cross-build through arch=3Dany
> > - Sort Contributor/Maintainer chronologically
> > - Disable some unneeded makepkg options
> > - Use DEPMOD=3Dtrue for consistency with rpm-package
> > - Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1-1=
-ac2f63f5fa7b@weissschuh.net
> > ---
> >  .gitignore               |  6 +++
> >  Makefile                 |  2 +-
> >  scripts/Makefile.package | 14 +++++++
> >  scripts/package/PKGBUILD | 99 ++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 120 insertions(+), 1 deletion(-)
> >
> > diff --git a/.gitignore b/.gitignore
> > index c59dc60ba62e..7902adf4f7f1 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -92,6 +92,12 @@ modules.order
> >  #
> >  /tar-install/
> >
> > +#
> > +# pacman files (make pacman-pkg)
> > +#
> > +/PKGBUILD
> > +/pacman/
> > +
> >  #
> >  # We don't want to ignore the following even if they are dot-files
> >  #
> > diff --git a/Makefile b/Makefile
> > index 7372ea45ed3f..768d3dc107f8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1481,7 +1481,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.sym=
vers \
> >  # Directories & files removed with 'make mrproper'
> >  MRPROPER_FILES +=3D include/config include/generated          \
> >                 arch/$(SRCARCH)/include/generated .objdiff \
> > -               debian snap tar-install \
> > +               debian snap tar-install PKGBUILD pacman \
> >                 .config .config.old .version \
> >                 Module.symvers \
> >                 certs/signing_key.pem \
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index bf016af8bf8a..0aaa0832279c 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -141,6 +141,19 @@ snap-pkg:
> >       cd $(objtree)/snap && \
> >       snapcraft --target-arch=3D$(UTS_MACHINE)
> >
> > +# pacman-pkg
> > +# --------------------------------------------------------------------=
-------
> > +
> > +PHONY +=3D pacman-pkg
> > +pacman-pkg:
> > +     @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> > +     +objtree=3D"$(realpath $(objtree))" \
> > +             BUILDDIR=3Dpacman \
> > +             CARCH=3D"$(UTS_MACHINE)" \
> > +             KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
> > +             KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-versi=
on)" \
> > +             makepkg
> > +
> >  # dir-pkg tar*-pkg - tarball targets
> >  # --------------------------------------------------------------------=
-------
> >
> > @@ -221,6 +234,7 @@ help:
> >       @echo '  bindeb-pkg          - Build only the binary kernel deb p=
ackage'
> >       @echo '  snap-pkg            - Build only the binary kernel snap =
package'
> >       @echo '                        (will connect to external hosts)'
> > +     @echo '  pacman-pkg          - Build only the binary kernel pacma=
n package'
> >       @echo '  dir-pkg             - Build the kernel as a plain direct=
ory structure'
> >       @echo '  tar-pkg             - Build the kernel as an uncompresse=
d tarball'
> >       @echo '  targz-pkg           - Build the kernel as a gzip compres=
sed tarball'
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > new file mode 100644
> > index 000000000000..eb3957fad915
> > --- /dev/null
> > +++ b/scripts/package/PKGBUILD
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +# Maintainer: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > +
> > +pkgbase=3Dlinux-upstream
> > +pkgname=3D("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
> > +pkgver=3D"${KERNELRELEASE//-/_}"
> > +# The PKGBUILD is evaluated multiple times.
> > +# Running scripts/build-version from here would introduce inconsistenc=
ies.
> > +pkgrel=3D"${KBUILD_REVISION}"
> > +pkgdesc=3D'Linux'
> > +url=3D'https://www.kernel.org/'
> > +# Enable flexible cross-compilation
> > +arch=3D(${CARCH})
> > +license=3D(GPL-2.0-only)
> > +makedepends=3D(
> > +     base-devel
> > +     bc
> > +     cpio
> > +     gettext
> > +     libelf
> > +     openssl
> > +     pahole
> > +     perl
> > +     python
> > +     rsync
> > +     tar
> > +)
> > +options=3D(!debug !strip !buildflags !makeflags)
> > +
> > +build() {
> > +     # MAKEFLAGS from makepkg.conf override the ones inherited from kb=
uild.
> > +     # Bypass this override with a custom variable.
> > +     export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> > +     cd "${objtree}"
> > +
> > +     # makepkg does a "chmod a-srw", triggering warnings during kbuild
> > +     chmod 0755 "${pkgdirbase}" || true
> > +
> > +     ${MAKE}
> > +}
> > +
> > +package_linux-upstream() {
> > +     pkgdesc=3D"The ${pkgdesc} kernel and modules"
> > +
> > +     export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> > +     cd "${objtree}"
> > +     local modulesdir=3D"${pkgdir}/usr/${MODLIB}"
> > +
> > +     echo "Installing boot image..."
> > +     # systemd expects to find the kernel here to allow hibernation
> > +     # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7=
ab8128dcf99161d2344
> > +     install -Dm644 "$(${MAKE} -s image_name)" "${modulesdir}/vmlinuz"
> > +
> > +     # Used by mkinitcpio to name the kernel
> > +     echo "${pkgbase}" > "${modulesdir}/pkgbase"
> > +
> > +     echo "Installing modules..."
> > +     ${MAKE} INSTALL_MOD_PATH=3D"${pkgdir}/usr" INSTALL_MOD_STRIP=3D1 =
\
> > +             DEPMOD=3Dtrue modules_install
> > +
> > +     if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
>
> Does this reference to srctree...


'srctree' is exported by the top Makefile.


This is based on the assumption that we always run
'make pacman-pkg', and we never do 'makepkg' directly.


Do you mean PKGBUILD should be self-contained
so that 'makepkg' works from the command line?



Debian and RPM work that way because we can
build a source package, then we can run
dpkg-buildpackage / rpmbuild later.



>
> > +             echo "Installing dtbs..."
> > +             ${MAKE} INSTALL_DTBS_PATH=3D"${modulesdir}/dtb" dtbs_inst=
all
> > +     fi
> > +
> > +     # remove build link, will be part of -headers package
> > +     rm -f "${modulesdir}/build"
> > +}
> > +
> > +package_linux-upstream-headers() {
> > +     pkgdesc=3D"Headers and scripts for building modules for the ${pkg=
desc} kernel"
> > +
> > +     export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> > +     cd "${objtree}"
> > +     local builddir=3D"${pkgdir}/usr/${MODLIB}/build"
> > +
> > +     echo "Installing build files..."
> > +     "${srctree}/scripts/package/install-extmod-build" "${builddir}"
>
> and this one still work with srctree no longer being passed to makepkg?
>
> I tried myself but it looks like this version of the patch might be
> broken?
>
> $ make -skj"$(nproc)" ARCH=3Dx86_64 CROSS_COMPILE=3Dx86_64-linux- O=3D/mn=
t/nvme/tmp/build/linux mrproper defconfig pacman-pkg
> find: =E2=80=98./pacman/linux-upstream/src/pacman/linux-upstream/pkg=E2=
=80=99: Permission denied
> =3D=3D> Making package: linux-upstream 6.10.0_rc7_00051_g818e9c998b04_dir=
ty-1 (Tue 16 Jul 2024 06:08:29 PM MST)
> =3D=3D> Checking runtime dependencies...
> =3D=3D> Checking buildtime dependencies...
> =3D=3D> Retrieving sources...
> =3D=3D> Extracting sources...
> =3D=3D> Starting build()...
> chmod: cannot access 'pacman/linux-upstream/pkg': No such file or directo=
ry
> find: =E2=80=98./pacman/linux-upstream/src/pacman/linux-upstream/pkg=E2=
=80=99: Permission denied
> =3D=3D> Entering fakeroot environment...
> chmod: cannot access '/mnt/nvme/tmp/build/linux/pacman/linux-upstream/pkg=
': No such file or directory
> /usr/bin/fakeroot: line 178: 2633185 User defined signal 1   FAKEROOTKEY=
=3D$FAKEROOTKEY LD_LIBRARY_PATH=3D"$PATHS" LD_PRELOAD=3D"$FAKEROOT_LIB" "$@=
"
> make[4]: *** [scripts/Makefile.package:150: pacman-pkg] Error 138


Sorry, this is due to my suggestion, BUILDDIR=3Dpacman.


Unfortunately, makepkg is tripped up by a relative path.

The 'pkg' directory is nested under the 'src' directory.

  pacman/linux-upstream/src/pacman/linux-upstream/pkg













> Cheers,
> Nathan
>
> > +     echo "Installing System.map and config..."
> > +     cp System.map "${builddir}/System.map"
> > +     cp .config "${builddir}/.config"
> > +
> > +     echo "Adding symlink..."
> > +     mkdir -p "${pkgdir}/usr/src"
> > +     ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
> > +}
> > +
> > +package_linux-upstream-api-headers() {
> > +     pkgdesc=3D"Kernel headers sanitized for use in userspace"
> > +     provides=3D(linux-api-headers)
> > +     conflicts=3D(linux-api-headers)
> > +
> > +     export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> > +     cd "${objtree}"
> > +
> > +     ${MAKE} headers_install INSTALL_HDR_PATH=3D"${pkgdir}/usr"
> > +}
> >
> > ---
> > base-commit: 818e9c998b04d6c69a510d5255a93d0e3b8d4993
> > change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036
> >
> > Best regards,
> > --
> > Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> >
>


--=20
Best Regards
Masahiro Yamada

