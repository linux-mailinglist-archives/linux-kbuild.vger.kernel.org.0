Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8D02565E0
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgH2IPJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:15:09 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47637 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgH2IPA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:15:00 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfn014307;
        Sat, 29 Aug 2020 17:14:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfn014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688865;
        bh=uqFZkKm33mJYoOTxTpsO63pM/5PteCu1/yBdi8WuRqE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jmAJVCpiAtA0H7JwPE3i7Rv7zBdyNw0dDBYjlGw0E+AgvwElK2p52qOtEs4x3wuzA
         tCpUr3XLTbSSaJZshN5b1Z/cLA3md+ERgzI+4lKiybaspcMMHyAJ4B2NSuyTKQRJtU
         l/4SxgzHUHhd82gxoqBhgUg7ApSeSx4RiV3I30EiylLAtyvU2sBY1jFWU6Q0nWBNw/
         UZiQKaB1PdIaPLNN53sWDuXz6Mdwfaa+pLEPVsmQlXmIdkQ6jVanKBBEN60Lk7zXgi
         /+7ykd3Q2EYq8YAv012tilPG9ltn92Cuav+KC3UErALuY3PRkQwlEE0knhVQd/tyk6
         5EcQ5runXEPjg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] kconfig: qconf: remove ConfigLineEdit class
Date:   Sat, 29 Aug 2020 17:14:13 +0900
Message-Id: <20200829081417.725978-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that "int", "hex", "string" menus are edited in-place, this class
is no longer needed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 39 ---------------------------------------
 scripts/kconfig/qconf.h  | 18 ------------------
 2 files changed, 57 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index d592f05363c9..5c42c1ae9408 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -307,42 +307,6 @@ parent:
 	QStyledItemDelegate::setModelData(editor, model, index);
 }
 
-ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
-	: Parent(parent)
-{
-	connect(this, SIGNAL(editingFinished()), SLOT(hide()));
-}
-
-void ConfigLineEdit::show(ConfigItem* i)
-{
-	item = i;
-	if (sym_get_string_value(item->menu->sym))
-		setText(sym_get_string_value(item->menu->sym));
-	else
-		setText(QString());
-	Parent::show();
-	setFocus();
-}
-
-void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
-{
-	switch (e->key()) {
-	case Qt::Key_Escape:
-		break;
-	case Qt::Key_Return:
-	case Qt::Key_Enter:
-		sym_set_string_value(item->menu->sym, text().toLatin1());
-		ConfigList::updateListForAll();
-		break;
-	default:
-		Parent::keyPressEvent(e);
-		return;
-	}
-	e->accept();
-	parent()->list->setFocus();
-	hide();
-}
-
 ConfigList::ConfigList(ConfigView* p, const char *name)
 	: Parent(p),
 	  updateAll(false),
@@ -990,9 +954,6 @@ ConfigView::ConfigView(QWidget* parent, const char *name)
 
 	list = new ConfigList(this);
 	verticalLayout->addWidget(list);
-	lineEdit = new ConfigLineEdit(this);
-	lineEdit->hide();
-	verticalLayout->addWidget(lineEdit);
 }
 
 void ConfigView::setShowName(bool b)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index b02acf2464ec..a3ee91565d49 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -20,7 +20,6 @@
 class ConfigView;
 class ConfigList;
 class ConfigItem;
-class ConfigLineEdit;
 class ConfigMainWindow;
 
 class ConfigSettings : public QSettings {
@@ -187,22 +186,6 @@ class ConfigItemDelegate : public QStyledItemDelegate
 			  const QModelIndex &index) const override;
 };
 
-class ConfigLineEdit : public QLineEdit {
-	Q_OBJECT
-	typedef class QLineEdit Parent;
-public:
-	ConfigLineEdit(ConfigView* parent);
-	ConfigView* parent(void) const
-	{
-		return (ConfigView*)Parent::parent();
-	}
-	void show(ConfigItem *i);
-	void keyPressEvent(QKeyEvent *e);
-
-public:
-	ConfigItem *item;
-};
-
 class ConfigView : public QWidget {
 	Q_OBJECT
 	typedef class QWidget Parent;
@@ -219,7 +202,6 @@ public slots:
 	void showRangeChanged(bool);
 public:
 	ConfigList* list;
-	ConfigLineEdit* lineEdit;
 };
 
 class ConfigInfoView : public QTextBrowser {
-- 
2.25.1

