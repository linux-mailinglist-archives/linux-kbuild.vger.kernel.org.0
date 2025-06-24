Return-Path: <linux-kbuild+bounces-7690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A7EAE6AC2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C46F7AA232
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FFA302CC7;
	Tue, 24 Jun 2025 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6ynx9qw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AF302CC1;
	Tue, 24 Jun 2025 15:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777767; cv=none; b=nXzXnaLjy8tXiCJj6il/IAmMDmq4qdFC2SR5eRaWFAK9eYhT/MvLJsWRuAlgjXCGNgDy1LNc2xs3WWKFxcpJREQyBlI77/91pyR6JodZOLiZY/5o4Yh1WJZhhlCYP9N9iksHE8HuH48SyUHCbqKtBJF8vWndonaQTPr8ovkMXzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777767; c=relaxed/simple;
	bh=E57QtEgtUWtuFVBzYKMcq15VHy6oZ1mCKarLh20U/4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZtHCGl6LpQkdaPwTbffH7/WC5MyuxMWZNS/hGvPPmyci6wTH3kpLUQTIvM1icgRZduWaXQHJ9i1s/Fu0wx2RWEYhu5JOmM6ebXDlbGKNFaEpSY0qo4nRtr01gmFPAaaFhoCTznndZborrc/mKMe5A1ahECB6umr/dB4mpDq6kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6ynx9qw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB65DC4CEE3;
	Tue, 24 Jun 2025 15:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777767;
	bh=E57QtEgtUWtuFVBzYKMcq15VHy6oZ1mCKarLh20U/4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6ynx9qweO3sDDLJteK/2U69GW00yA3smYWR9Vfnj8Akk42SIAiMU2OmmTCEstmHl
	 y3sc2tAwe2taNuMQtowzcZnoUvIez7T+S9ymEy3osMzOODkqw8DGLWxundyRhrndqt
	 IQUkByInVjtv8LaZNfuk7acTW+4TdN7PTPjZBWN8l3tNmYY6SGabQlUOZYZ3kCGaSm
	 UsoxFSBautoQ+///Sbttz+fyP7QeVZg6YriDjMixEgjx/UswQIRpt+KXYLL4Lj7V6P
	 Wckw9Vaz9XPXVnPT3daI06bNBDDjx+THRVQeVt/peZoABqus9ITAL7Sy5hKJh2Hk/w
	 xS5oiK8DCr7zQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 63/66] kconfig: gconf: migrate to GTK 3
Date: Wed, 25 Jun 2025 00:05:51 +0900
Message-ID: <20250624150645.1107002-64-masahiroy@kernel.org>
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

This commit switches from GTK 2.x to GTK 3, applying the following
necessary changes:

 - Do not include invidual headers
 - GtkObject is gone
 - Convert glade to GtkBuilder

[1]: https://docs.gtk.org/gtk3/migrating-2to3.html

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf-cfg.sh |  11 +-
 scripts/kconfig/gconf.c      |  72 ++++++-------
 scripts/kconfig/gconf.ui     | 200 +++++++++++++++++------------------
 3 files changed, 136 insertions(+), 147 deletions(-)

diff --git a/scripts/kconfig/gconf-cfg.sh b/scripts/kconfig/gconf-cfg.sh
index fc954c0538fa..856c692f480c 100755
--- a/scripts/kconfig/gconf-cfg.sh
+++ b/scripts/kconfig/gconf-cfg.sh
@@ -6,7 +6,7 @@ set -eu
 cflags=$1
 libs=$2
 
-PKG="gtk+-2.0 gmodule-2.0 libglade-2.0"
+PKG=gtk+-3.0
 
 if [ -z "$(command -v ${HOSTPKG_CONFIG})" ]; then
 	echo >&2 "*"
@@ -18,18 +18,11 @@ fi
 if ! ${HOSTPKG_CONFIG} --exists $PKG; then
 	echo >&2 "*"
 	echo >&2 "* Unable to find the GTK+ installation. Please make sure that"
-	echo >&2 "* the GTK+ 2.0 development package is correctly installed."
+	echo >&2 "* the GTK 3 development package is correctly installed."
 	echo >&2 "* You need $PKG"
 	echo >&2 "*"
 	exit 1
 fi
 
-if ! ${HOSTPKG_CONFIG} --atleast-version=2.0.0 gtk+-2.0; then
-	echo >&2 "*"
-	echo >&2 "* GTK+ is present but version >= 2.0.0 is required."
-	echo >&2 "*"
-	exit 1
-fi
-
 ${HOSTPKG_CONFIG} --cflags ${PKG} > ${cflags}
 ${HOSTPKG_CONFIG} --libs ${PKG} > ${libs}
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 4c6459cc26e7..5959ed255d12 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -7,10 +7,7 @@
 #include "lkc.h"
 #include "images.h"
 
-#include <glade/glade.h>
 #include <gtk/gtk.h>
-#include <glib.h>
-#include <gdk/gdkkeysyms.h>
 
 #include <stdio.h>
 #include <string.h>
@@ -655,7 +652,7 @@ static void on_expand_clicked(GtkButton *button, gpointer user_data)
 
 /* Main Windows Callbacks */
 
-static void on_window1_destroy(GtkObject *object, gpointer user_data)
+static void on_window1_destroy(GtkWidget *widget, gpointer user_data)
 {
 	gtk_main_quit();
 }
@@ -982,15 +979,15 @@ static void replace_button_icon(GtkWidget *widget, const char * const xpm[])
 
 static void init_main_window(const gchar *glade_file)
 {
-	GladeXML *xml;
+	GtkBuilder *builder;
 	GtkWidget *widget;
 	GtkTextBuffer *txtbuf;
 
-	xml = glade_xml_new(glade_file, "window1", NULL);
-	if (!xml)
+	builder = gtk_builder_new_from_file(glade_file);
+	if (!builder)
 		g_error("GUI loading failed !\n");
 
-	main_wnd = glade_xml_get_widget(xml, "window1");
+	main_wnd = GTK_WIDGET(gtk_builder_get_object(builder, "window1"));
 	g_signal_connect(main_wnd, "destroy",
 			 G_CALLBACK(on_window1_destroy), NULL);
 	g_signal_connect(main_wnd, "size_allocate",
@@ -998,9 +995,9 @@ static void init_main_window(const gchar *glade_file)
 	g_signal_connect(main_wnd, "delete_event",
 			 G_CALLBACK(on_window1_delete_event), NULL);
 
-	hpaned = glade_xml_get_widget(xml, "hpaned1");
-	vpaned = glade_xml_get_widget(xml, "vpaned1");
-	tree1_w = glade_xml_get_widget(xml, "treeview1");
+	hpaned = GTK_WIDGET(gtk_builder_get_object(builder, "hpaned1"));
+	vpaned = GTK_WIDGET(gtk_builder_get_object(builder, "vpaned1"));
+	tree1_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview1"));
 	g_signal_connect(tree1_w, "cursor_changed",
 			 G_CALLBACK(on_treeview2_cursor_changed), NULL);
 	g_signal_connect(tree1_w, "button_press_event",
@@ -1008,7 +1005,7 @@ static void init_main_window(const gchar *glade_file)
 	g_signal_connect(tree1_w, "key_press_event",
 			 G_CALLBACK(on_treeview2_key_press_event), NULL);
 
-	tree2_w = glade_xml_get_widget(xml, "treeview2");
+	tree2_w = GTK_WIDGET(gtk_builder_get_object(builder, "treeview2"));
 	g_signal_connect(tree2_w, "cursor_changed",
 			 G_CALLBACK(on_treeview2_cursor_changed), NULL);
 	g_signal_connect(tree2_w, "button_press_event",
@@ -1016,96 +1013,96 @@ static void init_main_window(const gchar *glade_file)
 	g_signal_connect(tree2_w, "key_press_event",
 			 G_CALLBACK(on_treeview2_key_press_event), NULL);
 
-	text_w = glade_xml_get_widget(xml, "textview3");
+	text_w = GTK_WIDGET(gtk_builder_get_object(builder, "textview3"));
 
 	/* menubar */
-	widget = glade_xml_get_widget(xml, "load1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "load1"));
 	g_signal_connect(widget, "activate", G_CALLBACK(on_load1_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "save1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "save1"));
 	g_signal_connect(widget, "activate", G_CALLBACK(on_save_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "save_as1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "save_as1"));
 	g_signal_connect(widget, "activate", G_CALLBACK(on_save_as1_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "quit1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "quit1"));
 	g_signal_connect(widget, "activate", G_CALLBACK(on_quit1_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "show_name1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_name1"));
 	g_signal_connect(widget, "activate", G_CALLBACK(on_show_name1_activate), NULL);
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_name);
 
-	widget = glade_xml_get_widget(xml, "show_range1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_range1"));
 	g_signal_connect(widget, "activate", G_CALLBACK(on_show_range1_activate), NULL);
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_range);
 
-	widget = glade_xml_get_widget(xml, "show_data1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "show_data1"));
 	g_signal_connect(widget, "activate", G_CALLBACK(on_show_data1_activate), NULL);
 	gtk_check_menu_item_set_active((GtkCheckMenuItem *) widget,
 				       show_value);
 
-	widget = glade_xml_get_widget(xml, "set_option_mode1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "set_option_mode1"));
 	g_signal_connect(widget, "activate",
 			 G_CALLBACK(on_set_option_mode1_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "set_option_mode2");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "set_option_mode2"));
 	g_signal_connect(widget, "activate",
 			 G_CALLBACK(on_set_option_mode2_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "set_option_mode3");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "set_option_mode3"));
 	g_signal_connect(widget, "activate",
 			 G_CALLBACK(on_set_option_mode3_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "introduction1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "introduction1"));
 	g_signal_connect(widget, "activate",
 			 G_CALLBACK(on_introduction1_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "about1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "about1"));
 	g_signal_connect(widget, "activate",
 			 G_CALLBACK(on_about1_activate), NULL);
 
-	widget = glade_xml_get_widget(xml, "license1");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "license1"));
 	g_signal_connect(widget, "activate",
 			 G_CALLBACK(on_license1_activate), NULL);
 
 	/* toolbar */
-	back_btn = glade_xml_get_widget(xml, "button1");
+	back_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button1"));
 	g_signal_connect(back_btn, "clicked",
 			 G_CALLBACK(on_back_clicked), NULL);
 	gtk_widget_set_sensitive(back_btn, FALSE);
 
-	widget = glade_xml_get_widget(xml, "button2");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "button2"));
 	g_signal_connect(widget, "clicked",
 			 G_CALLBACK(on_load_clicked), NULL);
 
-	save_btn = glade_xml_get_widget(xml, "button3");
+	save_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button3"));
 	g_signal_connect(save_btn, "clicked",
 			 G_CALLBACK(on_save_clicked), NULL);
-	save_menu_item = glade_xml_get_widget(xml, "save1");
+	save_menu_item = GTK_WIDGET(gtk_builder_get_object(builder, "save1"));
 	conf_set_changed_callback(conf_changed);
 
-	single_btn = glade_xml_get_widget(xml, "button4");
+	single_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button4"));
 	g_signal_connect(single_btn, "clicked",
 			 G_CALLBACK(on_single_clicked), NULL);
 	replace_button_icon(single_btn, xpm_single_view);
 
-	split_btn = glade_xml_get_widget(xml, "button5");
+	split_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button5"));
 	g_signal_connect(split_btn, "clicked",
 			 G_CALLBACK(on_split_clicked), NULL);
 	replace_button_icon(split_btn, xpm_split_view);
 
-	full_btn = glade_xml_get_widget(xml, "button6");
+	full_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button6"));
 	g_signal_connect(full_btn, "clicked",
 			 G_CALLBACK(on_full_clicked), NULL);
 	replace_button_icon(full_btn, xpm_tree_view);
 
-	widget = glade_xml_get_widget(xml, "button7");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "button7"));
 	g_signal_connect(widget, "clicked",
 			 G_CALLBACK(on_collapse_clicked), NULL);
 
-	widget = glade_xml_get_widget(xml, "button8");
+	widget = GTK_WIDGET(gtk_builder_get_object(builder, "button8"));
 	g_signal_connect(widget, "clicked",
 			 G_CALLBACK(on_expand_clicked), NULL);
 
@@ -1120,7 +1117,9 @@ static void init_main_window(const gchar *glade_file)
 
 	gtk_window_set_title(GTK_WINDOW(main_wnd), rootmenu.prompt->text);
 
-	gtk_widget_show(main_wnd);
+	gtk_widget_show_all(main_wnd);
+
+	g_object_unref(builder);
 }
 
 static gboolean visible_func(GtkTreeModel *model, GtkTreeIter  *iter,
@@ -1296,7 +1295,6 @@ int main(int ac, char *av[])
 
 	/* GTK stuffs */
 	gtk_init(&ac, &av);
-	glade_init();
 
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
diff --git a/scripts/kconfig/gconf.ui b/scripts/kconfig/gconf.ui
index f0c572c7f47c..e5dad2b06502 100644
--- a/scripts/kconfig/gconf.ui
+++ b/scripts/kconfig/gconf.ui
@@ -1,8 +1,8 @@
 <?xml version="1.0" standalone="no"?> <!--*- mode: xml -*-->
 
-<glade-interface>
+<interface>
 
-<widget class="GtkWindow" id="window1">
+<object class="GtkWindow" id="window1">
   <property name="visible">True</property>
   <property name="title" translatable="yes">Gtk Kernel Configurator</property>
   <property name="type">GTK_WINDOW_TOPLEVEL</property>
@@ -19,193 +19,193 @@
   <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
 
   <child>
-    <widget class="GtkVBox" id="vbox1">
+    <object class="GtkVBox" id="vbox1">
       <property name="visible">True</property>
       <property name="homogeneous">False</property>
       <property name="spacing">0</property>
 
       <child>
-	<widget class="GtkMenuBar" id="menubar1">
+	<object class="GtkMenuBar" id="menubar1">
 	  <property name="visible">True</property>
 
 	  <child>
-	    <widget class="GtkMenuItem" id="file1">
+	    <object class="GtkMenuItem" id="file1">
 	      <property name="visible">True</property>
 	      <property name="label" translatable="yes">_File</property>
 	      <property name="use_underline">True</property>
 
-	      <child>
-		<widget class="GtkMenu" id="file1_menu">
+	      <child type="submenu">
+		<object class="GtkMenu" id="file1_menu">
 
 		  <child>
-		    <widget class="GtkImageMenuItem" id="load1">
+		    <object class="GtkImageMenuItem" id="load1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Load a config file</property>
 		      <property name="label" translatable="yes">_Load</property>
 		      <property name="use_underline">True</property>
 		      <accelerator key="L" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkImageMenuItem" id="save1">
+		    <object class="GtkImageMenuItem" id="save1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Save the config in .config</property>
 		      <property name="label" translatable="yes">_Save</property>
 		      <property name="use_underline">True</property>
 		      <accelerator key="S" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkImageMenuItem" id="save_as1">
+		    <object class="GtkImageMenuItem" id="save_as1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Save the config in a file</property>
 		      <property name="label" translatable="yes">Save _as</property>
 		      <property name="use_underline">True</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkSeparatorMenuItem" id="separator1">
+		    <object class="GtkSeparatorMenuItem" id="separator1">
 		      <property name="visible">True</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkImageMenuItem" id="quit1">
+		    <object class="GtkImageMenuItem" id="quit1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_Quit</property>
 		      <property name="use_underline">True</property>
 		      <accelerator key="Q" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-		    </widget>
+		    </object>
 		  </child>
-		</widget>
+		</object>
 	      </child>
-	    </widget>
+	    </object>
 	  </child>
 
 	  <child>
-	    <widget class="GtkMenuItem" id="options1">
+	    <object class="GtkMenuItem" id="options1">
 	      <property name="visible">True</property>
 	      <property name="label" translatable="yes">_Options</property>
 	      <property name="use_underline">True</property>
 
-	      <child>
-		<widget class="GtkMenu" id="options1_menu">
+	      <child type="submenu">
+		<object class="GtkMenu" id="options1_menu">
 
 		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_name1">
+		    <object class="GtkCheckMenuItem" id="show_name1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Show name</property>
 		      <property name="label" translatable="yes">Show _name</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_range1">
+		    <object class="GtkCheckMenuItem" id="show_range1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Show range (Y/M/N)</property>
 		      <property name="label" translatable="yes">Show _range</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_data1">
+		    <object class="GtkCheckMenuItem" id="show_data1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Show value of the option</property>
 		      <property name="label" translatable="yes">Show _data</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkSeparatorMenuItem" id="separator2">
+		    <object class="GtkSeparatorMenuItem" id="separator2">
 		      <property name="visible">True</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkRadioMenuItem" id="set_option_mode1">
+		    <object class="GtkRadioMenuItem" id="set_option_mode1">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Show normal options</property>
 		      <property name="label" translatable="yes">Show normal options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">True</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkRadioMenuItem" id="set_option_mode2">
+		    <object class="GtkRadioMenuItem" id="set_option_mode2">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Show all options</property>
 		      <property name="label" translatable="yes">Show all _options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
 		      <property name="group">set_option_mode1</property>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkRadioMenuItem" id="set_option_mode3">
+		    <object class="GtkRadioMenuItem" id="set_option_mode3">
 		      <property name="visible">True</property>
 		      <property name="tooltip-text" translatable="yes">Show all options with prompts</property>
 		      <property name="label" translatable="yes">Show all prompt options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
 		      <property name="group">set_option_mode1</property>
-		    </widget>
+		    </object>
 		  </child>
 
-		</widget>
+		</object>
 	      </child>
-	    </widget>
+	    </object>
 	  </child>
 
 	  <child>
-	    <widget class="GtkMenuItem" id="help1">
+	    <object class="GtkMenuItem" id="help1">
 	      <property name="visible">True</property>
 	      <property name="label" translatable="yes">_Help</property>
 	      <property name="use_underline">True</property>
 
-	      <child>
-		<widget class="GtkMenu" id="help1_menu">
+	      <child type="submenu">
+		<object class="GtkMenu" id="help1_menu">
 
 		  <child>
-		    <widget class="GtkImageMenuItem" id="introduction1">
+		    <object class="GtkImageMenuItem" id="introduction1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_Introduction</property>
 		      <property name="use_underline">True</property>
 		      <accelerator key="I" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkImageMenuItem" id="about1">
+		    <object class="GtkImageMenuItem" id="about1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_About</property>
 		      <property name="use_underline">True</property>
 		      <accelerator key="A" modifiers="GDK_CONTROL_MASK" signal="activate"/>
-		    </widget>
+		    </object>
 		  </child>
 
 		  <child>
-		    <widget class="GtkImageMenuItem" id="license1">
+		    <object class="GtkImageMenuItem" id="license1">
 		      <property name="visible">True</property>
 		      <property name="label" translatable="yes">_License</property>
 		      <property name="use_underline">True</property>
-		    </widget>
+		    </object>
 		  </child>
-		</widget>
+		</object>
 	      </child>
-	    </widget>
+	    </object>
 	  </child>
-	</widget>
+	</object>
 	<packing>
 	  <property name="padding">0</property>
 	  <property name="expand">False</property>
@@ -214,14 +214,14 @@
       </child>
 
       <child>
-	    <widget class="GtkToolbar" id="toolbar1">
+	    <object class="GtkToolbar" id="toolbar1">
 	      <property name="visible">True</property>
 	      <property name="orientation">GTK_ORIENTATION_HORIZONTAL</property>
 	      <property name="toolbar_style">GTK_TOOLBAR_BOTH</property>
 	      <property name="show_arrow">True</property>
 
 	      <child>
-		<widget class="GtkToolButton" id="button1">
+		<object class="GtkToolButton" id="button1">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Goes up of one level (single view)</property>
 		  <property name="label" translatable="yes">Back</property>
@@ -230,7 +230,7 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
@@ -238,18 +238,18 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolItem" id="toolitem1">
+		<object class="GtkToolItem" id="toolitem1">
 		  <property name="visible">True</property>
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
 
 		  <child>
-		    <widget class="GtkVSeparator" id="vseparator1">
+		    <object class="GtkVSeparator" id="vseparator1">
 		      <property name="visible">True</property>
-		    </widget>
+		    </object>
 		  </child>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">False</property>
@@ -257,7 +257,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolButton" id="button2">
+		<object class="GtkToolButton" id="button2">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Load a config file</property>
 		  <property name="label" translatable="yes">Load</property>
@@ -266,7 +266,7 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
@@ -274,7 +274,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolButton" id="button3">
+		<object class="GtkToolButton" id="button3">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Save a config file</property>
 		  <property name="label" translatable="yes">Save</property>
@@ -283,7 +283,7 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
@@ -291,18 +291,18 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolItem" id="toolitem2">
+		<object class="GtkToolItem" id="toolitem2">
 		  <property name="visible">True</property>
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
 
 		  <child>
-		    <widget class="GtkVSeparator" id="vseparator2">
+		    <object class="GtkVSeparator" id="vseparator2">
 		      <property name="visible">True</property>
-		    </widget>
+		    </object>
 		  </child>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">False</property>
@@ -310,7 +310,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolButton" id="button4">
+		<object class="GtkToolButton" id="button4">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Single view</property>
 		  <property name="label" translatable="yes">Single</property>
@@ -319,7 +319,7 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
@@ -327,7 +327,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolButton" id="button5">
+		<object class="GtkToolButton" id="button5">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Split view</property>
 		  <property name="label" translatable="yes">Split</property>
@@ -336,7 +336,7 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
@@ -344,7 +344,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolButton" id="button6">
+		<object class="GtkToolButton" id="button6">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Full view</property>
 		  <property name="label" translatable="yes">Full</property>
@@ -353,7 +353,7 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
@@ -361,18 +361,18 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolItem" id="toolitem3">
+		<object class="GtkToolItem" id="toolitem3">
 		  <property name="visible">True</property>
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
 
 		  <child>
-		    <widget class="GtkVSeparator" id="vseparator3">
+		    <object class="GtkVSeparator" id="vseparator3">
 		      <property name="visible">True</property>
-		    </widget>
+		    </object>
 		  </child>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">False</property>
@@ -380,7 +380,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolButton" id="button7">
+		<object class="GtkToolButton" id="button7">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Collapse the whole tree in the right frame</property>
 		  <property name="label" translatable="yes">Collapse</property>
@@ -389,7 +389,7 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
@@ -397,7 +397,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkToolButton" id="button8">
+		<object class="GtkToolButton" id="button8">
 		  <property name="visible">True</property>
 		  <property name="tooltip-text" translatable="yes">Expand the whole tree in the right frame</property>
 		  <property name="label" translatable="yes">Expand</property>
@@ -406,13 +406,13 @@
 		  <property name="visible_horizontal">True</property>
 		  <property name="visible_vertical">True</property>
 		  <property name="is_important">False</property>
-		</widget>
+		</object>
 		<packing>
 		  <property name="expand">False</property>
 		  <property name="homogeneous">True</property>
 		</packing>
 	      </child>
-	    </widget>
+	    </object>
 	<packing>
 	  <property name="padding">0</property>
 	  <property name="expand">False</property>
@@ -421,14 +421,13 @@
       </child>
 
       <child>
-	<widget class="GtkHPaned" id="hpaned1">
+	<object class="GtkHPaned" id="hpaned1">
 	  <property name="width_request">1</property>
 	  <property name="visible">True</property>
 	  <property name="can_focus">True</property>
-	  <property name="position">0</property>
 
 	  <child>
-	    <widget class="GtkScrolledWindow" id="scrolledwindow1">
+	    <object class="GtkScrolledWindow" id="scrolledwindow1">
 	      <property name="visible">True</property>
 	      <property name="hscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
 	      <property name="vscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
@@ -436,16 +435,16 @@
 	      <property name="window_placement">GTK_CORNER_TOP_LEFT</property>
 
 	      <child>
-		<widget class="GtkTreeView" id="treeview1">
+		<object class="GtkTreeView" id="treeview1">
 		  <property name="visible">True</property>
 		  <property name="can_focus">True</property>
 		  <property name="headers_visible">True</property>
 		  <property name="rules_hint">False</property>
 		  <property name="reorderable">False</property>
 		  <property name="enable_search">False</property>
-		</widget>
+		</object>
 	      </child>
-	    </widget>
+	    </object>
 	    <packing>
 	      <property name="shrink">True</property>
 	      <property name="resize">False</property>
@@ -453,13 +452,12 @@
 	  </child>
 
 	  <child>
-	    <widget class="GtkVPaned" id="vpaned1">
+	    <object class="GtkVPaned" id="vpaned1">
 	      <property name="visible">True</property>
 	      <property name="can_focus">True</property>
-	      <property name="position">0</property>
 
 	      <child>
-		<widget class="GtkScrolledWindow" id="scrolledwindow2">
+		<object class="GtkScrolledWindow" id="scrolledwindow2">
 		  <property name="visible">True</property>
 		  <property name="hscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
 		  <property name="vscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
@@ -467,7 +465,7 @@
 		  <property name="window_placement">GTK_CORNER_TOP_LEFT</property>
 
 		  <child>
-		    <widget class="GtkTreeView" id="treeview2">
+		    <object class="GtkTreeView" id="treeview2">
 		      <property name="visible">True</property>
 		      <property name="can_focus">True</property>
 		      <property name="has_focus">True</property>
@@ -475,9 +473,9 @@
 		      <property name="rules_hint">False</property>
 		      <property name="reorderable">False</property>
 		      <property name="enable_search">False</property>
-		    </widget>
+		    </object>
 		  </child>
-		</widget>
+		</object>
 		<packing>
 		  <property name="shrink">True</property>
 		  <property name="resize">False</property>
@@ -485,7 +483,7 @@
 	      </child>
 
 	      <child>
-		<widget class="GtkScrolledWindow" id="scrolledwindow3">
+		<object class="GtkScrolledWindow" id="scrolledwindow3">
 		  <property name="visible">True</property>
 		  <property name="hscrollbar_policy">GTK_POLICY_NEVER</property>
 		  <property name="vscrollbar_policy">GTK_POLICY_AUTOMATIC</property>
@@ -493,7 +491,7 @@
 		  <property name="window_placement">GTK_CORNER_TOP_LEFT</property>
 
 		  <child>
-		    <widget class="GtkTextView" id="textview3">
+		    <object class="GtkTextView" id="textview3">
 		      <property name="visible">True</property>
 		      <property name="can_focus">True</property>
 		      <property name="editable">False</property>
@@ -508,29 +506,29 @@
 		      <property name="left_margin">0</property>
 		      <property name="right_margin">0</property>
 		      <property name="indent">0</property>
-		    </widget>
+		    </object>
 		  </child>
-		</widget>
+		</object>
 		<packing>
 		  <property name="shrink">True</property>
 		  <property name="resize">True</property>
 		</packing>
 	      </child>
-	    </widget>
+	    </object>
 	    <packing>
 	      <property name="shrink">True</property>
 	      <property name="resize">True</property>
 	    </packing>
 	  </child>
-	</widget>
+	</object>
 	<packing>
 	  <property name="padding">0</property>
 	  <property name="expand">True</property>
 	  <property name="fill">True</property>
 	</packing>
       </child>
-    </widget>
+    </object>
   </child>
-</widget>
+</object>
 
-</glade-interface>
+</interface>
-- 
2.43.0


