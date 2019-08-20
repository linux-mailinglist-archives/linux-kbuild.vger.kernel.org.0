Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E13396721
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2019 19:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbfHTRKZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Aug 2019 13:10:25 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:45826 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbfHTRKZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 13:10:25 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7KH9n49020646;
        Wed, 21 Aug 2019 02:09:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7KH9n49020646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566320990;
        bh=NX+Y5RmE+GMCx3VPH/N13pbHW6+fZL4TprkkbxCZzTA=;
        h=From:To:Cc:Subject:Date:From;
        b=CeHhXalJuSQA8t5jvXhsUEcBno1LH0g/7/wBeHXqHemLSXlyo+TOq1pHDHA+MpYiD
         UK1RCeZBWi2T/yGyaZYs1+p3f9GPKzxixFlYjDfsueoUVzUZwx1OrL/6X2s8+o5JTa
         WF51kTWXfKc6vUW0dpZZkQ9f3dmFlTGUUGfYPQmWcQ8iJKOHnLYWaeE5MkDH0n3a8j
         6ZbZ4eehAf1UpFsiBhgUy63edhVCWz1zuGwurdZ52Z0GVnnTYIEmbDjpBNLgAq2Ztk
         lGXEUjn270PiEuE1onY/yluLSbUB0bDEjd26H6ChvB3GyLE+1h8L2NEMWYUCZmXaYe
         t1J9YxjWEICjA==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] init/Kconfig: rework help of CONFIG_CC_OPTIMIZE_FOR_SIZE
Date:   Wed, 21 Aug 2019 02:09:39 +0900
Message-Id: <20190820170941.26193-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

CONFIG_CC_OPTIMIZE_FOR_SIZE was originally an independent boolean
option, but commit 877417e6ffb9 ("Kbuild: change CC_OPTIMIZE_FOR_SIZE
definition") turned it into a choice between _PERFORMANCE and _SIZE.

The phrase "If unsure, say N." sounds like an independent option.
Reword the help text to make it appropriate for the choice menu.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 init/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index bf971b5c707d..149efd82447f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1219,10 +1219,8 @@ config CC_OPTIMIZE_FOR_SIZE
 	bool "Optimize for size"
 	imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED  # avoid false positives
 	help
-	  Enabling this option will pass "-Os" instead of "-O2" to
-	  your compiler resulting in a smaller kernel.
-
-	  If unsure, say N.
+	  Choosing this option will pass "-Os" to your compiler resulting
+	  in a smaller kernel.
 
 endchoice
 
-- 
2.17.1

