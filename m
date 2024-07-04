Return-Path: <linux-kbuild+bounces-2377-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD98927B36
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 18:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C471F23469
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 16:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5B81B29C7;
	Thu,  4 Jul 2024 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SlECBilG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8831B29C2;
	Thu,  4 Jul 2024 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720111021; cv=none; b=jNt9NpEAWjHIX9wMYQgTygsJKrIfDiEBsaeGDpG9cR2APmV1gCM4XogVaj05PycTSdIDF2udZLouJSaCyJujIsPypxZcmTh0bRJKvRaPP35DarY4vkvngyHeYetYRwm+ksQ6CxeU06XS1Sun8ELX3RdPnQuorl4i5gLuWaqV9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720111021; c=relaxed/simple;
	bh=31GGUpmsfkVr21LcPtsZRWSs4jts+3kNoJ70mCIHSO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bMVGCvN83j4WHb5Ar19XjIBQfMlYgUCBGUt4sBlVDkqNVPEzG5qdHCVruhlGwKn6bZIC6aRr19nWAWgdW4Et/JHmEebbllwKPSUwcS9/NLMjEkb3rMsC9DRV9aGcZqSCcF5Y0UDTKlJVAOpULMTksbHbTwGRAA1f79xlFez2B6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SlECBilG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1720111007;
	bh=31GGUpmsfkVr21LcPtsZRWSs4jts+3kNoJ70mCIHSO0=;
	h=From:Date:Subject:To:Cc:From;
	b=SlECBilGwuMqBt70Nv3y+4baymi5s5SL+g32TnUOWrPNxoRcTLYW/Wd1c0IQ9PLbT
	 gvHt5HOEo7MmyRGQk13JWLIE0aQaN1NwO1As60ftNH6XMKIb1RdRTunWUhdMFEHc7L
	 DD00TiVYRLz7P69UTvhUtUV3jXvJjch190DNg524=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 04 Jul 2024 18:36:34 +0200
Subject: [PATCH] kbuild: add script and target to generate pacman package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAJHPhmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyNT3eyk0sycFN2CxOTcxDzdgux03SSTNAvzVEPLFANjMyWgvoKi1LT
 MCrCZ0bG1tQCMimmUYwAAAA==
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720111006; l=5131;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=31GGUpmsfkVr21LcPtsZRWSs4jts+3kNoJ70mCIHSO0=;
 b=xDpRl3Q9UNV9jP51K5Zynufad+jJYYMhZgczlxr+C+AssCZoHmzAq0PQzaye7kmNrlB5VLSyJ
 hhUZAqZwtbnDfPQ97wY+LQGbdkxkC9fAO964XYEGMVepAPFlx61e5XZ
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
 .gitignore               |  6 ++++
 scripts/Makefile.package | 15 ++++++++++
 scripts/package/PKGBUILD | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+)

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
index 000000000000..29daf357edc1
--- /dev/null
+++ b/scripts/package/PKGBUILD
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
+# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
+
+pkgbase=linux-upstream
+pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-api-headers")
+pkgver="${KERNELRELEASE//-/_}"
+pkgrel="$KBUILD_REVISION"
+pkgdesc='Linux'
+url='https://www.kernel.org/'
+arch=("$UTS_MACHINE")
+options=(!strip)
+license=(GPL-2.0-only)
+
+build() {
+  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+  cd "$objtree"
+
+  ${MAKE} -f "${srctree}/Makefile"
+
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
+  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
+
+  # Used by mkinitcpio to name the kernel
+  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"
+
+  echo "Installing modules..."
+  ${MAKE} INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
+    DEPMOD=/doesnt/exist modules_install  # Suppress depmod
+
+  # remove build link
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
+  ${MAKE} headers_install INSTALL_HDR_PATH="$pkgdir/usr"
+}
+
+# vim:set ts=8 sts=2 sw=2 et:

---
base-commit: 795c58e4c7fc6163d8fb9f2baa86cfe898fa4b19
change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


