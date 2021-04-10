Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB46235AE5E
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 16:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234795AbhDJOcd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 10:32:33 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:56005 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbhDJOcd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 10:32:33 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13AEW0jD005753;
        Sat, 10 Apr 2021 23:32:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13AEW0jD005753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618065121;
        bh=VJxXXj18738WjpzoZlOMWauH9bIfrZ/uTuRE8xddkMY=;
        h=From:To:Cc:Subject:Date:From;
        b=bMlC5Z38wdx8gdEuZcAu9eRA9KF3wkzoqFV2T8IiRrl1XuKNCYR6MOSURKRdH7vSX
         NOQnR6oEphH7g1eeXCyDe5n1MKjByhsUxhcAmFqm42TQqgRDb/GDf9q/yYij9sAhFy
         z+CChYBKigh6rBRpDWPFYWEqcZT8v0nhuV7zrFQG30MPgdqX+5eAbgXbkK2LzP2bu8
         l/c6i/Ys4gPSXPKvCAjn3C/hfomF34xywhBU/1H+kknLbJOJ+ogKiDQp/6nQBYFOrD
         wht75UD96mXySyr9dxK6wGtN/FtMQJXycnLuI6OA8JVeJKZGgwwdJKy4dAXwg/S8h7
         C7j1eK+a7zVpg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: use /boot/config-* etc. as DEFCONFIG_LIST only for native build
Date:   Sat, 10 Apr 2021 23:31:58 +0900
Message-Id: <20210410143158.167602-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When the .config file is missing, 'make config', 'make menuconfig', etc.
uses a file listed in DEFCONFIG_LIST as base configuration.

Ususally, /boot/config-$(uname -r) exists, and is used as default.

However, when you are cross-compiling the kernel, it does not make
sense to use /boot/config-* from the build host. It should default
to arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG).

UML previously did not use DEFCONFIG_LIST at all, but it should be
able to use arch/um/configs/$(KBUILD_DEFCONFIG) as a base config file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 5 +++++
 scripts/kconfig/Makefile | 8 ++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f1093b972708..697eaf6c550e 100644
--- a/Makefile
+++ b/Makefile
@@ -393,6 +393,11 @@ ifeq ($(ARCH),sh64)
        SRCARCH := sh
 endif
 
+export cross_compiling :=
+ifneq ($(SRCARCH),$(SUBARCH))
+cross_compiling := 1
+endif
+
 KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 46f2465177f0..1d1a7f83ee8d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -18,14 +18,14 @@ silent := -s
 endif
 
 export KCONFIG_DEFCONFIG_LIST :=
-ifneq ($(SRCARCH),um)
+ifndef cross_compiling
 kernel-release := $(shell uname -r)
-KCONFIG_DEFCONFIG_LIST := \
+KCONFIG_DEFCONFIG_LIST += \
 	/lib/modules/$(kernel-release)/.config \
 	/etc/kernel-config \
-	/boot/config-$(kernel-release) \
-	arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)
+	/boot/config-$(kernel-release)
 endif
+KCONFIG_DEFCONFIG_LIST += arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)
 
 # We need this, in case the user has it in its environment
 unexport CONFIG_
-- 
2.27.0

