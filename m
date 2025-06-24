Return-Path: <linux-kbuild+bounces-7671-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499FBAE6A79
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F52C3BE0B5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140972EF9D7;
	Tue, 24 Jun 2025 15:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fxde2rzE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D233D2EF9C2;
	Tue, 24 Jun 2025 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777727; cv=none; b=KrOyNKfvU06pZdJOXx3wsgFUlhH42xWKd7O8GLpO0QSiDwY6Q4TSl9kyNNUYT+bDZBAhU8j4isZCoORx287zytVe9Uso5y98oO932OvnIy/F5XgXKFZgL4vKOu3oawKtldwHPmjEYZP2zdzwrLSOY58NV6Su/kEr4jPd2aoOGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777727; c=relaxed/simple;
	bh=dHj/8m+PzvEdiBpLDRqkqti7Prwdtu9fZA/ul8s9JWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T38sJ2fuNqXlb8QfyrNIgBwXpz2wV1jlxc0NmA3WEeG0j4CdJfQCKlEK2EVNRKUHKIoHN6sItilEVNIuimKXDcZ3Ji99G6HIbeKlPy6dd3KdoER8ptoZDqq1S5OlTytvhcuBLBXA+pGOl5UHogoswtFYbVRd6saJrSA5+nFRfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fxde2rzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0D2C4CEF1;
	Tue, 24 Jun 2025 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777727;
	bh=dHj/8m+PzvEdiBpLDRqkqti7Prwdtu9fZA/ul8s9JWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fxde2rzEZjiqeLGiV4x9/YbpF0fMJyiBZqOSbUfa80tBYNI9sfhjJWz7NV2JoOxK5
	 kOEdoSTY9TgWrXrtxCDjDe4Pw0VkRr7FaTvtSFkET58KCAd6cyaakYTv4swI5H9rDP
	 /os7ejyhwHUiRcX+q/4gQezGNLmpi/VxKXaD0EO4i04rmENs5jpO0XNBtXaWMSx1kR
	 iAfuZH0pzELmx42Li2MV435ip+8GgBBcFP+Vd7NDlIZb6AgJz2O9/mEzP9AqmK7BPI
	 0GYieIbwvanvry4mBIE4RnCWGWP9kvv/bCA+UYMfPEJqV5W3sRelU7eSvB28vxvOZ4
	 L/3u2oX4a2TEQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 44/66] kconfig: gconf: use GtkTreeModelFilter to control row visibility
Date: Wed, 25 Jun 2025 00:05:32 +0900
Message-ID: <20250624150645.1107002-45-masahiroy@kernel.org>
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

Currently, update_tree() adds/removes entries to show/hide rows.
This approach is extremely complicated.

Use the tree model filter to control row visibility instead.

Do not toggle the MENU_CHANGED flag, as it is hard to control
this correctly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 217 +++++++++++++++-------------------------
 1 file changed, 80 insertions(+), 137 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 184678dd4fa6..a0cc7cb98670 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -59,7 +59,9 @@ enum {
 static void display_list(void);
 static void display_tree(GtkTreeStore *store, struct menu *menu);
 static void display_tree_part(void);
-static void update_tree(struct menu *src, GtkTreeIter * dst);
+static gchar **fill_row(struct menu *menu);
+static void set_node(GtkTreeStore *tree, GtkTreeIter *node,
+		     struct menu *menu, gchar **row);
 
 static void conf_changed(bool dirty)
 {
@@ -110,6 +112,47 @@ static void select_menu(GtkTreeView *view, struct menu *match)
 	_select_menu(view, gtk_tree_view_get_model(view), NULL, match);
 }
 
+static void _update_row_visibility(GtkTreeView *view)
+{
+	GtkTreeModelFilter *filter = GTK_TREE_MODEL_FILTER(gtk_tree_view_get_model(view));
+
+	gtk_tree_model_filter_refilter(filter);
+}
+
+static void update_row_visibility(void)
+{
+	if (view_mode == SPLIT_VIEW)
+		_update_row_visibility(GTK_TREE_VIEW(tree1_w));
+	_update_row_visibility(GTK_TREE_VIEW(tree2_w));
+}
+
+static void _update_tree(GtkTreeStore *store, GtkTreeIter *parent)
+{
+	GtkTreeModel *model = GTK_TREE_MODEL(store);
+	GtkTreeIter iter;
+	gboolean valid;
+
+	valid = gtk_tree_model_iter_children(model, &iter, parent);
+	while (valid) {
+		struct menu *menu;
+
+		gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
+
+		if (menu)
+			set_node(store, &iter, menu, fill_row(menu));
+
+		_update_tree(store, &iter);
+
+		valid = gtk_tree_model_iter_next(model, &iter);
+	}
+}
+
+static void update_tree(GtkTreeStore *store)
+{
+	_update_tree(store, NULL);
+	update_row_visibility();
+}
+
 static void set_view_mode(enum view_mode mode)
 {
 	view_mode = mode;
@@ -328,24 +371,21 @@ static void on_set_option_mode1_activate(GtkMenuItem *menuitem,
 					 gpointer user_data)
 {
 	opt_mode = OPT_NORMAL;
-	gtk_tree_store_clear(tree2);
-	display_tree(tree2, &rootmenu);	/* instead of update_tree to speed-up */
+	update_row_visibility();
 }
 
 static void on_set_option_mode2_activate(GtkMenuItem *menuitem,
 					 gpointer user_data)
 {
 	opt_mode = OPT_ALL;
-	gtk_tree_store_clear(tree2);
-	display_tree(tree2, &rootmenu);	/* instead of update_tree to speed-up */
+	update_row_visibility();
 }
 
 static void on_set_option_mode3_activate(GtkMenuItem *menuitem,
 					 gpointer user_data)
 {
 	opt_mode = OPT_PROMPT;
-	gtk_tree_store_clear(tree2);
-	display_tree(tree2, &rootmenu);	/* instead of update_tree to speed-up */
+	update_row_visibility();
 }
 
 static void on_introduction1_activate(GtkMenuItem *menuitem, gpointer user_data)
@@ -559,7 +599,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 
 	sym_set_string_value(sym, new_def);
 
-	update_tree(&rootmenu, NULL);
+	update_tree(tree2);
 
 free:
 	gtk_tree_path_free(path);
@@ -590,9 +630,9 @@ static void change_sym_value(struct menu *menu, gint col)
 			newval = yes;
 		sym_set_tristate_value(sym, newval);
 		if (view_mode == FULL_VIEW)
-			update_tree(&rootmenu, NULL);
+			update_tree(tree2);
 		else if (view_mode == SPLIT_VIEW) {
-			update_tree(browsed, NULL);
+			update_tree(tree2);
 			display_list();
 		}
 		else if (view_mode == SINGLE_VIEW)
@@ -613,9 +653,9 @@ static void toggle_sym_value(struct menu *menu)
 
 	sym_toggle_tristate_value(menu->sym);
 	if (view_mode == FULL_VIEW)
-		update_tree(&rootmenu, NULL);
+		update_tree(tree2);
 	else if (view_mode == SPLIT_VIEW) {
-		update_tree(browsed, NULL);
+		update_tree(tree2);
 		display_list();
 	}
 	else if (view_mode == SINGLE_VIEW)
@@ -842,7 +882,6 @@ static gchar **fill_row(struct menu *menu)
 	row[COL_NAME] = g_strdup(sym->name);
 
 	sym_calc_value(sym);
-	menu->flags &= ~MENU_CHANGED;
 
 	if (sym_is_choice(sym)) {	// parse childs for getting final value
 		struct menu *child;
@@ -947,120 +986,6 @@ static void set_node(GtkTreeStore *tree, GtkTreeIter *node,
 	g_object_unref(pix);
 }
 
-/* Find a node in the GTK+ tree */
-static GtkTreeIter found;
-
-/*
- * Find a menu in the GtkTree starting at parent.
- */
-static GtkTreeIter *gtktree_iter_find_node(GtkTreeIter *parent,
-					   struct menu *tofind)
-{
-	GtkTreeIter iter;
-	GtkTreeIter *child = &iter;
-	gboolean valid;
-	GtkTreeIter *ret;
-
-	valid = gtk_tree_model_iter_children(model2, child, parent);
-	while (valid) {
-		struct menu *menu;
-
-		gtk_tree_model_get(model2, child, 6, &menu, -1);
-
-		if (menu == tofind) {
-			memcpy(&found, child, sizeof(GtkTreeIter));
-			return &found;
-		}
-
-		ret = gtktree_iter_find_node(child, tofind);
-		if (ret)
-			return ret;
-
-		valid = gtk_tree_model_iter_next(model2, child);
-	}
-
-	return NULL;
-}
-
-
-/*
- * Update the tree by adding/removing entries
- * Does not change other nodes
- */
-static void update_tree(struct menu *src, GtkTreeIter * dst)
-{
-	struct menu *child1;
-	GtkTreeIter iter, tmp;
-	GtkTreeIter *child2 = &iter;
-	gboolean valid;
-	GtkTreeIter *sibling;
-	struct symbol *sym;
-	struct menu *menu1, *menu2;
-
-	valid = gtk_tree_model_iter_children(model2, child2, dst);
-	for (child1 = src->list; child1; child1 = child1->next) {
-
-		sym = child1->sym;
-
-	      reparse:
-		menu1 = child1;
-		if (valid)
-			gtk_tree_model_get(model2, child2, COL_MENU,
-					   &menu2, -1);
-		else
-			menu2 = NULL;	// force adding of a first child
-
-		if ((opt_mode == OPT_NORMAL && !menu_is_visible(child1)) ||
-		    (opt_mode == OPT_PROMPT && !menu_has_prompt(child1)) ||
-		    (opt_mode == OPT_ALL    && !menu_get_prompt(child1))) {
-
-			/* remove node */
-			if (gtktree_iter_find_node(dst, menu1) != NULL) {
-				memcpy(&tmp, child2, sizeof(GtkTreeIter));
-				valid = gtk_tree_model_iter_next(model2,
-								 child2);
-				gtk_tree_store_remove(tree2, &tmp);
-				if (!valid)
-					return;		/* next parent */
-				else
-					goto reparse;	/* next child */
-			} else
-				continue;
-		}
-
-		if (menu1 != menu2) {
-			if (gtktree_iter_find_node(dst, menu1) == NULL) {	// add node
-				if (!valid && !menu2)
-					sibling = NULL;
-				else
-					sibling = child2;
-				gtk_tree_store_insert_before(tree2,
-							     child2,
-							     dst, sibling);
-				set_node(tree2, child2, menu1, fill_row(menu1));
-				if (menu2 == NULL)
-					valid = TRUE;
-			} else {	// remove node
-				memcpy(&tmp, child2, sizeof(GtkTreeIter));
-				valid = gtk_tree_model_iter_next(model2,
-								 child2);
-				gtk_tree_store_remove(tree2, &tmp);
-				if (!valid)
-					return;	// next parent
-				else
-					goto reparse;	// next child
-			}
-		} else if (sym && (child1->flags & MENU_CHANGED)) {
-			set_node(tree2, child2, menu1, fill_row(menu1));
-		}
-
-		update_tree(child1, child2);
-
-		valid = gtk_tree_model_iter_next(model2, child2);
-	}
-}
-
-
 /* Display the whole tree (single/split/full view) */
 static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 			  GtkTreeIter *parent)
@@ -1083,8 +1008,6 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 		prop = child->prompt;
 		ptype = prop ? prop->type : P_UNKNOWN;
 
-		menu->flags &= ~MENU_CHANGED;
-
 		if ((view_mode == SPLIT_VIEW)
 		    && !(child->flags & MENU_ROOT) && (tree == tree1))
 			continue;
@@ -1093,12 +1016,8 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 		    && (tree == tree2))
 			continue;
 
-		if ((opt_mode == OPT_NORMAL && menu_is_visible(child)) ||
-		    (opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
-		    (opt_mode == OPT_ALL    && menu_get_prompt(child))) {
-			gtk_tree_store_append(tree, &iter, parent);
-			set_node(tree, &iter, child, fill_row(child));
-		}
+		gtk_tree_store_append(tree, &iter, parent);
+		set_node(tree, &iter, child, fill_row(child));
 
 		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
 		    && (tree == tree2))
@@ -1313,6 +1232,20 @@ static void init_main_window(const gchar *glade_file)
 	gtk_widget_show(main_wnd);
 }
 
+static gboolean visible_func(GtkTreeModel *model, GtkTreeIter  *iter,
+			     gpointer data)
+{
+	struct menu *menu;
+
+	gtk_tree_model_get(model, iter, COL_MENU, &menu, -1);
+
+	if (!menu)
+		return FALSE;
+
+	return menu_is_visible(menu) || opt_mode == OPT_ALL ||
+		(opt_mode == OPT_PROMPT && menu_has_prompt(menu));
+}
+
 static void init_tree_model(void)
 {
 	tree2 = gtk_tree_store_new(COL_NUMBER,
@@ -1344,8 +1277,13 @@ static void init_left_tree(void)
 	GtkCellRenderer *renderer;
 	GtkTreeSelection *sel;
 	GtkTreeViewColumn *column;
+	GtkTreeModel *filter;
 
-	gtk_tree_view_set_model(view, model1);
+	filter = gtk_tree_model_filter_new(model1, NULL);
+
+	gtk_tree_model_filter_set_visible_func(GTK_TREE_MODEL_FILTER(filter),
+					       visible_func, NULL, NULL);
+	gtk_tree_view_set_model(view, filter);
 
 	column = gtk_tree_view_column_new();
 	gtk_tree_view_append_column(view, column);
@@ -1379,9 +1317,14 @@ static void init_right_tree(void)
 	GtkCellRenderer *renderer;
 	GtkTreeSelection *sel;
 	GtkTreeViewColumn *column;
+	GtkTreeModel *filter;
 	gint i;
 
-	gtk_tree_view_set_model(view, model2);
+	filter = gtk_tree_model_filter_new(model2, NULL);
+
+	gtk_tree_model_filter_set_visible_func(GTK_TREE_MODEL_FILTER(filter),
+					       visible_func, NULL, NULL);
+	gtk_tree_view_set_model(view, filter);
 
 	column = gtk_tree_view_column_new();
 	gtk_tree_view_append_column(view, column);
-- 
2.43.0


