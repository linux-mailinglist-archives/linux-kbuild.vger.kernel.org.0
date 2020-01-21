Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4CC8143A34
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 11:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbgAUKB4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 05:01:56 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:46098 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbgAUKB4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 05:01:56 -0500
Received: from ramsan ([84.195.182.253])
        by albert.telenet-ops.be with bizsmtp
        id sy1r210095USYZQ06y1rgt; Tue, 21 Jan 2020 11:01:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1itqM3-0000P5-D9; Tue, 21 Jan 2020 11:01:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1itqM3-0008FN-Ar; Tue, 21 Jan 2020 11:01:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Eric Anholt <eric@anholt.net>, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: bcm2835: Drop select of nonexistent HAVE_ARM_ARCH_TIMER
Date:   Tue, 21 Jan 2020 11:01:50 +0100
Message-Id: <20200121100150.31660-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Unlike on arm32, the HAVE_ARM_ARCH_TIMER config symbol does not exist on
arm64.

Note that the toplevel ARM64 symbol always selects ARM_ARCH_TIMER, so
support for it is always included.

Fixes: 628d30d1ccb897fe ("arm64: Add platform selection for BCM2835.")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Manually reverting f072181e6403b0fe ("kconfig: drop the ""trying to assign
nonexistent symbol" warning") does not help.

 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b2b504ea6fd69495..ad4335122e70a3b7 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -39,7 +39,6 @@ config ARCH_BCM2835
 	select ARM_AMBA
 	select ARM_GIC
 	select ARM_TIMER_SP804
-	select HAVE_ARM_ARCH_TIMER
 	help
 	  This enables support for the Broadcom BCM2837 and BCM2711 SoC.
 	  These SoCs are used in the Raspberry Pi 3 and 4 devices.
-- 
2.17.1

