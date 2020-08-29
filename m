Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFED2565ED
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727970AbgH2IPi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:15:38 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47668 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgH2IPA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:15:00 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfk014307;
        Sat, 29 Aug 2020 17:14:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfk014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688863;
        bh=VahKc/HaFNgT2RmugNFqwontBaR0a5S/rVJo6WlbKPE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SxsCo4g9jl4ROcSTJB83LV7uXomkh97YCLnGp6ZtnjopES0Ff9T/vCG4Nj6Neal2o
         UMBnc7CcQwgggsTnhfuK87D1cRCEbGGa38bVjlR3slRV5KfuJn964TGzwpKCTLFwmx
         HeeSyEt/OSFOFobBlnowbZ9BbQolpbzS0xF3EMM61abfnPX/K6AIcP5+t6mZxGg/2r
         PXGvr4B2c+yU7+EkyfBxSo0gGF9b4SxM7R6ZkON0ssoBEUeI8+LmUPFQ3cXlY01Rb8
         o8g1NmGzzmzjawMgx8u6qaMaDD16ubKZkqEJjMQuPZ1PDVFJFgM6Ocv0paaW4VNS8C
         qpWmRIG2X5DKQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] kconfig: qconf: move ConfigView::updateList(All) to ConfigList class
Date:   Sat, 29 Aug 2020 17:14:10 +0900
Message-Id: <20200829081417.725978-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

ConfigView::updateList() iterates over all views, and then calls
updateList() against for its ConfigList instance.

This means there is no point to implement it in the ConfigView class.

Move and rename as follows:

  ConfigView::updateList()     -> ConfigList::updateListForAll()
  ConfigView::updateListAll()  -> ConfigList::updateListAllForAll()

I used QList to contain all ConfigList instances.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 70 +++++++++++++++++++---------------------
 scripts/kconfig/qconf.h  | 11 +++----
 2 files changed, 39 insertions(+), 42 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 278c04de11ec..035101984bd3 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -274,7 +274,7 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 	case Qt::Key_Return:
 	case Qt::Key_Enter:
 		sym_set_string_value(item->menu->sym, text().toLatin1());
-		parent()->updateList();
+		ConfigList::updateListForAll();
 		break;
 	default:
 		Parent::keyPressEvent(e);
@@ -315,9 +315,16 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 
 	showColumn(promptColIdx);
 
+	allLists.append(this);
+
 	reinit();
 }
 
+ConfigList::~ConfigList()
+{
+	allLists.removeOne(this);
+}
+
 bool ConfigList::menuSkip(struct menu *menu)
 {
 	if (optMode == normalOpt && menu_is_visible(menu))
@@ -454,6 +461,28 @@ update:
 	resizeColumnToContents(0);
 }
 
+void ConfigList::updateListForAll()
+{
+	QListIterator<ConfigList *> it(allLists);
+
+	while (it.hasNext()) {
+		ConfigList *list = it.next();
+
+		list->updateList();
+	}
+}
+
+void ConfigList::updateListAllForAll()
+{
+	QListIterator<ConfigList *> it(allLists);
+
+	while (it.hasNext()) {
+		ConfigList *list = it.next();
+
+		list->updateList();
+	}
+}
+
 void ConfigList::setValue(ConfigItem* item, tristate val)
 {
 	struct symbol* sym;
@@ -474,7 +503,7 @@ void ConfigList::setValue(ConfigItem* item, tristate val)
 			return;
 		if (oldval == no && item->menu->list)
 			item->setExpanded(true);
-		parent()->updateList();
+		ConfigList::updateListForAll();
 		break;
 	}
 }
@@ -508,7 +537,7 @@ void ConfigList::changeValue(ConfigItem* item)
 				item->setExpanded(true);
 		}
 		if (oldexpr != newexpr)
-			parent()->updateList();
+			ConfigList::updateListForAll();
 		break;
 	case S_INT:
 	case S_HEX:
@@ -904,7 +933,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 	e->accept();
 }
 
-ConfigView*ConfigView::viewList;
+QList<ConfigList *> ConfigList::allLists;
 QAction *ConfigList::showNormalAction;
 QAction *ConfigList::showAllAction;
 QAction *ConfigList::showPromptAction;
@@ -921,21 +950,6 @@ ConfigView::ConfigView(QWidget* parent, const char *name)
 	lineEdit = new ConfigLineEdit(this);
 	lineEdit->hide();
 	verticalLayout->addWidget(lineEdit);
-
-	this->nextView = viewList;
-	viewList = this;
-}
-
-ConfigView::~ConfigView(void)
-{
-	ConfigView** vp;
-
-	for (vp = &viewList; *vp; vp = &(*vp)->nextView) {
-		if (*vp == this) {
-			*vp = nextView;
-			break;
-		}
-	}
 }
 
 void ConfigView::setShowName(bool b)
@@ -976,22 +990,6 @@ void ConfigList::setAllOpen(bool open)
 	}
 }
 
-void ConfigView::updateList()
-{
-	ConfigView* v;
-
-	for (v = viewList; v; v = v->nextView)
-		v->list->updateList();
-}
-
-void ConfigView::updateListAll(void)
-{
-	ConfigView* v;
-
-	for (v = viewList; v; v = v->nextView)
-		v->list->updateListAll();
-}
-
 ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
 	: Parent(parent), sym(0), _menu(0)
 {
@@ -1600,7 +1598,7 @@ void ConfigMainWindow::loadConfig(void)
 	free(configname);
 	configname = xstrdup(name);
 
-	ConfigView::updateListAll();
+	ConfigList::updateListAllForAll();
 }
 
 bool ConfigMainWindow::saveConfig(void)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index d41670f322b3..818e00617ae3 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -44,6 +44,7 @@ class ConfigList : public QTreeWidget {
 	typedef class QTreeWidget Parent;
 public:
 	ConfigList(ConfigView* p, const char *name = 0);
+	~ConfigList();
 	void reinit(void);
 	ConfigItem* findConfigItem(struct menu *);
 	ConfigView* parent(void) const
@@ -108,6 +109,10 @@ public slots:
 	QPalette inactivedColorGroup;
 	QMenu* headerPopup;
 
+	static QList<ConfigList *> allLists;
+	static void updateListForAll();
+	static void updateListAllForAll();
+
 	static QAction *showNormalAction, *showAllAction, *showPromptAction;
 };
 
@@ -188,9 +193,6 @@ class ConfigView : public QWidget {
 	typedef class QWidget Parent;
 public:
 	ConfigView(QWidget* parent, const char *name = 0);
-	~ConfigView(void);
-	static void updateList();
-	static void updateListAll(void);
 
 	bool showName(void) const { return list->showName; }
 	bool showRange(void) const { return list->showRange; }
@@ -206,9 +208,6 @@ public slots:
 public:
 	ConfigList* list;
 	ConfigLineEdit* lineEdit;
-
-	static ConfigView* viewList;
-	ConfigView* nextView;
 };
 
 class ConfigInfoView : public QTextBrowser {
-- 
2.25.1

