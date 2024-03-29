Return-Path: <linux-kbuild+bounces-1401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D8892674
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 22:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 739AB282631
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 21:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA39113D8B2;
	Fri, 29 Mar 2024 21:54:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8885E13DB9C
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Mar 2024 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749295; cv=none; b=pfgAQ7VMly0yT5j10YFvorod0JMsJscK8yu4bZr189B/xWR2bWdST5q8g4v9TzkmSvzg6S68zWSiwse/Tja/u1NP3AOBi9Js5R0pl5fqSQzH4nW0zhb90j8wMp53AyZ6hpF2EAwIVnzskzf9CH3HqrCKrltUEw3agdaFNbf9wvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749295; c=relaxed/simple;
	bh=FFP5qSLt2gi6OXPIlQSb+oCOhup6SxDCMfl5WUh43iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nd+A2/FpEfx2hrOL7Y/yatCUB5f/KzVfTG/zBMr7yMTriUoA60YQTmh2zG8PpWDHFB0RvIj2vd2Z5jqSPXyANvtTkhoUtC86W4ChGLRd3ZQumZ71IDugV3EH98b/2MhOyAF8L1z066QmPCPbjyRvU9k2p9ixd+YDkYeDLbyEeBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-0004gJ-DJ; Fri, 29 Mar 2024 22:54:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-009GM9-0n; Fri, 29 Mar 2024 22:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBW-00DTju-32;
	Fri, 29 Mar 2024 22:54:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] parport: amiga: Mark driver struct with __refdata to prevent section mismatch
Date: Fri, 29 Mar 2024 22:54:39 +0100
Message-ID:  <49ab91032bf9b57cd5fb6d306c38884d059dce2f.1711748999.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To:  <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
References:  <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=FFP5qSLt2gi6OXPIlQSb+oCOhup6SxDCMfl5WUh43iA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmBziinZBZuqhic9jwgdlI0skMFr+/xqo+9bVkF +wj9XnM69uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgc4ogAKCRCPgPtYfRL+ ThbOB/4mIS6/DERN5/ySMmxe23YeE2PvWHuIDtKHC3gP4q78njdUTPWp9lr5D8KRrmbXfIf0l9E XadY6k2bIpZ2WiROWj8rjVVuAiA8RGKWuXfbbWD0xlzT5w3yPSkLl3VHT45uuoCY/OWOOiRbKz5 2rduIoLKfp9JKQsgH7Ph3kolEbvkKlUIwENCx1LaOjOYTVu3zKkjk2Zfvy6PCi7/sYHhD7K9AeO x4598/StdH+df5qAOEEFE1QEIO8YNTZe1J6SVsuUZ1enXGbAZKH10DrDmJyQzDZw3a6wNVVZvSR HCLCUSLYRNidLhdlkuw14kZKeY3rd4+rAFIMkgb1QdS86IZv
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent the following section mismatch warning

	WARNING: modpost: drivers/parport/parport_amiga: section mismatch in reference: amiga_parallel_driver+0x8 (section: .data) -> amiga_parallel_remove (section: .exit.text)

that triggers on an allmodconfig W=1 build.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/parport/parport_amiga.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/parport/parport_amiga.c b/drivers/parport/parport_amiga.c
index e6dc857aac3f..e06c7b2aac5c 100644
--- a/drivers/parport/parport_amiga.c
+++ b/drivers/parport/parport_amiga.c
@@ -229,7 +229,13 @@ static void __exit amiga_parallel_remove(struct platform_device *pdev)
 	parport_put_port(port);
 }
 
-static struct platform_driver amiga_parallel_driver = {
+/*
+ * amiga_parallel_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver amiga_parallel_driver __refdata = {
 	.remove_new = __exit_p(amiga_parallel_remove),
 	.driver   = {
 		.name	= "amiga-parallel",
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
-- 
2.43.0


