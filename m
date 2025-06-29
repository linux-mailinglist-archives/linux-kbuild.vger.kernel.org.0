Return-Path: <linux-kbuild+bounces-7737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F205DAECFA3
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0876F1893187
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3E523AB8F;
	Sun, 29 Jun 2025 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMheCPcj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360C23AB87;
	Sun, 29 Jun 2025 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222761; cv=none; b=LeE+DYnvQb0UvL7dvJtZUc55A6F3laskigdo/EiIZUxqs3hdw9SnzKU6edDn8blKfrv0/d26p4ia2KpkEt+ODgF0GnVdOsnI6OnXgZJVYuW2SUjhm5Yfb3na6hX6IctE8Laipbhanvl0hVMs+P3qDXxHvdNgKHBak78sBsMofHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222761; c=relaxed/simple;
	bh=Jg24bE5ko6KBIoUhz455cbr/+I0a8Ft1cMfIhIylQdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWDe2WZEw/c1XUENsk6qYgwU7QTe/+kE3rQ+cwH0d8cyqotiuRj87ajssX6NHbPetzZebVrCv9sl5/xfWBbeXk1sshGtBUgjeV+bcS5UmiVQVLAv7SEi35L3iN7AyCqYsg6NtF9I9njUo2HewiD8Llg8tNH9kIyNkj1F3sdMFBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMheCPcj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89708C4CEF1;
	Sun, 29 Jun 2025 18:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222761;
	bh=Jg24bE5ko6KBIoUhz455cbr/+I0a8Ft1cMfIhIylQdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMheCPcj2a39tFCrBC1nIgjM11OOC+dAOZt95AS6hFJ5DNMT6x6wPxSd1ECLs6pDH
	 BUK7fLDsBxi4Vf/WJo2iGeUcm+iXV6VRcs2b6vy8RT6jiUATHinijb2W5IwFc4lLGd
	 oYQYmaIeJJEYuO4twch3Rj6ncov311Ew5SJfKGXZgr4kgcuDr7+cR7tX1oKYVOal8D
	 MPqjDPsZDepV/DkzVtR9jd52/FXNmX4174nqHC0XPHcjqFgNVukftmIKId/TjVTx7W
	 0TI+PKrxEDRoZxvRdT7LGqqkZzjQKbD2nEvm9q4VnLSyIEuq1FB/ef9c/UzokW7XHq
	 3Li5YVwfcW9Vw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] kconfig: gconf: use configure-event handler to adjust pane separator
Date: Mon, 30 Jun 2025 03:43:28 +0900
Message-ID: <20250629184554.407497-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size_request event handler is currently used to adjust the position
of the horizontal separator in the right pane.

However, the size_request signal is not available in GTK 3. Use the
configure-event signal instead.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Use the "configure-event" instead of "size-allocate" signal.
    This fixes the problem where we cannot move the horizontal
    separator in the right pane.

 scripts/kconfig/gconf.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 22badd2f710e..8b19298eef61 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -604,23 +604,12 @@ static void on_window1_destroy(GtkObject *object, gpointer user_data)
 	gtk_main_quit();
 }
 
-static void on_window1_size_request(GtkWidget *widget,
-				    GtkRequisition *requisition,
-				    gpointer user_data)
+static gboolean on_window1_configure(GtkWidget *self,
+				     GdkEventConfigure *event,
+				     gpointer user_data)
 {
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
+	gtk_paned_set_position(GTK_PANED(vpaned), 2 * event->height / 3);
+	return FALSE;
 }
 
 static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
@@ -1021,8 +1010,8 @@ static void init_main_window(const gchar *glade_file)
 	main_wnd = glade_xml_get_widget(xml, "window1");
 	g_signal_connect(main_wnd, "destroy",
 			 G_CALLBACK(on_window1_destroy), NULL);
-	g_signal_connect(main_wnd, "size_request",
-			 G_CALLBACK(on_window1_size_request), NULL);
+	g_signal_connect(main_wnd, "configure-event",
+			 G_CALLBACK(on_window1_configure), NULL);
 	g_signal_connect(main_wnd, "delete_event",
 			 G_CALLBACK(on_window1_delete_event), NULL);
 
-- 
2.43.0


