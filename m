Return-Path: <linux-kbuild+bounces-7663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 905CDAE6A8D
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A450E1C251B0
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1052EAB67;
	Tue, 24 Jun 2025 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgZh15Q2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BD82EA744;
	Tue, 24 Jun 2025 15:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777711; cv=none; b=ZfdBq4Vnq9mCcoa2DgfNoeKw/0MkjJIRyCGgc6PuybEy9NPQEpzpFOaflr8XuI7V2jG4H4iXNAO0QAHufETzNBguwKfjmq+zqaLwG1I1MFJ9SEst3Eq8gVrkqjWaUxNdCCxuHONgH91lUVee5fTqHyDuVRMY8IxBnU7Legyb9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777711; c=relaxed/simple;
	bh=m8Ej33GQzB/O0lVEDaPm6wBaX2XKl7jtMagUdTuAqt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPJFHGBJHNq6774Wy1ojLF9QIvWBiZBtkUJqpJV0vzYG4HdzGpvOABZCYLUwjbtBvUPLuVWTeiu5Bk6psJE0dHAP5ONr2Btkt88qQJATBMWSbPbIa2KGsKvDOI8oE683ttp3GDUyTcakc6TVhLmzo439aPPAXF7aDPtmH2d0hds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgZh15Q2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4159C4CEE3;
	Tue, 24 Jun 2025 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777710;
	bh=m8Ej33GQzB/O0lVEDaPm6wBaX2XKl7jtMagUdTuAqt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rgZh15Q2lHVz5aZKbGguxCW0n30I1j38k0eTJP0Zxr97SVoQHjmofPJSszyO1ujUU
	 eifuaVVYXEhJi9Ge+0+9oBdXFVmMT5yU8FxITicUXOB6ymAmf/neVCeU/yRSUjpgEp
	 aENXxvZEF44qYK/KIqIUWJABWtVXxB7Fgez+4HhzMwhsmd3AxJkTF4hL7+cTxeDavM
	 KMMT2HHQS2HyMCnHZQNqDPFAHiWXVZ45geiKmOv2v8Dsqwiw7czuBA3XJ4BRR9lJCi
	 nnPTNJexUm6qUVusngC5aq89HZAE5bviMNHigS6eV/euNPvqeU0XvC3adFfYBE4c3U
	 05TpIqE1FOZtQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 36/66] kconfig: gconf: use GtkFileChooser in on_load1_activate()
Date: Wed, 25 Jun 2025 00:05:24 +0900
Message-ID: <20250624150645.1107002-37-masahiroy@kernel.org>
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

 scripts/kconfig/gconf.c | 58 ++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 8c60b9f25eaa..f33f39d50f3d 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -157,38 +157,38 @@ static void text_insert_msg(const char *title, const char *message)
 
 /* Menu & Toolbar Callbacks */
 
-
-static void
-load_filename(GtkFileSelection * file_selector, gpointer user_data)
-{
-	const gchar *fn;
-
-	fn = gtk_file_selection_get_filename(GTK_FILE_SELECTION
-					     (user_data));
-
-	if (conf_read(fn))
-		text_insert_msg("Error", "Unable to load configuration !");
-	else
-		display_tree_part();
-}
-
 static void on_load1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
-	GtkWidget *fs;
+	GtkWidget *dialog;
+	GtkFileChooser *chooser;
+	gint res;
 
-	fs = gtk_file_selection_new("Load file...");
-	g_signal_connect(GTK_OBJECT(GTK_FILE_SELECTION(fs)->ok_button),
-			 "clicked",
-			 G_CALLBACK(load_filename), (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->ok_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	g_signal_connect_swapped(GTK_OBJECT
-				 (GTK_FILE_SELECTION(fs)->cancel_button),
-				 "clicked", G_CALLBACK(gtk_widget_destroy),
-				 (gpointer) fs);
-	gtk_widget_show(fs);
+	dialog = gtk_file_chooser_dialog_new("Load file...",
+					     GTK_WINDOW(user_data),
+					     GTK_FILE_CHOOSER_ACTION_OPEN,
+					     "_Cancel", GTK_RESPONSE_CANCEL,
+					     "_Open", GTK_RESPONSE_ACCEPT,
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
+		if (conf_read(filename))
+			text_insert_msg("Error",
+					"Unable to load configuration!");
+		else
+			display_tree_part();
+
+		g_free(filename);
+	}
+
+	gtk_widget_destroy(GTK_WIDGET(dialog));
 }
 
 static void on_save_activate(GtkMenuItem *menuitem, gpointer user_data)
-- 
2.43.0


