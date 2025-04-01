Return-Path: <linux-kbuild+bounces-6381-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 874D5A77AAB
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 14:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CB43A8934
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 12:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAF61FC0F3;
	Tue,  1 Apr 2025 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e96vg1qO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E185202965;
	Tue,  1 Apr 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509942; cv=none; b=P4+bXO1kWAGpy93VJhuv6ZFvS8frrxm9ZDGlPj6+1b58CgDXlXNY/ni0ox9UeL+tBCzUpnoC5RlB4zaqqO7CMQEkAzlUQHgGc9580VYRgDBql4G8/GnniaOlHgGpfe5e+nzhGYV3JkGKb8P9E2MxuVov6pIHM+T5OC7vgaTBBw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509942; c=relaxed/simple;
	bh=jT6ExL+POLRIZkDCDeOJqvP819AIWXO6Td1/S/GF2sE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W0odqNivQEFAkOrqL8zJo8Jdb0xRHg/XeIcygU2JpYzwqZAqKFK0gJMAKTrMJq6k4o0tr9FmJUmIV2a0GhDshPK4HZ+NYHJ2wQ7fttDZSGKt4cv09HpKVFAsM+y6nNaVzvkso+7sNQSSQfS3CiER4OQovzF3DD9DeE3b7s2uImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e96vg1qO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743509940; x=1775045940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jT6ExL+POLRIZkDCDeOJqvP819AIWXO6Td1/S/GF2sE=;
  b=e96vg1qOnf+yI08bnplalZT5109ylK+NHpEgbclOLcYu+xFzKooLupgj
   D3gzRC7tGTjd56ZVvKTg5QvnIOpILeDfhgGHzH6zr4OWCwcT4nB0+58QD
   WMi1e4j8ZZV1MTE1EMJaxohYXNkvWmmWog//J8Kd22jicHT24cc6lEbVi
   g8OQ03V3wFnl0WqmaTw/pivypKQzVnwoECoLySwH1tRESQDqN4tj6izLR
   I0LVbzU2KSfas4CIRwKzAQAQiR5UkZqJzT/IN9I4Ag7iRI+N+ew9LWktq
   VzUD+ZUtcOl+jHXs0YDGKP/xLnNZdKp0+sjz+MESC/o2FKh8jHaPLit4w
   A==;
X-CSE-ConnectionGUID: 7RlreNkMRUWBb9AjImlOyQ==
X-CSE-MsgGUID: ZtRMCsfHTQmnFVWGcl0UDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70186971"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="70186971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:00 -0700
X-CSE-ConnectionGUID: 2eNsLzwHTH2xvgeR6joxnA==
X-CSE-MsgGUID: 0OVOkFVaQSKzuJtY65XBNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131373437"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:18:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/xe: place header test files in .hdrtest subdirectories
Date: Tue,  1 Apr 2025 15:18:27 +0300
Message-Id: <20250401121830.21696-3-jani.nikula@intel.com>
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

The header tests track whether headers have been checked using empty
*.hdrtest files in the build tree. This pollutes the build directories,
as the files live in the same "name space" as the real output files,
messing with TAB completion among other things.

Hide the disgusting turds by placing them in .hdrtest subdirectories.

Change the quiet command output to simply $< instead of trying to decode
roughly the same from the increasingly complicated $@.

Note that it would be somewhat nicer to have the basename of the
.hdrtest files be dot-prefixed instead of using subdirectories. However,
it's challenging to come up with a pattern rule for that, as we can list
headers to test in the subdirectories of $(src) too, without requiring
Makefiles and kbuild to descend to each of them.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
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
 drivers/gpu/drm/xe/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9699b08585f7..2029c3b5aa5c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -327,12 +327,12 @@ ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
 endif
 
 always-$(CONFIG_DRM_XE_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args)))
+	$(patsubst %.h,.hdrtest/%.hdrtest, $(shell cd $(src) && find * -name '*.h' $(hdrtest_find_args)))
 
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
 
-$(obj)/%.hdrtest: $(src)/%.h FORCE
+$(obj)/.hdrtest/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
 
 uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
-- 
2.39.5


