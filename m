Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2129814F
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2019 19:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729552AbfHURdM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Aug 2019 13:33:12 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:18151 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbfHURdL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 13:33:11 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7LHWoMD012674;
        Thu, 22 Aug 2019 02:32:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7LHWoMD012674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566408771;
        bh=bQwdZWB/Tflkc18176JRhMFX7d8J4tn50Ll0eJO7ghQ=;
        h=From:To:Cc:Subject:Date:From;
        b=0/f0k9B5tgknvpUWCf1M9qoiwkmsdRzyt5Zy+AtmaLG4Vlm+m3eDoQhn0FJ1Yb3Um
         I6X4hzWYhZKV36yAAKZ+fKFhiOGGNYfjLTSbcUO1/lgzVxhM7QexxBxl+BhKo7hQXc
         T5oz33PcdZVeTTnSEW8d4YOR+W3BmjWtbGDhh3Gf8H+QG1UVPEkdgnoD3x9LP5lwpq
         /pznT6w2OpU4LD2eZCnnTH+Fo/hYphSRgfrgevaQUHUbaXoce1FgC/cpjbDV3/d4fY
         YgPWIKsAYFFfZNJpluj0RATLGJB0UCBpIUYmjvQPRWaO2qbX17qcIk/frzDeur1Y84
         PZuz833FvBTZA==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unneeded comments and code from scripts/basic/Makefile
Date:   Thu, 22 Aug 2019 02:32:47 +0900
Message-Id: <20190821173247.14933-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kbuild descends into scripts/basic/ even before the Kconfig.
I do not expect any other host programs added to this Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/basic/Makefile | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index 548aeb592806..7c9cb80d097b 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -1,16 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-###
-# This Makefile lists the most basic programs used during the build process.
-# The programs listed herein are what are needed to do the basic stuff,
-# such as fix file dependencies.
-# This initial step is needed to avoid files to be recompiled
-# when kernel configuration changes (which is what happens when
-# .config is included by main Makefile.
-# ---------------------------------------------------------------------------
-# fixdep: 	 Used to generate dependency information during build process
+#
+# fixdep: used to generate dependency information during build process
 
 hostprogs-y	:= fixdep
 always		:= $(hostprogs-y)
-
-# fixdep is needed to compile other host programs
-$(addprefix $(obj)/,$(filter-out fixdep,$(always))): $(obj)/fixdep
-- 
2.17.1

