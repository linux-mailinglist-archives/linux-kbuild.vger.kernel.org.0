Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430FE246D25
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 18:47:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388856AbgHQQiW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 12:38:22 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42207 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388850AbgHQQhQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 12:37:16 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 07HGah91005234;
        Tue, 18 Aug 2020 01:36:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 07HGah91005234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597682204;
        bh=Y9kvCkBRDORVCPVT1mJPY0BBXHAw2O9i2u+eZvD4dPI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eKqRHXAeWe6ohDPKS4xWtiJqfmxpRMMbN/ZZVDhaVYZGUG84bEZV9Byu0L/ps7QV1
         XfmKdfdzJ4Z0UYFY+GS4TnedR97hZea2odbuHhpN7G7QlZ/bNaq+k7rLtAFvXN3a38
         42CXBisAZe+SvuMTJZy5SXtRnk0LwbT5mgHBUOykHwJomueliJGn/SwpCKcTJxo9GD
         Pgjzg+LyZvZuCojaE8xNdQt7W8TXna88zMMWzzJAElcvso+I5KEUyfvHLgyEfOtToz
         YfSRZ6vbGLrWFi71PFFsOG13XxB5vanjNyEATvU2cgoSt3CbtSQbQv39pEYtYtDzBe
         BcOkpEJCBhnag==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kconfig: qconf: fix the popup menu in the ConfigInfoView window
Date:   Tue, 18 Aug 2020 01:36:30 +0900
Message-Id: <20200817163631.37034-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817163631.37034-1-masahiroy@kernel.org>
References: <20200817163631.37034-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not know when ConfigInfoView::createStandardContextMenu() is
called.

Because QTextEdit::createStandardContextMenu() is not virtual,
ConfigInfoView::createStandardContextMenu() cannot override it.
Even if right-click the ConfigInfoView window, the "Show Debug Info"
menu does not show up.

Build up the menu in the constructor, and invoke it from the
contextMenuEvent().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 29 +++++++++++++----------------
 scripts/kconfig/qconf.h  |  4 ++--
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c1812563b818..5a0aa159ec80 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1012,6 +1012,16 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
 		configSettings->endGroup();
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 	}
+
+	contextMenu = createStandardContextMenu();
+	QAction *action = new QAction("Show Debug Info", contextMenu);
+
+	action->setCheckable(true);
+	connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
+	connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setChecked(bool)));
+	action->setChecked(showDebug());
+	contextMenu->addSeparator();
+	contextMenu->addAction(action);
 }
 
 void ConfigInfoView::saveSettings(void)
@@ -1268,23 +1278,10 @@ void ConfigInfoView::clicked(const QUrl &url)
 	delete data;
 }
 
-QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
-{
-	QMenu* popup = Parent::createStandardContextMenu(pos);
-	QAction* action = new QAction("Show Debug Info", popup);
-
-	action->setCheckable(true);
-	connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
-	connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setChecked(bool)));
-	action->setChecked(showDebug());
-	popup->addSeparator();
-	popup->addAction(action);
-	return popup;
-}
-
-void ConfigInfoView::contextMenuEvent(QContextMenuEvent *e)
+void ConfigInfoView::contextMenuEvent(QContextMenuEvent *event)
 {
-	Parent::contextMenuEvent(e);
+	contextMenu->popup(event->globalPos());
+	event->accept();
 }
 
 ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 461df6419f15..0b97a9817d2b 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -215,6 +215,7 @@ public slots:
 class ConfigInfoView : public QTextBrowser {
 	Q_OBJECT
 	typedef class QTextBrowser Parent;
+	QMenu *contextMenu;
 public:
 	ConfigInfoView(QWidget* parent, const char *name = 0);
 	bool showDebug(void) const { return _showDebug; }
@@ -235,8 +236,7 @@ public slots:
 	QString debug_info(struct symbol *sym);
 	static QString print_filter(const QString &str);
 	static void expr_print_help(void *data, struct symbol *sym, const char *str);
-	QMenu *createStandardContextMenu(const QPoint & pos);
-	void contextMenuEvent(QContextMenuEvent *e);
+	void contextMenuEvent(QContextMenuEvent *event);
 
 	struct symbol *sym;
 	struct menu *_menu;
-- 
2.25.1

