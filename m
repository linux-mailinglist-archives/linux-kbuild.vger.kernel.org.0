Return-Path: <linux-kbuild+bounces-7645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3542DAE6A5D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5445917EECF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A782E0B7F;
	Tue, 24 Jun 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cs5qKqBG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBEE2E11B9;
	Tue, 24 Jun 2025 15:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777672; cv=none; b=Bww0A87EDALOSwJAJeOpi61u4Gt2R80X/Ih0ZlXrd6Ut9/trXemWe4HxrtK07/ORi32AfqpiK2uZMtkTxESdNicFWvJCB3hIa4SXzbTpaEpKfVyjIgPjKWLhe472AhvpzPiy8i6Sws19uKPyxfPT55xB3cvoIDuryatajNdE5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777672; c=relaxed/simple;
	bh=LW+bB5SVKxnHDdlR8+C2VtbTMAf1SYKnEZ4+zHYx3jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrEAO/ldzNZ1C9U0Sq20v8wmPCB2WWEHqeUsqX5PXt5wy94eukghJDT+OBxA4XXc3Tw/H3H+9MJCu1qzXJpFl79UTtSO2dZqPUQNKX6WzaAvvuGAfB93VohEvBcfIKPMCpzrN2wZWDH4RJVzotTXZ6S63ZeYH0G8L6awTd6s8wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cs5qKqBG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4E1C4CEF1;
	Tue, 24 Jun 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777672;
	bh=LW+bB5SVKxnHDdlR8+C2VtbTMAf1SYKnEZ4+zHYx3jE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cs5qKqBGh9lGex1o6gNRe7LL7VvrhO10i6R4hAaPHFk656rhoDvBawdxzv16yyKUu
	 aet9VPAwl3CB5uyxql5JOJZuYP373eI+fttAXG4ZWWl18l1KMIcvpykd1NqK2bxbsl
	 EnD5YUAkkbTuijuKOwSUma44ba/gBbVgpdbnnau8nrTT5eETIna0WS3IWNgJBiIKuI
	 T3+8JQI8nLTVVVOdSyHvp6p0yCuw3osowTO4jCbtCYFly8IgqjV6/9TTUvrcWeFD8Z
	 dWojR3g1OyuqIViNF9EeAsZ+joPtiSAXsyudGF99YzZ7QEKwlO/iAAa+rS7tQs9vKT
	 4AN4N/GQkkbvg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/66] kconfig: gconf: remove parents[] array and indent variable
Date: Wed, 25 Jun 2025 00:05:06 +0900
Message-ID: <20250624150645.1107002-19-masahiroy@kernel.org>
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

The parents[] array is used to store the GtkTreeIter of parent nodes,
but this can be simplified: we can pass a GtkTreeIter pointer down
when _display_tree() recurses.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 49 ++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 3e632a325c10..432a467e3250 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -47,8 +47,6 @@ GdkColor color;
 
 GtkTreeStore *tree1, *tree2, *tree;
 GtkTreeModel *model1, *model2;
-static GtkTreeIter *parents[256];
-static gint indent;
 
 static struct menu *current; // current node for SINGLE view
 static struct menu *browsed; // browsed node for SPLIT view
@@ -153,8 +151,6 @@ static void init_main_window(const gchar *glade_file)
 
 static void init_tree_model(void)
 {
-	gint i;
-
 	tree = tree2 = gtk_tree_store_new(COL_NUMBER,
 					  G_TYPE_STRING, G_TYPE_STRING,
 					  G_TYPE_STRING, G_TYPE_STRING,
@@ -166,9 +162,6 @@ static void init_tree_model(void)
 					  G_TYPE_BOOLEAN);
 	model2 = GTK_TREE_MODEL(tree2);
 
-	for (parents[0] = NULL, i = 1; i < 256; i++)
-		parents[i] = (GtkTreeIter *) g_malloc(sizeof(GtkTreeIter));
-
 	tree1 = gtk_tree_store_new(COL_NUMBER,
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
@@ -1131,18 +1124,6 @@ static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row)
 	g_object_unref(pix);
 }
 
-
-/* Add a node to the tree */
-static void place_node(struct menu *menu, char **row)
-{
-	GtkTreeIter *parent = parents[indent - 1];
-	GtkTreeIter *node = parents[indent];
-
-	gtk_tree_store_append(tree, node, parent);
-	set_node(node, menu, row);
-}
-
-
 /* Find a node in the GTK+ tree */
 static GtkTreeIter found;
 
@@ -1193,9 +1174,6 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 	struct symbol *sym;
 	struct menu *menu1, *menu2;
 
-	if (src == &rootmenu)
-		indent = 1;
-
 	valid = gtk_tree_model_iter_children(model2, child2, dst);
 	for (child1 = src->list; child1; child1 = child1->next) {
 
@@ -1253,9 +1231,7 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 			set_node(child2, menu1, fill_row(menu1));
 		}
 
-		indent++;
 		update_tree(child1, child2);
-		indent--;
 
 		valid = gtk_tree_model_iter_next(model2, child2);
 	}
@@ -1263,16 +1239,15 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 
 
 /* Display the whole tree (single/split/full view) */
-static void display_tree(struct menu *menu)
+static void _display_tree(struct menu *menu, GtkTreeIter *parent)
 {
 	struct property *prop;
 	struct menu *child;
 	enum prop_type ptype;
+	GtkTreeIter iter;
 
-	if (menu == &rootmenu) {
-		indent = 1;
+	if (menu == &rootmenu)
 		current = &rootmenu;
-	}
 
 	for (child = menu->list; child; child = child->next) {
 		prop = child->prompt;
@@ -1290,8 +1265,10 @@ static void display_tree(struct menu *menu)
 
 		if ((opt_mode == OPT_NORMAL && menu_is_visible(child)) ||
 		    (opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
-		    (opt_mode == OPT_ALL    && menu_get_prompt(child)))
-			place_node(child, fill_row(child));
+		    (opt_mode == OPT_ALL    && menu_get_prompt(child))) {
+			gtk_tree_store_append(tree, &iter, parent);
+			set_node(&iter, child, fill_row(child));
+		}
 
 		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
 		    && (tree == tree2))
@@ -1308,14 +1285,16 @@ static void display_tree(struct menu *menu)
 
 		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
 		    || (view_mode == FULL_VIEW)
-		    || (view_mode == SPLIT_VIEW)) {
-			indent++;
-			display_tree(child);
-			indent--;
-		}
+		    || (view_mode == SPLIT_VIEW))
+			_display_tree(child, &iter);
 	}
 }
 
+static void display_tree(struct menu *menu)
+{
+	_display_tree(menu, NULL);
+}
+
 /* Display a part of the tree starting at current node (single/split view) */
 static void display_tree_part(void)
 {
-- 
2.43.0


