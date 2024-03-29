Return-Path: <linux-kbuild+bounces-1406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 428EB892679
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 22:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6A1F1F25163
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 21:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3019F13CA94;
	Fri, 29 Mar 2024 21:55:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7782E13CAAD
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Mar 2024 21:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749311; cv=none; b=sKLGH+tZcNiofJWPRGkTaonpjKALn9Uj83lO4MZETvVzZCxFvkzJnKVyn99xDLJmcIq7uzf+WoPWhyBjLP5wt19aylzBzJWKxOmbj+q/rpJX/fx1SZQRyMUIwCVP++MJUDsVjLQG1inHAVDBvsl5Ze53njh7KbU70xQ5cid5kNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749311; c=relaxed/simple;
	bh=u1UhruhrTBacTG5k8fHeAqtFCEXrhLT1PXtH1xxAtAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fL7g6AqbYgECjixMWiC0mglN9n1RX2msctP+UkvbhHzKMRStpMzhg7yMxioLidyzvsnx41jQRomlLmvhriJYoPdNv2Hj4Jd9cFqo0HNFMEESnZ4l345MbRITzwp47mInT3qAwmaY/ucDuqNBYCU7+dBzU7Jialha0zDQjtMQDU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBa-0004gm-2H; Fri, 29 Mar 2024 22:54:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-009GMO-Re; Fri, 29 Mar 2024 22:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-00DTkA-2T;
	Fri, 29 Mar 2024 22:54:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Dawei Li <set_pte_at@outlook.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linux-kbuild@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH] serial: pmac_zilog: Drop usage of platform_driver_probe()
Date: Fri, 29 Mar 2024 22:54:43 +0100
Message-ID:  <5ea3174616abc9fa256f115b4fb175d289ac1754.1711748999.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=u1UhruhrTBacTG5k8fHeAqtFCEXrhLT1PXtH1xxAtAA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhjR2i+Usnzv+dSVtseae9CZXZd72KOkmQ4cc419MLt/fL c607rzRyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEKhzZ//BdMynhn/h7kvJm QdY89rAlGvOLLzzeJuCoczCGIZVjvdAzl0DfX5c7giyjgxOOqHxq4rlncs0m6de+syWn2Lgd5Rp YV0bo/ThwnCkpV1X0411eSSbHufMkLCYV/P+64etzMaO4Ah056YknHJfnnzXS2pf84l7Tdv/pZ7 XvLfjLscXX8q2l9GIbTt3frrwW3g1L6mOuuCXsP/b6nnNEqPP65ftE5/PvLt697bLSdKXvBaYuZ 8Xjm+ZPL7p2tcAgyP6b+szXZdMsPxXHWlsWbU7eevNjnkvS9DOucy+b71GJurNdxaWnTXKSefgu jbDuLdlNPccCEjfOF7Rszwp2b1qXJ20ik3BBYW11iZ8UAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

There are considerations to drop platform_driver_probe() as a concept
that isn't relevant any more today. It comes with an added complexity
that makes many users hold it wrong. (E.g. this driver should have
marked the driver struct with __refdata to prevent the below mentioned
false positive section mismatch warning.)

This fixes a W=1 build warning:

	WARNING: modpost: drivers/tty/serial/pmac_zilog: section mismatch in reference: pmz_driver+0x8 (section: .data) -> pmz_detach (section: .exit.text)

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/serial/pmac_zilog.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
index 05d97e89511e..e44621218248 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1695,7 +1695,7 @@ static void pmz_dispose_port(struct uart_pmac_port *uap)
 	memset(uap, 0, sizeof(struct uart_pmac_port));
 }
 
-static int __init pmz_attach(struct platform_device *pdev)
+static int pmz_attach(struct platform_device *pdev)
 {
 	struct uart_pmac_port *uap;
 	int i;
@@ -1714,7 +1714,7 @@ static int __init pmz_attach(struct platform_device *pdev)
 	return uart_add_one_port(&pmz_uart_reg, &uap->port);
 }
 
-static void __exit pmz_detach(struct platform_device *pdev)
+static void pmz_detach(struct platform_device *pdev)
 {
 	struct uart_pmac_port *uap = platform_get_drvdata(pdev);
 
@@ -1789,7 +1789,8 @@ static struct macio_driver pmz_driver = {
 #else
 
 static struct platform_driver pmz_driver = {
-	.remove_new	= __exit_p(pmz_detach),
+	.probe		= pmz_attach,
+	.remove_new	= pmz_detach,
 	.driver		= {
 		.name		= "scc",
 	},
@@ -1837,7 +1838,7 @@ static int __init init_pmz(void)
 #ifdef CONFIG_PPC_PMAC
 	return macio_register_driver(&pmz_driver);
 #else
-	return platform_driver_probe(&pmz_driver, pmz_attach);
+	return platform_driver_register(&pmz_driver);
 #endif
 }
 
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
-- 
2.43.0


