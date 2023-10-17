Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01FE27CCE80
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Oct 2023 22:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbjJQUrO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Oct 2023 16:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjJQUrM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2023 16:47:12 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A172FD
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2023 13:47:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqy0-0001ny-Oy; Tue, 17 Oct 2023 22:47:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqxz-002OlA-Vg; Tue, 17 Oct 2023 22:47:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qsqxz-000U0f-ML; Tue, 17 Oct 2023 22:47:03 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org
Subject: [PATCH 4/6] usb: gadget: lpc32xx-udc: Convert to use module_platform_driver()
Date:   Tue, 17 Oct 2023 22:44:47 +0200
Message-ID: <20231017204442.1625925-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
References: <20231017204442.1625925-8-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1436; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=sxbp0y/WRYI7u4m1SNALeJ77zvGjqnu7lZYDt8ktbnI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlLvJD8+ykX40knZvq2p34NQqD/Cl/Mc9/OyrcQ h+PzHXLeOOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZS7yQwAKCRCPgPtYfRL+ Tjb9B/9x6ytRK5v/+YM/jKR3Oj5x7fUF3Gfxfv3y93nqplJOfo37t1K4u0ulkWC7sEuNHRlqsjv 1JrHm6fb3Ti6w6riFm3HG4EVsqqvfCudeLza/4ielz//jBp9yNVLUyHx28lHIi7n8tvN4nZ2wgO wXdcJLStqH+xTWzqtBTIdDL7qAs0xWKq5PfSU7rOTwZTipLWaYwSYY+njuPJECKep8PtMiQ8iC9 DCTCIUiHQRc++edVAxvY2RkJQECIlTzVLwegi5XAzbnRuz5pxBbLN+oz3cijpvst0zy5fDRE7V+ 1ASslSwz6KQe2nd728HVrVGnKIdeIDe8YbmNVJsQ+kpS0GBa
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
 drivers/usb/gadget/udc/lpc32xx_udc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index fe62db32dd0e..a917cc9a32ab 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3254,6 +3254,7 @@ MODULE_DEVICE_TABLE(of, lpc32xx_udc_of_match);
 #endif
 
 static struct platform_driver lpc32xx_udc_driver = {
+	.probe		= lpc32xx_udc_probe,
 	.remove		= lpc32xx_udc_remove,
 	.shutdown	= lpc32xx_udc_shutdown,
 	.suspend	= lpc32xx_udc_suspend,
@@ -3264,7 +3265,7 @@ static struct platform_driver lpc32xx_udc_driver = {
 	},
 };
 
-module_platform_driver_probe(lpc32xx_udc_driver, lpc32xx_udc_probe);
+module_platform_driver(lpc32xx_udc_driver);
 
 MODULE_DESCRIPTION("LPC32XX udc driver");
 MODULE_AUTHOR("Kevin Wells <kevin.wells@nxp.com>");
-- 
2.42.0

