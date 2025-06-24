Return-Path: <linux-kbuild+bounces-7653-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA495AE6A72
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8609218925CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAE12E612D;
	Tue, 24 Jun 2025 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzAzBKbR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0372E612B;
	Tue, 24 Jun 2025 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777689; cv=none; b=L6s8O2/NREvarQ5B0bxlucF85tlK0xFqrf5H48OB6+b8B6ER1j6qdaFWK9UHcEtMwPZnOUwYUyHaET5UzrGUx36ljHYjI5qOvKIKtoNDXHFGRWQn3edBaZ8x5Tzvl0a2rS0+kPPlNWjkOfOEyTAY/6HzKEKG9n7E+pmEI5/D4RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777689; c=relaxed/simple;
	bh=i4o0MIiXrKnd2POyw1dzd5rPYrHxB+RC0SVAVUTDI5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgZNcQXXRUBlRsQlAxtuCk5YY/2RNkFdtZFRgFaU1ZssXtlnXol3uCW4k2/XY42wKOb4HWac9JF058t7BHi1j1eTBy1ewNElFp/B+/rExX1xRNNmaoIZQVoq8AZOnO4KJuojS2db3ZiTqnISd8DcBt7yxbCZawcsMvnS18lVFIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzAzBKbR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03469C4CEEE;
	Tue, 24 Jun 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777689;
	bh=i4o0MIiXrKnd2POyw1dzd5rPYrHxB+RC0SVAVUTDI5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzAzBKbRR7lxB0Fb3xeVFdrAE3QmwdbtHsnqB4cHYCvuQWWWCuTyHsQ6joWPWDpsy
	 SKOqjXfhEAiEStL9wMYidYNw03DG0+yoKV9kVF85BFQRnJ84jFYEC8Egf6aiGzxbcY
	 tdeLAFvmzjkIukC4q20Le/qnIi1O5OGEUB4+RhZA88HSk7wj2JUAkmX4tTrqlhXjaT
	 Js3OZPfCX0VNfq5lrt1th0oby4sRbkYFy1S0nScYUWtrYfDquJY23H9Ifw3qHXc6nI
	 3KPr7tC8mLQAVzfDurRJqmWecaboFWhAkQBv8fWaJ+LTzLNt5dGInj8p0JDhi0tF63
	 oRuCjweldSXkg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 26/66] kconfig: gconf: grey out button for current view
Date: Wed, 25 Jun 2025 00:05:14 +0900
Message-ID: <20250624150645.1107002-27-masahiroy@kernel.org>
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

This clarifies which view is currently selected.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index b67ebff3f288..67c5c965aaf8 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -38,8 +38,7 @@ static GtkWidget *tree2_w;	// right frame
 static GtkWidget *text_w;
 static GtkWidget *hpaned;
 static GtkWidget *vpaned;
-static GtkWidget *back_btn;
-static GtkWidget *save_btn;
+static GtkWidget *back_btn, *save_btn, *single_btn, *split_btn, *full_btn;
 static GtkWidget *save_menu_item;
 
 static GtkTextTag *tag1, *tag2;
@@ -85,18 +84,25 @@ static void set_view_mode(enum view_mode mode)
 		gtk_paned_set_position(GTK_PANED(hpaned), 0);
 	}
 
+	gtk_widget_set_sensitive(single_btn, TRUE);
+	gtk_widget_set_sensitive(split_btn, TRUE);
+	gtk_widget_set_sensitive(full_btn, TRUE);
+
 	switch (mode) {
 	case SINGLE_VIEW:
 		current = &rootmenu;
 		display_tree_part();
+		gtk_widget_set_sensitive(single_btn, FALSE);
 		break;
 	case SPLIT_VIEW:
 		gtk_tree_store_clear(tree2);
 		display_list();
+		gtk_widget_set_sensitive(split_btn, FALSE);
 		break;
 	case FULL_VIEW:
 		gtk_tree_store_clear(tree2);
 		display_tree(&rootmenu);
+		gtk_widget_set_sensitive(full_btn, FALSE);
 		break;
 	}
 
@@ -1167,10 +1173,15 @@ static void init_main_window(const gchar *glade_file)
 
 	style = gtk_widget_get_style(main_wnd);
 
+	single_btn = glade_xml_get_widget(xml, "button4");
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button4", (gchar **) xpm_single_view);
+
+	split_btn = glade_xml_get_widget(xml, "button5");
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button5", (gchar **) xpm_split_view);
+
+	full_btn = glade_xml_get_widget(xml, "button6");
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button6", (gchar **) xpm_tree_view);
 
-- 
2.43.0


