Return-Path: <linux-kbuild+bounces-7666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C3AE6A96
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 743171C26228
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01B02EBDE8;
	Tue, 24 Jun 2025 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzCPLUN/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB72EBDE6;
	Tue, 24 Jun 2025 15:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777717; cv=none; b=iUs4CYDpnOGJGpam8ZqsuFJpWBHKMZkolql9Llr4DDA8hXaLfkD/ldDYMZ2ufx2OwAWHjPGUgNPq5SOvzWMbnmX+p8iyF4Hw13z96aZsp4mHtDnvw9mcUcmxEULW/diJ9ErmPtzY3SL7lJ7O77w4HqCDEckeXizr5dyGO0NXUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777717; c=relaxed/simple;
	bh=9TppseAjxd/C3qrHT83scHQsCqYfsRnZlZjp4lNUSOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SaFDDJHp9Y+C48daovAwyah7HFhRU4IWxgBeuN/hMurQfH1zzDUoTZTA+G7kXs4CHYwJjV4sudXJL+WySwO23VLpbHbhV0MctnfUnFYvZvoBdE2hDrjxxrnKYLVrMZOilOFrKUQ+bEEwZNPA/9tyGd4B+a570Qal0xj5B/N9Qn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzCPLUN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1694C4CEEE;
	Tue, 24 Jun 2025 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777717;
	bh=9TppseAjxd/C3qrHT83scHQsCqYfsRnZlZjp4lNUSOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pzCPLUN/Iab2zGMXguKosxuhkNX4s81Q/1pHNSX5hKFegnSyqud6/iOGSrAvWSO8z
	 meKYP51aExGml9GsTdrfC9KMD5SXvvANGwplrokoXPwzhD67oer6arGsEpTKaZ1AOH
	 UKS2OfGIiBRyudTcxoIaSkr3EKlIX1CSPr8ZV11nnPy6zGky51zzDZhLlwV3n/F3zH
	 iBGL3BI/BcyIyY5TWMI0W/OWtMqG90hwyA14tT/HiusCoSzQvN50VbZmFsb70ZWfe9
	 hH6MxLJW9bCXSrJZ5Hswsko2QsZ/9gZo+TIgAe7UCWP6c8Coi5TqKWZ2g5ws7GUQe4
	 y74wx8im62TOA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 39/66] kconfig: gconf: refactor replace_button_icon()
Date: Wed, 25 Jun 2025 00:05:27 +0900
Message-ID: <20250624150645.1107002-40-masahiroy@kernel.org>
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

The "window" and "style" arguments for replace_button_icon() are
now unused. Remove them and refactor the function accordingly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 30d8fdb886c0..e20cbceb89d3 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1099,21 +1099,17 @@ static void fixup_rootmenu(struct menu *menu)
 }
 
 /* Main Window Initialization */
-static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
-				GtkStyle *style, gchar *btn_name, gchar **xpm)
+static void replace_button_icon(GtkWidget *widget, const char * const xpm[])
 {
 	GdkPixbuf *pixbuf;
 	GtkWidget *image;
-	GtkToolButton *button;
 
 	pixbuf = gdk_pixbuf_new_from_xpm_data((const char **)xpm);
 	image = gtk_image_new_from_pixbuf(pixbuf);
 	g_object_unref(pixbuf);
 
-	button = GTK_TOOL_BUTTON(glade_xml_get_widget(xml, btn_name));
-
 	gtk_widget_show(image);
-	gtk_tool_button_set_icon_widget(button, image);
+	gtk_tool_button_set_icon_widget(GTK_TOOL_BUTTON(widget), image);
 }
 
 static void init_main_window(const gchar *glade_file)
@@ -1121,7 +1117,6 @@ static void init_main_window(const gchar *glade_file)
 	GladeXML *xml;
 	GtkWidget *widget;
 	GtkTextBuffer *txtbuf;
-	GtkStyle *style;
 
 	xml = glade_xml_new(glade_file, "window1", NULL);
 	if (!xml)
@@ -1223,25 +1218,20 @@ static void init_main_window(const gchar *glade_file)
 	save_menu_item = glade_xml_get_widget(xml, "save1");
 	conf_set_changed_callback(conf_changed);
 
-	style = gtk_widget_get_style(main_wnd);
-
 	single_btn = glade_xml_get_widget(xml, "button4");
 	g_signal_connect(single_btn, "clicked",
 			 G_CALLBACK(on_single_clicked), NULL);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button4", (gchar **) xpm_single_view);
+	replace_button_icon(single_btn, xpm_single_view);
 
 	split_btn = glade_xml_get_widget(xml, "button5");
 	g_signal_connect(split_btn, "clicked",
 			 G_CALLBACK(on_split_clicked), NULL);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button5", (gchar **) xpm_split_view);
+	replace_button_icon(split_btn, xpm_split_view);
 
 	full_btn = glade_xml_get_widget(xml, "button6");
 	g_signal_connect(full_btn, "clicked",
 			 G_CALLBACK(on_full_clicked), NULL);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button6", (gchar **) xpm_tree_view);
+	replace_button_icon(full_btn, xpm_tree_view);
 
 	widget = glade_xml_get_widget(xml, "button7");
 	g_signal_connect(widget, "clicked",
-- 
2.43.0


