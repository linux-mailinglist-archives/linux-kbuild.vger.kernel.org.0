Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B66107BCFF5
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Oct 2023 22:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344508AbjJHUCT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 8 Oct 2023 16:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344421AbjJHUCR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Oct 2023 16:02:17 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063D9AC
        for <linux-kbuild@vger.kernel.org>; Sun,  8 Oct 2023 13:02:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpZyN-0001S4-Rx; Sun, 08 Oct 2023 22:01:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpZyL-000EzB-BW; Sun, 08 Oct 2023 22:01:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qpZyL-00Bezz-2C; Sun, 08 Oct 2023 22:01:53 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     David Woodhouse <David.Woodhouse@intel.com>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mtd@lists.infradead.org, kernel@pengutronix.de,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with __refdata to prevent section mismatch warning
Date:   Sun,  8 Oct 2023 22:01:24 +0200
Message-Id: <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1681; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HCTLmKUM6J3s+U8+meq2ryRrLbcxRn94rcRCl9GrZF4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlIwp5T8JGhAN448mWVi6r0ql9MAkFkY7cHU62g Y+eHndKpviJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSMKeQAKCRCPgPtYfRL+ ToeyB/9QNdWwPK2QFim3ThZYyJ4M+3DAU9OP7Wn96T5Rc68p/BsG0o6Co8IQG8J3PHulnFVrmv1 2lfvDiAQFjGX8tsDUGywbAvL7iKLvCVGhtjNEVYHNp5fchQ2rvdzOemgn9BQmmLaiWysMsYKRjs cKKy5h4fPWElhre0NZ64Wsl1O3ybsZTMJPqVru4OJHbJmaSbkinIoHdMb1Neefph/PHSP3myx3o woq3GoTMA4NpqprTsJEQfYrZDAPJGCSKrhMvPlUZx253H95gKjsF+IrVFauhspwb/sIS19wgYei NiMoeV06pKGco1cAmOg3+tw+R+IZ2bAsSGnE8L7E3VvaATrb
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent a section mismatch warning with
CONFIG_MTD_NAND_TXX9NDFMC=m:

	WARNING: modpost: drivers/mtd/nand/raw/txx9ndfmc: section mismatch in reference: txx9ndfmc_driver+0x4 (section: .data) -> txx9ndfmc_remove (section: .exit.text)

Fixes: 64fb65baffa5 ("[MTD] TXx9 SoC NAND Flash Memory Controller driver")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note this warning only triggers with f177cd0c15fc ("modpost: Don't let
"driver"s reference .exit.*") that currently waits in next for the next
merge window + building with W=1.

Best regards
Uwe

 drivers/mtd/nand/raw/txx9ndfmc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9ndfmc.c
index eddcc0728a67..aff9d6f16851 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -406,7 +406,13 @@ static int txx9ndfmc_resume(struct platform_device *dev)
 #define txx9ndfmc_resume NULL
 #endif
 
-static struct platform_driver txx9ndfmc_driver = {
+/*
+ * txx9ndfmc_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver txx9ndfmc_driver __refdata = {
 	.remove		= __exit_p(txx9ndfmc_remove),
 	.resume		= txx9ndfmc_resume,
 	.driver		= {
-- 
2.40.1

