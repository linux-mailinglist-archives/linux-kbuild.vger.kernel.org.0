Return-Path: <linux-kbuild+bounces-281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD0A8089E0
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 15:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB2551C20B6B
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 14:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7C541759;
	Thu,  7 Dec 2023 14:09:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E1610F9
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Dec 2023 06:09:47 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-0001Zz-Nd; Thu, 07 Dec 2023 15:09:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4O-00ECj1-Uk; Thu, 07 Dec 2023 15:09:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4O-00FvTM-Lc; Thu, 07 Dec 2023 15:09:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/4] hwmon: (smsc47m1) Mark driver struct with __refdata to prevent section mismatch
Date: Thu,  7 Dec 2023 15:09:29 +0100
Message-ID:  <57977a88a9b99b6555b227aa4994ac3df10c6490.1701957840.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=/kNNaHtUk+dPToZUrilhi4B89ztEfaUkeR7o03Fm/4E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcdIZvOjHjx/XEjX+arETCYDA73eJtSqmqj0Dz 26v/YG4d6aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXHSGQAKCRCPgPtYfRL+ TvvcCACfE8f8CzaqUU2FtRkkhLzNIoQO9y6pW25HeVzLc4yMT3HVDScvgi68pwQ5Pg9/u6rpWjS PPHej5bpYgWwuAUjpJwGDTVVa656Z+AQMtQzwpQyrQsJlHJ1nmj1PLftnKF6if+zpOelsm/f7Lu f+qD+ERPUF0+j9UU2LEobrKopVMR/Dpr/MGFNnzT0PKbTif/0yiAtWBki4Kg677nXbwZQKz9GWL 6YSmiVFcCs27Kuf6KHy5/Dtw57qCbOgjWTPNZFjWg6JvpYnRMFNcNMe9iuxMpcoLB3TAvdF7TCR 4gb9/gH6nN7KUdMYC0s8wrQ+ifuQCwajvin1YLXGAoxYrCuq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent the following section mismatch warning

	WARNING: modpost: drivers/hwmon/smsc47m1: section mismatch in reference: smsc47m1_driver+0x8 (section: .data) -> smsc47m1_remove (section: .exit.text)

that triggers on an allmodconfig W=1 build.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hwmon/smsc47m1.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 37531b5c8254..29ea8fb4f353 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -850,7 +850,13 @@ static int __exit smsc47m1_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver smsc47m1_driver = {
+/*
+ * smsc47m1_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this ok because they cannot get unbound at
+ * runtime. The driver needs to be marked with __refdata, otherwise modpost
+ * triggers a section mismatch warning.
+ */
+static struct platform_driver smsc47m1_driver __refdata = {
 	.driver = {
 		.name	= DRVNAME,
 	},
-- 
2.42.0


