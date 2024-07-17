Return-Path: <linux-kbuild+bounces-2563-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C5933969
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 10:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C28D1F22B84
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 08:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB9A39FD7;
	Wed, 17 Jul 2024 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uL48xhZq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C325C125DE;
	Wed, 17 Jul 2024 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721206321; cv=none; b=di9/jfUDBRJRx5A99FIIK7qWr19pEQMAhcCcKPkAzha68w92+muE7leW4obqIbmWu1in0Unizb3aqa9UbNWenyZrorh5CR7c7pAMishS6mC4INa0NFmlYCC+YmNdyumYA0t2qfpd2jXT3JjoRQiayDtw+W8yiPrl50y6IcXPAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721206321; c=relaxed/simple;
	bh=dEZJKl/ROKUgxw9n0ZHNrvq6XCICiBt0aSZ4pVfFQ0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=deJzpgQmn8bT+5kYWuFRPqf4d0E+BAyv78/tUpymfYl+K3ANuIAvrSasYA3QJPloR1e1xvm+a2phs91E81nhEboRpzkVEXh/y/kZEkMpGiiwfaPD2N7Kg5uGfLpNupKWxaxVsI69hshZVJysTQxFDcf3WeUNsfk6d7V25SLNgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uL48xhZq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB71C4AF09;
	Wed, 17 Jul 2024 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721206321;
	bh=dEZJKl/ROKUgxw9n0ZHNrvq6XCICiBt0aSZ4pVfFQ0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uL48xhZqCL0LGyF5pAQE3aSq3fg0HICke09gqR7x891cBaXLcjb17820RooKi4SHK
	 ESYx2E4tGNHPWrkPWyMAQmeIRNo3fhrsQa6dENQrXWywXZZNabtjt9Yg81EM5x3iQj
	 piTmMp+rv57IwPtBGo2A8IqCk7FzXbZM/Amoy9LlweH42GTXg4AnLrdaG4vEekM8mT
	 4esaS6EkdPe7wSVn+dFUkWDJ6vYwLSIkeoxLGOgQkDHJY2z+Xfxv5kL1b3P1slO+fq
	 rcec0YjjbO88x6FvthYpNUgXj4BUPK1dwPsnFtrDWoCn+EG29JJumKNK/L5ySldwZi
	 LuPpGm6RHlwCg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eefeab807dso3801251fa.3;
        Wed, 17 Jul 2024 01:52:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0fTzS7iyZTmBPi2BclSjRkeAeNMPTmQne3kGTVT2ijESNlkmQWOe5tZL9vx8r0fI0+Oac7bT7A99UlSbwM8s6skbAQW8BGItqWcefVycyvlEMhtcB17+cpy5JrQ2SBmt+DIQSJzyuWvVl
X-Gm-Message-State: AOJu0YxJFWl6vLxG1Q1N+cF3YdQm0StEYQGy0LTfryyBYKNzOp2TSfOc
	M+oCaWtNGSfdVSbv8qWfsAu6F+TbGuPbpJkHJ3Qr/0q7rJPDPXqPSMfVLCR2Jr6O2WDwTgBDfiM
	wkEyVa5TQg2hdEzFkJ0PItOrinQ4=
X-Google-Smtp-Source: AGHT+IFJb9o+gl78zkWDPyK1fPnjwn+r/FykxsrDzRC/gOB+QuevM9T/Oxsq7090qv2+k5krYpdKHGufqKnOSRnTlyU=
X-Received: by 2002:a05:651c:1a06:b0:2ee:896d:2408 with SMTP id
 38308e7fff4ca-2eefd14395cmr8102681fa.37.1721206319869; Wed, 17 Jul 2024
 01:51:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <20240717011515.GA1230090@thelio-3990X> <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
In-Reply-To: <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 17 Jul 2024 17:51:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGWu8q5dAW5tYzfiSKKtZ9t8Dm9FzRoaoZhU4d-TWswQ@mail.gmail.com>
Message-ID: <CAK7LNARGWu8q5dAW5tYzfiSKKtZ9t8Dm9FzRoaoZhU4d-TWswQ@mail.gmail.com>
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman package
To: Nathan Chancellor <nathan@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 5:34=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Jul 17, 2024 at 10:15=E2=80=AFAM Nathan Chancellor <nathan@kernel=
.org> wrote:
> >
> > Hi Thomas,
> >
> > On Tue, Jul 16, 2024 at 07:52:14PM +0200, Thomas Wei=C3=9Fschuh wrote:
> > > pacman is the package manager used by Arch Linux and its derivates.
> > > Creating native packages from the kernel tree has multiple advantages=
:
> > >
> > > * The package triggers the correct hooks for initramfs generation and
> > >   bootloader configuration
> > > * Uninstallation is complete and also invokes the relevant hooks
> > > * New UAPI headers can be installed without any manual bookkeeping
> > >
> > > The PKGBUILD file is a simplified version of the one used for the
> > > downstream Arch Linux "linux" package.
> > > Extra steps that should not be necessary for a development kernel hav=
e
> > > been removed and an UAPI header package has been added.
> > >
> > > Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > Tested-by: Nathan Chancellor <nathan@kernel.org>
> > > Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> > > ---
> > > Changes in v6:
> > > - Drop reference to srctree/Makefile
> > > - Drop $(realpath $(srctree))
> > > - Make use of the fact that $(objtree) is always "."
> > > - Align coding style to kernel and drop vim config line
> > > - Drop indirection through `$MAKE run-command`
> > > - Unify shell variable syntax to "${var}"
> > > - Add explanations to custom variables
> > > - Add makedepends
> > > - Link to v5: https://lore.kernel.org/r/20240714-kbuild-pacman-pkg-v5=
-1-0598460bc918@weissschuh.net
> > >
> > > Changes in v5:
> > > - Rebase onto kbuild/for-next
> > > - Use new path to build-version script (from kbuild/for-next)
> > > - Ensure submake jobserver delegation works
> > > - Simplify $modulesdir/pkgbase file creation
> > > - Add Reviewed-by from Nicolas
> > > - Link to v4: https://lore.kernel.org/r/20240710-kbuild-pacman-pkg-v4=
-1-507bb5b79b2a@weissschuh.net
> > >
> > > Changes in v4:
> > > - Update MRPROPER_FILES
> > > - Unify shell variable syntax
> > > - Link to v3: https://lore.kernel.org/r/20240708-kbuild-pacman-pkg-v3=
-1-885df3cbc740@weissschuh.net
> > >
> > > Changes in v3:
> > > - Enforce matching architectures for installation
> > > - Add Reviewed-by and Tested-by from Nathan
> > > - Link to v2: https://lore.kernel.org/r/20240706-kbuild-pacman-pkg-v2=
-1-613422a03a7a@weissschuh.net
> > >
> > > Changes in v2:
> > > - Replace ${MAKE} with $MAKE for consistency with other variables
> > > - Use $MAKE for "-s image_name"
> > > - Avoid permission warnings from build directory
> > > - Clarify reason for /build symlink removal
> > > - Install System.map and config
> > > - Install dtbs where available
> > > - Allow cross-build through arch=3Dany
> > > - Sort Contributor/Maintainer chronologically
> > > - Disable some unneeded makepkg options
> > > - Use DEPMOD=3Dtrue for consistency with rpm-package
> > > - Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1=
-1-ac2f63f5fa7b@weissschuh.net
> > > ---
> > >  .gitignore               |  6 +++
> > >  Makefile                 |  2 +-
> > >  scripts/Makefile.package | 14 +++++++
> > >  scripts/package/PKGBUILD | 99 ++++++++++++++++++++++++++++++++++++++=
++++++++++
> > >  4 files changed, 120 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/.gitignore b/.gitignore
> > > index c59dc60ba62e..7902adf4f7f1 100644
> > > --- a/.gitignore
> > > +++ b/.gitignore
> > > @@ -92,6 +92,12 @@ modules.order
> > >  #
> > >  /tar-install/
> > >
> > > +#
> > > +# pacman files (make pacman-pkg)
> > > +#
> > > +/PKGBUILD
> > > +/pacman/
> > > +
> > >  #
> > >  # We don't want to ignore the following even if they are dot-files
> > >  #
> > > diff --git a/Makefile b/Makefile
> > > index 7372ea45ed3f..768d3dc107f8 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1481,7 +1481,7 @@ CLEAN_FILES +=3D vmlinux.symvers modules-only.s=
ymvers \
> > >  # Directories & files removed with 'make mrproper'
> > >  MRPROPER_FILES +=3D include/config include/generated          \
> > >                 arch/$(SRCARCH)/include/generated .objdiff \
> > > -               debian snap tar-install \
> > > +               debian snap tar-install PKGBUILD pacman \
> > >                 .config .config.old .version \
> > >                 Module.symvers \
> > >                 certs/signing_key.pem \
> > > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > > index bf016af8bf8a..0aaa0832279c 100644
> > > --- a/scripts/Makefile.package
> > > +++ b/scripts/Makefile.package
> > > @@ -141,6 +141,19 @@ snap-pkg:
> > >       cd $(objtree)/snap && \
> > >       snapcraft --target-arch=3D$(UTS_MACHINE)
> > >
> > > +# pacman-pkg
> > > +# ------------------------------------------------------------------=
---------
> > > +
> > > +PHONY +=3D pacman-pkg
> > > +pacman-pkg:
> > > +     @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUIL=
D
> > > +     +objtree=3D"$(realpath $(objtree))" \
> > > +             BUILDDIR=3Dpacman \
> > > +             CARCH=3D"$(UTS_MACHINE)" \
> > > +             KBUILD_MAKEFLAGS=3D"$(MAKEFLAGS)" \
> > > +             KBUILD_REVISION=3D"$(shell $(srctree)/scripts/build-ver=
sion)" \
> > > +             makepkg
> > > +
> > >  # dir-pkg tar*-pkg - tarball targets
> > >  # ------------------------------------------------------------------=
---------
> > >
> > > @@ -221,6 +234,7 @@ help:
> > >       @echo '  bindeb-pkg          - Build only the binary kernel deb=
 package'
> > >       @echo '  snap-pkg            - Build only the binary kernel sna=
p package'
> > >       @echo '                        (will connect to external hosts)=
'
> > > +     @echo '  pacman-pkg          - Build only the binary kernel pac=
man package'
> > >       @echo '  dir-pkg             - Build the kernel as a plain dire=
ctory structure'
> > >       @echo '  tar-pkg             - Build the kernel as an uncompres=
sed tarball'
> > >       @echo '  targz-pkg           - Build the kernel as a gzip compr=
essed tarball'
> > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > new file mode 100644
> > > index 000000000000..eb3957fad915
> > > --- /dev/null
> > > +++ b/scripts/package/PKGBUILD
> > > @@ -0,0 +1,99 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +# Maintainer: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> > > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org=
>
> > > +
> > > +pkgbase=3Dlinux-upstream
> > > +pkgname=3D("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers=
")
> > > +pkgver=3D"${KERNELRELEASE//-/_}"
> > > +# The PKGBUILD is evaluated multiple times.
> > > +# Running scripts/build-version from here would introduce inconsiste=
ncies.
> > > +pkgrel=3D"${KBUILD_REVISION}"
> > > +pkgdesc=3D'Linux'
> > > +url=3D'https://www.kernel.org/'
> > > +# Enable flexible cross-compilation
> > > +arch=3D(${CARCH})
> > > +license=3D(GPL-2.0-only)
> > > +makedepends=3D(
> > > +     base-devel
> > > +     bc
> > > +     cpio
> > > +     gettext
> > > +     libelf
> > > +     openssl
> > > +     pahole
> > > +     perl
> > > +     python
> > > +     rsync
> > > +     tar
> > > +)
> > > +options=3D(!debug !strip !buildflags !makeflags)
> > > +
> > > +build() {
> > > +     # MAKEFLAGS from makepkg.conf override the ones inherited from =
kbuild.
> > > +     # Bypass this override with a custom variable.
> > > +     export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> > > +     cd "${objtree}"
> > > +
> > > +     # makepkg does a "chmod a-srw", triggering warnings during kbui=
ld
> > > +     chmod 0755 "${pkgdirbase}" || true
> > > +
> > > +     ${MAKE}
> > > +}
> > > +
> > > +package_linux-upstream() {
> > > +     pkgdesc=3D"The ${pkgdesc} kernel and modules"
> > > +
> > > +     export MAKEFLAGS=3D"${KBUILD_MAKEFLAGS}"
> > > +     cd "${objtree}"
> > > +     local modulesdir=3D"${pkgdir}/usr/${MODLIB}"
> > > +
> > > +     echo "Installing boot image..."
> > > +     # systemd expects to find the kernel here to allow hibernation
> > > +     # https://github.com/systemd/systemd/commit/edda44605f06a41fb86=
b7ab8128dcf99161d2344
> > > +     install -Dm644 "$(${MAKE} -s image_name)" "${modulesdir}/vmlinu=
z"
> > > +
> > > +     # Used by mkinitcpio to name the kernel
> > > +     echo "${pkgbase}" > "${modulesdir}/pkgbase"
> > > +
> > > +     echo "Installing modules..."
> > > +     ${MAKE} INSTALL_MOD_PATH=3D"${pkgdir}/usr" INSTALL_MOD_STRIP=3D=
1 \
> > > +             DEPMOD=3Dtrue modules_install
> > > +
> > > +     if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
> >
> > Does this reference to srctree...
>
>
> 'srctree' is exported by the top Makefile.
>
>
> This is based on the assumption that we always run
> 'make pacman-pkg', and we never do 'makepkg' directly.
>
>
> Do you mean PKGBUILD should be self-contained
> so that 'makepkg' works from the command line?
>


Perhaps, this may make sense.

Currently,
pkgname=3D("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
is hard-coded.

I do not think linux-upstream-headers make sense
when CONFIG_MODULE is disabled.



scripts/package/mkspec turns off with_devel
when CONFIG_MODULE is disabled.





--=20
Best Regards
Masahiro Yamada

