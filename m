Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B4B1DD382
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 18:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgEUQ5T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 12:57:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:46206 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730138AbgEUQ5R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 12:57:17 -0400
IronPort-SDR: uaOvOovUZCMvmsQdgb0QkQDSFZUxIow/3EtzWjx6JKIpE9Vy484na15tN8dcBuv6aVK7eb/Unw
 PtZhEeW+KbMQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2020 09:57:16 -0700
IronPort-SDR: Zw0HlnVb2QXZFYtGqKuEgUBIy0YtUb+Hn9kY1fGHVDXq6bxN8QeBgr2Texd/QYSXXUu4PHMexH
 gZE6NC5W2mFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,418,1583222400"; 
   d="scan'208";a="309094725"
Received: from kcaccard-mobl.amr.corp.intel.com (HELO kcaccard-mobl1.jf.intel.com) ([10.212.147.236])
  by FMSMGA003.fm.intel.com with ESMTP; 21 May 2020 09:57:14 -0700
From:   Kristen Carlson Accardi <kristen@linux.intel.com>
To:     keescook@chromium.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>
Cc:     arjan@linux.intel.com, linux-kernel@vger.kernel.org,
        kernel-hardening@lists.openwall.com, rick.p.edgecombe@intel.com,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 4/9] x86: Makefile: Add build and config option for CONFIG_FG_KASLR
Date:   Thu, 21 May 2020 09:56:35 -0700
Message-Id: <20200521165641.15940-5-kristen@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200521165641.15940-1-kristen@linux.intel.com>
References: <20200521165641.15940-1-kristen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Allow user to select CONFIG_FG_KASLR if dependencies are met. Change
the make file to build with -ffunction-sections if CONFIG_FG_KASLR

Signed-off-by: Kristen Carlson Accardi <kristen@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Tested-by: Tony Luck <tony.luck@intel.com>
---
 Makefile         |  4 ++++
 arch/x86/Kconfig | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Makefile b/Makefile
index 04f5662ae61a..28e515baa824 100644
--- a/Makefile
+++ b/Makefile
@@ -862,6 +862,10 @@ ifdef CONFIG_LIVEPATCH
 KBUILD_CFLAGS += $(call cc-option, -flive-patching=inline-clone)
 endif
 
+ifdef CONFIG_FG_KASLR
+KBUILD_CFLAGS += -ffunction-sections
+endif
+
 # arch Makefile may override CC so keep this after arch Makefile is included
 NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2d3f963fd6f1..50e83ea57d70 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2183,6 +2183,19 @@ config RANDOMIZE_BASE
 
 	  If unsure, say Y.
 
+config FG_KASLR
+	bool "Function Granular Kernel Address Space Layout Randomization"
+	depends on $(cc-option, -ffunction-sections)
+	depends on RANDOMIZE_BASE && X86_64
+	help
+	  This option improves the randomness of the kernel text
+	  over basic Kernel Address Space Layout Randomization (KASLR)
+	  by reordering the kernel text at boot time. This feature
+	  uses information generated at compile time to re-layout the
+	  kernel text section at boot time at function level granularity.
+
+	  If unsure, say N.
+
 # Relocation on x86 needs some additional build support
 config X86_NEED_RELOCS
 	def_bool y
-- 
2.20.1

