Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233F02F8993
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 00:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbhAOXoc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 18:44:32 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:64011 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbhAOXoc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 18:44:32 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 10FNhKIB008447;
        Sat, 16 Jan 2021 08:43:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10FNhKIB008447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610754201;
        bh=2i9d/z2KNaQrqIwmRk7gE7al6qQ1J5x6IOib4mSYk5I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LDVWGc935cvrZZCu08FQTJTWEyCu0DB8hZPIvFVsl81wTnK+02k+OUiyR5mAfqGjh
         +UgFKZULMcmYhrUDhjX8DgCs1GEaXorC5rAWZaqT/78zhWM+8LfoX4WpiBz6WjRGer
         wVZBKb0c0J8I2xQu4uRyAMG8yGqk7XnF6OtUIPMhBlkunyXElDNvjMQ593W4FOt9wn
         SrTzTNn2op3MixVB9mFKP7RUgOeXEDQodaa+OJP6ubFJG2len5cfFUMqdILvIiyTp3
         oNz4hJ1jrK/YpAZcm6AAgoTBqV7fhudeI4oh+MoPxcrlEMf382JQOo092ZRcgxrFZM
         APulFA8kK2Bmg==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] genksyms: remove dead code for ST_TABLE_*
Date:   Sat, 16 Jan 2021 08:43:03 +0900
Message-Id: <20210115234305.87205-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210115234305.87205-1-masahiroy@kernel.org>
References: <20210115234305.87205-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No one sets lexstate to ST_TABLE_*. It is is very old code, and I do
not know what was the plan at that time. Let's remove the dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/lex.l | 54 ------------------------------------------
 1 file changed, 54 deletions(-)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index 9e88c100fc28..9cb075cf6a34 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -119,8 +119,6 @@ yylex(void)
   static enum {
     ST_NOTSTARTED, ST_NORMAL, ST_ATTRIBUTE, ST_ASM, ST_TYPEOF, ST_TYPEOF_1,
     ST_BRACKET, ST_BRACE, ST_EXPRESSION, ST_STATIC_ASSERT,
-    ST_TABLE_1, ST_TABLE_2, ST_TABLE_3, ST_TABLE_4,
-    ST_TABLE_5, ST_TABLE_6
   } lexstate = ST_NOTSTARTED;
 
   static int suppress_type_lookup, dont_want_brace_phrase;
@@ -427,58 +425,6 @@ repeat:
 	}
       break;
 
-    case ST_TABLE_1:
-      goto repeat;
-
-    case ST_TABLE_2:
-      if (token == IDENT && yyleng == 1 && yytext[0] == 'X')
-	{
-	  token = EXPORT_SYMBOL_KEYW;
-	  lexstate = ST_TABLE_5;
-	  APP;
-	  break;
-	}
-      lexstate = ST_TABLE_6;
-      /* FALLTHRU */
-
-    case ST_TABLE_6:
-      switch (token)
-	{
-	case '{': case '[': case '(':
-	  ++count;
-	  break;
-	case '}': case ']': case ')':
-	  --count;
-	  break;
-	case ',':
-	  if (count == 0)
-	    lexstate = ST_TABLE_2;
-	  break;
-	};
-      goto repeat;
-
-    case ST_TABLE_3:
-      goto repeat;
-
-    case ST_TABLE_4:
-      if (token == ';')
-	lexstate = ST_NORMAL;
-      goto repeat;
-
-    case ST_TABLE_5:
-      switch (token)
-	{
-	case ',':
-	  token = ';';
-	  lexstate = ST_TABLE_2;
-	  APP;
-	  break;
-	default:
-	  APP;
-	  break;
-	}
-      break;
-
     default:
       exit(1);
     }
-- 
2.27.0

