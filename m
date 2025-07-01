Return-Path: <linux-kbuild+bounces-7808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67DAEF814
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 14:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2420D1661FA
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 12:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0D4235346;
	Tue,  1 Jul 2025 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJ2zujrP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A5726B2AA
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Jul 2025 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372090; cv=none; b=tkWxu+CYU4MU6KxLBchPnF85cXizYH3PKbuPvK+nqcj7i2glaxmFl1Pc8CG+lxln6uwiZ7nWEXk2GpMk3YsY2rPp3Zjp/FGNBMNQmrCZ/nllLwNekOVBC/7kBvj9T6+a8TPWuS2IMNwzjMw60H9ilvWy21hG3W+X2875oY+xgmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372090; c=relaxed/simple;
	bh=aIGgBeQqcBopNBJdXmozrYzSyTtBouucy1soSDomY/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFJejP8dkeRf7FaaV5ic0zMQRHzDOSz1CPIVJrFWbjyDmGnd7F1u4Mi+T1vYE37b5wiOxO0hS+ttu0XxtoUnsEwgqAgksp2yo+SZIp6wcHPzhkvoggE8A1Ns2pTjenuwZC/pVlvi3GcBFkbJZtW4cWfmkONtEG//mxBLVwKg0es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJ2zujrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFDCC4CEF1;
	Tue,  1 Jul 2025 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751372089;
	bh=aIGgBeQqcBopNBJdXmozrYzSyTtBouucy1soSDomY/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DJ2zujrPwAw2mDEUUyB+2o802eLJKmKPuRH2U3/HX7dgqOIhEu8HdoAAHOlpAEzN7
	 kjA54MGQHDMiQFxXYQHSx3RCRKsxNMzT8pr94vvdcBLv99sIrq59VJusArvHffKQKQ
	 MDCXPwg6dzyuu24cbuDaN6MnauK/2bkGQs46ORc1TMb9pPMQTs/yTezOee51G5IBHY
	 sOy2antwemrl7m46m0W2+omkxPN67IZhekjpEVOyTmQFSxnK5o2R70hrWvHi+t/JVi
	 NvLXT95+0GCnmKRqhyzXRO6Q8WrqvPyXwkBeqBn+yTR6ea2j6GlG87i4jRhlcP47NF
	 DdszWEx24jB7w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Subject: [v3 PATCH 1/1] kconfig: gconf: preserve menu selection when switching view mode
Date: Tue,  1 Jul 2025 21:14:44 +0900
Message-ID: <20250701121444.950640-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701121444.950640-1-masahiroy@kernel.org>
References: <20250701121444.950640-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preserve the current menu selection when switching to a different view
mode, as it improves usability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 - Fix a corner case when the selection is not preserved
   when switching to Split view

 scripts/kconfig/gconf.c | 82 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 8ea87733e467..e8fa5d104285 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -47,6 +47,7 @@ static GtkTreeStore *tree1, *tree2;
 static GtkTreeModel *model1, *model2;
 
 static struct menu *browsed; // browsed menu for SINGLE/SPLIT view
+static struct menu *selected; // selected entry
 
 enum {
 	COL_OPTION, COL_NAME, COL_NO, COL_MOD, COL_YES, COL_VALUE,
@@ -68,6 +69,47 @@ static void conf_changed(bool dirty)
 
 /* Utility Functions */
 
+static void _select_menu(GtkTreeView *view, GtkTreeModel *model,
+			 GtkTreeIter *parent, struct menu *match)
+{
+	GtkTreeIter iter;
+	gboolean valid;
+
+	valid = gtk_tree_model_iter_children(model, &iter, parent);
+	while (valid) {
+		struct menu *menu;
+
+		gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
+
+		if (menu == match) {
+			GtkTreeSelection *selection;
+			GtkTreePath *path;
+
+			/*
+			 * Expand parents to reflect the selection, and
+			 * scroll down to it.
+			 */
+			path = gtk_tree_model_get_path(model, &iter);
+			gtk_tree_view_expand_to_path(view, path);
+			gtk_tree_view_scroll_to_cell(view, path, NULL, TRUE,
+						     0.5, 0.0);
+			gtk_tree_path_free(path);
+
+			selection = gtk_tree_view_get_selection(view);
+			gtk_tree_selection_select_iter(selection, &iter);
+		}
+
+		_select_menu(view, model, &iter, match);
+
+		valid = gtk_tree_model_iter_next(model, &iter);
+	}
+}
+
+static void select_menu(GtkTreeView *view, struct menu *match)
+{
+	_select_menu(view, gtk_tree_view_get_model(view), NULL, match);
+}
+
 static void set_view_mode(enum view_mode mode)
 {
 	view_mode = mode;
@@ -89,24 +131,36 @@ static void set_view_mode(enum view_mode mode)
 
 	switch (mode) {
 	case SINGLE_VIEW:
-		browsed = &rootmenu;
+		if (selected)
+			browsed = menu_get_parent_menu(selected) ?: &rootmenu;
+		else
+			browsed = &rootmenu;
 		display_tree_part();
+		select_menu(GTK_TREE_VIEW(tree2_w), selected);
 		gtk_widget_set_sensitive(single_btn, FALSE);
 		break;
 	case SPLIT_VIEW:
+		browsed = selected;
+		while (browsed && !(browsed->flags & MENU_ROOT))
+			browsed = browsed->parent;
 		gtk_tree_store_clear(tree2);
 		display_list();
+		if (browsed)
+			display_tree(tree2, browsed);
+		select_menu(GTK_TREE_VIEW(tree1_w), browsed);
+		select_menu(GTK_TREE_VIEW(tree2_w), selected);
 		gtk_widget_set_sensitive(split_btn, FALSE);
 		break;
 	case FULL_VIEW:
 		gtk_tree_store_clear(tree2);
 		display_tree(tree2, &rootmenu);
+		select_menu(GTK_TREE_VIEW(tree2_w), selected);
 		gtk_widget_set_sensitive(full_btn, FALSE);
 		break;
 	}
 
-	if (mode != SINGLE_VIEW)
-		gtk_widget_set_sensitive(back_btn, FALSE);
+	gtk_widget_set_sensitive(back_btn,
+				 mode == SINGLE_VIEW && browsed != &rootmenu);
 }
 
 static void text_insert_help(struct menu *menu)
@@ -603,6 +657,8 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 		return FALSE;
 	gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 
+	selected = menu;
+
 	col = column2index(column);
 	if (event->type == GDK_2BUTTON_PRESS) {
 		enum prop_type ptype;
@@ -712,8 +768,12 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 	if (event->type == GDK_2BUTTON_PRESS)
 		toggle_sym_value(menu);
 
-	browsed = menu;
-	display_tree_part();
+	selected = menu;
+
+	if (menu->type == M_MENU) {
+		browsed = menu;
+		display_tree_part();
+	}
 
 	gtk_tree_view_set_cursor(view, path, NULL, FALSE);
 	gtk_widget_grab_focus(tree2_w);
@@ -1006,10 +1066,16 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 	enum prop_type ptype;
 	GtkTreeIter iter;
 
-	if (menu == &rootmenu)
-		browsed = &rootmenu;
-
 	for (child = menu->list; child; child = child->next) {
+		/*
+		 * REVISIT:
+		 * menu_finalize() creates empty "if" entries.
+		 * Do not confuse gtk_tree_model_get(), which would otherwise
+		 * return "if" menu entry.
+		 */
+		if (child->type == M_IF)
+			continue;
+
 		prop = child->prompt;
 		ptype = prop ? prop->type : P_UNKNOWN;
 
-- 
2.43.0


