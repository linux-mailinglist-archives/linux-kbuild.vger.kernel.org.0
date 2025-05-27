Return-Path: <linux-kbuild+bounces-7298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED28FAC5965
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 19:56:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B04921BC3896
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 17:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFB627FD64;
	Tue, 27 May 2025 17:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5D1Fj32"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425652566;
	Tue, 27 May 2025 17:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368581; cv=none; b=LUWsPu3Y9Uur/owOtO8OqMRKWbf+zQZJXcqPM4EeKHTKWFMazLq/h13w0UxO5UqpuJh489PFwQ5TNTWlmbhP2UUpihBlqp67MVzVj0KI4hnwAzb1SbVPa3YhanZjzK2+3ugG8DKR8X87BwOzkDLUkno+tIDAkksWXCAKzzj/PZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368581; c=relaxed/simple;
	bh=eG389LQ+Xp78SjC4Ihx0dxZG+lEE3vE/NvkzUBfztsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nksTc6VpR16cG8081VvdXSb34DTA1KrWXWRP3xgD0nFxs6kT5KLuvfATpiyYxeQPZbfK8hCBr9wRolF3Gxk+3rDiv8MyYgVj1e4KsbIeFieWcrHvhNITb+SWt4HJF3De048sSyIcvJ757ahWuEeg946T6HFsOIVkwk+d+I1a45o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5D1Fj32; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A16AC4CEE9;
	Tue, 27 May 2025 17:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748368581;
	bh=eG389LQ+Xp78SjC4Ihx0dxZG+lEE3vE/NvkzUBfztsM=;
	h=From:To:Cc:Subject:Date:From;
	b=F5D1Fj32VEUl3B6sNEwIPhTfO1xnxcw6t0cKI2opKKyIOBremDZgnT0mZx0kni2vd
	 7RxuW+QnS9LAo8AHydgrVQvXFr2KfKDMuPuTdft0lO17rM/syFfkzRrp5KrtfOPJ2G
	 xYn1NsX8xPYgitF9yx8X/QLJm2JgGVgVVqR/h5qNW2jc0OdKFEzuDCDxCeAzE9RGsC
	 XnNLkReQHBuIddieg7Z8lYO+wqOiMZo//+Iz79NJXNibG7H453s9CAr6ij2f1+lh1s
	 MlQV95bPPKOYGPInuQmdMo/mIKhAd3avTN3l0F7osZzXKUKWP9va17NOwGC2SpCgWr
	 L/99FuX0cKWBQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: introduce menu type enum
Date: Wed, 28 May 2025 02:56:15 +0900
Message-ID: <20250527175616.2450667-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, menu->prompt->type is checked to distinguish "comment"
(P_COMMENT) and "menu" (P_MENU) entries from regular "config" entries.
This is odd because P_COMMENT and P_MENU are not properties.

This commit introduces menu type enum to distinguish menu types more
naturally.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h   | 11 +++++++++++
 scripts/kconfig/lkc.h    |  2 +-
 scripts/kconfig/menu.c   |  5 +++--
 scripts/kconfig/parser.y | 12 ++++++------
 4 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 21578dcd4292..fe2231e0e6a4 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -205,15 +205,26 @@ struct property {
 	for (st = sym->prop; st; st = st->next) \
 		if (st->text)
 
+enum menu_type {
+	M_CHOICE,  // "choice"
+	M_COMMENT, // "comment"
+	M_IF,      // "if"
+	M_MENU,    // "mainmenu", "menu", "menuconfig"
+	M_NORMAL,  // others, i.e., "config"
+};
+
 /*
  * Represents a node in the menu tree, as seen in e.g. menuconfig (though used
  * for all front ends). Each symbol, menu, etc. defined in the Kconfig files
  * gets a node. A symbol defined in multiple locations gets one node at each
  * location.
  *
+ * @type: type of the menu entry
  * @choice_members: list of choice members with priority.
  */
 struct menu {
+	enum menu_type type;
+
 	/* The next menu node at the same level */
 	struct menu *next;
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index b8ebc3094a23..fbc907f75eac 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -81,7 +81,7 @@ void _menu_init(void);
 void menu_warn(const struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
-void menu_add_entry(struct symbol *sym);
+void menu_add_entry(struct symbol *sym, enum menu_type type);
 void menu_add_dep(struct expr *dep);
 void menu_add_visibility(struct expr *dep);
 struct property *menu_add_prompt(enum prop_type type, const char *prompt,
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 6587ac86d0d5..7d48a692bd27 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -15,7 +15,7 @@
 
 static const char nohelp_text[] = "There is no help available for this option.";
 
-struct menu rootmenu;
+struct menu rootmenu = { .type = M_MENU };
 static struct menu **last_entry_ptr;
 
 /**
@@ -65,12 +65,13 @@ void _menu_init(void)
 	last_entry_ptr = &rootmenu.list;
 }
 
-void menu_add_entry(struct symbol *sym)
+void menu_add_entry(struct symbol *sym, enum menu_type type)
 {
 	struct menu *menu;
 
 	menu = xmalloc(sizeof(*menu));
 	memset(menu, 0, sizeof(*menu));
+	menu->type = type;
 	menu->sym = sym;
 	menu->parent = current_menu;
 	menu->filename = cur_filename;
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 68372d3ff325..e9c3c664e925 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -139,7 +139,7 @@ stmt_list_in_choice:
 
 config_entry_start: T_CONFIG nonconst_symbol T_EOL
 {
-	menu_add_entry($2);
+	menu_add_entry($2, M_NORMAL);
 	printd(DEBUG_PARSE, "%s:%d:config %s\n", cur_filename, cur_lineno, $2->name);
 };
 
@@ -173,7 +173,7 @@ config_stmt: config_entry_start config_option_list
 
 menuconfig_entry_start: T_MENUCONFIG nonconst_symbol T_EOL
 {
-	menu_add_entry($2);
+	menu_add_entry($2, M_MENU);
 	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", cur_filename, cur_lineno, $2->name);
 };
 
@@ -246,7 +246,7 @@ choice: T_CHOICE T_EOL
 {
 	struct symbol *sym = sym_lookup(NULL, 0);
 
-	menu_add_entry(sym);
+	menu_add_entry(sym, M_CHOICE);
 	menu_set_type(S_BOOLEAN);
 	INIT_LIST_HEAD(&current_entry->choice_members);
 
@@ -315,7 +315,7 @@ default:
 if_entry: T_IF expr T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:if\n", cur_filename, cur_lineno);
-	menu_add_entry(NULL);
+	menu_add_entry(NULL, M_IF);
 	menu_add_dep($2);
 	$$ = menu_add_menu();
 };
@@ -338,7 +338,7 @@ if_stmt_in_choice: if_entry stmt_list_in_choice if_end
 
 menu: T_MENU T_WORD_QUOTE T_EOL
 {
-	menu_add_entry(NULL);
+	menu_add_entry(NULL, M_MENU);
 	menu_add_prompt(P_MENU, $2, NULL);
 	printd(DEBUG_PARSE, "%s:%d:menu\n", cur_filename, cur_lineno);
 };
@@ -376,7 +376,7 @@ source_stmt: T_SOURCE T_WORD_QUOTE T_EOL
 
 comment: T_COMMENT T_WORD_QUOTE T_EOL
 {
-	menu_add_entry(NULL);
+	menu_add_entry(NULL, M_COMMENT);
 	menu_add_prompt(P_COMMENT, $2, NULL);
 	printd(DEBUG_PARSE, "%s:%d:comment\n", cur_filename, cur_lineno);
 };
-- 
2.43.0


