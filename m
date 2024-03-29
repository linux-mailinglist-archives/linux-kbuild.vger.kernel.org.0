Return-Path: <linux-kbuild+bounces-1405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 750BB892678
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 22:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89FDB1C21498
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 21:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CDEA13CAA1;
	Fri, 29 Mar 2024 21:55:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD513CAAD
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Mar 2024 21:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749303; cv=none; b=BUUdZaBMymIepct4lb5ptvVUepsG6XlN2GVUp1aJRgrMNf95UtFTM1G25u4bTAmibUQzbC7yMsAZa6wxlhRsEBLJO+U5+M6Vpix3O7YQ4dcSiVk2589pEd9A4v0iLPCvtbBtP23xNSW18pT6KYGlVZ+69Q/bJe/u45KC6IHNS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749303; c=relaxed/simple;
	bh=+T3tl89Zdmezqit2RxPwGaXHZUmsaUWzxhlx+dYkF00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umM3yj4/Vwdw3aeUzKO6zzon4X8TonSU7/IJnY5dBm7Aq53vJiW/k8OGvqhJD3nt0U6fZpXNtOyQsZERPVffUqwrrybalEUgWXLMq+PQlVlsLu0RWORAyrWzv4iX5yqqVB8CLy/kjFtJgVzzjlvV6rsPsfMzviAfFyBjA+Wa86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBY-0004gX-Kb; Fri, 29 Mar 2024 22:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-009GMG-Eb; Fri, 29 Mar 2024 22:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-00DTk2-1B;
	Fri, 29 Mar 2024 22:54:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Tom Lendacky <thomas.lendacky@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Cc: linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] virt: sev-guest: Mark driver struct with __refdata to prevent section mismatch
Date: Fri, 29 Mar 2024 22:54:41 +0100
Message-ID:  <4a81b0e87728a58904283e2d1f18f73abc69c2a1.1711748999.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=+T3tl89Zdmezqit2RxPwGaXHZUmsaUWzxhlx+dYkF00=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmBzikL16JNEqPrgXgFn/CojyKrl2S5zMT3Jjsh 72gE+uqWgmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgc4pAAKCRCPgPtYfRL+ TmTSB/4z//bEimBztaqRKnlEIhDD+Xw8x+OOt+6lINgqo7RQLKyw5VWfk3wBb09BL4jioezwOFe U/KLZOvglOVpAiTr4VYmu31p2QR2gFJCnDnZnL0ky5Xix4q+0XIzvOwkv99r03brwb4Ptqlc3I/ Mj5WIh3G+OnJBfB9fy+thL+InCcLxDYUYmDLDElBD7EcLAP+yiyW3OnzY2pfTf6TAdPdL+AAInn D1vfFe4cRhyUj2gCDrghbFxuDThdS6JjQOhxnOdinuQm2SJLG0/erosWPaR9saYNEItPQEqWwqh 4D+l9gvqEeVnyr/ORgLOrud78Q3LBxndbVYcc86sN3mq92SN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent the following section mismatch warning

	WARNING: modpost: drivers/virt/coco/sev-guest/sev-guest: section mismatch in reference: sev_guest_driver+0x10 (section: .data) -> sev_guest_remove (section: .exit.text)

that triggers on an allmodconfig W=1 build.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/virt/coco/sev-guest/sev-guest.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco/sev-guest/sev-guest.c
index 87f241825bc3..1af68065b3d9 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -1009,8 +1009,13 @@ static void __exit sev_guest_remove(struct platform_device *pdev)
  * This driver is meant to be a common SEV guest interface driver and to
  * support any SEV guest API. As such, even though it has been introduced
  * with the SEV-SNP support, it is named "sev-guest".
+ *
+ * sev_guest_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
  */
-static struct platform_driver sev_guest_driver = {
+static struct platform_driver sev_guest_driver __refdata = {
 	.remove_new	= __exit_p(sev_guest_remove),
 	.driver		= {
 		.name = "sev-guest",
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
-- 
2.43.0


