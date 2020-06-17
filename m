Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D441C1FC402
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2020 04:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgFQCJK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jun 2020 22:09:10 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:45317 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgFQCJK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 22:09:10 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 05H28kuZ011038;
        Wed, 17 Jun 2020 11:08:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 05H28kuZ011038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592359726;
        bh=YsC2dizDDFIdXocNJAZgxxZbCsXA6PM27sduaRcNgvQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Et+C+KBu6ku09Pc8YHyO1pgYEv8qgJbt0wRgw/0nj77iLHQyBnfsvuKI4aFkh0aOu
         XGJfqJXU2vuSRl12SkscHPrltMxlioTzRWjP1PkxS0c+XGoKWZJ12cN5tYF5hhhriw
         EZ5TgWClkScqneJPZcS012xjJj0VdK7UpRGHRJytVgQXsGEoLhQKrwEawQ/X1X2Bek
         jtCdSIPTs1eT14C7U9G2efw5JUJECb6szc7Hey95KXC5u/sBNdJ0QVEDmmfDlJdJGR
         nJsS0Lqumqnn1FqZ2biHCmDd6bsRM9xz5MKaSHNlW/xZt9z47O1QWOVzOBWNDa82g8
         LLoVNkfEk+xiw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] samples: watch_queue: build sample program for target architecture
Date:   Wed, 17 Jun 2020 11:08:38 +0900
Message-Id: <20200617020838.22134-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This userspace program includes UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample program should be built for
the target as well. Kbuild now supports 'userprogs' for that.

I also guarded the CONFIG option by 'depends on CC_CAN_LINK' because
$(CC) may not provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Kconfig              |  2 +-
 samples/watch_queue/Makefile | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index f3ac549a53b0..0ed6e4d71d87 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -211,7 +211,7 @@ config SAMPLE_WATCHDOG
 
 config SAMPLE_WATCH_QUEUE
 	bool "Build example /dev/watch_queue notification consumer"
-	depends on HEADERS_INSTALL
+	depends on CC_CAN_LINK && HEADERS_INSTALL
 	help
 	  Build example userspace program to use the new mount_notify(),
 	  sb_notify() syscalls and the KEYCTL_WATCH_KEY keyctl() function.
diff --git a/samples/watch_queue/Makefile b/samples/watch_queue/Makefile
index 8511fb6c53d2..792b22f593cf 100644
--- a/samples/watch_queue/Makefile
+++ b/samples/watch_queue/Makefile
@@ -1,7 +1,5 @@
-# List of programs to build
-hostprogs := watch_test
+# SPDX-License-Identifier: GPL-2.0-only
+userprogs := watch_test
+always-y := $(userprogs)
 
-# Tell kbuild to always build the programs
-always-y := $(hostprogs)
-
-HOSTCFLAGS_watch_test.o += -I$(objtree)/usr/include
+userccflags += -I usr/include
-- 
2.25.1

