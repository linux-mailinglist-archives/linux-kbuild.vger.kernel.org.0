Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC627160477
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2020 16:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgBPPUP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Feb 2020 10:20:15 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:30575 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgBPPUO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 10:20:14 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 01GFJfJi012792;
        Mon, 17 Feb 2020 00:19:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 01GFJfJi012792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581866382;
        bh=KnP9tgxSHUQAMQklRwAiuVTY8xsRWN3iDCIditBPlOM=;
        h=From:To:Cc:Subject:Date:From;
        b=VSSaRQQnCyhooGy+l+0rFBVdYPtZmpJIVhDfCGS8K+CPuBE4zPviJ2iJplC/K1/nj
         TEEQ7Tu0LcnQq3gb7E6rtGDLHWtHlpEluwsChPynxuK8fInLqnapNX3ZQf/l77rpZb
         RmPzicA/+bOqAKDycAMj8v5E1YW97Qkmlrv0xi7cipMklS7k7441kgjtV4VBf3CUn1
         Bcy8Os4cJwoRDr3Fo4mQTrJyYqhYsZjAaNWHk06tXIfNpdLXLZ4fn1pDaE7tYTta+a
         1WQLpzpajkmYdho4B2AXUNlSRRLqqeRngfLWkNe41kHtCpTT3Lt1RYGSY3qYamvsL4
         /XH3UhazFSn0A==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com
Subject: [PATCH] kbuild: remove cc-option switch from -Wframe-larger-than=
Date:   Mon, 17 Feb 2020 00:19:36 +0900
Message-Id: <20200216151936.23778-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This CONFIG option was added by commit 35bb5b1e0e84 ("Add option to
enable -Wframe-larger-than= on gcc 4.4"). At that time, the cc-option
check was needed.

According to Documentation/process/changes.rst, the current minimal
supported version of GCC is 4.6, so you can assume GCC supports it.
Clang supports it as well.

Remove the cc-option switch and redundant comments.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile          | 2 +-
 lib/Kconfig.debug | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 84b71845c43f..8f15926b83bb 100644
--- a/Makefile
+++ b/Makefile
@@ -728,7 +728,7 @@ KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
 endif
 
 ifneq ($(CONFIG_FRAME_WARN),0)
-KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
+KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
 endif
 
 stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 69def4a9df00..fb6b93ffdf77 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -266,7 +266,7 @@ config ENABLE_MUST_CHECK
 	  attribute warn_unused_result" messages.
 
 config FRAME_WARN
-	int "Warn for stack frames larger than (needs gcc 4.4)"
+	int "Warn for stack frames larger than"
 	range 0 8192
 	default 2048 if GCC_PLUGIN_LATENT_ENTROPY
 	default 1280 if (!64BIT && PARISC)
@@ -276,7 +276,6 @@ config FRAME_WARN
 	  Tell gcc to warn at build time for stack frames larger than this.
 	  Setting this too low will cause a lot of warnings.
 	  Setting it to 0 disables the warning.
-	  Requires gcc 4.4
 
 config STRIP_ASM_SYMS
 	bool "Strip assembler-generated symbols during link"
-- 
2.17.1

