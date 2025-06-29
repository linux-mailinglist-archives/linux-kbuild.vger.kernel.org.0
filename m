Return-Path: <linux-kbuild+bounces-7742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F13AECFAE
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D8B47A9946
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4695423D2AB;
	Sun, 29 Jun 2025 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQjwXlSM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9423D28E;
	Sun, 29 Jun 2025 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222769; cv=none; b=cQNamQpc7EJsJ3hzqp58wAeJuouRMPBB9Xvccct1Bkl4iqYiQAg13kYIgSGbIlmwNkG3dRHAbeXULmBUhWo//ULlMVTZrwUwBrALECl30lIoMCFvnpTF7asLVnsR/Www+DAcWlwoOddQHxMJL8Qh+XRxjvN2NSoTwbih8iDhJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222769; c=relaxed/simple;
	bh=7qVJT7FJI6PQRv2Xm5iu7ZR0RM8RF5vD5PyKw0Y0lx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cEI2Mi77hwVFspY/AyoUdw8pVYtEWGjWTI5wgx8h/bL+Cxl7avhDmn8CuxuyP69ZoXVB7z4gGQX2Kw+Xw1kAGo9lePCN5t9hEW6fKjH9bCfApsoMnFWxFAPRvyFbmwzTaX52/86S3LmMY2OrHN/F6zWzhlHQAYU8aYqZJlqb9z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQjwXlSM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87E5C4CEF0;
	Sun, 29 Jun 2025 18:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222768;
	bh=7qVJT7FJI6PQRv2Xm5iu7ZR0RM8RF5vD5PyKw0Y0lx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQjwXlSMDf+DMuCsFH2gJ520V/dWrUIZIFzzlO0iUT+aZZdwshOsw8s/aUB7Q/94G
	 xziCMbjRiR6z3cGSypA6bCzQ+a9gohJTTSk0CJqj3VpSzFyhsZ7skST6oGKUMvXCPh
	 sskZ094Gl0GVuSWteWEVHy1AQo6uXaDgEGLG8FDOHkXz3QCa92F3JRnhhtnnzDqd2g
	 Cpp+gizZmxoCvzquN4vDq984xnvp8zkeDqbmzH/UXzJbbsINYRy1ht3sWIY3XCuH0j
	 +oP//OwRJRiCKREJxPo7M2JimuTNv+ePTcq0Yj4TXsqUsFs2tNwTta2gu/pneTpbCu
	 BhJFKDcswNDvA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] kconfig: gconf: replace GdkColor with GdkRGBA
Date: Mon, 30 Jun 2025 03:43:33 +0900
Message-ID: <20250629184554.407497-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
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

(no changes since v1)

 scripts/kconfig/gconf.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index a751ab6a98f0..2a4481b4b523 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -128,7 +128,7 @@ static void set_node(GtkTreeStore *tree, GtkTreeIter *node, struct menu *menu)
 	const gchar *_mod = "";
 	const gchar *_yes = "";
 	const gchar *value = "";
-	GdkColor color;
+	GdkRGBA color;
 	gboolean editable = FALSE;
 	gboolean btnvis = FALSE;
 
@@ -138,7 +138,7 @@ static void set_node(GtkTreeStore *tree, GtkTreeIter *node, struct menu *menu)
 				 menu->type == M_COMMENT ? "***" : "",
 				 sym && !sym_has_value(sym) ? "(NEW)" : "");
 
-	gdk_color_parse(menu_is_visible(menu) ? "Black" : "DarkGray", &color);
+	gdk_rgba_parse(&color, menu_is_visible(menu) ? "Black" : "DarkGray");
 
 	if (!sym)
 		goto set;
@@ -1172,7 +1172,7 @@ static void init_left_tree(void)
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_POINTER, GDK_TYPE_COLOR,
+				   G_TYPE_POINTER, GDK_TYPE_RGBA,
 				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
@@ -1203,7 +1203,7 @@ static void init_left_tree(void)
 	gtk_tree_view_column_set_attributes(GTK_TREE_VIEW_COLUMN(column),
 					    renderer,
 					    "text", COL_OPTION,
-					    "foreground-gdk",
+					    "foreground-rgba",
 					    COL_COLOR, NULL);
 
 	sel = gtk_tree_view_get_selection(view);
@@ -1223,7 +1223,7 @@ static void init_right_tree(void)
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
 				   G_TYPE_STRING, G_TYPE_STRING,
-				   G_TYPE_POINTER, GDK_TYPE_COLOR,
+				   G_TYPE_POINTER, GDK_TYPE_RGBA,
 				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
@@ -1261,32 +1261,32 @@ static void init_right_tree(void)
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
@@ -1294,7 +1294,7 @@ static void init_right_tree(void)
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


