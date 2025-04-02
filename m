Return-Path: <linux-kbuild+bounces-6389-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074FA78EF6
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 14:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0476B3B125B
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1103D238D3B;
	Wed,  2 Apr 2025 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMO21pg5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C26238D22;
	Wed,  2 Apr 2025 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598040; cv=none; b=Jyls25yaAruf+4PKgWLVjkTMTqsWSWc0Hvd87d02Ew0XffKvStI9+sJuABjIiln9OvYw/yrZxZRtV/0qb3hF+D4SHhXihI0EEKG8RFNXNLxu5DW87UjDHCPejmaxN4Clcu6OeIbAI3PPxJZJRZGxVkzdrnzC2M6XOHVpJKewKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598040; c=relaxed/simple;
	bh=qr8iSipiHo5jJvKJa3s9CyvhdjrZ/xOgb2s6Bw8S+1o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tFsHiFPlh71qYJWCUAHbPqsNlqmb+4gi4F+ad88TAAmlvUG+IsECZQtMB46XPFaeZag3zB0hYoeLZM2QcsJEaVs55bKqXD6o5EQDigx8FN4I/Z4X21aWqSGQ5YWKEB95BKvPjfF7i4OXE/NFHC14U3vjHAOgkt5NKTyRoOvb3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMO21pg5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743598038; x=1775134038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qr8iSipiHo5jJvKJa3s9CyvhdjrZ/xOgb2s6Bw8S+1o=;
  b=SMO21pg5zMIVxYw/oppWSPOibbti+EUSHBv6rnNUvgTgow8cvPUIHgT9
   P5U11WbBZOG+7UHcMo5HbTbOH5jKW6ZXQXp/UiT7ctv0rAQTGZxfRpJLE
   5qlkf8lz1ImLyWP+Vqk+udnUeki5X/S2RKkfSeuqAofyYqnejvEEAL9Nl
   i7jBGEneQRwvN/QjwRenK4B95HrcBKZm5CE3pDSmx4McSeHDuJAGVFlrx
   KUlLFCMvDCRttGBw4io7MBTOTGe6dpGgIuFYqj26h0Pw3rCzpJ324Kc9n
   L8Qn0ctejFoAkzf62ihBbagJKGDqSuZRSEOV2x/dkf0eZDQOehZPgKbT6
   A==;
X-CSE-ConnectionGUID: jI3g9CHMTi6p+h1OOYFWpw==
X-CSE-MsgGUID: D2gTN3riTsSAXt5EknHPVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953447"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55953447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:18 -0700
X-CSE-ConnectionGUID: 2r3kwEmGRyGIsnfD+R/QXw==
X-CSE-MsgGUID: mmuF0WxgSoi5ifwFAya80g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127180597"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com,
	Jason Gunthorpe <jgg@nvidia.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] kbuild: add generic header check facility
Date: Wed,  2 Apr 2025 15:46:53 +0300
Message-Id: <20250402124656.629226-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250402124656.629226-1-jani.nikula@intel.com>
References: <20250402124656.629226-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Resurrect a generic header check facility. Check that the headers are
self-contained, have header guards, and (if enabled separately) pass
kernel-doc. Run header checks on .h files listed in header-check-y or
header-check-m, relative to $(src).

Hide header check artifacts under a .header-check subdirectory at the
top level of the build output directory.

Add the facility behind CONFIG_HEADER_CHECK_DISABLE, reversed to keep
the feature disabled for allmodconfig and allyesconfig builds. Also add
a proxy CONFIG_HEADER_CHECK option to simplify dependencies on the
facility. The kernel-doc check requires CONFIG_HEADER_CHECK_KERNEL_DOC.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
---
 init/Kconfig           | 25 +++++++++++++++++++++++++
 scripts/Makefile.build | 13 +++++++++++++
 scripts/Makefile.lib   |  7 +++++++
 3 files changed, 45 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index 681f38ee68db..2678a5ba7b93 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -217,6 +217,31 @@ config UAPI_HEADER_TEST
 	  If you are a developer or tester and want to ensure the exported
 	  headers are self-contained, say Y here. Otherwise, choose N.
 
+# Reversed option to disable on allyesconfig/allmodconfig builds
+config HEADER_CHECK_DISABLE
+	bool "Disable extra build-time header checks"
+	default y
+	help
+	  Disable extra build-time header checks. The checks may be
+	  overzealous. They may slow down or fail the build altogether. They may
+	  create excessive dependency files in the tree. They should not be
+	  enabled for regular builds, and thus they are disabled by default.
+
+# Proxy config to allow simple "depends on HEADER_CHECK"
+config HEADER_CHECK
+	bool
+	depends on EXPERT && HEADER_CHECK_DISABLE=n
+	default !HEADER_CHECK_DISABLE
+
+config HEADER_CHECK_KERNEL_DOC
+	bool "Run kernel-doc as part of header checks"
+	depends on HEADER_CHECK
+	default n
+	help
+	  Run kernel-doc as part of header checks. In addition to compiling,
+	  also check kernel-doc comments. With CONFIG_WERROR=y, kernel-doc
+	  warnings are treated as errors.
+
 config LOCALVERSION
 	string "Local version - append to kernel release"
 	help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 56be83024851..f963b2356b0e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -223,6 +223,19 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(obj)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Compile C headers (.h) for header check
+# ---------------------------------------------------------------------------
+
+# Include the header twice to detect missing include guard.
+quiet_cmd_header_check = HDRCHK  $(patsubst $(srctree)/%,%,$<)
+      cmd_header_check = \
+		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
+		$(if $(CONFIG_HEADER_CHECK_KERNEL_DOC),$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR),-Werror) $<,true); \
+		touch $@
+
+.header-check/$(obj)/%.header-check: $(src)/%.h FORCE
+	$(call if_changed_dep,header_check)
+
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 57620b439a1f..272a1b42292e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -89,6 +89,13 @@ multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 endif
 
+# Header checks
+# header-check-y/m contain .h files to be checked, relative to $(src)
+
+header-check-y	:= $(addprefix .header-check/$(obj)/,$(patsubst %.h,%.header-check,$(header-check-y) $(header-check-m)))
+
+always-$(CONFIG_HEADER_CHECK) += $(header-check-y)
+
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
 modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
-- 
2.39.5


