Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82DF2107F46
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbfKWQFk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:40 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49457 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5V019106;
        Sun, 24 Nov 2019 01:04:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5V019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525094;
        bh=9MAnCdg3hR5ROOX8y8hcsA9VaCetvt+YAuylmAsTUL4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x4VIQ1/VqdKlMPmJB8JIlJnPeiDjw2UMJPvdhqrzJQXJM40hLJ87fsHejr4cCTmTg
         50BMgOnpUNp8aKEup82RBfUju4WPG3xqBJD50ihPyUtSaFXaxi12GsAZB3Fux3yFL0
         AJEodQDkTKfQrHaX7BYQzOh7VpGlVWQf3aWhhL2qjg8P1ekPdRA1tip2D0oGBzuici
         ImZ5hWIP0XV7a2PWUkW9kIZ8V7GhPnNdW8ZQvvZ3FH5YqZqrTCpGjJwWL7jf6Pa03r
         ThOFqS+ftEUK5BW3/2lI/qZ9ZjU+1jllYHrf0JhWO56ilJw9MZs3BdiMZ3Kee0OMYK
         bjohBVT5LLiTg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] scripts/kallsyms: make check_symbol_range() void function
Date:   Sun, 24 Nov 2019 01:04:42 +0900
Message-Id: <20191123160444.11251-15-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no more reason to check the return value of
check_symbol_range().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index d90a6133d7b8..f4d5f131556d 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -155,8 +155,8 @@ static bool is_ignored_symbol(const char *name, char type)
 	return false;
 }
 
-static int check_symbol_range(const char *sym, unsigned long long addr,
-			      struct addr_range *ranges, int entries)
+static void check_symbol_range(const char *sym, unsigned long long addr,
+			       struct addr_range *ranges, int entries)
 {
 	size_t i;
 	struct addr_range *ar;
@@ -166,14 +166,12 @@ static int check_symbol_range(const char *sym, unsigned long long addr,
 
 		if (strcmp(sym, ar->start_sym) == 0) {
 			ar->start = addr;
-			return 0;
+			return;
 		} else if (strcmp(sym, ar->end_sym) == 0) {
 			ar->end = addr;
-			return 0;
+			return;
 		}
 	}
-
-	return 1;
 }
 
 static int read_symbol(FILE *in, struct sym_entry *s)
@@ -200,9 +198,8 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	/* Ignore most absolute/undefined (?) symbols. */
 	if (strcmp(sym, "_text") == 0)
 		_text = s->addr;
-	else if (check_symbol_range(sym, s->addr, text_ranges,
-				    ARRAY_SIZE(text_ranges)) == 0)
-		/* nothing to do */;
+
+	check_symbol_range(sym, s->addr, text_ranges, ARRAY_SIZE(text_ranges));
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-- 
2.17.1

