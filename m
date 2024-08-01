Return-Path: <linux-kbuild+bounces-2771-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABF944D2F
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 15:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 916471F20F53
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 13:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D067B14A601;
	Thu,  1 Aug 2024 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OY2abT5V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9AE1A3BC5
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Aug 2024 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519042; cv=none; b=qobXjWbScGtJ7XNiL2L5HuInPzcahmR3Q5/BEBDzyTNwJchNpjak1VRH26xQpsY2+IkPkpw5f/hK0b0PuaGV9siVaDZ3hfbf15+VNrocOO6DsBrkSOzIyUnBs6KB0gOpkew9AKY2232vA54A4KaGqqIF87FA07sXGWHuTLcB37s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519042; c=relaxed/simple;
	bh=5fh3zLksyUdEqP22RNEHpVFF57ulCc1NO17H4oaYNps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nU6KBIxahiSpexXNGy/O0Lnk6Zd2mPWrbdxS8h2/KlOY6NH6TDwjklh8pJtNNVL+XYqLoLfJEbQSby4gjeiqsO0AUdqXo4XC+RZ83SHzMqG7EpBTJgkhb3tPgsB1mb2Q7cM6OULqgjfWrPkA0ILfJvC7o3CC/rKsDy2FHd0e8WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OY2abT5V; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722519038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MHBDfsBlDP5mFoophkeKQqln5muhUtP3FEfAZNMe1gw=;
	b=OY2abT5VSS0qqIf9QgMkpQlZOjnsC+aKRiscVMtOHJto61G4K2HBd3giJ9EF4p+H9n7AyO
	ZWecScq4xamPJp+5YSHMBlbgIJn6RFHUi+3WVkCXfTCtG+vj7Dt2DxrL2YKhMj9Kgb56o7
	i4SoBtptrcxxDTpRS/cQR2g9OD83EeI=
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
Subject: [PATCH] kbuild: add debug package to pacman PKGBUILD
Date: Thu,  1 Aug 2024 07:29:40 -0600
Message-ID: <20240801132945.47963-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add a new -debug package to the pacman PKGBUILD that will contain the
vmlinux image for debugging purposes. This package depends on the
-headers package and will be installed in /usr/src/debug/${pkgbase}.

The vmlinux image is needed to debug core dumps with tools like crash.

Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
Reviewed-by: Peter Jung <ptr1337@cachyos.org>
---
 scripts/package/PKGBUILD | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 663ce300dd06..beda3db21863 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -6,6 +6,7 @@ pkgbase=${PACMAN_PKGBASE:-linux-upstream}
 pkgname=("${pkgbase}" "${pkgbase}-api-headers")
 if grep -q CONFIG_MODULES=y include/config/auto.conf; then
 	pkgname+=("${pkgbase}-headers")
+	pkgname+=("${pkgbase}-debug")
 fi
 pkgver="${KERNELRELEASE//-/_}"
 # The PKGBUILD is evaluated multiple times.
@@ -89,6 +90,15 @@ _package-headers() {
 	ln -sr "${builddir}" "${pkgdir}/usr/src/${pkgbase}"
 }
 
+_package-debug(){
+    pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
+    depends=(${pkgbase}-headers)
+
+    cd "${objtree}"
+    mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
+    install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
+}
+
 _package-api-headers() {
 	pkgdesc="Kernel headers sanitized for use in userspace"
 	provides=(linux-api-headers)
-- 
2.46.0


