Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6060C297C60
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Oct 2020 14:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761432AbgJXMkL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Oct 2020 08:40:11 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:60871 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761412AbgJXMkK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Oct 2020 08:40:10 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 09OCdV8B029147;
        Sat, 24 Oct 2020 21:39:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 09OCdV8B029147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603543174;
        bh=xLue+HfW+QXnRbj2mE7Vu+fs5nylPe0Q2QCh2NJGJ8Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nH3jDh6/xn177Of6HPh5a22KOj6eXT5qftAbv4XvtiZ0+PIeNJcFLHvjhLI+4Yc9+
         AGHWvr3R9jE2t9Qe/HluONvtbkY9GozaWVOfTlMII+yug8fRH/ufxVpL1UUGPNptYQ
         mcmgCuCgTk1QZWO+SjYnZcHaUqVn1FgHMosXLu6+rCuCRHm/tICYiyquoDFEXRQy5R
         fXYjSMjZPV8dKyoUDnztCjK693Z2I9sbbv36K1jkPUx/XPuj5oFPCnr1/jNZhppQvO
         X3xXXjNuYJSdzEa1DDm+Yi5lBTXMGAsGJFVzr1YsUTjb696pt7PcBhc1wcgKA77YPJ
         3gZgI3pJ3SwmA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kconfig: qconf: convert to Qt5 new signal/slot connection syntax
Date:   Sat, 24 Oct 2020 21:38:41 +0900
Message-Id: <20201024123841.1201922-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024123841.1201922-1-masahiroy@kernel.org>
References: <20201024123841.1201922-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that the Qt4 support was dropped, we can use the new connection
syntax supported by Qt5. It provides compile-time checking of the
validity of the connection.

Previously, the connection between signals and slots were checked
only run-time.

Commit d85de3399f97 ("kconfig: qconf: fix signal connection to invalid
slots") fixed wrong slots.

This change makes it possible to catch such mistakes easily.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 136 ++++++++++++++++++++++-----------------
 1 file changed, 78 insertions(+), 58 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f7eb093614f2..cbe749b44b1a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -310,15 +310,16 @@ ConfigList::ConfigList(QWidget *parent, const char *name)
 
 	setHeaderLabels(QStringList() << "Option" << "Name" << "Value");
 
-	connect(this, SIGNAL(itemSelectionChanged(void)),
-		SLOT(updateSelection(void)));
+	connect(this, &ConfigList::itemSelectionChanged,
+		this, &ConfigList::updateSelection);
 
 	if (name) {
 		configSettings->beginGroup(name);
 		showName = configSettings->value("/showName", false).toBool();
 		optMode = (enum optionMode)configSettings->value("/optionMode", 0).toInt();
 		configSettings->endGroup();
-		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
+		connect(configApp, &QApplication::aboutToQuit,
+			this, &ConfigList::saveSettings);
 	}
 
 	showColumn(promptColIdx);
@@ -888,10 +889,10 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 		headerPopup = new QMenu(this);
 		action = new QAction("Show Name", this);
 		action->setCheckable(true);
-		connect(action, SIGNAL(toggled(bool)),
-			SLOT(setShowName(bool)));
-		connect(this, SIGNAL(showNameChanged(bool)),
-			action, SLOT(setChecked(bool)));
+		connect(action, &QAction::toggled,
+			this, &ConfigList::setShowName);
+		connect(this, &ConfigList::showNameChanged,
+			action, &QAction::setChecked);
 		action->setChecked(showName);
 		headerPopup->addAction(action);
 	}
@@ -936,15 +937,18 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
 		configSettings->beginGroup(objectName());
 		setShowDebug(configSettings->value("/showDebug", false).toBool());
 		configSettings->endGroup();
-		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
+		connect(configApp, &QApplication::aboutToQuit,
+			this, &ConfigInfoView::saveSettings);
 	}
 
 	contextMenu = createStandardContextMenu();
 	QAction *action = new QAction("Show Debug Info", contextMenu);
 
 	action->setCheckable(true);
-	connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
-	connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setChecked(bool)));
+	connect(action, &QAction::toggled,
+		this, &ConfigInfoView::setShowDebug);
+	connect(this, &ConfigInfoView::showDebugChanged,
+		action, &QAction::setChecked);
 	action->setChecked(showDebug());
 	contextMenu->addSeparator();
 	contextMenu->addAction(action);
@@ -1231,11 +1235,13 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 	layout2->setSpacing(6);
 	layout2->addWidget(new QLabel("Find:", this));
 	editField = new QLineEdit(this);
-	connect(editField, SIGNAL(returnPressed()), SLOT(search()));
+	connect(editField, &QLineEdit::returnPressed,
+		this, &ConfigSearchWindow::search);
 	layout2->addWidget(editField);
 	searchButton = new QPushButton("Search", this);
 	searchButton->setAutoDefault(false);
-	connect(searchButton, SIGNAL(clicked()), SLOT(search()));
+	connect(searchButton, &QPushButton::clicked,
+		this, &ConfigSearchWindow::search);
 	layout2->addWidget(searchButton);
 	layout1->addLayout(layout2);
 
@@ -1244,10 +1250,10 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 	list = new ConfigList(split, "search");
 	list->mode = listMode;
 	info = new ConfigInfoView(split, "search");
-	connect(list, SIGNAL(menuChanged(struct menu *)),
-		info, SLOT(setInfo(struct menu *)));
-	connect(list, SIGNAL(menuChanged(struct menu *)),
-		parent, SLOT(setMenuLink(struct menu *)));
+	connect(list, &ConfigList::menuChanged,
+		info, &ConfigInfoView::setInfo);
+	connect(list, &ConfigList::menuChanged,
+		parent, &ConfigMainWindow::setMenuLink);
 
 	layout1->addWidget(split);
 
@@ -1267,7 +1273,8 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 	if (ok)
 		split->setSizes(sizes);
 	configSettings->endGroup();
-	connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
+	connect(configApp, &QApplication::aboutToQuit,
+		this, &ConfigSearchWindow::saveSettings);
 }
 
 void ConfigSearchWindow::saveSettings(void)
@@ -1367,19 +1374,23 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configList->setFocus();
 
 	backAction = new QAction(QPixmap(xpm_back), "Back", this);
-	connect(backAction, SIGNAL(triggered(bool)), SLOT(goBack()));
+	connect(backAction, &QAction::triggered,
+		this, &ConfigMainWindow::goBack);
 
 	QAction *quitAction = new QAction("&Quit", this);
 	quitAction->setShortcut(Qt::CTRL + Qt::Key_Q);
-	connect(quitAction, SIGNAL(triggered(bool)), SLOT(close()));
+	connect(quitAction, &QAction::triggered,
+		this, &ConfigMainWindow::close);
 
 	QAction *loadAction = new QAction(QPixmap(xpm_load), "&Load", this);
 	loadAction->setShortcut(Qt::CTRL + Qt::Key_L);
-	connect(loadAction, SIGNAL(triggered(bool)), SLOT(loadConfig()));
+	connect(loadAction, &QAction::triggered,
+		this, &ConfigMainWindow::loadConfig);
 
 	saveAction = new QAction(QPixmap(xpm_save), "&Save", this);
 	saveAction->setShortcut(Qt::CTRL + Qt::Key_S);
-	connect(saveAction, SIGNAL(triggered(bool)), SLOT(saveConfig()));
+	connect(saveAction, &QAction::triggered,
+		this, &ConfigMainWindow::saveConfig);
 
 	conf_set_changed_callback(conf_changed);
 
@@ -1388,31 +1399,37 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configname = xstrdup(conf_get_configname());
 
 	QAction *saveAsAction = new QAction("Save &As...", this);
-	  connect(saveAsAction, SIGNAL(triggered(bool)), SLOT(saveConfigAs()));
+	connect(saveAsAction, &QAction::triggered,
+		this, &ConfigMainWindow::saveConfigAs);
 	QAction *searchAction = new QAction("&Find", this);
 	searchAction->setShortcut(Qt::CTRL + Qt::Key_F);
-	  connect(searchAction, SIGNAL(triggered(bool)), SLOT(searchConfig()));
+	connect(searchAction, &QAction::triggered,
+		this, &ConfigMainWindow::searchConfig);
 	singleViewAction = new QAction(QPixmap(xpm_single_view), "Single View", this);
 	singleViewAction->setCheckable(true);
-	  connect(singleViewAction, SIGNAL(triggered(bool)), SLOT(showSingleView()));
+	connect(singleViewAction, &QAction::triggered,
+		this, &ConfigMainWindow::showSingleView);
 	splitViewAction = new QAction(QPixmap(xpm_split_view), "Split View", this);
 	splitViewAction->setCheckable(true);
-	  connect(splitViewAction, SIGNAL(triggered(bool)), SLOT(showSplitView()));
+	connect(splitViewAction, &QAction::triggered,
+		this, &ConfigMainWindow::showSplitView);
 	fullViewAction = new QAction(QPixmap(xpm_tree_view), "Full View", this);
 	fullViewAction->setCheckable(true);
-	  connect(fullViewAction, SIGNAL(triggered(bool)), SLOT(showFullView()));
+	connect(fullViewAction, &QAction::triggered,
+		this, &ConfigMainWindow::showFullView);
 
 	QAction *showNameAction = new QAction("Show Name", this);
 	  showNameAction->setCheckable(true);
-	connect(showNameAction, SIGNAL(toggled(bool)), configList, SLOT(setShowName(bool)));
+	connect(showNameAction, &QAction::toggled,
+		configList, &ConfigList::setShowName);
 	showNameAction->setChecked(configList->showName);
 
 	QActionGroup *optGroup = new QActionGroup(this);
 	optGroup->setExclusive(true);
-	connect(optGroup, SIGNAL(triggered(QAction*)), configList,
-		SLOT(setOptionMode(QAction *)));
-	connect(optGroup, SIGNAL(triggered(QAction *)), menuList,
-		SLOT(setOptionMode(QAction *)));
+	connect(optGroup, &QActionGroup::triggered,
+		configList, &ConfigList::setOptionMode);
+	connect(optGroup, &QActionGroup::triggered,
+		menuList, &ConfigList::setOptionMode);
 
 	ConfigList::showNormalAction = new QAction("Show Normal Options", optGroup);
 	ConfigList::showNormalAction->setCheckable(true);
@@ -1423,13 +1440,16 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	QAction *showDebugAction = new QAction("Show Debug Info", this);
 	  showDebugAction->setCheckable(true);
-	  connect(showDebugAction, SIGNAL(toggled(bool)), helpText, SLOT(setShowDebug(bool)));
+	connect(showDebugAction, &QAction::toggled,
+		helpText, &ConfigInfoView::setShowDebug);
 	  showDebugAction->setChecked(helpText->showDebug());
 
 	QAction *showIntroAction = new QAction("Introduction", this);
-	  connect(showIntroAction, SIGNAL(triggered(bool)), SLOT(showIntro()));
+	connect(showIntroAction, &QAction::triggered,
+		this, &ConfigMainWindow::showIntro);
 	QAction *showAboutAction = new QAction("About", this);
-	  connect(showAboutAction, SIGNAL(triggered(bool)), SLOT(showAbout()));
+	connect(showAboutAction, &QAction::triggered,
+		this, &ConfigMainWindow::showAbout);
 
 	// init tool bar
 	QToolBar *toolBar = addToolBar("Tools");
@@ -1467,30 +1487,30 @@ ConfigMainWindow::ConfigMainWindow(void)
 	menu->addAction(showIntroAction);
 	menu->addAction(showAboutAction);
 
-	connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
-		 helpText, SLOT (clicked (const QUrl &)) );
-
-	connect(configList, SIGNAL(menuChanged(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(configList, SIGNAL(menuSelected(struct menu *)),
-		SLOT(changeMenu(struct menu *)));
-	connect(configList, SIGNAL(itemSelected(struct menu *)),
-		SLOT(changeItens(struct menu *)));
-	connect(configList, SIGNAL(parentSelected()),
-		SLOT(goBack()));
-	connect(menuList, SIGNAL(menuChanged(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(menuList, SIGNAL(menuSelected(struct menu *)),
-		SLOT(changeMenu(struct menu *)));
-
-	connect(configList, SIGNAL(gotFocus(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(menuList, SIGNAL(gotFocus(struct menu *)),
-		helpText, SLOT(setInfo(struct menu *)));
-	connect(menuList, SIGNAL(gotFocus(struct menu *)),
-		SLOT(listFocusChanged(void)));
-	connect(helpText, SIGNAL(menuSelected(struct menu *)),
-		SLOT(setMenuLink(struct menu *)));
+	connect(helpText, &ConfigInfoView::anchorClicked,
+		helpText, &ConfigInfoView::clicked);
+
+	connect(configList, &ConfigList::menuChanged,
+		helpText, &ConfigInfoView::setInfo);
+	connect(configList, &ConfigList::menuSelected,
+		this, &ConfigMainWindow::changeMenu);
+	connect(configList, &ConfigList::itemSelected,
+		this, &ConfigMainWindow::changeItens);
+	connect(configList, &ConfigList::parentSelected,
+		this, &ConfigMainWindow::goBack);
+	connect(menuList, &ConfigList::menuChanged,
+		helpText, &ConfigInfoView::setInfo);
+	connect(menuList, &ConfigList::menuSelected,
+		this, &ConfigMainWindow::changeMenu);
+
+	connect(configList, &ConfigList::gotFocus,
+		helpText, &ConfigInfoView::setInfo);
+	connect(menuList, &ConfigList::gotFocus,
+		helpText, &ConfigInfoView::setInfo);
+	connect(menuList, &ConfigList::gotFocus,
+		this, &ConfigMainWindow::listFocusChanged);
+	connect(helpText, &ConfigInfoView::menuSelected,
+		this, &ConfigMainWindow::setMenuLink);
 
 	QString listMode = configSettings->value("/listMode", "symbol").toString();
 	if (listMode == "single")
-- 
2.25.1

