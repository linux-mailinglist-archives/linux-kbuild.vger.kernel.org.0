Return-Path: <linux-kbuild+bounces-7680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DBBAE6ABC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3DC6A4428
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891122FCE13;
	Tue, 24 Jun 2025 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPQ3uqQ4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AF42DA769;
	Tue, 24 Jun 2025 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777746; cv=none; b=p77S/CitLADmX0sINBWY6bXMZFEuGeAa4fI/Qcirgxz8+ObbUkIlYWxlN3nrmImcG27eLYn3zLu6zzcIDzXxSnCnJtx5mZNyEYcYgYbqjcj7pOeHzEMUUP8pf1ME3Bv7WxWdZ2cZ81kgQ7b2Z7udQJgKNfc24vGEuaYhPT8xnFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777746; c=relaxed/simple;
	bh=GOqKXHTBfnBKMo9irpdgKN4z3s14Jq1iPyT5J8xtIFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JlBTOvPwtWJnQTCLYg6q4zPTB/YlwKuYFrWpkha/mmVDsQmjpZk6LswHoI1sh+YoYfgmZ0XPkDjy1dkiDHPnMrKs3H0QgWnQMPZSxZMunH2X6l+96zO7x87Zw7g4nPjpyLvHOnsfVWvvALv6tOArsNWkHQaNuAbZOnIm/vq9OQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPQ3uqQ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14E1C4CEE3;
	Tue, 24 Jun 2025 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777746;
	bh=GOqKXHTBfnBKMo9irpdgKN4z3s14Jq1iPyT5J8xtIFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vPQ3uqQ4s15fk/FULvJkLsguQHaMBVWIA8zLT0VqyKKR1wi9tT7zqkxf0C2JZJ0xe
	 X6SKQuLnu4odqlmDsYhDQsqSKz2HkW3AXD4Jqfzdi8kSt9+bRQVGopg5Sx9j3XkZyW
	 v84yh2PnaK8raE4YQoK/StJzFrBUbBeKh6JMvBBoSDNpNkw8zyQdICWIfkEznQonLS
	 KpO4q0t7sALDt4M59XhYerZHGQ3IIRfgxFFDhv0ipgcs2eFKKDYMLgZq/h0BssOJiH
	 PW4uG/9jdaRnuP/MjEbDEBUHTKPjKPm2l10IoZ1fiuDMv8+wSV778YL0/Z27Ij1aqi
	 YkrPLpTGr9V6Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 53/66] kconfig: gconf: use size_allocate event handler
Date: Wed, 25 Jun 2025 00:05:41 +0900
Message-ID: <20250624150645.1107002-54-masahiroy@kernel.org>
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

The size_request event is not available in GTK 3. Use the size_allocate
event handler instead.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index b86d54c222e3..6487d6a0dd9d 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -660,21 +660,13 @@ static void on_window1_destroy(GtkObject *object, gpointer user_data)
 	gtk_main_quit();
 }
 
-static void on_window1_size_request(GtkWidget *widget,
-				    GtkRequisition *requisition,
+static void on_window_size_allocate(GtkWidget *widget,
+				    GtkAllocation *allocation,
 				    gpointer user_data)
 {
-	static gint old_h;
-	gint w, h;
+	gint h;
 
-	if (widget->window == NULL)
-		gtk_window_get_default_size(GTK_WINDOW(main_wnd), &w, &h);
-	else
-		gdk_window_get_size(widget->window, &w, &h);
-
-	if (h == old_h)
-		return;
-	old_h = h;
+	h = allocation->height;
 
 	gtk_paned_set_position(GTK_PANED(vpaned), 2 * h / 3);
 }
@@ -1000,8 +992,8 @@ static void init_main_window(const gchar *glade_file)
 	main_wnd = glade_xml_get_widget(xml, "window1");
 	g_signal_connect(main_wnd, "destroy",
 			 G_CALLBACK(on_window1_destroy), NULL);
-	g_signal_connect(main_wnd, "size_request",
-			 G_CALLBACK(on_window1_size_request), NULL);
+	g_signal_connect(main_wnd, "size_allocate",
+			 G_CALLBACK(on_window_size_allocate), NULL);
 	g_signal_connect(main_wnd, "delete_event",
 			 G_CALLBACK(on_window1_delete_event), NULL);
 
-- 
2.43.0


