Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47B7D152C8
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2019 19:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfEFRbL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 13:31:11 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41344 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfEFRbL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 13:31:11 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x46HSZCi022951;
        Tue, 7 May 2019 02:28:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x46HSZCi022951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557163716;
        bh=rLUuRSyxYbwt0UVs9QzxFKJlZ9BtLeDXvLxtcsNawRY=;
        h=From:To:Cc:Subject:Date:From;
        b=JKXYbZcbzekTUoL6mu+jZH4TU3MaGysbzm7unONRIccBJk6/UgXh6Bh9aTWwiW+Ky
         A2ptFGi+J9bV+RT6ywYeX1Qnt4A6lFmUkq00Nd5GMuTOaW2tNCVATIqA4Fq/HRXLYr
         WU81SQYU6DOjxjrRMurBKpCpPe/E/INWCawblX04Pp9cEBtDKms2OUowjOq9pQSTQC
         GFNUMVWSuzcZ8Ufn0cOstMMRyrcrn34nrEuVi3uWWQ5qtTUX1Xyls6gAdGc4C672QN
         4zLbnoRXV6315fHrM4TXSMkwwXikidN8W/U5/s7ksKIdmrtuC6xMxxiKny2sqkCqN3
         eyh2vCnHuXi3w==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Lee Jones <lee.jones@linaro.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH] Remove MODULE_ALIAS() calls that take undefined macro
Date:   Tue,  7 May 2019 02:28:17 +0900
Message-Id: <1557163697-17882-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These files do not define (USBHS_)DRIVER_NAME. Yet, they can be
successfully compiled because they are never built as a module by
anyone, i.e, the MODULE_ALIAS() calls are always no-op.

A problem showed up when a patch "moduleparam: Save information about
built-in modules in separate file" is applied. With this new feature,
MODULE_*() are populated even if the callers are built-in.

To avoid the build errors, the lines referencing to the undefined
macro must be removed.

The complete fix is to remove all MODULE_* and #include <linux/module.h>
like many "make ... explicitly non-modular" commits did.

For now, I am touching the offending lines.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will insert this commit before
"moduleparam: Save information about built-in modules in separate file"


 arch/arm/plat-omap/dma.c          | 1 -
 drivers/clocksource/timer-ti-dm.c | 1 -
 drivers/mfd/omap-usb-tll.c        | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index d4012d6..5ca4c5f 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -1449,7 +1449,6 @@ static void __exit omap_system_dma_exit(void)
 
 MODULE_DESCRIPTION("OMAP SYSTEM DMA DRIVER");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("Texas Instruments Inc");
 
 /*
diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
index 3352da6..2b7cee81 100644
--- a/drivers/clocksource/timer-ti-dm.c
+++ b/drivers/clocksource/timer-ti-dm.c
@@ -998,5 +998,4 @@ module_platform_driver(omap_dm_timer_driver);
 
 MODULE_DESCRIPTION("OMAP Dual-Mode Timer Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRIVER_NAME);
 MODULE_AUTHOR("Texas Instruments Inc");
diff --git a/drivers/mfd/omap-usb-tll.c b/drivers/mfd/omap-usb-tll.c
index 446713d..93177d8 100644
--- a/drivers/mfd/omap-usb-tll.c
+++ b/drivers/mfd/omap-usb-tll.c
@@ -459,7 +459,6 @@ EXPORT_SYMBOL_GPL(omap_tll_disable);
 
 MODULE_AUTHOR("Keshava Munegowda <keshava_mgowda@ti.com>");
 MODULE_AUTHOR("Roger Quadros <rogerq@ti.com>");
-MODULE_ALIAS("platform:" USBHS_DRIVER_NAME);
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("usb tll driver for TI OMAP EHCI and OHCI controllers");
 
-- 
2.7.4

