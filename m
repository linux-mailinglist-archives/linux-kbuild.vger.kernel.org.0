Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2520404684
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 09:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242958AbhIIHoC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 03:44:02 -0400
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57]:51510 "EHLO
        out30-57.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232549AbhIIHoC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 03:44:02 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UnmHPCV_1631173364;
Received: from localhost(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0UnmHPCV_1631173364)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 09 Sep 2021 15:42:51 +0800
From:   ashimida <ashimida@linux.alibaba.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net, nathan@kernel.org,
        ndesaulniers@google.com
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        ashimida <ashimida@linux.alibaba.com>
Subject: [PATCH] [RFC] kbuild: add CLANG_TRIPLE to prevent clang from compiling with wrong --target
Date:   Thu,  9 Sep 2021 15:42:43 +0800
Message-Id: <1631173363-40160-1-git-send-email-ashimida@linux.alibaba.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kernel compiled with tool chain CROSS_COMPILE=aarch64-linux-android-
will panic during the startup phase.

Clang's --target option comes from $(CROSS_COMPILE). At the time
-fstack-protector-strong is enabled, and compiled with command:
make CC=clang HOSTCC=clang ARCH=arm64 CROSS_COMPILE=aarch64-linux-android-

clang will insert code like:
   mrs     x8, TPIDR_EL0	//default value is zero
   str     x8, [sp]
   ldr     x8, [x8, #40]	//access addr 0x40

instead of the code that accesses __stack_chk_guard to get the
canary, which will cause the kernel to crash due to 0x40
address access.

This patch (from android) is used to remind the user that current
tool chain cannot be used as the "--target" of clang, the user
should specify an additional "--target" through CLANG_TRIPLE.

Signed-off-by: ashimida <ashimida@linux.alibaba.com>
---
 Makefile                 | 6 +++++-
 scripts/clang-android.sh | 4 ++++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100755 scripts/clang-android.sh

diff --git a/Makefile b/Makefile
index 61741e9..09bb314 100644
--- a/Makefile
+++ b/Makefile
@@ -586,7 +586,11 @@ CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -
 
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
-CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
+CLANG_TRIPLE    ?= $(CROSS_COMPILE)
+CLANG_FLAGS     += --target=$(notdir $(CLANG_TRIPLE:%-=%))
+ifeq ($(shell $(srctree)/scripts/clang-android.sh $(CC) $(CLANG_FLAGS)), y)
+$(error "Clang with Android --target detected. Did you specify CLANG_TRIPLE?")
+endif
 endif
 ifeq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -integrated-as
diff --git a/scripts/clang-android.sh b/scripts/clang-android.sh
new file mode 100755
index 0000000..9186c4f
--- /dev/null
+++ b/scripts/clang-android.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+$* -dM -E - </dev/null 2>&1 | grep -q __ANDROID__ && echo "y"
-- 
2.7.4

