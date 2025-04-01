Return-Path: <linux-kbuild+bounces-6382-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8D7A77AA9
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 14:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A23816C0F7
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 12:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C765B2036EB;
	Tue,  1 Apr 2025 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3Mwxk9q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26570202965;
	Tue,  1 Apr 2025 12:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509948; cv=none; b=J/QVsjESppwniCwi6jEwDz+ZX/j/9n6QPEY0CA6pTsPkClOgJXuuaGlY2qyAEuGAdb8w0sWaei66gQiEBEByutvoi2QQA3QcFP+Rlg4efQIabluHG6TLTHGh62UdrZUfopHCy/W+8MAkW5rfJA4HBtFBqMhY9sjVQfpeic0GvxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509948; c=relaxed/simple;
	bh=kqy+pDKqPTt6DnS1U2G2+KSZGBj9TgpE+/PhWyhKPZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NBZzUmei/onBitYb0BvbchK51ILbmrwJFW62Lyawhmre5hPd8+UeFuZiP8bEiTOkUmVpT7G1Fl2QkXh+xZoUGjAl8mVDgB943lzoPaJtDN+l1yGhMbB5305xa3Lj455lY1tVvtAZmLfuuojEggqlIpni7i1dsDmzKQHIf8gMnT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3Mwxk9q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743509947; x=1775045947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kqy+pDKqPTt6DnS1U2G2+KSZGBj9TgpE+/PhWyhKPZM=;
  b=H3Mwxk9qS998qpX3wwlohRO9JQDJr0nBzMR7x/LrojsPnRb4EZBj1yf2
   Q1gTKBHJrw6zw0xKWhEWMX7iWN2GEjZP9wtTsEK+RZipP6lxdehgYEJaR
   WLZbu2lmb/KkdX62/plS+Gr6XLRoHg13Ja1eSTx81LjMlSYWEsZp24P5m
   9DJUVM/qS3iX+FVi47Il85UGk3kpDjhPaqJ2ZmRPMhRjDMZI852WhS1pl
   JMBNBCTCClNVdditQrelz2pKCF3B56+K3UHeQ3XZH27pKr0IeXC2KSnTo
   W521ZXxxrrzXxNV4IITlvaIes0uNzUAbWeocM+aVtl2EvyhrXrDgBYJkh
   Q==;
X-CSE-ConnectionGUID: AibCOSZdQh2r9PMzJeXE3Q==
X-CSE-MsgGUID: EWxy3LR1RQyk9OF6/v0FCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70186980"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="70186980"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:07 -0700
X-CSE-ConnectionGUID: ZEI6qYuTQtOOhUT4okRwJQ==
X-CSE-MsgGUID: qydX8mSjSjyTNh1ep3pLzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131373448"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:03 -0700
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
Subject: [PATCH 3/5] drm/i915: place header test files in .hdrtest subdirectories
Date: Tue,  1 Apr 2025 15:18:28 +0300
Message-Id: <20250401121830.21696-4-jani.nikula@intel.com>
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
Fixes: c6d4a099a240 ("drm/i915: reimplement header test feature")
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
 drivers/gpu/drm/i915/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index ed05b131ed3a..a8ffe5c74962 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -418,12 +418,12 @@ no-header-test := \
 	display/intel_vbt_defs.h
 
 always-$(CONFIG_DRM_I915_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
+	$(patsubst %.h,.hdrtest/%.hdrtest, $(filter-out $(no-header-test), \
 		$(shell cd $(src) && find * -name '*.h')))
 
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
 		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
 
-$(obj)/%.hdrtest: $(src)/%.h FORCE
+$(obj)/.hdrtest/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
-- 
2.39.5


