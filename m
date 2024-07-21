Return-Path: <linux-kbuild+bounces-2609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 797F093834E
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 05:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D215EB210BB
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 03:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3711361;
	Sun, 21 Jul 2024 03:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iujDrJzh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A020E6;
	Sun, 21 Jul 2024 03:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721532731; cv=none; b=F1kW5knv8OAO6bWcnXSGCITNN1OZSD2V75EtMcAreODObTVCrM2yIQzBQMgWx1k3rVYgHkxSYivVICiU0YDuW2HaWLmw+fJpQ4Sz78yPuI/OPtNvTOSA7pbwx6xEdRBqhDXn7OxtSP/Vmra8E6b4Jcs2LXTr+n/6zK33yyRZT6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721532731; c=relaxed/simple;
	bh=Z9nLLVDEF1f373PdtXdDyeXMYQXiVp6kQPuzD8Y40SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3h2d+vn2TSJfN8osquIIkwueK2F7h9G3NZ8Di9EsVu49kJ+1Z5U1unKI4lDNuthXv8ORTDn5P5WcOQKz+kbbRPvx6z2kBzK0iJvpLMPzfib8zXrHNsCY0C5LVpvCwOQziQGvNIvGOcwlE0hZWA+gmcO2NANSj3sk23WX/diGiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iujDrJzh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1949C116B1;
	Sun, 21 Jul 2024 03:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721532731;
	bh=Z9nLLVDEF1f373PdtXdDyeXMYQXiVp6kQPuzD8Y40SE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iujDrJzhxCTG0FGpVk3kpwWLwKkhjvRBVma1l8W+qfL4TFjz/oSSPAm2vrPWRCR68
	 84zEmitzp86q3lefsr40LOME9KxTe4DnLVAoXTXb39F2WWtVwJ8OZcLQVYUu3kBO51
	 PGU7BEkk7H4VWO2DoKgjh7JojB1b4oejzj7TW4UR6oc8Aq2Ol7FODV6xLp2mgMTm8y
	 LqklhsgsP7e3Ck338vCPYw1u6aR45uVz154onnZbx6DcFijgeiSZ3s+m3Hn54vDfAx
	 ukr1ce2LnYg9NashefrTriNj6dcaMrQ4tWd5qf/ySTbEvbHW2XmLjqPOE4baMsw/Kh
	 QKvd3Lei5mTIg==
Date: Sat, 20 Jul 2024 20:32:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	Christian Heusel <christian@heusel.eu>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v7] kbuild: add script and target to generate pacman
 package
Message-ID: <20240721033209.GA545406@thelio-3990X>
References: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>

Hi Thomas,

On Sat, Jul 20, 2024 at 11:18:12AM +0200, Thomas Weiﬂschuh wrote:
> pacman is the package manager used by Arch Linux and its derivates.
> Creating native packages from the kernel tree has multiple advantages:
> 
> * The package triggers the correct hooks for initramfs generation and
>   bootloader configuration
> * Uninstallation is complete and also invokes the relevant hooks
> * New UAPI headers can be installed without any manual bookkeeping
> 
> The PKGBUILD file is a modified version of the one used for the
> downstream Arch Linux "linux" package.
> Extra steps that should not be necessary for a development kernel have
> been removed and an UAPI header package has been added.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---

I think this looks really solid now, thanks again for the PACMAN_PKGBASE
addition.

I tested building Arch Linux's configuration for x86_64 and booting it
in a VM. I built Fedora's configuration for aarch64 just to test the
cross building aspect and making sure the result of various bits that we
added that would not affect x86 (such as the dtb installation) looked
reasonable.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> Changes in v7:
> - Make pkgbase configurable
> - Add more information to pkgdesc
> - Drop base-devel from makedepends
> - Drop now unneeded "chmod"
> - Make sure KERNELRELEASE and KBUILD_BUILD_VERSION are correct
> - Add MAINTAINERS entry
> - Use absolute path to BUILDDIR again, as makepkg doesn't work otherwise
> - Drop Reviewed-by and Tested-by as a fair amount of changes has been
>   done since
> - Link to v6: https://lore.kernel.org/r/20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net
> 
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
>  .gitignore               |   6 +++
>  MAINTAINERS              |   7 +++
>  Makefile                 |   2 +-
>  scripts/Makefile.package |  14 ++++++
>  scripts/package/PKGBUILD | 108 +++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 136 insertions(+), 1 deletion(-)
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
> diff --git a/MAINTAINERS b/MAINTAINERS
> index da5352dbd4f3..16f8e13aa4c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11997,6 +11997,13 @@ F:	include/uapi/linux/nfsd/
>  F:	include/uapi/linux/sunrpc/
>  F:	net/sunrpc/
>  
> +KERNEL PACMAN PACKAGING (in addition to generic KERNEL BUILD)
> +M:	Thomas Weiﬂschuh <linux@weissschuh.net>
> +R:	Christian Heusel <christian@heusel.eu>
> +R:	Nathan Chancellor <nathan@kernel.org>
> +S:	Maintained
> +F:	scripts/package/PKGBUILD
> +
>  KERNEL REGRESSIONS
>  M:	Thorsten Leemhuis <linux@leemhuis.info>
>  L:	regressions@lists.linux.dev
> diff --git a/Makefile b/Makefile
> index c97d6404b891..943899656977 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1487,7 +1487,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
>  		  arch/$(SRCARCH)/include/generated .objdiff \
> -		  debian snap tar-install \
> +		  debian snap tar-install PKGBUILD pacman \
>  		  .config .config.old .version \
>  		  Module.symvers \
>  		  certs/signing_key.pem \
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index bf016af8bf8a..94357f47d2fa 100644
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
> +		BUILDDIR="$(realpath pacman)" \
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
> index 000000000000..663ce300dd06
> --- /dev/null
> +++ b/scripts/package/PKGBUILD
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Maintainer: Thomas Weiﬂschuh <linux@weissschuh.net>
> +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> +
> +pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> +pkgname=("${pkgbase}" "${pkgbase}-api-headers")
> +if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> +	pkgname+=("${pkgbase}-headers")
> +fi
> +pkgver="${KERNELRELEASE//-/_}"
> +# The PKGBUILD is evaluated multiple times.
> +# Running scripts/build-version from here would introduce inconsistencies.
> +pkgrel="${KBUILD_REVISION}"
> +pkgdesc='Upstream Linux'
> +url='https://www.kernel.org/'
> +# Enable flexible cross-compilation
> +arch=(${CARCH})
> +license=(GPL-2.0-only)
> +makedepends=(
> +	bc
> +	bison
> +	cpio
> +	flex
> +	gettext
> +	kmod
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
> +	${MAKE} KERNELRELEASE="${KERNELRELEASE}" KBUILD_BUILD_VERSION="${pkgrel}"
> +}
> +
> +_package() {
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
> +		echo "Installing dtbs..."
> +		${MAKE} INSTALL_DTBS_PATH="${modulesdir}/dtb" dtbs_install
> +	fi
> +
> +	# remove build link, will be part of -headers package
> +	rm -f "${modulesdir}/build"
> +}
> +
> +_package-headers() {
> +	pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
> +
> +	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +	cd "${objtree}"
> +	local builddir="${pkgdir}/usr/${MODLIB}/build"
> +
> +	echo "Installing build files..."
> +	"${srctree}/scripts/package/install-extmod-build" "${builddir}"
> +
> +	echo "Installing System.map and config..."
> +	cp System.map "${builddir}/System.map"
> +	cp .config "${builddir}/.config"
> +
> +	echo "Adding symlink..."
> +	mkdir -p "${pkgdir}/usr/src"
> +	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
> +}
> +
> +_package-api-headers() {
> +	pkgdesc="Kernel headers sanitized for use in userspace"
> +	provides=(linux-api-headers)
> +	conflicts=(linux-api-headers)
> +
> +	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +	cd "${objtree}"
> +
> +	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
> +}
> +
> +for _p in "${pkgname[@]}"; do
> +	eval "package_$_p() {
> +		$(declare -f "_package${_p#$pkgbase}")
> +		_package${_p#$pkgbase}
> +	}"
> +done
> 
> ---
> base-commit: 6e6ef2da3a28f3e02fd204b4f8821030b61f8cd4
> change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

