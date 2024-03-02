Return-Path: <linux-kbuild+bounces-1129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918E86F89A
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64111B20A19
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8202633;
	Mon,  4 Mar 2024 02:37:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377038D
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519837; cv=none; b=p7Vew8XPwZYkbVjrtz6zKBT66ozgOX+TZeG60VPwozvm46gEb67CQ1BNCrRhfKgko2+1kQJvLIDpNnN7vEPh9XgWXe5XARyRuGIlV4piz0ak1ecfH66kDL0T9tDUe3tUGbzHy0AQvMS25l926KSxgIVe2DgGlPJNpC/oy6kUfB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519837; c=relaxed/simple;
	bh=7hGxoMCRIBBDPCEYzLG1+d8AHJe/ENAxka30kwI47sQ=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=JszFXiwZZrfNiNq9xLeR0vuWgqg/K1baoWfEbgXnXg+Ld2qMAfHqQDwBSbX/HU8HhVeXh+MjocVIWHZgqho03qbGN0Rw5Yut+YZoclfryOJEx4O22Q8DqDejNwwk9GD727NPpu5lstDH359H76btH+JGUN7aKKoTRMutFTG4KBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242axcK022018
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:37:04 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242av1a022017;
	Sun, 3 Mar 2024 18:36:57 -0800 (PST)
	(envelope-from ehem)
Message-Id: <fcab9c00fd264b4c83ca979a89da6f9ce3355c57.1709508292.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 17:43:44 -0800
Subject: [WIP PATCH 20/30] scripts/package: buildtar: modify use of ${srctree}
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
 scripts/package/buildtar | 60 ++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 72c91a1b832f..f3281a52150e 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -30,8 +30,8 @@ mkdir -p -- "${tmpdir}/boot"
 #
 if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
 	# Only some architectures with OF support have this target
-	if [ -d "${srctree}/arch/${SRCARCH}/boot/dts" ]; then
-		$MAKE ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
+	if [ -d "${srctree}arch/${SRCARCH}/boot/dts" ]; then
+		$MAKE ARCH="${ARCH}" -f ${srctree}Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
     fi
 fi
 
@@ -39,15 +39,15 @@ fi
 #
 # Install modules
 #
-make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
+make ARCH="${ARCH}" -f ${srctree}Makefile INSTALL_MOD_PATH="${tmpdir}" modules_install
 
 
 #
 # Install basic kernel files
 #
-cp -v -- "${objtree}/System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
+cp -v -- "${objtree}System.map" "${tmpdir}/boot/System.map-${KERNELRELEASE}"
 cp -v -- "${KCONFIG_CONFIG}" "${tmpdir}/boot/config-${KERNELRELEASE}"
-cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+cp -v -- "${objtree}vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 
 
 #
@@ -55,48 +55,48 @@ cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 #
 case "${ARCH}" in
 	x86|i386|x86_64)
-		[ -f "${objtree}/arch/x86/boot/bzImage" ] && cp -v -- "${objtree}/arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		[ -f "${objtree}arch/x86/boot/bzImage" ] && cp -v -- "${objtree}arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
 	alpha)
-		[ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		[ -f "${objtree}arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
 	parisc*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-		[ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
+		[ -f "${objtree}lifimage" ] && cp -v -- "${objtree}lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
 		;;
 	mips)
-		if [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.bin" ]; then
-			cp -v -- "${objtree}/arch/mips/boot/compressed/vmlinux.bin" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
-		elif [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.ecoff" ]; then
-			cp -v -- "${objtree}/arch/mips/boot/compressed/vmlinux.ecoff" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
-		elif [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.srec" ]; then
-			cp -v -- "${objtree}/arch/mips/boot/compressed/vmlinux.srec" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
-		elif [ -f "${objtree}/vmlinux.32" ]; then
-			cp -v -- "${objtree}/vmlinux.32" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-		elif [ -f "${objtree}/vmlinux.64" ]; then
-			cp -v -- "${objtree}/vmlinux.64" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-		elif [ -f "${objtree}/arch/mips/boot/vmlinux.bin" ]; then
-			cp -v -- "${objtree}/arch/mips/boot/vmlinux.bin" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-		elif [ -f "${objtree}/arch/mips/boot/vmlinux.ecoff" ]; then
-			cp -v -- "${objtree}/arch/mips/boot/vmlinux.ecoff" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-		elif [ -f "${objtree}/arch/mips/boot/vmlinux.srec" ]; then
-			cp -v -- "${objtree}/arch/mips/boot/vmlinux.srec" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-		elif [ -f "${objtree}/vmlinux" ]; then
-			cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		if [ -f "${objtree}arch/mips/boot/compressed/vmlinux.bin" ]; then
+			cp -v -- "${objtree}arch/mips/boot/compressed/vmlinux.bin" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		elif [ -f "${objtree}arch/mips/boot/compressed/vmlinux.ecoff" ]; then
+			cp -v -- "${objtree}arch/mips/boot/compressed/vmlinux.ecoff" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		elif [ -f "${objtree}arch/mips/boot/compressed/vmlinux.srec" ]; then
+			cp -v -- "${objtree}arch/mips/boot/compressed/vmlinux.srec" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		elif [ -f "${objtree}vmlinux.32" ]; then
+			cp -v -- "${objtree}vmlinux.32" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		elif [ -f "${objtree}vmlinux.64" ]; then
+			cp -v -- "${objtree}vmlinux.64" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		elif [ -f "${objtree}arch/mips/boot/vmlinux.bin" ]; then
+			cp -v -- "${objtree}arch/mips/boot/vmlinux.bin" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		elif [ -f "${objtree}arch/mips/boot/vmlinux.ecoff" ]; then
+			cp -v -- "${objtree}arch/mips/boot/vmlinux.ecoff" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		elif [ -f "${objtree}arch/mips/boot/vmlinux.srec" ]; then
+			cp -v -- "${objtree}arch/mips/boot/vmlinux.srec" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		elif [ -f "${objtree}vmlinux" ]; then
+			cp -v -- "${objtree}vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		fi
 		;;
 	arm64)
 		for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo vmlinuz.efi ; do
-			if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
-				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+			if [ -f "${objtree}arch/arm64/boot/${i}" ] ; then
+				cp -v -- "${objtree}arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 				break
 			fi
 		done
 		;;
 	riscv)
 		for i in Image.bz2 Image.gz Image; do
-			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
-				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+			if [ -f "${objtree}arch/riscv/boot/${i}" ] ; then
+				cp -v -- "${objtree}arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 				break
 			fi
 		done
-- 
2.39.2


