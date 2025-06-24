Return-Path: <linux-kbuild+bounces-7657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 494FAAE6A5F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CDB85A32E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61F22E7624;
	Tue, 24 Jun 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NH+4mwGQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03042E7620;
	Tue, 24 Jun 2025 15:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777699; cv=none; b=HsKtDQ0z+Aoe+aTvW4mEyLt5fiu+V0YFECWXrwCssUmJg4XNg1faoHmWS2qaCh+kM687XgUX5S+jHiBPpU/zT7jyjoi5yp8ct9wrBRjaeGCB2QkhKU0GQ4n40m0rr0NTGFUXeiFsym1cV1sQsQZMn38vVw5SDD4Cj8pkhyO/YSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777699; c=relaxed/simple;
	bh=72XpK3F7rwXAaYkJRYBXWfX1Fa8/pabtr/KOcOc5e5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjZu0tu+3T7T4hsm1dhrS28idvc80uoxEnd1+giUdsqmsk4G0/AT47UoJtTZMM2OrqM/pdxtC2dd7OZcdfJfKeMDkssynreor0CZLoukpGzCLWAsfnJQgT4sZfyFYCu9LowMJzrR0AYOheX0enqEZRLvIp+oBZnfkrZ+sPJeUfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NH+4mwGQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CC4C4CEEE;
	Tue, 24 Jun 2025 15:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777696;
	bh=72XpK3F7rwXAaYkJRYBXWfX1Fa8/pabtr/KOcOc5e5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NH+4mwGQ6AD4pcBZy85D4No2JNpZZFLqP6kairiVZQGP5CXf2/SO1xXjBuTp/BB5F
	 vFD4wUWol/IUJydU7uuLJC0GD7/J/tleAW2mdfJO21TgQcj5Jp9f3qDM9dFGQSfuC6
	 wb8gT2lhlS++dGFLYDhNR/V0KNVWxljfyRBLU4Rg80ECVdGCyYYk8dP8ilvT/h46Gf
	 WH08Btyf4ANfc2YKM0MyjSPJP5kA3WinuSuhUqkPyR1uWJwZ71jqOjKQvarFPyxGIi
	 zll3iPjfBSaZPVUSbAryf3Tf5E+dGL+A68W4k+drWLjth69z1S0oVIVkN9pGLHkvLl
	 ivga1b1DJKVSw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 29/66] kconfig: gconf: add static qualifiers to event handlers
Date: Wed, 25 Jun 2025 00:05:17 +0900
Message-ID: <20250624150645.1107002-30-masahiroy@kernel.org>
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

This fixes several -Wmissing-prototypes warnings.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c     | 173 +++++++++++++++++++++++++-----------
 scripts/kconfig/gconf.glade |  30 -------
 2 files changed, 120 insertions(+), 83 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index bed4c86c2085..02bbb7ce4c4a 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -172,7 +172,7 @@ load_filename(GtkFileSelection * file_selector, gpointer user_data)
 		display_tree_part();
 }
 
-void on_load1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_load1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *fs;
 
@@ -191,8 +191,7 @@ void on_load1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	gtk_widget_show(fs);
 }
 
-
-void on_save_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_save_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	if (conf_write(NULL))
 		text_insert_msg("Error", "Unable to save configuration !");
@@ -214,7 +213,7 @@ store_filename(GtkFileSelection * file_selector, gpointer user_data)
 	gtk_widget_destroy(GTK_WIDGET(user_data));
 }
 
-void on_save_as1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_save_as1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *fs;
 
@@ -233,7 +232,7 @@ void on_save_as1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	gtk_widget_show(fs);
 }
 
-void on_show_name1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_show_name1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
@@ -243,8 +242,7 @@ void on_show_name1_activate(GtkMenuItem * menuitem, gpointer user_data)
 		gtk_tree_view_column_set_visible(col, show_name);
 }
 
-
-void on_show_range1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_show_range1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
@@ -261,8 +259,7 @@ void on_show_range1_activate(GtkMenuItem * menuitem, gpointer user_data)
 
 }
 
-
-void on_show_data1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_show_data1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
@@ -272,35 +269,31 @@ void on_show_data1_activate(GtkMenuItem * menuitem, gpointer user_data)
 		gtk_tree_view_column_set_visible(col, show_value);
 }
 
-
-void
-on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data)
+static void on_set_option_mode1_activate(GtkMenuItem *menuitem,
+					 gpointer user_data)
 {
 	opt_mode = OPT_NORMAL;
 	gtk_tree_store_clear(tree2);
 	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
-
-void
-on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data)
+static void on_set_option_mode2_activate(GtkMenuItem *menuitem,
+					 gpointer user_data)
 {
 	opt_mode = OPT_ALL;
 	gtk_tree_store_clear(tree2);
 	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
-
-void
-on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
+static void on_set_option_mode3_activate(GtkMenuItem *menuitem,
+					 gpointer user_data)
 {
 	opt_mode = OPT_PROMPT;
 	gtk_tree_store_clear(tree2);
 	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
-
-void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_introduction1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
 	const gchar *intro_text =
@@ -327,8 +320,7 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	gtk_widget_show_all(dialog);
 }
 
-
-void on_about1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_about1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
 	const gchar *about_text =
@@ -345,8 +337,7 @@ void on_about1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	gtk_widget_show_all(dialog);
 }
 
-
-void on_license1_activate(GtkMenuItem * menuitem, gpointer user_data)
+static void on_license1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkWidget *dialog;
 	const gchar *license_text =
@@ -364,8 +355,8 @@ void on_license1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	gtk_widget_show_all(dialog);
 }
 
-
-void on_back_clicked(GtkButton * button, gpointer user_data)
+/* toolbar handlers */
+static void on_back_clicked(GtkButton *button, gpointer user_data)
 {
 	enum prop_type ptype;
 
@@ -379,50 +370,44 @@ void on_back_clicked(GtkButton * button, gpointer user_data)
 		gtk_widget_set_sensitive(back_btn, FALSE);
 }
 
-
-void on_load_clicked(GtkButton * button, gpointer user_data)
+static void on_load_clicked(GtkButton *button, gpointer user_data)
 {
 	on_load1_activate(NULL, user_data);
 }
 
-
-void on_single_clicked(GtkButton * button, gpointer user_data)
+static void on_single_clicked(GtkButton *button, gpointer user_data)
 {
 	set_view_mode(SINGLE_VIEW);
 }
 
-
-void on_split_clicked(GtkButton * button, gpointer user_data)
+static void on_split_clicked(GtkButton *button, gpointer user_data)
 {
 	set_view_mode(SPLIT_VIEW);
 }
 
-
-void on_full_clicked(GtkButton * button, gpointer user_data)
+static void on_full_clicked(GtkButton *button, gpointer user_data)
 {
 	set_view_mode(FULL_VIEW);
 }
 
-
-void on_collapse_clicked(GtkButton * button, gpointer user_data)
+static void on_collapse_clicked(GtkButton *button, gpointer user_data)
 {
 	gtk_tree_view_collapse_all(GTK_TREE_VIEW(tree2_w));
 }
 
-
-void on_expand_clicked(GtkButton * button, gpointer user_data)
+static void on_expand_clicked(GtkButton *button, gpointer user_data)
 {
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
 }
 
 /* Main Windows Callbacks */
 
-void on_window1_destroy(GtkObject *object, gpointer user_data)
+static void on_window1_destroy(GtkObject *object, gpointer user_data)
 {
 	gtk_main_quit();
 }
 
-void on_window1_size_request(GtkWidget *widget,
+static void on_window1_size_request(GtkWidget *widget,
 				    GtkRequisition *requisition,
 				    gpointer user_data)
 {
@@ -441,7 +426,7 @@ void on_window1_size_request(GtkWidget *widget,
 	gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
 }
 
-gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
+static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 					gpointer user_data)
 {
 	GtkWidget *dialog, *label;
@@ -488,7 +473,7 @@ gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 	return ret;
 }
 
-void on_quit1_activate(GtkMenuItem *menuitem, gpointer user_data)
+static void on_quit1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	if (!on_window1_delete_event(NULL, NULL, NULL))
 		gtk_widget_destroy(GTK_WIDGET(main_wnd));
@@ -598,9 +583,9 @@ static gint column2index(GtkTreeViewColumn * column)
 
 
 /* User click: update choice (full) or goes down (single) */
-gboolean
-on_treeview2_button_press_event(GtkWidget * widget,
-				GdkEventButton * event, gpointer user_data)
+static gboolean on_treeview2_button_press_event(GtkWidget *widget,
+						GdkEventButton *event,
+						gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
 	GtkTreePath *path;
@@ -648,9 +633,9 @@ on_treeview2_button_press_event(GtkWidget * widget,
 }
 
 /* Key pressed: update choice */
-gboolean
-on_treeview2_key_press_event(GtkWidget * widget,
-			     GdkEventKey * event, gpointer user_data)
+static gboolean on_treeview2_key_press_event(GtkWidget *widget,
+					     GdkEventKey *event,
+					     gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
 	GtkTreePath *path;
@@ -690,8 +675,8 @@ on_treeview2_key_press_event(GtkWidget * widget,
 
 
 /* Row selection changed: update help */
-void
-on_treeview2_cursor_changed(GtkTreeView * treeview, gpointer user_data)
+static void on_treeview2_cursor_changed(GtkTreeView *treeview,
+					gpointer user_data)
 {
 	GtkTreeSelection *selection;
 	GtkTreeIter iter;
@@ -706,9 +691,9 @@ on_treeview2_cursor_changed(GtkTreeView * treeview, gpointer user_data)
 
 
 /* User click: display sub-tree in the right frame. */
-gboolean
-on_treeview1_button_press_event(GtkWidget * widget,
-				GdkEventButton * event, gpointer user_data)
+static gboolean on_treeview1_button_press_event(GtkWidget *widget,
+						GdkEventButton *event,
+						gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
 	GtkTreePath *path;
@@ -1138,47 +1123,129 @@ static void init_main_window(const gchar *glade_file)
 	glade_xml_signal_autoconnect(xml);
 
 	main_wnd = glade_xml_get_widget(xml, "window1");
+	g_signal_connect(main_wnd, "destroy",
+			 G_CALLBACK(on_window1_destroy), NULL);
+	g_signal_connect(main_wnd, "size_request",
+			 G_CALLBACK(on_window1_size_request), NULL);
+	g_signal_connect(main_wnd, "delete_event",
+			 G_CALLBACK(on_window1_delete_event), NULL);
+
 	hpaned = glade_xml_get_widget(xml, "hpaned1");
 	vpaned = glade_xml_get_widget(xml, "vpaned1");
 	tree1_w = glade_xml_get_widget(xml, "treeview1");
+	g_signal_connect(tree1_w, "cursor_changed",
+			 G_CALLBACK(on_treeview2_cursor_changed), NULL);
+	g_signal_connect(tree1_w, "button_press_event",
+			 G_CALLBACK(on_treeview1_button_press_event), NULL);
+	g_signal_connect(tree1_w, "key_press_event",
+			 G_CALLBACK(on_treeview2_key_press_event), NULL);
+
 	tree2_w = glade_xml_get_widget(xml, "treeview2");
+	g_signal_connect(tree2_w, "cursor_changed",
+			 G_CALLBACK(on_treeview2_cursor_changed), NULL);
+	g_signal_connect(tree2_w, "button_press_event",
+			 G_CALLBACK(on_treeview2_button_press_event), NULL);
+	g_signal_connect(tree2_w, "key_press_event",
+			 G_CALLBACK(on_treeview2_key_press_event), NULL);
+
 	text_w = glade_xml_get_widget(xml, "textview3");
 
 	/* menubar */
+	widget = glade_xml_get_widget(xml, "load1");
+	g_signal_connect(widget, "activate", G_CALLBACK(on_load1_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "save1");
+	g_signal_connect(widget, "activate", G_CALLBACK(on_save_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "save_as1");
+	g_signal_connect(widget, "activate", G_CALLBACK(on_save_as1_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "quit1");
+	g_signal_connect(widget, "activate", G_CALLBACK(on_quit1_activate), NULL);
+
 	widget = glade_xml_get_widget(xml, "show_name1");
+	g_signal_connect(widget, "activate", G_CALLBACK(on_show_name1_activate), NULL);
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_name);
 
 	widget = glade_xml_get_widget(xml, "show_range1");
+	g_signal_connect(widget, "activate", G_CALLBACK(on_show_range1_activate), NULL);
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_range);
 
 	widget = glade_xml_get_widget(xml, "show_data1");
+	g_signal_connect(widget, "activate", G_CALLBACK(on_show_data1_activate), NULL);
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_value);
 
+	widget = glade_xml_get_widget(xml, "set_option_mode1");
+	g_signal_connect(widget, "activate",
+			 G_CALLBACK(on_set_option_mode1_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "set_option_mode2");
+	g_signal_connect(widget, "activate",
+			 G_CALLBACK(on_set_option_mode2_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "set_option_mode3");
+	g_signal_connect(widget, "activate",
+			 G_CALLBACK(on_set_option_mode3_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "introduction1");
+	g_signal_connect(widget, "activate",
+			 G_CALLBACK(on_introduction1_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "about1");
+	g_signal_connect(widget, "activate",
+			 G_CALLBACK(on_about1_activate), NULL);
+
+	widget = glade_xml_get_widget(xml, "license1");
+	g_signal_connect(widget, "activate",
+			 G_CALLBACK(on_license1_activate), NULL);
+
 	/* toolbar */
 	back_btn = glade_xml_get_widget(xml, "button1");
+	g_signal_connect(back_btn, "clicked",
+			 G_CALLBACK(on_back_clicked), NULL);
 	gtk_widget_set_sensitive(back_btn, FALSE);
 
+	widget = glade_xml_get_widget(xml, "button2");
+	g_signal_connect(widget, "clicked",
+			 G_CALLBACK(on_load_clicked), NULL);
+
 	save_btn = glade_xml_get_widget(xml, "button3");
+	g_signal_connect(save_btn, "clicked",
+			 G_CALLBACK(on_save_activate), NULL);
 	save_menu_item = glade_xml_get_widget(xml, "save1");
 	conf_set_changed_callback(conf_changed);
 
 	style = gtk_widget_get_style(main_wnd);
 
 	single_btn = glade_xml_get_widget(xml, "button4");
+	g_signal_connect(single_btn, "clicked",
+			 G_CALLBACK(on_single_clicked), NULL);
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button4", (gchar **) xpm_single_view);
 
 	split_btn = glade_xml_get_widget(xml, "button5");
+	g_signal_connect(split_btn, "clicked",
+			 G_CALLBACK(on_split_clicked), NULL);
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button5", (gchar **) xpm_split_view);
 
 	full_btn = glade_xml_get_widget(xml, "button6");
+	g_signal_connect(full_btn, "clicked",
+			 G_CALLBACK(on_full_clicked), NULL);
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button6", (gchar **) xpm_tree_view);
 
+	widget = glade_xml_get_widget(xml, "button7");
+	g_signal_connect(widget, "clicked",
+			 G_CALLBACK(on_collapse_clicked), NULL);
+
+	widget = glade_xml_get_widget(xml, "button8");
+	g_signal_connect(widget, "clicked",
+			 G_CALLBACK(on_expand_clicked), NULL);
+
 	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
 	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
 					  "foreground", "red",
diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.glade
index 19b80f2ec1ff..8519104a3c2b 100644
--- a/scripts/kconfig/gconf.glade
+++ b/scripts/kconfig/gconf.glade
@@ -17,9 +17,6 @@
   <property name="skip_pager_hint">False</property>
   <property name="type_hint">GDK_WINDOW_TYPE_HINT_NORMAL</property>
   <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
-  <signal name="destroy" handler="on_window1_destroy" object="window1"/>
-  <signal name="size_request" handler="on_window1_size_request" object="vpaned1" last_modification_time="Fri, 11 Jan 2002 16:17:11 GMT"/>
-  <signal name="delete_event" handler="on_window1_delete_event" object="window1" last_modification_time="Sun, 09 Mar 2003 19:42:46 GMT"/>
 
   <child>
     <widget class="GtkVBox" id="vbox1">
@@ -46,7 +43,6 @@
 		      <property name="tooltip" translatable="yes">Load a config file</property>
 		      <property name="label" translatable="yes">_Load</property>
 		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_load1_activate"/>
 		      <accelerator key="L" modifiers="GDK_CONTROL_MASK" signal="activate"/>
 		    </widget>
 		  </child>
@@ -57,7 +53,6 @@
 		      <property name="tooltip" translatable="yes">Save the config in .config</property>
 		      <property name="label" translatable="yes">_Save</property>
 		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_save_activate"/>
 		      <accelerator key="S" modifiers="GDK_CONTROL_MASK" signal="activate"/>
 		    </widget>
 		  </child>
@@ -68,7 +63,6 @@
 		      <property name="tooltip" translatable="yes">Save the config in a file</property>
 		      <property name="label" translatable="yes">Save _as</property>
 		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_save_as1_activate"/>
 		    </widget>
 		  </child>
 
@@ -83,7 +77,6 @@
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_Quit</property>
 		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_quit1_activate"/>
 		      <accelerator key="Q" modifiers="GDK_CONTROL_MASK" signal="activate"/>
 		    </widget>
 		  </child>
@@ -108,7 +101,6 @@
 		      <property name="label" translatable="yes">Show _name</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_name1_activate"/>
 		    </widget>
 		  </child>
 
@@ -119,7 +111,6 @@
 		      <property name="label" translatable="yes">Show _range</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_range1_activate"/>
 		    </widget>
 		  </child>
 
@@ -130,7 +121,6 @@
 		      <property name="label" translatable="yes">Show _data</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_data1_activate"/>
 		    </widget>
 		  </child>
 
@@ -147,7 +137,6 @@
 		      <property name="label" translatable="yes">Show normal options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">True</property>
-		      <signal name="activate" handler="on_set_option_mode1_activate"/>
 		    </widget>
 		  </child>
 
@@ -159,7 +148,6 @@
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
 		      <property name="group">set_option_mode1</property>
-		      <signal name="activate" handler="on_set_option_mode2_activate"/>
 		    </widget>
 		  </child>
 
@@ -171,7 +159,6 @@
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
 		      <property name="group">set_option_mode1</property>
-		      <signal name="activate" handler="on_set_option_mode3_activate"/>
 		    </widget>
 		  </child>
 
@@ -194,7 +181,6 @@
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_Introduction</property>
 		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_introduction1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
 		      <accelerator key="I" modifiers="GDK_CONTROL_MASK" signal="activate"/>
 		    </widget>
 		  </child>
@@ -204,7 +190,6 @@
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_About</property>
 		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_about1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
 		      <accelerator key="A" modifiers="GDK_CONTROL_MASK" signal="activate"/>
 		    </widget>
 		  </child>
@@ -214,7 +199,6 @@
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_License</property>
 		      <property name="use_underline">True</property>
-		      <signal name="activate" handler="on_license1_activate" last_modification_time="Fri, 15 Nov 2002 20:26:30 GMT"/>
 		    </widget>
 		  </child>
 		</widget>
@@ -254,7 +238,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_back_clicked"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -291,7 +274,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_load_clicked"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -309,7 +291,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_save_activate"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -346,7 +327,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_single_clicked" last_modification_time="Sun, 12 Jan 2003 14:28:39 GMT"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -364,7 +344,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_split_clicked" last_modification_time="Sun, 12 Jan 2003 14:28:45 GMT"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -382,7 +361,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_full_clicked" last_modification_time="Sun, 12 Jan 2003 14:28:50 GMT"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -419,7 +397,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_collapse_clicked"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -437,7 +414,6 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		  <signal name="clicked" handler="on_expand_clicked"/>
 		</widget>
 		<packing>
 		  <property name="expand">False</property>
@@ -477,9 +453,6 @@
 		  <property name="rules_hint">False</property>
 		  <property name="reorderable">False</property>
 		  <property name="enable_search">False</property>
-		  <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:58:22 GMT"/>
-		  <signal name="button_press_event" handler="on_treeview1_button_press_event" last_modification_time="Sun, 12 Jan 2003 16:03:52 GMT"/>
-		  <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 16:11:44 GMT"/>
 		</widget>
 	      </child>
 	    </widget>
@@ -512,9 +485,6 @@
 		      <property name="rules_hint">False</property>
 		      <property name="reorderable">False</property>
 		      <property name="enable_search">False</property>
-		      <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:57:55 GMT"/>
-		      <signal name="button_press_event" handler="on_treeview2_button_press_event" last_modification_time="Sun, 12 Jan 2003 15:57:58 GMT"/>
-		      <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 15:58:01 GMT"/>
 		    </widget>
 		  </child>
 		</widget>
-- 
2.43.0


