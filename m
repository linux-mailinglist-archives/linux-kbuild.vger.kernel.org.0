Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 550D87E1404
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Nov 2023 16:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjKEPBP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Nov 2023 10:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjKEPBD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Nov 2023 10:01:03 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6ABE1
        for <linux-kbuild@vger.kernel.org>; Sun,  5 Nov 2023 07:01:01 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecR-0002zK-7T; Sun, 05 Nov 2023 16:00:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecQ-006oU6-I8; Sun, 05 Nov 2023 16:00:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecQ-00DBt3-96; Sun, 05 Nov 2023 16:00:54 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        kernel@pengutronix.de, linux-kbuild@vger.kernel.org
Subject: [PATCH 1/4] ata: pata_falcon: Stop using module_platform_driver_probe()
Date:   Sun,  5 Nov 2023 16:00:36 +0100
Message-ID: <20231105150037.3724669-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.482.g2e8e77cbac8a.dirty
In-Reply-To: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
References: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dL64nZqLToVOexXE4u3VakgfhSNbXAy85qSOQ0cPqls=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlR64WjGlxnhYnztp8K+TIWsTnrGZafoVQyoszZ tXjCKuYTV2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUeuFgAKCRCPgPtYfRL+ TtH6CACCJzneFu53xExRVTGo9ECNpRMJsYnOT/kAl7iIE99dAG6IEyLHP90Q8d1r90ZL5P/Ogti 2aEMf0BTR8h6X6Dw/zb7fQiYiUx+csJqDuYJjxvYYjXjsD1UhtFTb8QrnDHbDpzYEBJRADlT1bn 2Fu9xrkxu6GPVO+iUsx8u/WD3KqDQlkBQjH/H0hMrz8hhKfKI4SV7ZrvTCwQ5bXig4FExAs4XDS RCSgK/x2Ng0gmEuZKHFjqIfsLEc7JlITkVlxOPF/LW3IWNuQNbJw5dIVr6OjwYCF33BUL0SckNv xPnJ2O6csnU013C5oWzxTD8FH2jpDclBS6IjXEbJ3ktTSiYN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On today's platforms the benefit of platform_driver_probe() isn't that
relevant any more. It allows to drop some code after booting (or module
loading) for .probe() and discard the .remove() function completely if
the driver is built-in. This typically saves a few 100k.

The downside of platform_driver_probe() is that the driver cannot be
bound and unbound at runtime which is ancient and so slightly
complicates testing. There are also thoughts to deprecate
platform_driver_probe() because it adds some complexity in the driver
core for little gain. Also many drivers don't use it correctly. This
driver for example misses to mark the driver struct with __ref which is
needed to suppress a (W=1) modpost warning.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/ata/pata_falcon.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_falcon.c b/drivers/ata/pata_falcon.c
index 0c2ae430f5aa..9dfc2df47cf8 100644
--- a/drivers/ata/pata_falcon.c
+++ b/drivers/ata/pata_falcon.c
@@ -121,7 +121,7 @@ static struct ata_port_operations pata_falcon_ops = {
 	.set_mode	= pata_falcon_set_mode,
 };
 
-static int __init pata_falcon_init_one(struct platform_device *pdev)
+static int pata_falcon_init_one(struct platform_device *pdev)
 {
 	struct resource *base_mem_res, *ctl_mem_res;
 	struct resource *base_res, *ctl_res, *irq_res;
@@ -216,7 +216,7 @@ static int __init pata_falcon_init_one(struct platform_device *pdev)
 				 IRQF_SHARED, &pata_falcon_sht);
 }
 
-static int __exit pata_falcon_remove_one(struct platform_device *pdev)
+static int pata_falcon_remove_one(struct platform_device *pdev)
 {
 	struct ata_host *host = platform_get_drvdata(pdev);
 
@@ -226,13 +226,14 @@ static int __exit pata_falcon_remove_one(struct platform_device *pdev)
 }
 
 static struct platform_driver pata_falcon_driver = {
-	.remove = __exit_p(pata_falcon_remove_one),
+	.probe = pata_falcon_init_one,
+	.remove = pata_falcon_remove_one,
 	.driver   = {
 		.name	= "atari-falcon-ide",
 	},
 };
 
-module_platform_driver_probe(pata_falcon_driver, pata_falcon_init_one);
+module_platform_driver(pata_falcon_driver);
 
 MODULE_AUTHOR("Bartlomiej Zolnierkiewicz");
 MODULE_DESCRIPTION("low-level driver for Atari Falcon PATA");
-- 
2.42.0

