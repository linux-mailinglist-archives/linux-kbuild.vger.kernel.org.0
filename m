Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549E77CCE84
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Oct 2023 22:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234787AbjJQUrZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Oct 2023 16:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbjJQUrS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2023 16:47:18 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E7792
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2023 13:47:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqy1-0001nz-Cc; Tue, 17 Oct 2023 22:47:05 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqy0-002OlE-5j; Tue, 17 Oct 2023 22:47:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqxz-000U0j-Si; Tue, 17 Oct 2023 22:47:03 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Pavel Machek <pavel@ucw.cz>, Paolo Abeni <pabeni@redhat.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org
Subject: [PATCH 5/6] usb: gadget: m66592-udc: Convert to use module_platform_driver()
Date:   Tue, 17 Oct 2023 22:44:48 +0200
Message-ID: <20231017204442.1625925-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
References: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1272; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7iG+7YHkjXyb8dJ/SKwln8ra7wbimjCSB/o9LaESEkQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlLvJERJ72oT7SW8wEwuuhuHcE3wi8xb8q9D/ee QOxBJIyzvCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZS7yRAAKCRCPgPtYfRL+ TtNsB/9+pKqFO/XZfoq5tUTRiQ1TFiQZ/sqwT5ehdbyhQ/MhejSVDwtIbUm7sb7qPYwc9b5yUMW KAdfFml7DB93X8KSdafB9mEwOz6mrD4dz/hcjrg4Ay7zv801n9fCk/ixDfnbDQSC67UUOfsLL7D bVKvznCDgysFI1PCS59syr+9ENlevrs3bV0D2e2efcQutaZeZr0IL4fnf9KTG4M2R3Jh36N4IT9 FjoTQuV7v35VW9V7JGgyyozCIayu3vuPFyIvsyp5ZnMqYldmpjZDliVtFop5J+eJ4nZb7YCyHmj yo7dl3n2N0Hp+zS+mJII9WsjY6HNB8yhfgn/o4t/Tj0ir+94
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

module_platform_driver_probe() has the advantage that the .probe() and
.remove() calls can live in .init.text and .exit.text respectively and
so some memory is saved. The downside is that dynamic bind and unbind
are impossible. As the driver doesn't benefit from the advantages (both
.probe and .remove are defined in plain .text), stop suffering from the
downsides and use module_platform_driver() instead of
module_platform_driver_probe().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/m66592-udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index e05f45a4b56b..bfaa5291e6c8 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1687,10 +1687,11 @@ static int m66592_probe(struct platform_device *pdev)
 
 /*-------------------------------------------------------------------------*/
 static struct platform_driver m66592_driver = {
+	.probe =	m66592_probe,
 	.remove_new =	m66592_remove,
 	.driver		= {
 		.name =	udc_name,
 	},
 };
 
-module_platform_driver_probe(m66592_driver, m66592_probe);
+module_platform_driver(m66592_driver);
-- 
2.42.0

