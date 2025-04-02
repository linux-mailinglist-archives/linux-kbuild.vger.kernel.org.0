Return-Path: <linux-kbuild+bounces-6392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D467A78EF5
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 14:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A3A97A3485
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 12:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7583D23BD0C;
	Wed,  2 Apr 2025 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsgEZQbn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA14F23BD02;
	Wed,  2 Apr 2025 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598060; cv=none; b=GMJrCRuqNL9F5HLEcocZJ9a2cHEdL4aHPN/UHR2ILTjgKgBSTEPARuYZwH8yxybzgYchA7kUCKpJ7bj6L5e7Azu0VRGHYQKB5nSm73wdw518nKnTeK8pto+UV/XtyJeWF7v++DIA/EGqgw/8CweCip3yH7efyE8MCzrt7GgTjjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598060; c=relaxed/simple;
	bh=MNKJsSRnjJAwRVHrkPsVIyVWKLfaiUr0E2NtE6MVLzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DzUMO0wRrGI9U9PahABZvzPL0TKdMWTses5QJX3tWBykDNF/GMq1x55DGHY9JyTaSNBciRsjTk/QBej6eH5myFEaOOvM7NPMSgpQ6gayRq632eqUa7d4npLIaSESL5NtNLbAEOwgw/ZSt9KqG956Ecc6aet+M8/NcxMFlxHEwEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsgEZQbn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743598059; x=1775134059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MNKJsSRnjJAwRVHrkPsVIyVWKLfaiUr0E2NtE6MVLzE=;
  b=AsgEZQbnPgcO7n+PYL96hPmRulcW5fhrVEfQhvJ7ukVVQc32WAW3u0Sz
   b1iWWElX1ptMepet1xShLsDhUsC0cKBG4NwKUSvoobIPLT97WYgIHcKb8
   rqHoLB0n55VbpOTbeXAo2DPQW5x90KtvlN/lPxkmPog1aR63/COggniy8
   vvFgoORVOUKKXXybcH7sBi36Ohy00KfyKRVUZZZe1DY7yO15HLrZVs+El
   vJM2Uz1cUuSdNk0S9GpGBJ85eYaLzzf8c1t2e0unn3unvY5Zr8jecxlJy
   nsD3tHX4opAMO28/6jzbr+yjxdIElC4JPfhKrkmGd0Y8xp18RGJ/XctyB
   A==;
X-CSE-ConnectionGUID: h5FMsm6iQO+JLHgJUwElHQ==
X-CSE-MsgGUID: 0pi1R9VeTqq4EvnT8Q+PEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953497"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55953497"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:38 -0700
X-CSE-ConnectionGUID: L5jQPIugQJyHySXuhhDJCg==
X-CSE-MsgGUID: 4g2ibqrQSCqmz7pBywSHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127180661"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:34 -0700
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
Subject: [PATCH v2 4/4] drm/xe: switch to generic header check facility
Date: Wed,  2 Apr 2025 15:46:56 +0300
Message-Id: <20250402124656.629226-5-jani.nikula@intel.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to the generic header check facility, and sunset the copy-pasted
local version.

Keep the header checks gated on CONFIG_DRM_XE_WERROR as before. To be
unified later.

While at it, fix a header missing header guards that was not caught by
the local version.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
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
 drivers/gpu/drm/xe/Makefile       | 10 ++--------
 drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9699b08585f7..2a1854024c84 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -326,14 +326,8 @@ ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
 	hdrtest_find_args += -not -path display/\* -not -path compat-i915-headers/\* -not -path xe_display.h
 endif
 
-always-$(CONFIG_DRM_XE_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args)))
-
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
-
-$(obj)/%.hdrtest: $(src)/%.h FORCE
-	$(call if_changed_dep,hdrtest)
+header-check-$(CONFIG_DRM_XE_WERROR) += \
+	$(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args))
 
 uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
 $(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index 2bae9afdbd35..4fd58b3c0d9a 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -3,6 +3,9 @@
  * Copyright © 2022 Intel Corporation
  */
 
+#ifndef _XE_PCODE_API_H_
+#define _XE_PCODE_API_H_
+
 /* Internal to xe_pcode */
 
 #include "regs/xe_reg_defs.h"
@@ -68,3 +71,4 @@ struct pcode_err_decode {
 	const char *str;
 };
 
+#endif
-- 
2.39.5


