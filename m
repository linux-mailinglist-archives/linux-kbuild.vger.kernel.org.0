Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A876326BE5
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 06:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhB0F5Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 00:57:16 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:45246 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhB0F5P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 00:57:15 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 11R5u3gx010766;
        Sat, 27 Feb 2021 14:56:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 11R5u3gx010766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614405364;
        bh=/q1Avax0ounMnO0YqBoMtCz7O0Hq5Yo1VY1sj8TE76w=;
        h=From:To:Cc:Subject:Date:From;
        b=oji/EvEK8zD65htnWnKXSLjxEQFnsMzalHV0AIUCEuQLzn9vdcIOlGBfmTuqyoMCC
         /QpTFa6ccDaoeVed5HiyssjbtKBvAQqIiYH7YyJilAy1tWWhkVqO0Oxhw8Yut6GDgA
         plfRQCaGkXzGoi6/+zrMQcb0YLkcpJXyjfZRxnzFcXtJ4kxIlF4Laae89XjxpVSQwH
         mnYmFlOHzc5theBAyzIANeJ9jMLUQKcyKjk0Kdh/OffG+bvkTm2yWHyVI9Rs3kKGUA
         VG58a85FoAGQqOhFh8sXAE6WqjybH094qLI7T+PTjOCNw5P4jlehXgc2FZDV9EPb67
         0gj987T4pI4vg==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>
Subject: [PATCH] nios2: add arch/nios2/Kbuild
Date:   Sat, 27 Feb 2021 14:56:00 +0900
Message-Id: <20210227055600.4075333-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use the standard obj-y form to specify the sub-directories under
arch/nios2/. No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/nios2/Kbuild   | 2 ++
 arch/nios2/Makefile | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)
 create mode 100644 arch/nios2/Kbuild

diff --git a/arch/nios2/Kbuild b/arch/nios2/Kbuild
new file mode 100644
index 000000000000..98b454beae92
--- /dev/null
+++ b/arch/nios2/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += kernel/ mm/ platform/
diff --git a/arch/nios2/Makefile b/arch/nios2/Makefile
index 52c03e60b114..f06ac8c6c7ea 100644
--- a/arch/nios2/Makefile
+++ b/arch/nios2/Makefile
@@ -40,8 +40,7 @@ KBUILD_CFLAGS += -G 0
 
 head-y		:= arch/nios2/kernel/head.o
 libs-y		+= arch/nios2/lib/ $(LIBGCC)
-core-y		+= arch/nios2/kernel/ arch/nios2/mm/
-core-y		+= arch/nios2/platform/
+core-y		+= arch/nios2/
 
 INSTALL_PATH ?= /tftpboot
 nios2-boot := arch/$(ARCH)/boot
-- 
2.27.0

