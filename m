Return-Path: <linux-kbuild+bounces-6391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB2A78F02
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 14:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC01B3B2D55
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 12:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BCC1EA7DE;
	Wed,  2 Apr 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERBPKo3h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3177123A998;
	Wed,  2 Apr 2025 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598052; cv=none; b=Ko2ePd4SNi65SIE5eIInmULhdA9oKhS81+Lie2gjHVr8zl/KoWZF9wpvppIwxkWFBlCXsqNYf4nlVF8oQXcexM6F1cwaVy2gt0vsjNolxAswMGwCOdSamP/mV9B4HFLJ8Qk/mEgl0TWO9zuYY1QN9RFenX/hjk+nmU6csxnjWd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598052; c=relaxed/simple;
	bh=d5VI9ZLfR6Us/gAEzp8GzzGH2ksRebnMw1CHva4QmGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OcfPQLc4BHiiVyG6CRB63MaBr8CKKIphVSvHfWRUJrTmAlmUypwrrs73S/r66MYcT/XJTlXWElb/UFPNhJdP/Gv+StxpTju9Hxg2nmKnyrJUvUw9QFXrP7yhM21/nzNZGslObkv8fQuQIfmOzJTmep59AV9uEFW6p1pw4rovyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERBPKo3h; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743598051; x=1775134051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d5VI9ZLfR6Us/gAEzp8GzzGH2ksRebnMw1CHva4QmGk=;
  b=ERBPKo3hbzVTUQR1/Ib5G8XwRObUbyEzEFkmwqar7S/bQfUz9Mc8Z/AJ
   eIf0Q212/4H9F0pBQuJfw7/Zvz2KxVfKWiYV2hZkZdS0KlMG7T3+QipO+
   QKU7IEAW98c5L8YOZPr2pFR71QYDfaJ2bZ0u9TvLU7rst8D63GbT8csbD
   Dppy7SHContsc4ic8Gr0nJWC1Qr2wanYL5pzwhS0cYt8T4JDlmY4T0THP
   7kl34M2WO66m1FFrcH8LuC4UJPus2h8DDrupVHDQf0+dd5zCObcEjBvrq
   SwS2XF099uUZEBjTpziVSyMRqAdDkm1FfviJn15xwVE6axMfKEEibffiA
   A==;
X-CSE-ConnectionGUID: f/qNVtGPQX+ReeQO119l6g==
X-CSE-MsgGUID: sl7u7g9BRlWE9XqvGx1RtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953481"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55953481"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:31 -0700
X-CSE-ConnectionGUID: Qm6j3l87QeyOmk7HqQrGjw==
X-CSE-MsgGUID: /PtvqrrtQXqWU0aknNHXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127180654"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:27 -0700
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
Subject: [PATCH v2 3/4] drm/i915: switch to generic header check facility
Date: Wed,  2 Apr 2025 15:46:55 +0300
Message-Id: <20250402124656.629226-4-jani.nikula@intel.com>
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

Switch to the generic header check facility, and sunset the copy-pasted
local version.

Keep the header checks gated on CONFIG_DRM_I915_WERROR as before. To be
unified later.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com
Fixes: c6d4a099a240 ("drm/i915: reimplement header test feature")
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
 drivers/gpu/drm/i915/Makefile | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..dca187e58bda 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -411,19 +411,9 @@ ifdef CONFIG_DRM_I915_WERROR
     cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
 endif
 
-# header test
-
 # exclude some broken headers from the test coverage
 no-header-test := \
 	display/intel_vbt_defs.h
 
-always-$(CONFIG_DRM_I915_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
-		$(shell cd $(src) && find * -name '*.h')))
-
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
-		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
-
-$(obj)/%.hdrtest: $(src)/%.h FORCE
-	$(call if_changed_dep,hdrtest)
+header-check-$(CONFIG_DRM_I915_WERROR) += \
+	$(filter-out $(no-header-test),$(shell cd $(src) && find * -name '*.h'))
-- 
2.39.5


