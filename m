Return-Path: <linux-kbuild+bounces-2875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B2A949DC4
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 04:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 390531F244B5
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 02:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA00015D5C1;
	Wed,  7 Aug 2024 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LArhQhKR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B77B17AE17
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Aug 2024 02:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722997720; cv=none; b=uzanqymIlutVaeqUVSBoGrEXhACfL6qF8ILCYAEDOy+HmZJPeJKf9P8ndReQoQ3eOQVMEvCHx7FYQx9HP/nIGFmFH4U1UXbouoUXArELtyBRZ1AOcdN8a14QfYi0Svk9PBt70Fp7zLO9eZ7mmAowToiWj7bjoNspXC3rrdwW+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722997720; c=relaxed/simple;
	bh=XYEizIxioPTaNK4XTRmxkn6Dt9oD7j4ACSvOAeNhy1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dosBOV0yEvKVmRLkaovKEkv+UM5M7I5kxf/qESA+7mwSxo8hFz7LVJLQlinqcHFX3x/Es3SwO8abYL8FainYIL8pQnNtO1trP9sHNP4qx1wPLe2WiQVrqOqnkgx9a9Gw9GK7GU/ciOqOHUGhnz8ATrTD9xDxU9rqwqWLrEzSV0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LArhQhKR; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722997716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AHYXMHiHBActcUlgT7XphbKcLiDQZ8kITOmMf3n0jEs=;
	b=LArhQhKR6C+bl30yJDPf6855wKjk7uWwjH8iasdSsST/fvDOsi6TTxoFeZzVkk0quCG1M2
	XFdMaD2B6J7l1LMIz3a154wFI6/dLAWFGOyJiXNjSpAbCk41Hs3jEn7lYRYnqy6UF0bhJ2
	XGwob46ZHrjLvkhyzYK2MvThStcFGoQ=
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>
Cc: Jose Fernandez <jose.fernandez@linux.dev>,
	Peter Jung <ptr1337@cachyos.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES
Date: Tue,  6 Aug 2024 20:27:18 -0600
Message-ID: <20240807022718.24838-2-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Introduce a new variable, PACMAN_EXTRAPACKAGES, in the Makefile.package
to control the creation of additional packages by the pacman-pkg target.

The headers and api-headers packages will be included by default if
PACMAN_EXTRAPACKAGES is not set. This changes the previous behavior
where api-headers was always included, and headers was conditionally
included if CONFIG_MODULES=y. Now, this decision is delegated to the
user.

To disable extra packages, set PACMAN_EXTRAPACKAGES to an empty value:

make pacman-pkg PACMAN_EXTRAPACKAGES=

or

make pacman-pkg PACMAN_EXTRAPACKAGES=""

Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
Reviewed-by: Peter Jung <ptr1337@cachyos.org>
---
v1 -> v2: Build all extra packages by default. Remove unnecessary lines.

In a previous patch, there was concern that adding a new debug package
would increase the package time. To address this concern and provide
more flexibility, this change has been added to allow users to decide
which extra packages to include before introducing an optional debug
package [1].

[1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990X/T/

 scripts/Makefile.package |  2 ++
 scripts/package/PKGBUILD | 11 +++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 4a80584ec771..ccdf8ba41f0b 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -144,6 +144,8 @@ snap-pkg:
 # pacman-pkg
 # ---------------------------------------------------------------------------
 
+PACMAN_EXTRAPACKAGES ?= headers api-headers
+
 PHONY += pacman-pkg
 pacman-pkg:
 	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 663ce300dd06..8de869f9b1d4 100644
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
+_extrapackages=${PACMAN_EXTRAPACKAGES:-}
+for pkg in $_extrapackages; do
+	pkgname+=("${pkgbase}-${pkg}")
+done
+
 pkgver="${KERNELRELEASE//-/_}"
 # The PKGBUILD is evaluated multiple times.
 # Running scripts/build-version from here would introduce inconsistencies.
-- 
2.46.0


