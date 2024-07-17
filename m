Return-Path: <linux-kbuild+bounces-2559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB79334E8
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 03:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9A7BB20FB1
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 01:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC230ED8;
	Wed, 17 Jul 2024 01:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mz5HdWVD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96536D;
	Wed, 17 Jul 2024 01:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721178917; cv=none; b=aucqtW/6EPKoj9oMGIYq/9/1RZC/1L7nSLZCt8K3VQmb7KhpZnndE/lskrJapaKIUKm7VbFwUOQ0yZzulcDUps1c/PArv49s2UpIXT60QIF4vg7lYzJlqPQXHaRVSBrMCThTHZb4/kBbJVN0POIGkH7qCVS6MX9es4Cy3g9psT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721178917; c=relaxed/simple;
	bh=RtUSokA7N3oWuxrdHS5tXYcxzR1xyqfoolt71QB1qRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqbqhUnN6C7Izj20HywPPtEriBq614jJn05VdI6mboFtuW5TKuBGnhuTaZA6wLds1yDixDgpA5PpVNujuzzeeBTG8b5lBiomNdtBtbiIaDbQxBq79R1MYZIwd1LSL1npvzFSSjUPbzxXtM40FSrjkM/F8iqQ8ewsEBn5mz0sSco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mz5HdWVD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E58C116B1;
	Wed, 17 Jul 2024 01:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721178917;
	bh=RtUSokA7N3oWuxrdHS5tXYcxzR1xyqfoolt71QB1qRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mz5HdWVDGFPC8pFcmPNvE2BurInkMuX2CwORChqm9eAqFcp6I0CuQBExIaJUHCiO9
	 QrawG/vl0ZOmcuuXIhY9ij1X3i9J08MNovm22/ahF49l1Ci5eWalH9Tj2pxBeeg7uD
	 YCpsQXQYtY52ZiTCdu7fGvF+gW/yAH22ctgwglTNyL7xV60DlXOMBflC8S9Z/w7xok
	 G2fl7ocSXVScfItw8avzVUrLzpKyuh7yFGh1uRHVA8k3kFqSvCJZsr9KTWZGbG9X8d
	 el/ZSkfAt5bKdQVnslyyEJRSrDwj9OEgRLvIC5IpBaoP4GWzcGznQdnCvjHsPUlBlU
	 1jhlJxRclg4XQ==
Date: Tue, 16 Jul 2024 18:15:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <20240717011515.GA1230090@thelio-3990X>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>

Hi Thomas,

On Tue, Jul 16, 2024 at 07:52:14PM +0200, Thomas Weißschuh wrote:
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
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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
> - Link to v5: https://lore.kernel.org/r/20240714-kbuild-pacman-pkg-v5-1-0598460bc918@weissschuh.net
> 
> Changes in v5:
> - Rebase onto kbuild/for-next
> - Use new path to build-version script (from kbuild/for-next)
> - Ensure submake jobserver delegation works
> - Simplify $modulesdir/pkgbase file creation
> - Add Reviewed-by from Nicolas
> - Link to v4: https://lore.kernel.org/r/20240710-kbuild-pacman-pkg-v4-1-507bb5b79b2a@weissschuh.net
> 
> Changes in v4:
> - Update MRPROPER_FILES
> - Unify shell variable syntax
> - Link to v3: https://lore.kernel.org/r/20240708-kbuild-pacman-pkg-v3-1-885df3cbc740@weissschuh.net
> 
> Changes in v3:
> - Enforce matching architectures for installation
> - Add Reviewed-by and Tested-by from Nathan
> - Link to v2: https://lore.kernel.org/r/20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net
> 
> Changes in v2:
> - Replace ${MAKE} with $MAKE for consistency with other variables
> - Use $MAKE for "-s image_name"
> - Avoid permission warnings from build directory
> - Clarify reason for /build symlink removal
> - Install System.map and config
> - Install dtbs where available
> - Allow cross-build through arch=any
> - Sort Contributor/Maintainer chronologically
> - Disable some unneeded makepkg options
> - Use DEPMOD=true for consistency with rpm-package
> - Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net
> ---
>  .gitignore               |  6 +++
>  Makefile                 |  2 +-
>  scripts/Makefile.package | 14 +++++++
>  scripts/package/PKGBUILD | 99 ++++++++++++++++++++++++++++++++++++++++++++++++
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
> @@ -1481,7 +1481,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
>  		  arch/$(SRCARCH)/include/generated .objdiff \
> -		  debian snap tar-install \
> +		  debian snap tar-install PKGBUILD pacman \
>  		  .config .config.old .version \
>  		  Module.symvers \
>  		  certs/signing_key.pem \
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index bf016af8bf8a..0aaa0832279c 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -141,6 +141,19 @@ snap-pkg:
>  	cd $(objtree)/snap && \
>  	snapcraft --target-arch=$(UTS_MACHINE)
>  
> +# pacman-pkg
> +# ---------------------------------------------------------------------------
> +
> +PHONY += pacman-pkg
> +pacman-pkg:
> +	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> +	+objtree="$(realpath $(objtree))" \
> +		BUILDDIR=pacman \
> +		CARCH="$(UTS_MACHINE)" \
> +		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> +		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
> +		makepkg
> +
>  # dir-pkg tar*-pkg - tarball targets
>  # ---------------------------------------------------------------------------
>  
> @@ -221,6 +234,7 @@ help:
>  	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
>  	@echo '  snap-pkg            - Build only the binary kernel snap package'
>  	@echo '                        (will connect to external hosts)'
> +	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
>  	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
>  	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
>  	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> new file mode 100644
> index 000000000000..eb3957fad915
> --- /dev/null
> +++ b/scripts/package/PKGBUILD
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> +
> +pkgbase=linux-upstream
> +pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
> +pkgver="${KERNELRELEASE//-/_}"
> +# The PKGBUILD is evaluated multiple times.
> +# Running scripts/build-version from here would introduce inconsistencies.
> +pkgrel="${KBUILD_REVISION}"
> +pkgdesc='Linux'
> +url='https://www.kernel.org/'
> +# Enable flexible cross-compilation
> +arch=(${CARCH})
> +license=(GPL-2.0-only)
> +makedepends=(
> +	base-devel
> +	bc
> +	cpio
> +	gettext
> +	libelf
> +	openssl
> +	pahole
> +	perl
> +	python
> +	rsync
> +	tar
> +)
> +options=(!debug !strip !buildflags !makeflags)
> +
> +build() {
> +	# MAKEFLAGS from makepkg.conf override the ones inherited from kbuild.
> +	# Bypass this override with a custom variable.
> +	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +	cd "${objtree}"
> +
> +	# makepkg does a "chmod a-srw", triggering warnings during kbuild
> +	chmod 0755 "${pkgdirbase}" || true
> +
> +	${MAKE}
> +}
> +
> +package_linux-upstream() {
> +	pkgdesc="The ${pkgdesc} kernel and modules"
> +
> +	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +	cd "${objtree}"
> +	local modulesdir="${pkgdir}/usr/${MODLIB}"
> +
> +	echo "Installing boot image..."
> +	# systemd expects to find the kernel here to allow hibernation
> +	# https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
> +	install -Dm644 "$(${MAKE} -s image_name)" "${modulesdir}/vmlinuz"
> +
> +	# Used by mkinitcpio to name the kernel
> +	echo "${pkgbase}" > "${modulesdir}/pkgbase"
> +
> +	echo "Installing modules..."
> +	${MAKE} INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 \
> +		DEPMOD=true modules_install
> +
> +	if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then

Does this reference to srctree...

> +		echo "Installing dtbs..."
> +		${MAKE} INSTALL_DTBS_PATH="${modulesdir}/dtb" dtbs_install
> +	fi
> +
> +	# remove build link, will be part of -headers package
> +	rm -f "${modulesdir}/build"
> +}
> +
> +package_linux-upstream-headers() {
> +	pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
> +
> +	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +	cd "${objtree}"
> +	local builddir="${pkgdir}/usr/${MODLIB}/build"
> +
> +	echo "Installing build files..."
> +	"${srctree}/scripts/package/install-extmod-build" "${builddir}"

and this one still work with srctree no longer being passed to makepkg?

I tried myself but it looks like this version of the patch might be
broken?

$ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- O=/mnt/nvme/tmp/build/linux mrproper defconfig pacman-pkg
find: ‘./pacman/linux-upstream/src/pacman/linux-upstream/pkg’: Permission denied
==> Making package: linux-upstream 6.10.0_rc7_00051_g818e9c998b04_dirty-1 (Tue 16 Jul 2024 06:08:29 PM MST)
==> Checking runtime dependencies...
==> Checking buildtime dependencies...
==> Retrieving sources...
==> Extracting sources...
==> Starting build()...
chmod: cannot access 'pacman/linux-upstream/pkg': No such file or directory
find: ‘./pacman/linux-upstream/src/pacman/linux-upstream/pkg’: Permission denied
==> Entering fakeroot environment...
chmod: cannot access '/mnt/nvme/tmp/build/linux/pacman/linux-upstream/pkg': No such file or directory
/usr/bin/fakeroot: line 178: 2633185 User defined signal 1   FAKEROOTKEY=$FAKEROOTKEY LD_LIBRARY_PATH="$PATHS" LD_PRELOAD="$FAKEROOT_LIB" "$@"
make[4]: *** [scripts/Makefile.package:150: pacman-pkg] Error 138

Cheers,
Nathan

> +	echo "Installing System.map and config..."
> +	cp System.map "${builddir}/System.map"
> +	cp .config "${builddir}/.config"
> +
> +	echo "Adding symlink..."
> +	mkdir -p "${pkgdir}/usr/src"
> +	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
> +}
> +
> +package_linux-upstream-api-headers() {
> +	pkgdesc="Kernel headers sanitized for use in userspace"
> +	provides=(linux-api-headers)
> +	conflicts=(linux-api-headers)
> +
> +	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +	cd "${objtree}"
> +
> +	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
> +}
> 
> ---
> base-commit: 818e9c998b04d6c69a510d5255a93d0e3b8d4993
> change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036
> 
> Best regards,
> -- 
> Thomas Weißschuh <linux@weissschuh.net>
> 

