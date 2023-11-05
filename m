Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB7D7E1402
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Nov 2023 16:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjKEPBO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Nov 2023 10:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbjKEPBD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Nov 2023 10:01:03 -0500
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6DAE0
        for <linux-kbuild@vger.kernel.org>; Sun,  5 Nov 2023 07:01:01 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecR-0002zF-7V; Sun, 05 Nov 2023 16:00:55 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecQ-006oU3-Am; Sun, 05 Nov 2023 16:00:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qzecQ-00DBt0-1a; Sun, 05 Nov 2023 16:00:54 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Damien Le Moal <dlemoal@kernel.org>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        kernel@pengutronix.de, linux-kbuild@vger.kernel.org
Subject: [PATCH 0/4] ata: Drop platform_driver_probe() and convert to platform remove callback returning void (part II)
Date:   Sun,  5 Nov 2023 16:00:35 +0100
Message-ID: <20231105150037.3724669-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.482.g2e8e77cbac8a.dirty
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zQwS8Il+WgtfBqkO69r1zQOhOBlGGdfD3HH7HJrmADc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlR64VeSiUDnZzDgKQRHabjxLzSqL9HyGnyr2AB NpP/+Jqwp6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUeuFQAKCRCPgPtYfRL+ TlA2B/4/9VMQvRNJN/yOZODybuHUfIiaVLoQu44ePCFv9bfdwm5S23DLJw9klopgEJHb3vOK0Mr a7sN9ABzdEnegf7HloWEVkMhJbhmmWKRchXXUGNYVLyoOj8UrQWpyiYYkYd236Rz9f7poRN7c74 c6DvrjX/y8i/kO9CgkZbEBPObQZxwkBZ/gy4PM9aLle3jzzaAH2VkhCyDJnIgSwBsqeQjmSWIVH yb3mAMqp3kF08Nw6O4MKnR1dI8et4ATut7OfgXmtxsQRcb1CVk3LbCBDNeT8VLwQyuWO8AAL2NY vXAkOlsImQyyVjEakHCkuTRUdp6AOoizuPjh2GRdVPMsOQK3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

there are two different types of patches here that would justify to
different series. But as the patches are not independent I chose to put
them in a single series.

The first two patches drop usage of platform_driver_probe(). This is a
concept that isn't so relevant any more today. I didn't check, but it
saves typically only a few 100k and there are thoughts to deprecate it
to simplify the core. Getting the usage right is not trivial though the
drivers here got it nearly right. The alternative to these patches is to
add __refdata to the driver struct ideally with a comment describing the
need like is e.g. done in commit 5b44abbc39ca ("platform/x86: hp-wmi::
Mark driver struct with __refdata to prevent section mismatch warning").
Note that the warning only happens starting with commit f177cd0c15fc
("modpost: Don't let "driver"s reference .exit.*") that is expected to
be part of v6.7-rc1.

The remaining two patches convert the platform drivers to .remove_new(),
see commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.
All conversions are trivial as the remove functions return zero
unconditionally. The other ata drivers were already converted earlier,
my coccinelle script just missed these two drivers (because of the
__exit_p macro).

Best regards
Uwe

Uwe Kleine-König (4):
  ata: pata_falcon: Stop using module_platform_driver_probe()
  ata: pata_gayle: Stop using module_platform_driver_probe()
  ata: pata_falcon: Convert to platform remove callback returning void
  ata: pata_gayle: Convert to platform remove callback returning void

 drivers/ata/pata_falcon.c | 11 +++++------
 drivers/ata/pata_gayle.c  | 11 +++++------
 2 files changed, 10 insertions(+), 12 deletions(-)


base-commit: e27090b1413ff236ca1aec26d6b022149115de2c
-- 
2.42.0

