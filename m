Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870A02C17BB
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 22:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbgKWVdS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 16:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729668AbgKWVdS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 16:33:18 -0500
Received: from eggs.gnu.org (eggs.gnu.org [IPv6:2001:470:142:3::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3B9C0613CF;
        Mon, 23 Nov 2020 13:33:17 -0800 (PST)
Received: from fencepost.gnu.org ([2001:470:142:3::e]:55794)
        by eggs.gnu.org with esmtp (Exim 4.90_1)
        (envelope-from <ebrahim@gnu.org>)
        id 1khJSV-00011M-MX; Mon, 23 Nov 2020 16:33:15 -0500
Received: from ebrahim by fencepost.gnu.org with local (Exim 4.82)
        (envelope-from <ebrahim@gnu.org>)
        id 1khJSU-0008TR-7W; Mon, 23 Nov 2020 16:33:15 -0500
Date:   Mon, 23 Nov 2020 16:33:14 -0500
From:   Ebrahim Byagowi <ebrahim@gnu.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gconfig: avoid use of hard coded colors for rows
Message-ID: <20201123213314.GA25149@gnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This makes the tool to avoids use of hard coded colors for
options rows by using theme provided theme provided colors
to fix issue of rows being not readable when system theme
is set to a dark theme.

Signed-off-by: Ebrahim Byagowi <ebrahim@gnu.org>
---
 scripts/kconfig/gconf.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 5527482c3..b96570c28 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -49,6 +49,8 @@ GtkWidget *back_btn = NULL;
 GtkWidget *save_btn = NULL;
 GtkWidget *save_menu_item = NULL;
 
+GtkStyle *style;
+
 GtkTextTag *tag1, *tag2;
 GdkColor color;
 
@@ -109,7 +111,7 @@ static const char *dbg_sym_flags(int val)
 #endif
 
 static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
-				GtkStyle *style, gchar *btn_name, gchar **xpm)
+				gchar *btn_name, gchar **xpm)
 {
 	GdkPixmap *pixmap;
 	GdkBitmap *mask;
@@ -132,7 +134,6 @@ static void init_main_window(const gchar *glade_file)
 	GladeXML *xml;
 	GtkWidget *widget;
 	GtkTextBuffer *txtbuf;
-	GtkStyle *style;
 
 	xml = glade_xml_new(glade_file, "window1", NULL);
 	if (!xml)
@@ -168,11 +169,11 @@ static void init_main_window(const gchar *glade_file)
 	style = gtk_widget_get_style(main_wnd);
 	widget = glade_xml_get_widget(xml, "toolbar1");
 
-	replace_button_icon(xml, main_wnd->window, style,
+	replace_button_icon(xml, main_wnd->window,
 			    "button4", (gchar **) xpm_single_view);
-	replace_button_icon(xml, main_wnd->window, style,
+	replace_button_icon(xml, main_wnd->window,
 			    "button5", (gchar **) xpm_split_view);
-	replace_button_icon(xml, main_wnd->window, style,
+	replace_button_icon(xml, main_wnd->window,
 			    "button6", (gchar **) xpm_tree_view);
 
 	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
@@ -1052,13 +1053,15 @@ static gchar **fill_row(struct menu *menu)
 	    g_strdup_printf("%s %s", menu_get_prompt(menu),
 			    sym && !sym_has_value(sym) ? "(NEW)" : "");
 
+	GdkColor *color;
 	if (opt_mode == OPT_ALL && !menu_is_visible(menu))
-		row[COL_COLOR] = g_strdup("DarkGray");
+		color = &style->text[GTK_STATE_INSENSITIVE];
 	else if (opt_mode == OPT_PROMPT &&
 			menu_has_prompt(menu) && !menu_is_visible(menu))
-		row[COL_COLOR] = g_strdup("DarkGray");
+		color = &style->text[GTK_STATE_INSENSITIVE];
 	else
-		row[COL_COLOR] = g_strdup("Black");
+		color = &style->text[GTK_STATE_NORMAL];
+	row[COL_COLOR] = gdk_color_to_string(color);
 
 	ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
 	switch (ptype) {
-- 
2.29.2

