Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76DFB121A8B
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2019 21:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfLPUIb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 15:08:31 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:35153 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbfLPUIb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 15:08:31 -0500
Received: from orion.localdomain ([77.2.141.144]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MeTwY-1i6VS22h3k-00aXtK; Mon, 16 Dec 2019 21:08:18 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] scripts: package: mkdebian: add missing rsync dependency
Date:   Mon, 16 Dec 2019 21:07:19 +0100
Message-Id: <20191216200719.30479-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:X3dLwHI5BlJvKUqov+BBRxI2y/lv6j7c5H9Exq3erg81r0oXhJV
 fNVV0JAb3EXCrDStihXCM7spxv21WfLySYZWlSiPqIdOG3Mdoi4Mq/1x1YR2HUp3iIrzEzL
 zwGLNs0H+1m6sPIbvCjzMARuWMD+XkhB1B/GMh/oiAdVJeCAYOWaftljzuhFVGpZ8w9G7Ww
 zkv8KdfjfJcSMS1Mr28rg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gJcpD6BR8ag=:LFBKzkBFmfJiXCCHB5+tD2
 K02F0tflYl+vUPuovo2JPLQ3IGetPSmvxTZ4TJlnIu+knZoZZRx1L5ORkwALl+pR54fnFOKJL
 4aqu5XEZulrjHAWPqmwInktfbYghJH5/JqavTZqHEeTunLLe7sBlN26SJewzYVwO+YYOI/rXd
 mw5geX5+WXcwLjrbcnO8jzyvuW7lLhK6dWP8gumZVZb5Bc3xRv/aEJ+26XrURyihqnpGBL2Zo
 It0uDX57BXKKatifwXOtphjtfWIvFJBdN1SH54UG/wCiHtNaYo9OjaOZlozhGuQxWGFT5DBR9
 TqXW8YyEn+zwuUvs+fJgzF+X3I3MzYC/yqCKdpBzmge9cajpQUyzuI90hr8gjlMKnS6ytRFU+
 b4O048ZmxsTUJsw/ILXkGzklqF04VLBrcsX7OAy2B5Sxct/+AGm9OxtAqNhGwtgQ9+eabagRL
 pfaKCL3NxxEeVrB6tMvUgALC6EACdO++ljrZ2zXv5ES7Jl30i/WgxWThbsJdp4ch5aD6vC471
 rAjNgUpLvGskfU3aHFZ8Jxjj4dADn7ASAeLKmTT+DuZR+mqNX86P0c/4GIJiVpvUrOtvwZxc8
 m45910fXufUk7Grja3W0sKGSE2lBfgVAqRYj9DZJoIXc7ncwk1PwXEOhsqFOAnf45ncTcxxZY
 xdgi7OxncQ/iwwm2AgLDM0GKH4nHtpcC5qkemnVkn/Z+NvEwori+0FG1kQmPjhG+M0wTeIrKZ
 6iBzYgWWi5Vbefy8Fo7KTKtDUeEJGSXe7Vl62twFqPWl0Y//uxxOLoS8lCdby1xhac3slwQAh
 RGyRMKi87N6QS1Yc4svyNdHGn1zLeAJ/cZd3ewWpVpsD1V4hl2zT2rMJRehUsM+hJx3NermA1
 9kjqKN2V4JbTmc7zh47g==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We've missed the dependency to rsync, so build fails on
minimal containers.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index e0750b70453f..7c230016b08d 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -174,7 +174,7 @@ Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
-Build-Depends: bc, kmod, cpio, bison, flex | flex:native $extra_build_depends
+Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
 Homepage: http://www.kernel.org/
 
 Package: $packagename
-- 
2.11.0

