Return-Path: <linux-kbuild+bounces-1404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F189267C
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 22:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 019B3B2318B
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Mar 2024 21:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C024213C9B9;
	Fri, 29 Mar 2024 21:55:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D1913E8AA
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Mar 2024 21:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711749300; cv=none; b=bJmWznSlrDz1UZu0OboqLCZQT5sA96avzBPTdQia69yMOOqijw7mWW+lP3F9PSKy9PIubbwChIGGzG5ferPVH6GVWpMx+776THbMwXlwKAGF7WuCFdzaZyOEm+XcsONTr78DJCus1mDeOtRAP3MadHHyyRvSeVt3cl5GqG2oJsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711749300; c=relaxed/simple;
	bh=55ielaMdCo8NuhRMyayKJKpy7EfE8De+nbULEuRF+Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YYKGwSIE49TWWk/B9wKLEBA9L+jVC3IX0bsJAkJQobCZG7QQmDo7V2fpct6LvKgC8ZvOvbZVnE7NCOxpfxQkzFq24GSEZCmUCFkbvP0mwuddwgMJzjTNmDEH5N/jXxKguCWYJAjfdJ2SCFHDhvOlBn8LKeuTMfx4syLI54jB9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBY-0004gh-8s; Fri, 29 Mar 2024 22:54:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-009GMK-L7; Fri, 29 Mar 2024 22:54:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rqKBX-00DTk6-1r;
	Fri, 29 Mar 2024 22:54:51 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] OSS: dmasound/paula: Mark driver struct with __refdata to prevent section mismatch
Date: Fri, 29 Mar 2024 22:54:42 +0100
Message-ID:  <c216a129aa88f3af5c56fe6612a472f7a882f048.1711748999.git.u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=55ielaMdCo8NuhRMyayKJKpy7EfE8De+nbULEuRF+Wk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmBzimrhUDxeR5t7sUYuBLCronWqDYUniezvvXV EiVKgRkH6CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZgc4pgAKCRCPgPtYfRL+ Tss1CACNzk+Hwa8QKejErFP909TZkyw7uzqy8KyLXO9jdRmi6XSF2cDpyYcTiQtyf0mqNVR98eB VVxwL8Wj5pm4httcQG07xEYCOXvohOvoSUfKCLIauqr+RNpmYn8q5nC5xhmglkFZAJsAJuRz3d+ /2IS4t5h1WS0fknIG26uGXpE1RetxL1bU/mAUgoFVzl/ysQFyAz8KChilZrtS98+guNftjWSeA1 CZCKs78BI8gflwo168exmdMVwmrZm61LxZ730SBOQXLzmpd1InHKEhn2gakrZmg9tqJsAsyNdWj xHoVBK1HstTKl9KG0HZX44oH3TeZX5lBimyFNBbLmKqlELpq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via module_platform_driver_probe(). Make this
explicit to prevent the following section mismatch warning

	WARNING: modpost: sound/oss/dmasound/dmasound_paula: section mismatch in reference: amiga_audio_driver+0x8 (section: .data) -> amiga_audio_remove (section: .exit.text)

that triggers on an allmodconfig W=1 build.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/oss/dmasound/dmasound_paula.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/oss/dmasound/dmasound_paula.c b/sound/oss/dmasound/dmasound_paula.c
index 0ba8f0c4cd99..3a593da09280 100644
--- a/sound/oss/dmasound/dmasound_paula.c
+++ b/sound/oss/dmasound/dmasound_paula.c
@@ -725,7 +725,13 @@ static void __exit amiga_audio_remove(struct platform_device *pdev)
 	dmasound_deinit();
 }
 
-static struct platform_driver amiga_audio_driver = {
+/*
+ * amiga_audio_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver amiga_audio_driver __refdata = {
 	.remove_new = __exit_p(amiga_audio_remove),
 	.driver = {
 		.name	= "amiga-audio",
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
-- 
2.43.0


