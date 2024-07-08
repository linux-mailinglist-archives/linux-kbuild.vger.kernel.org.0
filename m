Return-Path: <linux-kbuild+bounces-2425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F048929BCD
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 07:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38CD928135E
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 05:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C932566A;
	Mon,  8 Jul 2024 05:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hx1Yx036"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276A171A5;
	Mon,  8 Jul 2024 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720417849; cv=none; b=c39z1w1xeRbKUD/vdgrZB8dqNsfW8SOK9qbDXJd2tjdkyGD7e1Npp+WBxb7z/vYSgLjlslFcpMgS5pgHThXM41kU4y9ZIOijhHj/m9KqsyJ3wF0tBEkyUQP5pIslpTufuBFB7cYFwBaurSHjwNRtMAdrC7w7tOvlj+wsATALyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720417849; c=relaxed/simple;
	bh=u0wE8yIjYFYNSTj21s/9/1U/Z8OIEXthoLLDovwwkdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phrzIOA31ka2hJhI/KaW4bpSY8KsMF4lB8pf8gQwG5ZQcfbO4WGKAXT/iapdadQA8nxXVoAVXW7tUgZbKc1woaEUI/rpM8uKKF/oM2L8ZvgxSdYmzJLQTCGKwyzZJn3ktVlqdBmin6nZ1/cGpiMPhdD6WHXPUx4EYzBfrgG4WNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hx1Yx036; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE2EC116B1;
	Mon,  8 Jul 2024 05:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720417848;
	bh=u0wE8yIjYFYNSTj21s/9/1U/Z8OIEXthoLLDovwwkdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hx1Yx0360396+5vlDWjOsXycXocERWaTzhaJkL9J+iAeZQPfYDbw2s+Xgd26Pi9sN
	 GPwPm7jpv606P+ZF+jSlJ2g2SMZGxwHbc4Guoe5OpHLmtmKBhoevsW6IbJ2Dws1KkG
	 hV8AayrtBlvaatrq1hh6WJSSpomHS/yOMieaVNgbC7JzLmv+uCuxZZqEJ3oCaEeW/d
	 3ORx/nUlRAdljp7dDPW6YS8YlkZfjVf/v2LzpbODGl3obajeis74Cb/CGTfQltwwmk
	 Ta1LtFHtg7s8HtdfSETB7SKzh3jl4D6knBk2iLWJpKqmRIXakVCItjFLQvzPrAEo1f
	 ixseqzi0jQnBQ==
Date: Sun, 7 Jul 2024 22:50:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: add script and target to generate pacman
 package
Message-ID: <20240708055046.GB1968570@thelio-3990X>
References: <20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net>

Hi Thomas,

On Sat, Jul 06, 2024 at 09:33:46AM +0200, Thomas Weiﬂschuh wrote:
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
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Thanks a lot for addressing my comments. From a PKGBUILD perspective,
this looks good to me (I have a couple more comments below). I am not as
familiar with the Kbuild packaging infrastructure, so Masahiro might
have more comments on that, but it works for me in my basic testing so
consider it:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
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
>  .gitignore               |  6 ++++
>  scripts/Makefile.package | 15 +++++++++
>  scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 104 insertions(+)
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
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index bf016af8bf8a..8c0c80f8bec0 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -141,6 +141,20 @@ snap-pkg:
>  	cd $(objtree)/snap && \
>  	snapcraft --target-arch=$(UTS_MACHINE)
>  
> +# pacman-pkg
> +# ---------------------------------------------------------------------------
> +
> +PHONY += pacman-pkg
> +pacman-pkg:
> +	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> +	cd $(objtree) && \
> +		srctree="$(realpath $(srctree))" \
> +		objtree="$(realpath $(objtree))" \
> +		BUILDDIR="$(realpath $(objtree))/pacman" \
> +		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
> +		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
> +		makepkg
> +
>  # dir-pkg tar*-pkg - tarball targets
>  # ---------------------------------------------------------------------------
>  
> @@ -221,6 +235,7 @@ help:
>  	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
>  	@echo '  snap-pkg            - Build only the binary kernel snap package'
>  	@echo '                        (will connect to external hosts)'
> +	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
>  	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
>  	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
>  	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> new file mode 100644
> index 000000000000..fe899c77a976
> --- /dev/null
> +++ b/scripts/package/PKGBUILD
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Maintainer: Thomas Weiﬂschuh <linux@weissschuh.net>
> +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> +
> +pkgbase=linux-upstream
> +pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
> +pkgver="${KERNELRELEASE//-/_}"
> +pkgrel="$KBUILD_REVISION"
> +pkgdesc='Linux'
> +url='https://www.kernel.org/'
> +arch=(any)

I see why you went this way but this feels a little dangerous because
this means the package will be installable on architectures other than
the one that it is built for. I think a better solution for this problem
would be moving arch back to $UTS_MACHINE but setting CARCH to that same
value in scripts/Makefile.package above. This diff works for me,
allowing me to build an aarch64 package on x86_64:

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 8c0c80f8bec0..a5b5b899d90c 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -151,6 +151,7 @@ pacman-pkg:
 		srctree="$(realpath $(srctree))" \
 		objtree="$(realpath $(objtree))" \
 		BUILDDIR="$(realpath $(objtree))/pacman" \
+		CARCH="$(UTS_MACHINE)" \
 		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
 		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
 		makepkg
diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index fe899c77a976..7f1a4588c3d3 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -8,7 +8,7 @@ pkgver="${KERNELRELEASE//-/_}"
 pkgrel="$KBUILD_REVISION"
 pkgdesc='Linux'
 url='https://www.kernel.org/'
-arch=(any)
+arch=($UTS_MACHINE)
 options=(!debug !strip !buildflags !makeflags)
 license=(GPL-2.0-only)
 

> +options=(!debug !strip !buildflags !makeflags)
> +license=(GPL-2.0-only)
> +
> +build() {
> +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +  cd "$objtree"
> +
> +  # makepkg does a "chmod a-srw", triggering warnings during kbuild
> +  chmod 0755 "$pkgdirbase" || true
> +
> +  $MAKE -f "${srctree}/Makefile"
> +}
> +
> +package_linux-upstream() {
> +  pkgdesc="The $pkgdesc kernel and modules"
> +
> +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +  cd "$objtree"
> +  local modulesdir="$pkgdir/usr/$MODLIB"
> +
> +  echo "Installing boot image..."
> +  # systemd expects to find the kernel here to allow hibernation
> +  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
> +  install -Dm644 "$($MAKE -s image_name)" "$modulesdir/vmlinuz"
> +
> +  # Used by mkinitcpio to name the kernel
> +  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
> +
> +  echo "Installing modules..."
> +  $MAKE INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
> +    DEPMOD=true modules_install
> +
> +  if $MAKE run-command KBUILD_RUN_COMMAND='test -d ${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
> +    echo "Installing dtbs..."
> +    $MAKE INSTALL_DTBS_PATH="$modulesdir/dtb" dtbs_install
> +  fi
> +
> +  # remove build link, will be part of -headers package
> +  rm -f "$modulesdir/build"
> +}
> +
> +package_linux-upstream-headers() {
> +  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
> +
> +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +  cd "$objtree"
> +  local builddir="$pkgdir/usr/$MODLIB/build"
> +
> +  echo "Installing build files..."
> +  "$srctree/scripts/package/install-extmod-build" "$builddir"
> +
> +  echo "Installing System.map and config..."
> +  cp System.map "$builddir/System.map"
> +  cp .config "$builddir/.config"

Remove the dot on the installation location so that it is more visible.

> +  echo "Adding symlink..."
> +  mkdir -p "$pkgdir/usr/src"
> +  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
> +}
> +
> +package_linux-upstream-api-headers() {
> +  pkgdesc="Kernel headers sanitized for use in userspace"
> +  provides=(linux-api-headers)
> +  conflicts=(linux-api-headers)
> +
> +  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
> +  cd "$objtree"
> +
> +  $MAKE headers_install INSTALL_HDR_PATH="$pkgdir/usr"
> +}
> +
> +# vim:set ts=8 sts=2 sw=2 et:
> 
> ---
> base-commit: 1dd28064d4164a4dc9096fd1a7990d2de15f2bb6
> change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

