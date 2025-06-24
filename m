Return-Path: <linux-kbuild+bounces-7665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0117AE6A6B
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3A793BC1A6
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591BF2EBB8D;
	Tue, 24 Jun 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBVEsW3q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325832EB5DA;
	Tue, 24 Jun 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777715; cv=none; b=IdxzfbWGbRA7QZIVYjMRiEMaBtiklQ1J5NIU5/Im17dDTl5kBRq18uvrX2jDl4qxTZbE8jxaOwdnpkVEw0y/DvseWj3nEGVcrDeReARwQA5wSieBGuo/erpshS1MgH5SiSE2in/aJvOY9yE6Vs6UTb6ifjSW9RMQQYzOyEUEsHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777715; c=relaxed/simple;
	bh=6BxQlve/9eKgcuDNXBD1gciAEQ20k95qOSD/V5qVJ1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pn32UJDzGbDye0NYxJgHe+kWR6ZWSDWmC+J/TG+VNmgmBATS7LaIACUQjcQYFQbqNR5hUB4/d2JR2dLLPQXI7S7/0bVNdxd0WXEHomy5zZ97BbdR5ftCOz7Syy0goKLVRmVzJc0qd6QrpPlF710U9/2bmIcFAHmBr0AQkTFOU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oBVEsW3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB29C4CEE3;
	Tue, 24 Jun 2025 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777715;
	bh=6BxQlve/9eKgcuDNXBD1gciAEQ20k95qOSD/V5qVJ1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oBVEsW3qwBouhCyduKHLDfb8Ez/OPfqljP/E3UTxdkQmt9nAVrUzQgjL02IkOdSBB
	 7EoXoJjAFgRdkU0PBFqWdvHlhOFi9+YhSVQuxUqYm/6xCGigI3HrYE8PoZQPK6Lf2C
	 HGd/hWBhPEEivG1v47+ue6pVp9NZskrJANv75Tp8ydws2CS4i9VMG6fSaO7pMhO6xj
	 JRuBBpdPjnxMzrqTSoDLj9pZoDYAdGPEpzxEWKNYrzZ1hiePRekcy0+jMhomvnY7Sj
	 YOpovMddwd3Fzdvl8nOS3qVe1LUaReaS86z9G6H/6iyxoleY9Pe/hn2+tLo8hxj40h
	 4KM0z2x/BSUcQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 38/66] kconfig: gconf: use GdkPixbuf in replace_button_icon()
Date: Wed, 25 Jun 2025 00:05:26 +0900
Message-ID: <20250624150645.1107002-39-masahiroy@kernel.org>
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

gdk_pixmap_create_from_xpm_d has been deprecated since version 2.22.
Use a GdkPixbuf instead. You can use gdk_pixbuf_new_from_xpm_data() to
create it. [1]

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/gdk/gdkpixmap.c#L742

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index b019711142c3..30d8fdb886c0 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1102,17 +1102,16 @@ static void fixup_rootmenu(struct menu *menu)
 static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
 				GtkStyle *style, gchar *btn_name, gchar **xpm)
 {
-	GdkPixmap *pixmap;
-	GdkBitmap *mask;
-	GtkToolButton *button;
+	GdkPixbuf *pixbuf;
 	GtkWidget *image;
+	GtkToolButton *button;
 
-	pixmap = gdk_pixmap_create_from_xpm_d(window, &mask,
-					      &style->bg[GTK_STATE_NORMAL],
-					      xpm);
+	pixbuf = gdk_pixbuf_new_from_xpm_data((const char **)xpm);
+	image = gtk_image_new_from_pixbuf(pixbuf);
+	g_object_unref(pixbuf);
 
 	button = GTK_TOOL_BUTTON(glade_xml_get_widget(xml, btn_name));
-	image = gtk_image_new_from_pixmap(pixmap, mask);
+
 	gtk_widget_show(image);
 	gtk_tool_button_set_icon_widget(button, image);
 }
-- 
2.43.0


