Return-Path: <linux-kbuild+bounces-2962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7485E94FAFB
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 03:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36F662834DA
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 01:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEB91C20;
	Tue, 13 Aug 2024 01:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dIeS3c+h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D98AD2C
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2024 01:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723511827; cv=none; b=mUvUFVnSERufvEg2qUez9zAQrs7SJi+BhelXFJYSCkGZtQXR73CwfhsLH5Oy3ofuTubf36HWMbaT15wjsjojcowudIbzE4gCZ77UxZe7Is79/8lvBCkLEsII4kXsd2trKVS5xHMYdMrDhF3OLY1TqONIWaQ73zAzu1/4hkYD9mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723511827; c=relaxed/simple;
	bh=fdx4xebKn4zVaEzjrsdRv+DbFnqcmqtYQJIVzKBieCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A1cFs9HL2/dRUdUPHNNeD6c0wQqG3xz9bs1DKpS6All7QkBN5I6S0Q3HkH7pa9yTAuYayyPyfioM/daUFaFolqVrbIYh7xPllx+7vhxb4hmlzr50GT9+5OfzjbWcYwIBi04bm/PvTTddhqFXXy2huNKYAAV8Ye+aw6QRcbXBmR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dIeS3c+h; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1723511820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ohOtBd0qgYjrP6AMGoydpXhTGTed+etuoRj4y+AjGQ4=;
	b=dIeS3c+hliq/xB+w6R3A2nk846RU54T+j+9qIjPMDIFpKQyZs8CavFW3gi0tr+Yvl1GTWD
	pH8OTxJ8avTHRjRS2Je0+yyC1LfAUgtNvrrj/DYEEjQ80OscekNTfcjKMOKGBprXtVvKfb
	stGaSqvhmj7XTC2nmnA/DF311YD5mRE=
From: Jose Fernandez <jose.fernandez@linux.dev>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Jose Fernandez <jose.fernandez@linux.dev>,
	Peter Jung <ptr1337@cachyos.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3] kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES
Date: Mon, 12 Aug 2024 19:16:19 -0600
Message-ID: <20240813011619.13857-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Introduce the PACMAN_EXTRAPACKAGES variable in PKGBUILD to allow users
to specify which additional packages are built by the pacman-pkg target.

Previously, the api-headers package was always included, and the headers
package was included only if CONFIG_MODULES=y. With this change, both
headers and api-headers packages are included by default. Users can now
control this behavior by setting PACMAN_EXTRAPACKAGES to a
space-separated list of desired extra packages or leaving it empty to
exclude all.

For example, to build only the base package without extras:

make pacman-pkg PACMAN_EXTRAPACKAGES=""

Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
Reviewed-by: Peter Jung <ptr1337@cachyos.org>
---
v1->v2:
- Build all extra packages by default
- Remove unnecessary lines
v2->v3:
- Move the default PACMAN_EXTRAPACKAGES value to PKGBUILD
- Remove all changes done to Makefile.package
- Conditionally run the install-extmod-build script if CONFIG_MODULES=y
- Add explicit `mkdir -p "${builddir}"` prior to copying System.map and .config

This patch gives users control over which extra packages are built, addressing
concerns about build time from adding a new debug package [1]. It allows
selective inclusion of extra packages before introducing an optional debug
package.

[1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990X/T/

 scripts/package/PKGBUILD | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 663ce300dd06..fbd7eb10a52c 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -3,10 +3,13 @@
 # Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
 
 pkgbase=${PACMAN_PKGBASE:-linux-upstream}
-pkgname=("${pkgbase}" "${pkgbase}-api-headers")
-if grep -q CONFIG_MODULES=y include/config/auto.conf; then
-	pkgname+=("${pkgbase}-headers")
-fi
+pkgname=("${pkgbase}")
+
+_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers}
+for pkg in $_extrapackages; do
+	pkgname+=("${pkgbase}-${pkg}")
+done
+
 pkgver="${KERNELRELEASE//-/_}"
 # The PKGBUILD is evaluated multiple times.
 # Running scripts/build-version from here would introduce inconsistencies.
@@ -77,10 +80,13 @@ _package-headers() {
 	cd "${objtree}"
 	local builddir="${pkgdir}/usr/${MODLIB}/build"
 
-	echo "Installing build files..."
-	"${srctree}/scripts/package/install-extmod-build" "${builddir}"
+	if grep -q CONFIG_MODULES=y include/config/auto.conf; then
+		echo "Installing build files..."
+		"${srctree}/scripts/package/install-extmod-build" "${builddir}"
+	fi
 
 	echo "Installing System.map and config..."
+	mkdir -p "${builddir}"
 	cp System.map "${builddir}/System.map"
 	cp .config "${builddir}/.config"
 

base-commit: 7809144639f6c92bcb11bd3284b7806a42cc67fe
-- 
2.46.0


