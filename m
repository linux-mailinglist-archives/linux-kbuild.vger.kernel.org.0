Return-Path: <linux-kbuild+bounces-2409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF155929186
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 09:34:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4270C1F21FC7
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 07:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C8E1CA96;
	Sat,  6 Jul 2024 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="o5Xs5d0j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A111B947;
	Sat,  6 Jul 2024 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720251257; cv=none; b=fdRogRpMZH99fsITZrFuOwljFeW0noxRTxmMQ7ciqCIs42s/2lWKlO2kcO0/ohRVRKQeeG+s86kdD42LswT3w1E+enJp+08iQP5x1w3kyemLZ8bhUSZCjkhIo0bE309WepNZmupBFlPbgVBeOFeeOzhitHV1sFG+oXy/cFl40zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720251257; c=relaxed/simple;
	bh=NNVk2TdwIOi/kS3Dftxh5l5p+ufzBa1s3e8HZlk63a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M9F5ljjRx7nU8V8zawd+kvWPF3KMSFO0/qXn6zIFMxfY8IF4Sru+Rleg95tct7Ue0TKPXCBIBC2cNnV2ydIBqYQl/XkePXT0pASUzkDf3whGRNG16kpTqihen0zht+rLqRfPtyCt2ZKSKWMelQ86V06bb/WvR3QqB1r64t54CLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=o5Xs5d0j; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720251243;
	bh=NNVk2TdwIOi/kS3Dftxh5l5p+ufzBa1s3e8HZlk63a4=;
	h=From:Date:Subject:To:Cc:From;
	b=o5Xs5d0jcaKqJV+b570uy/hJ+Q72UlorU+FsSYZRpc+M8qTIyZr8tR5b14aYW4lO0
	 tbRI6O910YZb5IPSDgKb8u2lm/STfMjtZgkOhAbh96238rERQ3BcIFC3dJ1nb18Gj5
	 IQmUWBqfW//GYStlNOgwwoFKO6M5dn4sS+GW24zw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 06 Jul 2024 09:33:46 +0200
Subject: [PATCH v2] kbuild: add script and target to generate pacman
 package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAFnziGYC/22Nyw6CMBBFf4V07Zi2vNSV/2FYlDKlE7Q0LaCG8
 O9W3Lo8J7nnrixiIIzskq0s4EKRRpdAHjKmrXI9AnWJmeSy4JUsYWhnunfglX4oB37ooS3MqUZ
 x7nhesbTzAQ299uatSWwpTmN47xeL+NpfrebFn9oiQIDS0lS5KY2q2+sTKcao7WyPDifWbNv2A
 aDMbdm3AAAA
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720251242; l=6155;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=NNVk2TdwIOi/kS3Dftxh5l5p+ufzBa1s3e8HZlk63a4=;
 b=5gHAgfNrPMs3Xro6uA6kL5cdRsIGXWUGhLLrwq+opjGn9peTa8u4DUAY1IN00pFMugj4KCNhY
 iEYBEcXVEorCAcAYZtN57vvomvYsYD3lCYbBMbW628e3r9hW6pn019P
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

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
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
 scripts/Makefile.package | 15 +++++++++
 scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

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
index bf016af8bf8a..8c0c80f8bec0 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -141,6 +141,20 @@ snap-pkg:
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
+		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
+		KBUILD_REVISION="$(shell $(srctree)/init/build-version)" \
+		makepkg
+
 # dir-pkg tar*-pkg - tarball targets
 # ---------------------------------------------------------------------------
 
@@ -221,6 +235,7 @@ help:
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
 	@echo '  snap-pkg            - Build only the binary kernel snap package'
 	@echo '                        (will connect to external hosts)'
+	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
 	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
new file mode 100644
index 000000000000..fe899c77a976
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
+arch=(any)
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
base-commit: 1dd28064d4164a4dc9096fd1a7990d2de15f2bb6
change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


