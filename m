Return-Path: <linux-kbuild+bounces-6379-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB1A77AA2
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 14:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6A9918900A9
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Apr 2025 12:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F414A202F9F;
	Tue,  1 Apr 2025 12:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5fZgBTO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433CC202F7C;
	Tue,  1 Apr 2025 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509928; cv=none; b=obEC6eWAX3kZfd5dIO3JwiR2rVsDo2RYuW9JJNVaQq8OENF2/KbwWPHClIC+RfuOcsE0sVhotsleenSC+B2Wx8IGJVwLsjVG3SUgZLws1EwebCoVDHMf8V32hHjmMioDeGym3DcewadPoTFu/4YZAwaZp/iuofEX+OUkd8WVSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509928; c=relaxed/simple;
	bh=HaiOBqHuFiJ6ixd05DvNz+WuwX4gzteShKVoCBENbV8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nm7hm4JpwFR3ZAozfR+0nLhdJq2kK3yEWLuEqsyfNZfITB0w8N+YJhT0xw1jET+WppzJ51F8uroqRTzCSbiLNrbfeheCcZ8h0ieUfLohgFE3je8y+Udj08GKGzBchY1ab1mqS6M2TOUzCc0b+xVADpYpY1XBi7bdPO8czdBBddI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5fZgBTO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743509927; x=1775045927;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HaiOBqHuFiJ6ixd05DvNz+WuwX4gzteShKVoCBENbV8=;
  b=X5fZgBTOn6oQO2GM8w5QxphREPEFus4w/rfGmGuF1pEAmppTbMSh0RqM
   bXGSIysp1lHFlr+6ShOQhLoHkXDURRReG65x8tvf1RldqOQzn1oS0Bnml
   PEIOMLNIGC4ltx0gAib789Va5apGnVhuL4M4WXNtJIoFDBL81/zrHbVSQ
   4xhU0LnIyjstM5bRGgGIn2Vhr1kEfQ/YHUOCQmWzE90SNFNbgRwcK+0mv
   H5w22/2/DRCQbZ5WwY//U381VC1R8344slQ/cGbQdGMyIPzzWtjtbGy4H
   nV5YSNyK22IyN4j4BDaKoDNeoxQPkjsurcSagOwL3gG6GnPXSmog0Gd3E
   A==;
X-CSE-ConnectionGUID: hxgFSAx6SUS8tw/GIhu2XQ==
X-CSE-MsgGUID: D4GVx5eyTSCUAEx8ZWXXOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="70186925"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="70186925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:18:46 -0700
X-CSE-ConnectionGUID: ivyA8vynRjex5Iyoi33rAg==
X-CSE-MsgGUID: KAbHE6hJTWmHsvsLvmC7BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131373404"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:18:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com,
	linux-kbuild@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/5] hdrtest: hide the disgusting turds
Date: Tue,  1 Apr 2025 15:18:25 +0300
Message-Id: <20250401121830.21696-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

Hide all the disgusting turds in .hdrtest subdirectories in the build
tree, and put the extra drm build-time checks behind a kconfig option.


BR,
Jani.


Cc: linux-kbuild@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Jani Nikula (5):
  drm: place header test files in .hdrtest subdirectories
  drm/xe: place header test files in .hdrtest subdirectories
  drm/i915: place header test files in .hdrtest subdirectories
  kbuild: hdrtest: place header test files in .hdrtest subdirectories
  drm: add config option for extra build-time checks

 drivers/gpu/drm/Kconfig       | 21 +++++++++++++++++++--
 drivers/gpu/drm/Makefile      |  6 +++---
 drivers/gpu/drm/i915/Makefile |  6 +++---
 drivers/gpu/drm/xe/Makefile   |  6 +++---
 include/drm/Makefile          |  6 +++---
 usr/include/Makefile          |  4 ++--
 6 files changed, 33 insertions(+), 16 deletions(-)

-- 
2.39.5


