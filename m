Return-Path: <linux-kbuild+bounces-7672-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C12E7AE6AB8
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E97E1C40B29
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C602F1986;
	Tue, 24 Jun 2025 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vwkzkx2B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D072F0C65;
	Tue, 24 Jun 2025 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777729; cv=none; b=k9+oEBtsUal2Mnzyuclfn+Glr33Ha8d7pxGrFRr9uO9xFqoM5CU9hAY2Q2joVAo2iOxh7XDPfCMyK46RrxVtvEzl0189ZqLNuqUbrhjvb5Rom6Bn8TDtuCPrgrZZAn2qpRNwX3X9Xk8nbaFubJSYxxjthiFzdd+IZnxak2LWQ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777729; c=relaxed/simple;
	bh=CnAPOpB3/I8zIlFlWpKQGmku5vpQhVOoWIqBic6genM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXjcRPcKyKc/5dZjV3Oxg8tuGkbUIX8c3NN25OT1sa4isFhH14/9Adf1go3jkuMAwvnsye3bgSaJp5NSZhXkxQOClSaTIZBhiqjyzhK07K6MuLXrPnwth19eh8RS23s5eMIzAIAIle9JD0K35GKgfT3Kq1ulfjuu72q5DH5oobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vwkzkx2B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4231BC4CEEE;
	Tue, 24 Jun 2025 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777729;
	bh=CnAPOpB3/I8zIlFlWpKQGmku5vpQhVOoWIqBic6genM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vwkzkx2Bv81YquZ719ycVEhUSsPJGTnSSC6XhejahSH1QvSvpFwsz7AQwOA/jrtH4
	 8o2dsEgtNWjBLHdlM2sQ7St4eWAkc+CK5gnCVyA39f+qhfv8dOcWusCmglDXOwU3/5
	 31VVrw4FRKbBs0Iv4vBfoLJb00baxDR4ue+eShyw5p6A0CVDGx/0i3XCXg+J1/PSCd
	 0PCawmJkiKGG4vMr3OPp+70dNjB4xfkP8U8BBCMeI9RcquXrZ5ukNqNzplAaINIW6g
	 Mi7nbjncnwE8wzQttGUelgqvYfjQkAQ48XJCA5WhHVpBm9RR9SLYe62u7l7nIjmZAp
	 yzZGVL5jLR0IQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 45/66] kconfig: gconf: remove global 'model1' and 'model2' variables
Date: Wed, 25 Jun 2025 00:05:33 +0900
Message-ID: <20250624150645.1107002-46-masahiroy@kernel.org>
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

These variables are unnecessary because the current model can be
retrieved using gtk_tree_view_get_model().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index a0cc7cb98670..32cf6ae0e5f2 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -44,7 +44,6 @@ static GtkWidget *save_menu_item;
 static GtkTextTag *tag1, *tag2;
 
 static GtkTreeStore *tree1, *tree2;
-static GtkTreeModel *model1, *model2;
 
 static struct menu *browsed; // browsed menu for SINGLE/SPLIT view
 static struct menu *selected; // selected entry
@@ -1257,7 +1256,6 @@ static void init_tree_model(void)
 					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 					  G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 					  G_TYPE_BOOLEAN);
-	model2 = GTK_TREE_MODEL(tree2);
 
 	tree1 = gtk_tree_store_new(COL_NUMBER,
 				   G_TYPE_STRING, G_TYPE_STRING,
@@ -1268,7 +1266,6 @@ static void init_tree_model(void)
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN, G_TYPE_BOOLEAN,
 				   G_TYPE_BOOLEAN);
-	model1 = GTK_TREE_MODEL(tree1);
 }
 
 static void init_left_tree(void)
@@ -1279,7 +1276,7 @@ static void init_left_tree(void)
 	GtkTreeViewColumn *column;
 	GtkTreeModel *filter;
 
-	filter = gtk_tree_model_filter_new(model1, NULL);
+	filter = gtk_tree_model_filter_new(GTK_TREE_MODEL(tree1), NULL);
 
 	gtk_tree_model_filter_set_visible_func(GTK_TREE_MODEL_FILTER(filter),
 					       visible_func, NULL, NULL);
@@ -1320,7 +1317,7 @@ static void init_right_tree(void)
 	GtkTreeModel *filter;
 	gint i;
 
-	filter = gtk_tree_model_filter_new(model2, NULL);
+	filter = gtk_tree_model_filter_new(GTK_TREE_MODEL(tree2), NULL);
 
 	gtk_tree_model_filter_set_visible_func(GTK_TREE_MODEL_FILTER(filter),
 					       visible_func, NULL, NULL);
-- 
2.43.0


