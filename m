Return-Path: <linux-kbuild+bounces-3207-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A71695E038
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Aug 2024 00:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 488682829D4
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 22:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D7E7C6D5;
	Sat, 24 Aug 2024 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q+w72naO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E397AE5D
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Aug 2024 22:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724537380; cv=none; b=O/VE1fpNS+Tftc+YmH+zkzevIMEvHDBVbczRKiDAtJbG2Di6RoSKczne/NvrZV5IotqpuRYZf/gabZFoWlxzH33HW56pRhxYPgbbb7WUc9LBUptD4/o60vgX8yXmNNyX850FcNagNIr+nIetmH1W+ptkFc50mqY1/ZYQ1W05Bf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724537380; c=relaxed/simple;
	bh=pIcevnO8B44FsuqKKXXFtVUHkV+t9Z97x8VWphHOD0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jK7L+pez4iUP5JXNhRJEejdMA5ldy7B3s3nCVz9KvWd877he0ECf4OXuJCrFYmaGPKbx/gJYppZJ+TvWSF3KWjPDu+4NklqcEaYg6IqOOA4+1dyZJ6oUc+6IMF5FXyVG+iu50IAwe/o880dy+ZiAYFIAni5TfJQzxJRqIM2tWgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q+w72naO; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1724537375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZYovX4csJvM7w3dzoxHiFd6ZyRCtREp257gHhjUTEZg=;
	b=Q+w72naOteY+bfrTFTW0NWYimHGKzb+RDhLDfJZ/Wc0BO+4Tt4jXDsAMkKi9g/ENZ6a1Vt
	eJN0Xjw2mSJ+9lDqZwJmp//lODO0rTcs2W4QX679g5ia5V8M7pPKgjJQG3B3/2EGjEmZap
	i25jHYjxJzBXeeQbMGWy8thCLJuVCDQ=
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
Subject: [PATCH v3] kbuild: add debug package to pacman PKGBUILD
Date: Sat, 24 Aug 2024 16:07:56 -0600
Message-ID: <20240824220756.73091-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a new debug package to the PKGBUILD for the pacman-pkg target. The
debug package includes the non-stripped vmlinux file with debug symbols
for kernel debugging and profiling. The file is installed at
/usr/src/debug/${pkgbase}, with a symbolic link at
/usr/lib/modules/$(uname -r)/build/vmlinux. The debug package is built
by default.

Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
Reviewed-by: Peter Jung <ptr1337@cachyos.org>
---
v2->v3:
- Remove unnecessary mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
- Use the new _prologue() function [1]
- Add symbolic link to /usr/lib/modules/$(uname -r)/build/vmlinux
- Remove the dependency on the headers package
v1->v2:
- Use the new PACMAN_EXTRAPACKAGES [2] variable to allow users to disable the
debug package if desired, instead of always including it.

[1] https://lore.kernel.org/lkml/20240816141844.1217356-1-masahiroy@kernel.org/
[2] https://lore.kernel.org/lkml/20240813185900.GA140556@thelio-3990X/T/

 scripts/package/PKGBUILD | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 839cd5e634d2..f83493838cf9 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -5,7 +5,7 @@
 pkgbase=${PACMAN_PKGBASE:-linux-upstream}
 pkgname=("${pkgbase}")
 
-_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers}
+_extrapackages=${PACMAN_EXTRAPACKAGES-headers api-headers debug}
 for pkg in $_extrapackages; do
 	pkgname+=("${pkgbase}-${pkg}")
 done
@@ -111,6 +111,19 @@ _package-api-headers() {
 	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
 }
 
+_package-debug(){
+	pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
+
+	local debugdir="${pkgdir}/usr/src/debug/${pkgbase}"
+	local builddir="${pkgdir}/usr/${MODLIB}/build"
+
+	_prologue
+
+	install -Dt "${debugdir}" -m644 vmlinux
+	mkdir -p "${builddir}"
+	ln -sr "${debugdir}/vmlinux" "${builddir}/vmlinux"
+}
+
 for _p in "${pkgname[@]}"; do
 	eval "package_$_p() {
 		$(declare -f "_package${_p#$pkgbase}")

base-commit: df829331cf5cccb2a1fdd7560eabfcec49f9b990
-- 
2.46.0


