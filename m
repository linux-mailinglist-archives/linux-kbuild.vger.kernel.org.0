Return-Path: <linux-kbuild+bounces-7687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0894CAE6AE7
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BBEE16E272
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5DF2FE330;
	Tue, 24 Jun 2025 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2t3PwPE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443952FE324;
	Tue, 24 Jun 2025 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777761; cv=none; b=WptLX7NMqCXaxnCWNLkHTF3AzFBKBMDXODJ+ESKiqR4gLsONDcotGIP6PH+RXnstarO51Zmbs9zq1jyfyZTAU/NF2phLJSwGLnqU8Rzr3/tbZN8rhY67X070YuUyHeujpblHNfUq0RkJBYZolFT0EHHEh/h9UHr9Ih6zlYiJqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777761; c=relaxed/simple;
	bh=cOPHkAez0y5Ph2BKZusGcnFqM2fdFg+vRgSVJJENzrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5MM0bVnPKNwNm1WLpLkMbSQ+lVPnIwouaO7CtHX2G8oM8e3esOYDvwunTkH9DRRtRWQTc6bg+euebCdKSebVQ5/MyOLywb5R74x+AQC6BJa5+oPwmCt0+hALZ7/s4I6puKiuxxELn3SkNw/5N2C54HlSK3Ro69j/MTNngBQ4rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2t3PwPE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99CEC4CEF1;
	Tue, 24 Jun 2025 15:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777760;
	bh=cOPHkAez0y5Ph2BKZusGcnFqM2fdFg+vRgSVJJENzrQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2t3PwPEJXbh0S2ppORdAMA4fDxmIoEBTcUmMBPSjtSlv+9PAx4F8c0N4C2o/Zhrq
	 YOqWA6xnTZFJJjnd2pYuyZ2lffEHyw2POQbkWi+MZiTZw2LzplNODdKSHN2Zauaslr
	 Y4hKsYl0RWKxYD/Bb2Opmzo7z0m58Dx8jQMoQfludAl6owR57VdKiVoOuUevtSJ/KO
	 LihxZ2YBAILAQ0sW2D+4+NiCKUl4sc3zw/PXMv73XpdjDvm/aPU+VXXNrzrQ0izeWo
	 2HvfO6Rky5LnVaHWhT9IiwA+3Ji9KK/yN9NhtcaBFla18Mur9dRQA5lqkqzdUqu02b
	 OdKrNdPAe+PMw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 60/66] kconfig: gconf: use gtk_dialog_get_content_area() accessor
Date: Wed, 25 Jun 2025 00:05:48 +0900
Message-ID: <20250624150645.1107002-61-masahiroy@kernel.org>
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

GTK 3 removes many implementation details and struct members from its
public headers.

Use the gtk_check_menu_item_get_active() accessor.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/2.24.33/docs/reference/gtk/compiling.sgml#L85

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index c49401b4c9a1..58da3f13c5a0 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -674,7 +674,7 @@ static void on_window_size_allocate(GtkWidget *widget,
 static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 					gpointer user_data)
 {
-	GtkWidget *dialog, *label;
+	GtkWidget *dialog, *label, *content_area;
 	gint result;
 	gint ret = FALSE;
 
@@ -696,7 +696,8 @@ static gboolean on_window1_delete_event(GtkWidget *widget, GdkEvent *event,
 					GTK_RESPONSE_CANCEL);
 
 	label = gtk_label_new("\nSave configuration ?\n");
-	gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), label);
+	content_area = gtk_dialog_get_content_area(GTK_DIALOG(dialog));
+	gtk_container_add(GTK_CONTAINER(content_area), label);
 	gtk_widget_show(label);
 
 	result = gtk_dialog_run(GTK_DIALOG(dialog));
-- 
2.43.0


