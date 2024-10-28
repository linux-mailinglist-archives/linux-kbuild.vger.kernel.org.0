Return-Path: <linux-kbuild+bounces-4360-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4BF9B23B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 04:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5012B1C21232
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 03:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE36E18DF88;
	Mon, 28 Oct 2024 03:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwQKaJPB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F277618CC07;
	Mon, 28 Oct 2024 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730087427; cv=none; b=lAJXNd4yRXYcCgVyTUmGvE/qfCrcIKDenURPc+k9Y5JqYt0eJKpbPNP5+XYAjo8T5N3Ga7h5ZyYds8UxY9hSpV/hmB4I2ifK06C4iwxHl2yoeoYF+RG4msEd+HNXWR83ZsV9Eu8B+xIvpyOxspbRl5TKb6C/7y5Ncan/FZXytg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730087427; c=relaxed/simple;
	bh=74in5p3OafFMmivZN5SGE2t2R5tt9i1EO/WqOwWF0rQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBEIldUFmDiAcvFsZVlk/jdrT9kXAkAJxKILsOxjfRFPF+Q2ZUHkwukOm6j1CZVuV0m8H259Z2TxzCeKZ1JylmSNv5PvFUUCJWXUcjvjG8itQQ6GyQoAN1mUjwbVx61gtZSWuRMdpk+KcBCGs0ZKLgY7e8tmCLXfLzAvQRfCXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwQKaJPB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0c40849cso636718466b.3;
        Sun, 27 Oct 2024 20:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730087421; x=1730692221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZF1Fu1a/3XRLiIbO32gAuENb0GF29YprTUjnrCbVd8=;
        b=RwQKaJPBEmzro6uFK5SQvw+Ysbl5RY9hAc/Be3B1KooACqMaVdaE+CJJ86nowIcoHj
         +Yymp4IdTjIchNUbjPT2LnJ4qaIlkrd5ITgoaMtBG6KTmo40XGbJ4HHESxKYI72OnmXP
         oQxFaZWdsEQwhA6/IXeWsx8HHMfCXMfp2XvreP8HsQJnWRftOKx8Qa8KEIfTg15O+V+r
         RyOOMD2rpIbvLBin/MOQcIEDtxuLIi5mSUQs7v2Dk1G4gZXlAJlKXjoC7vdYPmSckVZf
         wriCXMGJ/dn9Z16nEYLMlyh2kpAEOSBqCP8cvLsyhpY4GFGWnJ3FSoN4sBsL/PyhrgKq
         2Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730087421; x=1730692221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZF1Fu1a/3XRLiIbO32gAuENb0GF29YprTUjnrCbVd8=;
        b=QFGf9Uxl5YAQRfI4CWpl6kHHZfCTMkdTaEEHp+eTsMa0rHhEIhIh71bftm4spCxzSp
         wwydpAGxxv1sDvsHWOg0PWR+VpgPE3czSNsxL418NVg4wxUNdlXrHBRfw3To3wdKro+5
         TEQ53la0Rpol+OEZJivpERZriL1peTnOGEpFqJoR1Yg+wt0zLGDjWVQ50+F2Rid9SWlR
         z2rDqIInyWyK65TBYfaK4hBweTXEqKPxiNKJDoxgwEEijP1Xvs/82xfGBzK0I4fIqWDy
         zoXisQMDKX0LxI7NZQ4D0+P8JTL+dOqGzAskt/aPByXiojfinDOSTxTOyu1NWh1G0sgx
         XGXw==
X-Forwarded-Encrypted: i=1; AJvYcCWx3kN+CmekDiK0rzouTm7kwQ9uG4NUm4rgB1qIv2oGQGpd5pec83epniNuXeV2ol+9XtOMNqpI0ic8aA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb3rHfhfKByLkDovTRz9/EgCHwZC0/BmmS3dO5s7jagp9CzR47
	oAAqmRpm1Z0Y3PBf190rQOC8J1akeLCYcRwHrI7Gv06OHam8Gl+ejME9Gw==
X-Google-Smtp-Source: AGHT+IEcA9Qpxt6kAK3eaxaZMQN6mWD/CMT8pqw7zbFyEZynDxUVFPkQIuUWQr3MJHYM2k5J0dNH3A==
X-Received: by 2002:a17:907:72d1:b0:a99:65c6:7f34 with SMTP id a640c23a62f3a-a9de5c91b63mr601649666b.7.1730087421040;
        Sun, 27 Oct 2024 20:50:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:908:e842:bf20:78b:e59b:2b0:d2e9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30f5932fsm334599366b.168.2024.10.27.20.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:50:20 -0700 (PDT)
From: Ole Schuerks <ole0811sch@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: ole0811sch@gmail.com,
	jude.gyimah@rub.de,
	thorsten.berger@rub.de,
	deltaone@debian.org,
	jan.sollmann@rub.de,
	mcgrof@kernel.org,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Subject: [PATCH v6 09/11] kconfig: Add xconfig-modifications
Date: Mon, 28 Oct 2024 04:49:47 +0100
Message-Id: <20241028034949.95322-10-ole0811sch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028034949.95322-1-ole0811sch@gmail.com>
References: <20241028034949.95322-1-ole0811sch@gmail.com>
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
 scripts/kconfig/qconf.cc | 676 ++++++++++++++++++++++++++++++++++++++-
 scripts/kconfig/qconf.h  | 111 +++++++
 2 files changed, 785 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 90f139480eda..e899fa573db4 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -19,21 +19,40 @@
 #include <QRegularExpression>
 #include <QScreen>
 #include <QToolBar>
+#include <QListWidget>
+#include <QComboBox>
+#include <QTableWidget>
+#include <QHBoxLayout>
+#include <QMovie>
+#include <QMessageBox>
+#include <QPlainTextEdit>
+#include <QAbstractItemView>
+#include <QMimeData>
+#include <QBrush>
+#include <QColor>
 
+#include <xalloc.h>
+#include "lkc.h"
+#include <vector>
 #include <stdlib.h>
 
-#include <xalloc.h>
 #include "lkc.h"
 #include "qconf.h"
+#include "configfix.h"
+#include "picosat_functions.h"
 
 #include "images.h"
 
+static QString tristate_value_to_string(tristate val);
+static tristate string_value_to_tristate(QString s);
 
 static QApplication *configApp;
 static ConfigSettings *configSettings;
 
 QAction *ConfigMainWindow::saveAction;
 
+static bool picosat_available;
+
 ConfigSettings::ConfigSettings()
 	: QSettings("kernel.org", "qconf")
 {
@@ -406,7 +425,7 @@ void ConfigList::updateSelection(void)
 	ConfigItem* item = (ConfigItem*)selectedItems().first();
 	if (!item)
 		return;
-
+	emit selectionChanged(selectedItems());
 	menu = item->menu;
 	emit menuChanged(menu);
 	if (!menu)
@@ -540,6 +559,7 @@ void ConfigList::changeValue(ConfigItem* item)
 		}
 		if (oldexpr != newexpr)
 			ConfigList::updateListForAll();
+			emit updateConflictsViewColorization();
 		break;
 	default:
 		break;
@@ -899,6 +919,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 			action, &QAction::setChecked);
 		action->setChecked(showName);
 		headerPopup->addAction(action);
+		headerPopup->addAction(addSymbolFromContextMenu);
 	}
 
 	headerPopup->exec(e->globalPos());
@@ -919,6 +940,7 @@ QList<ConfigList *> ConfigList::allLists;
 QAction *ConfigList::showNormalAction;
 QAction *ConfigList::showAllAction;
 QAction *ConfigList::showPromptAction;
+QAction *ConfigList::addSymbolFromContextMenu;
 
 void ConfigList::setAllOpen(bool open)
 {
@@ -1239,7 +1261,11 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 		info, &ConfigInfoView::setInfo);
 	connect(list, &ConfigList::menuChanged,
 		parent, &ConfigMainWindow::setMenuLink);
+	connect(list, &ConfigList::menuChanged,
+		parent, &ConfigMainWindow::conflictSelected);
 
+	connect(list, &ConfigList::updateConflictsViewColorization, this,
+		&ConfigSearchWindow::updateConflictsViewColorizationFowarder);
 	layout1->addWidget(split);
 
 	QVariant x, y;
@@ -1262,6 +1288,11 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 		this, &ConfigSearchWindow::saveSettings);
 }
 
+void ConfigSearchWindow::updateConflictsViewColorizationFowarder(void)
+{
+	emit updateConflictsViewColorization();
+}
+
 void ConfigSearchWindow::saveSettings(void)
 {
 	if (!objectName().isEmpty()) {
@@ -1349,6 +1380,24 @@ ConfigMainWindow::ConfigMainWindow(void)
 	helpText = new ConfigInfoView(split2, "help");
 	setTabOrder(configList, helpText);
 
+	split3 = new QSplitter(split2);
+	split3->setOrientation(Qt::Vertical);
+	conflictsView = new ConflictsView(split3, "help");
+	/*
+	 * conflictsSelected signal in conflictsview triggers when a conflict is
+	 * selected in the view. this line connects that event to conflictselected
+	 * event in mainwindow which updates the selection to match (in the
+	 * configlist) the symbol that was selected.
+	 */
+	connect(conflictsView, &ConflictsView::conflictSelected, this,
+		&ConfigMainWindow::conflictSelected);
+	connect(conflictsView, &ConflictsView::refreshMenu, this,
+		&ConfigMainWindow::refreshMenu);
+	connect(menuList, &ConfigList::updateConflictsViewColorization,
+		conflictsView, &ConflictsView::updateConflictsViewColorization);
+	connect(configList, &ConfigList::updateConflictsViewColorization,
+		conflictsView, &ConflictsView::updateConflictsViewColorization);
+
 	configList->setFocus();
 
 	backAction = new QAction(QPixmap(xpm_back), "Back", this);
@@ -1415,6 +1464,10 @@ ConfigMainWindow::ConfigMainWindow(void)
 	ConfigList::showAllAction->setCheckable(true);
 	ConfigList::showPromptAction = new QAction("Show Prompt Options", optGroup);
 	ConfigList::showPromptAction->setCheckable(true);
+	ConfigList::addSymbolFromContextMenu =
+		new QAction("Add symbol from context menu");
+	connect(ConfigList::addSymbolFromContextMenu, &QAction::triggered,
+		conflictsView, &ConflictsView::addSymbol);
 
 	QAction *showDebugAction = new QAction("Show Debug Info", this);
 	  showDebugAction->setCheckable(true);
@@ -1470,6 +1523,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	connect(configList, &ConfigList::menuChanged,
 		helpText, &ConfigInfoView::setInfo);
+	connect(configList, &ConfigList::menuChanged,
+		conflictsView, &ConflictsView::menuChanged);
 	connect(configList, &ConfigList::menuSelected,
 		this, &ConfigMainWindow::changeMenu);
 	connect(configList, &ConfigList::itemSelected,
@@ -1478,6 +1533,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 		this, &ConfigMainWindow::goBack);
 	connect(menuList, &ConfigList::menuChanged,
 		helpText, &ConfigInfoView::setInfo);
+	connect(menuList, &ConfigList::menuChanged,
+		conflictsView, &ConflictsView::menuChanged);
 	connect(menuList, &ConfigList::menuSelected,
 		this, &ConfigMainWindow::changeMenu);
 
@@ -1687,6 +1744,13 @@ void ConfigMainWindow::showSplitView(void)
 	menuList->setFocus();
 }
 
+void ConfigMainWindow::conflictSelected(struct menu *men)
+{
+	configList->clearSelection();
+	menuList->clearSelection();
+	emit(setMenuLink(men));
+}
+
 void ConfigMainWindow::showFullView(void)
 {
 	singleViewAction->setEnabled(true);
@@ -1822,6 +1886,536 @@ void ConfigMainWindow::conf_changed(bool dirty)
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
+void ConflictsView::addPicoSatNote(QToolBar &toolbar)
+{
+	QLabel &label = *new QLabel;
+	auto &iconLabel = *new QLabel();
+	iconLabel.setPixmap(
+		style()->standardIcon(
+			       QStyle::StandardPixmap::SP_MessageBoxInformation)
+			.pixmap(20, 20));
+	label.setText(
+		"The conflict resolver requires that PicoSAT is available as a library.");
+	QAction &showDialog = *new QAction();
+	showDialog.setIconText("Install PicoSAT...");
+	toolbar.addWidget(&iconLabel);
+	toolbar.addWidget(&label);
+	toolbar.addAction(&showDialog);
+	connect(&showDialog, &QAction::triggered,
+		[this]() { (new PicoSATInstallInfoWindow(this))->show(); });
+}
+
+ConflictsView::ConflictsView(QWidget *parent, const char *name)
+	: Parent(parent)
+{
+	/*
+	 * 	- topLevelLayout
+	 * 		- picoSatContainer
+	 *  		- picoSatLayout
+	 *  			- ...
+	 *		- conflictsViewContainer
+	 *			- horizontalLayout
+	 *				- verticalLayout
+	 *				- solutionLayout
+	 */
+	currentSelectedMenu = nullptr;
+	setObjectName(name);
+	QVBoxLayout *topLevelLayout = new QVBoxLayout(this);
+	QWidget *conflictsViewContainer = new QWidget;
+	if (!picosat_available) {
+		conflictsViewContainer->setDisabled(true);
+		QWidget *picoSatContainer = new QWidget;
+		topLevelLayout->addWidget(picoSatContainer);
+		QHBoxLayout *picoSatLayout = new QHBoxLayout(picoSatContainer);
+		QToolBar *picoToolbar = new QToolBar(picoSatContainer);
+		picoSatLayout->addWidget(picoToolbar);
+		picoSatLayout->addStretch();
+		addPicoSatNote(*picoToolbar);
+	}
+	topLevelLayout->addWidget(conflictsViewContainer);
+
+	QHBoxLayout *horizontalLayout = new QHBoxLayout(conflictsViewContainer);
+	QVBoxLayout *verticalLayout = new QVBoxLayout;
+	verticalLayout->setContentsMargins(0, 0, 0, 0);
+	conflictsToolBar =
+		new QToolBar("ConflictTools", conflictsViewContainer);
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
+	verticalLayout->addWidget(conflictsToolBar);
+
+	connect(addSymbol, &QAction::triggered, this,
+		&ConflictsView::addSymbol);
+	connect(setConfigSymbolAsNo, &QAction::triggered, this,
+		&ConflictsView::changeToNo);
+	connect(setConfigSymbolAsModule, &QAction::triggered, this,
+		&ConflictsView::changeToModule);
+	connect(setConfigSymbolAsYes, &QAction::triggered, this,
+		&ConflictsView::changeToYes);
+	connect(removeSymbol, &QAction::triggered, this,
+		&ConflictsView::removeSymbol);
+	connect(this, &ConflictsView::resultsReady, this,
+		&ConflictsView::updateResults);
+	//connect clicking 'calculate fixes' to 'change all symbol values to fix all conflicts'
+	// no longer used anymore for now.
+	connect(fixConflictsAction_, &QAction::triggered, this,
+		&ConflictsView::calculateFixes);
+
+	conflictsTable = (QTableWidget *)new dropAbleView(this);
+	conflictsTable->setRowCount(0);
+	conflictsTable->setColumnCount(3);
+	conflictsTable->setSelectionBehavior(QAbstractItemView::SelectRows);
+	conflictsTable->setEditTriggers(QAbstractItemView::NoEditTriggers);
+
+	conflictsTable->setHorizontalHeaderLabels(
+		QStringList() << "Name" << "Wanted value" << "Current value");
+	verticalLayout->addWidget(conflictsTable);
+
+	conflictsTable->setDragDropMode(QAbstractItemView::DropOnly);
+	setAcceptDrops(true);
+
+	connect(conflictsTable, &QTableWidget::cellClicked, this,
+		&ConflictsView::cellClicked);
+	horizontalLayout->addLayout(verticalLayout);
+
+	// populate the solution view on the right hand side:
+	QVBoxLayout *solutionLayout = new QVBoxLayout();
+	solutionLayout->setContentsMargins(0, 0, 0, 0);
+	solutionSelector = new QComboBox();
+	connect(solutionSelector,
+		QOverload<int>::of(&QComboBox::currentIndexChanged),
+		[=](int index) { changeSolutionTable(index); });
+	solutionTable = new QTableWidget();
+	solutionTable->setRowCount(0);
+	solutionTable->setColumnCount(2);
+	solutionTable->setHorizontalHeaderLabels(QStringList()
+						 << "Name" << "New Value");
+	solutionTable->setEditTriggers(QAbstractItemView::NoEditTriggers);
+
+	applyFixButton = new QPushButton("Apply Selected solution");
+	connect(applyFixButton, &QPushButton::clicked, this,
+		&ConflictsView::applyFixButtonClick);
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
+void ConflictsView::applyFixButtonClick()
+{
+	signed int solution_number = solutionSelector->currentIndex();
+
+	if (solution_number == -1 || solution_output == NULL) {
+		return;
+	}
+
+	apply_fix(solution_output[solution_number]);
+
+	ConfigList::updateListForAll();
+	for (int i = 0; i < conflictsTable->rowCount(); i++) {
+		conflictsTable->item(i, 2)->setText(
+			conflictsTable->item(i, 1)->text());
+	}
+	updateConflictsViewColorization();
+	QMessageBox msgBox;
+	msgBox.setText("The solution has been applied.");
+	msgBox.exec();
+}
+
+void ConflictsView::changeToYes()
+{
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	if (select->hasSelection()) {
+		QModelIndexList rows = select->selectedRows();
+		for (int i = 0; i < rows.count(); i++) {
+			conflictsTable->item(rows[i].row(), 1)
+				->setText(tristate_value_to_string(yes));
+		}
+	}
+}
+
+void ConflictsView::changeToModule()
+{
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	if (select->hasSelection()) {
+		QModelIndexList rows = select->selectedRows();
+		for (int i = 0; i < rows.count(); i++) {
+			conflictsTable->item(rows[i].row(), 1)
+				->setText(tristate_value_to_string(mod));
+		}
+	}
+}
+
+void ConflictsView::changeToNo()
+{
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	if (select->hasSelection()) {
+		QModelIndexList rows = select->selectedRows();
+		for (int i = 0; i < rows.count(); i++) {
+			conflictsTable->item(rows[i].row(), 1)
+				->setText(tristate_value_to_string(no));
+		}
+	}
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
+}
+
+void ConflictsView::addSymbolFromMenu(struct menu *m)
+{
+	// adds a symbol to the conflict resolver list
+	if (m != nullptr) {
+		if (m->sym != nullptr) {
+			struct symbol *sym = m->sym;
+			tristate currentval = sym_get_tristate_value(sym);
+			//if symbol is not added yet:
+			QAbstractItemModel *tableModel =
+				conflictsTable->model();
+			QModelIndexList matches = tableModel->match(
+				tableModel->index(0, 0), Qt::DisplayRole,
+				QString(sym->name));
+			if (matches.isEmpty()) {
+				conflictsTable->insertRow(
+					conflictsTable->rowCount());
+				conflictsTable->setItem(
+					conflictsTable->rowCount() - 1, 0,
+					new QTableWidgetItem(sym->name));
+				conflictsTable->setItem(
+					conflictsTable->rowCount() - 1, 1,
+					new QTableWidgetItem(
+						tristate_value_to_string(
+							currentval)));
+				conflictsTable->setItem(
+					conflictsTable->rowCount() - 1, 2,
+					new QTableWidgetItem(
+						tristate_value_to_string(
+							currentval)));
+			} else {
+				conflictsTable->item(matches[0].row(), 2)
+					->setText(tristate_value_to_string(
+						currentval));
+			}
+		}
+	}
+}
+
+void ConflictsView::addSymbolFromContextMenu()
+{
+	struct menu *menu;
+
+	if (currentSelection.count() < 0) {
+		return;
+	}
+	for (auto el : currentSelection) {
+		ConfigItem *item = (ConfigItem *)el;
+		if (!item) {
+			continue;
+		}
+		menu = item->menu;
+		addSymbolFromMenu(menu);
+	}
+}
+
+void ConflictsView::removeSymbol()
+{
+	QItemSelectionModel *select = conflictsTable->selectionModel();
+	QAbstractItemModel *itemModel = select->model();
+	if (select->hasSelection()) {
+		QModelIndexList rows = select->selectedRows();
+		itemModel->removeRows(rows[0].row(), rows.size());
+	}
+}
+
+void ConflictsView::cellClicked(int row, int column)
+{
+	auto itemText = conflictsTable->item(row, 0)->text().toUtf8().data();
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
+	if (column == 1) {
+		// cycle to new value
+		tristate old_val = string_value_to_tristate(
+			conflictsTable->item(row, 1)->text());
+		tristate new_val = old_val;
+		switch (old_val) {
+		case no:
+			new_val = mod;
+			break;
+		case mod:
+			new_val = yes;
+			break;
+		case yes:
+			new_val = no;
+			break;
+		}
+		if (sym->type == S_BOOLEAN && new_val == mod)
+			new_val = yes;
+		conflictsTable->item(row, 1)->setText(
+			tristate_value_to_string(new_val));
+	}
+	emit(conflictSelected(men));
+}
+
+void ConflictsView::changeSolutionTable(int solution_number)
+{
+	size_t i;
+
+	if (solution_output == nullptr || solution_number < 0) {
+		return;
+	}
+	struct sfix_list *selected_solution = solution_output[solution_number];
+	current_solution_number = solution_number;
+	solutionTable->setRowCount(0);
+	i = 0;
+	for (struct list_head *curr = selected_solution->list.next;
+	     curr != &selected_solution->list; curr = curr->next, ++i) {
+		solutionTable->insertRow(solutionTable->rowCount());
+		struct symbol_fix *cur_symbol =
+			select_symbol(selected_solution, i);
+
+		QTableWidgetItem *symbol_name =
+			new QTableWidgetItem(cur_symbol->sym->name);
+
+		solutionTable->setItem(solutionTable->rowCount() - 1, 0,
+				       symbol_name);
+
+		if (cur_symbol->type == symbolfix_type::SF_BOOLEAN) {
+			QTableWidgetItem *symbol_value = new QTableWidgetItem(
+				tristate_value_to_string(cur_symbol->tri));
+			solutionTable->setItem(solutionTable->rowCount() - 1, 1,
+					       symbol_value);
+		} else if (cur_symbol->type == symbolfix_type::SF_NONBOOLEAN) {
+			QTableWidgetItem *symbol_value =
+				new QTableWidgetItem(cur_symbol->nb_val.s);
+			solutionTable->setItem(solutionTable->rowCount() - 1, 1,
+					       symbol_value);
+		} else {
+			QTableWidgetItem *symbol_value =
+				new QTableWidgetItem(cur_symbol->disallowed.s);
+			solutionTable->setItem(solutionTable->rowCount() - 1, 1,
+					       symbol_value);
+		}
+	}
+	updateConflictsViewColorization();
+}
+
+void ConflictsView::updateConflictsViewColorization(void)
+{
+	auto green = QColor(0, 170, 0);
+	auto red = QColor(255, 0, 0);
+	auto grey = QColor(180, 180, 180);
+
+	if (solutionTable->rowCount() == 0 || current_solution_number < 0)
+		return;
+
+	for (int i = 0; i < solutionTable->rowCount(); i++) {
+		QTableWidgetItem *symbol = solutionTable->item(i, 0);
+		//symbol from solution list
+		struct symbol_fix *cur_symbol = select_symbol(
+			solution_output[current_solution_number], i);
+
+		// if symbol is editable but the value is not the target value from solution we got, the color is red
+		// if symbol is editable but the value is the target value from solution we got, the color is green
+		// if symbol is not editable , the value is not the target value, the color is grey
+		// if symbol is not editable , the value is the target value, the color is green
+		auto editable = sym_string_within_range(
+			cur_symbol->sym,
+			tristate_value_to_string(cur_symbol->tri)
+				.toStdString()
+				.c_str());
+		auto _symbol =
+			solutionTable->item(i, 0)->text().toUtf8().data();
+		struct symbol *sym_ = sym_find(_symbol);
+
+		tristate current_value_of_symbol = sym_get_tristate_value(sym_);
+		tristate target_value_of_symbol = string_value_to_tristate(
+			solutionTable->item(i, 1)->text());
+		bool symbol_value_same_as_target = current_value_of_symbol ==
+						   target_value_of_symbol;
+
+		if (editable && !symbol_value_same_as_target) {
+			symbol->setForeground(red);
+		} else if (editable && symbol_value_same_as_target) {
+			symbol->setForeground(green);
+		} else if (!editable && !symbol_value_same_as_target) {
+			symbol->setForeground(grey);
+		} else if (!editable && symbol_value_same_as_target) {
+			symbol->setForeground(green);
+		}
+	}
+}
+
+void ConflictsView::runSatConfAsync()
+{
+	//loop through the rows in conflicts table adding each row into the array:
+	struct symbol_dvalue *p = nullptr;
+	std::vector<struct symbol_dvalue *> wanted_symbols;
+
+	p = static_cast<struct symbol_dvalue *>(calloc(
+		conflictsTable->rowCount(), sizeof(struct symbol_dvalue)));
+	if (!p) {
+		printf("memory allocation error\n");
+		return;
+	}
+
+	for (int i = 0; i < conflictsTable->rowCount(); i++) {
+		struct symbol_dvalue *tmp = (p + i);
+		auto _symbol =
+			conflictsTable->item(i, 0)->text().toUtf8().data();
+		struct symbol *sym = sym_find(_symbol);
+
+		tmp->sym = sym;
+		tmp->type = static_cast<symboldv_type>(
+			sym->type == symbol_type::S_BOOLEAN ? 0 : 1);
+		tmp->tri = string_value_to_tristate(
+			conflictsTable->item(i, 1)->text());
+		wanted_symbols.push_back(tmp);
+	}
+	fixConflictsAction_->setText("Cancel");
+	loadingAction->setVisible(true);
+
+	solution_output = run_satconf(wanted_symbols.data(),
+				      wanted_symbols.size(), &num_solutions);
+
+	free(p);
+	emit resultsReady();
+	{
+		std::lock_guard<std::mutex> lk{ satconf_mutex };
+		satconf_cancelled = true;
+	}
+	satconf_cancellation_cv.notify_one();
+}
+
+void ConflictsView::updateResults(void)
+{
+	fixConflictsAction_->setText("Calculate Fixes");
+	loadingAction->setVisible(false);
+	if (!(solution_output == nullptr || num_solutions == 0)) {
+		solutionSelector->clear();
+		for (unsigned int i = 0; i < num_solutions; i++)
+			solutionSelector->addItem(QString::number(i + 1));
+		// populate the solution table from the first solution gotten
+		numSolutionLabel->setText(
+			QString("Solutions: (%1) found").arg(num_solutions));
+		changeSolutionTable(0);
+	} else {
+		QMessageBox msgBox;
+		msgBox.setText("All symbols are already within range.");
+		msgBox.exec();
+	}
+	if (runSatConfAsyncThread->joinable()) {
+		runSatConfAsyncThread->join();
+		delete runSatConfAsyncThread;
+		runSatConfAsyncThread = nullptr;
+	}
+}
+
+void ConflictsView::calculateFixes()
+{
+	if (conflictsTable->rowCount() == 0) {
+		printd("table is empty\n");
+		return;
+	}
+
+	if (runSatConfAsyncThread == nullptr) {
+		// fire away asynchronous call
+		std::unique_lock<std::mutex> lk{ satconf_mutex };
+
+		numSolutionLabel->setText(QString("Solutions: "));
+		solutionSelector->clear();
+		solutionTable->setRowCount(0);
+		satconf_cancelled = false;
+		runSatConfAsyncThread =
+			new std::thread(&ConflictsView::runSatConfAsync, this);
+	} else {
+		printd("Interrupting rangefix\n");
+		interrupt_rangefix();
+		std::unique_lock<std::mutex> lk{ satconf_mutex };
+		satconf_cancellation_cv.wait(lk, [this] {
+			return satconf_cancelled == true;
+		});
+	}
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
+}
+
 void fixup_rootmenu(struct menu *menu)
 {
 	struct menu *child;
@@ -1871,6 +2465,8 @@ int main(int ac, char** av)
 	fixup_rootmenu(&rootmenu);
 	//zconfdump(stdout);
 
+	picosat_available = load_picosat();
+
 	configApp = new QApplication(ac, av);
 
 	configSettings = new ConfigSettings();
@@ -1891,3 +2487,79 @@ int main(int ac, char** av)
 
 	return 0;
 }
+
+dropAbleView::dropAbleView(QWidget *parent)
+	: QTableWidget(parent)
+{
+}
+
+dropAbleView::~dropAbleView()
+{
+}
+void dropAbleView::dropEvent(QDropEvent *event)
+{
+	event->acceptProposedAction();
+}
+
+static QString tristate_value_to_string(tristate val)
+{
+	switch (val) {
+	case yes:
+		return QString::fromStdString("Y");
+	case mod:
+		return QString::fromStdString("M");
+	case no:
+		return QString::fromStdString("N");
+	default:
+		return QString::fromStdString("");
+	}
+}
+
+static tristate string_value_to_tristate(QString s)
+{
+	if (s == "Y")
+		return tristate::yes;
+	else if (s == "M")
+		return tristate::mod;
+	else if (s == "N")
+		return tristate::no;
+	else
+		return tristate::no;
+}
+
+PicoSATInstallInfoWindow::PicoSATInstallInfoWindow(QWidget *parent)
+	: QDialog(parent)
+{
+	QVBoxLayout &layout = *new QVBoxLayout(this);
+	QLabel &text = *new QLabel();
+	text.setWordWrap(true);
+	layout.addWidget(&text);
+	text.setTextFormat(Qt::MarkdownText);
+	text.setTextInteractionFlags(Qt::TextSelectableByMouse);
+	text.setTextInteractionFlags(Qt::TextBrowserInteraction);
+	text.setOpenExternalLinks(true);
+	text.setText(R""""(
+Install the picosat package or build the library yourself:
+
+## Debian-based distributions
+
+```sh
+sudo apt install picosat
+```
+
+## Fedora
+
+```sh
+sudo dnf install picosat
+```
+
+## Other
+
+You can also build PicoSAT yourself from the
+[sources](https://fmv.jku.at/picosat/picosat-965.tar.gz). You need to compile
+PicoSAT with tracing enabled as a shared library under the name of
+"libpicosat-trace.so", "libpicosat-trace.so.0" or "libpicosat-trace.so.1".
+Tracing can be enabled using the `configure.sh` script with the `--trace`
+option.
+			  )"""");
+}
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index aab25ece95c6..807b7a47544c 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -14,8 +14,17 @@
 #include <QStyledItemDelegate>
 #include <QTextBrowser>
 #include <QTreeWidget>
+#include <QTableWidget>
+#include <QList>
+#include <QComboBox>
+#include <QVBoxLayout>
+#include <QLabel>
+#include <thread>
+#include <condition_variable>
 
 #include "expr.h"
+#include "cf_defs.h"
+
 
 class ConfigList;
 class ConfigItem;
@@ -80,6 +89,8 @@ public slots:
 	void parentSelected(void);
 	void gotFocus(struct menu *);
 	void showNameChanged(bool on);
+	void selectionChanged(QList<QTreeWidgetItem *> selection);
+	void updateConflictsViewColorization();
 
 public:
 	void updateListAll(void)
@@ -111,6 +122,82 @@ public slots:
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
+	void applyFixButtonClick();
+	void updateConflictsViewColorization();
+	void updateResults();
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
+	struct sfix_list **solution_output{nullptr};
+	size_t num_solutions;
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
+private:
+	void addPicoSatNote(QToolBar &layout);
 };
 
 class ConfigItem : public QTreeWidgetItem {
@@ -214,6 +301,12 @@ public slots:
 	bool _showDebug;
 };
 
+class PicoSATInstallInfoWindow : public QDialog {
+	Q_OBJECT
+public:
+	PicoSATInstallInfoWindow(QWidget *parent);
+};
+
 class ConfigSearchWindow : public QDialog {
 	Q_OBJECT
 	typedef class QDialog Parent;
@@ -223,6 +316,9 @@ class ConfigSearchWindow : public QDialog {
 public slots:
 	void saveSettings(void);
 	void search(void);
+	void updateConflictsViewColorizationFowarder();
+signals:
+	void updateConflictsViewColorization();
 
 protected:
 	QLineEdit* editField;
@@ -258,6 +354,8 @@ public slots:
 	void showIntro(void);
 	void showAbout(void);
 	void saveSettings(void);
+	void conflictSelected(struct menu *);
+	void refreshMenu();
 
 protected:
 	void closeEvent(QCloseEvent *e);
@@ -266,10 +364,23 @@ public slots:
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
2.39.5


