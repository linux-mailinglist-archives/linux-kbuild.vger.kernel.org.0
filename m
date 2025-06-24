Return-Path: <linux-kbuild+bounces-7686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D11AE6ADF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C59034A0BB9
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6730C2FD890;
	Tue, 24 Jun 2025 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a64GKWm+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BE2FD885;
	Tue, 24 Jun 2025 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777759; cv=none; b=Mzbrvcoy8NDzIIgd9pfiEi4WUpkhMPPneyjVYh4GtgOVtpISNCF2mFv86DsAkJLeKf6ZV9yRwxYvT/mZ3AWPvKxlBjh5FzTmuNMOBKGAGH2mWCizxvNEXnErtJq8G/qjqCvRegooAzTmKlTqI7hBjdCrceuxHXrkRfClWjxZRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777759; c=relaxed/simple;
	bh=CLsXBajG+opi/I80fDlZNe/2hXwX6/6PVGc+PKsFKh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UI3tK1Wht7DY6fvYIepRAW0/EnLQjLCCnyBWvMRk/mXCseNlxhEfZwVOwZiAcxpu4dFcGGN5r94Rf7c1tn1csVtDaH+JkIHLNCh39mu6RPKYuxAHJkEbqP+1+pPLzZB92qVcFlZ3kuAFNWEHd41vQwFCGLR2WceQOtKwCUt0yPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a64GKWm+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57C8C4CEF0;
	Tue, 24 Jun 2025 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777758;
	bh=CLsXBajG+opi/I80fDlZNe/2hXwX6/6PVGc+PKsFKh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a64GKWm+EZ7WI+IifcR28ndqLvEWZR1ygan0zeDr/fvmtNbSkSIviux8b4ALGQXv7
	 CcKJwpNMwJRHmVLpd6KOQ1PvUwxQypBREfBgRdwUk9wyRgL1J4eewRocSjUN+gfKFT
	 38Zo2mOa+exq16+873T31g1qI+0tFOop1/8eBjpfM9cZT4LlFbIAq42oFAu/21WRQh
	 N3QZPZyh1FN4z3ZHCN2lyiBaf8iUFTt1Dm7uBUJPuF8VLXVduBmsFCaTKEmp08bQ1U
	 kXTfI75QA5HOJEB9JFMCFrx6CeOqF0rMgwr9f+ElajSmWVmVb/St5NJZ8LDHHS4umO
	 xIE2gxAJl2M9g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 59/66] kconfig: gconf: use gtk_check_menu_item_get_active() accessor
Date: Wed, 25 Jun 2025 00:05:47 +0900
Message-ID: <20250624150645.1107002-60-masahiroy@kernel.org>
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

GTK 3 removes many implementation details and struct members from its
public headers.

Use the gtk_check_menu_item_get_active() accessor.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/docs/reference/gtk/compiling.sgml#L85

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 32d1815b425e..c49401b4c9a1 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -493,7 +493,7 @@ static void on_show_name1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_name = GTK_CHECK_MENU_ITEM(menuitem)->active;
+	show_name = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
 	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_NAME);
 	if (col)
 		gtk_tree_view_column_set_visible(col, show_name);
@@ -503,7 +503,7 @@ static void on_show_range1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_range = GTK_CHECK_MENU_ITEM(menuitem)->active;
+	show_range = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
 	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_NO);
 	if (col)
 		gtk_tree_view_column_set_visible(col, show_range);
@@ -520,7 +520,7 @@ static void on_show_data1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
 
-	show_value = GTK_CHECK_MENU_ITEM(menuitem)->active;
+	show_value = gtk_check_menu_item_get_active(GTK_CHECK_MENU_ITEM(menuitem));
 	col = gtk_tree_view_get_column(GTK_TREE_VIEW(tree2_w), COL_VALUE);
 	if (col)
 		gtk_tree_view_column_set_visible(col, show_value);
-- 
2.43.0


