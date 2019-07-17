Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CEDA6B67E
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfGQGS0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:18:26 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:62957 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfGQGS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:26 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6I5Oh009435;
        Wed, 17 Jul 2019 15:18:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6I5Oh009435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344290;
        bh=+yHX6hQw6OuR92f/Hwcn458uT44htMCycbRv85DrcTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WnnXStxnJFNvoFfWAQmGD1Nbi4KX7Y2o6KZ5tH7MndH+tuICLHarIOUq1rYFe0pqm
         mQJvAhWDUo16SQ/26eHp0GTuiWRFU4EzJoXOtMMQaza3xCNhWVqPnJPSl+NeC/mx9O
         NNQKwXZnGpSPj9X5Yds2DV9bWe3HjgMwkGIcR9k/x579hz0bojLjW20boi57r3MNnd
         QJa3f54MDuKZbe7I5EkdLDrk/Xk5teT8KYLfvE3hK5IAUxSYnvKebHQYGt1LCHP4se
         N0oC0XphRuQ6bMvVOigXkDb6xCJSBLX65Bpzm5S3p+x9Hs8qvV07NG1wbCLF2/rZvm
         C93Z58TrTlJHw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/12] kbuild: modinst: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Wed, 17 Jul 2019 15:17:53 +0900
Message-Id: <20190717061800.10018-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
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

Changes in v3: None
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

