Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACFBB62F83
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727186AbfGIEZl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:25:41 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42169 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfGIEZl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:41 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVp009969;
        Tue, 9 Jul 2019 13:24:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVp009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646298;
        bh=9GTu+fhEWSsaBmqXT5Bo1ItxiSb25+D5qSp//fAlJHI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RynN3YqErvmL/4fPzpAU7OmzJQFrUjduikscS1EBsDjjl0ia0n94ootoO0O81BxaI
         6u7ZKygViNX0ZYW4PIuFExrU7PXYTjT3YSibs04PMnHqeIqz7Xs9RkD230xlUAdWVv
         BNQIqTIF0OZhUKV7SO/E6r1cQ7XP8rVQcLGsn2kRdlpkw5fF4viTevwX7mchammvxb
         i8H9F1CMvQK3ST1YYxbi+eRzB7CgTusECLRwmg12d3OrVtr+D2aZ9GHdH2DlgX/APD
         C2f0KfeFx5IxwyeyJ1SLIO6GHzeovv2qOIj9IEmQcussE3uAY81P6bO4/qB7NURWAc
         s10bsPfeTVquw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] kbuild: modsign: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Tue,  9 Jul 2019 13:24:10 +0900
Message-Id: <20190709042416.27554-7-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
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

