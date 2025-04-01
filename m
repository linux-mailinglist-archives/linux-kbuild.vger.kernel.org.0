Return-Path: <linux-kbuild+bounces-6384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 697A5A77AAD
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 14:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA53316C08A
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D80B202F87;
	Tue,  1 Apr 2025 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbX1VpJy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE2A203703;
	Tue,  1 Apr 2025 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509961; cv=none; b=SCh/IxsFiBLqnopHiBhXDYOKakBtAjfHWWnrzCWKfU2nkcILjTdj/A0OuUSrlEhPn4RD5x8E8PiKPiycdigpBepE87Qcqi5oco+1SNKJSegiEP12ln1jF/Kl40WqgC2q2K3rbPNI9GkGJGheEyHArXP+WxDCEuCvWEze2lQmH4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509961; c=relaxed/simple;
	bh=k+JFvSQ26FarxrRAOquTbPWkCD8Pzve2Gh9zf2uf7Ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IOFKtBily58FAsPmyhcNVGkxevjbOl+sQWRYA9MhEw44E+QnyygYS4pOvO6DOTdrcpR1YWN7nwprAzeYrtO5DGrK/WEG4xjHmRVYkAv9dPSGvxzZOoLRxSOQnfxUWks2kalLkrEcAW3vs0qu2vcQuT+fBp00+hlRpHHfg8RlAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbX1VpJy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743509960; x=1775045960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k+JFvSQ26FarxrRAOquTbPWkCD8Pzve2Gh9zf2uf7Ew=;
  b=jbX1VpJy3JZalOIPMZ67A88AXrC4zSXIw0WCCsV+MigyAVAtRAmzwObw
   dO6eEyDy4M/C7IPtS+T4ysDSZ4UHU65sTA8KqvOPZk8KlyulBmL+rvfOT
   k2wcr/Rfy1ilyFBT2Dg7sgupFvjjOcm5irmvETIMclu/hZuHwd9OSkrsw
   ve7MaWvdlAbQCD2cfPpU1cAzCONKdnYkpxjFL3CGKnrToeIPm2nglXfLL
   +u6fNXulV3Vq2wfh9QTfnaObbe1FZJBu6eiLW1axJy5fVkf0/k5uMBUQ7
   117LWJZ7jXu2gkY30uzG2fzhgTBQUpeoUlC4T2XtAXBnos9BJTjeS9eNq
   A==;
X-CSE-ConnectionGUID: XpDjFH4nT5aorGRAWtuzug==
X-CSE-MsgGUID: FqyWUx5CSCy3JFHZdm5Dzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44981761"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="44981761"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:20 -0700
X-CSE-ConnectionGUID: O3fed8/ISRavwWB0+7AiGA==
X-CSE-MsgGUID: X3cpC3b2Skq3VReLpCGmUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="157365168"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com,
	Masahiro Yamada <masahiroy@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm: add config option for extra build-time checks
Date: Tue,  1 Apr 2025 15:18:30 +0300
Message-Id: <20250401121830.21696-6-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250401121830.21696-1-jani.nikula@intel.com>
References: <20250401121830.21696-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

The DRM subsystem contains additional build-time checks, primarily aimed
at DRM developers and CI systems. The checks may be overzealous. They
may slow down or fail the build altogether. They may create excessive
dependency files in the build tree. They should not be enabled for
regular builds, and certainly not forced on unsuspecting developers
running an allyesconfig or allmodconfig build.

Add config DRM_DISABLE_EXTRA_BUILD_CHECKS, enabled by default as well as
by allyesconfig/allmodconfig, hiding the extra checks from anyone but
people who intentionally opt-in for the checks.

For example, to enable header tests:

$ scripts/config --disable CONFIG_DRM_DISABLE_EXTRA_BUILD_CHECKS --enable CONFIG_DRM_HEADER_TEST
$ make olddefconfig

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com
Fixes: 62ae45687e43 ("drm: ensure drm headers are self-contained and pass kernel-doc")
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/Kconfig | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2cba2b6ebe1c..5a3fce9ef998 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -489,9 +489,26 @@ config DRM_PRIVACY_SCREEN
 	bool
 	default n
 
+# Reversed option to disable on allyesconfig/allmodconfig builds
+config DRM_DISABLE_EXTRA_BUILD_CHECKS
+	bool "Disable DRM subsystem extra build-time checks"
+	default y
+	help
+	  The DRM subsystem contains additional build-time checks, primarily
+	  aimed at DRM developers and CI systems. The checks may be
+	  overzealous. They may slow down or fail the build altogether. They may
+	  create excessive dependency files in the tree. They should not be
+	  enabled for regular builds, and thus they are disabled by default.
+
+# Proxy config to allow simple "depends on DRM_EXTRA_BUILD_CHECKS"
+config DRM_EXTRA_BUILD_CHECKS
+	bool
+	depends on DRM && EXPERT && DRM_DISABLE_EXTRA_BUILD_CHECKS=n
+	default !DRM_DISABLE_EXTRA_BUILD_CHECKS
+
 config DRM_WERROR
 	bool "Compile the drm subsystem with warnings as errors"
-	depends on DRM && EXPERT
+	depends on DRM_EXTRA_BUILD_CHECKS
 	depends on !WERROR
 	default n
 	help
@@ -505,7 +522,7 @@ config DRM_WERROR
 
 config DRM_HEADER_TEST
 	bool "Ensure DRM headers are self-contained and pass kernel-doc"
-	depends on DRM && EXPERT && BROKEN
+	depends on DRM_EXTRA_BUILD_CHECKS
 	default n
 	help
 	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
-- 
2.39.5


