Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF7A1222FE
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbfLQEO5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:14:57 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49419 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbfLQEOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:52 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4EPAE024524;
        Tue, 17 Dec 2019 13:14:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4EPAE024524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556068;
        bh=An5jhCMPBE3WXglnz3cPdiHBZ9YvliinUc141cReA9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LIwEzAcDb9tAP/VfggJbke3KYC4/YcOSFeZ/GKCrvmffj+LyH+EaV7PIgAU1v5MB7
         cNfNIqGJQoeRbT8/fFAQTIa0TVonMmumZlhsbch304tUGLleN2aEuIGeRN6Ki3KOjD
         NTfqbXXrPenilsFd+x9WBO5DW8HcV+tb3018Lad80hUfnKasMO431JJdHitZ0dDHrY
         mM26zSIjzsDSrdMJ5tAMTcm3I81LRnZ7pLysrjRAqELdKKb6tB8zfUrbrABie48mvu
         03A7IO7Tg+DRPK7t3n1Dx2l91vXrGfOTi8p4G69Q9xR5iu53+HjS6o0FOWEyEydPw3
         Xjt2/3cvQoSMw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] kconfig: remove 'prompt' symbol
Date:   Tue, 17 Dec 2019 13:14:19 +0900
Message-Id: <20191217041424.29285-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that 'prompt' is only reduced from T_WORD_QUOTE without any action,
use T_WORD_QUOTE directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 80585f04f590..40e46996e6a5 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -93,7 +93,6 @@ static struct menu *current_choice_menu;
 %left T_LESS T_LESS_EQUAL T_GREATER T_GREATER_EQUAL
 %nonassoc T_NOT
 
-%type <string> prompt
 %type <symbol> nonconst_symbol
 %type <symbol> symbol
 %type <type> type logic_type default
@@ -116,7 +115,7 @@ input: mainmenu_stmt stmt_list | stmt_list;
 
 /* mainmenu entry */
 
-mainmenu_stmt: T_MAINMENU prompt T_EOL
+mainmenu_stmt: T_MAINMENU T_WORD_QUOTE T_EOL
 {
 	menu_add_prompt(P_MENU, $2, NULL);
 };
@@ -184,7 +183,7 @@ config_option: type prompt_stmt_opt T_EOL
 		$1);
 };
 
-config_option: T_PROMPT prompt if_expr T_EOL
+config_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 {
 	menu_add_prompt(P_PROMPT, $2, $3);
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
@@ -276,7 +275,7 @@ choice_option_list:
 	| choice_option_list help
 ;
 
-choice_option: T_PROMPT prompt if_expr T_EOL
+choice_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 {
 	menu_add_prompt(P_PROMPT, $2, $3);
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
@@ -345,7 +344,7 @@ if_stmt: if_entry stmt_list if_end
 
 /* menu entry */
 
-menu: T_MENU prompt T_EOL
+menu: T_MENU T_WORD_QUOTE T_EOL
 {
 	menu_add_entry(NULL);
 	menu_add_prompt(P_MENU, $2, NULL);
@@ -374,7 +373,7 @@ menu_option_list:
 	| menu_option_list depends
 ;
 
-source_stmt: T_SOURCE prompt T_EOL
+source_stmt: T_SOURCE T_WORD_QUOTE T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), $2);
 	zconf_nextfile($2);
@@ -383,7 +382,7 @@ source_stmt: T_SOURCE prompt T_EOL
 
 /* comment entry */
 
-comment: T_COMMENT prompt T_EOL
+comment: T_COMMENT T_WORD_QUOTE T_EOL
 {
 	menu_add_entry(NULL);
 	menu_add_prompt(P_COMMENT, $2, NULL);
@@ -440,13 +439,11 @@ visible: T_VISIBLE if_expr T_EOL
 
 prompt_stmt_opt:
 	  /* empty */
-	| prompt if_expr
+	| T_WORD_QUOTE if_expr
 {
 	menu_add_prompt(P_PROMPT, $1, $2);
 };
 
-prompt:	  T_WORD_QUOTE
-
 end:	  T_ENDMENU T_EOL	{ $$ = "menu"; }
 	| T_ENDCHOICE T_EOL	{ $$ = "choice"; current_choice_menu = NULL; }
 	| T_ENDIF T_EOL		{ $$ = "if"; }
-- 
2.17.1

