Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D494235E249
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Apr 2021 17:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbhDMPJH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Apr 2021 11:09:07 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:60691 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbhDMPJH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Apr 2021 11:09:07 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 13DF8Jfk024849;
        Wed, 14 Apr 2021 00:08:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 13DF8Jfk024849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618326500;
        bh=DalnZGHxFxlKUbrbYS8CMzx9sk7AKzLI0DhChYwCx4g=;
        h=From:To:Cc:Subject:Date:From;
        b=fVLyWMFvlrHNr8JN3XNS5KhZlot8/oJG53r/awjettEHUN5JSLfXTJbDOw7FV65+D
         DgulosEZ9rtWtw6cjoA0wRRxTcoBXH8lUwyKnBMqq6+E3MHCd4qW9+CbpBIsIPXXu2
         2b9j13/uOEF3r+g7mJM8JCT1xDJp0e772urPKhh4AkwUYkY9zPD1fmQ1qwcBL/o84q
         70ZkBaR1dcHlzFMddhbKf69VtgGl4xu5z+vm4eicUxk4VLV42EAskvKLuWZhT5Emf9
         g8qToxWSTBrkf0iVGN57uBIaz9Rw8LBkXC5sAWgvWJFixdaPA/Zo90++f4IS2AZDNv
         3GNguyYSnT4oA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: split menu.c out of parser.y
Date:   Wed, 14 Apr 2021 00:08:17 +0900
Message-Id: <20210413150817.110282-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Compile menu.c as an independent compilation unit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile   | 4 ++--
 scripts/kconfig/internal.h | 9 +++++++++
 scripts/kconfig/menu.c     | 1 +
 scripts/kconfig/parser.y   | 5 ++---
 4 files changed, 14 insertions(+), 5 deletions(-)
 create mode 100644 scripts/kconfig/internal.h

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 1d1a7f83ee8d..5a215880b268 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -143,8 +143,8 @@ help:
 
 # ===========================================================================
 # object files used by all kconfig flavours
-common-objs	:= confdata.o expr.o lexer.lex.o parser.tab.o preprocess.o \
-		   symbol.o util.o
+common-objs	:= confdata.o expr.o lexer.lex.o menu.o parser.tab.o \
+		   preprocess.o symbol.o util.o
 
 $(obj)/lexer.lex.o: $(obj)/parser.tab.h
 HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)/$(src)
diff --git a/scripts/kconfig/internal.h b/scripts/kconfig/internal.h
new file mode 100644
index 000000000000..2f7298c21b64
--- /dev/null
+++ b/scripts/kconfig/internal.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef INTERNAL_H
+#define INTERNAL_H
+
+struct menu;
+
+extern struct menu *current_menu, *current_entry;
+
+#endif /* INTERNAL_H */
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 8b2108b74821..606ba8a63c24 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -9,6 +9,7 @@
 #include <string.h>
 
 #include "lkc.h"
+#include "internal.h"
 
 static const char nohelp_text[] = "There is no help available for this option.";
 
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index e90889edf5b3..2af7ce4e1531 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -12,6 +12,7 @@
 #include <stdbool.h>
 
 #include "lkc.h"
+#include "internal.h"
 
 #define printd(mask, fmt...) if (cdebug & (mask)) printf(fmt)
 
@@ -28,7 +29,7 @@ static bool zconf_endtoken(const char *tokenname,
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
-static struct menu *current_menu, *current_entry;
+struct menu *current_menu, *current_entry;
 
 %}
 
@@ -713,5 +714,3 @@ void zconfdump(FILE *out)
 		}
 	}
 }
-
-#include "menu.c"
-- 
2.27.0

