Return-Path: <linux-kbuild+bounces-1402-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C2A892675
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 22:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F544B22BD1
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 21:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4826E13B2B8;
	Fri, 29 Mar 2024 21:54:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518DF13CFB6
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Mar 2024 21:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749296; cv=none; b=cSqTYzGFbLyTYZgsFwlrALVML+GIXUmj7VA0Un4ng1LJ/DPx8Cm8HesnhZTLhBbJOxVNM/sopKfiua0aQ2S1N4apkUUDsIZ7Ry7EhmCEFMlrGB6cJ959b6+iDqjodps70+t05C0dJFNizG+m5/Up0BS9+0SZeaw80CSeaxXEi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749296; c=relaxed/simple;
	bh=WwLc102XeYwZwzW3cybR17GYB+ofAI/4n3gKjg8xR20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2pbMLmszAxqDrwP4N6Lmt+PwzQf45Q+eTKsx+iqk7ynno/8At05wh9rZXQPLMH4lrbmXYpQDOjtVLG8u3JCbj0fjxF2MWfTEs5tWJOo51dj+5hLlDayE0QuLg9umwC/hMqmEN2jYap/FzUQp+UnsliXG9wiCNCp/L4e+vL814o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-0004gT-MQ; Fri, 29 Mar 2024 22:54:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-009GMC-7h; Fri, 29 Mar 2024 22:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-00DTjy-0V;
	Fri, 29 Mar 2024 22:54:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] serial: ami: Mark driver struct with __refdata to prevent section mismatch
Date: Fri, 29 Mar 2024 22:54:40 +0100
Message-ID:  <043afcbc94ad90079301f3c7738136a7993a1748.1711748999.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=WwLc102XeYwZwzW3cybR17GYB+ofAI/4n3gKjg8xR20=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmBzijRkqhZMAgH/jj2wot8WnuuEcuR35OQTqoa HxETeaJ7A6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgc4owAKCRCPgPtYfRL+ TlFyB/99tEe8PsNy2x4XEaKBmh7YcfGF2CMkAxh+l+QXvElnsS1gY5Ju0CddcPcSMrEzjIM04rm BM2Ib1uGGulFhQcVeWQMpzn4HlYNv8vB43j6Mpc2YwJWsMbqz2wJ5my8WJ+zFw4zfZpcx+vS8hu RrX/Ws6X2vik2JysZCe+dFBXK2jA7vaKq/ikPxSWvxTcFMVrFrOQl/IOMv6vK/cfNkmO/0txRSw dea69sg07LSwdJ4dTuU4PPxnQ1vy4Ob5eSjmxXNU5CE2e8UTXjk4k8OUliNx0O1JYI2qPjfXAWO QZnMh407StR4/a20SnGViosDO1219AVbFJqeHRVvNFGs8Nux
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent the following section mismatch warning

	WARNING: modpost: drivers/tty/amiserial: section mismatch in reference: amiga_serial_driver+0x8 (section: .data) -> amiga_serial_remove (section: .exit.text)

that triggers on an allmodconfig W=1 build.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/amiserial.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index e27360652d9b..8c964da75f2d 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -1578,7 +1578,13 @@ static void __exit amiga_serial_remove(struct platform_device *pdev)
 	free_irq(IRQ_AMIGA_RBF, state);
 }
 
-static struct platform_driver amiga_serial_driver = {
+/*
+ * amiga_serial_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver amiga_serial_driver __refdata = {
 	.remove_new = __exit_p(amiga_serial_remove),
 	.driver   = {
 		.name	= "amiga-serial",
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
-- 
2.43.0


