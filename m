Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32499370831
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 May 2021 19:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhEARZr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 May 2021 13:25:47 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:45802 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231996AbhEARZq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 May 2021 13:25:46 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 141HOcsa024068;
        Sun, 2 May 2021 02:24:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 141HOcsa024068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619889878;
        bh=hVpw+ourWG6FKHPaCRZLRYEujZAsRPxM87/JFp4mk1k=;
        h=From:To:Cc:Subject:Date:From;
        b=v5c6VEpe/0yUD8IEJz2GmTgp3Vitwf1b8MWcVvdSr//4OLeJsreVYBzQh4VbJ21OX
         suw9iPSIngAXLCqGrBEYQiNqqQ13IGrBydcXQrZkZASDoaKAtd1/wJS2/7XZ+Yr3za
         P+JpQIYriHrW9ucMzSXe2PpouDSbjXTAV0eSlF+BscYv+MYon/fNmlKv/uysub8PF0
         aP1wyOQudwODPfIeKUSeEf3xtMpbjpgqFnXr8ap8hRHStYvHy9bHi2qiR1o9WM7fm5
         d3IvAlhhHFcXmA7yCDO7igKcl0pF1StCskDhqjq+VsabFynCFt/4I+OrHwBXFNR2nc
         0Wyg35HxxKHjQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: remove ARCH=sh64 support from top Makefile
Date:   Sun,  2 May 2021 02:24:35 +0900
Message-Id: <20210501172437.156926-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 37744feebc08 ("sh: remove sh5 support") removed the SUPERH64
support entirely.

Remove the left-over code from the top Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Makefile b/Makefile
index 3597fd75d5b5..cbf4b18cf51c 100644
--- a/Makefile
+++ b/Makefile
@@ -399,11 +399,6 @@ ifeq ($(ARCH),sparc64)
        SRCARCH := sparc
 endif
 
-# Additional ARCH settings for sh
-ifeq ($(ARCH),sh64)
-       SRCARCH := sh
-endif
-
 export cross_compiling :=
 ifneq ($(SRCARCH),$(SUBARCH))
 cross_compiling := 1
-- 
2.27.0

