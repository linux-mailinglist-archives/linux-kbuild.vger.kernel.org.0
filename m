Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DECA107F31
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfKWQFF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:05 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49492 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfKWQFD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:03 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5U019106;
        Sun, 24 Nov 2019 01:04:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5U019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525094;
        bh=MJZKY+LNnUcmoA8/8v1d9mnVbNRYD0Hp8Ly2ZpnRV9k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mGJ7eDDUJ/MkRY2+xwDSNHG2eQ/ZOUJh1wAD4uYUzIFhkEL1Fi2xbIM89oOVsxwdq
         W7T1Juhy8d4BtYO/g5ddpCysacO26UjhC+v8Tfiy2hEImld0TIcXr5+QCXCQ5gdUUJ
         HEbqQn5oBTmDTcu6GXWkUZnnByLyOiaf1D6DgM3dJRLUCwF0zQMOFFeSndgeKMQZWo
         eUzt+b/HyLocv9oHq9pGQirNI0Q4EHa7CFjWdfRAY+N2Cp3crUueTxTOTNgnPyI1Gj
         ttRHmaaCJCwaLVZu5OyaT9oWBw1zLPUjhekwSw62QSKjD2adzaJlb506hl7RsU+hRV
         5APOT1SbSb0AQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/16] scripts/kallsyms: move ignored symbol types to is_ignored_symbol()
Date:   Sun, 24 Nov 2019 01:04:41 +0900
Message-Id: <20191123160444.11251-14-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Collect the ignored patterns to is_ignored_symbol().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 04a1dd16edcf..d90a6133d7b8 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -137,6 +137,21 @@ static bool is_ignored_symbol(const char *name, char type)
 			return true;
 	}
 
+	if (type == 'U' || type == 'u')
+		return true;
+	/* exclude debugging symbols */
+	if (type == 'N' || type == 'n')
+		return true;
+
+	if (toupper(type) == 'A') {
+		/* Keep these useful absolute symbols */
+		if (strcmp(name, "__kernel_syscall_via_break") &&
+		    strcmp(name, "__kernel_syscall_via_epc") &&
+		    strcmp(name, "__kernel_sigtramp") &&
+		    strcmp(name, "__gp"))
+			return true;
+	}
+
 	return false;
 }
 
@@ -188,21 +203,6 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	else if (check_symbol_range(sym, s->addr, text_ranges,
 				    ARRAY_SIZE(text_ranges)) == 0)
 		/* nothing to do */;
-	else if (toupper(stype) == 'A')
-	{
-		/* Keep these useful absolute symbols */
-		if (strcmp(sym, "__kernel_syscall_via_break") &&
-		    strcmp(sym, "__kernel_syscall_via_epc") &&
-		    strcmp(sym, "__kernel_sigtramp") &&
-		    strcmp(sym, "__gp"))
-			return -1;
-
-	}
-	else if (toupper(stype) == 'U')
-		return -1;
-	/* exclude debugging symbols */
-	else if (stype == 'N' || stype == 'n')
-		return -1;
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-- 
2.17.1

