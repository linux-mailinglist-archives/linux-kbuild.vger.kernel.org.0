Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF29375039
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 May 2021 09:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbhEFHgD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 May 2021 03:36:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:34295 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233434AbhEFHgC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 May 2021 03:36:02 -0400
IronPort-SDR: HnCSxWkO+Jw3W+lpIabYVhrVh+r5xZDExUJAedDFnIEw93OuyIGLki8+7s114ZNfVvqHe+LVOO
 JBopI9BaZ6HQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="177962423"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="177962423"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 00:35:02 -0700
IronPort-SDR: K/awh/hcHMJgDOX9e1uSo8IJdPhOPsljWaFL0YJ3VPDe8e80hfQ8r+jS7koHQsB/ezZUYy17uY
 AcJBa0Mhf+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; 
   d="scan'208";a="464601070"
Received: from shbuild999.sh.intel.com ([10.239.147.94])
  by fmsmga002.fm.intel.com with ESMTP; 06 May 2021 00:35:00 -0700
From:   Feng Tang <feng.tang@intel.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Feng Tang <feng.tang@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andi Kleen <ak@linux.intel.com>
Subject: [PATCH] Makefile: extend 32B aligned debug option to 64B aligned
Date:   Thu,  6 May 2021 15:34:59 +0800
Message-Id: <1620286499-40999-1-git-send-email-feng.tang@intel.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

commit 09c60546f04f ("./Makefile: add debug option to enable
function aligned on 32 bytes") was introduced to help debugging
strange kernel performance changes caused by code alignment
change.

Recently we found 2 similar cases [1][2] caused by code-alignment
changes, which can only be identified by forcing 64 bytes aligned
for all functions.

Originally, 32 bytes was used mainly for not wasting too much
text space, but this option is only for debug anyway where text
space is not a big concern. So extend the alignment to 64 bytes
to cover more similar cases.

[1].https://lore.kernel.org/lkml/20210427090013.GG32408@xsang-OptiPlex-9020/
[2].https://lore.kernel.org/lkml/20210420030837.GB31773@xsang-OptiPlex-9020/
Signed-off-by: Feng Tang <feng.tang@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andi Kleen <ak@linux.intel.com>
---
 Makefile          | 4 ++--
 lib/Kconfig.debug | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 72af8e4..a9f6715 100644
--- a/Makefile
+++ b/Makefile
@@ -958,8 +958,8 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
 
-ifdef CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_32B
-KBUILD_CFLAGS += -falign-functions=32
+ifdef CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B
+KBUILD_CFLAGS += -falign-functions=64
 endif
 
 # arch Makefile may override CC so keep this after arch Makefile is included
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 678c1396..6ce26b8 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -400,8 +400,8 @@ config SECTION_MISMATCH_WARN_ONLY
 
 	  If unsure, say Y.
 
-config DEBUG_FORCE_FUNCTION_ALIGN_32B
-	bool "Force all function address 32B aligned" if EXPERT
+config DEBUG_FORCE_FUNCTION_ALIGN_64B
+	bool "Force all function address 64B aligned" if EXPERT
 	help
 	  There are cases that a commit from one domain changes the function
 	  address alignment of other domains, and cause magic performance
-- 
2.7.4

