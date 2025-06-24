Return-Path: <linux-kbuild+bounces-7670-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A537AE6A6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20A257B866D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31B22EE98D;
	Tue, 24 Jun 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8SlOiFI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888842EE980;
	Tue, 24 Jun 2025 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777725; cv=none; b=qqawr3U0OkUzf+lLjJHhtspGD3n3NCo18HXOk1VnRzGcG8z0QTzKwWzmEl9sUimhuhQTE7kOvJHmzOMprrWUXLyx8uW5DvY298isDNRZpWUGno8rX+K0Jd45wY4fBMil+CLmpDztsgDlbG/yKpaEDAra5eulGGhOupgbmMQ3Pkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777725; c=relaxed/simple;
	bh=xp6446iJXQaQj/u0PWhIbBfp6TSCs3uvRB+uvz0SEZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsEaSpP8c/c66dGUDLAu3OafNztMw7qvBwF97SUsqsFA1kiATFxs/aZqm+rCAX2sOwbX2jkkLI8stwEzCYwqDfU+P62mnAzobrDrkUiwb/PTCXl8F0KnGyYNt5D8/KuIROGxsj2+De1ZsFmlxAqM2TDc52+jARJjkZD2FyJKYRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8SlOiFI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347ADC4CEE3;
	Tue, 24 Jun 2025 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777725;
	bh=xp6446iJXQaQj/u0PWhIbBfp6TSCs3uvRB+uvz0SEZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S8SlOiFIYJpF1C+2PRMsC7cLXAHMLdbJeXqkmTc7rC8Su0ahvTQXdfZlngIobBEOw
	 Z1sayoA4YjjVQtZeRm6axJ2kK4aySJifS+aMxuVzU/PVNDLAiYeiWadvw7b5feeA8v
	 fZbb6z009Z5GUYqVyQiBnOou/QtuJImOR83hbKL+xpJHGIqFIH0DukJhPpEAB3XUlW
	 417nH0WiWbO4J50SYx36FmSjXkANDtsN0X8foAQZwtNaF0jPpWXHhowSw/CDQT24jW
	 ZWMwdXwxX5HF69bTq84JNbfXd+mCSyx4aOfrZWss5wjt44Vg1v9gogKF55gHFpHr5L
	 9MHf+oKJkpeIQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 43/66] kconfig: gconf: preserve menu selection when switching view mode
Date: Wed, 25 Jun 2025 00:05:31 +0900
Message-ID: <20250624150645.1107002-44-masahiroy@kernel.org>
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

Preserve the current menu selection when switching to a different view
mode, as it improves usability.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 86 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 78 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index cf9345ba23ce..184678dd4fa6 100644
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
@@ -89,24 +131,40 @@ static void set_view_mode(enum view_mode mode)
 
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
+		browsed = NULL;
+		if (selected) {
+			if (selected->type == M_MENU)
+				browsed = selected;
+			else
+				browsed = menu_get_parent_menu(selected);
+		}
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
@@ -603,6 +661,8 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 		return FALSE;
 	gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 
+	selected = menu;
+
 	col = column2index(column);
 	if (event->type == GDK_2BUTTON_PRESS) {
 		enum prop_type ptype;
@@ -712,8 +772,12 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
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
@@ -1006,10 +1070,16 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
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


