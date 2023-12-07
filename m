Return-Path: <linux-kbuild+bounces-280-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F18089DF
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 15:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D9E1282922
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Dec 2023 14:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D9B41761;
	Thu,  7 Dec 2023 14:09:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C866510EB
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Dec 2023 06:09:46 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4P-0001Zy-Nc; Thu, 07 Dec 2023 15:09:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4O-00ECiy-OJ; Thu, 07 Dec 2023 15:09:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBF4O-00FvTJ-F8; Thu, 07 Dec 2023 15:09:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 0/4] hwmon: (smsc47m1) Various improvements
Date: Thu,  7 Dec 2023 15:09:28 +0100
Message-ID: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=609; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=fHvbpfMrvpBdqKEQUWQORR+LS3Q8rf0Gl76YafZ0NQ4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcdIX+cNhPvU65mGxjN/jXrEE31+YTF2yb94Ro z2Bn/ILdyaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXHSFwAKCRCPgPtYfRL+ TlpkCACuFGTtsXCR/9RGUk2P5nqr4ZN4SDCsbsHBHLtTwioBpK0apURTRad0kX3OKEf0nEE19BN 5Jk6dHt/v3K0CUCZhNx4qG3f48/SnfuR+8olewmFi3kyWuHKOljWIqYBnEe+8MFXgU3xdVkfI3q tSEspK7hFHae849RNwOFAi9zE02hnxLOQsv4A1UbDjd763lz6vLkrDwkw1zhLHIWyetoqkmfwI7 IFyPGU3T4enNY0qlhGpDEnxK+zBhAtjuaqzNiWjWd4NorUdqr5py3SXhCjG3LmgLOvftPBapaZ1 Md80ANKczqBMxdHaWMiycxvYrffuQvfiAshfKXHC4NgnkMus
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Hello,

I looked into the driver for patch #2 and found a few further patch
opportunities.

Best regards
Uwe

Uwe Kleine-König (4):
  hwmon: (smsc47m1) Mark driver struct with __refdata to prevent section
    mismatch
  hwmon: (smsc47m1) Convert to platform remove callback returning void
  hwmon: (smsc47m1) Simplify device registration
  hwmon: (smsc47m1) Rename global platform device variable

 drivers/hwmon/smsc47m1.c | 68 +++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

base-commit: 577a4ee0b96fb043c9cf4a533c550ff587e526cf
-- 
2.42.0


