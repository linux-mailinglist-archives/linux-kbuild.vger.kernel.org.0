Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9082A65198
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbfGKFq0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:46:26 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59526 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbfGKFpz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:55 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8Q031345;
        Thu, 11 Jul 2019 14:44:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8Q031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823896;
        bh=1zEZHAW0UpTSAns9BBkOgZFy59b+y/4j41w96kvIZ+Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G9HS4ZmBuLG3L98G76TzvdwLRWUjZU78qt+ES9tTxhlzPWOFwsgPsbVLHjglL8kvQ
         hbg5pY2s6o5wEuZN1Kl27fO0NqkDOVWyJ3aTokFSk+RI+pSpTX1DeuYNxVJ0Cy1Lvd
         fMZtfyaioNI0HgIsrPdwLj540EOcTokB7xK/KYZOPfsMwYiD4hNyB3bHmRVz54y0pp
         zFfi/0Y2H52/KbLxpJQn0EDOEg0ev1cLrHpYWd3ziHTnH7C68i/4Ws45P2HrLeYt2X
         eRRQ3Uiv1sG71oNfaEa67YbosbyH4DGDYrXg1DUaPD2ihc1aNcR+JAxcltcMrZzB4u
         ld3fC6bbVTaXA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] kbuild: modsign: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Thu, 11 Jul 2019 14:44:29 +0900
Message-Id: <20190711054434.1177-7-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Towards the goal of removing MODVERDIR, read out modules.order to get
the list of modules to be signed. This is simpler than parsing *.mod
files in $(MODVERDIR).

The modules_sign target is only supported for in-kernel modules.
So, this commit does not take care of external modules.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.modsign | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.modsign b/scripts/Makefile.modsign
index da56aa78d245..d7325cefe709 100644
--- a/scripts/Makefile.modsign
+++ b/scripts/Makefile.modsign
@@ -8,8 +8,7 @@ __modsign:
 
 include scripts/Kbuild.include
 
-__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
-modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
+modules := $(sort $(shell cat modules.order))
 
 PHONY += $(modules)
 __modsign: $(modules)
-- 
2.17.1

