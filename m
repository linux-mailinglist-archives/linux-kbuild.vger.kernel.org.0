Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD6798A8B
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2019 06:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731057AbfHVEql (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Aug 2019 00:46:41 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:29728 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729695AbfHVEq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Aug 2019 00:46:29 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7M4kEYj001492;
        Thu, 22 Aug 2019 13:46:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7M4kEYj001492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566449178;
        bh=cZJ6kAU3rAstEUyLNxh1UUw2rnNTVUvdToMaj9qT4sg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UodDF6FhlhdQ2jScgiH8CH9f9iZPFO471syE+3a6wyPpSV1np5LeuOmNblK9Tmwv5
         fBiXkfQEuEdyCA+B7eLvHXpaSvm8X4GepBfbM8GCt78nzI4rnlRXPqtVUPTAvsoTui
         ousZF2aSC7jKIe2PIuBCG/0y6jThnE+UOAcJJqa65sB6ZwxhmYkIoFFHhG1hQnlH0E
         fdcvb0QBmoLSOwVj/M5CvFXoz6K9fZRoLVkkNVQJwhkPqqcyUCI0bY3iQwOaT/N7Om
         gvjYRHrQMkcCPpcnrY1MecF5mQAfIiJ/7hOR1D5Dwx56eu+GK5f7qdMjTayH1McEc9
         u3ffWNEvnHoYg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] kbuild: remove prepare3 target
Date:   Thu, 22 Aug 2019 13:46:12 +0900
Message-Id: <20190822044613.5349-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822044613.5349-1-yamada.masahiro@socionext.com>
References: <20190822044613.5349-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now prepare3 does nothing but depends on include/config/kernel.release

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index ca6851f5ebc9..960df4d35b15 100644
--- a/Makefile
+++ b/Makefile
@@ -1121,11 +1121,9 @@ scripts: scripts_basic scripts_dtc
 # archprepare is used in arch Makefiles and when processed asm symlink,
 # version.h and scripts_basic is processed / created.
 
-PHONY += prepare archprepare prepare3
+PHONY += prepare archprepare
 
-prepare3: include/config/kernel.release
-
-archprepare: archheaders archscripts scripts prepare3 outputmakefile \
+archprepare: archheaders archscripts scripts include/config/kernel.release outputmakefile \
 	asm-generic $(version_h) $(autoksyms_h) include/generated/utsrelease.h
 
 prepare0: archprepare
@@ -1261,11 +1259,11 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: prepare3 scripts_dtc
+%.dtb: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
 PHONY += dtbs dtbs_install dt_binding_check
-dtbs dtbs_check: prepare3 scripts_dtc
+dtbs dtbs_check: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree)
 
 dtbs_check: export CHECK_DTBS=1
-- 
2.17.1

