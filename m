Return-Path: <linux-kbuild+bounces-10125-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF4CC5BA9
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 02:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5100A302CB8A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 01:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A117125B305;
	Wed, 17 Dec 2025 01:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Meu3hlUe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF485225402
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 01:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936459; cv=none; b=uW6jZscmSP6KA9muqQdyRYZ9JOtXGIovbBumG0V4oAOJB4nV851VOzjKeHGeT/70NPdxBW8nx24QkEqMxRKNX/f3d+Cjr1jzjAoXvDS9ksO3j5VEWmEH8Pi72qEGSd8Dd+w2RZkNTj5gzur5xQGXRw1mELrMrlkA2xC6Uy9CRCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936459; c=relaxed/simple;
	bh=WBUeV8g3Ssa59vDDSaHGByg9xU6ufZKszzQij1cVE2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arLZg87qA6ibECkY1tScg4iHLDxKlpJNIGJW4+ux7c2oHnsNrQ+J9dZstw/d+xQfKtiX/r9nQ/ocWp9LU5voZgc68uEBTIQ9PV9Tq9gRMkP4HLull3u5LKxKHm0vTXVdScthIwSwgOpjSWYFay8YiPqQI5NTA/RZiRbOqNr7PO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Meu3hlUe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso56086905e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Dec 2025 17:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765936455; x=1766541255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clOHmZEwVCLCiURaU3Xp4vynVfZhR1QQOg1dKnHKe68=;
        b=Meu3hlUe9ONU3aLR+mLU+NRA5Tqd/2iu/zNoYN7ofcSZ/gELrhlmRDasDD6F2j6Wuw
         T9Kty0O5qzNSaju/z6xzx61nnyATgrbjHZYWrgzSFhI+uqsbxqaJPpbjouPhCYoCDZxZ
         a9xHk59C5tbJDRYShY/Xx5LxnPaVR/jHcJkMjlrGaQtyD9j3n7aRwFNA3bzN+wpFKC4F
         0HbUC7hn01+an95u3Hq5hUjBtZdd3bBTHTKWBe1zvOmsieVQMPxs31E1c1z4FSWDflPj
         mo2SYpfAb2uYCi5WmjsLVl+Bn/hZHTADsGUqXhTwGTIOdZ5btRuc4Dv7GoIcRV0P0qL3
         4whg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765936455; x=1766541255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=clOHmZEwVCLCiURaU3Xp4vynVfZhR1QQOg1dKnHKe68=;
        b=eNk2l8+xt5AqfikImGx98pOEfnUqQPVxpVN3HYe0liW/TtO0S7C3vmWf0yNaWBNgpb
         xCXwF4XAkSjY0lqxYQm2ccKyJ8q8xtIVN/2RZ63ll7KFUkQ+UK4rdBSFhOF51O/YzKvS
         0SkMZRQVymZJHHLYGvk8ZrBh7/tDgZYw13S7P1z9cVOj5P672WyFFazpTjgAT3AhU7bM
         Z1cv+B3UAReVoJWyG1tUDlFWGS4xmC4NDZ0Tn2GCFzZy2rfQzyyvwpukTFXxak45+oVP
         9+a7yLX6EjJtf1rwX5emLFkS7/ABsQaQFmYK6eGXgXu1mk1tCvtSGbnkYuiKjyYqIaZ2
         cqHA==
X-Forwarded-Encrypted: i=1; AJvYcCUswu5qWW9e/y8JusZc79rjB4pI18PeEodRkiicXPbvZjvHvQiZFsDel/Ykmp/KW+LPKcQ8QEser6W9m9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/yHEnCZ3/zJLK25uQT6iFU9uwDvzYGXQiUUGiFoo5Og5hyEH
	3nLHMGaM6E0PH2becEVZn6Lce9JDUq+PL5cufb1UmQJUoGHMmLMcc7nm
X-Gm-Gg: AY/fxX5n4MDt2NAegvkTrUXdQPmYpah/v7FF3AWkFCuDojG4PYjPvPo6HLTKPYYNz/u
	EaF0YmWx2Er6LhQUsYmQb9QZBl9gOlMs58l6ErXx/X2kGNBfVEaNub2ufvf0xG2R9Pv2HHpGBng
	2cjKH5ijgwC/OCCpzke3WViTSa490E3uTSUmVIa6ijX454qMo4JSnNCONMt/w1gabdHL0P7B4PT
	cxoE9WpvYi//QwAqm0RvE28vAQE/TEW8rhaUvUKs+BVj3XVc3xJf6a503PwdeVqZFaJWM4giuo/
	OX1J+ocn8yshw7uyPCXVGhIJjSiW18Z2fAc09AUJlkcUR4Eg46xgeTeO0tm6qzsxIovcaxeNa75
	qtSfwLqmlKnwu8c18kiqmH+mTme1VmkzmqaJR6Qr6iL3NXZ/LS1khIHGu8kGcLM7dEdaIVzRBDQ
	xQL07foqlvWsI=
X-Google-Smtp-Source: AGHT+IEl1Dy+8kJJpyRaEL1p/lUl9vWL1Y6kxXr4Dmrt4vGLB5pJFtNi80yZYXJVJFaHcJsHCQHGDQ==
X-Received: by 2002:a05:600c:4e05:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47a8f8c11famr156225405e9.14.1765936454991;
        Tue, 16 Dec 2025 17:54:14 -0800 (PST)
Received: from fedora.lan ([2a0d:6fc1:2:c000:ab04:bb83:9fe4:38a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1c2243sm15561875e9.1.2025.12.16.17.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 17:54:14 -0800 (PST)
From: Rostislav Krasny <rostiprodev@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rostislav Krasny <rostiprodev@gmail.com>
Subject: [PATCH v3 1/1] kconfig: move XPM icons to separate files
Date: Wed, 17 Dec 2025 03:54:09 +0200
Message-ID: <20251217015409.30102-2-rostiprodev@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217015409.30102-1-rostiprodev@gmail.com>
References: <46a5f2d9-b118-4675-8372-40f9b2fc7bbe@infradead.org>
 <20251217015409.30102-1-rostiprodev@gmail.com>
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
 scripts/kconfig/icons/save.xpm        |  31 +++
 scripts/kconfig/icons/single_view.xpm |  28 +++
 scripts/kconfig/icons/split_view.xpm  |  28 +++
 scripts/kconfig/icons/symbol_mod.xpm  |  18 ++
 scripts/kconfig/icons/symbol_no.xpm   |  18 ++
 scripts/kconfig/icons/symbol_yes.xpm  |  18 ++
 scripts/kconfig/icons/tree_view.xpm   |  28 +++
 scripts/kconfig/images.c              | 328 --------------------------
 scripts/kconfig/images.h              |  33 ---
 scripts/kconfig/qconf.cc              |  29 ++-
 18 files changed, 345 insertions(+), 385 deletions(-)
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
index 000000000000..8c2d8725d1ef
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
+"#abab##cccccccccccc##.",
+"#bab##cccccccccccc##..",
+"#ab##cccccccccccc##...",
+"#b##cccccccccccc##....",
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
index 000000000000..f8be53d83b40
--- /dev/null
+++ b/scripts/kconfig/icons/save.xpm
@@ -0,0 +1,31 @@
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
index b84c9f2485d1..b02ead7a3f98 100644
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
+	QString iconsDir = QString(getenv(SRCTREE) ? getenv(SRCTREE) : QDir::currentPath()) + "/scripts/kconfig/icons/";
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


