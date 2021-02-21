Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A8732095D
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 10:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbhBUJ1a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 04:27:30 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:20003 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhBUJ13 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 04:27:29 -0500
Received: from grover.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 11L9QV7U030995;
        Sun, 21 Feb 2021 18:26:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 11L9QV7U030995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613899593;
        bh=wwl79vCjZt3c2rZ7CQFuwxGyMAUSjMQQF8icpHrjmEM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JE5wQz5mCKcCpbcg9Vq99Kb1JtT5HlyyCB8tDy7eZok+lNAjP1u3DyE7xocfwfgvK
         1bNQUFD/0W88G2Em/T3mblbexXHBBV/82xc2V7N/+d2kYz7zmIPqPESh8Zwsl/W4iz
         EwjhJtF1co2wUKwzGsGdvykqCMf5SSDg3zbTU6p5HpKOK7s7lNW0M4Pbj2OELm++bl
         VZvPmYJgv3GwzR6/0xBsTM4On7Oo2jvDfTmtD4U36BUu9wPs9lFzMvc6xUZh08DAWI
         Z6aXbvlXheGnkzrR4kj0wVnI4jdgXAfsorXMTFcgI5VFOUi3KJXlMF8Ij0d8n0yoBD
         I7VQHcdnz+wvw==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: remove dead code in conf_askvalue()
Date:   Sun, 21 Feb 2021 18:26:23 +0900
Message-Id: <20210221092623.133572-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221092623.133572-1-masahiroy@kernel.org>
References: <20210221092623.133572-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

conf_askvalue() is only called for oldconfig, syncconfig, and
oldaskconfig. If it is called for other cases, it is a bug.

So, the code after the switch statement is unreachable.

Remove the dead code, and clean up the switch statement.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 369615d6c97e..3a98c9e0a7c8 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -84,8 +84,6 @@ static void xfgets(char *str, int size, FILE *in)
 
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
-	enum symbol_type type = sym_get_type(sym);
-
 	if (!sym_has_value(sym))
 		printf("(NEW) ");
 
@@ -107,24 +105,12 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 			return 0;
 		}
 		/* fall through */
-	case oldaskconfig:
+	default:
 		fflush(stdout);
 		xfgets(line, sizeof(line), stdin);
-		return 1;
-	default:
 		break;
 	}
 
-	switch (type) {
-	case S_INT:
-	case S_HEX:
-	case S_STRING:
-		printf("%s\n", def);
-		return 1;
-	default:
-		;
-	}
-	printf("%s", line);
 	return 1;
 }
 
-- 
2.27.0

