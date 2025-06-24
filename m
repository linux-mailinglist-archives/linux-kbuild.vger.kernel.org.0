Return-Path: <linux-kbuild+bounces-7675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A2AE6ACF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B92B1C24322
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9802F4A04;
	Tue, 24 Jun 2025 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCPvT1rN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6EA2F49F5;
	Tue, 24 Jun 2025 15:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777736; cv=none; b=QNUw54Lbax5svXnXBTTv1IAeD1cwGuND+huQzJ3Pw+cHjJO+5BhVPJTjRm1+6rQep0JQWp5EhW+2ka1bHEJEaNgjwRpZf5YLs+ZwWjnL+EFneQ4FD3nuypdLf7Ssx15kXzRfLIoOjhcMqelYGdbR36c0OTal+RaO8jfpt0dQnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777736; c=relaxed/simple;
	bh=dFhGcc6Alhno4K/SJYBCoGpeZNOH9EjBbEF76fl4VFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g65DQ+r5HjB9LHO0QpZKn2d0RMC72/U2Ry8PiwwOy0yhoZLuuZTcFTU1f1ZTJDT6ljrgy7TkiTgRNPpY4tEBBEaWWttlBTsxDqz+hvuODVOhAZRBN6VNqnOdIG+IPmGJYgBEG6n7uTiv5EifrEVZWm0P2acP+mrT8OilSRr3Byg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCPvT1rN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4C9C4CEF0;
	Tue, 24 Jun 2025 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777735;
	bh=dFhGcc6Alhno4K/SJYBCoGpeZNOH9EjBbEF76fl4VFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FCPvT1rNuL6HgV1hXXIT/hRzQJ91ysq1SS0QKxdM9dLDPkZJS5+XXM5XBGkwidLPx
	 cXH16Jo1VljfeNmXM0433Z6tQIg0Z13IJ+HPjQw4ooxnVSudQWruvdDPTvu1vFdUtq
	 cIGKgaGqcrFv1cExffDyGXmhIjzyF1+zz3PMxVAMgIBO4dieisCWwem2GSLDVOCeP1
	 3g4rW3aZLiVaUsMgp9MqKADQEjgqSp4imPsE6wNMp2Blcf0UWUlvoNN398Y+HH6P9u
	 HdG/kOv4wocd0zp9c93QjJy8WUTyLgkWjQYiZNP/pWcuFl1ExdIO0+f1i0RVbUoJJN
	 0cKbMyAHNu84w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 48/66] kconfig: gconf: do not reconstruct tree store when a symbol is changed
Date: Wed, 25 Jun 2025 00:05:36 +0900
Message-ID: <20250624150645.1107002-49-masahiroy@kernel.org>
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

There is no need to reconstruct the entire tree store when a symbol's
value changes. Simply call gtk_tree_store_set() to update the row data.

Introduce update_trees() to factor out the common update logic.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 0b73ba9eca14..a358589535e3 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -248,6 +248,13 @@ static void update_tree(GtkTreeStore *store)
 	update_row_visibility();
 }
 
+static void update_trees(void)
+{
+	if (view_mode == SPLIT_VIEW)
+		update_tree(tree1);
+	update_tree(tree2);
+}
+
 static void set_view_mode(enum view_mode mode)
 {
 	view_mode = mode;
@@ -378,7 +385,7 @@ static void on_load1_activate(GtkMenuItem *menuitem, gpointer user_data)
 			text_insert_msg("Error",
 					"Unable to load configuration!");
 		else
-			display_tree_part();
+			update_trees();
 
 		g_free(filename);
 	}
@@ -697,7 +704,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 
 	sym_set_string_value(sym, new_def);
 
-	update_tree(tree2);
+	update_trees();
 
 free:
 	gtk_tree_path_free(path);
@@ -727,14 +734,7 @@ static void change_sym_value(struct menu *menu, gint col)
 		if (!sym_tristate_within_range(sym, newval))
 			newval = yes;
 		sym_set_tristate_value(sym, newval);
-		if (view_mode == FULL_VIEW)
-			update_tree(tree2);
-		else if (view_mode == SPLIT_VIEW) {
-			update_tree(tree2);
-			display_list();
-		}
-		else if (view_mode == SINGLE_VIEW)
-			display_tree_part();	//fixme: keep exp/coll
+		update_trees();
 		break;
 	case S_INT:
 	case S_HEX:
@@ -750,14 +750,7 @@ static void toggle_sym_value(struct menu *menu)
 		return;
 
 	sym_toggle_tristate_value(menu->sym);
-	if (view_mode == FULL_VIEW)
-		update_tree(tree2);
-	else if (view_mode == SPLIT_VIEW) {
-		update_tree(tree2);
-		display_list();
-	}
-	else if (view_mode == SINGLE_VIEW)
-		display_tree_part();	//fixme: keep exp/coll
+	update_trees();
 }
 
 static gint column2index(GtkTreeViewColumn * column)
-- 
2.43.0


