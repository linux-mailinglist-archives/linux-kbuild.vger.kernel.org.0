Return-Path: <linux-kbuild+bounces-7668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2030AE6AA2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738141C4014E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03B12EE260;
	Tue, 24 Jun 2025 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YZvyPWC4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FDB2ED86E;
	Tue, 24 Jun 2025 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777721; cv=none; b=e6RLFdHNElgquTlXOVfnEu1qw/uVpNsYsxdTYq+tlbU2MsBCs+J012UgRvpFk2nFDM47lwXAEsdbrligiVZoDHculaxzCJ+1PI/Mmt7odUX55hLcjXLO4SpdVZHpfnJEN5PlezO+gkKWFpOBBfDqSmLo57NoamfMMwBHWseLrFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777721; c=relaxed/simple;
	bh=7p6CtxcfcmIwA2DnVyNG43k7NGjSirtbylmlPIfJn7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q0ASSDwqLuK3DtffkjYqh1oqf92YpktfQ7DvgJCeyE8Leb5iis5sSGDlLoSb9RxeCQD4t3tZHGu3SWECoYufp4YFHYlA2346KPnh6AyATfnTzlHDPYgAHbCHjPjrfeoC40UXUtyYoudeelV4CcpYcrU5yOQ55ycxJt0lRcX079c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YZvyPWC4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253E8C4CEE3;
	Tue, 24 Jun 2025 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777721;
	bh=7p6CtxcfcmIwA2DnVyNG43k7NGjSirtbylmlPIfJn7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YZvyPWC4U9VSO1RShcSnrIKy/8YyIlD87e69FhDE+g5MqXyyNjCkl/SXYubN0KaAM
	 qNZ2Un1q6QL/SmcxJk9sIr/7KyeCC0j5gJ3pVU6J5RRXhs+ptG2VTKwuXN3f+pnmW6
	 XSM9DXRBi1+fqxSBH30lM0iypUYiiV+SYlsiGGGVx3zzCl1WZgbmZJtZqRev1b92kh
	 DIJNdE/x2OLeWFtmpkd/ToIhd2dzFnfbE0BrhvPYXiesS2nebOlJNzu97MefUmnjvQ
	 +iuLOHaJlAHwuLODdYCes5T4iasYtqt16qNw/eYoLj5y/MAin8m+9UzjoTFPNU7aey
	 1kn3WwKXxd1xA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 41/66] kconfig: gconf: remove global 'tree' variable
Date: Wed, 25 Jun 2025 00:05:29 +0900
Message-ID: <20250624150645.1107002-42-masahiroy@kernel.org>
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

Pass the tree store as a function parameter to make it clearer which
tree is being updated.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 42 ++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 67305577b432..cfe65baa4f18 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -43,7 +43,7 @@ static GtkWidget *save_menu_item;
 
 static GtkTextTag *tag1, *tag2;
 
-static GtkTreeStore *tree1, *tree2, *tree;
+static GtkTreeStore *tree1, *tree2;
 static GtkTreeModel *model1, *model2;
 
 static struct menu *current; // current node for SINGLE view
@@ -57,7 +57,7 @@ enum {
 };
 
 static void display_list(void);
-static void display_tree(struct menu *menu);
+static void display_tree(GtkTreeStore *store, struct menu *menu);
 static void display_tree_part(void);
 static void update_tree(struct menu *src, GtkTreeIter * dst);
 
@@ -101,7 +101,7 @@ static void set_view_mode(enum view_mode mode)
 		break;
 	case FULL_VIEW:
 		gtk_tree_store_clear(tree2);
-		display_tree(&rootmenu);
+		display_tree(tree2, &rootmenu);
 		gtk_widget_set_sensitive(full_btn, FALSE);
 		break;
 	}
@@ -272,7 +272,7 @@ static void on_set_option_mode1_activate(GtkMenuItem *menuitem,
 {
 	opt_mode = OPT_NORMAL;
 	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
+	display_tree(tree2, &rootmenu);	/* instead of update_tree to speed-up */
 }
 
 static void on_set_option_mode2_activate(GtkMenuItem *menuitem,
@@ -280,7 +280,7 @@ static void on_set_option_mode2_activate(GtkMenuItem *menuitem,
 {
 	opt_mode = OPT_ALL;
 	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
+	display_tree(tree2, &rootmenu);	/* instead of update_tree to speed-up */
 }
 
 static void on_set_option_mode3_activate(GtkMenuItem *menuitem,
@@ -288,7 +288,7 @@ static void on_set_option_mode3_activate(GtkMenuItem *menuitem,
 {
 	opt_mode = OPT_PROMPT;
 	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
+	display_tree(tree2, &rootmenu);	/* instead of update_tree to speed-up */
 }
 
 static void on_introduction1_activate(GtkMenuItem *menuitem, gpointer user_data)
@@ -852,7 +852,8 @@ static gchar **fill_row(struct menu *menu)
 
 
 /* Set the node content with a row of strings */
-static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row)
+static void set_node(GtkTreeStore *tree, GtkTreeIter *node,
+		     struct menu *menu, gchar **row)
 {
 	GdkColor color;
 	gboolean success;
@@ -976,7 +977,7 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 				gtk_tree_store_insert_before(tree2,
 							     child2,
 							     dst, sibling);
-				set_node(child2, menu1, fill_row(menu1));
+				set_node(tree2, child2, menu1, fill_row(menu1));
 				if (menu2 == NULL)
 					valid = TRUE;
 			} else {	// remove node
@@ -990,7 +991,7 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 					goto reparse;	// next child
 			}
 		} else if (sym && (child1->flags & MENU_CHANGED)) {
-			set_node(child2, menu1, fill_row(menu1));
+			set_node(tree2, child2, menu1, fill_row(menu1));
 		}
 
 		update_tree(child1, child2);
@@ -1001,7 +1002,8 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 
 
 /* Display the whole tree (single/split/full view) */
-static void _display_tree(struct menu *menu, GtkTreeIter *parent)
+static void _display_tree(GtkTreeStore *tree, struct menu *menu,
+			  GtkTreeIter *parent)
 {
 	struct property *prop;
 	struct menu *child;
@@ -1029,7 +1031,7 @@ static void _display_tree(struct menu *menu, GtkTreeIter *parent)
 		    (opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
 		    (opt_mode == OPT_ALL    && menu_get_prompt(child))) {
 			gtk_tree_store_append(tree, &iter, parent);
-			set_node(&iter, child, fill_row(child));
+			set_node(tree, &iter, child, fill_row(child));
 		}
 
 		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
@@ -1043,13 +1045,13 @@ static void _display_tree(struct menu *menu, GtkTreeIter *parent)
 		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW))
-			_display_tree(child, &iter);
+			_display_tree(tree, child, &iter);
 	}
 }
 
-static void display_tree(struct menu *menu)
+static void display_tree(GtkTreeStore *store, struct menu *menu)
 {
-	_display_tree(menu, NULL);
+	_display_tree(store, menu, NULL);
 }
 
 /* Display a part of the tree starting at current node (single/split view) */
@@ -1057,11 +1059,11 @@ static void display_tree_part(void)
 {
 	gtk_tree_store_clear(tree2);
 	if (view_mode == SINGLE_VIEW)
-		display_tree(current);
+		display_tree(tree2, current);
 	else if (view_mode == SPLIT_VIEW)
-		display_tree(browsed);
+		display_tree(tree2, browsed);
 	else if (view_mode == FULL_VIEW)
-		display_tree(&rootmenu);
+		display_tree(tree2, &rootmenu);
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
 }
 
@@ -1070,10 +1072,8 @@ static void display_list(void)
 {
 	gtk_tree_store_clear(tree1);
 
-	tree = tree1;
-	display_tree(&rootmenu);
+	display_tree(tree1, &rootmenu);
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));
-	tree = tree2;
 }
 
 static void fixup_rootmenu(struct menu *menu)
@@ -1251,7 +1251,7 @@ static void init_main_window(const gchar *glade_file)
 
 static void init_tree_model(void)
 {
-	tree = tree2 = gtk_tree_store_new(COL_NUMBER,
+	tree2 = gtk_tree_store_new(COL_NUMBER,
 					  G_TYPE_STRING, G_TYPE_STRING,
 					  G_TYPE_STRING, G_TYPE_STRING,
 					  G_TYPE_STRING, G_TYPE_STRING,
-- 
2.43.0


