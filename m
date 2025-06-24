Return-Path: <linux-kbuild+bounces-7648-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B2AE6A4D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 081235A19CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E9D2E1757;
	Tue, 24 Jun 2025 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReshN+DS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323C12D3A80;
	Tue, 24 Jun 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777679; cv=none; b=QnPKdBVcDzuKtRTFVhmf3wniVJorn0wsiz5aT+G5z3Q7Fr/5wWw9StgFRNyfLXLMHvnzhrFXz0qHFWvjdsEvzQrPv3z0nnaDk+NbpCjfPZw7VriCQzrsxHi5OuuMbMmjuGqTQ43zkrleVTv5BNJdEqdVVHl/qWBzfMEXyeaJXD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777679; c=relaxed/simple;
	bh=7R9zLWVFiLd9C1meIr0Aq65EzG0bbG2WnzXi/9AlQKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gu7/MRXRp8prJhz4c48/90yt8Kd5hOQB36zMB6AB/W5pErXHvK+RwMVwZbUIkLHOK2usRXQuGT+CVhhZGTiFXrx3e3/ilQ0WFchCi5AmqeDxmI5s5SNAdSg05P7bpu0Tkk0jV30oJBdL7F6aWDkyR8XcwSptqQ4YFMYE+KN2xpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReshN+DS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB60C4CEF3;
	Tue, 24 Jun 2025 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777678;
	bh=7R9zLWVFiLd9C1meIr0Aq65EzG0bbG2WnzXi/9AlQKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ReshN+DSDx1NCSu9XGW9wu59RACEShcoTShMju3VFSQtgQZp93OkT4SmflzD5WXiw
	 f5hx/HhMnNygiGLA/i3DZbzp9ltE96yr2jpBb9rvM9OB6B04KSbUP2JyFc3Mvmv6um
	 M2beU0MFem3BoInFsRwheIBtUjQJJJBGQO1xzmVJAWx476aj8Nj1UqQYDe5EmqhtBV
	 IJuhtWSSG6IY5uM9+jp4ZD0U53+apImX9fvkvfGrQ03rXuElly0eag038m3E0gl5pK
	 iTm9AKK7jEEmSGk2apTD06iORGYD2JvZUvBu2wrW3yG3oB+pe8YIhxd68cEh2o3BuL
	 BGYw2Z1fvaH4w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/66] kconfig: gconf: remove unneeded variables in on_treeview*_button_press_event()
Date: Wed, 25 Jun 2025 00:05:09 +0900
Message-ID: <20250624150645.1107002-22-masahiroy@kernel.org>
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

No all position parameters are used here. Passing NULL to
gtk_tree_view_get_cursor() or gtk_tree_view_get_path_at_pos() is
allowed. [1] [2]

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtktreeview.c#L12638
[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gtk/gtktreeview.c#L12795
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index c78eded5c01b..ab2e0df21037 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -822,13 +822,10 @@ on_treeview2_button_press_event(GtkWidget * widget,
 	GtkTreeIter iter;
 	struct menu *menu;
 	gint col;
-
 	gint tx = (gint) event->x;
 	gint ty = (gint) event->y;
-	gint cx, cy;
 
-	gtk_tree_view_get_path_at_pos(view, tx, ty, &path, &column, &cx,
-				      &cy);
+	gtk_tree_view_get_path_at_pos(view, tx, ty, &path, &column, NULL, NULL);
 	if (path == NULL)
 		return FALSE;
 
@@ -871,12 +868,11 @@ on_treeview2_key_press_event(GtkWidget * widget,
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
 	GtkTreePath *path;
-	GtkTreeViewColumn *column;
 	GtkTreeIter iter;
 	struct menu *menu;
 	gint col;
 
-	gtk_tree_view_get_cursor(view, &path, &column);
+	gtk_tree_view_get_cursor(view, &path, NULL);
 	if (path == NULL)
 		return FALSE;
 
@@ -930,16 +926,12 @@ on_treeview1_button_press_event(GtkWidget * widget,
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
 	GtkTreePath *path;
-	GtkTreeViewColumn *column;
 	GtkTreeIter iter;
 	struct menu *menu;
-
 	gint tx = (gint) event->x;
 	gint ty = (gint) event->y;
-	gint cx, cy;
 
-	gtk_tree_view_get_path_at_pos(view, tx, ty, &path, &column, &cx,
-				      &cy);
+	gtk_tree_view_get_path_at_pos(view, tx, ty, &path, NULL, NULL, NULL);
 	if (path == NULL)
 		return FALSE;
 
-- 
2.43.0


