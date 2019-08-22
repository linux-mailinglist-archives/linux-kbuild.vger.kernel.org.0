Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8003898A87
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2019 06:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbfHVEqf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Aug 2019 00:46:35 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:29727 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730905AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7M4kEYk001492;
        Thu, 22 Aug 2019 13:46:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7M4kEYk001492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566449178;
        bh=qUMeOvsH2PJ92pYaiUPXJnmgv8wzxTsns//qrBBelrw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ukNEEp0bnnzgMTNO6zcBJP1NojCo9Td3jckZzfz+VtHhbe5Yh8i496X1+WYcAP0Xh
         Mvrq39x/ipDBF3/vDZxGDdSf9Vqk4PqOSboyR+Zm60vchqNaMUeIl4DJvHuqrht6zz
         uwuHWhDH1yQKKgBLkYyVLXtp6cBQBCMAY52nXekony9+QBduLwTeJb9Q+ReLq4TS6c
         V9Ms86SteH17cF1Uz4d3gLLiZNlAyf62RxjAxaFDGFKyE07iSKWSwrqXo52jX3VhMB
         ooyBh863rRnwLsJLhbLT3B/ro2Vbird/InXvUSa01q3FdCjNGy062V4hAjteM7NQ+C
         /B3ZeBmNXUWOA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] kbuild: check clean srctree even earlier
Date:   Thu, 22 Aug 2019 13:46:13 +0900
Message-Id: <20190822044613.5349-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Move the outputmakefile target to the leftmost in the prerequisite list
so that this is checked first. There is no guarantee that Make runs the
prerequisites from left to right, but at least the released versions of
GNU Make work like that when the parallel build option is not given.

Of course, when the parallel option -j given, other targets will be run
simultaneously but it is nice to show the error as early as possible.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 960df4d35b15..089983a8a028 100644
--- a/Makefile
+++ b/Makefile
@@ -581,10 +581,10 @@ ifdef config-build
 include arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
 
-config: scripts_basic outputmakefile FORCE
+config: outputmakefile scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
-%config: scripts_basic outputmakefile FORCE
+%config: outputmakefile scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
 
 else #!config-build
@@ -1123,7 +1123,7 @@ scripts: scripts_basic scripts_dtc
 
 PHONY += prepare archprepare
 
-archprepare: archheaders archscripts scripts include/config/kernel.release outputmakefile \
+archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
 	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 prepare0: archprepare
-- 
2.17.1

