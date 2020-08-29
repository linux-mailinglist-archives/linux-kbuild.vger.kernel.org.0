Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05ACE2565E7
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgH2IPW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:15:22 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47661 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgH2IPA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:15:00 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfq014307;
        Sat, 29 Aug 2020 17:14:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfq014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688867;
        bh=cAwiyDQBc4rVj6A9uC7Rxsf1FCuTHT5ceickHFJ37uw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=28OF1KSVHt7W9WDBcE4giF5C7id3W9NsgpZElaz+ROkluHSNzmbZkFRdmaJx3Gxm+
         fsRJlnZ5rf2zM38Y0pcXhzQMPK9g44A3hVloZ/QTQfMjTGOoiXe6KIjuMED1igAgI8
         mREO4hayAkygxDfB8nlRXPhE2wk93uyU/yZ/qn7YGgT7OHXMZGus+okVH1HFnHAJCa
         f6qqcVnqL1IzFzzNW5U+PGobjiETQEOveVCPbDnU3imFMdtuH2J5BqLmTjNZPYMZC9
         LF/AV0Fjx+CigQzzFYrFgY6mljb97ZPNQZguw0TOGthNEQv35mLUNQWgzzbFVIKPKw
         /Pq8e1+1QynJg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] kconfig: qconf: remove Y, M, N columns
Date:   Sat, 29 Aug 2020 17:14:16 +0900
Message-Id: <20200829081417.725978-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There are so many ways to toggle bool / tristate options.

I do not know how useful these columns are.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 59 ++--------------------------------------
 scripts/kconfig/qconf.h  |  6 ++--
 2 files changed, 4 insertions(+), 61 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index b9333115dda3..09e98814485a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -139,9 +139,6 @@ void ConfigItem::updateMenu(void)
 
 		if (!sym_is_changeable(sym) && list->optMode == normalOpt) {
 			setIcon(promptColIdx, QIcon());
-			setText(noColIdx, QString());
-			setText(modColIdx, QString());
-			setText(yesColIdx, QString());
 			break;
 		}
 		expr = sym_get_tristate_value(sym);
@@ -151,12 +148,10 @@ void ConfigItem::updateMenu(void)
 				setIcon(promptColIdx, choiceYesIcon);
 			else
 				setIcon(promptColIdx, symbolYesIcon);
-			setText(yesColIdx, "Y");
 			ch = 'Y';
 			break;
 		case mod:
 			setIcon(promptColIdx, symbolModIcon);
-			setText(modColIdx, "M");
 			ch = 'M';
 			break;
 		default:
@@ -164,16 +159,9 @@ void ConfigItem::updateMenu(void)
 				setIcon(promptColIdx, choiceNoIcon);
 			else
 				setIcon(promptColIdx, symbolNoIcon);
-			setText(noColIdx, "N");
 			ch = 'N';
 			break;
 		}
-		if (expr != no)
-			setText(noColIdx, sym_tristate_within_range(sym, no) ? "_" : 0);
-		if (expr != mod)
-			setText(modColIdx, sym_tristate_within_range(sym, mod) ? "_" : 0);
-		if (expr != yes)
-			setText(yesColIdx, sym_tristate_within_range(sym, yes) ? "_" : 0);
 
 		setText(dataColIdx, QChar(ch));
 		break;
@@ -310,7 +298,7 @@ parent:
 ConfigList::ConfigList(QWidget *parent, const char *name)
 	: QTreeWidget(parent),
 	  updateAll(false),
-	  showName(false), showRange(false), mode(singleMode), optMode(normalOpt),
+	  showName(false), mode(singleMode), optMode(normalOpt),
 	  rootEntry(0), headerPopup(0)
 {
 	setObjectName(name);
@@ -320,7 +308,7 @@ ConfigList::ConfigList(QWidget *parent, const char *name)
 	setVerticalScrollMode(ScrollPerPixel);
 	setHorizontalScrollMode(ScrollPerPixel);
 
-	setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
+	setHeaderLabels(QStringList() << "Option" << "Name" << "Value");
 
 	connect(this, SIGNAL(itemSelectionChanged(void)),
 		SLOT(updateSelection(void)));
@@ -328,7 +316,6 @@ ConfigList::ConfigList(QWidget *parent, const char *name)
 	if (name) {
 		configSettings->beginGroup(name);
 		showName = configSettings->value("/showName", false).toBool();
-		showRange = configSettings->value("/showRange", false).toBool();
 		optMode = (enum optionMode)configSettings->value("/optionMode", 0).toInt();
 		configSettings->endGroup();
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
@@ -361,18 +348,10 @@ bool ConfigList::menuSkip(struct menu *menu)
 
 void ConfigList::reinit(void)
 {
-	hideColumn(yesColIdx);
-	hideColumn(modColIdx);
-	hideColumn(noColIdx);
 	hideColumn(nameColIdx);
 
 	if (showName)
 		showColumn(nameColIdx);
-	if (showRange) {
-		showColumn(noColIdx);
-		showColumn(modColIdx);
-		showColumn(yesColIdx);
-	}
 
 	updateListAll();
 }
@@ -394,7 +373,6 @@ void ConfigList::saveSettings(void)
 	if (!objectName().isEmpty()) {
 		configSettings->beginGroup(objectName());
 		configSettings->setValue("/showName", showName);
-		configSettings->setValue("/showRange", showRange);
 		configSettings->setValue("/optionMode", (int)optMode);
 		configSettings->endGroup();
 	}
@@ -841,15 +819,6 @@ void ConfigList::mouseReleaseEvent(QMouseEvent* e)
 			}
 		}
 		break;
-	case noColIdx:
-		setValue(item, no);
-		break;
-	case modColIdx:
-		setValue(item, mod);
-		break;
-	case yesColIdx:
-		setValue(item, yes);
-		break;
 	case dataColIdx:
 		changeValue(item);
 		break;
@@ -925,15 +894,6 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 			action, SLOT(setChecked(bool)));
 		action->setChecked(showName);
 		headerPopup->addAction(action);
-
-		action = new QAction("Show Range", this);
-		action->setCheckable(true);
-		connect(action, SIGNAL(toggled(bool)),
-			SLOT(setShowRange(bool)));
-		connect(this, SIGNAL(showRangeChanged(bool)),
-			action, SLOT(setChecked(bool)));
-		action->setChecked(showRange);
-		headerPopup->addAction(action);
 	}
 
 	headerPopup->exec(e->globalPos());
@@ -950,16 +910,6 @@ void ConfigList::setShowName(bool on)
 	emit showNameChanged(on);
 }
 
-void ConfigList::setShowRange(bool on)
-{
-	if (showRange == on)
-		return;
-
-	showRange = on;
-	reinit();
-	emit showRangeChanged(on);
-}
-
 QList<ConfigList *> ConfigList::allLists;
 QAction *ConfigList::showNormalAction;
 QAction *ConfigList::showAllAction;
@@ -1452,10 +1402,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 	connect(showNameAction, SIGNAL(toggled(bool)), configList, SLOT(setShowName(bool)));
 	showNameAction->setChecked(configList->showName);
 
-	QAction *showRangeAction = new QAction("Show Range", this);
-	  showRangeAction->setCheckable(true);
-	connect(showRangeAction, SIGNAL(toggled(bool)), configList, SLOT(setShowRange(bool)));
-
 	QActionGroup *optGroup = new QActionGroup(this);
 	optGroup->setExclusive(true);
 	connect(optGroup, SIGNAL(triggered(QAction*)), configList,
@@ -1506,7 +1452,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 	// create options menu
 	menu = menuBar()->addMenu("&Option");
 	menu->addAction(showNameAction);
-	menu->addAction(showRangeAction);
 	menu->addSeparator();
 	menu->addActions(optGroup->actions());
 	menu->addSeparator();
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 1289fdaa7d82..78b0a1dfcd53 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -29,7 +29,7 @@ class ConfigSettings : public QSettings {
 };
 
 enum colIdx {
-	promptColIdx, nameColIdx, noColIdx, modColIdx, yesColIdx, dataColIdx
+	promptColIdx, nameColIdx, dataColIdx
 };
 enum listMode {
 	singleMode, menuMode, symbolMode, fullMode, listMode
@@ -72,7 +72,6 @@ public slots:
 	void saveSettings(void);
 	void setOptionMode(QAction *action);
 	void setShowName(bool on);
-	void setShowRange(bool on);
 
 signals:
 	void menuChanged(struct menu *menu);
@@ -81,7 +80,6 @@ public slots:
 	void parentSelected(void);
 	void gotFocus(struct menu *);
 	void showNameChanged(bool on);
-	void showRangeChanged(bool on);
 
 public:
 	void updateListAll(void)
@@ -100,7 +98,7 @@ public slots:
 
 	bool updateAll;
 
-	bool showName, showRange;
+	bool showName;
 	enum listMode mode;
 	enum optionMode optMode;
 	struct menu *rootEntry;
-- 
2.25.1

