Return-Path: <linux-kbuild+bounces-9273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 396C1C034D5
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 22:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0634118858E4
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 20:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE2F2D46C0;
	Thu, 23 Oct 2025 20:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icK013OY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57E259CBC;
	Thu, 23 Oct 2025 20:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249711; cv=none; b=SO9QRp3kFUwgqx0M2V/2muxp85hwbNnYtm0EDn1K3SkLV80YtJmY1gzz1Lv4327QVwNEMYvNWuE7Sg+I+sagW46egUx25IYS0zJ7oU1DaWnSPnL6H2hNFyLtylas4PQ6UcOHn8ZeCY/OIukYwu8TasWy+eBIhLAEJGKgbu7YwCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249711; c=relaxed/simple;
	bh=Eu6HfZEhZL3SUYJl2vnfzlz3reoi/tZPm0mScOAvxFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W1t6FSemAi79riM6RHEYdmI63uXJsBdez/+USOZJ5NsDvtEzrF5BR2TxRLwpZKkVbxbXLlJioOIX1C0PEsri3qn07FTSvYH6oIingTtO93H0RfUHARp+st3PlOQNYyUcRbAS3wC82K2k96Jn2hkJiQEV4lrPVBQ4vDZD2uE4boE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icK013OY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BFDC4CEFD;
	Thu, 23 Oct 2025 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761249710;
	bh=Eu6HfZEhZL3SUYJl2vnfzlz3reoi/tZPm0mScOAvxFE=;
	h=From:Date:Subject:To:Cc:From;
	b=icK013OYGCEOpbgsoWvdtv3EVccL7mUBJzdsVmJJTVfEIgWxqWpdM+8QCEu7R5hTm
	 FxG74pNdgos++OaFPRWc3Q9tbPjBLi8ZQM6+++xCHi6T4z8ULbHP4sAhiVPMXpaj07
	 KrvlKpiT1OZRxa1KFDtDwH9KUlAzfwL8e/EsFUhcfgX0HmhITSB2qkS+lzXbTbM+AL
	 8lbhLr/fU1xiIEKwvfi5P1wSfUcD8PdNl2jyRdqKVJ5MlT34ylX76STYfXNrh4iflN
	 c9jnl1gYKYou+xUcC/g3/9J5aQnceXtnp3vgmFuUhhTV0M5VO/pY28m4Vw1hESgq1b
	 ww/8n99NmypJw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 23 Oct 2025 22:01:36 +0200
Subject: [PATCH] kbuild: Rename Makefile.extrawarn to Makefile.warn
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-rename-scripts-makefile-extrawarn-v1-1-8f7531542169@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ+J+mgC/x2NwQrCQAwFf6XkbGC7rYf6K+Ih7r5q0K4lKbZQ+
 u8uHgeGmZ0cpnC6NDsZvur6KRXaU0PpKeUB1lyZYojnNsSODUUmsCfTeXGe5IVR32Bsi8kqVjj
 1Q5/HIYd8F6qd2aqx/R/X23H8ANNYXoRzAAAA
X-Change-ID: 20251023-rename-scripts-makefile-extrawarn-c494df9d0dba
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Eu6HfZEhZL3SUYJl2vnfzlz3reoi/tZPm0mScOAvxFE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBm/OlfHcZxxfHelLboip1Wgtrg6/ONU73MGBjZ3/06v2
 SorVDCxo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkbyIjw5xlJ1SS3l4NMxd2
 eeElKyqw73zLS5YA7qMHTMU+TRVk+8rIsH1D+jdXj79cD9y3MpRoqAWVfvx+56v1uaOlupk7rNh
 usAAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Since commit e88ca24319e4 ("kbuild: consolidate warning flags in
scripts/Makefile.extrawarn"), scripts/Makefile.extrawarn contains all
warnings for the main kernel build, not just warnings enabled by the
values for W=. Rename it to scripts/Makefile.warn to make it clearer
that this Makefile is where all Kbuild warning handling should exist.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile                                      | 2 +-
 drivers/gpu/drm/Makefile                      | 2 +-
 scripts/{Makefile.extrawarn => Makefile.warn} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 79b631075d33..96ca0f17d158 100644
--- a/Makefile
+++ b/Makefile
@@ -1084,7 +1084,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
 endif
 
 # include additional Makefiles when needed
-include-y			:= scripts/Makefile.extrawarn
+include-y			:= scripts/Makefile.warn
 include-$(CONFIG_DEBUG_INFO)	+= scripts/Makefile.debug
 include-$(CONFIG_DEBUG_INFO_BTF)+= scripts/Makefile.btf
 include-$(CONFIG_KASAN)		+= scripts/Makefile.kasan
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 4b2f7d794275..d1a102c4b80a 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -6,7 +6,7 @@
 CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
-# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
+# --- begin copy-paste W=1 warnings from scripts/Makefile.warn
 subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
 subdir-ccflags-y += $(call cc-option, -Wrestrict)
 subdir-ccflags-y += -Wmissing-format-attribute
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.warn
similarity index 100%
rename from scripts/Makefile.extrawarn
rename to scripts/Makefile.warn

---
base-commit: ac1280211e1c41704c756fd1bc5512f92010b3f0
change-id: 20251023-rename-scripts-makefile-extrawarn-c494df9d0dba

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


