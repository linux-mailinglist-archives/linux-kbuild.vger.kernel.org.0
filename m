Return-Path: <linux-kbuild+bounces-7664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEB8AE6A84
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E268F4C72DC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7392D4B4F;
	Tue, 24 Jun 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRdhVVm5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CC52EA74B;
	Tue, 24 Jun 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777713; cv=none; b=ZoFfLdP6dUig/wjWEamlT+WLvok8XzsAl4XQrinvt8GybmRmx7IBmh5vwEEhKtv/lese4x0aQ1FbzQA1iLn4v2gvRflhynMmXrxHjRQZmJ6d4ZxgoqNjtsrzeLqs3wLd2LZSW08rntBRj3MCk+WCp8C67xSK3rZyeJD1wlbqNDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777713; c=relaxed/simple;
	bh=JOVIgeyXUscWiujQ8Da71WDqvgkxsjYjFJncsY2bfic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0I8Yo/znqqvSGlRQaUij87IKwmw669GmhcyqinkuOBR2D5QhhS+KsRk6RfC2b8wQgQhqNLUc1lPm9tzOHcGMM3NhWDSatRyYvu+HH9BHBtWUpi6fp3Yu/oAxvkrt3AZXvpCFtsKQEuLr5M5H2TZls4+4eTQwrR/DOiJ9av6v1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRdhVVm5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8A1C4CEE3;
	Tue, 24 Jun 2025 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777712;
	bh=JOVIgeyXUscWiujQ8Da71WDqvgkxsjYjFJncsY2bfic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iRdhVVm5Z1MGsfPnys8RTIq0M61TcVP++p3LwZwSnQ+Yf+5WxvumkerWMHDKBN0gm
	 mrekRrh3xp9t+hrzE0eGvI2Dbh6k+MCXUcHf7EsJc9fDivd0+suAKdUxk8HopthqtC
	 TTq8uZB8dZzOqsYJg05yFUKDj9/Dw/HJzsEiU0II8orOSqpbgEox4CiGKm7hq6Hsqr
	 biyUyUEXzP12cvLH5gSH3e4qaAocgSQPgv6JowRz7SAGtWW/zlTaXfjK8rAI5yTSvz
	 JeoFCmkDK/AqXA06WQRn0i9SNhV9XMKcETOzcLAbMIB4EdaTwyRMTa9va1LV00vITP
	 Ys1Y0DoMeMgag==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 37/66] kconfig: gconf: use GtkFileChooser in on_save_as1_activate()
Date: Wed, 25 Jun 2025 00:05:25 +0900
Message-ID: <20250624150645.1107002-38-masahiroy@kernel.org>
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

gtk_file_selection_new() is deprecated, and gtk_file_chooser_dialog_new()
should be used instead. [1]

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/docs/reference/gtk/tmpl/gtkfilesel.sgml?ref_type=tags#L156

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 56 ++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index f33f39d50f3d..b019711142c3 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -198,38 +198,36 @@ static void on_save_activate(GtkMenuItem *menuitem, gpointer user_data)
 	conf_write_autoconf(0);
 }
 
-
-static void
-store_filename(GtkFileSelection * file_selector, gpointer user_data)
-{
-	const gchar *fn;
-
-	fn = gtk_file_selection_get_filename(GTK_FILE_SELECTION
-					     (user_data));
-
-	if (conf_write(fn))
-		text_insert_msg("Error", "Unable to save configuration !");
-
-	gtk_widget_destroy(GTK_WIDGET(user_data));
-}
-
 static void on_save_as1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
-	GtkWidget *fs;
+	GtkWidget *dialog;
+	GtkFileChooser *chooser;
+	gint res;
 
-	fs = gtk_file_selection_new("Save file as...");
-	g_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(fs)->ok_button),
-			 "clicked",
-			 G_CALLBACK(store_filename), (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->ok_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->cancel_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	gtk_widget_show(fs);
+	dialog = gtk_file_chooser_dialog_new("Save file as...",
+					     GTK_WINDOW(user_data),
+					     GTK_FILE_CHOOSER_ACTION_SAVE,
+					     "_Cancel", GTK_RESPONSE_CANCEL,
+					     "_Save", GTK_RESPONSE_ACCEPT,
+					     NULL);
+
+	chooser = GTK_FILE_CHOOSER(dialog);
+	gtk_file_chooser_set_filename(chooser, conf_get_configname());
+
+	res = gtk_dialog_run(GTK_DIALOG(dialog));
+	if (res == GTK_RESPONSE_ACCEPT) {
+		char *filename;
+
+		filename = gtk_file_chooser_get_filename(chooser);
+
+		if (conf_write(filename))
+			text_insert_msg("Error",
+					"Unable to save configuration !");
+
+		g_free(filename);
+	}
+
+	gtk_widget_destroy(dialog);
 }
 
 static void on_show_name1_activate(GtkMenuItem *menuitem, gpointer user_data)
-- 
2.43.0


