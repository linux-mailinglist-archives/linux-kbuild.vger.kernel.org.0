Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC4DB12AF
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 18:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732798AbfILQXJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Sep 2019 12:23:09 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42382 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730119AbfILQXJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 12:23:09 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8CGMu1c021030;
        Fri, 13 Sep 2019 01:22:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8CGMu1c021030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568305378;
        bh=6plTsXg4MpJ2Euqlmtft3yphP/1mbsQxTTVwZlEiA3Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eoiAXkw0USezn6DqskoWpLU4Wu99H8g65BJXxSJgJcWFhRzBxcYfOtN8UiNkgdSEx
         rKHMksnmO0e86RdXD/wNp4bfcStkLx805BLRHtF3cC7oup7a/a83uh1OS9n+4UCI2I
         7P6OoI5nOsgNgJPLYnIETDEAVY1LqUI/vGA/IW9UHgR0+BqyJipu2Q8IFD3aKK6wUr
         qYEw/jkRnuhvrCwW1+9uU/r6pKwFjQg/bOWQAMM9blWIgg4cJy791/jtci8yQTcpTl
         akRCKJLNkpw1qBXEwF5tff/buTxKBfOJDfKgT5wyf2X+xSZuX8kgTAASk522MazwLC
         vW/GqDUCxrJEQ==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] kbuild: clear KBUILD_MODULES in top Makefile if CONFIG_MODULES=n
Date:   Fri, 13 Sep 2019 01:22:53 +0900
Message-Id: <20190912162254.9603-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912162254.9603-1-yamada.masahiro@socionext.com>
References: <20190912162254.9603-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Do not try to build any module-related artifacts when CONFIG_MODULES
is disabled.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - New patch

 Makefile               | 4 ++++
 scripts/Makefile.build | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index adc0cabe2382..0ecc62dbe234 100644
--- a/Makefile
+++ b/Makefile
@@ -1797,6 +1797,10 @@ single-build = $(if $(filter-out $@/, $(single-no-ko)),1)
 
 endif
 
+ifndef CONFIG_MODULES
+KBUILD_MODULES :=
+endif
+
 # FIXME Should go into a make.lib or something
 # ===========================================================================
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index fb29c898604a..aab9a14fa78d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -76,7 +76,7 @@ else ifneq ($(real-obj-y),)
 builtin-target := __warn-orphan-obj-y
 endif
 
-ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
+ifdef need-modorder
 modorder-target := $(obj)/modules.order
 endif
 
-- 
2.17.1

