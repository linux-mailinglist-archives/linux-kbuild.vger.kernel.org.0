Return-Path: <linux-kbuild+bounces-7679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D96B2AE6AF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E81B1C28038
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2AE2FC014;
	Tue, 24 Jun 2025 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXUa8LQx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460B72FC012;
	Tue, 24 Jun 2025 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777744; cv=none; b=N9YG9ZiMYaH3q2b9VfOWjp3ZK4cM5g8yilUKR6e7/M+oLpAJJYYbTnTFcTh1n1arj6gA/ih7jqh4jZqLGt+1T/3dZ1CNlb3it4gBs41UhG7tI1+QpwepU4mmQsUp8kfyFBKu3xzhTvgacL89Hcli0nbTFjH1/l4OPrT6nvn2pn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777744; c=relaxed/simple;
	bh=DjI+et6lMefW9uMpXQWCqe2FLU+qpgBvDy2eHlDXZtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDQvZsUxTXhMLdc+GxRazDzy5WUd1anjfAfJjLZWUhmrtWoSP8DRhjAkHB2Da7mIdhe7YtcCSBQs+KqDZi26nrryXBdimC/ykCSH3iJAz8Ap76tX9ANXumC/nSOz3LbtmgLH4pQ0d7NseycqdT/iJDZmsBwKMC9wa0MLI5oSzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXUa8LQx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC962C4CEEE;
	Tue, 24 Jun 2025 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777744;
	bh=DjI+et6lMefW9uMpXQWCqe2FLU+qpgBvDy2eHlDXZtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iXUa8LQxWXUkt3I9HNzDhV/VZ6P1sMvKeMc364XxK7M9gHw5svN74suC/DZUA2FGY
	 TsyuyDcrdmGJ2GiZ72dDlw+/EPrJriBI0I2H2Qcn3FHEM9cUsBzW8nqW8IkTin0YeM
	 3Y6EygUw3hHn5GLDRIyRx6ke+ooikzKLaP4eQj4rAxpDrQMRgIudBmmQ9yFWTIB/lf
	 6H06vwILf9gWcHwo75fYH7vsyl5MA7EwbuFkdB+Iw6d6Nmec08hXPgtkifcHjuLsLn
	 eMMvG80Fhc+wNj5JyJm6ocoLcnEW9Lj6sVDpmHxVnGIZGNsUN5NBr3b/3/sLoHeGVN
	 Vqop5+6hP7wpg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 52/66] kconfig: gconf: remove fixup_rootmenu()
Date: Wed, 25 Jun 2025 00:05:40 +0900
Message-ID: <20250624150645.1107002-53-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MENU_ROOT flag is a hack used for SPLIT_VIEW mode. Top-level symbols
have no parent menu, so they are displayed directly in the left pane.

Show the rootmenu, allowing top-level symbols to have a proper parent
menu and be displayed consistently in the right pane.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 164 +++++++++++++++++-----------------------
 1 file changed, 71 insertions(+), 93 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 23a6f99d2cd4..b86d54c222e3 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -56,9 +56,6 @@ enum {
 	COL_NUMBER
 };
 
-static void display_tree(GtkTreeStore *store, struct menu *menu);
-static void recreate_menu_content_tree(void);
-
 static void conf_changed(bool dirty)
 {
 	gtk_widget_set_sensitive(save_btn, dirty);
@@ -254,6 +251,74 @@ static void update_trees(void)
 	update_tree(tree2);
 }
 
+static void _recreate_menu_tree(GtkTreeStore *store, struct menu *menu,
+				GtkTreeIter *parent, gboolean menu_only)
+{
+	GtkTreeIter iter;
+
+	/* REVISIT: menu_finalize() creates empty "if" entries. */
+	if (menu->type == M_IF)
+		return;
+
+	if (!menu_only || menu->type == M_MENU) {
+		gtk_tree_store_append(store, &iter, parent);
+		set_node(store, &iter, menu);
+	}
+
+	for (struct menu *child = menu->list; child; child = child->next)
+		_recreate_menu_tree(store, child, &iter, menu_only);
+}
+
+static void recreate_menu_tree(void)
+{
+	GtkTreeStore *store;
+	GtkTreeView *view;
+
+	if (view_mode == SPLIT_VIEW) {
+		store = tree1;
+		view = GTK_TREE_VIEW(tree1_w);
+	} else {
+		store = tree2;
+		view = GTK_TREE_VIEW(tree2_w);
+	}
+
+	gtk_tree_store_clear(store);
+	_recreate_menu_tree(store, &rootmenu, NULL, view_mode == SPLIT_VIEW);
+	select_menu(view, browsed);
+	gtk_tree_view_expand_all(view);
+}
+
+static void _recreate_menu_content_tree(GtkTreeStore *store, struct menu *menu,
+					GtkTreeIter *parent, gboolean no_menu)
+{
+	for (struct menu *child = menu->list; child; child = child->next) {
+		GtkTreeIter iter;
+
+		/* REVISIT: menu_finalize() creates empty "if" entries. */
+		if (child->type == M_IF)
+			continue;
+
+		if (!no_menu || child->type != M_MENU) {
+			gtk_tree_store_append(store, &iter, parent);
+			set_node(store, &iter, child);
+		}
+
+		if (child->type != M_MENU)
+			_recreate_menu_content_tree(store, child, &iter,
+						    no_menu);
+	}
+}
+
+static void recreate_menu_content_tree(void)
+{
+	gtk_tree_store_clear(tree2);
+	if (browsed)
+		_recreate_menu_content_tree(tree2, browsed, NULL,
+					    view_mode == SPLIT_VIEW);
+	select_menu(GTK_TREE_VIEW(tree2_w), selected);
+	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
+}
+
 static void set_view_mode(enum view_mode mode)
 {
 	view_mode = mode;
@@ -280,7 +345,6 @@ static void set_view_mode(enum view_mode mode)
 		else
 			browsed = &rootmenu;
 		recreate_menu_content_tree();
-		select_menu(GTK_TREE_VIEW(tree2_w), selected);
 		gtk_widget_set_sensitive(single_btn, FALSE);
 		break;
 	case SPLIT_VIEW:
@@ -291,20 +355,12 @@ static void set_view_mode(enum view_mode mode)
 			else
 				browsed = menu_get_parent_menu(selected);
 		}
-		gtk_tree_store_clear(tree1);
-		display_tree(tree1, &rootmenu);
-		gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));
-		gtk_tree_store_clear(tree2);
-		if (browsed)
-			display_tree(tree2, browsed);
-		select_menu(GTK_TREE_VIEW(tree1_w), browsed);
-		select_menu(GTK_TREE_VIEW(tree2_w), selected);
+		recreate_menu_tree();
+		recreate_menu_content_tree();
 		gtk_widget_set_sensitive(split_btn, FALSE);
 		break;
 	case FULL_VIEW:
-		gtk_tree_store_clear(tree2);
-		display_tree(tree2, &rootmenu);
-		select_menu(GTK_TREE_VIEW(tree2_w), selected);
+		recreate_menu_tree();
 		gtk_widget_set_sensitive(full_btn, FALSE);
 		break;
 	}
@@ -917,83 +973,6 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 	return FALSE;
 }
 
-/* Display the whole tree (single/split/full view) */
-static void _display_tree(GtkTreeStore *tree, struct menu *menu,
-			  GtkTreeIter *parent)
-{
-	struct property *prop;
-	struct menu *child;
-	enum prop_type ptype;
-	GtkTreeIter iter;
-
-	for (child = menu->list; child; child = child->next) {
-		/*
-		 * REVISIT:
-		 * menu_finalize() creates empty "if" entries.
-		 * Do not confuse gtk_tree_model_get(), which would otherwise
-		 * return "if" menu entry.
-		 */
-		if (child->type == M_IF)
-			continue;
-
-		prop = child->prompt;
-		ptype = prop ? prop->type : P_UNKNOWN;
-
-		if ((view_mode == SPLIT_VIEW)
-		    && !(child->flags & MENU_ROOT) && (tree == tree1))
-			continue;
-
-		if ((view_mode == SPLIT_VIEW) && (child->flags & MENU_ROOT)
-		    && (tree == tree2))
-			continue;
-
-		gtk_tree_store_append(tree, &iter, parent);
-		set_node(tree, &iter, child);
-
-		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
-		    && (tree == tree2))
-			continue;
-/*
-		if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
-		    || (view_mode == FULL_VIEW)
-		    || (view_mode == SPLIT_VIEW))*/
-
-		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
-		    || (view_mode == FULL_VIEW)
-		    || (view_mode == SPLIT_VIEW))
-			_display_tree(tree, child, &iter);
-	}
-}
-
-static void display_tree(GtkTreeStore *store, struct menu *menu)
-{
-	_display_tree(store, menu, NULL);
-}
-
-/* Display a part of the tree starting at current node (single/split view) */
-static void recreate_menu_content_tree(void)
-{
-	gtk_tree_store_clear(tree2);
-	display_tree(tree2, browsed);
-	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
-}
-
-static void fixup_rootmenu(struct menu *menu)
-{
-	struct menu *child;
-	static int menu_cnt = 0;
-
-	menu->flags |= MENU_ROOT;
-	for (child = menu->list; child; child = child->next) {
-		if (child->prompt && child->prompt->type == P_MENU) {
-			menu_cnt++;
-			fixup_rootmenu(child);
-			menu_cnt--;
-		} else if (!menu_cnt)
-			fixup_rootmenu(child);
-	}
-}
-
 /* Main Window Initialization */
 static void replace_button_icon(GtkWidget *widget, const char * const xpm[])
 {
@@ -1354,7 +1333,6 @@ int main(int ac, char *av[])
 		name = av[1];
 
 	conf_parse(name);
-	fixup_rootmenu(&rootmenu);
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
-- 
2.43.0


