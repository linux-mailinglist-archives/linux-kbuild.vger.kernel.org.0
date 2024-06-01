Return-Path: <linux-kbuild+bounces-1972-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F198D7180
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 20:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E314E1C20D10
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E887F15532D;
	Sat,  1 Jun 2024 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H28dpMds"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF698155327;
	Sat,  1 Jun 2024 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266054; cv=none; b=g6Z+N83wGDIk38IDf/6TbUsXFR6g7LXaCBR5xBvoR9uZmZlGKFdI8YHPU6z3/FE7Y0wc8HyOYE8aaC3Q4h2qEx2DZJWS1dytctm8PBcJSkxe5aDVzvWLGOcrsw1rDroElP4lPb0eSVKZRvB1i8r8pdshXsY5QE6XmIPXtt+8e+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266054; c=relaxed/simple;
	bh=mO0aels7OLVhPoOj+vZK1tWzWjD3YuYz/mu5G7G94go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oexVnuB/NXrGJzGzaS88hPQlJC1OlHGj85460r71veQQxMMs0pfNR3S5QJxKsuRVMrKslRCBex7tR4POxm0e+nMYB6CpsWg8oToyO3ptt0n+BQgjuAXXfsdMCyL8ZXmc3L8ZaeV7QoPPPiVaXhEFwEMwFYFIwp60y9t/kdvSUPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H28dpMds; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9D1C32789;
	Sat,  1 Jun 2024 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717266054;
	bh=mO0aels7OLVhPoOj+vZK1tWzWjD3YuYz/mu5G7G94go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H28dpMdsv+2tlK0TdruUkMCkE/pCswQJqGO+jUgzwyEdQXKUSeP94GzNr3YiW/QJr
	 zmGa918tH0FJjx4vseXK2V/1CLqD9+prDAoFCkSvWhbU+btq+CLjlZFv1Zw/xYA0gS
	 CuaE2WCT7FpcwMOWun7InmRo84qv+fjZqWiXcu0wPfCjDU/A+g/LOzlYRU86AZlwld
	 bj68tfU5X7Cb+OBjeHI3AQmyNBRieDIQ4S4MQv9ZURXI/X3BWsXfL+Vpo3LGiDDXy2
	 jamskemw/jhT1CfQa9Mc7+yCo+oSysn3sQmPFTE69Qqr/7ax/q4puerC0jgvAE3gGY
	 3F9qgc6kW5QFQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 5/6] kconfig: gconf: move conf_changed() definition up
Date: Sun,  2 Jun 2024 03:20:42 +0900
Message-Id: <20240601182043.876249-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240601182043.876249-1-masahiroy@kernel.org>
References: <20240601182043.876249-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define conf_changed() before its call site to remove the forward
declaration.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 3dc459d9840c..2bf74aee5eff 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -65,7 +65,6 @@ static void display_list(void);
 static void display_tree(struct menu *menu);
 static void display_tree_part(void);
 static void update_tree(struct menu *src, GtkTreeIter * dst);
-static void conf_changed(void);
 
 static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
 				GtkStyle *style, gchar *btn_name, gchar **xpm)
@@ -85,6 +84,13 @@ static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
 	gtk_tool_button_set_icon_widget(button, image);
 }
 
+static void conf_changed(void)
+{
+	bool changed = conf_get_changed();
+	gtk_widget_set_sensitive(save_btn, changed);
+	gtk_widget_set_sensitive(save_menu_item, changed);
+}
+
 /* Main Window Initialization */
 static void init_main_window(const gchar *glade_file)
 {
@@ -1445,10 +1451,3 @@ int main(int ac, char *av[])
 
 	return 0;
 }
-
-static void conf_changed(void)
-{
-	bool changed = conf_get_changed();
-	gtk_widget_set_sensitive(save_btn, changed);
-	gtk_widget_set_sensitive(save_menu_item, changed);
-}
-- 
2.40.1


