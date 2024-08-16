Return-Path: <linux-kbuild+bounces-3048-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845D954C36
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 16:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CD601C24073
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2024 14:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4190C1BDA82;
	Fri, 16 Aug 2024 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXxQiKYA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D981BD51B;
	Fri, 16 Aug 2024 14:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723817934; cv=none; b=IuaetV/Xv55C4wkhRhAB9Rl2YprkYTExFAFKHE9duoczJN9Hvv9WC2srIiDDWnbSmWj+fm4mA6svCW+yhNXLV5CUuVMBWeinVHTLEiTR3J7BP1sNPTLeSoph9uDrJjGZIu3sJ8xhSBrN6WiEZktfDPiuyvQI62QfFBUpwaJxKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723817934; c=relaxed/simple;
	bh=85yDOCa0mesRomJqkSrS/sZzpbNIJP6Eq012jbYPrRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpg/2KXqD3hCFyLxcAGyRvg+fK5tgBhuRDLofq6v++AweBD4wEU3XQWXA6VC74NWNH/PN0ecrNgfElurEVRUMi+SpkLySm/Gm0loKVKcM8iMoSObYj4vmL1VONYLmZXis/jfpBYMOamn5JiF/OtK5PtDMf/kJwv6Zx52VFGwWx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXxQiKYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D154CC32782;
	Fri, 16 Aug 2024 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723817933;
	bh=85yDOCa0mesRomJqkSrS/sZzpbNIJP6Eq012jbYPrRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TXxQiKYApcKQ+mybs7VzPMncIPblEehw2gw+pa/meVopTgz5gi0SEYDn8xJEaRxmr
	 BoZSgs084UOi9qbKXzh1+iRTwh0eMxNkFAoFgSiBQ1Lyt831+SBQZF4TfLmXQAOodl
	 5aPmIY9bUAaCTYWa46igH6n6v40iLyac8AmmrJGaW/g6cfGXwGD1stJ0A+FVlcP6Gi
	 wwNtV24/OnOW+5VcNiKzTusGg/1YdAGuUYmBlFu0/e7D7dTPXz1aZEuJO0/sOVrjoP
	 pKbe6droSg+bqPiTkYQ1da0APyR4CTOkus8Ds5kaMP/Qm4xjHfS5ge/sl31ux1fnFk
	 O2qAHfJgs9hvA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 2/2] kbuild: pacman-pkg: do not override objtree
Date: Fri, 16 Aug 2024 23:18:15 +0900
Message-ID: <20240816141844.1217356-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816141844.1217356-1-masahiroy@kernel.org>
References: <20240816141844.1217356-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

objtree is defined and exported by the top-level Makefile. I prefer
not to override it.

There is no need to pass the absolute pass of objtree. PKGBUILD can
detect it by itself.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.package | 3 +--
 scripts/package/PKGBUILD | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 4a80584ec771..2c261a0d42b0 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -147,8 +147,7 @@ snap-pkg:
 PHONY += pacman-pkg
 pacman-pkg:
 	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
-	+objtree="$(realpath $(objtree))" \
-		BUILDDIR="$(realpath $(objtree))/pacman" \
+	BUILDDIR="$(realpath $(objtree))/pacman" \
 		CARCH="$(UTS_MACHINE)" \
 		KBUILD_MAKEFLAGS="$(MAKEFLAGS)" \
 		KBUILD_REVISION="$(shell $(srctree)/scripts/build-version)" \
diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index e2d9c2601ca9..839cd5e634d2 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -40,7 +40,9 @@ _prologue() {
 	# MAKEFLAGS from makepkg.conf override the ones inherited from kbuild.
 	# Bypass this override with a custom variable.
 	export MAKEFLAGS="${KBUILD_MAKEFLAGS}"
-	cd "${objtree}"
+
+	# Kbuild works in the output directory, where this PKGBUILD is located.
+	cd "$(dirname "${BASH_SOURCE[0]}")"
 }
 
 build() {
-- 
2.43.0


