Return-Path: <linux-kbuild+bounces-6380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18482A77AA5
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 14:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACF816ADF2
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 12:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D6C202C56;
	Tue,  1 Apr 2025 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UaIexSN6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61D202965;
	Tue,  1 Apr 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509935; cv=none; b=IL9SwfR5AZULaJoi0FLDD0klVyKkPmuiwhbspZMwm/voWyHKuExf5cZ6p4fq2cKockB3rzXGsZBT4W8kJmpc0UIeFTTVrZcgKvnNQBUMnwFl0L0rlVds0s+0a+bruLYmq8LXiZ7AdCsR5sozm1qikA7CwkUHeCgdZ5jMAp4+KMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509935; c=relaxed/simple;
	bh=qMks4yyxcsdFFFFIp4ZE81kxinfaQlXtFyDSszriyh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sBa+tkuWw/QZBte0fvjvVmc7Vrfnae0A/LisIbbVUXcOVnThPXtNA7T2Fh/MP/Fh485ioRrk1SQegAFubd9wcpjb3caX6RlEJPHrJDTDPaMECR3hRp5O3LJqlG5bTs33N6l3nHh6dxowZmyDyBqP0zO/88KIXtViltA6t6w/Ztk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UaIexSN6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743509933; x=1775045933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qMks4yyxcsdFFFFIp4ZE81kxinfaQlXtFyDSszriyh8=;
  b=UaIexSN6OeOWsIR56cs7Zmb+0+uYN55BbxyqmByUZ8HV5Jvyoxz2jje8
   TkYCrcOOPdTqUSCuaYfWxOgdskNNdt4gnfNqTHJy4tBoH4A5raiOioclc
   aEa3AwL1S/Y82GDfNMSI3vSvD8mvNH2aXM5B5bYZgcWaAFWJ6986Bg7Xd
   GJDhGZGItw9RZXXTt9uQQ5mg5tAFCe81y+zcaIKiejP0KA36XhF76Ra4u
   BVhClXqyR52kD19yrm3gGwgTT9v9FBjdsJy8Lkp4Nz3yI70TJeg0C2CAH
   nugIwna6/Z8sfIArXQZqfcbPOxmZfKNf42l2z0uB0MzPX4t9kL1jWW+7I
   w==;
X-CSE-ConnectionGUID: hJyn4n5QSKGIIvesj7nO+Q==
X-CSE-MsgGUID: j/gxMD51TMiIXM6K16fl3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70186945"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="70186945"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:18:53 -0700
X-CSE-ConnectionGUID: FLKO6xFIRkSTSCD4li7oKw==
X-CSE-MsgGUID: /zPIWQYITWqWdiJYY+cBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131373417"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:18:49 -0700
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
Subject: [PATCH 1/5] drm: place header test files in .hdrtest subdirectories
Date: Tue,  1 Apr 2025 15:18:26 +0300
Message-Id: <20250401121830.21696-2-jani.nikula@intel.com>
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
 drivers/gpu/drm/Makefile | 6 +++---
 include/drm/Makefile     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ed54a546bbe2..1666ea55bd24 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -230,14 +230,14 @@ hdrtest-files := \
 	$(shell cd $(src) && find display lib -name '*.h')
 
 always-$(CONFIG_DRM_HEADER_TEST) += \
-	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
+	$(patsubst %.h,.hdrtest/%.hdrtest, $(hdrtest-files))
 
 # Include the header twice to detect missing include guard.
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
 		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
-$(obj)/%.hdrtest: $(src)/%.h FORCE
+$(obj)/.hdrtest/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
diff --git a/include/drm/Makefile b/include/drm/Makefile
index a7bd15d2803e..a7593987909b 100644
--- a/include/drm/Makefile
+++ b/include/drm/Makefile
@@ -5,14 +5,14 @@ hdrtest-files := \
 	$(shell cd $(src) && find * -name '*.h' 2>/dev/null)
 
 always-$(CONFIG_DRM_HEADER_TEST) += \
-	$(patsubst %.h,%.hdrtest, $(hdrtest-files))
+	$(patsubst %.h,.hdrtest/%.hdrtest, $(hdrtest-files))
 
 # Include the header twice to detect missing include guard.
-quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
+quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
 		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
 		touch $@
 
-$(obj)/%.hdrtest: $(src)/%.h FORCE
+$(obj)/.hdrtest/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
-- 
2.39.5


