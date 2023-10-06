Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D737BB7C2
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 14:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjJFMfI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 08:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231797AbjJFMfI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 08:35:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88632C2
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696595705; x=1728131705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qacfm631k2c6qgx8O95EcNeGual3NcFbAvpXGWJuWB8=;
  b=YgyKKwPD2KdtqajC2eEY/F8Z+d3dBk1lsaOSe6FGUvQGBks21NIqJoHw
   lWpvJRyLVQg50pV5Y45F6dxA2J3BOVaXALSayu8L/CSLj4WvBm1AKsLdv
   rL+BYaQVc1811LUIEMHUR6vrS9RlEv4s99vqyAj2AaBLPPsZ0bvbV8tCX
   NvfuImYuA0fCFcCvS/GTKg5D3dwFJ2Wh4zn9Sj80CA4ZvYFhXTlUsktu3
   DCwqK6BUmjrAK5wQcQdBUy2HURJOKNgWBgoSHOJzvGhqTpScIRNBmpM3i
   7xNQ3GMzfe/vqhRpCDqmbB7pGwZwBf/y7X3AUplb1G/8OEKbWk6xcSQan
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386564223"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="386564223"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:35:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875930223"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="875930223"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.41.239])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:35:02 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-kbuild@vger.kernel.org, jani.nikula@intel.com,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] drm/i915: drop -Wall and related disables from cflags as redundant
Date:   Fri,  6 Oct 2023 15:34:46 +0300
Message-Id: <48f11648d7169687e7242e4c9b4694a0c03c4263.1696595500.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1696595500.git.jani.nikula@intel.com>
References: <cover.1696595500.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel top level Makefile, and recently scripts/Makefile.extrawarn,
have included -Wall, and the disables -Wno-format-security and
$(call cc-disable-warning,frame-address,) for a very long time. They're
redundant in our local subdir-ccflags-y and can be dropped.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index dec78efa452a..623f81217442 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -5,22 +5,20 @@
 
 # Add a set of useful warning flags and enable -Werror for CI to prevent
 # trivial mistakes from creeping in. We have to do this piecemeal as we reject
-# any patch that isn't warning clean, so turning on -Wall -Wextra (or W=1) we
+# any patch that isn't warning clean, so turning on -Wextra (or W=1) we
 # need to filter out dubious warnings.  Still it is our interest
 # to keep running locally with W=1 C=1 until we are completely clean.
 #
-# Note the danger in using -Wall -Wextra is that when CI updates gcc we
+# Note the danger in using -Wextra is that when CI updates gcc we
 # will most likely get a sudden build breakage... Hopefully we will fix
 # new warnings before CI updates!
-subdir-ccflags-y := -Wall -Wextra
-subdir-ccflags-y += -Wno-format-security
+subdir-ccflags-y := -Wextra
 subdir-ccflags-y += -Wno-unused-parameter
 subdir-ccflags-y += -Wno-type-limits
 subdir-ccflags-y += -Wno-missing-field-initializers
 subdir-ccflags-y += -Wno-sign-compare
 subdir-ccflags-y += -Wno-shift-negative-value
 subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
-subdir-ccflags-y += $(call cc-disable-warning, frame-address)
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
 # Fine grained warnings disable
-- 
2.39.2

