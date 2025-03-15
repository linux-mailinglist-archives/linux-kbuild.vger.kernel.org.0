Return-Path: <linux-kbuild+bounces-6177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF1A62EF1
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 16:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D0793B9503
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C72719049B;
	Sat, 15 Mar 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="se5ntyMM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AF217995E;
	Sat, 15 Mar 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742051727; cv=none; b=hpubzHF7WcevpPzcOp79w0L/Njf6icEy2oCTZ0nmII88M4o23eA86+uEF1/KzLDVZgrcLnW6yVXARx6sevoW8UEnI2/kRVRa53M+R8I/WSJasLwIvyIPi/ZdzEdkcrYvzlQN7GcyoRw52bS+wkfIF3NaU8nFm/p2UtqMMtk1Mf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742051727; c=relaxed/simple;
	bh=wMDkFlOEMkADkhwlpU4LQIA7ztRZxNdc4osh9N2ewzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7ycBI9nbmseup43Y8SgRpmu8JyaRNkYyHg01181QjNTPV9IHb/dRCmGN9SwHtJZYdNqL+LOgDSOsgEcXMAwGbt2D7BVSkf56BLiv9KovReUqaJankjFDxkSew8kweIUl4nVkFSXS3hCl/jzJOawKsbVHvnmaAa2g8LqSeDEaZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=se5ntyMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA3EC4CEE5;
	Sat, 15 Mar 2025 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742051726;
	bh=wMDkFlOEMkADkhwlpU4LQIA7ztRZxNdc4osh9N2ewzw=;
	h=From:To:Cc:Subject:Date:From;
	b=se5ntyMMW7rOeIwJdFwrDz4s0ByDnJdY5V8hy0gv9tk6T2qpLXFR0e4R/aeS/Ge7a
	 gbAL8kt2VRTS+uKiO2CFTifGq6dOZxZYYTTro8sKe2H6ODrAU7dG0wGXM7MtNVm8Nb
	 8zmOR3KzXHCpoqdLEY3TqGGRVJaw/0383XZDtf0ZkAGSx849CfTuRj13WtRAfcgXZI
	 ukg/CnkNPJEUTZzrdXBTP+AnpXU6vraYO9rTy094K3bvvaWJx6lenjxwyJ0hkGbzj9
	 cu5doeDVdXUPPEwIfr1q1EQR1A7jJrH3wQV5IP7yU2TOgGprbrzP8keHde1nxifoKV
	 95q4kAFIFousQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Christian Heusel <christian@heusel.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH] kbuild: pacman-pkg: hardcode module installation path
Date: Sun, 16 Mar 2025 00:15:20 +0900
Message-ID: <20250315151522.2766939-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'make pacman-pkg' for architectures with device tree support (i.e., arm,
arm64, etc.) shows logs like follows:

  Installing dtbs...
    INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr//lib/modules/6.14.0-rc6+/dtb/actions/s700-cubieboard7.dtb
    INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr//lib/modules/6.14.0-rc6+/dtb/actions/s900-bubblegum-96.dtb
    INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr//lib/modules/6.14.0-rc6+/dtb/airoha/en7581-evb.dtb
      ...

The double slashes ('//') between 'usr' and 'lib' are somewhat ugly.

Let's hardcode the module installation path because the package contents
should remain unaffected even if ${MODLIB} is overridden. Please note that
scripts/packages/{builddeb,kernel.spec} also hardcode the module
installation path.

With this change, the log will look better, as follows:

  Installing dtbs...
    INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr/lib/modules/6.14.0-rc6+/dtb/actions/s700-cubieboard7.dtb
    INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr/lib/modules/6.14.0-rc6+/dtb/actions/s900-bubblegum-96.dtb
    INSTALL /home/masahiro/linux/pacman/linux-upstream/pkg/linux-upstream/usr/lib/modules/6.14.0-rc6+/dtb/airoha/en7581-evb.dtb
      ...

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/PKGBUILD | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
index 0cf3a55b05e1..452374d63c24 100644
--- a/scripts/package/PKGBUILD
+++ b/scripts/package/PKGBUILD
@@ -53,7 +53,7 @@ build() {
 _package() {
 	pkgdesc="The ${pkgdesc} kernel and modules"
 
-	local modulesdir="${pkgdir}/usr/${MODLIB}"
+	local modulesdir="${pkgdir}/usr/lib/modules/${KERNELRELEASE}"
 
 	_prologue
 
@@ -81,7 +81,7 @@ _package() {
 _package-headers() {
 	pkgdesc="Headers and scripts for building modules for the ${pkgdesc} kernel"
 
-	local builddir="${pkgdir}/usr/${MODLIB}/build"
+	local builddir="${pkgdir}/usr/lib/modules/${KERNELRELEASE}/build"
 
 	_prologue
 
@@ -114,7 +114,7 @@ _package-debug(){
 	pkgdesc="Non-stripped vmlinux file for the ${pkgdesc} kernel"
 
 	local debugdir="${pkgdir}/usr/src/debug/${pkgbase}"
-	local builddir="${pkgdir}/usr/${MODLIB}/build"
+	local builddir="${pkgdir}/usr/lib/modules/${KERNELRELEASE}/build"
 
 	_prologue
 
-- 
2.43.0


