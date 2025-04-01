Return-Path: <linux-kbuild+bounces-6383-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EED56A77AAE
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 14:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B6471890653
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 12:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5643F202C5C;
	Tue,  1 Apr 2025 12:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcIqLApK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A47202C43;
	Tue,  1 Apr 2025 12:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509955; cv=none; b=E58RnALWqRUddpM2QORb4v59W3JN8paoayDFlA1PcDBI56h8w2coUy465DbBt3dtyfdij9V5Vyi5LhNvG9moojS9kLKeCThAi1lFSn/ql2LcpRGWCaQhUJ8bRI0SzgmwhbV7qxkbre6UeN8PFqDqWu+mE9oxovJ0V9Kq/KT18wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509955; c=relaxed/simple;
	bh=TFzN17CpzAgXFVrWu0W8hh/yV1WzMbFtltLzk/8/ZTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fyeWQFPRKk/SKC2uij+mfHqppz8NS3Qg57KcRZnubv4GmD0DktvbIjqqbbAu/1nAl7iR++20lju/OA/pNOE9Es7ymfH5ycPhc5m00NRMtWp8taDgUdqFSJEoq04lk8NaJYItaNtctUqCo4g+g8mMOFzve45AhIX+8na/kU6NY0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcIqLApK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743509954; x=1775045954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TFzN17CpzAgXFVrWu0W8hh/yV1WzMbFtltLzk/8/ZTQ=;
  b=lcIqLApKKmK0Z5o4jOXwd7flIhTmcIC6dSum4kbjVJt/UuLdwhIHY3gY
   qBYs8+Gi5XnfJtoiLheJvuOp5tRCOPUhSu6R0KkmxRtzQXN3CSG4+NKdF
   kOxOUQNSpGONoq5tKSqv7b/7Z5sZigytuaqR1NcVk5gnHq+SgbjpsI8Iz
   Z1je3ZP+PjEmLgsW7he1Z3E7FyksIlZjyYOmQwrAWXuDXa7intVJU/lJe
   BCom/HRvrRyGI3+jdglwH9/nKH0lfwuRiVE0TMv9THKKqmMfY3Mm0lcl8
   hjMqbWIJVXcpT0R6bBOidvaLTRWZj5hd4aoxKTJfq7OX5wbPBh7QZZrgj
   w==;
X-CSE-ConnectionGUID: mrKuhlYqQdaarQjWydBFMQ==
X-CSE-MsgGUID: SXXT1EB6SwWH/jv0WvI/yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44981735"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="44981735"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:13 -0700
X-CSE-ConnectionGUID: uuGqDkIjS5imSGGyJCXT/A==
X-CSE-MsgGUID: QrIX/9gaTQGGnEU7Cm054Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="157365129"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:19:10 -0700
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
Subject: [PATCH 4/5] kbuild: hdrtest: place header test files in .hdrtest subdirectories
Date: Tue,  1 Apr 2025 15:18:29 +0300
Message-Id: <20250401121830.21696-5-jani.nikula@intel.com>
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

Note that it would be somewhat nicer to have the basename of the
.hdrtest files be dot-prefixed instead of using subdirectories. However,
it's challenging to come up with a pattern rule for that, as we can list
headers to test in the subdirectories of $(src) too, without requiring
Makefiles and kbuild to descend to each of them.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/r/CAHk-=wjMrqzuUmH-mFbR_46EWEFS=bB=J7h9ABMVy56Vi81PKQ@mail.gmail.com
Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
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
 usr/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index e3d6b03527fe..4fb574fd3fec 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -71,7 +71,7 @@ endif
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 no-header-test += asm-generic/%
 
-always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
+always-y := $(patsubst $(obj)/%.h,.hdrtest/%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
@@ -81,7 +81,7 @@ quiet_cmd_hdrtest = HDRTEST $<
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@
 
-$(obj)/%.hdrtest: $(obj)/%.h FORCE
+$(obj)/.hdrtest/%.hdrtest: $(obj)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
 
 # Since GNU Make 4.3, $(patsubst $(obj)/%/,%,$(wildcard $(obj)/*/)) works.
-- 
2.39.5


