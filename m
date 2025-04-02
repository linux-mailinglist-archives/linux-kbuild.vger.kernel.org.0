Return-Path: <linux-kbuild+bounces-6390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E8A78EF0
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 14:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69A0A7A44CD
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Apr 2025 12:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB5123A98D;
	Wed,  2 Apr 2025 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INWVAHr2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D1423AE7C;
	Wed,  2 Apr 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598046; cv=none; b=PXiGxocH5m5lGB2c/bfr53ZrhFJHc1PdOmUYa7tNnwB483e7nXzM82xr74v0k4otQiEjHqDK+mf7rOc1430gX5y/SAcMdGF8J0hdh/zqvofFa2metYrhKjbYbNT4NSxkioPLzb4IihikCiPJAdWg0msr0Ixmbf7uFK4PS8nBXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598046; c=relaxed/simple;
	bh=7kBGJe/b/YJonwEAB/pAg4Y102PYNZxoPCYFTwNHLo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jFgqiuhUu71DOTN5kc/TtJJwKx96sRkI1NLgOEt5roA/+52radAOd7VdpHF87Fplw5t6rklHdBP0BZmrok6r00AxketqWzIPApxLF/HKm3C2XdMMrIF8OezaPSSvBenQSTrL3dqCYXEZ7ol8pgyyInbCHiLoLjTeVB3cL6jnn+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INWVAHr2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743598045; x=1775134045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kBGJe/b/YJonwEAB/pAg4Y102PYNZxoPCYFTwNHLo0=;
  b=INWVAHr2uWIoQNgne0nAIHtMqgNp1sq/BiVF5dUm8Jo2t2vjy7eEAVaH
   CKhkDvYHlZgYZwmKRXcB8o/1J5Gw3vDUE80yCLky/HFJ2RpPaxITmRtWr
   h/c8A5tt+X/+prkDVoF+aocf5/pDF5aXkWADu8UBclPrX2S0nQmJz96XU
   isdh/9OMYyEpqRSex38hphvNnvDLr+V9vZ+oyXLqA0Ld2HP3suSlWr0Cn
   u9PC/pC8AFKRCGwin8lNmS/P5nsCP5R95u0VbqYfbG38h3VORXth07JLi
   aztLwj7zK85domIhlkel33FHx584W7jXuMhYjE0F+hVfwtH3rZSqJoVX7
   g==;
X-CSE-ConnectionGUID: TofBpnvtRkOe23/UQMX98Q==
X-CSE-MsgGUID: an2RyJrCQySGnUikn5YE9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55953463"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="55953463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:25 -0700
X-CSE-ConnectionGUID: +zVGJ6EMTLWImVrf0u5jjw==
X-CSE-MsgGUID: mvzKh6FUQhGJp6x2yeLDWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; 
   d="scan'208";a="127180616"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 05:47:20 -0700
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
Subject: [PATCH v2 2/4] drm: switch to generic header check facility
Date: Wed,  2 Apr 2025 15:46:54 +0300
Message-Id: <20250402124656.629226-3-jani.nikula@intel.com>
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

Keep CONFIG_DRM_HEADER_TEST around for fine-grained control of what gets
checked. To be unified later.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com
Fixes: 62ae45687e43 ("drm: ensure drm headers are self-contained and pass kernel-doc")
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
 drivers/gpu/drm/Kconfig  |  2 +-
 drivers/gpu/drm/Makefile | 15 +--------------
 include/drm/Makefile     | 15 +--------------
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 2cba2b6ebe1c..10189d0ec30d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -505,7 +505,7 @@ config DRM_WERROR
 
 config DRM_HEADER_TEST
 	bool "Ensure DRM headers are self-contained and pass kernel-doc"
-	depends on DRM && EXPERT && BROKEN
+	depends on DRM && HEADER_CHECK
 	default n
 	help
 	  Ensure the DRM subsystem headers both under drivers/gpu/drm and
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..fb2642d46f29 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -225,19 +225,6 @@ obj-$(CONFIG_DRM_LOONGSON) += loongson/
 obj-$(CONFIG_DRM_POWERVR) += imagination/
 
 # Ensure drm headers are self-contained and pass kernel-doc
-hdrtest-files := \
+header-check-$(CONFIG_DRM_HEADER_TEST) += \
 	$(shell cd $(src) && find . -maxdepth 1 -name 'drm_*.h') \
 	$(shell cd $(src) && find display lib -name '*.h')
-
-always-$(CONFIG_DRM_HEADER_TEST) += \
-	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
-
-# Include the header twice to detect missing include guard.
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = \
-		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
-		touch $@
-
-$(obj)/%.hdrtest: $(src)/%.h FORCE
-	$(call if_changed_dep,hdrtest)
diff --git a/include/drm/Makefile b/include/drm/Makefile
index a7bd15d2803e..ed0567a7956a 100644
--- a/include/drm/Makefile
+++ b/include/drm/Makefile
@@ -1,18 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # Ensure drm headers are self-contained and pass kernel-doc
-hdrtest-files := \
+header-check-$(CONFIG_DRM_HEADER_TEST) += \
 	$(shell cd $(src) && find * -name '*.h' 2>/dev/null)
-
-always-$(CONFIG_DRM_HEADER_TEST) += \
-	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
-
-# Include the header twice to detect missing include guard.
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
-      cmd_hdrtest = \
-		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
-		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
-		touch $@
-
-$(obj)/%.hdrtest: $(src)/%.h FORCE
-	$(call if_changed_dep,hdrtest)
-- 
2.39.5


