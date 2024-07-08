Return-Path: <linux-kbuild+bounces-2430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4C92AA67
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 22:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB43B281123
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jul 2024 20:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A16249E5;
	Mon,  8 Jul 2024 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="d+tbEXqi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6507494;
	Mon,  8 Jul 2024 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720469519; cv=none; b=qbKVMHfvI53ibN72uz/JofygTns6kLDSrUuZT8Cv8YgY0sxVPHJ7kTdcMxXEpwAeYuyeSYVffaGqADKFO5eEPjxsZlaVGupAQq/0HwOnnepYYQG9cO02n86Hy2c3H2UCTAlIAxHkqUjLn00d98QMs43lLvew5DgXbsfy9jTZ7CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720469519; c=relaxed/simple;
	bh=2CUv/cGNnBSUEkcKCb8mypTk9ZQxN4M4bEMZxtWIT4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rn7T1U6YjBWv++qPD6E9aNT2pcpV8Minq1lCkUz1EG0NVf2Vi0etP7H5Np+Y+Su38Dn+U5Mr1atKkzsaxosIbr6KkF4wyqH8Y6MSDq0bJWiEj2aQnFBL6EUpNJL/ZPQh5P92/Pt8cr1cKyN0MihEV+p7OPW3VZ9tSGamsx6yICg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=d+tbEXqi; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720469514;
	bh=2CUv/cGNnBSUEkcKCb8mypTk9ZQxN4M4bEMZxtWIT4U=;
	h=From:Date:Subject:To:Cc:From;
	b=d+tbEXqiz/kXaMJdBfMr8Kvvvzh+S1y+vZgm8fypIuYFxbPGRJB/mYBPijsFj/oer
	 RnlRGrP22tlVT2CjDLofS2T26ZO96tz5Z3tXOnh5VLrcuuNtgIkzLfc32lB31m37HW
	 5doA9c9NDqDNwpSfETCBG5pnBSTNw1BkL8CALkaA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 08 Jul 2024 22:11:51 +0200
Subject: [PATCH v3] kbuild: add script and target to generate pacman
 package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240708-kbuild-pacman-pkg-v3-1-885df3cbc740@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAZIjGYC/23NTQ6CMBCG4auYrq3pH0VdeQ/jopQpbdBCWqgaw
 t0tuDGR5fsl88yEIgQHEZ13EwqQXHSdz8H3O6St8g1gV+dGjDBBJCtwW43uXuNe6YfyuG8bXAl
 zLIGeasIlynd9AONeq3m95bYuDl14ry8SXdavVhKxoSWKKVaaGclNYVRZXZ7gYozajvbgYUALm
 dgvI7cYlhlJuWBMEa5K9cfM8/wBngVO3/4AAAA=
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720469513; l=6505;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=2CUv/cGNnBSUEkcKCb8mypTk9ZQxN4M4bEMZxtWIT4U=;
 b=6equBJM20zMrA8Bea+G52PlnUqQLgzz6G+O8JKNCEMDrDH/cqsAZXgW7dHNBkmrWhY9vnDXRw
 ltN5uHg9SIVAA83DDMMA4A8ssUzkFleFzmLc1Pxjv6/qHF6u573s+SR
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

pacman is the package manager used by Arch Linux and its derivates.
Creating native packages from the kernel tree has multiple advantages:

* The package triggers the correct hooks for initramfs generation and
  bootloader configuration
* Uninstallation is complete and also invokes the relevant hooks
* New UAPI headers can be installed without any manual bookkeeping

The PKGBUILD file is a simplified version of the one used for the
downstream Arch Linux "linux" package.
Extra steps that should not be necessary for a development kernel have
been removed and an UAPI header package has been added.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Enforce matching architectures for installation
- Add Reviewed-by and Tested-by from Nathan
- Link to v2: https://lore.kernel.org/r/20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net

Changes in v2:
- Replace ${MAKE} with $MAKE for consistency with other variables
- Use $MAKE for "-s image_name"
- Avoid permission warnings from build directory
- Clarify reason for /build symlink removal
- Install System.map and config
- Install dtbs where available
- Allow cross-build through arch=any
- Sort Contributor/Maintainer chronologically
- Disable some unneeded makepkg options
- Use DEPMOD=true for consistency with rpm-package
- Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net
---
 .gitignore               |  6 ++++
 scripts/Makefile.package | 16 ++++++++++
 scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 105 insertions(+)

diff --git a/.gitignore b/.gitignore
index c59dc60ba62e..7902adf4f7f1 100644
--- a/.gitignore
+++ b/.gitignore
@@ -92,6 +92,12 @@ modules.order
 #
 /tar-install/
 
+#
+# pacman files (make pacman-pkg)
+#
+/PKGBUILD
+/pacman/
+
 #
 # We don't want to ignore the following even if they are dot-files
 #
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index bf016af8bf8a..a5b5b899d90c 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -141,6 +141,21 @@ snap-pkg:
 	cd $(objtree)/snap && \
 	snapcraft --target-arch=$(UTS_MACHINE)
 
+# pacman-pkg
+# ---------------------------------------------------------------------------
+
+PHONY += pacman-pkg
+pacman-pkg:
+	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
+	cd $(objtree) && \
+		srctree="$(realpath $(srctree))" \
+		objtree="$(realpath $(objtree))" \
+		BUILDDIR="$(realpath $(objtree))/pacman" \
+		CARCH="$(UTS_MACHINE)" \
+		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
+		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
+		makepkg
+
 # dir-pkg tar*-pkg - tarball targets
 # ---------------------------------------------------------------------------
 
@@ -221,6 +236,7 @@ help:
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
 	@echo '  snap-pkg            - Build only the binary kernel snap package'
 	@echo '                        (will connect to external hosts)'
+	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
 	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
new file mode 100644
index 000000000000..ee4b77526b5f
--- /dev/null
+++ b/scripts/package/PKGBUILD
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
+# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
+
+pkgbase=linux-upstream
+pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
+pkgver="${KERNELRELEASE//-/_}"
+pkgrel="$KBUILD_REVISION"
+pkgdesc='Linux'
+url='https://www.kernel.org/'
+arch=($CARCH)
+options=(!debug !strip !buildflags !makeflags)
+license=(GPL-2.0-only)
+
+build() {
+  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+  cd "$objtree"
+
+  # makepkg does a "chmod a-srw", triggering warnings during kbuild
+  chmod 0755 "$pkgdirbase" || true
+
+  $MAKE -f "${srctree}/Makefile"
+}
+
+package_linux-upstream() {
+  pkgdesc="The $pkgdesc kernel and modules"
+
+  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+  cd "$objtree"
+  local modulesdir="$pkgdir/usr/$MODLIB"
+
+  echo "Installing boot image..."
+  # systemd expects to find the kernel here to allow hibernation
+  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
+  install -Dm644 "$($MAKE -s image_name)" "$modulesdir/vmlinuz"
+
+  # Used by mkinitcpio to name the kernel
+  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
+
+  echo "Installing modules..."
+  $MAKE INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
+    DEPMOD=true modules_install
+
+  if $MAKE run-command KBUILD_RUN_COMMAND='test -d ${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
+    echo "Installing dtbs..."
+    $MAKE INSTALL_DTBS_PATH="$modulesdir/dtb" dtbs_install
+  fi
+
+  # remove build link, will be part of -headers package
+  rm -f "$modulesdir/build"
+}
+
+package_linux-upstream-headers() {
+  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
+
+  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+  cd "$objtree"
+  local builddir="$pkgdir/usr/$MODLIB/build"
+
+  echo "Installing build files..."
+  "$srctree/scripts/package/install-extmod-build" "$builddir"
+
+  echo "Installing System.map and config..."
+  cp System.map "$builddir/System.map"
+  cp .config "$builddir/.config"
+
+  echo "Adding symlink..."
+  mkdir -p "$pkgdir/usr/src"
+  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
+}
+
+package_linux-upstream-api-headers() {
+  pkgdesc="Kernel headers sanitized for use in userspace"
+  provides=(linux-api-headers)
+  conflicts=(linux-api-headers)
+
+  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+  cd "$objtree"
+
+  $MAKE headers_install INSTALL_HDR_PATH="$pkgdir/usr"
+}
+
+# vim:set ts=8 sts=2 sw=2 et:

---
base-commit: 256abd8e550ce977b728be79a74e1729438b4948
change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


