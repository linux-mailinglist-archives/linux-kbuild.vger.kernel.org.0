Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A7D36A1E0
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 17:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhDXP7I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 11:59:08 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39541 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhDXP7I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 11:59:08 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 13OFv5xR028081;
        Sun, 25 Apr 2021 00:57:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 13OFv5xR028081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619279825;
        bh=NuXRvfs0Q5dzi5osb91zIbmohenOFhQpArES4Qc4S3c=;
        h=From:To:Cc:Subject:Date:From;
        b=ghLrBxrsBqTnCnsy3bjHle+bxitLkyWAG7Gf1jM2kWYCN9SQlC0/a0842CNswSTqS
         NyFVzPgdTZxmNd1My0Rpsw24gqal8yZGTrCVbgI0qzhdKqYVoXxkfSbIP5yBxEb/ak
         Jevt9y81nrcemNgCUsxDWeXngfGTq7C2TrhCm7jDewCmjtDHPAvMaHMaT7+G2iPCDH
         3zNW77NJx3j+pkW3zJKu3s3BZ5DEglHAyXgr55dOQiPURH0EKPeGB8Ys4oC5pFjCxp
         PWsSXDRxVVSgcGSV24JumtHYnDBmIIdQhjtNzzjPZZFLvXZy7/qdzI4LS/DhiKbn6b
         RxAKpnMhtYg6A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org, patches@arm.linux.org.uk
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: boot: remove redundant piggy_data from clean-files
Date:   Sun, 25 Apr 2021 00:57:00 +0900
Message-Id: <20210424155700.818824-1-masahiroy@kernel.org>
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

