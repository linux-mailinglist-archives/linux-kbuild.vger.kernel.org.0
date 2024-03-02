Return-Path: <linux-kbuild+bounces-1127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492986F898
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FD171C20AF5
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587C6633;
	Mon,  4 Mar 2024 02:37:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5544C1854
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519831; cv=none; b=ckVBp6MIKz0Gqs878lHmHuGxu9euVlIGjIEuPaB2KIqq1BHRqKzWqbb06CsvPWYPaXrzv46nOeGIPpcFvghwY/wiPSAkuCZMAzVaq1PP7+1WOl2w9GmxufY2CMPM7e0yM24BqW9t2e43lDem/vRAwhY7KaTEIvo54yRKqaUchAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519831; c=relaxed/simple;
	bh=k7gtVEbelQhD9LQpywuIKFtyW3863gG7ECWuoCdIAoI=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=qchibWqhyDbz2XWqw1hBEw8rUvvjUDeWZQ/N3y0A6E7aXfvicW8jRsFMMJEHm/mXyLWVfwBWVW3mAHwCWax623rW3ZToObhruScgZvJZ1ZL5JFOLEjLBgK/jW8tKGJSDsmIJBwR6n/xoWojgcFCJRZ5bXpbtW7qhUhh44kZQDlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242ZK9h022009
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:35:26 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242ZJwV022008;
	Sun, 3 Mar 2024 18:35:19 -0800 (PST)
	(envelope-from ehem)
Message-Id: <92c7be4e2854885ac1304a13f085c276cd2e0d49.1709508291.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 17:43:44 -0800
Subject: [WIP PATCH 19/30] scripts/package: mkdebian: modify use of ${srctree}
 to assume trailing slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Once converted this script needs to match what the Makefiles have.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
---
 scripts/package/builddeb     | 12 ++++++------
 scripts/package/debian/rules |  2 +-
 scripts/package/mkdebian     |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index bf96a3c24608..fe0e3cb9bdeb 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -43,11 +43,11 @@ install_linux_image () {
 	rm -rf ${pdir}
 
 	# Only some architectures with OF support have this target
-	if is_enabled CONFIG_OF_EARLY_FLATTREE && [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
-		${MAKE} -f ${srctree}/Makefile INSTALL_DTBS_PATH="${pdir}/usr/lib/linux-image-${KERNELRELEASE}" dtbs_install
+	if is_enabled CONFIG_OF_EARLY_FLATTREE && [ -d "${srctree}arch/${SRCARCH}/boot/dts" ]; then
+		${MAKE} -f ${srctree}Makefile INSTALL_DTBS_PATH="${pdir}/usr/lib/linux-image-${KERNELRELEASE}" dtbs_install
 	fi
 
-	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" INSTALL_MOD_STRIP=1 modules_install
+	${MAKE} -f ${srctree}Makefile INSTALL_MOD_PATH="${pdir}" INSTALL_MOD_STRIP=1 modules_install
 	rm -f "${pdir}/lib/modules/${KERNELRELEASE}/build"
 
 	# Install the kernel
@@ -75,7 +75,7 @@ install_linux_image () {
 	*)
 		installed_image_path="boot/vmlinuz-${KERNELRELEASE}";;
 	esac
-	cp "$(${MAKE} -s -f ${srctree}/Makefile image_name)" "${pdir}/${installed_image_path}"
+	cp "$(${MAKE} -s -f ${srctree}Makefile image_name)" "${pdir}/${installed_image_path}"
 
 	# Install the maintainer scripts
 	# Note: hook scripts under /etc/kernel are also executed by official Debian
@@ -142,7 +142,7 @@ install_kernel_headers () {
 
 	rm -rf $pdir
 
-	"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
+	"${srctree}scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
 
 	mkdir -p $pdir/lib/modules/$version/
 	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
@@ -153,7 +153,7 @@ install_libc_headers () {
 
 	rm -rf $pdir
 
-	$MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH=$pdir/usr
+	$MAKE -f ${srctree}Makefile headers_install INSTALL_HDR_PATH=$pdir/usr
 
 	# move asm headers to /usr/include/<libc-machine>/asm to match the structure
 	# used by Debian-based distros (to support multi-arch)
diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
index 098307780062..fd4b86c6f25f 100755
--- a/scripts/package/debian/rules
+++ b/scripts/package/debian/rules
@@ -20,7 +20,7 @@ binary: binary-arch binary-indep
 binary-indep: build-indep
 binary-arch: build-arch
 	$(MAKE) $(make-opts) \
-	run-command KBUILD_RUN_COMMAND='+$$(srctree)/scripts/package/builddeb'
+	run-command KBUILD_RUN_COMMAND='+$$(srctree)scripts/package/builddeb'
 
 .PHONY: build build-indep build-arch
 build: build-arch build-indep
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 070149c985fe..dcd5765999e0 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -108,7 +108,7 @@ gen_source ()
 	} > debian/patches/config.patch
 	echo config.patch > debian/patches/series
 
-	"${srctree}/scripts/package/gen-diff-patch" debian/patches/diff.patch
+	"${srctree}scripts/package/gen-diff-patch" debian/patches/diff.patch
 	if [ -s debian/patches/diff.patch ]; then
 		sed -i "
 			1iSubject: Add local diff
@@ -150,7 +150,7 @@ version=$KERNELRELEASE
 if [ -n "$KDEB_PKGVERSION" ]; then
 	packageversion=$KDEB_PKGVERSION
 else
-	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/init/build-version)
+	packageversion=$(${srctree}scripts/setlocalversion --no-local ${srctree})-$($srctree/init/build-version)
 fi
 sourcename=${KDEB_SOURCENAME:-linux-upstream}
 
@@ -247,7 +247,7 @@ ARCH := ${ARCH}
 KERNELRELEASE := ${KERNELRELEASE}
 EOF
 
-cp "${srctree}/scripts/package/debian/copyright" debian/
-cp "${srctree}/scripts/package/debian/rules" debian/
+cp "${srctree}scripts/package/debian/copyright" debian/
+cp "${srctree}scripts/package/debian/rules" debian/
 
 exit 0
-- 
2.39.2


