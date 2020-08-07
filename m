Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D142523EA1F
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgHGJUv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:20:51 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:42276 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgHGJUI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:20:08 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQF032147;
        Fri, 7 Aug 2020 18:19:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQF032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791966;
        bh=vg1UK8X3+Dt2794jmYGfE1ZPMS7oNKG3Ek8+eQungWw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XLrJq71ZCbrj4N4ifnUJFyfAHX7jl1wvjbNreybb077uwaoT2FZek9lEhLC/cNXbt
         l9wvyJUj8GFDriihv1Gfnu+pq+NfCXwssx2L6p+PnzqUSwGPBFSMYQYTMMw5ULASsh
         Qmqod5g2vOYKcp0/HBVeqkWbvzZotykhDTB6TLM4TuylLlVnoizYEr+Cusn9Pu+6Bq
         zxt9+BxG4Ng1SKe8x3D0tOyeU9INM7TAnoJOuiVv8GEEqWJ6H/3uifQyHflvl3Hmv2
         gXPbwTr1jEuC5nxtxqW9af/eMvdRQ+aAyzM3FWodsN2syY/s0vb3B2RcMuilnfiEy+
         8jhsxUwPJJF3Q==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/19] kconfig: qconf: move setOptionMode() to ConfigList from ConfigView
Date:   Fri,  7 Aug 2020 18:19:09 +0900
Message-Id: <20200807091909.2985787-19-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

ConfigView::setOptionMode() only gets access to the 'list' member.

Move it to the more relevant ConfigList class.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 scripts/kconfig/qconf.cc | 46 ++++++++++++++++++++--------------------
 scripts/kconfig/qconf.h  |  9 ++++----
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8eacebfeb030..ee6da1a8c636 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -358,6 +358,18 @@ void ConfigList::reinit(void)
 	updateListAll();
 }
 
+void ConfigList::setOptionMode(QAction *action)
+{
+	if (action == showNormalAction)
+		optMode = normalOpt;
+	else if (action == showAllAction)
+		optMode = allOpt;
+	else
+		optMode = promptOpt;
+
+	updateListAll();
+}
+
 void ConfigList::saveSettings(void)
 {
 	if (!objectName().isEmpty()) {
@@ -900,9 +912,9 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 }
 
 ConfigView*ConfigView::viewList;
-QAction *ConfigView::showNormalAction;
-QAction *ConfigView::showAllAction;
-QAction *ConfigView::showPromptAction;
+QAction *ConfigList::showNormalAction;
+QAction *ConfigList::showAllAction;
+QAction *ConfigList::showPromptAction;
 
 ConfigView::ConfigView(QWidget* parent, const char *name)
 	: Parent(parent)
@@ -933,18 +945,6 @@ ConfigView::~ConfigView(void)
 	}
 }
 
-void ConfigView::setOptionMode(QAction *act)
-{
-	if (act == showNormalAction)
-		list->optMode = normalOpt;
-	else if (act == showAllAction)
-		list->optMode = allOpt;
-	else
-		list->optMode = promptOpt;
-
-	list->updateListAll();
-}
-
 void ConfigView::setShowName(bool b)
 {
 	if (list->showName != b) {
@@ -1487,17 +1487,17 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	QActionGroup *optGroup = new QActionGroup(this);
 	optGroup->setExclusive(true);
-	connect(optGroup, SIGNAL(triggered(QAction*)), configView,
+	connect(optGroup, SIGNAL(triggered(QAction*)), configList,
 		SLOT(setOptionMode(QAction *)));
-	connect(optGroup, SIGNAL(triggered(QAction *)), menuView,
+	connect(optGroup, SIGNAL(triggered(QAction *)), menuList,
 		SLOT(setOptionMode(QAction *)));
 
-	configView->showNormalAction = new QAction("Show Normal Options", optGroup);
-	configView->showAllAction = new QAction("Show All Options", optGroup);
-	configView->showPromptAction = new QAction("Show Prompt Options", optGroup);
-	configView->showNormalAction->setCheckable(true);
-	configView->showAllAction->setCheckable(true);
-	configView->showPromptAction->setCheckable(true);
+	ConfigList::showNormalAction = new QAction("Show Normal Options", optGroup);
+	ConfigList::showNormalAction->setCheckable(true);
+	ConfigList::showAllAction = new QAction("Show All Options", optGroup);
+	ConfigList::showAllAction->setCheckable(true);
+	ConfigList::showPromptAction = new QAction("Show Prompt Options", optGroup);
+	ConfigList::showPromptAction->setCheckable(true);
 
 	QAction *showDebugAction = new QAction("Show Debug Info", this);
 	  showDebugAction->setCheckable(true);
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 460b858b0faa..461df6419f15 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -74,6 +74,8 @@ public slots:
 	void changeValue(ConfigItem* item);
 	void updateSelection(void);
 	void saveSettings(void);
+	void setOptionMode(QAction *action);
+
 signals:
 	void menuChanged(struct menu *menu);
 	void menuSelected(struct menu *menu);
@@ -105,6 +107,8 @@ public slots:
 	QPalette disabledColorGroup;
 	QPalette inactivedColorGroup;
 	QMenu* headerPopup;
+
+	static QAction *showNormalAction, *showAllAction, *showPromptAction;
 };
 
 class ConfigItem : public QTreeWidgetItem {
@@ -196,7 +200,6 @@ public slots:
 	void setShowName(bool);
 	void setShowRange(bool);
 	void setShowData(bool);
-	void setOptionMode(QAction *);
 signals:
 	void showNameChanged(bool);
 	void showRangeChanged(bool);
@@ -207,10 +210,6 @@ public slots:
 
 	static ConfigView* viewList;
 	ConfigView* nextView;
-
-	static QAction *showNormalAction;
-	static QAction *showAllAction;
-	static QAction *showPromptAction;
 };
 
 class ConfigInfoView : public QTextBrowser {
-- 
2.25.1

