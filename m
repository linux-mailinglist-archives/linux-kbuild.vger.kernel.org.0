Return-Path: <linux-kbuild+bounces-7654-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBBAE6A73
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61BF51895BE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047BC2E62C9;
	Tue, 24 Jun 2025 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2xo7EG9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12822E62C2;
	Tue, 24 Jun 2025 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777691; cv=none; b=SqQDJnCBtBgoGVgWmH1QH5E0qXXacrX8sV38jEcca7VgBr/lNdRK0OS35eDp6NjL0PXICCpRtevDx/LX4Lr9DEWBRZ87twEkiDimVKSRLbR5A1Iq/MzRyuteYTRbWvTyyanYWPF2w9gx/AeF/7Km73WTlyxxuBCqilqvpxu3tBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777691; c=relaxed/simple;
	bh=SzQMjrw+KMdNtlRzerQIdXvl+LKSRqlgY3ItrKPeIuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXsDBoopJjO8WFN5eOhrOtX7RopQke/gNZD0Ddb7P4aKHC1vXmbin3vq4sdWiU/AcWpjn8hjdUYMiXHpqnVNZaqIW2yc5aPKunI7VquV4bCT3KCAT9vTJHldMwlWdcb7xV8bOaPx59k+LxL1uKf/wudl++0z5OMS76B54gt4qrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2xo7EG9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6BBC4CEE3;
	Tue, 24 Jun 2025 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777691;
	bh=SzQMjrw+KMdNtlRzerQIdXvl+LKSRqlgY3ItrKPeIuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2xo7EG9kPqwhnqtlXrK7VYyPExM4FpNMw4768q4qeO8zB5Pe4INvHvTxPYbyO2jW
	 +2bpUM7DLPQCrFxefnN4qhhUI2IxKwTVanX8ZlPGBmN4pNRv+O88l1dtwJgQq7c3sT
	 /wdr6w1lPEgi/dmu5+QtS4sfrHmbopvA8O7J/1ZIycZ2/wSZpQSSc7Qaj+ZrUQSgqM
	 TD73Y+/cxTZvuhG0Rtvt9H6yyeoHxcE+la8q1AAm0VPbB26SeDCHKGAAuhQmxH23YF
	 MC0vZ9ktOzpgarKW/YFLKmqq63wgFtE8GFezQkGNufWzGUwSi2waHgaLVYLhZVvuGB
	 dNStEGdZVRDUA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 27/66] kconfig: gconf: move the main window event handlers below
Date: Wed, 25 Jun 2025 00:05:15 +0900
Message-ID: <20250624150645.1107002-28-masahiroy@kernel.org>
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

This allows removal of the forward delcaration of on_save_activate().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 164 +++++++++++++++++++---------------------
 1 file changed, 78 insertions(+), 86 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 67c5c965aaf8..530ad6aa42d0 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -155,84 +155,6 @@ static void text_insert_msg(const char *title, const char *message)
 					 NULL);
 }
 
-
-/* Main Windows Callbacks */
-
-void on_save_activate(GtkMenuItem * menuitem, gpointer user_data);
-gboolean on_window1_delete_event(GtkWidget * widget, GdkEvent * event,
-				 gpointer user_data)
-{
-	GtkWidget *dialog, *label;
-	gint result;
-	gint ret = FALSE;
-
-	if (!conf_get_changed())
-		return FALSE;
-
-	dialog = gtk_dialog_new_with_buttons("Warning !",
-					     GTK_WINDOW(main_wnd),
-					     (GtkDialogFlags)
-					     (GTK_DIALOG_MODAL |
-					      GTK_DIALOG_DESTROY_WITH_PARENT),
-					     GTK_STOCK_OK,
-					     GTK_RESPONSE_YES,
-					     GTK_STOCK_NO,
-					     GTK_RESPONSE_NO,
-					     GTK_STOCK_CANCEL,
-					     GTK_RESPONSE_CANCEL, NULL);
-	gtk_dialog_set_default_response(GTK_DIALOG(dialog),
-					GTK_RESPONSE_CANCEL);
-
-	label = gtk_label_new("\nSave configuration ?\n");
-	gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), label);
-	gtk_widget_show(label);
-
-	result = gtk_dialog_run(GTK_DIALOG(dialog));
-	switch (result) {
-	case GTK_RESPONSE_YES:
-		on_save_activate(NULL, NULL);
-		break;
-	case GTK_RESPONSE_NO:
-		break;
-	case GTK_RESPONSE_CANCEL:
-	case GTK_RESPONSE_DELETE_EVENT:
-	default:
-		ret = TRUE;
-		break;
-	}
-
-	gtk_widget_destroy(dialog);
-
-	return ret;
-}
-
-
-void on_window1_destroy(GtkObject * object, gpointer user_data)
-{
-	gtk_main_quit();
-}
-
-
-void
-on_window1_size_request(GtkWidget * widget,
-			GtkRequisition * requisition, gpointer user_data)
-{
-	static gint old_h;
-	gint w, h;
-
-	if (widget->window == NULL)
-		gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
-	else
-		gdk_window_get_size(widget->window, &w, &h);
-
-	if (h == old_h)
-		return;
-	old_h = h;
-
-	gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
-}
-
-
 /* Menu & Toolbar Callbacks */
 
 
@@ -311,14 +233,6 @@ void on_save_as1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	gtk_widget_show(fs);
 }
 
-
-void on_quit1_activate(GtkMenuItem * menuitem, gpointer user_data)
-{
-	if (!on_window1_delete_event(NULL, NULL, NULL))
-		gtk_widget_destroy(GTK_WIDGET(main_wnd));
-}
-
-
 void on_show_name1_activate(GtkMenuItem * menuitem, gpointer user_data)
 {
 	GtkTreeViewColumn *col;
@@ -501,6 +415,84 @@ void on_expand_clicked(GtkButton * button, gpointer user_data)
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
 }
 
+/* Main Windows Callbacks */
+
+void on_window1_destroy(GtkObject *object, gpointer user_data)
+{
+	gtk_main_quit();
+}
+
+void on_window1_size_request(GtkWidget *widget,
+				    GtkRequisition *requisition,
+				    gpointer user_data)
+{
+	static gint old_h;
+	gint w, h;
+
+	if (widget->window == NULL)
+		gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
+	else
+		gdk_window_get_size(widget->window, &w, &h);
+
+	if (h == old_h)
+		return;
+	old_h = h;
+
+	gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
+}
+
+gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
+					gpointer user_data)
+{
+	GtkWidget *dialog, *label;
+	gint result;
+	gint ret = FALSE;
+
+	if (!conf_get_changed())
+		return FALSE;
+
+	dialog = gtk_dialog_new_with_buttons("Warning !",
+					     GTK_WINDOW(main_wnd),
+					     (GtkDialogFlags)
+					     (GTK_DIALOG_MODAL |
+					      GTK_DIALOG_DESTROY_WITH_PARENT),
+					     GTK_STOCK_OK,
+					     GTK_RESPONSE_YES,
+					     GTK_STOCK_NO,
+					     GTK_RESPONSE_NO,
+					     GTK_STOCK_CANCEL,
+					     GTK_RESPONSE_CANCEL, NULL);
+	gtk_dialog_set_default_response(GTK_DIALOG(dialog),
+					GTK_RESPONSE_CANCEL);
+
+	label = gtk_label_new("\nSave configuration ?\n");
+	gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), label);
+	gtk_widget_show(label);
+
+	result = gtk_dialog_run(GTK_DIALOG(dialog));
+	switch (result) {
+	case GTK_RESPONSE_YES:
+		on_save_activate(NULL, NULL);
+		break;
+	case GTK_RESPONSE_NO:
+		break;
+	case GTK_RESPONSE_CANCEL:
+	case GTK_RESPONSE_DELETE_EVENT:
+	default:
+		ret = TRUE;
+		break;
+	}
+
+	gtk_widget_destroy(dialog);
+
+	return ret;
+}
+
+void on_quit1_activate(GtkMenuItem *menuitem, gpointer user_data)
+{
+	if (!on_window1_delete_event(NULL, NULL, NULL))
+		gtk_widget_destroy(GTK_WIDGET(main_wnd));
+}
 
 /* CTree Callbacks */
 
-- 
2.43.0


