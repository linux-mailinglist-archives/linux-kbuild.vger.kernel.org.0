Return-Path: <linux-kbuild+bounces-1973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1E8D7182
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 20:21:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A52A71C20D01
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224A815534C;
	Sat,  1 Jun 2024 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vg67uHb3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D0155348;
	Sat,  1 Jun 2024 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266056; cv=none; b=JkQI2ePfECe27eo4d4GJrNIQiXPHJ6FDPEoUa4g5w/edZbjaO/XZV0IOLN56R/0Lc7NIEezYT3ZaR/aEAac28mDPWXaDO0Sf4z145mB+9YnKtb9OLN7cqx/zzpm07Qb6jZxziVjFw4O/B+/5wNVCuiZ1V3sFgVZYSg8G7pCoAkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266056; c=relaxed/simple;
	bh=kC1jc3prKdtA/LgosSTF/JuJoDdO9UUh+Y3Hw0pC3Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GXvcJKSrkkTSK8VdmsjplhE2MtHTD8/XAFP5hBVRYnhpk6f9PdV5KmGQhzLCEXh3V/UFXcyFO9+PjHtDJohWP+APzAv5Ey8aMAJMULz28ebMLs3Xfna8WHgFYL/EQvkW6acJJ2+st1X4Ooun5zqIAiuMaxuVbfjjiuvqXz9hHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vg67uHb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15CCC4AF08;
	Sat,  1 Jun 2024 18:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717266055;
	bh=kC1jc3prKdtA/LgosSTF/JuJoDdO9UUh+Y3Hw0pC3Mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vg67uHb3e6ApuZockC+sUyc0WOdFnzWF6d78gAUgF/OOw41DV5Eyp6u+D3TBz5D1b
	 mbgRd8u5HBT5Zue98gtwIxiRXKBNfOqc7Pn3Yz5KDRd16DnHszHRBGaB2atOAqm17W
	 InU/3k5RvsYQ+8zCjpQ8Oo+AUmCKmF7H48eIpVzfNxuq31AB6wxLPok1eSnl+FpvWe
	 3uHsDfAtME7WqmqEBaw5paw+JJhpO7lMsyZpCzGY5d6gNycoRFFGzYeNv+BuWOVYhm
	 RayQCs0a3ro20wlofLJI4+bbYhXY5qvuDh0dOC1WE1ZOarpfWWnUTLKdLxTJ1RJdmU
	 spT/rZ/46KKUw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 6/6] kconfig: pass new the conf_changed value to the callback
Date: Sun,  2 Jun 2024 03:20:43 +0900
Message-Id: <20240601182043.876249-6-masahiroy@kernel.org>
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

Commit ee06a3ef7e3c ("kconfig: Update config changed flag before calling
callback") pointed out that conf_updated flag must be updated before
calling the callback because it needs to know the new value.

If so, it makes sense to pass the new value to the callback.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c  | 10 ++++------
 scripts/kconfig/gconf.c     |  7 +++----
 scripts/kconfig/lkc_proto.h |  2 +-
 scripts/kconfig/qconf.cc    |  4 ++--
 scripts/kconfig/qconf.h     |  2 +-
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 85b53069ba7a..946185506380 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1141,16 +1141,14 @@ int conf_write_autoconf(int overwrite)
 }
 
 static bool conf_changed;
-static void (*conf_changed_callback)(void);
+static void (*conf_changed_callback)(bool);
 
 void conf_set_changed(bool val)
 {
-	bool changed = conf_changed != val;
+	if (conf_changed_callback && conf_changed != val)
+		conf_changed_callback(val);
 
 	conf_changed = val;
-
-	if (conf_changed_callback && changed)
-		conf_changed_callback();
 }
 
 bool conf_get_changed(void)
@@ -1158,7 +1156,7 @@ bool conf_get_changed(void)
 	return conf_changed;
 }
 
-void conf_set_changed_callback(void (*fn)(void))
+void conf_set_changed_callback(void (*fn)(bool))
 {
 	conf_changed_callback = fn;
 }
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 2bf74aee5eff..baa1c512de3c 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -84,11 +84,10 @@ static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
 	gtk_tool_button_set_icon_widget(button, image);
 }
 
-static void conf_changed(void)
+static void conf_changed(bool dirty)
 {
-	bool changed = conf_get_changed();
-	gtk_widget_set_sensitive(save_btn, changed);
-	gtk_widget_set_sensitive(save_menu_item, changed);
+	gtk_widget_set_sensitive(save_btn, dirty);
+	gtk_widget_set_sensitive(save_menu_item, dirty);
 }
 
 /* Main Window Initialization */
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index d76aaf4ea117..c663fd8b35d2 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -13,7 +13,7 @@ int conf_write(const char *name);
 int conf_write_autoconf(int overwrite);
 void conf_set_changed(bool val);
 bool conf_get_changed(void);
-void conf_set_changed_callback(void (*fn)(void));
+void conf_set_changed_callback(void (*fn)(bool));
 void conf_set_message_callback(void (*fn)(const char *s));
 bool conf_errors(void);
 
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index e62e862ea283..03fa096074b4 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1849,10 +1849,10 @@ void ConfigMainWindow::saveSettings(void)
 	configSettings->writeSizes("/split2", split2->sizes());
 }
 
-void ConfigMainWindow::conf_changed(void)
+void ConfigMainWindow::conf_changed(bool dirty)
 {
 	if (saveAction)
-		saveAction->setEnabled(conf_get_changed());
+		saveAction->setEnabled(dirty);
 }
 
 void fixup_rootmenu(struct menu *menu)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 78b0a1dfcd53..53373064d90a 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -239,7 +239,7 @@ class ConfigMainWindow : public QMainWindow {
 
 	char *configname;
 	static QAction *saveAction;
-	static void conf_changed(void);
+	static void conf_changed(bool);
 public:
 	ConfigMainWindow(void);
 public slots:
-- 
2.40.1


