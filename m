Return-Path: <linux-kbuild+bounces-7738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE9AECFA4
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFD8A1892EF7
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F52023ABB5;
	Sun, 29 Jun 2025 18:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMuoX0lX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB523ABB0;
	Sun, 29 Jun 2025 18:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222763; cv=none; b=R8xqT/+qavRV0ymMG5LDYFlaQfjx6d9dIPeJYmAAojEUWsFEa6R8+pYVvg7ysPLSVPstOLUm7qgRksydwQHChZ94RyUD84OtKTSgTGRDFWL2o97Zy7bdRd52z6GPzfsqbpFg5LfZi8fgMFB8oPbh9lC5Y8+aCcOoV/LOwrp1Lk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222763; c=relaxed/simple;
	bh=WdrN3yT3caKcROu27pF5IqWbxdrO1B5dCUQziQ/YDyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiXiYrAaZyuadRH7V94diVVybaCfb3ZNgSL940/5S4eCIhLqFL+b6qdqgqRdvUaXqf+uELuoBodktMWHuFSVdHhZFSZ5+QOwbfU84MfZpw2G8T5xmVJwvAECwxm4W4E2UPVHNMIEK783cCvIHpQggq37vSZAxSo0OB2cyz+SsYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMuoX0lX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0963C4CEEF;
	Sun, 29 Jun 2025 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222762;
	bh=WdrN3yT3caKcROu27pF5IqWbxdrO1B5dCUQziQ/YDyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sMuoX0lXdTNQauFlJWa9XrnGGbz2zK2e/qR82d1WNfGUaFYn++C5y4r5H5vlVc7wh
	 yN0B2Mg3IOPaxt4DQGkTlxLsamDb+Uyj+VvdvQJI7Pp3384TA/p4W3ZBumjbDYfMwq
	 LrUgauve5mgXJBaVTvKRxkoebJIltDManNIHijaFRXcabNYWIFDhOc2b88RGmVF1bN
	 F8qMWA+iLs97p1aqV1aMIeoU1uLs/0L0Tm2MRdlQ68NNDFx6Fz3Y1kbf0oCQbkvvBw
	 hZ7LzV3dGHyWnf84BIGAjncQ1NFRfTxZuj87dN1ytsO1xxIgvdW4T8ScjNT9zBR1rJ
	 H1NkmUFtCY8Uw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] kconfig: gconf: rename display_tree_part()
Date: Mon, 30 Jun 2025 03:43:29 +0900
Message-ID: <20250629184554.407497-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function recreates the tree store to update the menu content.
Rename it to recreate_tree() to better reflect its purpose.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Rename to recreate_tree()

 scripts/kconfig/gconf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 8b19298eef61..bc25924a1adf 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -57,7 +57,7 @@ enum {
 };
 
 static void display_tree(GtkTreeStore *store, struct menu *menu);
-static void display_tree_part(void);
+static void recreate_tree(void);
 
 static void conf_changed(bool dirty)
 {
@@ -279,7 +279,7 @@ static void set_view_mode(enum view_mode mode)
 			browsed = menu_get_parent_menu(selected) ?: &rootmenu;
 		else
 			browsed = &rootmenu;
-		display_tree_part();
+		recreate_tree();
 		select_menu(GTK_TREE_VIEW(tree2_w), selected);
 		gtk_widget_set_sensitive(single_btn, FALSE);
 		break;
@@ -556,7 +556,7 @@ static void on_back_clicked(GtkButton *button, gpointer user_data)
 	ptype = browsed->prompt ? browsed->prompt->type : P_UNKNOWN;
 	if (ptype != P_MENU)
 		browsed = browsed->parent;
-	display_tree_part();
+	recreate_tree();
 
 	if (browsed == &rootmenu)
 		gtk_widget_set_sensitive(back_btn, FALSE);
@@ -793,7 +793,7 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 		if (ptype == P_MENU && view_mode == SINGLE_VIEW && col == COL_OPTION) {
 			// goes down into menu
 			browsed = menu;
-			display_tree_part();
+			recreate_tree();
 			gtk_widget_set_sensitive(back_btn, TRUE);
 		} else if (col == COL_OPTION) {
 			toggle_sym_value(menu);
@@ -898,7 +898,7 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 
 	if (menu->type == M_MENU) {
 		browsed = menu;
-		display_tree_part();
+		recreate_tree();
 	}
 
 	gtk_tree_view_set_cursor(view, path, NULL, FALSE);
@@ -960,7 +960,7 @@ static void display_tree(GtkTreeStore *store, struct menu *menu)
 }
 
 /* Display a part of the tree starting at current node (single/split view) */
-static void display_tree_part(void)
+static void recreate_tree(void)
 {
 	gtk_tree_store_clear(tree2);
 	display_tree(tree2, browsed);
-- 
2.43.0


