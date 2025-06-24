Return-Path: <linux-kbuild+bounces-7674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47205AE6ACD
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13F901C21485
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCA02F3C0A;
	Tue, 24 Jun 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bToGsVnl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13382F3C02;
	Tue, 24 Jun 2025 15:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777733; cv=none; b=Xw3nIyvWkhuIIYNLF3xVC52soLFXDwC/Yz4BA+gv3uMlM15A9XTNwokTTnsRVovVfI4YzxLig+hFWebdeM5JuWKD2bD1+NgCePx1TVj8xp393rnhLwcnmC7Apkbec0zHIPACnVExby1rLMie2WPbPf0FQROJ7gydPOuChkHcVyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777733; c=relaxed/simple;
	bh=824f8DlEQgSpnKuIo6VOnt4KdtWe09eG9Iq5JKNcA5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UzpdmJ1huJw+vivxRwXBWCbdiVggV0I9oTTq2M34kx0o4KLp3Vhb3Q4nrwp282yytyuGRSh6UY1ZGSo6Y1xIdZQUX1dBH0TgLDSzJqgWaCn+fCldyKSQSLYMRQ/+P0+alWo8NMEmc3l2hbWNbC/USE1JlAsYU94PG01BqS6W+zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bToGsVnl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AB4C4CEF3;
	Tue, 24 Jun 2025 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777733;
	bh=824f8DlEQgSpnKuIo6VOnt4KdtWe09eG9Iq5JKNcA5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bToGsVnlDrldMN/c/S4MSB0PccHJWCVOoyXCP5WUJKixgUeCXJIKI6tDNnX2mJfyb
	 yCepNOO0PUZJiRJKw8QQFDoacFclifQTskcMvZWGGQSiVR6VZmG+6H28lrvL/t5pj0
	 ojutSlSi7LzbOtaCGRoL26fEjmijUBpO98UhR7wG9giJgYIWEPFHp7eX5QmzqeK5W9
	 qAaQJIDkNztdHp4puidd1aoEVCtbugade9Ej/JR3t391MHcephPagsNqaiYQNK5t8K
	 Ob/pbjMiYgqnDda1Z7OiycXa8L21D6YhRJWHIPuhZ4YIJ0t7qB9EFhWgRMebI6vvda
	 zYawMgkBZCh+Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 47/66] kconfig: gconf: inline fill_row() into set_node()
Date: Wed, 25 Jun 2025 00:05:35 +0900
Message-ID: <20250624150645.1107002-48-masahiroy@kernel.org>
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

The row[] array is used to prepare data passed to set_node(), but this
indirection is unnecessary. Squash fill_row() into set_node() and call
gtk_tree_store_set() directly.

Also, calling gdk_pixbuf_new_from_xpm_data() for every row is
inefficient. Call it once and store the resulting pixbuf in a global
variable.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 272 ++++++++++++++++------------------------
 1 file changed, 106 insertions(+), 166 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 0977d906bea6..0b73ba9eca14 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -44,6 +44,7 @@ static GtkWidget *save_menu_item;
 static GtkTextTag *tag1, *tag2;
 
 static GtkTreeStore *tree1, *tree2;
+static GdkPixbuf *pix_menu;
 
 static struct menu *browsed; // browsed menu for SINGLE/SPLIT view
 static struct menu *selected; // selected entry
@@ -58,9 +59,6 @@ enum {
 static void display_list(void);
 static void display_tree(GtkTreeStore *store, struct menu *menu);
 static void display_tree_part(void);
-static gchar **fill_row(struct menu *menu);
-static void set_node(GtkTreeStore *tree, GtkTreeIter *node,
-		     struct menu *menu, gchar **row);
 
 static void conf_changed(bool dirty)
 {
@@ -125,6 +123,104 @@ static void update_row_visibility(void)
 	_update_row_visibility(GTK_TREE_VIEW(tree2_w));
 }
 
+static void set_node(GtkTreeStore *tree, GtkTreeIter *node, struct menu *menu)
+{
+	struct symbol *sym = menu->sym;
+	tristate val;
+	gchar *option;
+	const gchar *_no = "";
+	const gchar *_mod = "";
+	const gchar *_yes = "";
+	const gchar *value = "";
+	GdkColor color;
+	gboolean editable = FALSE;
+	gboolean btnvis = FALSE;
+
+	option = g_strdup_printf("%s %s %s %s",
+				 menu->type == M_COMMENT ? "***" : "",
+				 menu_get_prompt(menu),
+				 menu->type == M_COMMENT ? "***" : "",
+				 sym && !sym_has_value(sym) ? "(NEW)" : "");
+
+	gdk_color_parse(menu_is_visible(menu) ? "Black" : "DarkGray", &color);
+
+	if (!sym)
+		goto set;
+
+	sym_calc_value(sym);
+
+	if (menu->type == M_CHOICE) {	// parse children to get a final value
+		struct symbol *def_sym = sym_calc_choice(menu);
+		struct menu *def_menu = NULL;
+
+		for (struct menu *child = menu->list; child; child = child->next) {
+			if (menu_is_visible(child) && child->sym == def_sym)
+				def_menu = child;
+		}
+
+		if (def_menu)
+			value = menu_get_prompt(def_menu);
+
+		goto set;
+	}
+
+	switch (sym_get_type(sym)) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+
+		btnvis = TRUE;
+
+		val = sym_get_tristate_value(sym);
+		switch (val) {
+		case no:
+			_no = "N";
+			value = "N";
+			break;
+		case mod:
+			_mod = "M";
+			value = "M";
+			break;
+		case yes:
+			_yes = "Y";
+			value = "Y";
+			break;
+		}
+
+		if (val != no && sym_tristate_within_range(sym, no))
+			_no = "_";
+		if (val != mod && sym_tristate_within_range(sym, mod))
+			_mod = "_";
+		if (val != yes && sym_tristate_within_range(sym, yes))
+			_yes = "_";
+		break;
+	default:
+		value = sym_get_string_value(sym);
+		editable = TRUE;
+		break;
+	}
+
+set:
+	gtk_tree_store_set(tree, node,
+			   COL_OPTION, option,
+			   COL_NAME, sym ? sym->name : "",
+			   COL_NO, _no,
+			   COL_MOD, _mod,
+			   COL_YES, _yes,
+			   COL_VALUE, value,
+			   COL_MENU, (gpointer) menu,
+			   COL_COLOR, &color,
+			   COL_EDIT, editable,
+			   COL_PIXBUF, pix_menu,
+			   COL_PIXVIS, view_mode == SINGLE_VIEW && menu->type == M_MENU,
+			   COL_BTNVIS, btnvis,
+			   COL_BTNACT, _yes[0] == 'Y',
+			   COL_BTNINC, _mod[0] == 'M',
+			   COL_BTNRAD, sym && sym_is_choice_value(sym),
+			   -1);
+
+	g_free(option);
+}
+
 static void _update_tree(GtkTreeStore *store, GtkTreeIter *parent)
 {
 	GtkTreeModel *model = GTK_TREE_MODEL(store);
@@ -138,7 +234,7 @@ static void _update_tree(GtkTreeStore *store, GtkTreeIter *parent)
 		gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 
 		if (menu)
-			set_node(store, &iter, menu, fill_row(menu));
+			set_node(store, &iter, menu);
 
 		_update_tree(store, &iter);
 
@@ -563,6 +659,9 @@ static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 
 	gtk_widget_destroy(dialog);
 
+	if (!ret)
+		g_object_unref(pix_menu);
+
 	return ret;
 }
 
@@ -824,167 +923,6 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 	return FALSE;
 }
 
-
-/* Fill a row of strings */
-static gchar **fill_row(struct menu *menu)
-{
-	static gchar *row[COL_NUMBER];
-	struct symbol *sym = menu->sym;
-	const char *def;
-	int stype;
-	tristate val;
-	enum prop_type ptype;
-	int i;
-
-	for (i = COL_OPTION; i <= COL_COLOR; i++)
-		g_free(row[i]);
-	bzero(row, sizeof(row));
-
-	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
-
-	row[COL_OPTION] =
-	    g_strdup_printf("%s %s %s %s",
-			    ptype == P_COMMENT ? "***" : "",
-			    menu_get_prompt(menu),
-			    ptype == P_COMMENT ? "***" : "",
-			    sym && !sym_has_value(sym) ? "(NEW)" : "");
-
-	if (opt_mode == OPT_ALL && !menu_is_visible(menu))
-		row[COL_COLOR] = g_strdup("DarkGray");
-	else if (opt_mode == OPT_PROMPT &&
-			menu_has_prompt(menu) && !menu_is_visible(menu))
-		row[COL_COLOR] = g_strdup("DarkGray");
-	else
-		row[COL_COLOR] = g_strdup("Black");
-
-	switch (ptype) {
-	case P_MENU:
-		row[COL_PIXBUF] = (gchar *) xpm_menu;
-		if (view_mode == SINGLE_VIEW)
-			row[COL_PIXVIS] = GINT_TO_POINTER(TRUE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-		break;
-	case P_COMMENT:
-		row[COL_PIXBUF] = (gchar *) xpm_void;
-		row[COL_PIXVIS] = GINT_TO_POINTER(FALSE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-		break;
-	default:
-		row[COL_PIXBUF] = (gchar *) xpm_void;
-		row[COL_PIXVIS] = GINT_TO_POINTER(FALSE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(TRUE);
-		break;
-	}
-
-	if (!sym)
-		return row;
-	row[COL_NAME] = g_strdup(sym->name);
-
-	sym_calc_value(sym);
-
-	if (sym_is_choice(sym)) {	// parse childs for getting final value
-		struct menu *child;
-		struct symbol *def_sym = sym_calc_choice(menu);
-		struct menu *def_menu = NULL;
-
-		for (child = menu->list; child; child = child->next) {
-			if (menu_is_visible(child)
-			    && child->sym == def_sym)
-				def_menu = child;
-		}
-
-		if (def_menu)
-			row[COL_VALUE] =
-			    g_strdup(menu_get_prompt(def_menu));
-
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-		return row;
-	}
-	if (sym_is_choice_value(sym))
-		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
-
-	stype = sym_get_type(sym);
-	switch (stype) {
-	case S_BOOLEAN:
-	case S_TRISTATE:
-		val = sym_get_tristate_value(sym);
-		switch (val) {
-		case no:
-			row[COL_NO] = g_strdup("N");
-			row[COL_VALUE] = g_strdup("N");
-			row[COL_BTNACT] = GINT_TO_POINTER(FALSE);
-			row[COL_BTNINC] = GINT_TO_POINTER(FALSE);
-			break;
-		case mod:
-			row[COL_MOD] = g_strdup("M");
-			row[COL_VALUE] = g_strdup("M");
-			row[COL_BTNINC] = GINT_TO_POINTER(TRUE);
-			break;
-		case yes:
-			row[COL_YES] = g_strdup("Y");
-			row[COL_VALUE] = g_strdup("Y");
-			row[COL_BTNACT] = GINT_TO_POINTER(TRUE);
-			row[COL_BTNINC] = GINT_TO_POINTER(FALSE);
-			break;
-		}
-
-		if (val != no && sym_tristate_within_range(sym, no))
-			row[COL_NO] = g_strdup("_");
-		if (val != mod && sym_tristate_within_range(sym, mod))
-			row[COL_MOD] = g_strdup("_");
-		if (val != yes && sym_tristate_within_range(sym, yes))
-			row[COL_YES] = g_strdup("_");
-		break;
-	case S_INT:
-	case S_HEX:
-	case S_STRING:
-		def = sym_get_string_value(sym);
-		row[COL_VALUE] = g_strdup(def);
-		row[COL_EDIT] = GINT_TO_POINTER(TRUE);
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-		break;
-	}
-
-	return row;
-}
-
-
-/* Set the node content with a row of strings */
-static void set_node(GtkTreeStore *tree, GtkTreeIter *node,
-		     struct menu *menu, gchar **row)
-{
-	GdkColor color;
-	gboolean success;
-	GdkPixbuf *pix;
-
-	pix = gdk_pixbuf_new_from_xpm_data((const char **)
-					   row[COL_PIXBUF]);
-
-	gdk_color_parse(row[COL_COLOR], &color);
-	gdk_colormap_alloc_colors(gdk_colormap_get_system(), &color, 1,
-				  FALSE, FALSE, &success);
-
-	gtk_tree_store_set(tree, node,
-			   COL_OPTION, row[COL_OPTION],
-			   COL_NAME, row[COL_NAME],
-			   COL_NO, row[COL_NO],
-			   COL_MOD, row[COL_MOD],
-			   COL_YES, row[COL_YES],
-			   COL_VALUE, row[COL_VALUE],
-			   COL_MENU, (gpointer) menu,
-			   COL_COLOR, &color,
-			   COL_EDIT, GPOINTER_TO_INT(row[COL_EDIT]),
-			   COL_PIXBUF, pix,
-			   COL_PIXVIS, GPOINTER_TO_INT(row[COL_PIXVIS]),
-			   COL_BTNVIS, GPOINTER_TO_INT(row[COL_BTNVIS]),
-			   COL_BTNACT, GPOINTER_TO_INT(row[COL_BTNACT]),
-			   COL_BTNINC, GPOINTER_TO_INT(row[COL_BTNINC]),
-			   COL_BTNRAD, GPOINTER_TO_INT(row[COL_BTNRAD]),
-			   -1);
-
-	g_object_unref(pix);
-}
-
 /* Display the whole tree (single/split/full view) */
 static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 			  GtkTreeIter *parent)
@@ -1016,7 +954,7 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 			continue;
 
 		gtk_tree_store_append(tree, &iter, parent);
-		set_node(tree, &iter, child, fill_row(child));
+		set_node(tree, &iter, child);
 
 		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
 		    && (tree == tree2))
@@ -1384,6 +1322,8 @@ static void init_right_tree(void)
 	g_signal_connect(G_OBJECT(renderer), "edited",
 			 G_CALLBACK(renderer_edited), tree2_w);
 
+	pix_menu = gdk_pixbuf_new_from_xpm_data((const char **)xpm_menu);
+
 	for (i = 0; i < COL_VALUE; i++) {
 		column = gtk_tree_view_get_column(view, i);
 		gtk_tree_view_column_set_resizable(column, TRUE);
-- 
2.43.0


