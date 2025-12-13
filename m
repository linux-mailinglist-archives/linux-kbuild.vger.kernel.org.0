Return-Path: <linux-kbuild+bounces-10088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27732CBAAA6
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 13:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88E5230CFA2C
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Dec 2025 12:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E47821C160;
	Sat, 13 Dec 2025 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URQLKbSJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A864328314E
	for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765629733; cv=none; b=qSN+CS7fN1/yqWRkiC6sT/hfM+2pvJBKCE4xJ90Ow6CpGn9bJvkY/zJTYo9xGyrXRFtgM70bBYV6qEGje2Id7CP+B8gArc8/58jyQkkoHm5UcmgBWvavUbUAqr9c/EHiuLNXi/5AHh1Hvqp8hE9HPPC1aa7WTG0h4sFq7sx0xDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765629733; c=relaxed/simple;
	bh=8VdmDVOFIxzfweKQRZIcJuJRl5QeAMd7FJ5KELTaQKk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Sy5Rvloc0aJodEwX5bF3ulDJffMVl98ZVeQX+l/cNtD1+PJaGYf1a3QI6Lp5kS5eK5x0Q2cX1dgrSk3f2IS8rrxAS/okCR+GAd9Dbk9d9/D6NYD283wg6fdxNPcVjW8xoDS3nE4UZnmrKoxf1Lt2i49g7d3uJZ1LoZMx+Haxk4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URQLKbSJ; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ee0084fd98so17979181cf.3
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Dec 2025 04:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765629729; x=1766234529; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EuBICrPMvBeC8DSwaKuICPTSgENgWbf9Ek5vNA+y82A=;
        b=URQLKbSJlWY0vT8VHDPlXZEwcxIa7xyYNK7XY6GkPPhcNzMNsNPS3iVrps9vpwf4pj
         xVG0/MB8v9nYeE8RrFHWdeQGZNZCOIVOYy8s89fjZ1QrPWOCGZtoWnIVko08qc2Z/izv
         Ng+yl7TrAsriyOadmEThUa5CyuXLqDhBfVoXluTAXAeMGiqjVFDB7WMeAKkXWbi6Gbw6
         B90fFArxgKLrX/p/a25BGDNDgessns7EHjn/U6+ff2BtIZr7DBxOPaQUtPPDuYIoPgzZ
         Y4jVFxVzfF0x6BqXSjugjS4K19tll0Sl9AK+DKGEbaY1yOQABArJ0GFXc2gg4yEsivTy
         SOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765629729; x=1766234529;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EuBICrPMvBeC8DSwaKuICPTSgENgWbf9Ek5vNA+y82A=;
        b=wscW13wDlJHB0pN0yrt9MlbnzdwhYqTxY+ZQeNT8cg6B46rTvGe6h9mS4zNCt7Lkon
         70G3dXqUsvoWOnA/klgeuYqdvxRh1h+3kD9xTSsIuet/dd4UAXhKr5HojZlvHisaJ25Z
         2r/krHvaedm+GIun/DAizM3fC3swHj4xVdqrtmpGzUJ0vL1PnmT0WlDO94K8U6aqTTBB
         qaQX8/NXLgULdHZ7bbGXglipZszJCzE3kcI2EX4Jf7npaOTRIDuMwd8tQmtIOlR7gVdQ
         Y1Zy+y1+rKXNXea36ZID5p5gbj4WDgzDVakaC9vZuICtGvTnrohgbimYq1JXFF+L/pey
         rr0w==
X-Forwarded-Encrypted: i=1; AJvYcCWGtUImTQXbRsFKx8qvPN4+DvnpgD2yY1cGAheJNEd8dSsM1Eu1WjjqQyS5ZNp1toq8AHPi3E/64QXNx00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsaVR2urE9LZjgcSxx29KkC9mw6eGKiNPfJ3u5UHxHP9xpfFGt
	T0N8bTU6YiLs82ylWKmyZokILRVbLSO6AhTByo6iucwdYvb81d9b+2msnVsvE79Uqy1MKwo1qB2
	m+PhJ74C29tJkA7JWta8PD71M04RxWLE=
X-Gm-Gg: AY/fxX6EKQ0LySUUjweCvl+/yLe97t7hftPsWyle4E5ZlQNZABMvpDVoz0nZE43Uf8V
	71g1cTQZ9hHtjVthFggZz2OH6DsMolwgie58g7WmxxGZbQ85nKCngpTvJRMHSxv3U2514o6Kfwp
	DusXbQxi9wtIl6jevYEPxCPVnQPmPLzW6ScHOaO/89kI7CSjYtsO+msxbq05/jhYf7RdFPZJAF4
	QmIr1UKlD81KaI8n0IcLQW2MTlunPofhR5Ge5eyFeUr2szU40OKlb6OPDKrfMVmR/aw9wQG
X-Google-Smtp-Source: AGHT+IGmUhDH5IfA0LCAH3M+z4Mz0Je1e+g4OrjIQLjy2dsdnNfuI5TtbCz4BDS4+kUoke1uMFnX4p4EjxrkGAw0fZY=
X-Received: by 2002:ac8:7d8c:0:b0:4ee:418a:73d0 with SMTP id
 d75a77b69052e-4f1d0626227mr73987531cf.64.1765629729388; Sat, 13 Dec 2025
 04:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rostislav Krasny <rostiprodev@gmail.com>
Date: Sat, 13 Dec 2025 14:41:58 +0200
X-Gm-Features: AQt7F2prttDg1wTUGimm5rmH9rK06lVmPDH8Vk_LieHoeBLIT0BrP3abxIAcvL4
Message-ID: <CAKU3Xk4=18e8DX5Layx_xuYNoynztqwBQkzwfup5DNfqJm6+fQ@mail.gmail.com>
Subject: [PATCH] kconfig: move XPM icons to separate files
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rostislav Krasny <rostiprodev@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From 3e63d6e23d63a8f10ea8636d6be0e790e0b4f060 Mon Sep 17 00:00:00 2001
From: Rostislav Krasny <rostiprodev@gmail.com>
Date: Sat, 13 Dec 2025 12:19:15 +0200
Subject: [PATCH] kconfig: move XPM icons to separate files

Replace deprecated gdk_pixbuf_new_from_xpm_data() with
gdk_pixbuf_new_from_file()
and update both GTK and QT frontends to load XPM icons from separate files
in scripts/kconfig/icons/ instead of from the code.

xpm_menu_inv and xpm_void were removed and not converted into xpm files
because they are not used since 64285dc5c41fc7a031695c2c286a2bfef9eaf2c6

This eliminates the GTK deprecation warnings at compile time, improves
memory usage and code organization.

Signed-off-by: Rostislav Krasny <rostiprodev@gmail.com>
---
scripts/kconfig/Makefile | 4 +-
scripts/kconfig/gconf.c | 35 ++-
scripts/kconfig/icons/back.xpm | 29 +++
scripts/kconfig/icons/choice_no.xpm | 18 ++
scripts/kconfig/icons/choice_yes.xpm | 18 ++
scripts/kconfig/icons/load.xpm | 31 +++
scripts/kconfig/icons/menu.xpm | 18 ++
scripts/kconfig/icons/menuback.xpm | 18 ++
scripts/kconfig/icons/save.xpm | 32 +++
scripts/kconfig/icons/single_view.xpm | 28 +++
scripts/kconfig/icons/split_view.xpm | 28 +++
scripts/kconfig/icons/symbol_mod.xpm | 18 ++
scripts/kconfig/icons/symbol_no.xpm | 18 ++
scripts/kconfig/icons/symbol_yes.xpm | 18 ++
scripts/kconfig/icons/tree_view.xpm | 28 +++
scripts/kconfig/images.c | 328 --------------------------
scripts/kconfig/images.h | 33 ---
scripts/kconfig/qconf.cc | 29 ++-
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
@@ -201,7 +201,7 @@ $(addprefix $(obj)/, mconf.o $(lxdialog)): |
$(obj)/mconf-cflags
# qconf: Used for the xconfig target based on Qt
hostprogs += qconf
qconf-cxxobjs := qconf.o qconf-moc.o
-qconf-objs := images.o $(common-objs)
+qconf-objs := $(common-objs)
HOSTLDLIBS_qconf = $(call read-file, $(obj)/qconf-libs)
HOSTCXXFLAGS_qconf.o = -std=c++11 -fPIC $(call read-file, $(obj)/qconf-cflags)
@@ -219,7 +219,7 @@ targets += qconf-moc.cc
# gconf: Used for the gconfig target based on GTK+
hostprogs += gconf
-gconf-objs := gconf.o images.o $(common-objs)
+gconf-objs := gconf.o $(common-objs)
HOSTLDLIBS_gconf = $(call read-file, $(obj)/gconf-libs)
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
+ GError *err = NULL;
+
+ char *env = getenv(SRCTREE);
+ gchar *path = g_strconcat(env ? env : g_get_current_dir(),
"/scripts/kconfig/icons/", filename, NULL);
+
+ pixbuf = gdk_pixbuf_new_from_file(path, &err);
+ g_free(path);
+
+ if (err) {
+ g_warning("Failed to load icon %s: %s", filename, err->message);
+ g_error_free(err);
+ return;
+ }
- pixbuf = gdk_pixbuf_new_from_xpm_data((const char **)xpm);
image = gtk_image_new_from_pixbuf(pixbuf);
g_object_unref(pixbuf);
@@ -1078,17 +1089,17 @@ static void init_main_window(const gchar *glade_file)
single_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button4"));
g_signal_connect(single_btn, "clicked",
G_CALLBACK(on_single_clicked), NULL);
- replace_button_icon(single_btn, xpm_single_view);
+ replace_button_icon(single_btn, "single_view.xpm");
split_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button5"));
g_signal_connect(split_btn, "clicked",
G_CALLBACK(on_split_clicked), NULL);
- replace_button_icon(split_btn, xpm_split_view);
+ replace_button_icon(split_btn, "split_view.xpm");
full_btn = GTK_WIDGET(gtk_builder_get_object(builder, "button6"));
g_signal_connect(full_btn, "clicked",
G_CALLBACK(on_full_clicked), NULL);
- replace_button_icon(full_btn, xpm_tree_view);
+ replace_button_icon(full_btn, "tree_view.xpm");
widget = GTK_WIDGET(gtk_builder_get_object(builder, "button7"));
g_signal_connect(widget, "clicked",
@@ -1269,7 +1280,17 @@ static void init_right_tree(void)
g_signal_connect(G_OBJECT(renderer), "edited",
G_CALLBACK(renderer_edited), tree2_w);
- pix_menu = gdk_pixbuf_new_from_xpm_data((const char **)xpm_menu);
+ char *env = getenv(SRCTREE);
+ gchar *path = g_strconcat(env ? env : g_get_current_dir(),
"/scripts/kconfig/icons/menu.xpm", NULL);
+ GError *err = NULL;
+
+ pix_menu = gdk_pixbuf_new_from_file(path, &err);
+ g_free(path);
+
+ if (err) {
+ g_warning("Failed to load menu icon: %s", err->message);
+ g_error_free(err);
+ }
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
diff --git a/scripts/kconfig/icons/choice_no.xpm
b/scripts/kconfig/icons/choice_no.xpm
new file mode 100644
index 000000000000..306e314ed9c6
--- /dev/null
+++ b/scripts/kconfig/icons/choice_no.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * choice_no_xpm[] = {
+"12 12 2 1",
+" c white",
+". c black",
+" ",
+" .... ",
+" .. .. ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" .. .. ",
+" .... ",
+" "
+};
diff --git a/scripts/kconfig/icons/choice_yes.xpm
b/scripts/kconfig/icons/choice_yes.xpm
new file mode 100644
index 000000000000..edeb91067379
--- /dev/null
+++ b/scripts/kconfig/icons/choice_yes.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * choice_yes_xpm[] = {
+"12 12 2 1",
+" c white",
+". c black",
+" ",
+" .... ",
+" .. .. ",
+" . . ",
+" . .. . ",
+" . .... . ",
+" . .... . ",
+" . .. . ",
+" . . ",
+" .. .. ",
+" .... ",
+" "
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
+" c white",
+". c black",
+" ",
+" .......... ",
+" . . ",
+" . .. . ",
+" . .... . ",
+" . ...... . ",
+" . ...... . ",
+" . .... . ",
+" . .. . ",
+" . . ",
+" .......... ",
+" "
+};
diff --git a/scripts/kconfig/icons/menuback.xpm
b/scripts/kconfig/icons/menuback.xpm
new file mode 100644
index 000000000000..f988c2c323c3
--- /dev/null
+++ b/scripts/kconfig/icons/menuback.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * menuback_xpm[] = {
+"12 12 2 1",
+" c white",
+". c black",
+" ",
+" .......... ",
+" . . ",
+" . .. . ",
+" . .... . ",
+" . ...... . ",
+" . ...... . ",
+" . .... . ",
+" . .. . ",
+" . . ",
+" .......... ",
+" "
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
diff --git a/scripts/kconfig/icons/single_view.xpm
b/scripts/kconfig/icons/single_view.xpm
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
diff --git a/scripts/kconfig/icons/split_view.xpm
b/scripts/kconfig/icons/split_view.xpm
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
diff --git a/scripts/kconfig/icons/symbol_mod.xpm
b/scripts/kconfig/icons/symbol_mod.xpm
new file mode 100644
index 000000000000..769465fcb0ce
--- /dev/null
+++ b/scripts/kconfig/icons/symbol_mod.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * symbol_mod_xpm[] = {
+"12 12 2 1",
+" c white",
+". c black",
+" ",
+" .......... ",
+" . . ",
+" . . ",
+" . .. . ",
+" . .... . ",
+" . .... . ",
+" . .. . ",
+" . . ",
+" . . ",
+" .......... ",
+" "
+};
diff --git a/scripts/kconfig/icons/symbol_no.xpm
b/scripts/kconfig/icons/symbol_no.xpm
new file mode 100644
index 000000000000..e4e9d46c9aca
--- /dev/null
+++ b/scripts/kconfig/icons/symbol_no.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * symbol_no_xpm[] = {
+"12 12 2 1",
+" c white",
+". c black",
+" ",
+" .......... ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" . . ",
+" .......... ",
+" "
+};
diff --git a/scripts/kconfig/icons/symbol_yes.xpm
b/scripts/kconfig/icons/symbol_yes.xpm
new file mode 100644
index 000000000000..dab7e10ae7a9
--- /dev/null
+++ b/scripts/kconfig/icons/symbol_yes.xpm
@@ -0,0 +1,18 @@
+/* XPM */
+static char * symbol_yes_xpm[] = {
+"12 12 2 1",
+" c white",
+". c black",
+" ",
+" .......... ",
+" . . ",
+" . . ",
+" . . . ",
+" . .. . ",
+" . . .. . ",
+" . .... . ",
+" . .. . ",
+" . . ",
+" .......... ",
+" "
+};
diff --git a/scripts/kconfig/icons/tree_view.xpm
b/scripts/kconfig/icons/tree_view.xpm
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
-" c white",
-". c black",
-" ",
-" .......... ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" .......... ",
-" "};
-
-const char * const xpm_symbol_mod[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" .......... ",
-" . . ",
-" . . ",
-" . .. . ",
-" . .... . ",
-" . .... . ",
-" . .. . ",
-" . . ",
-" . . ",
-" .......... ",
-" "};
-
-const char * const xpm_symbol_yes[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" .......... ",
-" . . ",
-" . . ",
-" . . . ",
-" . .. . ",
-" . . .. . ",
-" . .... . ",
-" . .. . ",
-" . . ",
-" .......... ",
-" "};
-
-const char * const xpm_choice_no[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" .... ",
-" .. .. ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" . . ",
-" .. .. ",
-" .... ",
-" "};
-
-const char * const xpm_choice_yes[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" .... ",
-" .. .. ",
-" . . ",
-" . .. . ",
-" . .... . ",
-" . .... . ",
-" . .. . ",
-" . . ",
-" .. .. ",
-" .... ",
-" "};
-
-const char * const xpm_menu[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" .......... ",
-" . . ",
-" . .. . ",
-" . .... . ",
-" . ...... . ",
-" . ...... . ",
-" . .... . ",
-" . .. . ",
-" . . ",
-" .......... ",
-" "};
-
-const char * const xpm_menu_inv[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" .......... ",
-" .......... ",
-" .. ...... ",
-" .. .... ",
-" .. .. ",
-" .. .. ",
-" .. .... ",
-" .. ...... ",
-" .......... ",
-" .......... ",
-" "};
-
-const char * const xpm_menuback[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" .......... ",
-" . . ",
-" . .. . ",
-" . .... . ",
-" . ...... . ",
-" . ...... . ",
-" . .... . ",
-" . .. . ",
-" . . ",
-" .......... ",
-" "};
-
-const char * const xpm_void[] = {
-"12 12 2 1",
-" c white",
-". c black",
-" ",
-" ",
-" ",
-" ",
-" ",
-" ",
-" ",
-" ",
-" ",
-" ",
-" ",
-" "};
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
- ConfigItem::symbolYesIcon = QIcon(QPixmap(xpm_symbol_yes));
- ConfigItem::symbolModIcon = QIcon(QPixmap(xpm_symbol_mod));
- ConfigItem::symbolNoIcon = QIcon(QPixmap(xpm_symbol_no));
- ConfigItem::choiceYesIcon = QIcon(QPixmap(xpm_choice_yes));
- ConfigItem::choiceNoIcon = QIcon(QPixmap(xpm_choice_no));
- ConfigItem::menuIcon = QIcon(QPixmap(xpm_menu));
- ConfigItem::menubackIcon = QIcon(QPixmap(xpm_menuback));
+ QString iconsDir = QString(getenv("SRCTREE") ? getenv("SRCTREE") :
QDir::currentPath()) + "/scripts/kconfig/icons/";
+ ConfigItem::symbolYesIcon = QIcon(QPixmap(iconsDir + "symbol_yes.xpm"));
+ ConfigItem::symbolModIcon = QIcon(QPixmap(iconsDir + "symbol_mod.xpm"));
+ ConfigItem::symbolNoIcon = QIcon(QPixmap(iconsDir + "symbol_no.xpm"));
+ ConfigItem::choiceYesIcon = QIcon(QPixmap(iconsDir + "choice_yes.xpm"));
+ ConfigItem::choiceNoIcon = QIcon(QPixmap(iconsDir + "choice_no.xpm"));
+ ConfigItem::menuIcon = QIcon(QPixmap(iconsDir + "menu.xpm"));
+ ConfigItem::menubackIcon = QIcon(QPixmap(iconsDir + "menuback.xpm"));
QWidget *widget = new QWidget(this);
setCentralWidget(widget);
@@ -1312,7 +1311,7 @@ ConfigMainWindow::ConfigMainWindow(void)
configList->setFocus();
- backAction = new QAction(QPixmap(xpm_back), "Back", this);
+ backAction = new QAction(QPixmap(iconsDir + "back.xpm"), "Back", this);
backAction->setShortcut(QKeySequence::Back);
connect(backAction, &QAction::triggered,
this, &ConfigMainWindow::goBack);
@@ -1322,12 +1321,12 @@ ConfigMainWindow::ConfigMainWindow(void)
connect(quitAction, &QAction::triggered,
this, &ConfigMainWindow::close);
- QAction *loadAction = new QAction(QPixmap(xpm_load), "&Open", this);
+ QAction *loadAction = new QAction(QPixmap(iconsDir + "load.xpm"),
"&Open", this);
loadAction->setShortcut(QKeySequence::Open);
connect(loadAction, &QAction::triggered,
this, &ConfigMainWindow::loadConfig);
- saveAction = new QAction(QPixmap(xpm_save), "&Save", this);
+ saveAction = new QAction(QPixmap(iconsDir + "save.xpm"), "&Save", this);
saveAction->setShortcut(QKeySequence::Save);
connect(saveAction, &QAction::triggered,
this, &ConfigMainWindow::saveConfig);
@@ -1344,15 +1343,15 @@ ConfigMainWindow::ConfigMainWindow(void)
searchAction->setShortcut(QKeySequence::Find);
connect(searchAction, &QAction::triggered,
this, &ConfigMainWindow::searchConfig);
- singleViewAction = new QAction(QPixmap(xpm_single_view), "Single View", this);
+ singleViewAction = new QAction(QPixmap(iconsDir +
"single_view.xpm"), "Single View", this);
singleViewAction->setCheckable(true);
connect(singleViewAction, &QAction::triggered,
this, &ConfigMainWindow::showSingleView);
- splitViewAction = new QAction(QPixmap(xpm_split_view), "Split View", this);
+ splitViewAction = new QAction(QPixmap(iconsDir + "split_view.xpm"),
"Split View", this);
splitViewAction->setCheckable(true);
connect(splitViewAction, &QAction::triggered,
this, &ConfigMainWindow::showSplitView);
- fullViewAction = new QAction(QPixmap(xpm_tree_view), "Full View", this);
+ fullViewAction = new QAction(QPixmap(iconsDir + "tree_view.xpm"),
"Full View", this);
fullViewAction->setCheckable(true);
connect(fullViewAction, &QAction::triggered,
this, &ConfigMainWindow::showFullView);
-- 
2.52.0

