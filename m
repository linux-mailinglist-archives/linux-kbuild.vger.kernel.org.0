Return-Path: <linux-kbuild+bounces-7646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD0AE6A4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 095173B55F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFFA2E11DF;
	Tue, 24 Jun 2025 15:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MHlW76SX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E12E11DD;
	Tue, 24 Jun 2025 15:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777675; cv=none; b=D+G7fZGaSlNdqsx1orTJX9wN9BreRxarBSfuOrToPbTcJLhbbCQ0ElCAzpdb1bYM7dXB/oTCcIuF5gt8KqwZB0yqxJaP+tVVJs7fleuyADG1N736dtVclFuank/dwL5auPxO+NM1kBRPt/PGlrMjCKMQy3EMO8gTasgQSYzTPXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777675; c=relaxed/simple;
	bh=3473YJWmxzQg/dUOJyS/4LBxQjxctGC23u6bK6NKXGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+jZFA3ROXljFpT67lm+UGX9+xWz/phKClOzTm7n8HvVzu4HP3huXMbEP7NvIjrBOGKugSnHjoEr675T7KC7XOtvWeHlBvVk2qnbZ10htG9lIM1Rnto1juDOInfRph9nvCwtkeBG3/w6LuRIiOjzTA5MnPFrDNwQRbyOzi+EbY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MHlW76SX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F58C4CEE3;
	Tue, 24 Jun 2025 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777674;
	bh=3473YJWmxzQg/dUOJyS/4LBxQjxctGC23u6bK6NKXGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MHlW76SXDK8fVlUPen/sA9jaHLXwMuWzEcOC++EdIenBaTnE3RAxLY2vgDpz3bzwl
	 CMdSf8od4/jltqB0Il6MXazEhWYzTcTmaOS5VVqDKoWtJ7klTY4T2kisP1HnepSpE3
	 sW7aNz1lPmhjWlAJ/zmq4gO0Ar9/Eb7zLConnrf2sD1YbpG01iRNcQoq1n9h+SWmR6
	 s07q1Zo6jY5rKppKS8pKTDzSN+V/xS/BcSRv/Jb1WR9GuTmvTswos+/Ilr3nRkqyZa
	 KBwWUVa50Rw9MGSznevFybiOm4PbP/fpmOSmeD6XNR4yMzxaQt+QU/VgzMhFlnu6Md
	 hbPcf2yyb+6YQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/66] kconfig: gconf: remove unnecessary NULL checks for tree1 and tree2
Date: Wed, 25 Jun 2025 00:05:07 +0900
Message-ID: <20250624150645.1107002-20-masahiroy@kernel.org>
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

The tree1 and tree2 variables are initialized earlier in
init_tree_model(), so the NULL checks are redundant.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 432a467e3250..2ab000adcced 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -678,8 +678,7 @@ void on_split_clicked(GtkButton * button, gpointer user_data)
 	gtk_widget_show(tree1_w);
 	gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
 	gtk_paned_set_position(GTK_PANED(hpaned), w / 2);
-	if (tree2)
-		gtk_tree_store_clear(tree2);
+	gtk_tree_store_clear(tree2);
 	display_list();
 
 	/* Disable back btn, like in full mode. */
@@ -691,8 +690,7 @@ void on_full_clicked(GtkButton * button, gpointer user_data)
 {
 	view_mode = FULL_VIEW;
 	gtk_widget_hide(tree1_w);
-	if (tree2)
-		gtk_tree_store_clear(tree2);
+	gtk_tree_store_clear(tree2);
 	display_tree(&rootmenu);
 	gtk_widget_set_sensitive(back_btn, FALSE);
 }
@@ -1298,8 +1296,7 @@ static void display_tree(struct menu *menu)
 /* Display a part of the tree starting at current node (single/split view) */
 static void display_tree_part(void)
 {
-	if (tree2)
-		gtk_tree_store_clear(tree2);
+	gtk_tree_store_clear(tree2);
 	if (view_mode == SINGLE_VIEW)
 		display_tree(current);
 	else if (view_mode == SPLIT_VIEW)
@@ -1312,8 +1309,7 @@ static void display_tree_part(void)
 /* Display the list in the left frame (split view) */
 static void display_list(void)
 {
-	if (tree1)
-		gtk_tree_store_clear(tree1);
+	gtk_tree_store_clear(tree1);
 
 	tree = tree1;
 	display_tree(&rootmenu);
-- 
2.43.0


