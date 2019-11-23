Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED0EA107E98
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 14:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfKWN2g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 08:28:36 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39539 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726759AbfKWN2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 08:28:00 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id xANDRbkd000733;
        Sat, 23 Nov 2019 22:27:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xANDRbkd000733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574515660;
        bh=TgBBfAjF1gkWIAkBRfUA0hcVefTdXQgpgZ7bt3b2OO4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H7Kordq0Z3UH2HxIwpMry7Xy/ka2OwWKrm8/MbDl8o+VMj6UepLQG0Im0Ge2986cn
         LdjrPJvM9rw/X9NGSQXcA2zWxw5MlkTQhdSycp26sGeihRfHY/9nPY18veRTm50Tk6
         uxP2eEJt9NInF+3HypKPbS8G1xTByQBIOM7ZIdenaLjWmyaKdgXNFbmXikWE2u40JF
         uCGpo+RyQyfZ5yhhtfxj5W2XwztuW5wDUPlGUeFq5zzPsEHBfLTAfsJrBvYmEIr3WO
         /n+0ONRE+pJiO2Su9xcXjlYRUEFd8r9t/E+7NcovY0LeHx9nLYwUbw3THUEbKkk/r8
         eh+CNe5vWBn4g==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] scripts/kallsyms: remove redundant is_arm_mapping_symbol()
Date:   Sat, 23 Nov 2019 22:27:15 +0900
Message-Id: <20191123132727.30151-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123132727.30151-1-yamada.masahiro@socionext.com>
References: <20191123132727.30151-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 6f00df24ee39 ("[PATCH] Strip local symbols from kallsyms"),
all symbols starting '$' are ignored.

is_arm_mapping_symbol() particularly ignores $a, $t, etc. but it is
redundant.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kallsyms.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0959e1de381c..265475d3cffb 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -74,16 +74,6 @@ static void usage(void)
 	exit(1);
 }
 
-/*
- * This ignores the intensely annoying "mapping symbols" found
- * in ARM ELF files: $a, $t and $d.
- */
-static int is_arm_mapping_symbol(const char *str)
-{
-	return str[0] == '$' && strchr("axtd", str[1])
-	       && (str[2] == '\0' || str[2] == '.');
-}
-
 static int check_symbol_range(const char *sym, unsigned long long addr,
 			      struct addr_range *ranges, int entries)
 {
@@ -139,10 +129,13 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 			return -1;
 
 	}
-	else if (toupper(stype) == 'U' ||
-		 is_arm_mapping_symbol(sym))
+	else if (toupper(stype) == 'U')
 		return -1;
-	/* exclude also MIPS ELF local symbols ($L123 instead of .L123) */
+	/*
+	 * Ignore generated symbols such as:
+	 *  - mapping symbols in ARM ELF files ($a, $t, and $d)
+	 *  - MIPS ELF local symbols ($L123 instead of .L123)
+	 */
 	else if (sym[0] == '$')
 		return -1;
 	/* exclude debugging symbols */
-- 
2.17.1

