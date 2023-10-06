Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD9C7BB7C5
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 14:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjJFMfN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 08:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbjJFMfN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 08:35:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CDCCA
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 05:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696595711; x=1728131711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q4EzDI6ZeA5w3ss3pfzuzwJk0z1vBLt7SaDPCVeKFQY=;
  b=HB95uX9bfki8H6SqaxgSpQGlWmxXypJ3lVJ1MgpU9pgBXfjrybRf2QIB
   hmnMeZMjVZ+RE32xKk0odshPIfGx+/8AaAcOrlFWBf+TtIh0kjHlwvMW5
   cMTVzESi6VtOmzqqTBda5x5DoyAHYZ/iNHpZHKNzQ3UYTf8eh49dr2J5n
   wqJTA3a5XneJH1QgMiyMFVRxeYvPMaD5MyzL+ChVDIjnJqZRxHdEoYv4Y
   JUUWSOeJLP98Zmb3humfcJioCEqOqMvjQdU8DfnLPJ+urjKo+gBDDpZN4
   I42Xqd7H1CaQ2Yxce7kaQ0MDzrw170AVLvYuXeo2+rXmPfB9lv/8N3H/X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386564239"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="386564239"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875930228"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="875930228"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.41.239])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:35:08 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-kbuild@vger.kernel.org, jani.nikula@intel.com,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] drm/i915: enable W=1 warnings by default
Date:   Fri,  6 Oct 2023 15:34:47 +0300
Message-Id: <f50c8ea0e63615aea28fe7f6049703e1d28ba7eb.1696595500.git.jani.nikula@intel.com>
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

We enable a bunch more compiler warnings than the kernel
defaults. However, they've drifted to become a unique set of warnings,
and have increasingly fallen behind from the W=1 set.

Align with the W=1 warnings from scripts/Makefile.extrawarn for clarity,
by copy-pasting them with s/KBUILD_CFLAGS/subdir-ccflags-y/ to make it
easier to compare in the future.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

An alternative or future option would be to have Makefile.extrawarn
assign W=1 etc. flags to intermediate variables, say KBUILD_CFLAGS_W1,
like this:

KBUILD_CFLAGS_W1 += -Wextra -Wunused -Wno-unused-parameter
etc...

export KBUILD_CFLAGS_W1

ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)

KBUILD_CFLAGS += $(KBUILD_CFLAGS_W1)

else
etc...

and then drivers and subsystems could simply use:

subdir-ccflags-y += $(KBUILD_CFLAGS_W1)

to enable and remain up-to-date with W=1 warnings.
---
 drivers/gpu/drm/i915/Makefile | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 623f81217442..0485157054fc 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -3,22 +3,25 @@
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
+# --- end copy-paste
+
+# Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_I915_WERROR) += -Werror
 
 # Fine grained warnings disable
-- 
2.39.2

