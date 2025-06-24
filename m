Return-Path: <linux-kbuild+bounces-7652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3637AAE6A56
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6334D5A2DE3
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BE92E3B18;
	Tue, 24 Jun 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRo5HgTw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3FC2E339E;
	Tue, 24 Jun 2025 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777687; cv=none; b=vGczkCAjZtvHP/A+XqpeJPi1h4k8ArpksCQe2cNS3ndDrjh2s/NCkkO+qsQES+maKv2tBvFDRIMjmiz9SOCks6jyKBHVWisGiQtToa/PXU1vrNCFv1cv7Y1wp7ggNv4Wu5vjrWWxFQzmQn25r/g/WQJ3mRnnwmrLAm9LOHI27ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777687; c=relaxed/simple;
	bh=bNtsGGjTyO9WQwrZ3YIZD66hIR2SF4mfZ+K5q+4ZGA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aMOQQqnSd98COO5lPzAJk2bxNg3FHGkHeHRBES1uSJCFUPb8+gAligc/2RTl5QvqhZaghJl+2YU9LC5+OblA4bq+PMfVJnIETsy5hZ71NEOCspenR7dpXOgp1ZfQHPatbssYL0x0//ASIiH1aXxznvReBsPsK75vq2t1fYCdMo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRo5HgTw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF707C4CEE3;
	Tue, 24 Jun 2025 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777687;
	bh=bNtsGGjTyO9WQwrZ3YIZD66hIR2SF4mfZ+K5q+4ZGA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oRo5HgTwvObh2V6UGb1kJwqCYnsD2uqG+zmG4J0GlcdtJGGlbd9SeeTvfVbR7VfOM
	 cO0oT0D31rNeEj23v6iQS4YjBbKZNKgruVfvjANiU3v4v8jxqxfJTsTCD1f+9DzRZj
	 wSzZbeKc7dain/uCJzPF1CpTHSnB6F5VYsdqkaSuwKaNGPnXCcuWFS+i+L74lWKYjr
	 /LF2sPzutmDmlLkfWFAgtmuEgvpb0Z+35dqfYkivPPI0MpDWXYrbUZRe6pu4aTGs+t
	 iaOgAaEaA4kzPW6C2qXbnOOO3mDII4/fzo0x//6fVJ1Dhk14Ffbph+0ATP7PttORpx
	 vqvhNhc/1yvwQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 25/66] kconfig: gconf: refactor view setting code
Date: Wed, 25 Jun 2025 00:05:13 +0900
Message-ID: <20250624150645.1107002-26-masahiroy@kernel.org>
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

Factor out common code for setting the view into a new function,
set_view_mode().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 74 +++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 36 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 9d06c050b270..b67ebff3f288 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -18,7 +18,7 @@
 #include <unistd.h>
 #include <time.h>
 
-enum {
+enum view_mode {
 	SINGLE_VIEW, SPLIT_VIEW, FULL_VIEW
 };
 
@@ -70,6 +70,39 @@ static void conf_changed(bool dirty)
 
 /* Utility Functions */
 
+static void set_view_mode(enum view_mode mode)
+{
+	view_mode = mode;
+
+	if (mode == SPLIT_VIEW) { // two panes
+		gint w;
+
+		gtk_widget_show(tree1_w);
+		gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, NULL);
+		gtk_paned_set_position(GTK_PANED(hpaned), w / 2);
+	} else {
+		gtk_widget_hide(tree1_w);
+		gtk_paned_set_position(GTK_PANED(hpaned), 0);
+	}
+
+	switch (mode) {
+	case SINGLE_VIEW:
+		current = &rootmenu;
+		display_tree_part();
+		break;
+	case SPLIT_VIEW:
+		gtk_tree_store_clear(tree2);
+		display_list();
+		break;
+	case FULL_VIEW:
+		gtk_tree_store_clear(tree2);
+		display_tree(&rootmenu);
+		break;
+	}
+
+	if (mode != SINGLE_VIEW)
+		gtk_widget_set_sensitive(back_btn, FALSE);
+}
 
 static void text_insert_help(struct menu *menu)
 {
@@ -435,35 +468,19 @@ void on_load_clicked(GtkButton * button, gpointer user_data)
 
 void on_single_clicked(GtkButton * button, gpointer user_data)
 {
-	view_mode = SINGLE_VIEW;
-	gtk_widget_hide(tree1_w);
-	current = &rootmenu;
-	display_tree_part();
+	set_view_mode(SINGLE_VIEW);
 }
 
 
 void on_split_clicked(GtkButton * button, gpointer user_data)
 {
-	gint w;
-	view_mode = SPLIT_VIEW;
-	gtk_widget_show(tree1_w);
-	gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, NULL);
-	gtk_paned_set_position(GTK_PANED(hpaned), w / 2);
-	gtk_tree_store_clear(tree2);
-	display_list();
-
-	/* Disable back btn, like in full mode. */
-	gtk_widget_set_sensitive(back_btn, FALSE);
+	set_view_mode(SPLIT_VIEW);
 }
 
 
 void on_full_clicked(GtkButton * button, gpointer user_data)
 {
-	view_mode = FULL_VIEW;
-	gtk_widget_hide(tree1_w);
-	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);
-	gtk_widget_set_sensitive(back_btn, FALSE);
+	set_view_mode(FULL_VIEW);
 }
 
 
@@ -1039,11 +1056,6 @@ static void _display_tree(struct menu *menu, GtkTreeIter *parent)
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW))*/
 
-		/* Change paned position if the view is not in 'split mode' */
-		if (view_mode == SINGLE_VIEW || view_mode == FULL_VIEW) {
-			gtk_paned_set_position(GTK_PANED(hpaned), 0);
-		}
-
 		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW))
@@ -1368,17 +1380,7 @@ int main(int ac, char *av[])
 
 	conf_read(NULL);
 
-	switch (view_mode) {
-	case SINGLE_VIEW:
-		display_tree_part();
-		break;
-	case SPLIT_VIEW:
-		display_list();
-		break;
-	case FULL_VIEW:
-		display_tree(&rootmenu);
-		break;
-	}
+	set_view_mode(view_mode);
 
 	gtk_main();
 
-- 
2.43.0


