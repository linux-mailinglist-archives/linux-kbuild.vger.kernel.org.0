Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B8F62F93
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbfGIEZm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:25:42 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42168 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbfGIEZl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:41 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVo009969;
        Tue, 9 Jul 2019 13:24:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVo009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646297;
        bh=X1+deifnjdjSHLxV0pVUrGpafNj40fiq1sx4t0gZorM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zg+UQJmy7E8cn5faf6+Vg27zaelbAEWXhvAezc1dOOJg63MBjWxu+xikR8JGFx0YU
         /laI/bxxIArWJEWpda2PHKitHbRVa1pysJXLABDnUveVHYQIkjWJbwYp9sGk0zmbY1
         xNXlECMA5d/UPPW2Adc84OJC4s+YN0olEEoUkPmLM/fXOly+gnWxF5I+7EHmi5BZ+w
         Dw8/l8sNJoFb7w8MqV+IpgKlDt/oh5r5cctsV34uxdWTpkWZR5AJ8WZyLakMoOmu3C
         Jafsq6nbuGgntDX/2PJi7tlZlyvox2+Rk3BkQKO4lr4WckdL4NPGDuaagM0w4GSnuu
         hY+/glG8bH5ww==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] kbuild: modinst: read modules.order instead of $(MODVERDIR)/*.mod
Date:   Tue,  9 Jul 2019 13:24:09 +0900
Message-Id: <20190709042416.27554-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
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

