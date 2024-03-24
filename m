Return-Path: <linux-kbuild+bounces-1306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AA887C47
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 11:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D02A1C20DAA
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 10:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9767C16415;
	Sun, 24 Mar 2024 10:38:27 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF83168B9
	for <linux-kbuild@vger.kernel.org>; Sun, 24 Mar 2024 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711276707; cv=none; b=E7QKlwbe1OFep9QY0LIfH9hDCxj/DOgsKKe4EC2fzcJzLcdkbXAl2N1R+Ny/Poi4zo7L4Y1fbA51KDvjck7GQBjte0u3+yM+Poh8Ng7CjiqzJXoopc3H5Sef6UXTbzfejBbN6RZRQoiGcAKh41fVkhBZ78ZemUQQs4CwO412Mnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711276707; c=relaxed/simple;
	bh=rK4d9VOTT3BVvLRrZvPHJ6EKRFskVgbNvD2QQmetaBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NCo3x9NiDtpLUibFdL1ervt0gWml6p4WskAGdWRd90tYasa1wbR089eEwGT9EK2dV/JX9rVFQj91osLuirFWu9St3uWfryrbtIWdv/X/B9zpvqyALF81FIdJR60QA2pZHJnReYjn/4fZaIplZzllJNcMJcvtw65iQEwxOq9MVHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1roLEy-0000Fj-Cx; Sun, 24 Mar 2024 11:38:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1roLEu-008Cns-EX; Sun, 24 Mar 2024 11:38:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1roLEu-00AL9N-19;
	Sun, 24 Mar 2024 11:38:08 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] hwrng: mxc-rnga: Drop usage of platform_driver_probe()
Date: Sun, 24 Mar 2024 11:37:59 +0100
Message-ID: <20240324103759.228009-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1771; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rK4d9VOTT3BVvLRrZvPHJ6EKRFskVgbNvD2QQmetaBE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmAAKHobRFJLwPEXnXAjYarqkSYO0QaSNwAclxI PMCZbyXguiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgAChwAKCRCPgPtYfRL+ Tj+6B/9tJoseCgviIfCIjFMT5nEMb4MhAPKqsvfUl7/jBz67MByh0SAMiq4+vBH3Xfr9Gwnjbie QbM+ujoXb06HO0yWChapxsibOXnJ9gtkEkKWAS+VQ83RYkkIVSfJmSO51XUQ/lWQS+WwHzz3hhV xyvdqZgnoqvUTzZa/uIXZQNujH5YqoNtwdwnL+gMYzhvolu4wsS+PaxRguTssamOgM3EHMbeI7K CLJHwaa9y8uo5lNX2OgbOxrXAG7vxO88LeY9bYfM4QnYV99e0C39x/Dpi4tIHFnw7Z2lkbrSear V6TIUihG7JYXyNQ3uCICIj74CXwwoz1pzE92p8OCVpXPpmZs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

There are considerations to drop platform_driver_probe() as a concept
that isn't relevant any more today. It comes with an added complexity
that makes many users hold it wrong. (E.g. this driver should have mark
the driver struct with __refdata.)

Convert the driver to the more usual module_platform_driver().

This fixes a W=1 build warning:

	WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in reference: mxc_rnga_driver+0x10 (section: .data) -> mxc_rnga_remove (section: .exit.text)

with CONFIG_HW_RANDOM_MXC_RNGA=m.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/char/hw_random/mxc-rnga.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/mxc-rnga.c b/drivers/char/hw_random/mxc-rnga.c
index 07ec000e4cd7..5d1512b08d9e 100644
--- a/drivers/char/hw_random/mxc-rnga.c
+++ b/drivers/char/hw_random/mxc-rnga.c
@@ -176,7 +176,7 @@ static int __init mxc_rnga_probe(struct platform_device *pdev)
 	return err;
 }
 
-static void __exit mxc_rnga_remove(struct platform_device *pdev)
+static void mxc_rnga_remove(struct platform_device *pdev)
 {
 	struct mxc_rng *mxc_rng = platform_get_drvdata(pdev);
 
@@ -197,10 +197,11 @@ static struct platform_driver mxc_rnga_driver = {
 		.name = "mxc_rnga",
 		.of_match_table = mxc_rnga_of_match,
 	},
-	.remove_new = __exit_p(mxc_rnga_remove),
+	.probe = mxc_rnga_probe,
+	.remove_new = mxc_rnga_remove,
 };
 
-module_platform_driver_probe(mxc_rnga_driver, mxc_rnga_probe);
+module_platform_driver(mxc_rnga_driver);
 
 MODULE_AUTHOR("Freescale Semiconductor, Inc.");
 MODULE_DESCRIPTION("H/W RNGA driver for i.MX");

base-commit: 70293240c5ce675a67bfc48f419b093023b862b3
-- 
2.43.0


