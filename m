Return-Path: <linux-kbuild+bounces-1208-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3518587775C
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 15:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37438B21519
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 14:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37CB72D60F;
	Sun, 10 Mar 2024 14:39:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05D10EB
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Mar 2024 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710081564; cv=none; b=tTi1eDmw9iu2xEEBhe6TH1grNeqRmPPseBK0gLBvm0UcBhrEcASJ6X+C82LbNjy9eIFf9DqAuOvkjjG70c/CmD9LD0WRcCrUwKhV2gbxQ4Wp6Yz14VW4188U8W6cVbPWwZ7Ingj9mN6m/NLJEPNKNJ/C735t1oLV5PywWa9eCH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710081564; c=relaxed/simple;
	bh=tcCJcDqDYZaFzocjDP4wiXd1T+ypqrL+pY4JYmx+XM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eulaw1FHbVwIuG15sSCyersP2uYJLn/H8+60p7I/0ocHDuAzoFP/V0o/7Q4x/PGJD4Cqmq1yV305KqBhfvDlbrSFB5SfLFpqjDKyJqciUkv/EivjoUVOz+BOjUnCpMqzL6AxKNvWzungtrfH81QqrqgXUl3aDcnnUD7DftOrfRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjKKN-0001Cv-0y; Sun, 10 Mar 2024 15:39:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjKKK-005XJm-VP; Sun, 10 Mar 2024 15:39:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjKKK-003TZj-2p;
	Sun, 10 Mar 2024 15:39:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel@pengutronix.de
Subject: [PATCH] ASoC: tlv320adc3xxx: Don't strip remove function when driver is builtin
Date: Sun, 10 Mar 2024 15:38:51 +0100
Message-ID: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tcCJcDqDYZaFzocjDP4wiXd1T+ypqrL+pY4JYmx+XM0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl7cX8VWtYhL0KtuOOqhLGjI6fvbv4I6W1Z4U92 ZFLuAirQBiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZe3F/AAKCRCPgPtYfRL+ TvreCACBY53KQpaQ1S6h0Znmi9qhSZ9KGdIbyorjr/T8fAbh7lRp4Yt5ksFJlyqorX1/CRtMZ/+ f/IwumkOihqjbZZvEkm2RiaRJWh7zsaP1F3og52SGJw6r1LGdBGRvB5llSETqFB5Xv96GJlqCpc lu4yP20GOhukwEnAGWKh7zbRH0i8L/0UTI9sPvtgkJ5OeULSH0gYxF5Ji9jrGHRsUJ079s2frcY SoiZYns8FibUBnlCfNRj3aj+9BKf/K0Ku6C9BSjaz3T+FGQXOcJqVNWtXKzyrxJN/u+JdDthkPu gHEmE7wfmdR68YKkD+3eSiXm2VkUNQPK4IWzLbZ8gwKH9rq2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Using __exit for the remove function results in the remove callback
being discarded with SND_SOC_TLV320ADC3XXX=y. When such a device gets
unbound (e.g. using sysfs or hotplug), the driver is just removed
without the cleanup being performed. This results in resource leaks. Fix
it by compiling in the remove callback unconditionally.

This also fixes a W=1 modpost warning:

	WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) -> adc3xxx_i2c_remove (section: .exit.text)

(which only happens with SND_SOC_TLV320ADC3XXX=m).

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note that this patch only applies as is after commit 4e8ff3587868 ("ASoC:
codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in __exit_p()") which was the
wrong approach to fix the build error.

Best regards
Uwe

 sound/soc/codecs/tlv320adc3xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 420bbf588efe..e100cc9f5c19 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1429,7 +1429,7 @@ static int adc3xxx_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void __exit adc3xxx_i2c_remove(struct i2c_client *client)
+static void adc3xxx_i2c_remove(struct i2c_client *client)
 {
 	struct adc3xxx *adc3xxx = i2c_get_clientdata(client);
 
@@ -1452,7 +1452,7 @@ static struct i2c_driver adc3xxx_i2c_driver = {
 		   .of_match_table = tlv320adc3xxx_of_match,
 		  },
 	.probe = adc3xxx_i2c_probe,
-	.remove = __exit_p(adc3xxx_i2c_remove),
+	.remove = adc3xxx_i2c_remove,
 	.id_table = adc3xxx_i2c_id,
 };
 

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0


