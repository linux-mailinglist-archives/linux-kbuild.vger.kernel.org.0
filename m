Return-Path: <linux-kbuild+bounces-3047-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D66D0954C34
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 16:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CC841F26458
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 14:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5F01BB6B7;
	Fri, 16 Aug 2024 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7hFLHv6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF01AD9D6;
	Fri, 16 Aug 2024 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723817931; cv=none; b=IZK4r4hFFiyBTHtKoC6ufHnLtLSkOHRRgEpKn8EkQ3j4Fixeojpscgb6c12I+xhBRuj8lVSdAfpDtVd8C+RuwsdigUV3FCJvz/M4A2C277+2yLgsQwvrZU6PcXksPZ0N5Fh59dk8qpGbceeAoTBNDE3qPQ5kimTlDs3IU8UVyrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723817931; c=relaxed/simple;
	bh=8PcWZ6u8ejj0P8ViD/wgyJXvbvFIHANHO5AQPKq7jk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSxHxl0ha3m/c7GveZHKz4JN/huoPkVdja7TPbB1IPKiydoZNz5sWl/KQzTtvmn7yvPaz5yxFNTcsjjsRLwfLFjcUiqGSNHJ2oMTQ62yEZQ85YlUP6wRkaA0hFiwrpJxWBangFVAcS74XXswYKG3c7kO6Pujl7c0Tn3KhQ0pnqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7hFLHv6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B292FC32782;
	Fri, 16 Aug 2024 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723817931;
	bh=8PcWZ6u8ejj0P8ViD/wgyJXvbvFIHANHO5AQPKq7jk0=;
	h=From:To:Cc:Subject:Date:From;
	b=L7hFLHv6ifDj05J2U4hz6Oroea/owuHdzHoV/Q8MpPk/gi6h0APbqtEryViPrrFil
	 +VN1dVs9ROoXtIWaHQ7GVR9fH0ZPAfvH2GtPZfff31MBeVKkzKOagEZXUdaTmGr9u0
	 KVODB1t6cqVsc1tuQNkzPuXzasE6WYz8eQOcj4nSFrY+no4kLw8VMqpvbgTzKFRblW
	 i05UUFz2hULnXLuki2Qg6Gxf6hhMnJt08MZD2FeIL2FU3MF+mlz/WY4LzdccaGnTy1
	 qay2XpgpR6ikr73pFTHxrmnBJXWMyZmAbjy2NscT9Wi3G7FkL3xMO3ALb0p3JcTKCa
	 FGbjXn0/NbhZA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 1/2] kbuild: pacman-pkg: move common commands to a separate function
Date: Fri, 16 Aug 2024 23:18:14 +0900
Message-ID: <20240816141844.1217356-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All build and package functions share the following commands:

  export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
  cd "${objtree}"

Factor out the common code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/PKGBUILD | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index fbd7eb10a52c..e2d9c2601ca9 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -36,11 +36,15 @@ makedepends=(
 )
 options=(!debug !strip !buildflags !makeflags)
 
-build() {
+_prologue() {
 	# MAKEFLAGS from makepkg.conf override the ones inherited from kbuild.
 	# Bypass this override with a custom variable.
 	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
 	cd "${objtree}"
+}
+
+build() {
+	_prologue
 
 	${MAKE} KERNELRELEASE="${KERNELRELEASE}" KBUILD_BUILD_VERSION="${pkgrel}"
 }
@@ -48,10 +52,10 @@ build() {
 _package() {
 	pkgdesc="The ${pkgdesc} kernel and modules"
 
-	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
-	cd "${objtree}"
 	local modulesdir="${pkgdir}/usr/${MODLIB}"
 
+	_prologue
+
 	echo "Installing boot image..."
 	# systemd expects to find the kernel here to allow hibernation
 	# https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
@@ -76,10 +80,10 @@ _package() {
 _package-headers() {
 	pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
 
-	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
-	cd "${objtree}"
 	local builddir="${pkgdir}/usr/${MODLIB}/build"
 
+	_prologue
+
 	if grep -q CONFIG_MODULES=y include/config/auto.conf; then
 		echo "Installing build files..."
 		"${srctree}/scripts/package/install-extmod-build" "${builddir}"
@@ -100,8 +104,7 @@ _package-api-headers() {
 	provides=(linux-api-headers)
 	conflicts=(linux-api-headers)
 
-	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
-	cd "${objtree}"
+	_prologue
 
 	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
 }
-- 
2.43.0


