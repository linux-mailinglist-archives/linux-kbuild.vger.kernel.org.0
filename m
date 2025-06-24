Return-Path: <linux-kbuild+bounces-7659-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AFAE6A7E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43AA21C21105
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360972E7F17;
	Tue, 24 Jun 2025 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpAUJdzG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3E02E7F0D;
	Tue, 24 Jun 2025 15:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777703; cv=none; b=L48n33+PLM8rnQB9opTrLQGQFRFMm/EJIq+drZlcQeWapwXd6DpZTdU/G2SLnlJgHUehOTSzvkVbq6JOWFb4F8vbfn9hIa5NE+GMT9rS8dzIHTFPifTtK24HRJatebggXe861uDOMTgLcnTX5339sVI4w/wQQQYhN0kJ3j6yyGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777703; c=relaxed/simple;
	bh=i5+4zBmg+RQmdV80XXcA8B3KXOzZSn9pgDB47SILc2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrZD9+5UvL9aheil6dJp+rpKdPp8gNbOokerug+znik2gOQyBMPGor3ZLYVZhMUtcE6YeZYqWKcZfgg9BFMszO2onJygx34UzotVD6U7Y8J+8c/iLQ+/s39KpM/YASQghYloH4JVbzYr4o/NMatt3zAaAXnVtn6yhOLN/fBsAPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpAUJdzG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E01CC4CEE3;
	Tue, 24 Jun 2025 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777702;
	bh=i5+4zBmg+RQmdV80XXcA8B3KXOzZSn9pgDB47SILc2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PpAUJdzGVJF2VYsYQwfj2I3V2VzFVUiYYtih7PTqKRgqV3kHVTI/iaex5Hhdu1oPV
	 tHhru6fXbooiHwIwIroAjRuYseEHbT9+/E++Tsid+nujlIbQ6YKrP3odR9ChbIXoHE
	 9xwUkCLvqj3HOX5OGMvE91V6WBeySV0nnG2HGGnb+SJ9SdNGyI9oM1xKThJR563Eeo
	 y1h8VNFEsv/mH1JZaniTsKEy6F7f5bmjYOPmAIzSsnnav1w/vFX/3KaSvATbxa4SyL
	 OBlSa/yRdjGOijV9lXJ120bHxLmXY1Fk/tCF7NJKi3nkPtrx0zdsRqzHHyu5U7AwRF
	 WVY7l5nGg250w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 32/66] kconfig: gconf: avoid hardcoding model2 in on_treeview2_cursor_changed()
Date: Wed, 25 Jun 2025 00:05:20 +0900
Message-ID: <20250624150645.1107002-33-masahiroy@kernel.org>
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

The on_treeview2_cursor_changed() handler is connected to both the left
and right tree views, but it hardcodes model2 (the GtkTreeModel of the
right tree view). This is incorrect. Get the associated model from the
view.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 51d987c8ffaf..2d7a556eddaf 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -677,13 +677,14 @@ static gboolean on_treeview2_key_press_event(GtkWidget *widget,
 static void on_treeview2_cursor_changed(GtkTreeView *treeview,
 					gpointer user_data)
 {
+	GtkTreeModel *model = gtk_tree_view_get_model(treeview);
 	GtkTreeSelection *selection;
 	GtkTreeIter iter;
 	struct menu *menu;
 
 	selection = gtk_tree_view_get_selection(treeview);
-	if (gtk_tree_selection_get_selected(selection, &model2, &iter)) {
-		gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
+	if (gtk_tree_selection_get_selected(selection, &model, &iter)) {
+		gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 		text_insert_help(menu);
 	}
 }
-- 
2.43.0


