Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3BC7CCED4
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Oct 2023 23:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjJQVCN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Oct 2023 17:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343995AbjJQUrU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2023 16:47:20 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69355C6
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2023 13:47:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqy2-0001nj-6N; Tue, 17 Oct 2023 22:47:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqxz-002Ol7-ML; Tue, 17 Oct 2023 22:47:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqxz-000U0b-DL; Tue, 17 Oct 2023 22:47:03 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Alan Stern <stern@rowland.harvard.edu>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org
Subject: [PATCH 3/6] usb: gadget: fusb300-udc: Convert to use module_platform_driver()
Date:   Tue, 17 Oct 2023 22:44:46 +0200
Message-ID: <20231017204442.1625925-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
References: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nA2k8+j8+D4z5GBlUssDGp0rfWBJ2q7zdJlKJ35Bjnk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlLvJBlm7SGIyK6eD8l5OC3JZ1txsePVhZfCzsr fcuCfjxwPiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZS7yQQAKCRCPgPtYfRL+ TmEPB/0XAwdwe67usH5WOer+xfpx2lF6TLwn88Vp0LUlSucitf1fIQQXToDJ5tMifGcZCKMhxHb 7mG9IHvbUSKw8z/0mODB0upgxekVibWvIQngqPRYo3zuyEejp9zG+y9qIFJYghmV31dVGAhNMCq hFUH+ZT6Xc7FkemxO9kew1rs1xobKVt2VnJSypehql64+fQYem3C3cLZx5V9nbHfR43FPaNqsHt Z2Rm49pcBqonS1w0XYL78FswLSkY60zzCWTVWn1Bkgw73mtgfsbNW1dTeiGrlEetXMd3QZWUHHP FlxbgnOezHHpVYfR9/0BsSefw1N+uxZl++6P7Dqe0nnQTGwW
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
 drivers/usb/gadget/udc/fusb300_udc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/fusb300_udc.c b/drivers/usb/gadget/udc/fusb300_udc.c
index bd03d475f927..873265634ccc 100644
--- a/drivers/usb/gadget/udc/fusb300_udc.c
+++ b/drivers/usb/gadget/udc/fusb300_udc.c
@@ -1506,10 +1506,11 @@ static int fusb300_probe(struct platform_device *pdev)
 }
 
 static struct platform_driver fusb300_driver = {
-	.remove_new =	fusb300_remove,
-	.driver		= {
+	.probe = fusb300_probe,
+	.remove_new = fusb300_remove,
+	.driver = {
 		.name =	udc_name,
 	},
 };
 
-module_platform_driver_probe(fusb300_driver, fusb300_probe);
+module_platform_driver(fusb300_driver);
-- 
2.42.0

