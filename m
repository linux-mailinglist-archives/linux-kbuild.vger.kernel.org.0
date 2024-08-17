Return-Path: <linux-kbuild+bounces-3068-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE4955887
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 17:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08000B21649
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 15:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26B38063C;
	Sat, 17 Aug 2024 15:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dbdaAAy9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BE1DDF5
	for <linux-kbuild@vger.kernel.org>; Sat, 17 Aug 2024 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723907539; cv=none; b=N5n2Fjbzbc/6HjiSh7odSiOnfqXelAsrrLOouDUj0akK2Lez8BNEPNZz1HRZsIzjxzZG6d2FR2UqVImkvf17O72Ed33dLXX5wOKBPgl8c4BIm+aE2jxjtCW7g9gtKdLBtVqsR9DQdrjnhqyXEqnbPcD7D0s379Q5SqryPRG/O1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723907539; c=relaxed/simple;
	bh=DcQqlyPhUX/TtBvD1m7UEOntn+AroF0FB9K5gHY30dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElwQ0pdu8OraQfkg9WpIluNRETwxBIE6vVHORg9A00fPlVJt2Wy02myF7mmYuhQrdf3I+d0H92tmv01tvQ0QnRm1ov9A2ozOUEBiSvzcaEOm4mwq7UAzetq+ZObVde/6bfbl8k9cDBC5CHo9II+bioHHS1ad2XgwkNB74+Mbj5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dbdaAAy9; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1723907534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hsH+p2Rj1XhDMvtdTQeoq5m/sGRAmgGNzXuE7X/vjZE=;
	b=dbdaAAy9K0jLVMJYHv2EAobza1GeKCtXr9+wz29kmushvOMbraRv7TiB3P6J/ltSddeYXR
	jhuSW9dPYXPGCtd1T2VuRWTN7LqWshSJi5fEOcD4DwH6hs0LWxAVb2G1xXKfSGhDosDvCb
	8VJ2rUpySFKPKsJa78ixqOOZCSJ84Gg=
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
Subject: [PATCH v2] kbuild: add debug package to pacman PKGBUILD
Date: Sat, 17 Aug 2024 09:11:47 -0600
Message-ID: <20240817151147.156479-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a new debug package to the PKGBUILD for the pacman-pkg target. The
debug package includes the non-stripped vmlinux file, providing access
to debug symbols needed for kernel debugging and profiling. The vmlinux
file will be installed to /usr/src/debug/${pkgbase}. The debug package
will be built by default and can be excluded by overriding PACMAN_EXTRAPACKAGES.

Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
Reviewed-by: Peter Jung <ptr1337@cachyos.org>
---
v1->v2:
- Use the new PACMAN_EXTRAPACKAGES [1] variable to allow users to disable the
debug package if desired, instead of always including it.

[1] https://lore.kernel.org/lkml/20240813185900.GA140556@thelio-3990X/T/

 scripts/package/PKGBUILD | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index fbd7eb10a52c..d40d282353de 100644
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
@@ -106,6 +106,15 @@ _package-api-headers() {
 	${MAKE} headers_install INSTALL_HDR_PATH="${pkgdir}/usr"
 }
 
+_package-debug(){
+	pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
+	depends=(${pkgbase}-headers)
+
+	cd "${objtree}"
+	mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
+	install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
+}
+
 for _p in "${pkgname[@]}"; do
 	eval "package_$_p() {
 		$(declare -f "_package${_p#$pkgbase}")

base-commit: 869679673d3bbaaf1c2a43dba53930f5241e1d30
-- 
2.46.0


