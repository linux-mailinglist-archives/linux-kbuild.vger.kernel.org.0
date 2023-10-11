Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2887C4C14
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Oct 2023 09:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345567AbjJKHiQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Oct 2023 03:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345563AbjJKHiI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2023 03:38:08 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70001137
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 00:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697009363; x=1728545363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0bDVhhRFjtCy3bbgG+aChsC8tbsXgtOqUXfZpFIGH94=;
  b=bl2tolytwYuYNdF93z/U7VwKWxOwkANXRMe3uZ2b1jbEFGVZej/wo1DK
   EeH8R8IFGarKX4tmDQCxwQkcyKBTZ5c1r1wP+AWjLgInG2M7ZovjtHxlV
   wRwQlkFpL61e7ocpWVQVX96haybcc2dA/wTilLejK6Ao1l7zTgKmUOKsr
   Tu0sD6/8MHqUtsNOLL4DS5g49r5JDEvMCdgh2MNzZQAl0L6GvLuB+zo4H
   9y8nbqdZwKsgf72/hQmu/47DzbgI3ht4/eymQn0NSI45WAyrIpR4IVqot
   r5M/7ngvNDM75EFBFXXvFh7gvcqJlGnn3urdAwo6qvS5b1XqzA9JRs7LA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="3192019"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="3192019"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747352246"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="747352246"
Received: from wprelogx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.56.229])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:29:19 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-kbuild@vger.kernel.org, jani.nikula@intel.com,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 2/2] drm/i915: enable W=1 warnings by default
Date:   Wed, 11 Oct 2023 10:29:04 +0300
Message-Id: <69a812273091b6535ddc7f9346289d71bb30f43d.1697009258.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697009258.git.jani.nikula@intel.com>
References: <cover.1697009258.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We enable a bunch more compiler warnings than the kernel
defaults. However, they've drifted to become a unique set of warnings,
and have increasingly fallen behind from the W=1 set.

Align with the W=1 warnings from scripts/Makefile.extrawarn for clarity,
by copy-pasting them with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it
easier to compare in the future.

Some of the -Wextra warnings do need to be disabled, just like in
Makefile.extrawarn, but take care to not disable them for W=2 or W=3
builds, depending on the warning.

v2: Add back some -Wextra warning disables (Nathan)

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/Makefile | 42 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 623f81217442..94f84befa38f 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -3,22 +3,34 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-# Add a set of useful warning flags and enable -Werror for CI to prevent
-# trivial mistakes from creeping in. We have to do this piecemeal as we reject
-# any patch that isn't warning clean, so turning on -Wextra (or W=1) we
-# need to filter out dubious warnings.  Still it is our interest
-# to keep running locally with W=1 C=1 until we are completely clean.
-#
-# Note the danger in using -Wextra is that when CI updates gcc we
-# will most likely get a sudden build breakage... Hopefully we will fix
-# new warnings before CI updates!
-subdir-ccflags-y := -Wextra
-subdir-ccflags-y += -Wno-unused-parameter
-subdir-ccflags-y += -Wno-type-limits
-subdir-ccflags-y += -Wno-missing-field-initializers
-subdir-ccflags-y += -Wno-sign-compare
-subdir-ccflags-y += -Wno-shift-negative-value
+# Unconditionally enable W=1 warnings locally
+# --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
+subdir-ccflags-y += -Wextra -Wunused -Wno-unused-parameter
+subdir-ccflags-y += -Wmissing-declarations
+subdir-ccflags-y += $(call cc-option, -Wrestrict)
+subdir-ccflags-y += -Wmissing-format-attribute
+subdir-ccflags-y += -Wmissing-prototypes
+subdir-ccflags-y += -Wold-style-definition
+subdir-ccflags-y += -Wmissing-include-dirs
 subdir-ccflags-y += $(call cc-option, -Wunused-but-set-variable)
+subdir-ccflags-y += $(call cc-option, -Wunused-const-variable)
+subdir-ccflags-y += $(call cc-option, -Wpacked-not-aligned)
+subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
+subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
+subdir-ccflags-y += $(call cc-option, -Wstringop-overflow)
+subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
+# The following turn off the warnings enabled by -Wextra
+ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
+KBUILD_CFLAGS += -Wno-missing-field-initializers
+KBUILD_CFLAGS += -Wno-type-limits
+KBUILD_CFLAGS += -Wno-shift-negative-value
+endif
+ifeq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
+KBUILD_CFLAGS += -Wno-sign-compare
+endif
+# --- end copy-paste
+
+# Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
 # Fine grained warnings disable
-- 
2.39.2

