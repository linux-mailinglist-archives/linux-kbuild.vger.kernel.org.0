Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B8E9C519
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Aug 2019 19:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbfHYR2n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Aug 2019 13:28:43 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:45503 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbfHYR2n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Aug 2019 13:28:43 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7PHSb7P010019;
        Mon, 26 Aug 2019 02:28:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7PHSb7P010019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566754118;
        bh=R/LvQSsrWjqTLjMvhXd/xv0Gk36CKucewELa9VXReAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=s8x+mnso0BzwVC1knA7FsgvvOvJ2T049kyopPwWxycgrgcGJ39EFQGfdeEfMKxdc9
         ssXw2BKKGPApbii7LWryNeW1jM8uFOC0vXkELK4ioGD/uSGlQTBpfWSFBnMdF5j0F+
         dOiRV0TMJvYHRDt1BOStXefa8yX6NVXBm9YijMRzRl2f+GHd4kbjktF8Lmvq0lb9N8
         X+KXY5K/aS2LwKE/RoFhR6SVJmfZVojVTl8HePd1Dqy4yQBRhtVn4zEw5bm0DqjgGo
         AhLYiqp2zM7rLGF5uKFamV8b8l8awNom5YkeJTac7Uq70PQ6tfofJLDbgbbL8sc4VH
         x+HIKScEL0LKw==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: split util.c out of parser.y
Date:   Mon, 26 Aug 2019 02:28:33 +0900
Message-Id: <20190825172833.5708-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190825172833.5708-1-yamada.masahiro@socionext.com>
References: <20190825172833.5708-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

util.c exists both in scripts/kconfig/ and scripts/kconfig/lxdialog.

Previously, Kbuild could not pass different flags to source files with
the same basename. Now that this issue was solved, you can split util.c
out of parser.y and compile them independently of each other.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile | 2 +-
 scripts/kconfig/parser.y | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ef2f2336c469..1ce83269a5dc 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -144,7 +144,7 @@ help:
 # ===========================================================================
 # object files used by all kconfig flavours
 common-objs	:= confdata.o expr.o lexer.lex.o parser.tab.o preprocess.o \
-		   symbol.o
+		   symbol.o util.o
 
 $(obj)/lexer.lex.o: $(obj)/parser.tab.h
 HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)/$(src)
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 60936c76865b..b3eff9613cf8 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -727,5 +727,4 @@ void zconfdump(FILE *out)
 	}
 }
 
-#include "util.c"
 #include "menu.c"
-- 
2.17.1

