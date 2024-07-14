Return-Path: <linux-kbuild+bounces-2480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B17229308F5
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 10:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36C431F2162A
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 08:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDAF1758C;
	Sun, 14 Jul 2024 08:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WeLwVHnU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737CCAD22;
	Sun, 14 Jul 2024 08:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720944291; cv=none; b=AV1EA8ua9H8C4flIll2dqEIEHn+nTbsQ2VDhcgIZciK4G4VAdIAY9rCN2MpUHhDSDkJBA0+wMuuF4VYYiZYTVBjL4vLOWsK9cVNrDOo8mruz1lP4r+r5AbOD3UThtskXlBO+bbp3nOi0zB3unC6WRdi4hirwWrplp228W9QagVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720944291; c=relaxed/simple;
	bh=x8XXW+gscgcNq3poEZLK+gkugH2nL6K8tBXwx6hkL8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iufACFVXFp2s/hkN/DarpQ32yB4dmvce2Di9XyIHddO42Ypj3tizKI2Cnjy6j/qvADL1Li+CvML05welLAHsosX4vg89o6B14De66A6UVOD9f4DiRuLytpVKFSktQ4BOUfVpU/6fTCSoe4m3r2nOAEfgkRt5WC5CRwS0m1PWbfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WeLwVHnU; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720944274;
	bh=x8XXW+gscgcNq3poEZLK+gkugH2nL6K8tBXwx6hkL8g=;
	h=From:Date:Subject:To:Cc:From;
	b=WeLwVHnUngEASsCqqUqrBRJn3UeRdQJmlf0z5MG18AWOcJa2GYmcvdGjqOLqvVNgQ
	 bcUUTqL8fKAQ7m8Z/ph+Yf1kqYeTNuXZ/QK9znRBV4hrojqFw7Drd3o4cYXbJGIGyq
	 nL2nvxTvkxgSNkyPDXZEGLLBeSu94G9ECjFCeN6s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 14 Jul 2024 10:03:45 +0200
Subject: [PATCH v5] kbuild: add script and target to generate pacman
 package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240714-kbuild-pacman-pkg-v5-1-0598460bc918@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAGCGk2YC/23OSw6CMBCA4auQrq1ppy9w5T2Mi7a00qhIqKCGc
 HcLbkjs8p9kvpkJRdcHF9GhmFDvxhDDo00hdgWyjW4vDoc6NQICnEgQ+GqGcKtxp+1dt7i7XrD
 hvlSOVjVhEqW9rnc+vFfzdE7dhPh89J/1xEiX6U9ThGe0kWKKtQUvmRdeK3N8uRBjtM3Q7Fv3R
 As5wpaROQYSIynjAJowrXSWYVumzDEsMWUpas+ssYqTLMM3DCU5hidGEGWMMKoy8P/NPM9fK37
 vHIwBAAA=
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720944274; l=7601;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=x8XXW+gscgcNq3poEZLK+gkugH2nL6K8tBXwx6hkL8g=;
 b=dTlkX6gmLdOteEV2vHVk+Nr+XrloJwXLJ2X7PweKRHAtLacGpuGAOjDz88cxkR35ocDWXtF8+
 L+3hVuvSZ5lDMU4HtuAkstO3XJubRHPEdKhvW0wW1/ithkQXliswDYx
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
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---
Changes in v5:
- Rebase onto kbuild/for-next
- Use new path to build-version script (from kbuild/for-next)
- Ensure submake jobserver delegation works
- Simplify $modulesdir/pkgbase file creation
- Add Reviewed-by from Nicolas
- Link to v4: https://lore.kernel.org/r/20240710-kbuild-pacman-pkg-v4-1-507bb5b79b2a@weissschuh.net

Changes in v4:
- Update MRPROPER_FILES
- Unify shell variable syntax
- Link to v3: https://lore.kernel.org/r/20240708-kbuild-pacman-pkg-v3-1-885df3cbc740@weissschuh.net

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
 Makefile                 |  2 +-
 scripts/Makefile.package | 16 ++++++++++
 scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+), 1 deletion(-)

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
diff --git a/Makefile b/Makefile
index c90d408c825e..2c38c5f57135 100644
--- a/Makefile
+++ b/Makefile
@@ -1481,7 +1481,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .objdiff \
-		  debian snap tar-install \
+		  debian snap tar-install PKGBUILD pacman \
 		  .config .config.old .version \
 		  Module.symvers \
 		  certs/signing_key.pem \
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index bf016af8bf8a..920774dd660c 100644
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
+	+cd $(objtree) && \
+		srctree="$(realpath $(srctree))" \
+		objtree="$(realpath $(objtree))" \
+		BUILDDIR="$(realpath $(objtree))/pacman" \
+		CARCH="$(UTS_MACHINE)" \
+		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
+		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
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
index 000000000000..7bce2f01b17d
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
+  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
+  cd "$objtree"
+
+  # makepkg does a "chmod a-srw", triggering warnings during kbuild
+  chmod 0755 "$pkgdirbase" || true
+
+  $MAKE -f "$srctree/Makefile"
+}
+
+package_linux-upstream() {
+  pkgdesc="The $pkgdesc kernel and modules"
+
+  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
+  cd "$objtree"
+  local modulesdir="$pkgdir/usr/$MODLIB"
+
+  echo "Installing boot image..."
+  # systemd expects to find the kernel here to allow hibernation
+  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
+  install -Dm644 "$($MAKE -s image_name)" "$modulesdir/vmlinuz"
+
+  # Used by mkinitcpio to name the kernel
+  echo "$pkgbase" > "$modulesdir/pkgbase"
+
+  echo "Installing modules..."
+  $MAKE INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
+    DEPMOD=true modules_install
+
+  if $MAKE run-command KBUILD_RUN_COMMAND='test -d $srctree/arch/$SRCARCH/boot/dts' 2>/dev/null; then
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
+  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
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
+  export MAKEFLAGS="$KBUILD_MAKEFLAGS"
+  cd "$objtree"
+
+  $MAKE headers_install INSTALL_HDR_PATH="$pkgdir/usr"
+}
+
+# vim:set ts=8 sts=2 sw=2 et:

---
base-commit: cd843d58ee1db0e2cb0d7046aff5cb59e8fcfc2e
change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


