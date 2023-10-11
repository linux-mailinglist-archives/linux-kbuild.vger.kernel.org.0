Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8627C4BD1
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Oct 2023 09:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345393AbjJKH36 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Oct 2023 03:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345420AbjJKH3s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2023 03:29:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBD81BFB
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697009359; x=1728545359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sk7+SDf5VMSdPv94BbG9zAThSlfGA2P7R80rkLeBe7M=;
  b=LOa9dBPGD/WC82hHaKC+5zPPVEyiqzMzQfnz3cqFfmbCPUYkonfleebY
   1XYikzDCiZLF+sw/gLB+Jy+WD7bU3eJsJ2q1rCJJ7Zj6y8XCN7TvVRF7H
   esuQF+tFlE63HoC89XXq+wfUv3pK4gRJHYrUEyj68erfIcOocZUlbq/iX
   FTuLhDyhjXiZT3Z5ZuGQNADQu+sx8yVdOFzILcKR0wJGTml4HMucmqyNR
   Pj3PzlAcnDV3GaBrXSW3trsEoUWnW/qGvIEc/j+YVLUIyxNf/vMxFbDYn
   20T2dntQGLYhRejEYVpAsIwZvdb8j2KCjTmHy1YRBxKkuoNGeTmDtHCvG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="448802433"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="448802433"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="757443270"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="757443270"
Received: from wprelogx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.56.229])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:29:14 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-kbuild@vger.kernel.org, jani.nikula@intel.com,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/2] drm/i915: drop -Wall and related disables from cflags as redundant
Date:   Wed, 11 Oct 2023 10:29:03 +0300
Message-Id: <5ab754ddc2e342c75deb8476275984918e573beb.1697009258.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697009258.git.jani.nikula@intel.com>
References: <cover.1697009258.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
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

