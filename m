Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF9E2565E1
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbgH2IPH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:15:07 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47643 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbgH2IO7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:14:59 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfo014307;
        Sat, 29 Aug 2020 17:14:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfo014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688865;
        bh=KkzQu7CRrtVxO3g6s58gHqkOrgNmPik0Jf0k+eEPXy4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yP2t7aZgs/UxH2YuB5yHYevWwTGsMQEbWWfWsxNOqu0Ts4kqve70JjZEJPpvih7/S
         hZAH8kqUl1yuomZhp+AOVazbM33q4K9Flm3bSfSUFnzgCBre2Gtc1SmsMLbAd4lNUP
         cbZou1G1YfxFc7kGXs0ubHOKsE7qLUAQVD4jkATgVMZZCbKOCO8hPJuKehCCwIcnPK
         LcB7ceED9TNKu0cSZAPk+ATh2tnRQDqRStG404vmusKUtaLaAtCNwzJGY/vB4oOJb7
         tlZRghbyxwLtw5tshCabqnhARwF9w//NHnJHzeF9aobq4vwrbVUOpxvCQ2KYFaElW9
         J4NM5GrKPEZ9g==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] kconfig: qconf: move setShowName/Range() to ConfigList from ConfigView
Date:   Sat, 29 Aug 2020 17:14:14 +0900
Message-Id: <20200829081417.725978-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

ConfigView::setShowName/Range() only get access to the 'list' member.

Move them to the more relevant ConfigList class.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 53 +++++++++++++++++++++-------------------
 scripts/kconfig/qconf.h  | 12 +++------
 2 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 5c42c1ae9408..db7eba95cdf8 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -920,8 +920,8 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 		action = new QAction("Show Name", this);
 		action->setCheckable(true);
 		connect(action, SIGNAL(toggled(bool)),
-			parent(), SLOT(setShowName(bool)));
-		connect(parent(), SIGNAL(showNameChanged(bool)),
+			SLOT(setShowName(bool)));
+		connect(this, SIGNAL(showNameChanged(bool)),
 			action, SLOT(setChecked(bool)));
 		action->setChecked(showName);
 		headerPopup->addAction(action);
@@ -929,8 +929,8 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 		action = new QAction("Show Range", this);
 		action->setCheckable(true);
 		connect(action, SIGNAL(toggled(bool)),
-			parent(), SLOT(setShowRange(bool)));
-		connect(parent(), SIGNAL(showRangeChanged(bool)),
+			SLOT(setShowRange(bool)));
+		connect(this, SIGNAL(showRangeChanged(bool)),
 			action, SLOT(setChecked(bool)));
 		action->setChecked(showRange);
 		headerPopup->addAction(action);
@@ -940,6 +940,26 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 	e->accept();
 }
 
+void ConfigList::setShowName(bool on)
+{
+	if (showName == on)
+		return;
+
+	showName = on;
+	reinit();
+	emit showNameChanged(on);
+}
+
+void ConfigList::setShowRange(bool on)
+{
+	if (showRange == on)
+		return;
+
+	showRange = on;
+	reinit();
+	emit showRangeChanged(on);
+}
+
 QList<ConfigList *> ConfigList::allLists;
 QAction *ConfigList::showNormalAction;
 QAction *ConfigList::showAllAction;
@@ -956,24 +976,6 @@ ConfigView::ConfigView(QWidget* parent, const char *name)
 	verticalLayout->addWidget(list);
 }
 
-void ConfigView::setShowName(bool b)
-{
-	if (list->showName != b) {
-		list->showName = b;
-		list->reinit();
-		emit showNameChanged(b);
-	}
-}
-
-void ConfigView::setShowRange(bool b)
-{
-	if (list->showRange != b) {
-		list->showRange = b;
-		list->reinit();
-		emit showRangeChanged(b);
-	}
-}
-
 void ConfigList::setAllOpen(bool open)
 {
 	QTreeWidgetItemIterator it(this);
@@ -1460,11 +1462,12 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	QAction *showNameAction = new QAction("Show Name", this);
 	  showNameAction->setCheckable(true);
-	  connect(showNameAction, SIGNAL(toggled(bool)), configView, SLOT(setShowName(bool)));
-	  showNameAction->setChecked(configView->showName());
+	connect(showNameAction, SIGNAL(toggled(bool)), configList, SLOT(setShowName(bool)));
+	showNameAction->setChecked(configList->showName);
+
 	QAction *showRangeAction = new QAction("Show Range", this);
 	  showRangeAction->setCheckable(true);
-	  connect(showRangeAction, SIGNAL(toggled(bool)), configView, SLOT(setShowRange(bool)));
+	connect(showRangeAction, SIGNAL(toggled(bool)), configList, SLOT(setShowRange(bool)));
 
 	QActionGroup *optGroup = new QActionGroup(this);
 	optGroup->setExclusive(true);
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index a3ee91565d49..843725584bfa 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -76,6 +76,8 @@ public slots:
 	void updateSelection(void);
 	void saveSettings(void);
 	void setOptionMode(QAction *action);
+	void setShowName(bool on);
+	void setShowRange(bool on);
 
 signals:
 	void menuChanged(struct menu *menu);
@@ -83,6 +85,8 @@ public slots:
 	void itemSelected(struct menu *menu);
 	void parentSelected(void);
 	void gotFocus(struct menu *);
+	void showNameChanged(bool on);
+	void showRangeChanged(bool on);
 
 public:
 	void updateListAll(void)
@@ -192,14 +196,6 @@ class ConfigView : public QWidget {
 public:
 	ConfigView(QWidget* parent, const char *name = 0);
 
-	bool showName(void) const { return list->showName; }
-	bool showRange(void) const { return list->showRange; }
-public slots:
-	void setShowName(bool);
-	void setShowRange(bool);
-signals:
-	void showNameChanged(bool);
-	void showRangeChanged(bool);
 public:
 	ConfigList* list;
 };
-- 
2.25.1

