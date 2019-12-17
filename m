Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D36E61222FC
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbfLQEOw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:14:52 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49416 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727683AbfLQEOw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:52 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4EPAF024524;
        Tue, 17 Dec 2019 13:14:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4EPAF024524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556069;
        bh=zTfsz4q4N5zqvuqTxH8EVK2Vwep22Qgk0oB4uevhHXM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LdvTRScsLP6hfOvy61kc3+9uLpg3c0hbsdIBe+3gew4wfgJvCrAljsUdiU8TyQDUt
         SC82+xqVm9kmodzGUADghrVn8JNR3MwJd1go3b9kv1Vs1WhFlhXAwrzITP/W2SqYGd
         Bhzm4TOM39+pcdSPF5+vxXtgxNHuN0SQ63SBfvDwjQFo+Slo82viULRbp4lx4S2K+G
         O175ZhHxQVfGAXg1IqvWv/Ac6L9mmLjb71WtEdzcHC5/13PVbjdmZebUatBuunXpv5
         ILJrfBAR616w0Rc+ZZ/8pWb9TJ6G53AqUVdzUR1BlEWMhOnREk3jq+XOtQ8fMp6YyA
         CpG90L5J8s2eA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] kconfig: move prompt handling to menu_add_prompt() from menu_add_prop()
Date:   Tue, 17 Dec 2019 13:14:20 +0900
Message-Id: <20191217041424.29285-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

menu_add_prompt() is the only function that calls menu_add_prop() with
non-NULL prompt.

So, the code inside the if-conditional block of menu_add_prop() can be
moved to menu_add_prompt().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c | 70 ++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index bbabf0a59ac4..45daece8d983 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -132,53 +132,51 @@ static struct property *menu_add_prop(enum prop_type type, char *prompt, struct
 	prop->expr = expr;
 	prop->visible.expr = dep;
 
-	if (prompt) {
-		if (isspace(*prompt)) {
-			prop_warn(prop, "leading whitespace ignored");
-			while (isspace(*prompt))
-				prompt++;
-		}
-		if (current_entry->prompt)
-			prop_warn(prop, "prompt redefined");
+	return prop;
+}
 
-		/* Apply all upper menus' visibilities to actual prompts. */
-		if(type == P_PROMPT) {
-			struct menu *menu = current_entry;
+struct property *menu_add_prompt(enum prop_type type, char *prompt,
+				 struct expr *dep)
+{
+	struct property *prop = menu_add_prop(type, prompt, NULL, dep);
 
-			while ((menu = menu->parent) != NULL) {
-				struct expr *dup_expr;
+	if (isspace(*prompt)) {
+		prop_warn(prop, "leading whitespace ignored");
+		while (isspace(*prompt))
+			prompt++;
+	}
+	if (current_entry->prompt)
+		prop_warn(prop, "prompt redefined");
 
-				if (!menu->visibility)
-					continue;
-				/*
-				 * Do not add a reference to the
-				 * menu's visibility expression but
-				 * use a copy of it.  Otherwise the
-				 * expression reduction functions
-				 * will modify expressions that have
-				 * multiple references which can
-				 * cause unwanted side effects.
-				 */
-				dup_expr = expr_copy(menu->visibility);
+	/* Apply all upper menus' visibilities to actual prompts. */
+	if (type == P_PROMPT) {
+		struct menu *menu = current_entry;
 
-				prop->visible.expr
-					= expr_alloc_and(prop->visible.expr,
-							 dup_expr);
-			}
-		}
+		while ((menu = menu->parent) != NULL) {
+			struct expr *dup_expr;
 
-		current_entry->prompt = prop;
+			if (!menu->visibility)
+				continue;
+			/*
+			 * Do not add a reference to the menu's visibility
+			 * expression but use a copy of it. Otherwise the
+			 * expression reduction functions will modify
+			 * expressions that have multiple references which
+			 * can cause unwanted side effects.
+			 */
+			dup_expr = expr_copy(menu->visibility);
+
+			prop->visible.expr = expr_alloc_and(prop->visible.expr,
+							    dup_expr);
+		}
 	}
+
+	current_entry->prompt = prop;
 	prop->text = prompt;
 
 	return prop;
 }
 
-struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep)
-{
-	return menu_add_prop(type, prompt, NULL, dep);
-}
-
 void menu_add_visibility(struct expr *expr)
 {
 	current_entry->visibility = expr_alloc_and(current_entry->visibility,
-- 
2.17.1

