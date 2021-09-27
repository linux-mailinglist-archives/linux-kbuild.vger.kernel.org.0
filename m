Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 397504194AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Sep 2021 14:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbhI0M5h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Sep 2021 08:57:37 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41362 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbhI0M5g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Sep 2021 08:57:36 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 18RCt8TH023197;
        Mon, 27 Sep 2021 21:55:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 18RCt8TH023197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632747338;
        bh=ApYGefbovH3YDnI1o13UMUD8Y4BudcfAKenkft0EDMU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1TiQKUO3N2GDlZIGR9dZItuQBAl5kfKk4jzb6RiF/1B4qkVzWiqpglLiBTfsDog33
         qjOH3n0oGJhyggp3B0aLcefmAp2kVKOIThyiTK1IXBJ0jVWP6+gLkwvkMVjv+KMEsf
         fGCtLA5Kaz05Sot2e/cl7FCB6pWdFYE1A8VtqXC5hvZcFvngEuNq4KEZ3wt75t7CX0
         8Ay/JmEzyesr/8CxqnHgQGR3p8/8Ots9t8OWbOX1MweM94/w9Gu+SouIwrhn2h9kcC
         Ca+OfI+h43oWPGC8N2MiO4TncoPe73qFRma45IRalpHubEQufJOaGybkZV5Cy57TWf
         mZ0i08rLl23Qg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: rename a variable in the lexer to a clearer name
Date:   Mon, 27 Sep 2021 21:54:37 +0900
Message-Id: <20210927125437.818092-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927125437.818092-1-masahiroy@kernel.org>
References: <20210927125437.818092-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In Kconfig, like Python, you can enclose a string by double-quotes or
single-quotes. So, both "foo" and 'foo' are allowed.

The variable, "str", is used to remember whether the string started with
a double-quote or a single-quote.

Rename it to a clearer name. The type should be 'char'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lexer.l | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index efe487859308..cc386e443683 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -84,7 +84,7 @@ static void warn_ignored_character(char chr)
 n	[A-Za-z0-9_-]
 
 %%
-	int str = 0;
+	char open_quote = 0;
 
 #.*			/* ignore comment */
 [ \t]*			/* whitespaces */
@@ -133,7 +133,7 @@ n	[A-Za-z0-9_-]
 ":="			return T_COLON_EQUAL;
 "+="			return T_PLUS_EQUAL;
 \"|\'			{
-				str = yytext[0];
+				open_quote = yytext[0];
 				new_string();
 				BEGIN(STRING);
 			}
@@ -170,7 +170,7 @@ n	[A-Za-z0-9_-]
 		append_string(yytext + 1, yyleng - 1);
 	}
 	\'|\"	{
-		if (str == yytext[0]) {
+		if (open_quote == yytext[0]) {
 			BEGIN(INITIAL);
 			yylval.string = text;
 			return T_WORD_QUOTE;
-- 
2.30.2

