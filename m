Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEB466DA6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 11:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbjAQKAQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 05:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbjAQKAP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 05:00:15 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16752BF08;
        Tue, 17 Jan 2023 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673949614; x=1705485614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JSWsjIfI0Y9DNcO5X71JaZhLGFbo97YU0yZpi4rSCnk=;
  b=OIr6t4QdzWkOGV+3S/M1paZyVfCAceWiEbDPQNxUiceQQ6h1JleZkbXd
   AIIC8soli1/EobMQ6O7I6Vj5zqjRJt/HCNhLjTHwxnspnplZbAKYcKj7M
   8z7ZSGiKOHBfGeIifLtHYNomA/w8HbSWbVTHNYoezfwL6bGaWt7T4bfps
   LG2EL5wa5szqBvMcED+Glpvx/szMZE4ACDThJjWPw37tMYzCOtmLvEf56
   HzXrd9aj+PjXsHjw21E/gBCX0Psd+ZFpk/qaDBT+cC+gFa5dlmlLuLrHp
   LoPe7pNFN4w+txZ9rNb5Hr1lIq9/0tCHik92cxg1HHhYxYgpxk3+zre7+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325933236"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="325933236"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904595585"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="904595585"
Received: from dmcmanus.ger.corp.intel.com (HELO localhost) ([10.252.27.166])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:12 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     jani.nikula@intel.com
Subject: [PATCH 3/6] docs/kbuild/makefiles: throw out the local table of contents
Date:   Tue, 17 Jan 2023 11:59:43 +0200
Message-Id: <20230117095946.2042832-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117095946.2042832-1-jani.nikula@intel.com>
References: <20230117095946.2042832-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is not something that should be manually updated.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/kbuild/makefiles.rst | 61 ------------------------------
 1 file changed, 61 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 014dd97181dd..12cf92320e46 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -4,67 +4,6 @@ Linux Kernel Makefiles
 
 This document describes the Linux kernel Makefiles.
 
-.. Table of Contents
-
-	=== 1 Overview
-	=== 2 Who does what
-	=== 3 The kbuild files
-	   --- 3.1 Goal definitions
-	   --- 3.2 Built-in object goals - obj-y
-	   --- 3.3 Loadable module goals - obj-m
-	   --- 3.4 <deleted>
-	   --- 3.5 Library file goals - lib-y
-	   --- 3.6 Descending down in directories
-	   --- 3.7 Non-builtin vmlinux targets - extra-y
-	   --- 3.8 Always built goals - always-y
-	   --- 3.9 Compilation flags
-	   --- 3.10 Dependency tracking
-	   --- 3.11 Custom Rules
-	   --- 3.12 Command change detection
-	   --- 3.13 $(CC) support functions
-	   --- 3.14 $(LD) support functions
-	   --- 3.15 Script Invocation
-
-	=== 4 Host Program support
-	   --- 4.1 Simple Host Program
-	   --- 4.2 Composite Host Programs
-	   --- 4.3 Using C++ for host programs
-	   --- 4.4 Using Rust for host programs
-	   --- 4.5 Controlling compiler options for host programs
-	   --- 4.6 When host programs are actually built
-
-	=== 5 Userspace Program support
-	   --- 5.1 Simple Userspace Program
-	   --- 5.2 Composite Userspace Programs
-	   --- 5.3 Controlling compiler options for userspace programs
-	   --- 5.4 When userspace programs are actually built
-
-	=== 6 Kbuild clean infrastructure
-
-	=== 7 Architecture Makefiles
-	   --- 7.1 Set variables to tweak the build to the architecture
-	   --- 7.2 Add prerequisites to archheaders
-	   --- 7.3 Add prerequisites to archprepare
-	   --- 7.4 List directories to visit when descending
-	   --- 7.5 Architecture-specific boot images
-	   --- 7.6 Building non-kbuild targets
-	   --- 7.7 Commands useful for building a boot image
-	   --- 7.8 <deleted>
-	   --- 7.9 Preprocessing linker scripts
-	   --- 7.10 Generic header files
-	   --- 7.11 Post-link pass
-
-	=== 8 Kbuild syntax for exported headers
-		--- 8.1 no-export-headers
-		--- 8.2 generic-y
-		--- 8.3 generated-y
-		--- 8.4 mandatory-y
-
-	=== 9 Kbuild Variables
-	=== 10 Makefile language
-	=== 11 Credits
-	=== 12 TODO
-
 1 Overview
 ==========
 
-- 
2.34.1

