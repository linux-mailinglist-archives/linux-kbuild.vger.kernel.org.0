Return-Path: <linux-kbuild+bounces-7658-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C7AE6A74
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 663DA161FBB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B098D2E7633;
	Tue, 24 Jun 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4hiBUzQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FDA2E7630;
	Tue, 24 Jun 2025 15:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777700; cv=none; b=cYT+qqOOh+hqn5UcvLaou9C3nrz0HlyolDEJ7iL8TUi/J0awI5YFcCGcv/FHVPFxxqrlvM1YJ32nAR0gXHDtasoPvIAKUMkNiPrKYD/Go/A1ozzXzc+NfOJYHRnBS8vXg/lYNb+wDlS56Uvqe1rXH7tGrkaMjFIy9qpIh0ljqQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777700; c=relaxed/simple;
	bh=ZrCNSsgWHi2+vLNO7PX9LEok4dDMNUdWFNqGBSA8SGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnOppXrEk9LdwjUNGOb37mNS6ly/MLrWv36CrbjLm3zI10ffjjA3XI4SUIwowofs5KN4A3Nevu3W79psFLw86UVlFLL2Ih+ZmFfdcZ5UxOspRXYrmDO433IHRww4jBBSdSTNHhSNyLgyE6cDZ4vKNlf53oL5AvP9ZKOcrrvNPY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4hiBUzQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3748BC4CEF0;
	Tue, 24 Jun 2025 15:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777700;
	bh=ZrCNSsgWHi2+vLNO7PX9LEok4dDMNUdWFNqGBSA8SGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c4hiBUzQ8jE3UbHoej+gXKRxjZMLQHwIRtRo35TCHVBl5t/gDCtu3K1t5GZyfaGLD
	 aR8aw45WT4opN96n+WY/QCw2pY465h8zsVWij42WZnDIbDw9ZLwviVEG6ArVmq8Bal
	 +cySVJ0hzlCA/G3wTyIl8h8/tIb9wNw7i4T3UwL4FBiT8g6PpwA0Yi9XERSY6RITg1
	 srUAREyBz++2RZqozVtn+ozYcO30Rk5RPS48RLyIIHtsrzowbUYR1CCY+FWDxr02Pa
	 sZ89CtFzfC8P3mHjYpv4M0i2X6hNOLjS3s9csMylpn2nXzZZNEf0qeX63agvj7Q4Uv
	 MIvk1n1cbvrLQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/66] kconfig: gconf: make key_press_event work in left pane too
Date: Wed, 25 Jun 2025 00:05:19 +0900
Message-ID: <20250624150645.1107002-32-masahiroy@kernel.org>
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

Currently, on_treeview2_key_press_event() returns early for the tree1
widget. We can make it work on the left pane as well by avoiding the
hardcoded use of model2.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 09537245213a..51d987c8ffaf 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -638,6 +638,7 @@ static gboolean on_treeview2_key_press_event(GtkWidget *widget,
 					     gpointer user_data)
 {
 	GtkTreeView *view = GTK_TREE_VIEW(widget);
+	GtkTreeModel *model = gtk_tree_view_get_model(view);
 	GtkTreePath *path;
 	GtkTreeIter iter;
 	struct menu *menu;
@@ -654,11 +655,9 @@ static gboolean on_treeview2_key_press_event(GtkWidget *widget,
 			gtk_tree_view_expand_row(view, path, FALSE);
 		return TRUE;
 	}
-	if (widget == tree1_w)
-		return FALSE;
 
-	gtk_tree_model_get_iter(model2, &iter, path);
-	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
+	gtk_tree_model_get_iter(model, &iter, path);
+	gtk_tree_model_get(model, &iter, COL_MENU, &menu, -1);
 
 	if (!strcasecmp(event->string, "n"))
 		col = COL_NO;
-- 
2.43.0


