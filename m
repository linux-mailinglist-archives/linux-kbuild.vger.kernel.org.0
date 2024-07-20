Return-Path: <linux-kbuild+bounces-2600-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A0193802C
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 11:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7988E1C20899
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 09:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C422329CFE;
	Sat, 20 Jul 2024 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="i3P6y2Ys"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC92C861;
	Sat, 20 Jul 2024 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721467130; cv=none; b=Jo6E0rDDJStKTRXkPlmBlbW9f+1AabuTXDjQuEjVDukpUJTFuEKdKS+Q9wZ4H0oKDsA8+oLmJ8DZRPiE7I4Hfwmlk3ePJoozCA8YH4bLhl5ttoC+w0o+55QD8U2eVwA+75H+UCzvQXdmu70JclkoFR2Vp2xZZIY0arK0c4Unabw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721467130; c=relaxed/simple;
	bh=UVsVuDZbuz1kAPYLhkCeq4nQvmEnZlZzbe3SI6brpcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rgWg9t5cNgNL0qSWkbIlisyciz1v2OPdkH07kMsOpA7GEIyBALPRcMd89BiOyhv3VywI+986jonKYFq6WnsMEJqJl6et2qLpH5N2X+lv6MP8EPuCCLGYfHHdy1Bf7TxRcpQdDDMV6UfBDvySpzobiqY67LRSicKqGQl1v7HMZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=i3P6y2Ys; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721467124;
	bh=UVsVuDZbuz1kAPYLhkCeq4nQvmEnZlZzbe3SI6brpcg=;
	h=From:Date:Subject:To:Cc:From;
	b=i3P6y2YsEErqtYuEmlzramccZGvAOTzgARI51+ekQ+Aa9LcwlVLjOpCxR00yIgo1a
	 qDBzO2wGHbIz6AzdmrSg105Y6nPlXYjS8Bb7tiKK6Vym1xXXtyOblhysgCgYMPA6ap
	 ADTaOMPPFcNbdTTrHaQrQaIzrjCn+zes3KdHXe0Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 20 Jul 2024 11:18:12 +0200
Subject: [PATCH v7] kbuild: add script and target to generate pacman
 package
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIANOAm2YC/23Qy07DMBAF0F+pvMZo7PErrPgPxMLPxiqkUdwGU
 JV/xy2bSMzyjjRnRvfGWl5qbuzlcGNLXmur56kH+3RgcfTTMfOaemYSpAIjNT+Fa/1IfPbx009
 8Ph15UMXZLIYEaFjfm5dc6vfDfHvveaztcl5+HidWcZ/+aRYUoa2CC+6jLAaLLt6G169cW2txv
 I7PU76wO7nKPWMoRnbGCFRSekBvPcngnnEUg51xTqeCMUSrgGTUjhFAMaozGmwIOtghSPobvWf
 IbnRnQA9OGQhxEI5kzJ4huzGdSehBZQQHAv8x27b9An9++pQaAgAA
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
 Christian Heusel <christian@heusel.eu>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721467096; l=9442;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UVsVuDZbuz1kAPYLhkCeq4nQvmEnZlZzbe3SI6brpcg=;
 b=cDMI/xeiE48qhwhTvi4LT14RY4e5cv84llM1/ZjVPjctw2UU7FaZ/GtTNntJPCoT3jDnCG/S0
 0PyYm7vz6jtCNObBusYEY0Fa5RFRHIAyrVOJP2LIsnk/a2RuNSJEoh+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

pacman is the package manager used by Arch Linux and its derivates.
Creating native packages from the kernel tree has multiple advantages:

* The package triggers the correct hooks for initramfs generation and
  bootloader configuration
* Uninstallation is complete and also invokes the relevant hooks
* New UAPI headers can be installed without any manual bookkeeping

The PKGBUILD file is a modified version of the one used for the
downstream Arch Linux "linux" package.
Extra steps that should not be necessary for a development kernel have
been removed and an UAPI header package has been added.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v7:
- Make pkgbase configurable
- Add more information to pkgdesc
- Drop base-devel from makedepends
- Drop now unneeded "chmod"
- Make sure KERNELRELEASE and KBUILD_BUILD_VERSION are correct
- Add MAINTAINERS entry
- Use absolute path to BUILDDIR again, as makepkg doesn't work otherwise
- Drop Reviewed-by and Tested-by as a fair amount of changes has been
  done since
- Link to v6: https://lore.kernel.org/r/20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net

Changes in v6:
- Drop reference to srctree/Makefile
- Drop $(realpath $(srctree))
- Make use of the fact that $(objtree) is always "."
- Align coding style to kernel and drop vim config line
- Drop indirection through `$MAKE run-command`
- Unify shell variable syntax to "${var}"
- Add explanations to custom variables
- Add makedepends
- Link to v5: https://lore.kernel.org/r/20240714-kbuild-pacman-pkg-v5-1-0598460bc918@weissschuh.net

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
 .gitignore               |   6 +++
 MAINTAINERS              |   7 +++
 Makefile                 |   2 +-
 scripts/Makefile.package |  14 ++++++
 scripts/package/PKGBUILD | 108 +++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 136 insertions(+), 1 deletion(-)

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
diff --git a/MAINTAINERS b/MAINTAINERS
index da5352dbd4f3..16f8e13aa4c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11997,6 +11997,13 @@ F:	include/uapi/linux/nfsd/
 F:	include/uapi/linux/sunrpc/
 F:	net/sunrpc/
 
+KERNEL PACMAN PACKAGING (in addition to generic KERNEL BUILD)
+M:	Thomas Weißschuh <linux@weissschuh.net>
+R:	Christian Heusel <christian@heusel.eu>
+R:	Nathan Chancellor <nathan@kernel.org>
+S:	Maintained
+F:	scripts/package/PKGBUILD
+
 KERNEL REGRESSIONS
 M:	Thorsten Leemhuis <linux@leemhuis.info>
 L:	regressions@lists.linux.dev
diff --git a/Makefile b/Makefile
index c97d6404b891..943899656977 100644
--- a/Makefile
+++ b/Makefile
@@ -1487,7 +1487,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
 		  arch/$(SRCARCH)/include/generated .objdiff \
-		  debian snap tar-install \
+		  debian snap tar-install PKGBUILD pacman \
 		  .config .config.old .version \
 		  Module.symvers \
 		  certs/signing_key.pem \
diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index bf016af8bf8a..94357f47d2fa 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -141,6 +141,19 @@ snap-pkg:
 	cd $(objtree)/snap && \
 	snapcraft --target-arch=$(UTS_MACHINE)
 
+# pacman-pkg
+# ---------------------------------------------------------------------------
+
+PHONY += pacman-pkg
+pacman-pkg:
+	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
+	+objtree="$(realpath $(objtree))" \
+		BUILDDIR="$(realpath pacman)" \
+		CARCH="$(UTS_MACHINE)" \
+		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
+		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
+		makepkg
+
 # dir-pkg tar*-pkg - tarball targets
 # ---------------------------------------------------------------------------
 
@@ -221,6 +234,7 @@ help:
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
 	@echo '  snap-pkg            - Build only the binary kernel snap package'
 	@echo '                        (will connect to external hosts)'
+	@echo '  pacman-pkg          - Build only the binary kernel pacman package'
 	@echo '  dir-pkg             - Build the kernel as a plain directory structure'
 	@echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
new file mode 100644
index 000000000000..663ce300dd06
--- /dev/null
+++ b/scripts/package/PKGBUILD
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
+# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
+
+pkgbase=${PACMAN_PKGBASE:-linux-upstream}
+pkgname=("${pkgbase}" "${pkgbase}-api-headers")
+if grep -q CONFIG_MODULES=y include/config/auto.conf; then
+	pkgname+=("${pkgbase}-headers")
+fi
+pkgver="${KERNELRELEASE//-/_}"
+# The PKGBUILD is evaluated multiple times.
+# Running scripts/build-version from here would introduce inconsistencies.
+pkgrel="${KBUILD_REVISION}"
+pkgdesc='Upstream Linux'
+url='https://www.kernel.org/'
+# Enable flexible cross-compilation
+arch=(${CARCH})
+license=(GPL-2.0-only)
+makedepends=(
+	bc
+	bison
+	cpio
+	flex
+	gettext
+	kmod
+	libelf
+	openssl
+	pahole
+	perl
+	python
+	rsync
+	tar
+)
+options=(!debug !strip !buildflags !makeflags)
+
+build() {
+	# MAKEFLAGS from makepkg.conf override the ones inherited from kbuild.
+	# Bypass this override with a custom variable.
+	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+	cd "${objtree}"
+
+	${MAKE} KERNELRELEASE="${KERNELRELEASE}" KBUILD_BUILD_VERSION="${pkgrel}"
+}
+
+_package() {
+	pkgdesc="The ${pkgdesc} kernel and modules"
+
+	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+	cd "${objtree}"
+	local modulesdir="${pkgdir}/usr/${MODLIB}"
+
+	echo "Installing boot image..."
+	# systemd expects to find the kernel here to allow hibernation
+	# https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
+	install -Dm644 "$(${MAKE} -s image_name)" "${modulesdir}/vmlinuz"
+
+	# Used by mkinitcpio to name the kernel
+	echo "${pkgbase}" > "${modulesdir}/pkgbase"
+
+	echo "Installing modules..."
+	${MAKE} INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 \
+		DEPMOD=true modules_install
+
+	if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
+		echo "Installing dtbs..."
+		${MAKE} INSTALL_DTBS_PATH="${modulesdir}/dtb" dtbs_install
+	fi
+
+	# remove build link, will be part of -headers package
+	rm -f "${modulesdir}/build"
+}
+
+_package-headers() {
+	pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
+
+	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+	cd "${objtree}"
+	local builddir="${pkgdir}/usr/${MODLIB}/build"
+
+	echo "Installing build files..."
+	"${srctree}/scripts/package/install-extmod-build" "${builddir}"
+
+	echo "Installing System.map and config..."
+	cp System.map "${builddir}/System.map"
+	cp .config "${builddir}/.config"
+
+	echo "Adding symlink..."
+	mkdir -p "${pkgdir}/usr/src"
+	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
+}
+
+_package-api-headers() {
+	pkgdesc="Kernel headers sanitized for use in userspace"
+	provides=(linux-api-headers)
+	conflicts=(linux-api-headers)
+
+	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
+	cd "${objtree}"
+
+	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
+}
+
+for _p in "${pkgname[@]}"; do
+	eval "package_$_p() {
+		$(declare -f "_package${_p#$pkgbase}")
+		_package${_p#$pkgbase}
+	}"
+done

---
base-commit: 6e6ef2da3a28f3e02fd204b4f8821030b61f8cd4
change-id: 20240625-kbuild-pacman-pkg-b4f87e19d036

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


