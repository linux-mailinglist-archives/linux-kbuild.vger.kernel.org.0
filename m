Return-Path: <linux-kbuild+bounces-1309-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 869EA887C89
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 12:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DAC5281A97
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 11:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7DEA33F9;
	Sun, 24 Mar 2024 11:40:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DFC175BC
	for <linux-kbuild@vger.kernel.org>; Sun, 24 Mar 2024 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711280432; cv=none; b=Px1R4t7o4tkUAMJwh9ix3otapX/wiP3qFZYYMmS8wur6l9Ch4+H4JemMO6vy77j500lvFV7iqWGonaBzn1dRI7Xfo/bAcrdMvhrQgxSWBkojquZyfphrZWtSo177EN0Uvxlw2rO4umXwP7IGUag6vvHY+zwdIoj2sA4sl8bd2i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711280432; c=relaxed/simple;
	bh=eWA1KsQbyFsxavGLt/r1WcVfv5RPxFSgRbK0beCUjbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TTPmLpRzJXV6tFEORWjq+LTxua+gi2AsP2C+VbnckPzju/btRGKbBIHUgCIFFaFKB1rGX1sSpdAZdxyVVBHZ68372oUpsyal5zIedSjuj8iA7ikVJLlhk65G94aiZt7Df/FacMFYjhi7Du2uviaV80JAYFF/kWpeUY+Piqbormg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1roMDD-00050i-6Y; Sun, 24 Mar 2024 12:40:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1roMDC-008DGj-Gc; Sun, 24 Mar 2024 12:40:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1roMDC-00AMY4-1N;
	Sun, 24 Mar 2024 12:40:26 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] mmc: davinci: Don't strip remove function when driver is builtin
Date: Sun, 24 Mar 2024 12:40:17 +0100
Message-ID: <20240324114017.231936-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=eWA1KsQbyFsxavGLt/r1WcVfv5RPxFSgRbK0beCUjbc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmABEiGfPhWHdGW1KXxwS7Szv+JX/yU0gSB5Jfx IjLqDd4mMuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgARIgAKCRCPgPtYfRL+ TrHMCACCwXNSIYYedv7CVLnH1c5zSvxdr0y1J4+XayZ4hoDnWvVcio5RtODwtc8v4kurQC6Wi1V Q2BlQoVPSsQDd8dKMMkWatMr924TpHUjV1rTrxOiAIa/59/BTzcykQEipUQhkMvnwq5pceFSF8a u45bHN2vsasEdF4L/8k8bajj+ylybgbjPAGXTtLps1+yneTdiOQ7V8PiNMqIW3XZG92UH1QrR9l MdctMx2vi1yLnw7Wk3jlZqw+bnR6zHWqggggAGZ+kRpx0EWNEOcsYUQ14mkSOoyC9DtO4ZrsYzV 8XCE7IZ7HlDmt8wkDGBd+ROx9Yt6q6c+9noMXzeQSc1JerpE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Using __exit for the remove function results in the remove callback
being discarded with CONFIG_MMC_DAVINCI=y. When such a device gets
unbound (e.g. using sysfs or hotplug), the driver is just removed
without the cleanup being performed. This results in resource leaks. Fix
it by compiling in the remove callback unconditionally.

This also fixes a W=1 modpost warning:

	WARNING: modpost: drivers/mmc/host/davinci_mmc: section mismatch in reference: davinci_mmcsd_driver+0x10 (section: .data) -> davinci_mmcsd_remove (section: .exit.text)

Fixes: b4cff4549b7a ("DaVinci: MMC: MMC/SD controller driver for DaVinci family")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mmc/host/davinci_mmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
index 8bd938919687..d7427894e0bc 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1337,7 +1337,7 @@ static int davinci_mmcsd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void __exit davinci_mmcsd_remove(struct platform_device *pdev)
+static void davinci_mmcsd_remove(struct platform_device *pdev)
 {
 	struct mmc_davinci_host *host = platform_get_drvdata(pdev);
 
@@ -1392,7 +1392,7 @@ static struct platform_driver davinci_mmcsd_driver = {
 		.of_match_table = davinci_mmc_dt_ids,
 	},
 	.probe		= davinci_mmcsd_probe,
-	.remove_new	= __exit_p(davinci_mmcsd_remove),
+	.remove_new	= davinci_mmcsd_remove,
 	.id_table	= davinci_mmc_devtype,
 };
 

base-commit: 70293240c5ce675a67bfc48f419b093023b862b3
-- 
2.43.0


