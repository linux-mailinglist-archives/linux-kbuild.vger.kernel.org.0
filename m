Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1AC12565E9
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgH2IPX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:15:23 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47660 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgH2IPA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:15:00 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfm014307;
        Sat, 29 Aug 2020 17:14:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfm014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688864;
        bh=1hIq6ZEqp/v1iB+uAOdAiLH/pwMC3I09n/InGsbAoME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b+p5ipOtVuitKAgcNXrGjRHbfeBTHBOB/sdoucymsTuJcidjFCIl/dHZPbgurzUR3
         CD+Te41EEUbs50QN33xtO33wYZiYeqnz9Qi0LS/oNDlVsbjqC1LHQ2AxDxrKspa7Qa
         7BumVGgSzKrqoR+b8RHRjWsmWkBqB+yDcuTl9UsqtXZ3BdLGQtK9oNok52X7agwgOZ
         xzA9AvPtehCvf9v0K7mCq0okl1X68Z4xdZlpuPrkgBO7pM3X0ghA35LST2RWEZbn5s
         92GXsyOouPAs+1HQsGRkuz4RQMP5pKOAuT/5UWKruCD4adg0KE8s9+UW6B1TKMZYRa
         Jh2b/CYJyCURQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] kconfig: qconf: allow to edit "int", "hex", "string" menus in-place
Date:   Sat, 29 Aug 2020 17:14:12 +0900
Message-Id: <20200829081417.725978-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Previously, when you double-clicked the "int", "hex", or "string" menus,
a line-edit gadget showed up to allow you to input the value, which
looked clumsy.

Also, it was buggy; the editor opened even if the config option was not
editable. For example, just try to double-click CC_VERSION_TEXT, which
has no prompt.

This commit sub-classes QStyleItemDelegate to allow users to edit
"int", "hex", "string" menus in-place. Just double-click (or press
the F2 key) in the data column. Then, an editor widget is placed on
top of the item view.

The two methods are overridden:

 createEditor - process only when the data column is being accessed
 and the menu is visible. Otherwise, return nullptr to disallow editing.

 setModelData - take the new data from the editor, and set it to the
 addressed symbol. If it was successful, update all the list windows.
 Otherwise, (the reason for the failure is possibly the input data was
 out of range), set the old value back to the editor.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 93 ++++++++++++++++++++++++++++++++--------
 scripts/kconfig/qconf.h  | 15 +++++++
 2 files changed, 91 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c48e48a3735f..d592f05363c9 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -180,15 +180,7 @@ void ConfigItem::updateMenu(void)
 	case S_INT:
 	case S_HEX:
 	case S_STRING:
-		const char* data;
-
-		data = sym_get_string_value(sym);
-
-		setText(dataColIdx, data);
-		if (type == S_STRING)
-			prompt = QString("%1: %2").arg(prompt).arg(data);
-		else
-			prompt = QString("(%2) %1").arg(prompt).arg(data);
+		setText(dataColIdx, sym_get_string_value(sym));
 		break;
 	}
 	if (!sym_has_value(sym) && visible)
@@ -229,6 +221,17 @@ void ConfigItem::init(void)
 		if (list->mode != fullMode)
 			setExpanded(true);
 		sym_calc_value(menu->sym);
+
+		if (menu->sym) {
+			enum symbol_type type = menu->sym->type;
+
+			// Allow to edit "int", "hex", and "string" in-place in
+			// the data column. Unfortunately, you cannot specify
+			// the flags per column. Set ItemIsEditable for all
+			// columns here, and check the column in createEditor().
+			if (type == S_INT || type == S_HEX || type == S_STRING)
+				setFlags(flags() | Qt::ItemIsEditable);
+		}
 	}
 	updateMenu();
 }
@@ -249,6 +252,61 @@ ConfigItem::~ConfigItem(void)
 	}
 }
 
+QWidget *ConfigItemDelegate::createEditor(QWidget *parent,
+					  const QStyleOptionViewItem &option,
+					  const QModelIndex &index) const
+{
+	ConfigItem *item;
+
+	// Only the data column is editable
+	if (index.column() != dataColIdx)
+		return nullptr;
+
+	// You cannot edit invisible menus
+	item = static_cast<ConfigItem *>(index.internalPointer());
+	if (!item || !item->menu || !menu_is_visible(item->menu))
+		return nullptr;
+
+	return QStyledItemDelegate::createEditor(parent, option, index);
+}
+
+void ConfigItemDelegate::setModelData(QWidget *editor,
+				      QAbstractItemModel *model,
+				      const QModelIndex &index) const
+{
+	QLineEdit *lineEdit;
+	ConfigItem *item;
+	struct symbol *sym;
+	bool success;
+
+	lineEdit = qobject_cast<QLineEdit *>(editor);
+	// If this is not a QLineEdit, use the parent's default.
+	// (does this happen?)
+	if (!lineEdit)
+		goto parent;
+
+	item = static_cast<ConfigItem *>(index.internalPointer());
+	if (!item || !item->menu)
+		goto parent;
+
+	sym = item->menu->sym;
+	if (!sym)
+		goto parent;
+
+	success = sym_set_string_value(sym, lineEdit->text().toUtf8().data());
+	if (success) {
+		ConfigList::updateListForAll();
+	} else {
+		QMessageBox::information(editor, "qconf",
+			"Cannot set the data (maybe due to out of range).\n"
+			"Setting the old value.");
+		lineEdit->setText(sym_get_string_value(sym));
+	}
+
+parent:
+	QStyledItemDelegate::setModelData(editor, model, index);
+}
+
 ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
 	: Parent(parent)
 {
@@ -314,6 +372,8 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 
 	showColumn(promptColIdx);
 
+	setItemDelegate(new ConfigItemDelegate(this));
+
 	allLists.append(this);
 
 	reinit();
@@ -534,10 +594,7 @@ void ConfigList::changeValue(ConfigItem* item)
 		if (oldexpr != newexpr)
 			ConfigList::updateListForAll();
 		break;
-	case S_INT:
-	case S_HEX:
-	case S_STRING:
-		parent()->lineEdit->show(item);
+	default:
 		break;
 	}
 }
@@ -1797,10 +1854,12 @@ void ConfigMainWindow::showIntro(void)
 	static const QString str =
 		"Welcome to the qconf graphical configuration tool.\n\n"
 
-		"For each option, a blank box indicates the feature is "
-		"disabled, a check indicates it is enabled, and a dot "
-		"indicates that it is to be compiled as a module. Clicking on "
-		"the box will cycle through the three states.\n\n"
+		"For bool and tristate options, a blank box indicates the "
+		"feature is disabled, a check indicates it is enabled, and a "
+		"dot indicates that it is to be compiled as a module. Clicking "
+		"on the box will cycle through the three states. For int, hex, "
+		"and string options, double-clicking or pressing F2 on the "
+		"Value cell will allow you to edit the value.\n\n"
 
 		"If you do not see an option (e.g., a device driver) that you "
 		"believe should be present, try turning on Show All Options "
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index d01a6c620dbb..b02acf2464ec 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -11,6 +11,7 @@
 #include <QPushButton>
 #include <QSettings>
 #include <QSplitter>
+#include <QStyledItemDelegate>
 #include <QTextBrowser>
 #include <QTreeWidget>
 
@@ -172,6 +173,20 @@ class ConfigItem : public QTreeWidgetItem {
 	static QIcon menuIcon, menubackIcon;
 };
 
+class ConfigItemDelegate : public QStyledItemDelegate
+{
+private:
+	struct menu *menu;
+public:
+	ConfigItemDelegate(QObject *parent = nullptr)
+		: QStyledItemDelegate(parent) {}
+	QWidget *createEditor(QWidget *parent,
+			      const QStyleOptionViewItem &option,
+			      const QModelIndex &index) const override;
+	void setModelData(QWidget *editor, QAbstractItemModel *model,
+			  const QModelIndex &index) const override;
+};
+
 class ConfigLineEdit : public QLineEdit {
 	Q_OBJECT
 	typedef class QLineEdit Parent;
-- 
2.25.1

