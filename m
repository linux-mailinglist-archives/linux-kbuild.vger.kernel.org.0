Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E86520F55
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2019 21:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfEPTsl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 15:48:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:2847 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbfEPTsl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 15:48:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 May 2019 12:48:39 -0700
X-ExtLoop1: 1
Received: from denismar-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.12])
  by fmsmga001.fm.intel.com with ESMTP; 16 May 2019 12:48:36 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com, Chris Wilson <chris@chris-wilson.co.uk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [RFC 2/3] drm/i915: ensure headers remain self-contained
Date:   Thu, 16 May 2019 22:48:17 +0300
Message-Id: <20190516194818.29230-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516194818.29230-1-jani.nikula@intel.com>
References: <20190516194818.29230-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use the new header test facility.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 1787e1299b1b..05d01a3830d0 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -204,3 +204,6 @@ i915-y += intel_lpe_audio.o
 
 obj-$(CONFIG_DRM_I915) += i915.o
 obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
+
+header-test-y := \
+	i915_drv.h
-- 
2.20.1

