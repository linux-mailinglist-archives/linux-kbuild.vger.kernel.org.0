Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F07765195
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbfGKFqZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:46:25 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59527 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfGKFpz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:55 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8P031345;
        Thu, 11 Jul 2019 14:44:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8P031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823896;
        bh=6aRVUmTSBwVJYpeiNrND1Xnxtiy5tFvj/eUl4BEOmnc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gI/Vgxkl42D76bzIw86W0xAvgqd/+P9LGeK3eqdoNY+/3cg32JjQiPq+OEI5ruDDa
         53++i6RCIod+sjVonx9UOF0AwIH8wwyq+kz98nq1muLri3nAmE+/CY0hSD8vYgThxN
         xlluPEopOqRYPImPeZwz+pPjZ/CUOhFu0eRVuAXpLqSFg5cJow8jRY74FA0GNoS/zM
         v7VRJyoDyUx5aGxAtrYOA81J0VHJsSGZmLvcBY2QTHd4XpRw6RHIf529efE1P/YQxk
         RpokO3chRPcsLuBW6FmfUYun6h5aivyvfGhM3tSHAUgcYusgAmO6s+yO3sc9mLklIj
         wWGw2od18x9UA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/11] kbuild: modinst: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Thu, 11 Jul 2019 14:44:28 +0900
Message-Id: <20190711054434.1177-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Towards the goal of removing MODVERDIR, read out modules.order to get
the list of modules to be installed. This is simpler than parsing *.mod
files in $(MODVERDIR).

For external modules, $(KBUILD_EXTMOD)/modules.order should be read.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.modinst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0dae402661f3..5a4579e76485 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -8,10 +8,7 @@ __modinst:
 
 include scripts/Kbuild.include
 
-#
-
-__modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
-modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
+modules := $(sort $(shell cat $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order))
 
 PHONY += $(modules)
 __modinst: $(modules)
-- 
2.17.1

