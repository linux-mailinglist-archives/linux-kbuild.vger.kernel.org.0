Return-Path: <linux-kbuild+bounces-7669-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5C6AE6A99
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 116854E13EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94042EE292;
	Tue, 24 Jun 2025 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gesKfYTt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3B22EE28F;
	Tue, 24 Jun 2025 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777723; cv=none; b=oEddkyDrFgSNdW4I146NPAO8JWrf3CTrI/GzGJloco9CtJV7wAK1dhe008HSrhEappVrwKWnmnGVt6MVJ+IDtHuH+C68YN7y8JagSIX7QSXCKwDqM97Udhl1UpvtU6ZHhj1hqca6Vb7Y4SI65EsYLmMEat354JE1xrX336tI7bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777723; c=relaxed/simple;
	bh=nGspiZsKab9eVwp41zZc7FKxzc+4sRANyVju35ULvhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFpecfrmoJA3hUN6ZZCY/tdd7+zrWbf2LPtcc8WQ9z9SgqdMw6dXMMIN5Il3AhyYqPwMaJmpaV++LC3yukPtaDEjthQYQC8Dej+5XFUdYqOVbaVHSQj33DzTSwup4iLtz7UF+KZsG8M7dvoopwijIY+B19Ga+zRCWbQYWxkhKzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gesKfYTt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED55C4CEF0;
	Tue, 24 Jun 2025 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777723;
	bh=nGspiZsKab9eVwp41zZc7FKxzc+4sRANyVju35ULvhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gesKfYTtu8J27H/TY9Nf853gj/1pqxbjGzO85uJJCl1K3MUoz5dRn4C+X6m1jn0qt
	 FjfAbi5iBNEVShwAGNLYAn62hi57NojaDgkNQU2b14JpY2sm/OTM5enNpd0GpAMnIJ
	 FP1db/dNby2rC0X8xa7XH6fGY361dF2d/u8i1nk7ie/iSDdrw2vrdn6L2RUh2HXujv
	 CCtbIehS69r056eGe2ycmmLVa6WAk+fBBJpQ8nFT7dD3mfnmIHtDAY8HMp335MGd6W
	 JSA6sJi6lqn+GIm/X57hlSpTulx4hrDaBVNL+NGpOY1FWEGMFRJwownCoMV5XbE4CP
	 W68Fgg92pQlKA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 42/66] kconfig: gconf: merge 'current' and 'browsed' global variables
Date: Wed, 25 Jun 2025 00:05:30 +0900
Message-ID: <20250624150645.1107002-43-masahiroy@kernel.org>
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

The 'current' (SINGLE view) and 'browsed' (SPLIT_VIEW) variables serve
similar purposes and are not needed at the same time. Merge them.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index cfe65baa4f18..cf9345ba23ce 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -46,8 +46,7 @@ static GtkTextTag *tag1, *tag2;
 static GtkTreeStore *tree1, *tree2;
 static GtkTreeModel *model1, *model2;
 
-static struct menu *current; // current node for SINGLE view
-static struct menu *browsed; // browsed node for SPLIT view
+static struct menu *browsed; // browsed menu for SINGLE/SPLIT view
 
 enum {
 	COL_OPTION, COL_NAME, COL_NO, COL_MOD, COL_YES, COL_VALUE,
@@ -90,7 +89,7 @@ static void set_view_mode(enum view_mode mode)
 
 	switch (mode) {
 	case SINGLE_VIEW:
-		current = &rootmenu;
+		browsed = &rootmenu;
 		display_tree_part();
 		gtk_widget_set_sensitive(single_btn, FALSE);
 		break;
@@ -352,13 +351,13 @@ static void on_back_clicked(GtkButton *button, gpointer user_data)
 {
 	enum prop_type ptype;
 
-	current = current->parent;
-	ptype = current->prompt ? current->prompt->type : P_UNKNOWN;
+	browsed = browsed->parent;
+	ptype = browsed->prompt ? browsed->prompt->type : P_UNKNOWN;
 	if (ptype != P_MENU)
-		current = current->parent;
+		browsed = browsed->parent;
 	display_tree_part();
 
-	if (current == &rootmenu)
+	if (browsed == &rootmenu)
 		gtk_widget_set_sensitive(back_btn, FALSE);
 }
 
@@ -611,7 +610,7 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 
 		if (ptype == P_MENU && view_mode != FULL_VIEW && col == COL_OPTION) {
 			// goes down into menu
-			current = menu;
+			browsed = menu;
 			display_tree_part();
 			gtk_widget_set_sensitive(back_btn, TRUE);
 		} else if (col == COL_OPTION) {
@@ -710,14 +709,11 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 	gtk_tree_model_get_iter(model, &iter, path);
 	gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 
-	if (event->type == GDK_2BUTTON_PRESS) {
+	if (event->type == GDK_2BUTTON_PRESS)
 		toggle_sym_value(menu);
-		current = menu;
-		display_tree_part();
-	} else {
-		browsed = menu;
-		display_tree_part();
-	}
+
+	browsed = menu;
+	display_tree_part();
 
 	gtk_tree_view_set_cursor(view, path, NULL, FALSE);
 	gtk_widget_grab_focus(tree2_w);
@@ -1011,7 +1007,7 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 	GtkTreeIter iter;
 
 	if (menu == &rootmenu)
-		current = &rootmenu;
+		browsed = &rootmenu;
 
 	for (child = menu->list; child; child = child->next) {
 		prop = child->prompt;
@@ -1058,9 +1054,7 @@ static void display_tree(GtkTreeStore *store, struct menu *menu)
 static void display_tree_part(void)
 {
 	gtk_tree_store_clear(tree2);
-	if (view_mode == SINGLE_VIEW)
-		display_tree(tree2, current);
-	else if (view_mode == SPLIT_VIEW)
+	if (view_mode == SINGLE_VIEW || view_mode == SPLIT_VIEW)
 		display_tree(tree2, browsed);
 	else if (view_mode == FULL_VIEW)
 		display_tree(tree2, &rootmenu);
-- 
2.43.0


