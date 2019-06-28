Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE6359342
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2019 07:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbfF1FNK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Jun 2019 01:13:10 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:37043 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfF1FNK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jun 2019 01:13:10 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x5S5D3Fw018498;
        Fri, 28 Jun 2019 14:13:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x5S5D3Fw018498
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561698784;
        bh=MccXveOZG26PYdiGquuMm/Tsl+MQAw+vQFv/0yXKsJI=;
        h=From:To:Cc:Subject:Date:From;
        b=MOvfMF2J31Prif3h1vHtB2Z7iTX4kztLjn7qIIa4lZbfBqvr1TjSYRNtTOsyvkQe2
         kK01pSGcbAB6KP9BRTSDrkqWA2y+0DnKw5cX9tQVvG0On+6sMS8nYMVUOhkVPhPG/B
         7VX4FMeSCf4feE+AXRokVc28CmEDv/6xhJDSO3WnQZ5Bm9pU5NE+rMHVfTi7oEPPUY
         WPEmRmUdFCKAPzZOai1MFQnxrfn0z/WGY/J3n8LA58wFYy+yRIBeF3330hQ7hxaF8S
         D+YC7C9FsacDEHUryV1jqZXhPZgWMFgQ8pR9Y7onzWz67olHi+6Eu65gsValZ//cJR
         OilOeLI0GA9fg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: use -E instead of -c for __cc-option
Date:   Fri, 28 Jun 2019 14:13:00 +0900
Message-Id: <20190628051300.30678-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use -E instead of -c like scripts/Kconfig.include
This makes the compiler flag evaluation slightly faster.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index f641bb0aa63f..e4329b92d165 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -113,7 +113,7 @@ as-instr = $(call try-run,\
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
 __cc-option = $(call try-run,\
-	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
+	$(1) -Werror $(2) $(3) -E -x c /dev/null -o "$$TMP",$(3),$(4))
 
 # Do not attempt to build with gcc plugins during cc-option tests.
 # (And this uses delayed resolution so the flags will be up to date.)
-- 
2.17.1

