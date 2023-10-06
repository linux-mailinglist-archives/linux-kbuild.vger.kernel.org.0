Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C24E7BB7C0
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Oct 2023 14:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjJFMfC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Oct 2023 08:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232209AbjJFMfC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Oct 2023 08:35:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54A6CA
        for <linux-kbuild@vger.kernel.org>; Fri,  6 Oct 2023 05:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696595700; x=1728131700;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AD04cZYr4rjky80KsYXJrJcZW3BNsdCsazM3lhGosKE=;
  b=J4vX2GzswnfIw1uHrQIvO6fcwD4R7Pin9XP/+IZuSTfoRCgNCDOfP2v5
   PPKgm7u3u1JTw6me4jABV4Efapu867dqFywFGi9FTRs91jzlexuRE5l7W
   FN2RxpzkQ7QHmZFy8Ji+c5FkzhEC+n3S2NvhFar154JEe/xL6OqoRLoJW
   9NmK79PocQ7Xc1HzVuA/r/qvFRPi9lwBBmd0WlAuNyEni2EtEC9Kb/2vA
   ZRvsmtFvvEGCd4/JkjfEa0tzblPyP27L9qR+bxajalABl2MRfIxzyod6J
   jwbb7EyFHrcpqzKltaMSbwYPhIwRckacliO+sJawL3p875gFdnP4EAynY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386564210"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="386564210"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="875930207"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="875930207"
Received: from lvroom-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.41.239])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 05:34:55 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-kbuild@vger.kernel.org, jani.nikula@intel.com,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/2] drm/i915: align with W=1 warnings
Date:   Fri,  6 Oct 2023 15:34:45 +0300
Message-Id: <cover.1696595500.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Update i915 extra warnings to align with W=1 warnings.

Cc'ing some folks who have contributed to i915 warnings in the past. I'm
only running gcc 12 locally, so I may not hit all issues that other gcc
or clang versions might hit.

BR,
Jani.


Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>

Jani Nikula (2):
  drm/i915: drop -Wall and related disables from cflags as redundant
  drm/i915: enable W=1 warnings by default

 drivers/gpu/drm/i915/Makefile | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

-- 
2.39.2

