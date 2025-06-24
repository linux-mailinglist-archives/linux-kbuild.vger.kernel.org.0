Return-Path: <linux-kbuild+bounces-7673-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345A2AE6A8E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2CA73AE117
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C90F2F2C4D;
	Tue, 24 Jun 2025 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkHUt0BO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272322F273A;
	Tue, 24 Jun 2025 15:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777732; cv=none; b=j5s4o/keDybFEIi9l2W21tqxv+1rn1/CSUd4F5W+J4aMflELx7ekm8FI+aH7+6Ltik7qotmyeKlxT0vh2Mi7n48SU9PgbF/9UCHH6u1Y+HmhPot2EZsJE309g1kOfsAqkiAHRGlZE+cLpnVB/zobj2PujE6L8LTKgVWIajr6ZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777732; c=relaxed/simple;
	bh=TYExhak6MbqHe07uVTZCXrE91anp6T9Nx3wR/oydH6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXelHb/04l2/jKgbZErd/eGfZmPdQE9hl3h4LCS6tuza/ZDesb5gj+LXZfAw1TP9cN70f9/Wx8w4IMqcdxYK+0L8oesh+1t9NSEBoW+JjmUJuTPTbkNAKLPJhMySrin1xxCl08Q2kggmOky0nojlqTHDk20UTbL/aSGucKgRGIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkHUt0BO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A184C4CEF3;
	Tue, 24 Jun 2025 15:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777731;
	bh=TYExhak6MbqHe07uVTZCXrE91anp6T9Nx3wR/oydH6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gkHUt0BOl4kdJWPJuX+N6iCKkN0crmgOsB9Pv9Z/Ja0FmiMmpW33R30frxbPGDNuE
	 P9y3zNltD/wmbnVKljFtu+P4AuO3Owpy+EbN1M8OvhDI8J8ZKJKZlsTX9Drz+iOvHM
	 hZaLJaJuCtFeU7psc5Ljawff1/CONzAexfB3th2NAFxgq2/ME17zJO6UH92Gl+qOeC
	 /S1QXg/HeSM/oFEWTM7e7p4Z/GfZ5+i0YWQe2gtUA1eOck+Th6Gw7SKDgvT+RqV+Wu
	 2Mhsj/ats5pVKzRurtp1ym+gadW9CJ94UUWhGVZCN7NO2GWIkKFIVasw/YS9llTfFj
	 dAM0BRuq2shfA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 46/66] kconfig: gconf: remove init_tree_model()
Date: Wed, 25 Jun 2025 00:05:34 +0900
Message-ID: <20250624150645.1107002-47-masahiroy@kernel.org>
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

Move the relevant code into init_left_tree() or init_right_tree().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 32cf6ae0e5f2..0977d906bea6 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1245,17 +1245,13 @@ static gboolean visible_func(GtkTreeModel *model, GtkTreeIter  *iter,
 		(opt_mode == OPT_PROMPT && menu_has_prompt(menu));
 }
 
-static void init_tree_model(void)
+static void init_left_tree(void)
 {
-	tree2 = gtk_tree_store_new(COL_NUMBER,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_STRING, G_TYPE_STRING,
-					  G_TYPE_POINTER, GDK_TYPE_COLOR,
-					  G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
-					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
-					  G_TYPE_BOOLEAN);
+	GtkTreeView *view = GTK_TREE_VIEW(tree1_w);
+	GtkCellRenderer *renderer;
+	GtkTreeSelection *sel;
+	GtkTreeViewColumn *column;
+	GtkTreeModel *filter;
 
 	tree1 = gtk_tree_store_new(COL_NUMBER,
 				   G_TYPE_STRING, G_TYPE_STRING,
@@ -1266,15 +1262,6 @@ static void init_tree_model(void)
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN);
-}
-
-static void init_left_tree(void)
-{
-	GtkTreeView *view = GTK_TREE_VIEW(tree1_w);
-	GtkCellRenderer *renderer;
-	GtkTreeSelection *sel;
-	GtkTreeViewColumn *column;
-	GtkTreeModel *filter;
 
 	filter = gtk_tree_model_filter_new(GTK_TREE_MODEL(tree1), NULL);
 
@@ -1317,6 +1304,16 @@ static void init_right_tree(void)
 	GtkTreeModel *filter;
 	gint i;
 
+	tree2 = gtk_tree_store_new(COL_NUMBER,
+				   G_TYPE_STRING, G_TYPE_STRING,
+				   G_TYPE_STRING, G_TYPE_STRING,
+				   G_TYPE_STRING, G_TYPE_STRING,
+				   G_TYPE_POINTER, GDK_TYPE_COLOR,
+				   G_TYPE_BOOLEAN, GDK_TYPE_PIXBUF,
+				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
+				   G_TYPE_BOOLEAN);
+
 	filter = gtk_tree_model_filter_new(GTK_TREE_MODEL(tree2), NULL);
 
 	gtk_tree_model_filter_set_visible_func(GTK_TREE_MODEL_FILTER(filter),
@@ -1439,7 +1436,6 @@ int main(int ac, char *av[])
 
 	/* Load the interface and connect signals */
 	init_main_window(glade_file);
-	init_tree_model();
 	init_left_tree();
 	init_right_tree();
 
-- 
2.43.0


