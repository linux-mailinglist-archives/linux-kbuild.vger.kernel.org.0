Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE08D122D94
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 14:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbfLQN4V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 08:56:21 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:43689 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfLQN4V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 08:56:21 -0500
Received: from orion.localdomain ([95.114.21.161]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MeTsQ-1i8yVi3lOG-00aWiV; Tue, 17 Dec 2019 14:56:11 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v2] scripts: package: mkdebian: add missing rsync dependency
Date:   Tue, 17 Dec 2019 14:55:39 +0100
Message-Id: <20191217135539.17157-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:WUPSATQufwv3g8sriCrzFFny9krz3puHsUsVhC/8qZCoO8QvHna
 pcDXn1rS776PGDUel6/bOG0/+NOXCUi2FtJwRiCp3RFiPENrDV3ByJxTMEXhjHxWSP7D614
 r080F0CHrFXg2C6rt3G1UhEueRdXw1uUmK8fSeWTUre4BMxuKFKSGezkv6DWc4Uax9sXT6S
 xHb/wFVa4HCiOcM5MuFxA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:akmmA8gGnfA=:gadcc7LVAR0Su+9V+MKzLc
 PPWOhg5p2ou9NQ1kL8GR4JDM6/n/Ea7aMJrX6RA64ny8ARrQr5qQ1GOJeDqNL6AXQ8KU5xbC6
 wKGIvoOUqEKLQsPW2a6C1CcRgJzZEkKMZSQCYOMJlFIvVD534smOJvxZe1WSXT6kraaAPNZnT
 yX2Fcj1AbZmXR4m+gq/TmRxXS7rBzqRx5Tv1Ud1q9NMrmoopN87B/DT7aYq5T2ybFdUFbcvFS
 0LWhTuc+tGaoopq/yDLGXNBTQrZbPjpxc/Z4ysA1UAuA5N6PT4lapB5MLYGza04BqR43sPjPx
 2+kb9rcHA1skoadqOoD7f0TUqxUursjfxmMocZiPAC3dYOy467gw/6ci8qepH+fVpLSzwE212
 m8i3PxqFn/HWDOCiGv8alZKy7m0fM+4BrJGiuity7N0j21ZfuX4KrKxMKwBQEN1IFwR0L/KDw
 Zqed4ehrbW5tdFFe+KqMWJrPJ7rOS79T39PffLiqUAubZTBWA0gkjqJ5EmsS4pxzWpGftzsdC
 EC6t032IC7/VD8//MkIcHCXf6IOtJ9b6u5BrN2qGfBv22BBxESN3zEqeDyUNzJTB/aghmqsuA
 26wpLNBrFwTDOMGGqF021X7n4N474+P1WIpb5xkrL14FkAx27M6sOYOvfQa47mSgou9wBsOz8
 9gK5Eus47BXB3IPGIF1M61rQEZpQ5pFkHyQOgcRjI/HUcI3wXnnuiKYwPHtfP/VOBCh6RiJPC
 OSZDGCSnTy9858bEi725NL8ZjbMMRkAOk7z8Pz+jwP3M64C0v6nom9cyRnelx7AVRTUSb7LVS
 neW8I2kQKR89MrnXepuAnmXO74YUJ/a6HhU/CDvL8LLVJyAghLA3eGiqybEVbnjbGmCobqX+k
 bhgflO3FhirHN9ARfrRw==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We've missed the dependency to rsync, so build fails on
minimal containers.

Fixes: 59b2bd05f5f4 ("kbuild: add 'headers' target to build up uapi headers in usr/include")
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

