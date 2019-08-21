Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93AC098152
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2019 19:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbfHURd0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Aug 2019 13:33:26 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:47224 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbfHURd0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 13:33:26 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7LHXN4w001231;
        Thu, 22 Aug 2019 02:33:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7LHXN4w001231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566408803;
        bh=FWLOsLMyG8SdF1ynX91dJ+VEXKsmHh2Dx8rMCw1Xm3g=;
        h=From:To:Cc:Subject:Date:From;
        b=1gLNEnEYFhano6qbx1pMFBihVEp8LVQqQVKeLlZlm0bHtOI/1Hpn8pPvaQtVicSeC
         xxruAa0M0ZBG5XhrpWmzgGp7dA5bBKf6xSJVquT4TmZUuiI3eJ7pneYwDldVt5qdfx
         EcW52BVox9fOOSbqs6jnJJYZ35oaPelyPexpk3bFTMrx2X1fER3K3VVR0BQe6AEDYz
         LXuCjJ98ruXyHPlUeDajNWsrDX28zmBQC5o0FBE8wwkjg5CqDXTqAEvAUhRu4qCOIi
         E7IYpN+PwKNk3tvm2GceeWyOw9QkM7hRZDR9RufxHboZO7FFB1aNUpiDwS1r6WQiiB
         Q0jfK+uDC4U3g==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unneeded dependency for $(DOC_TARGETS)
Date:   Thu, 22 Aug 2019 02:33:21 +0900
Message-Id: <20190821173321.15012-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 415008af3219 ("docs-rst: convert lsm from DocBook to ReST")
stopped using if_changed_rule. No more users of if_changed* for the
doc targets. Hence, fixdep is unneeded. Remove the dependency on
scripts_basic.

All the doc targets are phony. Depending on FORCE is odd.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c0be1a4dbfdd..7e54a821b4b0 100644
--- a/Makefile
+++ b/Makefile
@@ -1578,7 +1578,7 @@ $(help-board-dirs): help-%:
 DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
 	       linkcheckdocs dochelp refcheckdocs
 PHONY += $(DOC_TARGETS)
-$(DOC_TARGETS): scripts_basic FORCE
+$(DOC_TARGETS):
 	$(Q)$(MAKE) $(build)=Documentation $@
 
 # Misc
-- 
2.17.1

