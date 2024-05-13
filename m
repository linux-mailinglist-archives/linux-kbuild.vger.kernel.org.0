Return-Path: <linux-kbuild+bounces-1838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1188C3CA9
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 09:54:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED8B71C202EF
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 07:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E981465B2;
	Mon, 13 May 2024 07:52:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88058146A95
	for <linux-kbuild@vger.kernel.org>; Mon, 13 May 2024 07:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715586739; cv=none; b=TYOYDPGl1gknyckyr3QOahFn/1DDiTOX3B1zKDNezgjCfZz8qONIadiU4wnFklW1btG9pTtZozpS+3IWdUDPNpt2snAe7mlOVJ4kpM4h21Kleu5QfIy6q3fxjXcf7HiTHP8AluMWzXkGiS+rCSe4XFRNv559KISV8HTkH6OSnRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715586739; c=relaxed/simple;
	bh=YiWQpfUVhz51i7pucjGEuihmfm4NGHURRmioxAE29UE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GPw5Z+ymLyzRGdTSNALv3RRgMS3ha1FhfVnifIGEnGg9oyJE+VbK3E1krwkr/mAC4xqh6r3g7IGPkoHJu5wVB6Ojz/nvR1UKg0C7iOLsOLxQJIpgsijl3ZZEhV3fWy97lltUDZiPilmPScN4gEQTMyRwzdppkXRBGzU0laRCNBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s6QTm-0007T2-0p; Mon, 13 May 2024 09:52:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s6QTl-0017yx-CV; Mon, 13 May 2024 09:52:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s6QTl-003CGV-0y;
	Mon, 13 May 2024 09:52:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH RESEND] parport: amiga: Mark driver struct with __refdata to prevent section mismatch
Date: Mon, 13 May 2024 09:52:06 +0200
Message-ID: <20240513075206.2337310-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2028; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YiWQpfUVhz51i7pucjGEuihmfm4NGHURRmioxAE29UE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmQcamEm8f/8ndx66W8FXd2QXBvygneFkpwEFpW /SGBWWKfA+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZkHGpgAKCRCPgPtYfRL+ TicvB/9lnHwgXeBOzFdnDPBkXdXlpczMnEnlrcXTOCZUT+jVPH3zRX2zkUhU8j8uqlOvlytJJ67 bfZdWvEgNZ4TqV0NmlQy6rLYx36s461++dB8nK5ZUfPGRhVTfIDg73LoQd4tPzEzaRRSBa3cxEw 0NAt4InL038wsaDuZYCkZrmXDItoyyKTSJomzDZRfobJ8yvCOv3n0i8mTcD8q5inRqB8Hw4fHiY /s7BuQzzZSgUEz0FsG54NfLCVutQEizTcYgKA/zScR/wbIGvaYxY/o+dfjnvPDO+sDWAQoY/8K5 5PiCO5+xmrxgFe/hBsLWM9WaS/3D+NkJ5au4kMGoPKxX+8Cq
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
Hello,

earlier submission can be found at
https://lore.kernel.org/all/49ab91032bf9b57cd5fb6d306c38884d059dce2f.1711748999.git.u.kleine-koenig@pengutronix.de
.

Changes since then:
 - (trivially) rebased to v6.9
 - Add Greg to To: as the pings to the parport maintainer don't seem to
   work and Greg was the one who applied parport patches in the past.
 - Additionally I held git-send-email wrong for the initial submission
   which made it a bit more complicated to pick up the patch, should be
   fine now.

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

base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
-- 
2.43.0


