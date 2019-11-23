Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1F0107F3E
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2019 17:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfKWQFc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Nov 2019 11:05:32 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49456 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbfKWQFC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Nov 2019 11:05:02 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xANG4l5T019106;
        Sun, 24 Nov 2019 01:04:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xANG4l5T019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574525093;
        bh=9iKDRL9d6hTzpOpmUOinbE+RaKJ+14kZ7Ic+FqY8y+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KFpeQPl7WSOVE5M+4JYWJ8DMYIoVWCT9dijqhBO0BSP29OO5sbiSI38pWWHLPvQsR
         3P2tCKW9H7g5pB3N1UJXUEJTKd77GHg0d+36p4dO0Sy1++uNzc32sO2iMtc/hUE5dX
         U3Slqh0jkDfZUIZqhHaTMgOv+AawhekGBWj4+qJHz5LSRhrlrcp/AKa9i6DPxm8Fh0
         FqxhmXd46eEK7LPhlTg38Tbh7TIYT+U69UZchvJz/Uy0IQ1T9Xj/1NleQbNrneYbBM
         t76u28L7Rz6MhKlUlcFoIjeHeTGRSsyYwOREi1teDNknwm2oBNv/iczAabOK8Hnup5
         Y5V1zze2RuJnw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/16] scripts/kallsyms: move more patterns to the ignored_prefixes array
Date:   Sun, 24 Nov 2019 01:04:40 +0900
Message-Id: <20191123160444.11251-13-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191123160444.11251-1-yamada.masahiro@socionext.com>
References: <20191123160444.11251-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Refactoring for shortening the code.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/kallsyms.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 843615c1d384..04a1dd16edcf 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -105,6 +105,8 @@ static bool is_ignored_symbol(const char *name, char type)
 	};
 
 	static const char * const ignored_prefixes[] = {
+		"$",			/* local symbols for ARM, MIPS, etc. */
+		".LASANPC",		/* s390 kasan local symbols */
 		"__crc_",		/* modversions */
 		"__efistub_",		/* arm64 EFI stub namespace */
 		NULL
@@ -198,19 +200,9 @@ static int read_symbol(FILE *in, struct sym_entry *s)
 	}
 	else if (toupper(stype) == 'U')
 		return -1;
-	/*
-	 * Ignore generated symbols such as:
-	 *  - mapping symbols in ARM ELF files ($a, $t, and $d)
-	 *  - MIPS ELF local symbols ($L123 instead of .L123)
-	 */
-	else if (sym[0] == '$')
-		return -1;
 	/* exclude debugging symbols */
 	else if (stype == 'N' || stype == 'n')
 		return -1;
-	/* exclude s390 kasan local symbols */
-	else if (!strncmp(sym, ".LASANPC", 8))
-		return -1;
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-- 
2.17.1

