Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7D57E1405
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Nov 2023 16:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjKEPBP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Nov 2023 10:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjKEPBE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Nov 2023 10:01:04 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846CECC
        for <linux-kbuild@vger.kernel.org>; Sun,  5 Nov 2023 07:01:02 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecR-0002zQ-9D; Sun, 05 Nov 2023 16:00:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecQ-006oU9-Si; Sun, 05 Nov 2023 16:00:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecQ-00DBt7-HJ; Sun, 05 Nov 2023 16:00:54 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        kernel@pengutronix.de, linux-kbuild@vger.kernel.org
Subject: [PATCH 2/4] ata: pata_gayle: Stop using module_platform_driver_probe()
Date:   Sun,  5 Nov 2023 16:00:37 +0100
Message-ID: <20231105150037.3724669-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.482.g2e8e77cbac8a.dirty
In-Reply-To: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
References: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2275; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LbK9Tg1XnSWlrNwILoe3+9o72vLYA7IUvjJ2HdrJ/cs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlR64XEu0h8i3Tbes67W9npNlv/lwt06zlgG/K5 /ZRHdbeqEWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUeuFwAKCRCPgPtYfRL+ ThTSB/9g0RCxSIo6WdKyLlV9ylF4jzAFCJGslrSm8ZPYQtbR1H+WQjvAeM9YaNK3r5y3H3Oczzn z+OV9jdWRlhPZkR+wUCnEvyT1xvuGjb8FWxB2U0lvq+dsJ7xFcG0qJimU16CM+xewvO2V8s3kwh +WPMUQ5W/k5wbXT5LoRYrHqhHB03VHJpUkvOA4vl7qmsWtYvzTZi/exJ12yweSPQeFeDnTHnJ5+ UB8zUuQVH/5WIhFuolME7epMZ5vjkQrEr6cxy7lrGnTwevvyX35Exhlyym5DshlKIxr7da9xv/Q k5ph2+m6zA4gkAFmxA2I6yqDWzH/nN0tyECJE9q9FIAcH4x5
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
 drivers/ata/pata_gayle.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/pata_gayle.c b/drivers/ata/pata_gayle.c
index 3bdbe2b65a2b..e10411b02047 100644
--- a/drivers/ata/pata_gayle.c
+++ b/drivers/ata/pata_gayle.c
@@ -124,7 +124,7 @@ static struct ata_port_operations pata_gayle_a4000_ops = {
 	.set_mode	= pata_gayle_set_mode,
 };
 
-static int __init pata_gayle_init_one(struct platform_device *pdev)
+static int pata_gayle_init_one(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct gayle_ide_platform_data *pdata;
@@ -193,7 +193,7 @@ static int __init pata_gayle_init_one(struct platform_device *pdev)
 	return 0;
 }
 
-static int __exit pata_gayle_remove_one(struct platform_device *pdev)
+static int pata_gayle_remove_one(struct platform_device *pdev)
 {
 	struct ata_host *host = platform_get_drvdata(pdev);
 
@@ -203,13 +203,14 @@ static int __exit pata_gayle_remove_one(struct platform_device *pdev)
 }
 
 static struct platform_driver pata_gayle_driver = {
-	.remove = __exit_p(pata_gayle_remove_one),
+	.probe = pata_gayle_init_one,
+	.remove = pata_gayle_remove_one,
 	.driver   = {
 		.name	= "amiga-gayle-ide",
 	},
 };
 
-module_platform_driver_probe(pata_gayle_driver, pata_gayle_init_one);
+module_platform_driver(pata_gayle_driver);
 
 MODULE_AUTHOR("Bartlomiej Zolnierkiewicz");
 MODULE_DESCRIPTION("low-level driver for Amiga Gayle PATA");
-- 
2.42.0

