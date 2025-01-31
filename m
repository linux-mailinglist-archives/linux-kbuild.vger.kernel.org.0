Return-Path: <linux-kbuild+bounces-5594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9CEA24568
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 23:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D1243A7DB5
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 22:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2B219E7D3;
	Fri, 31 Jan 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxpVhSkZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAD19AD89;
	Fri, 31 Jan 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738364143; cv=none; b=H5/nkVIYksgV28NmuAWLgEpm8fb0DTUkp3wGIVyaa94mJhB6oPa8G0A48xF7DCV0/F2gky5F5svOM2ypnSBBZeJks0eUNRmFePYYTmmRAQNzuIXH3ACe4vyKW93jaEb/Hl07wYasfyofFz2/uHximyYOOW0cWOYSWfCirNG974E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738364143; c=relaxed/simple;
	bh=lOGd3AYXVfHBbSKgrkXk8Xz+aydLyMFpZVs4uwg2GIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XkeU/arr8ipcSF66rjrdLkA9Z200pjC78SySUbVecojnNGJ4YcdALjlUxJ4xN507oke7HJup5/IfPFqeSQd8+cd12kOhwj3jhGv/GJ7mXBafNs4G4wCdvu266eOQGrOl2aVKWny/DilPRQvBNYx0EZjbXYsJs8ddJq7S2pqOOZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxpVhSkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCE9C4CED1;
	Fri, 31 Jan 2025 22:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738364143;
	bh=lOGd3AYXVfHBbSKgrkXk8Xz+aydLyMFpZVs4uwg2GIM=;
	h=From:Date:Subject:To:Cc:From;
	b=lxpVhSkZWfQJOpSjaQ8PD+QmcDjRQaeHFZtpGD9+tvwIRtHPAtuv+TjG7uSOdD3YZ
	 nuMN2WK1UbMS8iVHOn/sVWtAqo5wWiIg+vhtLbMgdbFNLzZZm+C8wgsqM4XkoJV0yt
	 /LeNs2/h5XzldL2KcHZDVJ+eaKQGREAk/9MJjm4eZOhRQE29muKWuExLdvEbh/SbJJ
	 9sr9uSNVP2ZgQ713b63JBR/Pb43ReRFJRiVsgrOY3nZGpG+CI3OwvEgT1yV/xw41l/
	 VGwSgvVYJeckMWihc2HvHfhwFbohI5Gl9w13jwkN44EAfMLXhZ/JYy/8PToyUblg49
	 UtkNp+oCrmGMw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 31 Jan 2025 15:55:28 -0700
Subject: [PATCH] scripts/Makefile.extrawarn: Do not show clang's
 non-kprintf warnings at W=1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-makefile-extrawarn-fix-clang-format-non-kprintf-v1-1-6c6747ada0d4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN9UnWcC/x2N0QqDMAxFf0XyvIC1DsZ+Zewhs+kW1FTSshXEf
 1/x8cA99+yQ2YQz3LsdjL+SJWkDd+lg+pC+GSU0hqEfrr3zDleaOcrCyLUY/cgUo1ScljbGmGy
 lgpoU581ES8QwhsDkb8wvD+11s6bXs/h4HscfV/kad4EAAAA=
X-Change-ID: 20250131-makefile-extrawarn-fix-clang-format-non-kprintf-d4ddea38eeb3
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545; i=nathan@kernel.org;
 h=from:subject:message-id; bh=lOGd3AYXVfHBbSKgrkXk8Xz+aydLyMFpZVs4uwg2GIM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlzQ96ozV/Ra3BLaZnE74hqv437TPSPLjXWWxR8wOKlu
 JwXj/yCjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRZ9cZGda2JsVMlrj+JzbW
 uU87SKRxp/GVJ3zMz4P104+L2/7bXMfwv0Dn9NcLuctsbR127jKrVcuc2fJcL3LegR8vpFJ2X2j
 k4wIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang's -Wformat-overflow and -Wformat-truncation have chosen to check
'%p' unlike GCC but it does not know about the kernel's pointer
extensions in lib/vsprintf.c, so the developers split that part of the
warning out for the kernel to disable because there will always be false
positives.

Commit 908dd508276d ("kbuild: enable -Wformat-truncation on clang") did
disabled these warnings but only in a block that would be called when
W=1 was not passed, so they would appear with W=1. Move the disabling of
the non-kprintf warnings to a block that always runs so that they are
never seen, regardless of warning level.

Fixes: 908dd508276d ("kbuild: enable -Wformat-truncation on clang")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.extrawarn | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1d13cecc7cc7..8878f71463fc 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -31,6 +31,11 @@ KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 ifdef CONFIG_CC_IS_CLANG
 # The kernel builds with '-std=gnu11' so use of GNU extensions is acceptable.
 KBUILD_CFLAGS += -Wno-gnu
+
+# Clang checks for overflow/truncation with '%p', while GCC does not:
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
+KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
+KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
 else
 
 # gcc inanely warns about local variables called 'main'
@@ -102,11 +107,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, packed-not-aligned)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow)
 ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation)
-else
-# Clang checks for overflow/truncation with '%p', while GCC does not:
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
-KBUILD_CFLAGS += $(call cc-disable-warning, format-overflow-non-kprintf)
-KBUILD_CFLAGS += $(call cc-disable-warning, format-truncation-non-kprintf)
 endif
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
 

---
base-commit: fd8c09ad0d87783b9b6a27900d66293be45b7bad
change-id: 20250131-makefile-extrawarn-fix-clang-format-non-kprintf-d4ddea38eeb3

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


