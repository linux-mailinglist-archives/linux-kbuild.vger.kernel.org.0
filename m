Return-Path: <linux-kbuild+bounces-1310-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EDD887D87
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 17:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFCBE1F21201
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Mar 2024 16:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2181BCA64;
	Sun, 24 Mar 2024 16:12:43 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAA18659
	for <linux-kbuild@vger.kernel.org>; Sun, 24 Mar 2024 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711296763; cv=none; b=G1U47hMDfsdVXhlm9Arb7EWohaXGnDpLNmW/2dnqdbdK4ih+3f3BkQc4VyDuIm7S7gT+KEyh3+Ac/yuvGoWDm/5FCL2K794ads4TRoYk4aNsS003BBJColYYVQSFb6BFJzQpAmf5xNpnBhcjqpliexRmRTAFbZeXHCYLF2m1+0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711296763; c=relaxed/simple;
	bh=zbkEwfF5XQTLA9liaCLXZUMnOSsMSZXLUe2tGPyJB50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ovXpB9WPGICXTJF0mf4RLeDh1cSMwrrvfPY6caZQmOkT65ff+k3ZOklallklGGgFQZDoBLnopHJMblSpaVdaHIkGMqH1U+fWioVjz0X+cc5BJ/rwtfzreF1KefOAqi7kt712jan7qRliKnBMAIFOIhuchK+9V+umqsPc6pLor0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1roQSY-0000c3-PB; Sun, 24 Mar 2024 17:12:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1roQSW-008Fq5-Mo; Sun, 24 Mar 2024 17:12:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1roQSW-00AT6p-21;
	Sun, 24 Mar 2024 17:12:32 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	kernel@pengutronix.de,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2] hwrng: mxc-rnga: Drop usage of platform_driver_probe()
Date: Sun, 24 Mar 2024 17:12:26 +0100
Message-ID: <20240324161227.239718-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2289; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zbkEwfF5XQTLA9liaCLXZUMnOSsMSZXLUe2tGPyJB50=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmAFDrL4GkQ1S58miTfSLNkPs7rx8eHVWFk045g tOTVnuUghuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgBQ6wAKCRCPgPtYfRL+ TqBTB/sFdbZbF2ZZ8cAouSVwVgAdNK2Qquq8h1b/P7bo753XD9k6mOd5/85x7APNecfNNg9jzo5 JlhAkHg/kuBcLKQun+fUeEYxhU9yh9GvrTcvUE6gja0tPdDdQcJYqyd9TEpPjqbwpqRVyggNNvN 7VPIaoInV5vJJbvOaZbFFG3PLnIdLNbDK4KlgZddmPG6rc4JBC9WDp2sixRMN1fUF5w6lfqydJ0 jMJ5Z+mqrPscFdndO6giFqpluEIIegoprXh3s5fnBXXmsE9Gl6B2hKy+wMy5QvQW7tDvzHVSlAG FZ5X+PHAVwBu9MwNc0ifBnJwRofGV6ZhVbt6si8HSWmrN0zD
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
Hello,

while I indeed fixed the mentioned warning in (implicit) v1, I
introduced another one because I failed to drop __init from
mxc_rnga_probe. :-\

This is fixed here.

Best regards
Uwe

 drivers/char/hw_random/mxc-rnga.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/mxc-rnga.c b/drivers/char/hw_random/mxc-rnga.c
index 07ec000e4cd7..94ee18a1120a 100644
--- a/drivers/char/hw_random/mxc-rnga.c
+++ b/drivers/char/hw_random/mxc-rnga.c
@@ -131,7 +131,7 @@ static void mxc_rnga_cleanup(struct hwrng *rng)
 	__raw_writel(ctrl & ~RNGA_CONTROL_GO, mxc_rng->mem + RNGA_CONTROL);
 }
 
-static int __init mxc_rnga_probe(struct platform_device *pdev)
+static int mxc_rnga_probe(struct platform_device *pdev)
 {
 	int err;
 	struct mxc_rng *mxc_rng;
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


