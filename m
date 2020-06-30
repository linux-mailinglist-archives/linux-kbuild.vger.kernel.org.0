Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 150EF20EE56
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730080AbgF3G1B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:27:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730052AbgF3G0r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:26:47 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0475207E8;
        Tue, 30 Jun 2020 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593498405;
        bh=Z4lp7oXZkaDyzU+Sb4qdG0t7/jfmzRI6xblJHILJBbw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RQFCOKdmTS9UzNRZnfPRvPJAHjb1lzCaveSNoz+PIAU/JWjFIetBtEtDkfNNFEZoD
         Xtokq7iRcvx64dq26IpKEmVldK1LwZTPqQA/1LQrpIHQsALyyIn6G7pyikj5nWM+QY
         kr8gouIqVKlMdL8zkelmGvlK6dEies40qUWf/RlU=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jq9j9-008Wb6-Sf; Tue, 30 Jun 2020 08:26:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] kconfig: qconf: simplify the goBack() logic
Date:   Tue, 30 Jun 2020 08:26:39 +0200
Message-Id: <3e99a592ce50886f8748db2565cc80765f66009f.1593498345.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593498345.git.mchehab+huawei@kernel.org>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The goBack() logic is used only for the configList, as
it only makes sense on singleMode. So, let's simplify the
code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 50 +++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 29ca4823cfb9..e43fe4dcd4e7 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1455,18 +1455,22 @@ ConfigMainWindow::ConfigMainWindow(void)
 	addToolBar(toolBar);
 
 	backAction = new QAction(QPixmap(xpm_back), "Back", this);
-	  connect(backAction, SIGNAL(triggered(bool)), SLOT(goBack()));
-	  backAction->setEnabled(false);
+	connect(backAction, SIGNAL(triggered(bool)), SLOT(goBack()));
+
 	QAction *quitAction = new QAction("&Quit", this);
 	quitAction->setShortcut(Qt::CTRL + Qt::Key_Q);
-	  connect(quitAction, SIGNAL(triggered(bool)), SLOT(close()));
+	connect(quitAction, SIGNAL(triggered(bool)), SLOT(close()));
+
 	QAction *loadAction = new QAction(QPixmap(xpm_load), "&Load", this);
 	loadAction->setShortcut(Qt::CTRL + Qt::Key_L);
-	  connect(loadAction, SIGNAL(triggered(bool)), SLOT(loadConfig()));
+	connect(loadAction, SIGNAL(triggered(bool)), SLOT(loadConfig()));
+
 	saveAction = new QAction(QPixmap(xpm_save), "&Save", this);
 	saveAction->setShortcut(Qt::CTRL + Qt::Key_S);
-	  connect(saveAction, SIGNAL(triggered(bool)), SLOT(saveConfig()));
+	connect(saveAction, SIGNAL(triggered(bool)), SLOT(saveConfig()));
+
 	conf_set_changed_callback(conf_changed);
+
 	// Set saveAction's initial state
 	conf_changed();
 	configname = xstrdup(conf_get_configname());
@@ -1667,21 +1671,11 @@ void ConfigMainWindow::searchConfig(void)
 void ConfigMainWindow::changeItens(struct menu *menu)
 {
 	configList->setRootMenu(menu);
-
-	if (configList->rootEntry->parent == &rootmenu)
-		backAction->setEnabled(false);
-	else
-		backAction->setEnabled(true);
 }
 
 void ConfigMainWindow::changeMenu(struct menu *menu)
 {
 	menuList->setRootMenu(menu);
-
-	if (menuList->rootEntry->parent == &rootmenu)
-		backAction->setEnabled(false);
-	else
-		backAction->setEnabled(true);
 }
 
 void ConfigMainWindow::setMenuLink(struct menu *menu)
@@ -1748,25 +1742,11 @@ void ConfigMainWindow::listFocusChanged(void)
 
 void ConfigMainWindow::goBack(void)
 {
-	ConfigItem* item, *oldSelection;
+qInfo() << __FUNCTION__;
+	if (configList->rootEntry == &rootmenu)
+		return;
 
 	configList->setParentMenu();
-	if (configList->rootEntry == &rootmenu)
-		backAction->setEnabled(false);
-
-	if (menuList->selectedItems().count() == 0)
-		return;
-
-	item = (ConfigItem*)menuList->selectedItems().first();
-	oldSelection = item;
-	while (item) {
-		if (item->menu == configList->rootEntry) {
-			oldSelection->setSelected(false);
-			item->setSelected(true);
-			break;
-		}
-		item = (ConfigItem*)item->parent();
-	}
 }
 
 void ConfigMainWindow::showSingleView(void)
@@ -1778,6 +1758,8 @@ void ConfigMainWindow::showSingleView(void)
 	fullViewAction->setEnabled(true);
 	fullViewAction->setChecked(false);
 
+	backAction->setEnabled(true);
+
 	menuView->hide();
 	menuList->setRootMenu(0);
 	configList->mode = singleMode;
@@ -1797,6 +1779,8 @@ void ConfigMainWindow::showSplitView(void)
 	fullViewAction->setEnabled(true);
 	fullViewAction->setChecked(false);
 
+	backAction->setEnabled(false);
+
 	configList->mode = menuMode;
 	if (configList->rootEntry == &rootmenu)
 		configList->updateListAll();
@@ -1820,6 +1804,8 @@ void ConfigMainWindow::showFullView(void)
 	fullViewAction->setEnabled(false);
 	fullViewAction->setChecked(true);
 
+	backAction->setEnabled(false);
+
 	menuView->hide();
 	menuList->setRootMenu(0);
 	configList->mode = fullMode;
-- 
2.26.2

