Return-Path: <linux-kbuild+bounces-7692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6634EAE6AF7
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE915A2454
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ECE307ADF;
	Tue, 24 Jun 2025 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9M1Bq87"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC726CE3A;
	Tue, 24 Jun 2025 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777772; cv=none; b=Wcr/MRyGWb0GT6IoRCK6/lmq+q0Y8SC/55XVWGg65QTKHJsCaXBg8JToZ5o0nsDsTndYrkIBTEclwLGjbxkK5PUydcQUHj/OTsT1Pu10UyzkxwBYwtg/hNOHOVUJXdiGEvo1baYiIDHy7J9UHAh8ZQ/p0ZpeB2cpppOpYRPdo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777772; c=relaxed/simple;
	bh=Lz9m9SXvUVEm7qdM1FMKtPZYPlZLcS/XNMVA5d0LNOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMg3dVyE/nw1ZY0p/6Qo4zfSxGOdik35z/TMeJpezhau2+0zbbHnW26eqRc0xz/j9aocHhl6Vf3m2rIbiydt/FCByNDfY+e8jJqXLZfD+wMmEdYEZOk8dTaygRf3N6EKsEjRf+guh3tl2A0VO7r5xY4H5GAKlPnKirnPbXLps7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9M1Bq87; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D3CC4CEE3;
	Tue, 24 Jun 2025 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777771;
	bh=Lz9m9SXvUVEm7qdM1FMKtPZYPlZLcS/XNMVA5d0LNOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X9M1Bq87rEfvDbCrbSabrTAksUFtecnfu8eFGChMP4SE/CCyUIT9PQXlNkLhGC9yG
	 R+KkbprXN4NrHROJBUfURRLBTTH4E5Kab6o5Y4c5ezRy4lQlzaBlxLwjbksk/DctPw
	 ybmU062xZ9i2kQvabwDWOH4p52rZBuVn36q5BquMUCGrJ+x+/kXUVEh+HqIoePoeWh
	 wVyWAwRZvrSRv3AIo6Orh0350YualFV8x5tnMitW3x7OIMpGXcH6WbDpQuLJFbrldI
	 Xy8nVV7mG5YQGe5Gj8rI0OVTkErlBGCiSMy5K6Qzy8TNpIqpEMExLvuTHDmawL4hvG
	 LxdazXm6WibUQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 65/66] kconfig: gconf: replace GdkColor with GdkRGBA
Date: Wed, 25 Jun 2025 00:05:53 +0900
Message-ID: <20250624150645.1107002-66-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GdkColor is deprecated with GTK 3.14. [1]

Use GdkRGBA instead.

This fixes warnings such as:

scripts/kconfig/gconf.c: In function ‘set_node’:
scripts/kconfig/gconf.c:138:9: warning: ‘gdk_color_parse’ is deprecated: Use 'gdk_rgba_parse' instead [-Wdeprecated-declarations]
  138 |         gdk_color_parse(menu_is_visible(menu) ? "Black" : "DarkGray", &color);
      |         ^~~~~~~~~~~~~~~

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.14.0/gdk/deprecated/gdkcolor.h#L52

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 5959ed255d12..5b1b468e782d 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -125,7 +125,7 @@ static void set_node(GtkTreeStore *tree, GtkTreeIter *node, struct menu *menu)
 	const gchar *_mod = "";
 	const gchar *_yes = "";
 	const gchar *value = "";
-	GdkColor color;
+	GdkRGBA color;
 	gboolean editable = FALSE;
 	gboolean btnvis = FALSE;
 
@@ -135,7 +135,7 @@ static void set_node(GtkTreeStore *tree, GtkTreeIter *node, struct menu *menu)
 				 menu->type == M_COMMENT ? "***" : "",
 				 sym && !sym_has_value(sym) ? "(NEW)" : "");
 
-	gdk_color_parse(menu_is_visible(menu) ? "Black" : "DarkGray", &color);
+	gdk_rgba_parse(&color, menu_is_visible(menu) ? "Black" : "DarkGray");
 
 	if (!sym)
 		goto set;
@@ -1148,7 +1148,7 @@ static void init_left_tree(void)
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_POINTER, GDK_TYPE_COLOR,
+				   G_TYPE_POINTER, GDK_TYPE_RGBA,
 				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
@@ -1179,7 +1179,7 @@ static void init_left_tree(void)
 	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
 					    renderer,
 					    "text", COL_OPTION,
-					    "foreground-gdk",
+					    "foreground-rgba",
 					    COL_COLOR, NULL);
 
 	sel = gtk_tree_view_get_selection(view);
@@ -1199,7 +1199,7 @@ static void init_right_tree(void)
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_POINTER, GDK_TYPE_COLOR,
+				   G_TYPE_POINTER, GDK_TYPE_RGBA,
 				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
@@ -1237,32 +1237,32 @@ static void init_right_tree(void)
 	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
 					    renderer,
 					    "text", COL_OPTION,
-					    "foreground-gdk",
+					    "foreground-rgba",
 					    COL_COLOR, NULL);
 
 	renderer = gtk_cell_renderer_text_new();
 	gtk_tree_view_insert_column_with_attributes(view, -1,
 						    "Name", renderer,
 						    "text", COL_NAME,
-						    "foreground-gdk",
+						    "foreground-rgba",
 						    COL_COLOR, NULL);
 	renderer = gtk_cell_renderer_text_new();
 	gtk_tree_view_insert_column_with_attributes(view, -1,
 						    "N", renderer,
 						    "text", COL_NO,
-						    "foreground-gdk",
+						    "foreground-rgba",
 						    COL_COLOR, NULL);
 	renderer = gtk_cell_renderer_text_new();
 	gtk_tree_view_insert_column_with_attributes(view, -1,
 						    "M", renderer,
 						    "text", COL_MOD,
-						    "foreground-gdk",
+						    "foreground-rgba",
 						    COL_COLOR, NULL);
 	renderer = gtk_cell_renderer_text_new();
 	gtk_tree_view_insert_column_with_attributes(view, -1,
 						    "Y", renderer,
 						    "text", COL_YES,
-						    "foreground-gdk",
+						    "foreground-rgba",
 						    COL_COLOR, NULL);
 	renderer = gtk_cell_renderer_text_new();
 	gtk_tree_view_insert_column_with_attributes(view, -1,
@@ -1270,7 +1270,7 @@ static void init_right_tree(void)
 						    "text", COL_VALUE,
 						    "editable",
 						    COL_EDIT,
-						    "foreground-gdk",
+						    "foreground-rgba",
 						    COL_COLOR, NULL);
 	g_signal_connect(G_OBJECT(renderer), "edited",
 			 G_CALLBACK(renderer_edited), tree2_w);
-- 
2.43.0


