Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC32182894
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2020 06:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbgCLFu6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Mar 2020 01:50:58 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34555 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387677AbgCLFu6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Mar 2020 01:50:58 -0400
X-Originating-IP: 105.154.211.150
Received: from localhost (unknown [105.154.211.150])
        (Authenticated sender: josh@joshtriplett.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 44E1D60005;
        Thu, 12 Mar 2020 05:50:54 +0000 (UTC)
Date:   Thu, 12 Mar 2020 06:50:53 +0100
From:   Josh Triplett <josh@joshtriplett.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Add an "imgdeb-pkg" target to build only linux-image
Message-ID: <b45738b05bb396e175a36f67b02fa01de4c7472f.1583912084.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This skips building the linux-headers and linux-libc-dev packages, which
take much longer to build, and which aren't needed for many common test
scenarios.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 scripts/Makefile.package |  5 +++++
 scripts/package/builddeb |  2 +-
 scripts/package/mkdebian | 33 +++++++++++++++++++++++----------
 3 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 02135d2671a6..efc2f2f69bc1 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -82,6 +82,11 @@ bindeb-pkg:
 	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
 	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -b -nc -uc
 
+PHONY += imgdeb-pkg
+imgdeb-pkg:
+	DEBIAN_IMAGE_ONLY=1 $(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -b -nc -uc
+
 PHONY += intdeb-pkg
 intdeb-pkg:
 	+$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 6df3c9f8b2da..c7615a35f34f 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -201,7 +201,7 @@ EOF
 	chmod 755 "$tmpdir/DEBIAN/$script"
 done
 
-if [ "$ARCH" != "um" ]; then
+if [ "$ARCH" != "um" ] && [ -z "$DEBIAN_IMAGE_ONLY" ]; then
 	deploy_kernel_headers debian/linux-headers
 	create_package linux-headers-$version debian/linux-headers
 
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 357dc56bcf30..9969855d2eb8 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -169,7 +169,8 @@ License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
 EOF
 
 # Generate a control file
-cat <<EOF > debian/control
+{
+	cat <<EOF
 Source: $sourcename
 Section: kernel
 Priority: optional
@@ -183,6 +184,17 @@ Description: Linux kernel, version $version
  This package contains the Linux kernel, modules and corresponding other
  files, version: $version.
 
+Package: $dbg_packagename
+Section: debug
+Architecture: $debarch
+Description: Linux kernel debugging symbols for $version
+ This package will come in handy if you need to debug the kernel. It provides
+ all the necessary debug symbols for the kernel and its modules.
+EOF
+
+	if [ -z "$DEBIAN_IMAGE_ONLY" ]; then
+		cat <<EOF
+
 Package: $kernel_headers_packagename
 Architecture: $debarch
 Description: Linux kernel headers for $version on $debarch
@@ -198,14 +210,13 @@ Description: Linux support headers for userspace development
  This package provides userspaces headers from the Linux kernel.  These headers
  are used by the installed headers for GNU glibc and other system libraries.
 Multi-Arch: same
-
-Package: $dbg_packagename
-Section: debug
-Architecture: $debarch
-Description: Linux kernel debugging symbols for $version
- This package will come in handy if you need to debug the kernel. It provides
- all the necessary debug symbols for the kernel and its modules.
 EOF
+	fi
+} > debian/control
+
+if [ -n "$DEBIAN_IMAGE_ONLY" ]; then
+	DEBIAN_IMAGE_ONLY_ENV="DEBIAN_IMAGE_ONLY=1"
+fi
 
 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f
@@ -214,11 +225,13 @@ srctree ?= .
 
 build:
 	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
-	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile
+	KBUILD_BUILD_VERSION=${revision} ${DEBIAN_IMAGE_ONLY_ENV} \
+	-f \$(srctree)/Makefile
 
 binary-arch:
 	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
-	KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg
+	KBUILD_BUILD_VERSION=${revision} ${DEBIAN_IMAGE_ONLY_ENV} \
+	-f \$(srctree)/Makefile intdeb-pkg
 
 clean:
 	rm -rf debian/*tmp debian/files
-- 
2.25.1
