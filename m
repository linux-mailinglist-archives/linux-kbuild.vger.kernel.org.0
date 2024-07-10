Return-Path: <linux-kbuild+bounces-2458-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 906CA92CB6E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 08:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9851B1C22652
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 06:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FA81272A7;
	Wed, 10 Jul 2024 06:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE9BC5+Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D6684D10;
	Wed, 10 Jul 2024 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594490; cv=none; b=oYllZyOW2t19RZLfzHLgbw7MXXWY/Kn6CqwzY2ng4BRUQWngwGql/DJB2qfcqn+gIxsns9HBmafIPmEXHrRIB75L6HReOW5Yi3ApT/wT7bfGItl+3YflFxrFNC7gbCY6v30M+9Els2yeHd6ZIif9aZfWZ4LKMY+KT3YUs+p/w+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594490; c=relaxed/simple;
	bh=eE6kwwaimB5RYAjZPlQSf8gzYv1dHn78EcD86LQMjGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DosZhPWy4HApA1p1v00J4h1p5UWtAOgymk/5FtONZN2q1Lniba55xCtE9qOA+eq/qDWwlVM6lXrT6uH/ixC2PnWufL0ZGrF+qrZYwxEzUILdV3slsxlzV/82yjSWV8uzZxm/u9HnwUI34IHd3GK2CJpekEEaj3nN9Y+3irPq0L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE9BC5+Y; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-58ba3e38028so7585404a12.0;
        Tue, 09 Jul 2024 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594485; x=1721199285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z45113346TfU/PYZcyxCx2fwuoLndYbTrwfmraUfJ2o=;
        b=BE9BC5+YkqZJWlOmvcwQWZk6VWOOzBVo9+8BvEnFLpkrs82m09NnI0fmsiKyXnttsg
         H7YZNOz3XFXpVrbdJIesawmATacyAippwhfjZIQG5BJYZ+zhuzfKZanRVJC80+Fbt8nr
         tBxnCQukRtxJ+PpLXA4Y89p9W9kzsfhxDVuwtzuazrTTPu4cThb+gaSpyhx0OSNRqDt1
         6jTzQpCBi9H5XUzdRam5oG4l/drX/KN9i0ADjOh4kVNoyvDsXzUGzC1Tp4kZhV6qNlKf
         Hu5uecaZ/xEB324Xe9Ud6sM+UaSfs8eEiEum+asDcbqEJ5siyHB8O+LcVMuZtTkXzPQD
         4Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594485; x=1721199285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z45113346TfU/PYZcyxCx2fwuoLndYbTrwfmraUfJ2o=;
        b=cxt0gVQz62AawDL6ol0KiRxMJT2WjY+Y4uhtIn2ud5mIU6GViJZ1yLoC3WrMqWbiZp
         PuAvp5kd0Vk/k/ieRMnzr+3BJRLYrrhGoZQNVTXZZczEgBy1v/nBY8FgQiav1cRLOKvd
         refh5LeZUqTjHDl3ynp7N6DSw6jb0OYuDHi8aWMrs3uNYzV2pf7YGglcFS1NXQtffNQo
         j9H7Eddgs0zaV537Hx6TLCflpBINKVakuf/uUjn3777KQvt7MqwL1JN6EYzTxKs98U/4
         rgJrnNDNc/hTxpTg0qyOSY7ReyJ9UDIJuFCng3iRB86xvzPzHuzzEk1qLPvZmn3CGrri
         vRJg==
X-Forwarded-Encrypted: i=1; AJvYcCXfygJRrM0BCbEKNEDS+Y7bbhxaI3KK1osR2Bx6NrTVxh7JxXPpL6ZnSrDpLoLPit+D18KV8Tx1CAKTt4oyuXwKsb1WbbDP95mWJyZg
X-Gm-Message-State: AOJu0YzF9F6bbHafMQNNGnP+YKCNBpHTSdejESb9JBlp8orGAP1D6sRQ
	6UrCN4ewzzUOaXKgVh51yRuiz7qEUo7vRo9SQjxhWCNdcgNqEABu2ib8LQ==
X-Google-Smtp-Source: AGHT+IEG96msI0r8Fd7cTip+ItV8KktVXjM+bzUL/c33wcIYwo2TUVf2IrzPV4vYVSGiiqd5QUfIlA==
X-Received: by 2002:aa7:d686:0:b0:594:4d8d:8cc6 with SMTP id 4fb4d7f45d1cf-594bbe2bbdcmr2378780a12.40.1720594485043;
        Tue, 09 Jul 2024 23:54:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20::c7d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-594bc7c8a39sm1894590a12.55.2024.07.09.23.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:54:44 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/12] kconfig: Add xconfig-modifications
Date: Wed, 10 Jul 2024 08:52:54 +0200
Message-Id: <20240710065255.10338-12-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710065255.10338-1-ole0811sch@gmail.com>
References: <20240710065255.10338-1-ole0811sch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tool can be called from any configurator. We chose to modify xconfig
for this purpose. These files contain the necessary modifications to
xconfig in order to resolve conflicts.

Co-developed-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Patrick Franz <deltaone@debian.org>
Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
Suggested-by: Sarah Nadi <nadi@ualberta.ca>
Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
---
 scripts/kconfig/qconf.cc | 515 ++++++++++++++++++++++++++++++++++++++-
 scripts/kconfig/qconf.h  | 103 ++++++++
 2 files changed, 616 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 7d239c032b3d..20ca9936d592 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -3,7 +3,7 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  * Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>
  */
-
+#include "qnamespace.h"
 #include <QAction>
 #include <QActionGroup>
 #include <QApplication>
@@ -19,14 +19,27 @@
 #include <QRegularExpression>
 #include <QScreen>
 #include <QToolBar>
+#include <QListWidget>
+#include <QComboBox>
+#include <QTableWidget>
+#include <QHBoxLayout>
+#include <QMovie>
+#include <QMessageBox>
 
 #include <stdlib.h>
+#include <QAbstractItemView>
+#include <QMimeData>
+#include <QBrush>
+#include <QColor>
 
 #include "lkc.h"
 #include "qconf.h"
+#include "configfix.h"
 
 #include "images.h"
 
+static QString tristate_value_to_string(tristate val);
+static tristate string_value_to_tristate(QString s);
 
 static QApplication *configApp;
 static ConfigSettings *configSettings;
@@ -178,6 +191,7 @@ void ConfigItem::updateMenu(void)
 		prompt += " (NEW)";
 set_prompt:
 	setText(promptColIdx, prompt);
+
 }
 
 void ConfigItem::testUpdateMenu(bool v)
@@ -225,6 +239,7 @@ void ConfigItem::init(void)
 		}
 	}
 	updateMenu();
+
 }
 
 /*
@@ -405,7 +420,7 @@ void ConfigList::updateSelection(void)
 	ConfigItem* item = (ConfigItem*)selectedItems().first();
 	if (!item)
 		return;
-
+	emit selectionChanged(selectedItems());
 	menu = item->menu;
 	emit menuChanged(menu);
 	if (!menu)
@@ -471,6 +486,7 @@ void ConfigList::updateListForAll()
 
 		list->updateList();
 	}
+
 }
 
 void ConfigList::updateListAllForAll()
@@ -539,6 +555,7 @@ void ConfigList::changeValue(ConfigItem* item)
 		}
 		if (oldexpr != newexpr)
 			ConfigList::updateListForAll();
+			emit updateConflictsViewColorization();
 		break;
 	default:
 		break;
@@ -898,6 +915,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 			action, &QAction::setChecked);
 		action->setChecked(showName);
 		headerPopup->addAction(action);
+		headerPopup->addAction(addSymbolFromContextMenu);
 	}
 
 	headerPopup->exec(e->globalPos());
@@ -918,6 +936,7 @@ QList<ConfigList *> ConfigList::allLists;
 QAction *ConfigList::showNormalAction;
 QAction *ConfigList::showAllAction;
 QAction *ConfigList::showPromptAction;
+QAction *ConfigList::addSymbolFromContextMenu;
 
 void ConfigList::setAllOpen(bool open)
 {
@@ -1249,7 +1268,10 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 		info, &ConfigInfoView::setInfo);
 	connect(list, &ConfigList::menuChanged,
 		parent, &ConfigMainWindow::setMenuLink);
+	connect(list, &ConfigList::menuChanged,
+		parent, &ConfigMainWindow::conflictSelected);
 
+	connect(list,&ConfigList::updateConflictsViewColorization,this,&ConfigSearchWindow::updateConflictsViewColorizationFowarder);
 	layout1->addWidget(split);
 
 	QVariant x, y;
@@ -1272,6 +1294,10 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 		this, &ConfigSearchWindow::saveSettings);
 }
 
+void ConfigSearchWindow::updateConflictsViewColorizationFowarder(void){
+	emit updateConflictsViewColorization();
+}
+
 void ConfigSearchWindow::saveSettings(void)
 {
 	if (!objectName().isEmpty()) {
@@ -1364,6 +1390,17 @@ ConfigMainWindow::ConfigMainWindow(void)
 	split1->addWidget(configList);
 	split1->addWidget(menuList);
 	split2->addWidget(helpText);
+	split3 = new QSplitter(split2);
+	split3->setOrientation(Qt::Vertical);
+	conflictsView = new ConflictsView(split3, "help");
+	/* conflictsSelected signal in conflictsview triggers when a conflict is selected
+		 in the view. this line connects that event to conflictselected event in mainwindow
+		 which updates the selection to match (in the configlist) the symbol that was selected.
+	*/
+	connect(conflictsView,SIGNAL(conflictSelected(struct menu *)),SLOT(conflictSelected(struct menu *)));
+	connect(conflictsView,SIGNAL(refreshMenu()),SLOT(refreshMenu()));
+	connect(menuList,SIGNAL(updateConflictsViewColorization()),conflictsView,SLOT(updateConflictsViewColorization()));
+	connect(configList,SIGNAL(updateConflictsViewColorization()),conflictsView,SLOT(updateConflictsViewColorization()));
 
 	setTabOrder(configList, helpText);
 	configList->setFocus();
@@ -1430,6 +1467,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 	ConfigList::showAllAction->setCheckable(true);
 	ConfigList::showPromptAction = new QAction("Show Prompt Options", optGroup);
 	ConfigList::showPromptAction->setCheckable(true);
+	ConfigList::addSymbolFromContextMenu = new QAction("Add symbol from context menu");
+	connect(ConfigList::addSymbolFromContextMenu, &QAction::triggered, conflictsView, &ConflictsView::addSymbol);
 
 	QAction *showDebugAction = new QAction("Show Debug Info", this);
 	  showDebugAction->setCheckable(true);
@@ -1485,6 +1524,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	connect(configList, &ConfigList::menuChanged,
 		helpText, &ConfigInfoView::setInfo);
+	connect(configList, &ConfigList::menuChanged,
+		conflictsView, &ConflictsView::menuChanged);
 	connect(configList, &ConfigList::menuSelected,
 		this, &ConfigMainWindow::changeMenu);
 	connect(configList, &ConfigList::itemSelected,
@@ -1493,6 +1534,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 		this, &ConfigMainWindow::goBack);
 	connect(menuList, &ConfigList::menuChanged,
 		helpText, &ConfigInfoView::setInfo);
+	connect(menuList, &ConfigList::menuChanged,
+		conflictsView, &ConflictsView::menuChanged);
 	connect(menuList, &ConfigList::menuSelected,
 		this, &ConfigMainWindow::changeMenu);
 
@@ -1712,6 +1755,13 @@ void ConfigMainWindow::showSplitView(void)
 	menuList->setFocus();
 }
 
+void ConfigMainWindow::conflictSelected(struct menu * men)
+{
+	configList->clearSelection();
+	menuList->clearSelection();
+	emit(setMenuLink(men));
+}
+
 void ConfigMainWindow::showFullView(void)
 {
 	singleViewAction->setEnabled(true);
@@ -1847,6 +1897,432 @@ void ConfigMainWindow::conf_changed(bool dirty)
 		saveAction->setEnabled(dirty);
 }
 
+void ConfigMainWindow::refreshMenu(void)
+{
+	configList->updateListAll();
+}
+
+void QTableWidget::dropEvent(QDropEvent *event)
+{
+}
+
+ConflictsView::ConflictsView(QWidget *parent, const char *name)
+	: Parent(parent)
+{
+	currentSelectedMenu = nullptr;
+	setObjectName(name);
+	QHBoxLayout *horizontalLayout = new QHBoxLayout(this);
+	QVBoxLayout *verticalLayout = new QVBoxLayout();
+	verticalLayout->setContentsMargins(0, 0, 0, 0);
+	conflictsToolBar = new QToolBar("ConflictTools", this);
+	// toolbar buttons [n] [m] [y] [calculate fixes] [remove]
+	QAction *addSymbol = new QAction("Add Symbol");
+	QAction *setConfigSymbolAsNo = new QAction("N");
+	QAction *setConfigSymbolAsModule = new QAction("M");
+	QAction *setConfigSymbolAsYes = new QAction("Y");
+	fixConflictsAction_ = new QAction("Calculate Fixes");
+	QAction *removeSymbol = new QAction("Remove Symbol");
+	QMovie *loadingGif = new QMovie("scripts/kconfig/loader.gif");
+	auto loadingLabel = new QLabel;
+
+	if (loadingGif->isValid()) {
+		loadingGif->setScaledSize(loadingGif->scaledSize().scaled(
+			20, 20, Qt::KeepAspectRatioByExpanding));
+		loadingGif->start();
+		loadingLabel->setMovie(loadingGif);
+	} else {
+		loadingLabel->setText("Calculating...");
+	}
+
+	//if you change the order of buttons here, change the code where
+	//module button was disabled if symbol is boolean, selecting module button
+	//depends on a specific index in list of action
+	fixConflictsAction_->setCheckable(false);
+	conflictsToolBar->addAction(addSymbol);
+	conflictsToolBar->addAction(setConfigSymbolAsNo);
+	conflictsToolBar->addAction(setConfigSymbolAsModule);
+	conflictsToolBar->addAction(setConfigSymbolAsYes);
+	conflictsToolBar->addAction(fixConflictsAction_);
+	conflictsToolBar->addAction(removeSymbol);
+	// loadingLabel->setMargin(5);
+	loadingLabel->setContentsMargins(5, 5, 5, 5);
+	loadingAction = conflictsToolBar->addWidget(loadingLabel);
+	loadingAction->setVisible(false);
+
+
+	verticalLayout->addWidget(conflictsToolBar);
+
+	connect(addSymbol, &QAction::triggered, this, &ConflictsView::addSymbol);
+	connect(setConfigSymbolAsNo, &QAction::triggered,this, &ConflictsView::changeToNo);
+	connect(setConfigSymbolAsModule, &QAction::triggered,this, &ConflictsView::changeToModule);
+	connect(setConfigSymbolAsYes, &QAction::triggered,this, &ConflictsView::changeToYes);
+	connect(removeSymbol, &QAction::triggered,this, &ConflictsView::removeSymbol);
+	connect(this, SIGNAL(resultsReady()), SLOT(updateResults()));
+	//connect clicking 'calculate fixes' to 'change all symbol values to fix all conflicts'
+	// no longer used anymore for now.
+	connect(fixConflictsAction_, &QAction::triggered,this, &ConflictsView::calculateFixes);
+
+	conflictsTable = (QTableWidget *) new dropAbleView(this);
+	conflictsTable->setRowCount(0);
+	conflictsTable->setColumnCount(3);
+	conflictsTable->setSelectionBehavior(QAbstractItemView::SelectRows);
+
+	conflictsTable->setHorizontalHeaderLabels(QStringList()  << "Option" << "Wanted value" << "Current value" );
+	verticalLayout->addWidget(conflictsTable);
+
+	conflictsTable->setDragDropMode(QAbstractItemView::DropOnly);
+	setAcceptDrops(true);
+
+	connect(conflictsTable, SIGNAL(cellClicked(int, int)), SLOT(cellClicked(int,int)));
+	horizontalLayout->addLayout(verticalLayout);
+
+	// populate the solution view on the right hand side:
+	QVBoxLayout *solutionLayout = new QVBoxLayout();
+	solutionLayout->setContentsMargins(0, 0, 0, 0);
+	solutionSelector = new QComboBox();
+	connect(solutionSelector, QOverload<int>::of(&QComboBox::currentIndexChanged),
+		[=](int index){ changeSolutionTable(index); });
+	solutionTable = new QTableWidget();
+	solutionTable->setRowCount(0);
+	solutionTable->setColumnCount(2);
+	solutionTable->setHorizontalHeaderLabels(QStringList()  << "Symbol" << "New Value" );
+
+	applyFixButton = new QPushButton("Apply Selected solution");
+	connect(applyFixButton, SIGNAL(clicked(bool)), SLOT(applyFixButtonClick()));
+
+	numSolutionLabel = new QLabel("Solutions:");
+	solutionLayout->addWidget(numSolutionLabel);
+	solutionLayout->addWidget(solutionSelector);
+	solutionLayout->addWidget(solutionTable);
+	solutionLayout->addWidget(applyFixButton);
+
+	horizontalLayout->addLayout(solutionLayout);
+}
+
+
+void ConflictsView::changeToNo(){
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	if (select->hasSelection()){
+		QModelIndexList rows = select->selectedRows();
+		for (int i = 0;i < rows.count(); i++)
+		{
+			conflictsTable->item(rows[i].row(),1)->setText("NO");
+		}
+	}
+}
+
+void ConflictsView::applyFixButtonClick(){
+	signed int solution_number = solutionSelector->currentIndex();
+
+	if (solution_number == -1 || solution_output == NULL) {
+		return;
+	}
+
+	struct sfix_list * selected_solution = select_solution(solution_output, solution_number);
+	apply_fix(selected_solution);
+
+
+	ConfigList::updateListForAll();
+	for (int i = 0;i < conflictsTable->rowCount(); i++)
+	{
+		conflictsTable->item(i,2)->setText(conflictsTable->item(i,1)->text());
+	}
+	updateConflictsViewColorization();
+	QMessageBox msgBox;
+	msgBox.setText("The solution has been applied.");
+	msgBox.exec();
+}
+
+void ConflictsView::changeToYes(){
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	if (select->hasSelection()){
+		QModelIndexList rows = select->selectedRows();
+		for (int i = 0;i < rows.count(); i++)
+		{
+			conflictsTable->item(rows[i].row(),1)->setText("YES");
+		}
+	}
+
+}
+
+void ConflictsView::changeToModule() {
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	if (select->hasSelection()){
+		QModelIndexList rows = select->selectedRows();
+		for (int i = 0;i < rows.count(); i++)
+		{
+			conflictsTable->item(rows[i].row(),1)->setText("MODULE");
+		}
+	}
+
+}
+
+void ConflictsView::menuChanged(struct menu *m)
+{
+	currentSelectedMenu = m;
+}
+
+void ConflictsView::addSymbol()
+{
+	addSymbolFromMenu(currentSelectedMenu);
+}
+
+void ConflictsView::selectionChanged(QList<QTreeWidgetItem *> selection)
+{
+	currentSelection = selection;
+
+}
+
+void ConflictsView::addSymbolFromMenu(struct menu *m)
+{
+	// adds a symbol to the conflict resolver list
+	if (m != nullptr){
+		if (m->sym != nullptr){
+			struct symbol *sym = m->sym;
+			tristate currentval = sym_get_tristate_value(sym);
+			//if symbol is not added yet:
+			QAbstractItemModel *tableModel = conflictsTable->model();
+			QModelIndexList matches = tableModel->match(tableModel->index(0,0), Qt::DisplayRole, QString(sym->name));
+			if (matches.isEmpty()){
+				conflictsTable->insertRow(conflictsTable->rowCount());
+				conflictsTable->setItem(conflictsTable->rowCount()-1,0,new QTableWidgetItem(sym->name));
+				conflictsTable->setItem(conflictsTable->rowCount()-1,1,new QTableWidgetItem(tristate_value_to_string(currentval)));
+				conflictsTable->setItem(conflictsTable->rowCount()-1,2,new QTableWidgetItem(tristate_value_to_string(currentval)));
+			}else{
+				conflictsTable->item(matches[0].row(),2)->setText(tristate_value_to_string(currentval));
+			}
+		}
+	}
+}
+
+void ConflictsView::addSymbolFromContextMenu() {
+	struct menu *menu;
+
+	if (currentSelection.count() < 0){
+		return;
+	}
+	for (auto el: currentSelection){
+		ConfigItem *item = (ConfigItem *)el;
+		if (!item)
+		{
+			continue;
+		}
+		menu = item->menu;
+		addSymbolFromMenu(menu);
+	}
+
+}
+
+void ConflictsView::removeSymbol()
+{
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	QAbstractItemModel *itemModel = select->model();
+	if (select->hasSelection()){
+		QModelIndexList rows = select->selectedRows();
+		itemModel->removeRows(rows[0].row(),rows.size());
+	}
+}
+
+void ConflictsView::cellClicked(int row, int column)
+{
+	auto itemText = conflictsTable->item(row,0)->text().toUtf8().data();
+	struct property *prop;
+	struct menu *men;
+	struct symbol *sym = sym_find(itemText);
+
+	if (sym == NULL)
+		return;
+	prop = sym->prop;
+	men = prop->menu;
+	// uncommenting following like somehow disables click signal of 'apply selected solution'
+	if (sym->type == symbol_type::S_BOOLEAN) {
+		//disable module button
+		conflictsToolBar->actions()[2]->setDisabled(true);
+	} else {
+		//enable module button
+		conflictsToolBar->actions()[2]->setDisabled(false);
+	}
+	emit(conflictSelected(men));
+}
+
+void ConflictsView::changeSolutionTable(int solution_number){
+	if (solution_output == nullptr || solution_number < 0){
+		return;
+	}
+	struct sfix_list *selected_solution = select_solution(solution_output, solution_number);
+	current_solution_number = solution_number;
+	solutionTable->setRowCount(0);
+	for (unsigned int i = 0; i <selected_solution->size; i++)
+	{
+		solutionTable->insertRow(solutionTable->rowCount());
+		struct symbol_fix *cur_symbol = select_symbol(selected_solution,i);
+
+		QTableWidgetItem *symbol_name = new QTableWidgetItem(cur_symbol->sym->name);
+
+		solutionTable->setItem(solutionTable->rowCount()-1,0,symbol_name);
+
+		if (cur_symbol->type == symbolfix_type::SF_BOOLEAN){
+			QTableWidgetItem *symbol_value = new QTableWidgetItem(tristate_value_to_string(cur_symbol->tri));
+			solutionTable->setItem(solutionTable->rowCount()-1,1,symbol_value);
+		} else if(cur_symbol->type == symbolfix_type::SF_NONBOOLEAN){
+			QTableWidgetItem *symbol_value = new QTableWidgetItem(cur_symbol->nb_val.s);
+			solutionTable->setItem(solutionTable->rowCount()-1,1,symbol_value);
+		} else {
+			QTableWidgetItem *symbol_value = new QTableWidgetItem(cur_symbol->disallowed.s);
+			solutionTable->setItem(solutionTable->rowCount()-1,1,symbol_value);
+		}
+	}
+	updateConflictsViewColorization();
+}
+
+void ConflictsView::updateConflictsViewColorization(void)
+{
+	auto green = QColor(0,170,0);
+	auto red = QColor(255,0,0);
+	auto grey = QColor(180,180,180);
+
+	if (solutionTable->rowCount() == 0 || current_solution_number < 0)
+		return;
+
+	for (int i=0; i< solutionTable->rowCount(); i++) {
+		QTableWidgetItem *symbol =  solutionTable->item(i,0);
+		//symbol from solution list
+		struct sfix_list *selected_solution = select_solution(solution_output, current_solution_number);
+		struct symbol_fix *cur_symbol = select_symbol(selected_solution,i);
+
+		// if symbol is editable but the value is not the target value from solution we got, the color is red
+		// if symbol is editable but the value is the target value from solution we got, the color is green
+		// if symbol is not editable , the value is not the target value, the color is grey
+		// if symbol is not editable , the value is the target value, the color is green
+		auto editable = sym_string_within_range(cur_symbol->sym, tristate_value_to_string(cur_symbol->tri).toStdString().c_str());
+		auto _symbol = solutionTable->item(i,0)->text().toUtf8().data();
+		struct symbol *sym_ = sym_find(_symbol);
+
+		tristate current_value_of_symbol = sym_get_tristate_value(sym_);
+		tristate target_value_of_symbol = string_value_to_tristate(solutionTable->item(i,1)->text());
+		bool symbol_value_same_as_target = current_value_of_symbol == target_value_of_symbol;
+
+		if (editable && !symbol_value_same_as_target){
+			symbol->setForeground(red);
+		} else if (editable && symbol_value_same_as_target){
+			symbol->setForeground(green);
+		} else if (!editable && !symbol_value_same_as_target){
+			symbol->setForeground(grey);
+		} else if (!editable && symbol_value_same_as_target){
+			symbol->setForeground(green);
+		}
+    }
+
+}
+
+void ConflictsView::runSatConfAsync()
+{
+	//loop through the rows in conflicts table adding each row into the array:
+	struct symbol_dvalue *p = nullptr;
+	p = static_cast<struct symbol_dvalue *>(calloc(conflictsTable->rowCount(),sizeof(struct symbol_dvalue)));
+	if (!p)
+	{
+		printf("memory allocation error\n");
+		return;
+	}
+
+	struct sdv_list *wanted_symbols = sdv_list_init();
+
+	for (int i = 0; i < conflictsTable->rowCount(); i++)
+	{
+
+		struct symbol_dvalue *tmp = (p+i);
+		auto _symbol = conflictsTable->item(i,0)->text().toUtf8().data();
+		struct symbol *sym = sym_find(_symbol);
+
+		tmp->sym = sym;
+		tmp->type = static_cast<symboldv_type>(sym->type == symbol_type::S_BOOLEAN?0:1);
+		tmp->tri = string_value_to_tristate(conflictsTable->item(i,1)->text());
+		sdv_list_add(wanted_symbols,tmp);
+	}
+	fixConflictsAction_->setText("Cancel");
+	loadingAction->setVisible(true);
+
+	struct sfl_list *ret = run_satconf(wanted_symbols);
+	solution_output = ret;
+
+	free(p);
+	emit resultsReady();
+	{
+		std::lock_guard<std::mutex> lk{satconf_mutex};
+		satconf_cancelled = true;
+	}
+	satconf_cancellation_cv.notify_one();
+
+}
+
+void ConflictsView::updateResults(void)
+{
+	fixConflictsAction_->setText("Calculate Fixes");
+	loadingAction->setVisible(false);
+	if (!(solution_output == nullptr || solution_output->size == 0))
+	{
+		solutionSelector->clear();
+		for (unsigned int i = 0; i < solution_output->size; i++)
+		{
+			solutionSelector->addItem(QString::number(i+1));
+		}
+		// populate the solution table from the first solution gotten
+		numSolutionLabel->setText(QString("Solutions: (%1) found").arg(solution_output->size));
+		changeSolutionTable(0);
+	}
+	else {
+		QMessageBox msgBox;
+		msgBox.setText("All symbols are already within range.");
+		msgBox.exec();
+	}
+	if (runSatConfAsyncThread->joinable()){
+		runSatConfAsyncThread->join();
+		delete runSatConfAsyncThread;
+		runSatConfAsyncThread  = nullptr;
+	}
+
+}
+
+void ConflictsView::calculateFixes()
+{
+	if(conflictsTable->rowCount() == 0)
+	{
+		printd("table is empty\n");
+		return;
+	}
+
+	if (runSatConfAsyncThread == nullptr)
+	{
+		// fire away asynchronous call
+		std::unique_lock<std::mutex> lk{satconf_mutex};
+
+		numSolutionLabel->setText(QString("Solutions: "));
+		solutionSelector->clear();
+		solutionTable->setRowCount(0);
+		satconf_cancelled = false;
+		runSatConfAsyncThread = new std::thread(&ConflictsView::runSatConfAsync,this);
+	}else{
+		printd("Interrupting rangefix\n");
+		interrupt_rangefix();
+		std::unique_lock<std::mutex> lk{satconf_mutex};
+		satconf_cancellation_cv.wait(lk,[this] {return satconf_cancelled == true;});
+	}
+
+}
+
+void ConflictsView::changeAll(void)
+{
+	// not implemented for now
+	return;
+}
+
+ConflictsView::~ConflictsView(void)
+{
+
+}
+
+
 void fixup_rootmenu(struct menu *menu)
 {
 	struct menu *child;
@@ -1918,3 +2394,38 @@ int main(int ac, char** av)
 
 	return 0;
 }
+
+dropAbleView::dropAbleView(QWidget *parent) :
+    QTableWidget(parent) {}
+
+dropAbleView::~dropAbleView() {}
+void dropAbleView::dropEvent(QDropEvent *event)
+{
+   event->acceptProposedAction();
+}
+
+static QString tristate_value_to_string(tristate val)
+{
+	switch ( val ) {
+	case yes:
+		return QString::fromStdString("YES");
+	case mod:
+		return QString::fromStdString("MODULE");
+	case no:
+		return QString::fromStdString("NO");
+	default:
+		return QString::fromStdString("");
+	}
+
+}
+
+static tristate string_value_to_tristate(QString s){
+	if (s == "YES")
+		return tristate::yes;
+	else if (s == "MODULE")
+		return tristate::mod;
+	else if (s == "NO")
+		return tristate::no;
+	else
+		return tristate::no;
+}
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 53373064d90a..1ace9f673fd0 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -14,9 +14,16 @@
 #include <QStyledItemDelegate>
 #include <QTextBrowser>
 #include <QTreeWidget>
+#include <QTableWidget>
+#include <QList>
+#include <QComboBox>
+#include <QLabel>
+#include <thread>
+#include <condition_variable>
 
 #include "expr.h"
 
+
 class ConfigList;
 class ConfigItem;
 class ConfigMainWindow;
@@ -80,6 +87,8 @@ public slots:
 	void parentSelected(void);
 	void gotFocus(struct menu *);
 	void showNameChanged(bool on);
+	void selectionChanged(QList<QTreeWidgetItem *> selection);
+	void updateConflictsViewColorization();
 
 public:
 	void updateListAll(void)
@@ -111,6 +120,82 @@ public slots:
 	static void updateListAllForAll();
 
 	static QAction *showNormalAction, *showAllAction, *showPromptAction;
+	static QAction *addSymbolFromContextMenu;
+
+};
+
+class ConflictsView : public QWidget {
+	Q_OBJECT
+	typedef class QWidget Parent;
+private:
+	QAction *loadingAction;
+public:
+	ConflictsView(QWidget *parent, const char *name = 0);
+	~ConflictsView(void);
+	void addSymbolFromMenu(struct menu *m);
+	int current_solution_number = -1;
+
+public slots:
+	void cellClicked(int, int);
+	void changeAll();
+	// triggered by Qactions on the tool bar that adds/remove symbol
+	void addSymbol();
+	// triggered from config list right click -> add symbols
+	void addSymbolFromContextMenu();
+	void removeSymbol();
+	void menuChanged(struct menu *);
+	void changeToNo();
+	void changeToYes();
+	void changeToModule();
+	void selectionChanged(QList<QTreeWidgetItem *> selection);
+
+
+	void applyFixButtonClick();
+	void updateConflictsViewColorization();
+	void updateResults();
+
+
+
+	// switches the solution table with selected solution index from  solution_output
+	void changeSolutionTable(int solution_number);
+
+	// calls satconfig to solve to get wanted value to current value
+	void calculateFixes();
+signals:
+	void showNameChanged(bool);
+	void showRangeChanged(bool);
+	void showDataChanged(bool);
+	void conflictSelected(struct menu *);
+	void refreshMenu();
+	void resultsReady();
+public:
+	QTableWidget *conflictsTable;
+
+	// the comobox on the right hand side. used to select a solution after
+	// getting solution from satconfig
+	QComboBox *solutionSelector{nullptr};
+
+	// the table which shows the selected solution showing variable = New value changes
+	QTableWidget *solutionTable{nullptr};
+
+	// Apply fixes button on the solution view
+	QPushButton *applyFixButton{nullptr};
+
+	struct sfl_list *solution_output{nullptr};
+
+	QToolBar *conflictsToolBar;
+	struct menu *currentSelectedMenu;
+	QLabel *numSolutionLabel{nullptr};
+	// currently selected config items in configlist.
+	QList<QTreeWidgetItem *> currentSelection;
+	QAction *fixConflictsAction_{nullptr};
+	void runSatConfAsync();
+	std::thread *runSatConfAsyncThread{nullptr};
+
+	std::mutex satconf_mutex;
+	std::condition_variable satconf_cancellation_cv;
+	bool satconf_cancelled{false};
+
 };
 
 class ConfigItem : public QTreeWidgetItem {
@@ -223,6 +308,9 @@ class ConfigSearchWindow : public QDialog {
 public slots:
 	void saveSettings(void);
 	void search(void);
+	void updateConflictsViewColorizationFowarder();
+signals:
+	void updateConflictsViewColorization();
 
 protected:
 	QLineEdit* editField;
@@ -258,6 +346,8 @@ public slots:
 	void showIntro(void);
 	void showAbout(void);
 	void saveSettings(void);
+	void conflictSelected(struct menu *);
+	void refreshMenu();
 
 protected:
 	void closeEvent(QCloseEvent *e);
@@ -266,10 +356,23 @@ public slots:
 	ConfigList *menuList;
 	ConfigList *configList;
 	ConfigInfoView *helpText;
+	ConflictsView *conflictsView;
+	QToolBar *conflictsToolBar;
 	QAction *backAction;
 	QAction *singleViewAction;
 	QAction *splitViewAction;
 	QAction *fullViewAction;
 	QSplitter *split1;
 	QSplitter *split2;
+	QSplitter *split3;
+};
+
+class dropAbleView : public QTableWidget
+{
+public:
+	dropAbleView(QWidget *parent = nullptr);
+	~dropAbleView();
+
+protected:
+	void dropEvent(QDropEvent *event);
 };
-- 
2.39.2


