Return-Path: <linux-kbuild+bounces-7661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AEEAE6A64
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 812193B4B05
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583512E92AC;
	Tue, 24 Jun 2025 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hETbJJer"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3200B2D542A;
	Tue, 24 Jun 2025 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777707; cv=none; b=fQr3KRo14lMR9C5mEH53G8YpBuvG+t7WCi9jv2NBSwijEuC/K2I8lUU+mLUzzRdckIxzJ4gl2zEzNvhrf7zidw4kvr4kDjwwIL1H5R7z/xDCgF/3KIudZaB+MC9J94oKxe/VxL6axlhEd5abLkmQDM4AEf2tUC4zqNgpFZOPWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777707; c=relaxed/simple;
	bh=UU9gPrvR7gUHvpGDoplY+ssUC3cjt97ALdclLMiZxIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLOP1ZmlHv4Z/40mOlo9AM+abqGt2Ic1jAAeG2GXs3/SzwYO9Zr8w1LmbOIv6x7lB6dS0NeanrqfkkR2tHJIMgTW3AptfDo2wJIlytC5/IdubMBDIug7bWJUFh57+adz4y22n+/16sD+LXOS7L9MydDRR92tuUwyp4AFl+WIn2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hETbJJer; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7012BC4CEEE;
	Tue, 24 Jun 2025 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777706;
	bh=UU9gPrvR7gUHvpGDoplY+ssUC3cjt97ALdclLMiZxIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hETbJJerXxFpL9MbCG7EqubH6NxwR4DYEcNh6Y3Ymu/0zZjbv5V5SDqjrGMjxTqI/
	 IgPwtvw/G4tpibeOL8rubCf8Pad6iNwMUDoYN57Ao6qdkiBQ+761XegLv9NQJuG16C
	 9oDBMiXLAagHakj+BHOeE1ZUm/PsUw2rs29EKiOLfrhcStgPmrP9HL1Jx7aTjjXFQK
	 bm/1adxyOHetz6HaXZv5p2elt20b31x4uMjD2rmg2BonK/e38wkK3EmHbYV0PAltxB
	 i2fK7vNjQcjiGv5Gmd9uh+9hwRG2jNVhxjenfEYPu9eRDd9e/RbVpTpiQP0dZZKCMc
	 a0NhbKyQ8VS0g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/66] kconfig: gconf: avoid hardcoding model* in on_treeview*_button_press_event()
Date: Wed, 25 Jun 2025 00:05:22 +0900
Message-ID: <20250624150645.1107002-35-masahiroy@kernel.org>
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

It is better not to hardcode model1 or model2 for consistency.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 66c58a15b717..6972acb4b396 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -590,6 +590,7 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 						gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
+	GtkTreeModel *model = gtk_tree_view_get_model(view);
 	GtkTreePath *path;
 	GtkTreeViewColumn *column;
 	GtkTreeIter iter;
@@ -602,9 +603,9 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 	if (path == NULL)
 		return FALSE;
 
-	if (!gtk_tree_model_get_iter(model2, &iter, path))
+	if (!gtk_tree_model_get_iter(model, &iter, path))
 		return FALSE;
-	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
+	gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 
 	col = column2index(column);
 	if (event->type == GDK_2BUTTON_PRESS) {
@@ -698,6 +699,7 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 						gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
+	GtkTreeModel *model = gtk_tree_view_get_model(view);
 	GtkTreePath *path;
 	GtkTreeIter iter;
 	struct menu *menu;
@@ -708,8 +710,8 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 	if (path == NULL)
 		return FALSE;
 
-	gtk_tree_model_get_iter(model1, &iter, path);
-	gtk_tree_model_get(model1, &iter, COL_MENU, &menu, -1);
+	gtk_tree_model_get_iter(model, &iter, path);
+	gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 
 	if (event->type == GDK_2BUTTON_PRESS) {
 		toggle_sym_value(menu);
-- 
2.43.0


