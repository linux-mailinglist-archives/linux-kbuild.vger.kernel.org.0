Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C3333A09D
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234408AbhCMTtI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:08 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39828 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef9018162;
        Sun, 14 Mar 2021 04:48:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef9018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664926;
        bh=oo+l2GrPRSzBEaYQadAcSoXEI2jsSrvlSeuPRjoV1tM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N+uqGiE7IyoeZUG5Hs41pT9qM3eflkPWg9Bu5W2gzax+UdoHc/0Yu+v3ICUEFO1B9
         lANGAZjPbgHoUxQxCwRGUmISj4oFMNeZhhwdlQ5Y1gTWIxD2epXioWt9ZGf06VWZGL
         pJQFCqknaj4JafDM33LHCmB+S0jzUSaEYZJ3HyfXksjkLNWpFQEE5Hsc+r/7fX2AgA
         LYMS+zfeb3h82AlDNm0/0AJysx2xwsd7x6OX0iG4EdhJi5zSN/uXAvI4k2bkgZUyYZ
         p9fvdyfapGGHtH1t39FTceVDgv1Z5//3lwWCoutNW8HhUNC3iGoR0UDfQEqrXZ3D6K
         /fI6av3EiED2A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/13] kconfig: move default KBUILD_DEFCONFIG back to scripts/kconfig/Makefile
Date:   Sun, 14 Mar 2021 04:48:33 +0900
Message-Id: <20210313194836.372585-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a partial revert of commit 2a86f6612164 ("kbuild: use
KBUILD_DEFCONFIG as the fallback for DEFCONFIG_LIST").

Now that the reference to $(DEFCONFIG_LIST) was removed from
init/Kconfig, the default KBUILD_DEFCONFIG can go back home.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 | 3 ---
 scripts/kconfig/Makefile | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 31dcdb3d61fa..7d2304155e93 100644
--- a/Makefile
+++ b/Makefile
@@ -395,9 +395,6 @@ endif
 KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
 
-# Default file for 'make defconfig'. This may be overridden by arch-Makefile.
-export KBUILD_DEFCONFIG := defconfig
-
 # SHELL used by kbuild
 CONFIG_SHELL := sh
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 31c5735663c8..7df3c0e4c52e 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -9,6 +9,10 @@ else
 Kconfig := Kconfig
 endif
 
+ifndef KBUILD_DEFCONFIG
+KBUILD_DEFCONFIG := defconfig
+endif
+
 ifeq ($(quiet),silent_)
 silent := -s
 endif
-- 
2.27.0

