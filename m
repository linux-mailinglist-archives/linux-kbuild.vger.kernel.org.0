Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9C936A1E8
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhDXQCS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 12:02:18 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:42523 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236613AbhDXQCR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 12:02:17 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 13OG09Gi030091;
        Sun, 25 Apr 2021 01:00:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 13OG09Gi030091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619280010;
        bh=ous90V3OsRa1CNPNiQRPMCNr53qr6PnxFFBb49TjtDY=;
        h=From:To:Cc:Subject:Date:From;
        b=Hzy8HpG8gAW0rq0UNe1mj2Xl1WWrEx1CptgBBTUdIpvIM/4o61pPUPcfTTQKo4zpc
         wOjAKUWaez/s2O9xQnwUg2BhcKtsTTf3VHNb1fkNhNAQ8zZgxFdRxx4LZkOx/affHa
         hJhJsYdOg2re4FTEbssO7WrFnbnvpLlmAzQr2zAi6Y72zqKVq2d5My/Xeq38syn/ZT
         MwVSL9V3A9P2lFaB1TJy9NjM9TyZu6y2mxhheUeJWJ9Gv/u7FN25ZMtDJ3Fum9OelG
         JIRCK+SW0wOWT/5TH9P1CR7WNTqJbBljqKkgLMSL6pdKU84lGyNcd4jW0W8kWaldPV
         FGDBAN5ghXs9A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org, patches@arm.linux.org.uk
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: boot: remove redundant piggy_data from clean-files
Date:   Sun, 25 Apr 2021 01:00:07 +0900
Message-Id: <20210424160007.819275-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kbuild cleans up files listed in 'targets'.

'piggy_data' is already added to 'targets' a few lines above.

Adding it to 'clean-files' is redundant.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

KernelVersion: v5.12-rc1

 arch/arm/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 182b300e3f8a..e046e78e7945 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -100,7 +100,7 @@ targets       := vmlinux vmlinux.lds piggy_data piggy.o \
 		 lib1funcs.o ashldi3.o bswapsdi2.o \
 		 head.o $(OBJS)
 
-clean-files += piggy_data lib1funcs.S ashldi3.S bswapsdi2.S hyp-stub.S
+clean-files += lib1funcs.S ashldi3.S bswapsdi2.S hyp-stub.S
 
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
-- 
2.27.0

