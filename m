Return-Path: <linux-kbuild+bounces-10090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A5ECBB01C
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 14:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84BCD30DD3A7
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 13:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0BE2FF673;
	Sat, 13 Dec 2025 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPs6NCx1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC7E3090FF
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765632950; cv=none; b=VbSQyUqSVbjX3BFvRDXTXwNakyXbt4EnUGVuYjdV7WEjIL2O7ibqQFpJgh9+DC0OkANZHG12/4uk9q3cnFqtZPhOlHZ27WQwFJ+bJ6E9wGQm9KJa2u9Nd/wXzhTR7Bt1wH/0uZF8gZp25SLd+XKiGcH3+EAeeDgX8/LrgFOhF+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765632950; c=relaxed/simple;
	bh=XFdDwzDNuA8jLfiiWJWX4pbDDWt8NDdbqayIMKzaLIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z2nvbH/oYVPX2r/23n/sClZMIUxnUXffxa1nFfFhqZXYlZSmx1wZOUtO9sIrL7NxNWJc7iETyLY6D5sKLZzbBhTJaDu4Vipla3o4Z1azt4nnDXHW5k9UpIlKG4ldeV1AGqnYGO5sMt1IGqUQpWVRzkb+KJBCkmaKAueza3XeLfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPs6NCx1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso16392825e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 05:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765632945; x=1766237745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pI9Zi/snYIqYZ/EulGtnuQrgppFJapFW5FkTsK6jLfU=;
        b=GPs6NCx12CZ6tuVL++MHwdL6xnoCvwWZjOdtvRMjl3OZbH9vtlMHUvTymtzhFHrDQD
         5h3wNGoQUMbcCS6lb9Q0dGvgraye70GQuuMFW7Cv23FB77GoHn9QyyfVyWmn5CSLqSJy
         DSot1Gl/NDnfXS7UVyWMrJIL+LdMo1wBQwiSpaf56hM/l9uNVfB9fSzUJw2aAB/afBFT
         q7JVn11FzO/IghliEf3FtELRW8Ctphjfv2E/nWd+58+q6Ds38u0Tne8981/MnO+W85xS
         VIMF9VXtduFv36BAqKqXqVZm27IB4x7nABlIBWk+FLQKes3FT1oHtpH792F5FHsFz402
         hfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765632945; x=1766237745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pI9Zi/snYIqYZ/EulGtnuQrgppFJapFW5FkTsK6jLfU=;
        b=pR4SWOB6//eFVjwHojx3gOqxifdOD/vOimNE1lkUwy/V0K4bTdRQcl7TX6Sp6oeMKJ
         Oj7VRT/FQG2F5UjBdGJpkNFzKgThpIkqnMnzdHLrp5twyhM8j5iZVoSv+sI4fx/WOn8m
         q4bxqht6tdAHBiu30Tft0Wbf+6hLcvwePkenS1d2zL1Y9cIAo8QROw3lel9ZF32/5tw9
         5Xmq5Mbek3K3Y7I/4bwEMT3cu9av60dF4BhVflqtM4KqfJj56fFedFJzeTlolvHF5/Z+
         nnIWLsqwmQWBuNwrUr+XDuvgMMnoAvaMQOHsxo468wA0n/+uu8Ce/nLox3jUC/E69SpN
         V78Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHUQLRFG5v8Bc/oUYslqjBghoLv7v3WUxMZAiRw0NSevvpPp8Y4IW/J8LY7BmRuVBNwPfLKPB1IMy0F4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaSjOldL8mr/1KRTX5po/ZVzHWOXdru6BdJ45nI9pF8joOLGTN
	nXx1Onkhoo0WUXQQ9j0swgttA2QLznKbGHFAQPklhcvjfDKSbvpZ3UR4
X-Gm-Gg: AY/fxX4AlHuJCmkqahT4Mx52w+v9aTMxyfeT7N9pYfyXX+49gTMrbT1mG9WlBhSbkfH
	G32ZN/kmgiypQYDdjGfjvL1yetjZfTyuvc0S1GEE5d2Bgyupstk5YsxuG9ElSeVR5ODidksFqjs
	aGyPIlECWVAOu6yqT2ELSgb7U3Z4qZ43MVJL1n+2pkUnQMp5sUV57A6bytcGCdh7J6GW9t14NZY
	oYymyT1An2Y9o3KC7yf5OvaEly3++SdyCogNNqgK8silsioZBUU9/gIIIUeUG7/Puh8l1JC1pa0
	hxZqggMslwYqEUwu3LJR5EgZt0SM0faX8/8R/EfaLLyAWC85BgjGDmVlNim5HOqcdTTswqkKbxg
	544OhvMEbRIAAqLOu0Vb3plTks6XtZCiNeldD/NcPkBhFn/B9J1l/PhAChqaEIzKpz/hTSgrcw8
	JRPl1G+B2eLBA=
X-Google-Smtp-Source: AGHT+IGOiWzTWjDTt8V28mCgk/MSI1eDWNCkwrxJg9Pu3RYSheZN7nSZ6c36U0q/C5xXK9+K9FfdVA==
X-Received: by 2002:a05:600c:350c:b0:471:9da:524c with SMTP id 5b1f17b1804b1-47a8f8c15c1mr58150915e9.12.1765632944899;
        Sat, 13 Dec 2025 05:35:44 -0800 (PST)
Received: from fedora.lan ([2a0d:6fc1:2:c000:4240:b502:d22f:bb75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm86283495e9.11.2025.12.13.05.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 05:35:44 -0800 (PST)
From: Rostislav Krasny <rostiprodev@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rostislav Krasny <rostiprodev@gmail.com>
Subject: [PATCH 1/1] kconfig: move XPM icons to separate files
Date: Sat, 13 Dec 2025 15:35:38 +0200
Message-ID: <20251213133538.15044-2-rostiprodev@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213133538.15044-1-rostiprodev@gmail.com>
References: <20251213133538.15044-1-rostiprodev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated gdk_pixbuf_new_from_xpm_data() with gdk_pixbuf_new_from_file()
and update both GTK and QT frontends to load XPM icons from separate files
in scripts/kconfig/icons/ instead of from the code.

xpm_menu_inv and xpm_void were removed and not converted into xpm files
because they are not used since 64285dc5c41fc7a031695c2c286a2bfef9eaf2c6

This eliminates the GTK deprecation warnings at compile time, improves
memory usage and code organization.

Signed-off-by: Rostislav Krasny <rostiprodev@gmail.com>
---
 scripts/kconfig/Makefile              |   4 +-
 scripts/kconfig/gconf.c               |  35 ++-
 scripts/kconfig/icons/back.xpm        |  29 +++
 scripts/kconfig/icons/choice_no.xpm   |  18 ++
 scripts/kconfig/icons/choice_yes.xpm  |  18 ++
 scripts/kconfig/icons/load.xpm        |  31 +++
 scripts/kconfig/icons/menu.xpm        |  18 ++
 scripts/kconfig/icons/menuback.xpm    |  18 ++
 scripts/kconfig/icons/save.xpm        |  32 +++
 scripts/kconfig/icons/single_view.xpm |  28 +++
 scripts/kconfig/icons/split_view.xpm  |  28 +++
 scripts/kconfig/icons/symbol_mod.xpm  |  18 ++
 scripts/kconfig/icons/symbol_no.xpm   |  18 ++
 scripts/kconfig/icons/symbol_yes.xpm  |  18 ++
 scripts/kconfig/icons/tree_view.xpm   |  28 +++
 scripts/kconfig/images.c              | 328 --------------------------
 scripts/kconfig/images.h              |  33 ---
 scripts/kconfig/qconf.cc              |  29 ++-
 18 files changed, 346 insertions(+), 385 deletions(-)
 create mode 100644 scripts/kconfig/icons/back.xpm
 create mode 100644 scripts/kconfig/icons/choice_no.xpm
 create mode 100644 scripts/kconfig/icons/choice_yes.xpm
 create mode 100644 scripts/kconfig/icons/load.xpm
 create mode 100644 scripts/kconfig/icons/menu.xpm
 create mode 100644 scripts/kconfig/icons/menuback.xpm
 create mode 100644 scripts/kconfig/icons/save.xpm
 create mode 100644 scripts/kconfig/icons/single_view.xpm
 create mode 100644 scripts/kconfig/icons/split_view.xpm
 create mode 100644 scripts/kconfig/icons/symbol_mod.xpm
 create mode 100644 scripts/kconfig/icons/symbol_no.xpm
 create mode 100644 scripts/kconfig/icons/symbol_yes.xpm
 create mode 100644 scripts/kconfig/icons/tree_view.xpm
 delete mode 100644 scripts/kconfig/images.c
 delete mode 100644 scripts/kconfig/images.h

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index fb50bd4f4103..5baf1c44ffa2 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -201,7 +201,7 @@ $(addprefix $(obj)/, mconf.o $(lxdialog)): | $(obj)/mconf-cflags
 # qconf: Used for the xconfig target based on Qt
 hostprogs	+= qconf
 qconf-cxxobjs	:= qconf.o qconf-moc.o
-qconf-objs	:= images.o $(common-objs)
+qconf-objs	:= $(common-objs)
 
 HOSTLDLIBS_qconf         = $(call read-file, $(obj)/qconf-libs)
 HOSTCXXFLAGS_qconf.o     = -std=c++11 -fPIC $(call read-file, $(obj)/qconf-cflags)
@@ -219,7 +219,7 @@ targets += qconf-moc.cc
 
 # gconf: Used for the gconfig target based on GTK+
 hostprogs	+= gconf
-gconf-objs	:= gconf.o images.o $(common-objs)
+gconf-objs	:= gconf.o $(common-objs)
 
 HOSTLDLIBS_gconf   = $(call read-file, $(obj)/gconf-libs)
 HOSTCFLAGS_gconf.o = $(call read-file, $(obj)/gconf-cflags)
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 8b164ccfa008..9f8586cb8a3e 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -5,7 +5,6 @@
 
 #include <stdlib.h>
 #include "lkc.h"
-#include "images.h"
 
 #include <gtk/gtk.h>
 
@@ -951,12 +950,24 @@ static void fixup_rootmenu(struct menu *menu)
 }
 
 /* Main Window Initialization */
-static void replace_button_icon(GtkWidget *widget, const char * const xpm[])
+static void replace_button_icon(GtkWidget *widget, const char *filename)
 {
 	GdkPixbuf *pixbuf;
 	GtkWidget *image;
+	GError *err = NULL;
+
+	char *env = getenv(SRCTREE);
+	gchar *path = g_strconcat(env ? env : g_get_current_dir(), "/scripts/kconfig/icons/", filename, NULL);
+
+	pixbuf = gdk_pixbuf_new_from_file(path, &err);
+	g_free(path);
+
+	if (err) {
+		g_warning("Failed to load icon %s: %s", filename, err->message);
+		g_error_free(err);
+		return;
+	}
 
-	pixbuf = gdk_pixbuf_new_from_xpm_data((const char **)xpm);
 	image = gtk_image_new_from_pixbuf(pixbuf);
 	g_object_unref(pixbuf);
 
@@ -1078,17 +1089,17 @@ static void init_main_window(const gchar *glade_file)
 	single_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button4"));
 	g_signal_connect(single_btn, "clicked",
 			 G_CALLBACK(on_single_clicked), NULL);
-	replace_button_icon(single_btn, xpm_single_view);
+	replace_button_icon(single_btn, "single_view.xpm");
 
 	split_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button5"));
 	g_signal_connect(split_btn, "clicked",
 			 G_CALLBACK(on_split_clicked), NULL);
-	replace_button_icon(split_btn, xpm_split_view);
+	replace_button_icon(split_btn, "split_view.xpm");
 
 	full_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button6"));
 	g_signal_connect(full_btn, "clicked",
 			 G_CALLBACK(on_full_clicked), NULL);
-	replace_button_icon(full_btn, xpm_tree_view);
+	replace_button_icon(full_btn, "tree_view.xpm");
 
 	widget = GTK_WIDGET(gtk_builder_get_object(builder, "button7"));
 	g_signal_connect(widget, "clicked",
@@ -1269,7 +1280,17 @@ static void init_right_tree(void)
 	g_signal_connect(G_OBJECT(renderer), "edited",
 			 G_CALLBACK(renderer_edited), tree2_w);
 
-	pix_menu = gdk_pixbuf_new_from_xpm_data((const char **)xpm_menu);
+	char *env = getenv(SRCTREE);
+	gchar *path = g_strconcat(env ? env : g_get_current_dir(), "/scripts/kconfig/icons/menu.xpm", NULL);
+	GError *err = NULL;
+
+	pix_menu = gdk_pixbuf_new_from_file(path, &err);
+	g_free(path);
+
+	if (err) {
+		g_warning("Failed to load menu icon: %s", err->message);
+		g_error_free(err);
+	}
 
 	for (i = 0; i < COL_VALUE; i++) {
 		column = gtk_tree_view_get_column(view, i);
diff --git a/scripts/kconfig/icons/back.xpm b/scripts/kconfig/icons/back.xpm
new file mode 100644
index 000000000000..2a4c30127608
--- /dev/null
+++ b/scripts/kconfig/icons/back.xpm
@@ -0,0 +1,29 @@
+/* XPM */
+static char * back_xpm[] = {
+"22 22 3 1",
+". c None",
+"# c #000083",
+"a c #838183",
+"......................",
+"......................",
+"......................",
+"......................",
+"......................",
+"...........######a....",
+"..#......##########...",
+"..##...####......##a..",
+"..###.###.........##..",
+"..######..........##..",
+"..#####...........##..",
+"..######..........##..",
+"..#######.........##..",
+"..########.......##a..",
+"...............a###...",
+"...............###....",
+"......................",
+"......................",
+"......................",
+"......................",
+"......................",
+"......................"
+};
diff --git a/scripts/kconfig/icons/choice_no.xpm b/scripts/kconfig/icons/choice_no.xpm
new file mode 100644
index 000000000000..306e314ed9c6
--- /dev/null
+++ b/scripts/kconfig/icons/choice_no.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * choice_no_xpm[] = {
+"12 12 2 1",
+"  c white",
+". c black",
+"            ",
+"    ....    ",
+"  ..    ..  ",
+"  .      .  ",
+" .        . ",
+" .        . ",
+" .        . ",
+" .        . ",
+"  .      .  ",
+"  ..    ..  ",
+"    ....    ",
+"            "
+};
diff --git a/scripts/kconfig/icons/choice_yes.xpm b/scripts/kconfig/icons/choice_yes.xpm
new file mode 100644
index 000000000000..edeb91067379
--- /dev/null
+++ b/scripts/kconfig/icons/choice_yes.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * choice_yes_xpm[] = {
+"12 12 2 1",
+"  c white",
+". c black",
+"            ",
+"    ....    ",
+"  ..    ..  ",
+"  .      .  ",
+" .   ..   . ",
+" .  ....  . ",
+" .  ....  . ",
+" .   ..   . ",
+"  .      .  ",
+"  ..    ..  ",
+"    ....    ",
+"            "
+};
diff --git a/scripts/kconfig/icons/load.xpm b/scripts/kconfig/icons/load.xpm
new file mode 100644
index 000000000000..084da68a035a
--- /dev/null
+++ b/scripts/kconfig/icons/load.xpm
@@ -0,0 +1,31 @@
+/* XPM */
+static char * load_xpm[] = {
+"22 22 5 1",
+". c None",
+"# c #000000",
+"c c #838100",
+"a c #ffff00",
+"b c #ffffff",
+"......................",
+"......................",
+"......................",
+"............####....#.",
+"...........#....##.##.",
+"..................###.",
+".................####.",
+".####...........#####.",
+"#abab##########.......",
+"#babababababab#.......",
+"#ababababababa#.......",
+"#babababababab#.......",
+"#ababab###############",
+"#babab##cccccccccccc##",
+"#babab##cccccccccccc##",
+"#babab##cccccccccccc##",
+"#babab##cccccccccccc##",
+"#babab##cccccccccccc##",
+"###cccccccccccc##.....",
+"##cccccccccccc##......",
+"###############.......",
+"......................"
+};
diff --git a/scripts/kconfig/icons/menu.xpm b/scripts/kconfig/icons/menu.xpm
new file mode 100644
index 000000000000..8ae1b74b3c0c
--- /dev/null
+++ b/scripts/kconfig/icons/menu.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * menu_xpm[] = {
+"12 12 2 1",
+"  c white",
+". c black",
+"            ",
+" .......... ",
+" .        . ",
+" . ..     . ",
+" . ....   . ",
+" . ...... . ",
+" . ...... . ",
+" . ....   . ",
+" . ..     . ",
+" .        . ",
+" .......... ",
+"            "
+};
diff --git a/scripts/kconfig/icons/menuback.xpm b/scripts/kconfig/icons/menuback.xpm
new file mode 100644
index 000000000000..f988c2c323c3
--- /dev/null
+++ b/scripts/kconfig/icons/menuback.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * menuback_xpm[] = {
+"12 12 2 1",
+"  c white",
+". c black",
+"            ",
+" .......... ",
+" .        . ",
+" .     .. . ",
+" .   .... . ",
+" . ...... . ",
+" . ...... . ",
+" .   .... . ",
+" .     .. . ",
+" .        . ",
+" .......... ",
+"            "
+};
diff --git a/scripts/kconfig/icons/save.xpm b/scripts/kconfig/icons/save.xpm
new file mode 100644
index 000000000000..3c961e1189ff
--- /dev/null
+++ b/scripts/kconfig/icons/save.xpm
@@ -0,0 +1,32 @@
+/* XPM */
+static char * save_xpm[] = {
+"22 22 5 1",
+". c None",
+"# c #000000",
+"a c #838100",
+"b c #c5c2c5",
+"c c #cdb6d5",
+"......................",
+".####################.",
+".#aa#bbbbbbbbbbbb#bb#.",
+".#aa#bbbbbbbbbbbb#bb#.",
+".#aa#bbbbbbbbbcbb####.",
+".#aa#bbbccbbbbbbb#aa#.",
+".#aa#bbbccbbbbbbb#aa#.",
+".#aa#bbbbbbbbbbbb#aa#.",
+".#aa#bbbbbbbbbbbb#aa#.",
+".#aa#bbbbbbbbbbbb#aa#.",
+".#aa#bbbbbbbbbbbb#aa#.",
+".#aa#bbbbbbbbbbbb#aa#.",
+".#aaa############aaa#.",
+".#aaaaaaaaaaaaaaaaaa#.",
+".#aaaaaaaaaaaaaaaaaa#.",
+".#aaa#############aa#.",
+".#aaa#########bbb#aa#.",
+".#aaa#########bbb#aa#.",
+".#aaa#########bbb#aa#.",
+".#aaa#########bbb#aa#.",
+".#aaa#########bbb#aa#.",
+"..##################..",
+"......................"
+};
diff --git a/scripts/kconfig/icons/single_view.xpm b/scripts/kconfig/icons/single_view.xpm
new file mode 100644
index 000000000000..33c3b239dc8e
--- /dev/null
+++ b/scripts/kconfig/icons/single_view.xpm
@@ -0,0 +1,28 @@
+/* XPM */
+static char * single_view_xpm[] = {
+"22 22 2 1",
+". c None",
+"# c #000000",
+"......................",
+"......................",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"..........#...........",
+"......................",
+"......................"
+};
diff --git a/scripts/kconfig/icons/split_view.xpm b/scripts/kconfig/icons/split_view.xpm
new file mode 100644
index 000000000000..09e22246d936
--- /dev/null
+++ b/scripts/kconfig/icons/split_view.xpm
@@ -0,0 +1,28 @@
+/* XPM */
+static char * split_view_xpm[] = {
+"22 22 2 1",
+". c None",
+"# c #000000",
+"......................",
+"......................",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......#......#........",
+"......................",
+"......................"
+};
diff --git a/scripts/kconfig/icons/symbol_mod.xpm b/scripts/kconfig/icons/symbol_mod.xpm
new file mode 100644
index 000000000000..769465fcb0ce
--- /dev/null
+++ b/scripts/kconfig/icons/symbol_mod.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * symbol_mod_xpm[] = {
+"12 12 2 1",
+"  c white",
+". c black",
+"            ",
+" .......... ",
+" .        . ",
+" .        . ",
+" .   ..   . ",
+" .  ....  . ",
+" .  ....  . ",
+" .   ..   . ",
+" .        . ",
+" .        . ",
+" .......... ",
+"            "
+};
diff --git a/scripts/kconfig/icons/symbol_no.xpm b/scripts/kconfig/icons/symbol_no.xpm
new file mode 100644
index 000000000000..e4e9d46c9aca
--- /dev/null
+++ b/scripts/kconfig/icons/symbol_no.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * symbol_no_xpm[] = {
+"12 12 2 1",
+"  c white",
+". c black",
+"            ",
+" .......... ",
+" .        . ",
+" .        . ",
+" .        . ",
+" .        . ",
+" .        . ",
+" .        . ",
+" .        . ",
+" .        . ",
+" .......... ",
+"            "
+};
diff --git a/scripts/kconfig/icons/symbol_yes.xpm b/scripts/kconfig/icons/symbol_yes.xpm
new file mode 100644
index 000000000000..dab7e10ae7a9
--- /dev/null
+++ b/scripts/kconfig/icons/symbol_yes.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * symbol_yes_xpm[] = {
+"12 12 2 1",
+"  c white",
+". c black",
+"            ",
+" .......... ",
+" .        . ",
+" .        . ",
+" .      . . ",
+" .     .. . ",
+" . .  ..  . ",
+" . ....   . ",
+" .  ..    . ",
+" .        . ",
+" .......... ",
+"            "
+};
diff --git a/scripts/kconfig/icons/tree_view.xpm b/scripts/kconfig/icons/tree_view.xpm
new file mode 100644
index 000000000000..290835b802eb
--- /dev/null
+++ b/scripts/kconfig/icons/tree_view.xpm
@@ -0,0 +1,28 @@
+/* XPM */
+static char * tree_view_xpm[] = {
+"22 22 2 1",
+". c None",
+"# c #000000",
+"......................",
+"......................",
+"......#...............",
+"......#...............",
+"......#...............",
+"......#...............",
+"......#...............",
+"......########........",
+"......#...............",
+"......#...............",
+"......#...............",
+"......#...............",
+"......#...............",
+"......########........",
+"......#...............",
+"......#...............",
+"......#...............",
+"......#...............",
+"......#...............",
+"......########........",
+"......................",
+"......................"
+};
diff --git a/scripts/kconfig/images.c b/scripts/kconfig/images.c
deleted file mode 100644
index 2f9afffa5d79..000000000000
--- a/scripts/kconfig/images.c
+++ /dev/null
@@ -1,328 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
- */
-
-#include "images.h"
-
-const char * const xpm_load[] = {
-"22 22 5 1",
-". c None",
-"# c #000000",
-"c c #838100",
-"a c #ffff00",
-"b c #ffffff",
-"......................",
-"......................",
-"......................",
-"............####....#.",
-"...........#....##.##.",
-"..................###.",
-".................####.",
-".####...........#####.",
-"#abab##########.......",
-"#babababababab#.......",
-"#ababababababa#.......",
-"#babababababab#.......",
-"#ababab###############",
-"#babab##cccccccccccc##",
-"#abab##cccccccccccc##.",
-"#bab##cccccccccccc##..",
-"#ab##cccccccccccc##...",
-"#b##cccccccccccc##....",
-"###cccccccccccc##.....",
-"##cccccccccccc##......",
-"###############.......",
-"......................"};
-
-const char * const xpm_save[] = {
-"22 22 5 1",
-". c None",
-"# c #000000",
-"a c #838100",
-"b c #c5c2c5",
-"c c #cdb6d5",
-"......................",
-".####################.",
-".#aa#bbbbbbbbbbbb#bb#.",
-".#aa#bbbbbbbbbbbb#bb#.",
-".#aa#bbbbbbbbbcbb####.",
-".#aa#bbbccbbbbbbb#aa#.",
-".#aa#bbbccbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aa#bbbbbbbbbbbb#aa#.",
-".#aaa############aaa#.",
-".#aaaaaaaaaaaaaaaaaa#.",
-".#aaaaaaaaaaaaaaaaaa#.",
-".#aaa#############aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-".#aaa#########bbb#aa#.",
-"..##################..",
-"......................"};
-
-const char * const xpm_back[] = {
-"22 22 3 1",
-". c None",
-"# c #000083",
-"a c #838183",
-"......................",
-"......................",
-"......................",
-"......................",
-"......................",
-"...........######a....",
-"..#......##########...",
-"..##...####......##a..",
-"..###.###.........##..",
-"..######..........##..",
-"..#####...........##..",
-"..######..........##..",
-"..#######.........##..",
-"..########.......##a..",
-"...............a###...",
-"...............###....",
-"......................",
-"......................",
-"......................",
-"......................",
-"......................",
-"......................"};
-
-const char * const xpm_tree_view[] = {
-"22 22 2 1",
-". c None",
-"# c #000000",
-"......................",
-"......................",
-"......#...............",
-"......#...............",
-"......#...............",
-"......#...............",
-"......#...............",
-"......########........",
-"......#...............",
-"......#...............",
-"......#...............",
-"......#...............",
-"......#...............",
-"......########........",
-"......#...............",
-"......#...............",
-"......#...............",
-"......#...............",
-"......#...............",
-"......########........",
-"......................",
-"......................"};
-
-const char * const xpm_single_view[] = {
-"22 22 2 1",
-". c None",
-"# c #000000",
-"......................",
-"......................",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"..........#...........",
-"......................",
-"......................"};
-
-const char * const xpm_split_view[] = {
-"22 22 2 1",
-". c None",
-"# c #000000",
-"......................",
-"......................",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......#......#........",
-"......................",
-"......................"};
-
-const char * const xpm_symbol_no[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .......... ",
-"            "};
-
-const char * const xpm_symbol_mod[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .        . ",
-" .        . ",
-" .   ..   . ",
-" .  ....  . ",
-" .  ....  . ",
-" .   ..   . ",
-" .        . ",
-" .        . ",
-" .......... ",
-"            "};
-
-const char * const xpm_symbol_yes[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .        . ",
-" .        . ",
-" .      . . ",
-" .     .. . ",
-" . .  ..  . ",
-" . ....   . ",
-" .  ..    . ",
-" .        . ",
-" .......... ",
-"            "};
-
-const char * const xpm_choice_no[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-"    ....    ",
-"  ..    ..  ",
-"  .      .  ",
-" .        . ",
-" .        . ",
-" .        . ",
-" .        . ",
-"  .      .  ",
-"  ..    ..  ",
-"    ....    ",
-"            "};
-
-const char * const xpm_choice_yes[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-"    ....    ",
-"  ..    ..  ",
-"  .      .  ",
-" .   ..   . ",
-" .  ....  . ",
-" .  ....  . ",
-" .   ..   . ",
-"  .      .  ",
-"  ..    ..  ",
-"    ....    ",
-"            "};
-
-const char * const xpm_menu[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .        . ",
-" . ..     . ",
-" . ....   . ",
-" . ...... . ",
-" . ...... . ",
-" . ....   . ",
-" . ..     . ",
-" .        . ",
-" .......... ",
-"            "};
-
-const char * const xpm_menu_inv[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .......... ",
-" ..  ...... ",
-" ..    .... ",
-" ..      .. ",
-" ..      .. ",
-" ..    .... ",
-" ..  ...... ",
-" .......... ",
-" .......... ",
-"            "};
-
-const char * const xpm_menuback[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-" .......... ",
-" .        . ",
-" .     .. . ",
-" .   .... . ",
-" . ...... . ",
-" . ...... . ",
-" .   .... . ",
-" .     .. . ",
-" .        . ",
-" .......... ",
-"            "};
-
-const char * const xpm_void[] = {
-"12 12 2 1",
-"  c white",
-". c black",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            ",
-"            "};
diff --git a/scripts/kconfig/images.h b/scripts/kconfig/images.h
deleted file mode 100644
index 7212dec2006c..000000000000
--- a/scripts/kconfig/images.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
- */
-
-#ifndef IMAGES_H
-#define IMAGES_H
-
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-extern const char * const xpm_load[];
-extern const char * const xpm_save[];
-extern const char * const xpm_back[];
-extern const char * const xpm_tree_view[];
-extern const char * const xpm_single_view[];
-extern const char * const xpm_split_view[];
-extern const char * const xpm_symbol_no[];
-extern const char * const xpm_symbol_mod[];
-extern const char * const xpm_symbol_yes[];
-extern const char * const xpm_choice_no[];
-extern const char * const xpm_choice_yes[];
-extern const char * const xpm_menu[];
-extern const char * const xpm_menu_inv[];
-extern const char * const xpm_menuback[];
-extern const char * const xpm_void[];
-
-#ifdef __cplusplus
-}
-#endif
-
-#endif /* IMAGES_H */
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index b84c9f2485d1..afa73cc4f4fb 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -26,8 +26,6 @@
 #include "lkc.h"
 #include "qconf.h"
 
-#include "images.h"
-
 
 static QApplication *configApp;
 static ConfigSettings *configSettings;
@@ -1283,13 +1281,14 @@ ConfigMainWindow::ConfigMainWindow(void)
 		move(x.toInt(), y.toInt());
 
 	// set up icons
-	ConfigItem::symbolYesIcon = QIcon(QPixmap(xpm_symbol_yes));
-	ConfigItem::symbolModIcon = QIcon(QPixmap(xpm_symbol_mod));
-	ConfigItem::symbolNoIcon = QIcon(QPixmap(xpm_symbol_no));
-	ConfigItem::choiceYesIcon = QIcon(QPixmap(xpm_choice_yes));
-	ConfigItem::choiceNoIcon = QIcon(QPixmap(xpm_choice_no));
-	ConfigItem::menuIcon = QIcon(QPixmap(xpm_menu));
-	ConfigItem::menubackIcon = QIcon(QPixmap(xpm_menuback));
+	QString iconsDir = QString(getenv("SRCTREE") ? getenv("SRCTREE") : QDir::currentPath()) + "/scripts/kconfig/icons/";
+	ConfigItem::symbolYesIcon = QIcon(QPixmap(iconsDir + "symbol_yes.xpm"));
+	ConfigItem::symbolModIcon = QIcon(QPixmap(iconsDir + "symbol_mod.xpm"));
+	ConfigItem::symbolNoIcon = QIcon(QPixmap(iconsDir + "symbol_no.xpm"));
+	ConfigItem::choiceYesIcon = QIcon(QPixmap(iconsDir + "choice_yes.xpm"));
+	ConfigItem::choiceNoIcon = QIcon(QPixmap(iconsDir + "choice_no.xpm"));
+	ConfigItem::menuIcon = QIcon(QPixmap(iconsDir + "menu.xpm"));
+	ConfigItem::menubackIcon = QIcon(QPixmap(iconsDir + "menuback.xpm"));
 
 	QWidget *widget = new QWidget(this);
 	setCentralWidget(widget);
@@ -1312,7 +1311,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	configList->setFocus();
 
-	backAction = new QAction(QPixmap(xpm_back), "Back", this);
+	backAction = new QAction(QPixmap(iconsDir + "back.xpm"), "Back", this);
 	backAction->setShortcut(QKeySequence::Back);
 	connect(backAction, &QAction::triggered,
 		this, &ConfigMainWindow::goBack);
@@ -1322,12 +1321,12 @@ ConfigMainWindow::ConfigMainWindow(void)
 	connect(quitAction, &QAction::triggered,
 		this, &ConfigMainWindow::close);
 
-	QAction *loadAction = new QAction(QPixmap(xpm_load), "&Open", this);
+	QAction *loadAction = new QAction(QPixmap(iconsDir + "load.xpm"), "&Open", this);
 	loadAction->setShortcut(QKeySequence::Open);
 	connect(loadAction, &QAction::triggered,
 		this, &ConfigMainWindow::loadConfig);
 
-	saveAction = new QAction(QPixmap(xpm_save), "&Save", this);
+	saveAction = new QAction(QPixmap(iconsDir + "save.xpm"), "&Save", this);
 	saveAction->setShortcut(QKeySequence::Save);
 	connect(saveAction, &QAction::triggered,
 		this, &ConfigMainWindow::saveConfig);
@@ -1344,15 +1343,15 @@ ConfigMainWindow::ConfigMainWindow(void)
 	searchAction->setShortcut(QKeySequence::Find);
 	connect(searchAction, &QAction::triggered,
 		this, &ConfigMainWindow::searchConfig);
-	singleViewAction = new QAction(QPixmap(xpm_single_view), "Single View", this);
+	singleViewAction = new QAction(QPixmap(iconsDir + "single_view.xpm"), "Single View", this);
 	singleViewAction->setCheckable(true);
 	connect(singleViewAction, &QAction::triggered,
 		this, &ConfigMainWindow::showSingleView);
-	splitViewAction = new QAction(QPixmap(xpm_split_view), "Split View", this);
+	splitViewAction = new QAction(QPixmap(iconsDir + "split_view.xpm"), "Split View", this);
 	splitViewAction->setCheckable(true);
 	connect(splitViewAction, &QAction::triggered,
 		this, &ConfigMainWindow::showSplitView);
-	fullViewAction = new QAction(QPixmap(xpm_tree_view), "Full View", this);
+	fullViewAction = new QAction(QPixmap(iconsDir + "tree_view.xpm"), "Full View", this);
 	fullViewAction->setCheckable(true);
 	connect(fullViewAction, &QAction::triggered,
 		this, &ConfigMainWindow::showFullView);
-- 
2.52.0


