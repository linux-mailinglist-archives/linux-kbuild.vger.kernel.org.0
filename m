Return-Path: <linux-kbuild+bounces-7678-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989FAE6AB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE6F5A0A45
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76772FC003;
	Tue, 24 Jun 2025 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pKTelaBB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818482FBFE8;
	Tue, 24 Jun 2025 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777742; cv=none; b=ZPRk9amNSvMKotLSGw2lpOXpjO51Cb6Yqspq2hJJ5qFerClmExYyspbqaOixSL2p4J13OehEDROPGQFa83pmDOmWFbPL8YTJCsBp9DMNcrYO9/BYIx1f6gAklmql4zeaCP+ZlLxAyAvaveEqpjaVzo4OOFu/B/poXqFfUjZvaaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777742; c=relaxed/simple;
	bh=aUctP13oUDRwlXx9fO0EcU0q+shh9jFIo5WKjcq5DNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MaoVLRfqNWFhD+PnMXITjh2zgU7Z/OuVIw6V17dSI9M8hIDOeTqcoXaO/nzslskILRMKSOZ50pFggJN9IYK8u2Ntxv/U+VnVu1u5GicclHSX3sLJ1MvHYiQfhMCUseGNO/0otfiGedEdmYLmt2baKp1IpKRSM9R2+XAA2hwxFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pKTelaBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E93C4CEF5;
	Tue, 24 Jun 2025 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777742;
	bh=aUctP13oUDRwlXx9fO0EcU0q+shh9jFIo5WKjcq5DNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pKTelaBB/HneArAJgjUVdQq+dicUlatWo3R6iCuqGufIWAgIncZ56MTf93mE4ef6K
	 Be1Ocj5Q7Vse2Mj6lIyRIhJ/AR2eA4ImzXrybdTvDHY3fRcK93ruzJsvNOVmzduA0c
	 Ll5AvvjT4qplbWmpI12I9GKEC5Ikw6+F+O1zpkzzItx4ZTGNXgqbDGvDR4FOQnO+On
	 kkzkddS13nOVWkN7xTiSGaa611/NHQeClDVvmy3s4EKCanqQPeb4XRy4aH2NlDKrkM
	 91HCzWucXqsV2UVIY21nqSMtiKYvgY3sfoP9sI/4Xbbv0fjfjyRJ+p3vVJlDPvSS3F
	 44MF1QrPeldyg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 51/66] kconfig: gconf: rename display_tree_part()
Date: Wed, 25 Jun 2025 00:05:39 +0900
Message-ID: <20250624150645.1107002-52-masahiroy@kernel.org>
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

This function recreates the tree store to update the menu content.
Rename it to recreate_menu_content_tree() to better reflect its purpose.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 64defbe59afc..23a6f99d2cd4 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -57,7 +57,7 @@ enum {
 };
 
 static void display_tree(GtkTreeStore *store, struct menu *menu);
-static void display_tree_part(void);
+static void recreate_menu_content_tree(void);
 
 static void conf_changed(bool dirty)
 {
@@ -279,7 +279,7 @@ static void set_view_mode(enum view_mode mode)
 			browsed = menu_get_parent_menu(selected) ?: &rootmenu;
 		else
 			browsed = &rootmenu;
-		display_tree_part();
+		recreate_menu_content_tree();
 		select_menu(GTK_TREE_VIEW(tree2_w), selected);
 		gtk_widget_set_sensitive(single_btn, FALSE);
 		break;
@@ -556,7 +556,7 @@ static void on_back_clicked(GtkButton *button, gpointer user_data)
 	ptype = browsed->prompt ? browsed->prompt->type : P_UNKNOWN;
 	if (ptype != P_MENU)
 		browsed = browsed->parent;
-	display_tree_part();
+	recreate_menu_content_tree();
 
 	if (browsed == &rootmenu)
 		gtk_widget_set_sensitive(back_btn, FALSE);
@@ -803,7 +803,7 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 		if (ptype == P_MENU && view_mode != FULL_VIEW && col == COL_OPTION) {
 			// goes down into menu
 			browsed = menu;
-			display_tree_part();
+			recreate_menu_content_tree();
 			gtk_widget_set_sensitive(back_btn, TRUE);
 		} else if (col == COL_OPTION) {
 			toggle_sym_value(menu);
@@ -908,7 +908,7 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 
 	if (menu->type == M_MENU) {
 		browsed = menu;
-		display_tree_part();
+		recreate_menu_content_tree();
 	}
 
 	gtk_tree_view_set_cursor(view, path, NULL, FALSE);
@@ -971,7 +971,7 @@ static void display_tree(GtkTreeStore *store, struct menu *menu)
 }
 
 /* Display a part of the tree starting at current node (single/split view) */
-static void display_tree_part(void)
+static void recreate_menu_content_tree(void)
 {
 	gtk_tree_store_clear(tree2);
 	display_tree(tree2, browsed);
-- 
2.43.0


