Return-Path: <linux-kbuild+bounces-7651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D159AE6A55
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B259A3BEEE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11552E3393;
	Tue, 24 Jun 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXwbi44h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F4B2E338D;
	Tue, 24 Jun 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777685; cv=none; b=VawWoQ15RLkWCHo2Qs3LPWV7WRczhpCCvYnyG1ZMLmcwAmftaM/Z5vJ6DqAQcRw9mbHumcbuPJ4Wu9zRalBgGd2H/PQLR2H1JbnPn+nYLQHDawMZooPhbVZOjjPgVL/mJk9hIOEuW7vXinVRJuzVUTEdc11hpRGd23sTzwhklME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777685; c=relaxed/simple;
	bh=P9q77/PjbY5UNWBGZhkITuW0pMrWeEKN+OB48AdFtB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqUZDZiNOCA/XZIUId10ro/cIItfONNeNocmWGGRtHnEv16ijY2aXgqwA1nGOqleeDREyv9vI7s7SX5808qUUVf42+kuSxTflNN6Tjmqkw/pyUoszDZYAKBMCgL5KgkfuYOZDlxiYJKPQxQRL9Rk6D0gA440PVMjXVI2SIdd3kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXwbi44h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDD4C4CEE3;
	Tue, 24 Jun 2025 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777685;
	bh=P9q77/PjbY5UNWBGZhkITuW0pMrWeEKN+OB48AdFtB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mXwbi44hKPwkvOOAiBg1RvxWP0gJzQ/wk4IV/DJruNV+5LchvoGfOD8M7cmk3wMfU
	 gFKSjuRxJfC1ribB9FZieSHwx65apZGOJaf4Tkus2wOsFW0w97mb5CuoaNG/x0oz8T
	 y1gtLpjMsj7L4tFSvPbTXKym4b01bi2CXi722aAoTw1H6jFUj/QefUZ3b+yU4pzFS3
	 qeVMjgBv7IIucbuHt/ZopQi1SDMjdXq2+fjf9YzcyzXctoasYH4rMW3hA0s7AkXRs0
	 XPGQCwXurWsj7g7H/knQ9wZP4+Iewy2jAi3/hiXfptMutsb/9XHEgDrxaFeafxW70Q
	 Agj604Mf6n4pQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/66] kconfig: gconf: move init_*() functions below
Date: Wed, 25 Jun 2025 00:05:12 +0900
Message-ID: <20250624150645.1107002-25-masahiroy@kernel.org>
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

This allows removal of the forward declaration of renderer_edited().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 450 ++++++++++++++++++++--------------------
 1 file changed, 222 insertions(+), 228 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 0d5a02706bcb..9d06c050b270 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -62,240 +62,12 @@ static void display_tree(struct menu *menu);
 static void display_tree_part(void);
 static void update_tree(struct menu *src, GtkTreeIter * dst);
 
-static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
-				GtkStyle *style, gchar *btn_name, gchar **xpm)
-{
-	GdkPixmap *pixmap;
-	GdkBitmap *mask;
-	GtkToolButton *button;
-	GtkWidget *image;
-
-	pixmap = gdk_pixmap_create_from_xpm_d(window, &mask,
-					      &style->bg[GTK_STATE_NORMAL],
-					      xpm);
-
-	button = GTK_TOOL_BUTTON(glade_xml_get_widget(xml, btn_name));
-	image = gtk_image_new_from_pixmap(pixmap, mask);
-	gtk_widget_show(image);
-	gtk_tool_button_set_icon_widget(button, image);
-}
-
 static void conf_changed(bool dirty)
 {
 	gtk_widget_set_sensitive(save_btn, dirty);
 	gtk_widget_set_sensitive(save_menu_item, dirty);
 }
 
-/* Main Window Initialization */
-static void init_main_window(const gchar *glade_file)
-{
-	GladeXML *xml;
-	GtkWidget *widget;
-	GtkTextBuffer *txtbuf;
-	GtkStyle *style;
-
-	xml = glade_xml_new(glade_file, "window1", NULL);
-	if (!xml)
-		g_error("GUI loading failed !\n");
-	glade_xml_signal_autoconnect(xml);
-
-	main_wnd = glade_xml_get_widget(xml, "window1");
-	hpaned = glade_xml_get_widget(xml, "hpaned1");
-	vpaned = glade_xml_get_widget(xml, "vpaned1");
-	tree1_w = glade_xml_get_widget(xml, "treeview1");
-	tree2_w = glade_xml_get_widget(xml, "treeview2");
-	text_w = glade_xml_get_widget(xml, "textview3");
-
-	back_btn = glade_xml_get_widget(xml, "button1");
-	gtk_widget_set_sensitive(back_btn, FALSE);
-
-	widget = glade_xml_get_widget(xml, "show_name1");
-	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
-				       show_name);
-
-	widget = glade_xml_get_widget(xml, "show_range1");
-	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
-				       show_range);
-
-	widget = glade_xml_get_widget(xml, "show_data1");
-	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
-				       show_value);
-
-	save_btn = glade_xml_get_widget(xml, "button3");
-	save_menu_item = glade_xml_get_widget(xml, "save1");
-	conf_set_changed_callback(conf_changed);
-
-	style = gtk_widget_get_style(main_wnd);
-
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button4", (gchar **) xpm_single_view);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button5", (gchar **) xpm_split_view);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button6", (gchar **) xpm_tree_view);
-
-	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
-	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
-					  "foreground", "red",
-					  "weight", PANGO_WEIGHT_BOLD,
-					  NULL);
-	tag2 = gtk_text_buffer_create_tag(txtbuf, "mytag2",
-					  /*"style", PANGO_STYLE_OBLIQUE, */
-					  NULL);
-
-	gtk_window_set_title(GTK_WINDOW(main_wnd), rootmenu.prompt->text);
-
-	gtk_widget_show(main_wnd);
-}
-
-static void init_tree_model(void)
-{
-	tree = tree2 = gtk_tree_store_new(COL_NUMBER,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_POINTER, GDK_TYPE_COLOR,
-					  G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
-					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-					  G_TYPE_BOOLEAN);
-	model2 = GTK_TREE_MODEL(tree2);
-
-	tree1 = gtk_tree_store_new(COL_NUMBER,
-				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_POINTER, GDK_TYPE_COLOR,
-				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
-				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-				   G_TYPE_BOOLEAN);
-	model1 = GTK_TREE_MODEL(tree1);
-}
-
-static void init_left_tree(void)
-{
-	GtkTreeView *view = GTK_TREE_VIEW(tree1_w);
-	GtkCellRenderer *renderer;
-	GtkTreeSelection *sel;
-	GtkTreeViewColumn *column;
-
-	gtk_tree_view_set_model(view, model1);
-
-	column = gtk_tree_view_column_new();
-	gtk_tree_view_append_column(view, column);
-	gtk_tree_view_column_set_title(column, "Options");
-
-	renderer = gtk_cell_renderer_toggle_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "active", COL_BTNACT,
-					    "inconsistent", COL_BTNINC,
-					    "visible", COL_BTNVIS,
-					    "radio", COL_BTNRAD, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "text", COL_OPTION,
-					    "foreground-gdk",
-					    COL_COLOR, NULL);
-
-	sel = gtk_tree_view_get_selection(view);
-	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
-}
-
-static void renderer_edited(GtkCellRendererText * cell,
-			    const gchar * path_string,
-			    const gchar * new_text, gpointer user_data);
-
-static void init_right_tree(void)
-{
-	GtkTreeView *view = GTK_TREE_VIEW(tree2_w);
-	GtkCellRenderer *renderer;
-	GtkTreeSelection *sel;
-	GtkTreeViewColumn *column;
-	gint i;
-
-	gtk_tree_view_set_model(view, model2);
-
-	column = gtk_tree_view_column_new();
-	gtk_tree_view_append_column(view, column);
-	gtk_tree_view_column_set_title(column, "Options");
-
-	renderer = gtk_cell_renderer_pixbuf_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "pixbuf", COL_PIXBUF,
-					    "visible", COL_PIXVIS, NULL);
-	renderer = gtk_cell_renderer_toggle_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "active", COL_BTNACT,
-					    "inconsistent", COL_BTNINC,
-					    "visible", COL_BTNVIS,
-					    "radio", COL_BTNRAD, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
-					renderer, FALSE);
-	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
-					    renderer,
-					    "text", COL_OPTION,
-					    "foreground-gdk",
-					    COL_COLOR, NULL);
-
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "Name", renderer,
-						    "text", COL_NAME,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "N", renderer,
-						    "text", COL_NO,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "M", renderer,
-						    "text", COL_MOD,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "Y", renderer,
-						    "text", COL_YES,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	renderer = gtk_cell_renderer_text_new();
-	gtk_tree_view_insert_column_with_attributes(view, -1,
-						    "Value", renderer,
-						    "text", COL_VALUE,
-						    "editable",
-						    COL_EDIT,
-						    "foreground-gdk",
-						    COL_COLOR, NULL);
-	g_signal_connect(G_OBJECT(renderer), "edited",
-			 G_CALLBACK(renderer_edited), NULL);
-
-	for (i = 0; i < COL_VALUE; i++) {
-		column = gtk_tree_view_get_column(view, i);
-		gtk_tree_view_column_set_resizable(column, TRUE);
-	}
-
-	sel = gtk_tree_view_get_selection(view);
-	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
-}
-
-
 /* Utility Functions */
 
 
@@ -1324,6 +1096,228 @@ static void fixup_rootmenu(struct menu *menu)
 	}
 }
 
+/* Main Window Initialization */
+static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
+				GtkStyle *style, gchar *btn_name, gchar **xpm)
+{
+	GdkPixmap *pixmap;
+	GdkBitmap *mask;
+	GtkToolButton *button;
+	GtkWidget *image;
+
+	pixmap = gdk_pixmap_create_from_xpm_d(window, &mask,
+					      &style->bg[GTK_STATE_NORMAL],
+					      xpm);
+
+	button = GTK_TOOL_BUTTON(glade_xml_get_widget(xml, btn_name));
+	image = gtk_image_new_from_pixmap(pixmap, mask);
+	gtk_widget_show(image);
+	gtk_tool_button_set_icon_widget(button, image);
+}
+
+static void init_main_window(const gchar *glade_file)
+{
+	GladeXML *xml;
+	GtkWidget *widget;
+	GtkTextBuffer *txtbuf;
+	GtkStyle *style;
+
+	xml = glade_xml_new(glade_file, "window1", NULL);
+	if (!xml)
+		g_error("GUI loading failed !\n");
+	glade_xml_signal_autoconnect(xml);
+
+	main_wnd = glade_xml_get_widget(xml, "window1");
+	hpaned = glade_xml_get_widget(xml, "hpaned1");
+	vpaned = glade_xml_get_widget(xml, "vpaned1");
+	tree1_w = glade_xml_get_widget(xml, "treeview1");
+	tree2_w = glade_xml_get_widget(xml, "treeview2");
+	text_w = glade_xml_get_widget(xml, "textview3");
+
+	back_btn = glade_xml_get_widget(xml, "button1");
+	gtk_widget_set_sensitive(back_btn, FALSE);
+
+	widget = glade_xml_get_widget(xml, "show_name1");
+	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
+				       show_name);
+
+	widget = glade_xml_get_widget(xml, "show_range1");
+	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
+				       show_range);
+
+	widget = glade_xml_get_widget(xml, "show_data1");
+	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
+				       show_value);
+
+	save_btn = glade_xml_get_widget(xml, "button3");
+	save_menu_item = glade_xml_get_widget(xml, "save1");
+	conf_set_changed_callback(conf_changed);
+
+	style = gtk_widget_get_style(main_wnd);
+
+	replace_button_icon(xml, main_wnd->window, style,
+			    "button4", (gchar **) xpm_single_view);
+	replace_button_icon(xml, main_wnd->window, style,
+			    "button5", (gchar **) xpm_split_view);
+	replace_button_icon(xml, main_wnd->window, style,
+			    "button6", (gchar **) xpm_tree_view);
+
+	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
+	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
+					  "foreground", "red",
+					  "weight", PANGO_WEIGHT_BOLD,
+					  NULL);
+	tag2 = gtk_text_buffer_create_tag(txtbuf, "mytag2",
+					  /*"style", PANGO_STYLE_OBLIQUE, */
+					  NULL);
+
+	gtk_window_set_title(GTK_WINDOW(main_wnd), rootmenu.prompt->text);
+
+	gtk_widget_show(main_wnd);
+}
+
+static void init_tree_model(void)
+{
+	tree = tree2 = gtk_tree_store_new(COL_NUMBER,
+					  G_TYPE_STRING, G_TYPE_STRING,
+					  G_TYPE_STRING, G_TYPE_STRING,
+					  G_TYPE_STRING, G_TYPE_STRING,
+					  G_TYPE_POINTER, GDK_TYPE_COLOR,
+					  G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
+					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+					  G_TYPE_BOOLEAN);
+	model2 = GTK_TREE_MODEL(tree2);
+
+	tree1 = gtk_tree_store_new(COL_NUMBER,
+				   G_TYPE_STRING, G_TYPE_STRING,
+				   G_TYPE_STRING, G_TYPE_STRING,
+				   G_TYPE_STRING, G_TYPE_STRING,
+				   G_TYPE_POINTER, GDK_TYPE_COLOR,
+				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
+				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				   G_TYPE_BOOLEAN);
+	model1 = GTK_TREE_MODEL(tree1);
+}
+
+static void init_left_tree(void)
+{
+	GtkTreeView *view = GTK_TREE_VIEW(tree1_w);
+	GtkCellRenderer *renderer;
+	GtkTreeSelection *sel;
+	GtkTreeViewColumn *column;
+
+	gtk_tree_view_set_model(view, model1);
+
+	column = gtk_tree_view_column_new();
+	gtk_tree_view_append_column(view, column);
+	gtk_tree_view_column_set_title(column, "Options");
+
+	renderer = gtk_cell_renderer_toggle_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "active", COL_BTNACT,
+					    "inconsistent", COL_BTNINC,
+					    "visible", COL_BTNVIS,
+					    "radio", COL_BTNRAD, NULL);
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "text", COL_OPTION,
+					    "foreground-gdk",
+					    COL_COLOR, NULL);
+
+	sel = gtk_tree_view_get_selection(view);
+	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
+}
+
+static void init_right_tree(void)
+{
+	GtkTreeView *view = GTK_TREE_VIEW(tree2_w);
+	GtkCellRenderer *renderer;
+	GtkTreeSelection *sel;
+	GtkTreeViewColumn *column;
+	gint i;
+
+	gtk_tree_view_set_model(view, model2);
+
+	column = gtk_tree_view_column_new();
+	gtk_tree_view_append_column(view, column);
+	gtk_tree_view_column_set_title(column, "Options");
+
+	renderer = gtk_cell_renderer_pixbuf_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "pixbuf", COL_PIXBUF,
+					    "visible", COL_PIXVIS, NULL);
+	renderer = gtk_cell_renderer_toggle_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "active", COL_BTNACT,
+					    "inconsistent", COL_BTNINC,
+					    "visible", COL_BTNVIS,
+					    "radio", COL_BTNRAD, NULL);
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
+					renderer, FALSE);
+	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
+					    renderer,
+					    "text", COL_OPTION,
+					    "foreground-gdk",
+					    COL_COLOR, NULL);
+
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "Name", renderer,
+						    "text", COL_NAME,
+						    "foreground-gdk",
+						    COL_COLOR, NULL);
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "N", renderer,
+						    "text", COL_NO,
+						    "foreground-gdk",
+						    COL_COLOR, NULL);
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "M", renderer,
+						    "text", COL_MOD,
+						    "foreground-gdk",
+						    COL_COLOR, NULL);
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "Y", renderer,
+						    "text", COL_YES,
+						    "foreground-gdk",
+						    COL_COLOR, NULL);
+	renderer = gtk_cell_renderer_text_new();
+	gtk_tree_view_insert_column_with_attributes(view, -1,
+						    "Value", renderer,
+						    "text", COL_VALUE,
+						    "editable",
+						    COL_EDIT,
+						    "foreground-gdk",
+						    COL_COLOR, NULL);
+	g_signal_connect(G_OBJECT(renderer), "edited",
+			 G_CALLBACK(renderer_edited), NULL);
+
+	for (i = 0; i < COL_VALUE; i++) {
+		column = gtk_tree_view_get_column(view, i);
+		gtk_tree_view_column_set_resizable(column, TRUE);
+	}
+
+	sel = gtk_tree_view_get_selection(view);
+	gtk_tree_selection_set_mode(sel, GTK_SELECTION_SINGLE);
+}
 
 /* Main */
 int main(int ac, char *av[])
-- 
2.43.0


