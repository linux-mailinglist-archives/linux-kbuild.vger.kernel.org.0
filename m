Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1F3437850
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Oct 2021 15:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbhJVNtv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Oct 2021 09:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbhJVNts (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Oct 2021 09:49:48 -0400
Received: from out1.mail.ruhr-uni-bochum.de (out1.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:8:1001::8693:3595])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3B7C061764
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Oct 2021 06:47:30 -0700 (PDT)
Received: from mx1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by out1.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4HbQdY3kQTz8SMQ;
        Fri, 22 Oct 2021 15:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2017;
        t=1634910449; bh=SBwlpfq21ioyJPfi4mbE//LsOetuENMvb4P2hWRd5GQ=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=Y2P+pLCobhntZvBh30uSIwH2QciN3NPzadhTcENZa8UccuCp8ua3E51WHeo9y9D6o
         QiCcbQo5WkkMF/t7WPAYbboSPLGWE2bYxXIWyxXwTFlP10qJS+/tYIC5oSufPjzVxt
         1AzvQrJw1WRAHYeXIddhtFbk9QFlhZHtEYsk2kFA=
Received: from out1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
        by mx1.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4HbQdY2ySHz8SN0;
        Fri, 22 Oct 2021 15:47:29 +0200 (CEST)
X-RUB-Notes: Internal origin=134.147.42.236
X-Envelope-Sender: <thorsten.berger@rub.de>
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [134.147.42.236])
        by out1.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTP id 4HbQdY19GQz8SMZ;
        Fri, 22 Oct 2021 15:47:29 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.1 at mx1.mail.ruhr-uni-bochum.de
Received: from [10.150.66.4] (nb02.ig09.ruhr-uni-bochum.de [10.150.66.4])
        by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4HbQdX5cWbzDgyf;
        Fri, 22 Oct 2021 15:47:28 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.0 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <c3df3ea3-a711-dff7-4ae4-b0e77f05a983@rub.de>
Date:   Fri, 22 Oct 2021 15:47:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: [RFC v3 11/12] Add xconfig-modifications
Content-Language: en-US
From:   Thorsten Berger <thorsten.berger@rub.de>
To:     linux-kbuild@vger.kernel.org
Cc:     deltaone@debian.org, phayax@gmail.com,
        Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
In-Reply-To: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Co-developed-by: Patrick Franz <deltaone@debian.org>
Signed-off-by: Patrick Franz <deltaone@debian.org>
Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
Suggested-by: Sarah Nadi <nadi@ualberta.ca>
Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>

The tool can be called from any configurator. We chose to modify xconfig for
this purpose. These files contain the necessary modifications to xconfig
in order to resolve conflicts.

---
 scripts/kconfig/qconf.cc | 1003 +++++++++++++++++++++++++++++---------
 scripts/kconfig/qconf.h  |  179 ++++++-
 2 files changed, 929 insertions(+), 253 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 78087b2d9ac6..a86cd09a1096 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -17,6 +17,10 @@
 #include <QMenuBar>
 #include <QMessageBox>
 #include <QToolBar>
+#include <QListWidget>
+#include <QComboBox>
+#include <QTableWidget>
+#include <QHBoxLayout>
 
 #include <stdlib.h>
 
@@ -24,7 +28,14 @@
 #include "qconf.h"
 
 #include "images.h"
+#include <iostream>
 
+#include <QAbstractItemView>
+#include <QMimeData>
+#include <QBrush>
+#include <QColor>
+#include <future>
+#include <memory>
 
 static QApplication *configApp;
 static ConfigSettings *configSettings;
@@ -82,6 +93,14 @@ QIcon ConfigItem::choiceNoIcon;
 QIcon ConfigItem::menuIcon;
 QIcon ConfigItem::menubackIcon;
 
+/*
+ * set the new data
+ * TODO check the value
+ */
+void ConfigItem::okRename(int col)
+{
+}
+
 /*
  * update the displayed of a menu entry
  */
@@ -122,7 +141,6 @@ void ConfigItem::updateMenu(void)
         goto set_prompt;
     case P_COMMENT:
         setIcon(promptColIdx, QIcon());
-        prompt = "*** " + prompt + " ***";
         goto set_prompt;
     default:
         ;
@@ -140,6 +158,9 @@ void ConfigItem::updateMenu(void)
 
         if (!sym_is_changeable(sym) && list->optMode == normalOpt) {
             setIcon(promptColIdx, QIcon());
+            setText(noColIdx, QString());
+            setText(modColIdx, QString());
+            setText(yesColIdx, QString());
             break;
         }
         expr = sym_get_tristate_value(sym);
@@ -149,10 +170,12 @@ void ConfigItem::updateMenu(void)
                 setIcon(promptColIdx, choiceYesIcon);
             else
                 setIcon(promptColIdx, symbolYesIcon);
+            setText(yesColIdx, "Y");
             ch = 'Y';
             break;
         case mod:
             setIcon(promptColIdx, symbolModIcon);
+            setText(modColIdx, "M");
             ch = 'M';
             break;
         default:
@@ -160,16 +183,31 @@ void ConfigItem::updateMenu(void)
                 setIcon(promptColIdx, choiceNoIcon);
             else
                 setIcon(promptColIdx, symbolNoIcon);
+            setText(noColIdx, "N");
             ch = 'N';
             break;
         }
+        if (expr != no)
+            setText(noColIdx, sym_tristate_within_range(sym, no) ? "_" : 0);
+        if (expr != mod)
+            setText(modColIdx, sym_tristate_within_range(sym, mod) ? "_" : 0);
+        if (expr != yes)
+            setText(yesColIdx, sym_tristate_within_range(sym, yes) ? "_" : 0);
 
         setText(dataColIdx, QChar(ch));
         break;
     case S_INT:
     case S_HEX:
     case S_STRING:
-        setText(dataColIdx, sym_get_string_value(sym));
+        const char* data;
+
+        data = sym_get_string_value(sym);
+
+        setText(dataColIdx, data);
+        if (type == S_STRING)
+            prompt = QString("%1: %2").arg(prompt).arg(data);
+        else
+            prompt = QString("(%2) %1").arg(prompt).arg(data);
         break;
     }
     if (!sym_has_value(sym) && visible)
@@ -210,17 +248,6 @@ void ConfigItem::init(void)
         if (list->mode != fullMode)
             setExpanded(true);
         sym_calc_value(menu->sym);
-
-        if (menu->sym) {
-            enum symbol_type type = menu->sym->type;
-
-            // Allow to edit "int", "hex", and "string" in-place in
-            // the data column. Unfortunately, you cannot specify
-            // the flags per column. Set ItemIsEditable for all
-            // columns here, and check the column in createEditor().
-            if (type == S_INT || type == S_HEX || type == S_STRING)
-                setFlags(flags() | Qt::ItemIsEditable);
-        }
     }
     updateMenu();
 }
@@ -241,65 +268,46 @@ ConfigItem::~ConfigItem(void)
     }
 }
 
-QWidget *ConfigItemDelegate::createEditor(QWidget *parent,
-                      const QStyleOptionViewItem &option,
-                      const QModelIndex &index) const
+ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
+    : Parent(parent)
 {
-    ConfigItem *item;
-
-    // Only the data column is editable
-    if (index.column() != dataColIdx)
-        return nullptr;
-
-    // You cannot edit invisible menus
-    item = static_cast<ConfigItem *>(index.internalPointer());
-    if (!item || !item->menu || !menu_is_visible(item->menu))
-        return nullptr;
-
-    return QStyledItemDelegate::createEditor(parent, option, index);
+    connect(this, SIGNAL(editingFinished()), SLOT(hide()));
 }
 
-void ConfigItemDelegate::setModelData(QWidget *editor,
-                      QAbstractItemModel *model,
-                      const QModelIndex &index) const
+void ConfigLineEdit::show(ConfigItem* i)
 {
-    QLineEdit *lineEdit;
-    ConfigItem *item;
-    struct symbol *sym;
-    bool success;
-
-    lineEdit = qobject_cast<QLineEdit *>(editor);
-    // If this is not a QLineEdit, use the parent's default.
-    // (does this happen?)
-    if (!lineEdit)
-        goto parent;
-
-    item = static_cast<ConfigItem *>(index.internalPointer());
-    if (!item || !item->menu)
-        goto parent;
-
-    sym = item->menu->sym;
-    if (!sym)
-        goto parent;
+    item = i;
+    if (sym_get_string_value(item->menu->sym))
+        setText(sym_get_string_value(item->menu->sym));
+    else
+        setText(QString());
+    Parent::show();
+    setFocus();
+}
 
-    success = sym_set_string_value(sym, lineEdit->text().toUtf8().data());
-    if (success) {
-        ConfigList::updateListForAll();
-    } else {
-        QMessageBox::information(editor, "qconf",
-            "Cannot set the data (maybe due to out of range).\n"
-            "Setting the old value.");
-        lineEdit->setText(sym_get_string_value(sym));
+void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
+{
+    switch (e->key()) {
+    case Qt::Key_Escape:
+        break;
+    case Qt::Key_Return:
+    case Qt::Key_Enter:
+        sym_set_string_value(item->menu->sym, text().toLatin1());
+        parent()->updateList();
+        break;
+    default:
+        Parent::keyPressEvent(e);
+        return;
     }
-
-parent:
-    QStyledItemDelegate::setModelData(editor, model, index);
+    e->accept();
+    parent()->list->setFocus();
+    hide();
 }
 
-ConfigList::ConfigList(QWidget *parent, const char *name)
-    : QTreeWidget(parent),
+ConfigList::ConfigList(ConfigView* p, const char *name)
+    : Parent(p),
       updateAll(false),
-      showName(false), mode(singleMode), optMode(normalOpt),
+      showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
       rootEntry(0), headerPopup(0)
 {
     setObjectName(name);
@@ -309,34 +317,26 @@ ConfigList::ConfigList(QWidget *parent, const char *name)
     setVerticalScrollMode(ScrollPerPixel);
     setHorizontalScrollMode(ScrollPerPixel);
 
-    setHeaderLabels(QStringList() << "Option" << "Name" << "Value");
+    setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
 
-    connect(this, &ConfigList::itemSelectionChanged,
-        this, &ConfigList::updateSelection);
+    connect(this, SIGNAL(itemSelectionChanged(void)),
+        SLOT(updateSelection(void)));
 
     if (name) {
         configSettings->beginGroup(name);
         showName = configSettings->value("/showName", false).toBool();
+        showRange = configSettings->value("/showRange", false).toBool();
+        showData = configSettings->value("/showData", false).toBool();
         optMode = (enum optionMode)configSettings->value("/optionMode", 0).toInt();
         configSettings->endGroup();
-        connect(configApp, &QApplication::aboutToQuit,
-            this, &ConfigList::saveSettings);
+        connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
     }
 
     showColumn(promptColIdx);
 
-    setItemDelegate(new ConfigItemDelegate(this));
-
-    allLists.append(this);
-
     reinit();
 }
 
-ConfigList::~ConfigList()
-{
-    allLists.removeOne(this);
-}
-
 bool ConfigList::menuSkip(struct menu *menu)
 {
     if (optMode == normalOpt && menu_is_visible(menu))
@@ -350,10 +350,21 @@ bool ConfigList::menuSkip(struct menu *menu)
 
 void ConfigList::reinit(void)
 {
+    hideColumn(dataColIdx);
+    hideColumn(yesColIdx);
+    hideColumn(modColIdx);
+    hideColumn(noColIdx);
     hideColumn(nameColIdx);
 
     if (showName)
         showColumn(nameColIdx);
+    if (showRange) {
+        showColumn(noColIdx);
+        showColumn(modColIdx);
+        showColumn(yesColIdx);
+    }
+    if (showData)
+        showColumn(dataColIdx);
 
     updateListAll();
 }
@@ -375,6 +386,8 @@ void ConfigList::saveSettings(void)
     if (!objectName().isEmpty()) {
         configSettings->beginGroup(objectName());
         configSettings->setValue("/showName", showName);
+        configSettings->setValue("/showRange", showRange);
+        configSettings->setValue("/showData", showData);
         configSettings->setValue("/optionMode", (int)optMode);
         configSettings->endGroup();
     }
@@ -400,6 +413,7 @@ void ConfigList::updateSelection(void)
     if (selectedItems().count() == 0)
         return;
 
+    emit selectedChanged(selectedItems());
     ConfigItem* item = (ConfigItem*)selectedItems().first();
     if (!item)
         return;
@@ -460,28 +474,6 @@ update:
     resizeColumnToContents(0);
 }
 
-void ConfigList::updateListForAll()
-{
-    QListIterator<ConfigList *> it(allLists);
-
-    while (it.hasNext()) {
-        ConfigList *list = it.next();
-
-        list->updateList();
-    }
-}
-
-void ConfigList::updateListAllForAll()
-{
-    QListIterator<ConfigList *> it(allLists);
-
-    while (it.hasNext()) {
-        ConfigList *list = it.next();
-
-        list->updateList();
-    }
-}
-
 void ConfigList::setValue(ConfigItem* item, tristate val)
 {
     struct symbol* sym;
@@ -502,7 +494,7 @@ void ConfigList::setValue(ConfigItem* item, tristate val)
             return;
         if (oldval == no && item->menu->list)
             item->setExpanded(true);
-        ConfigList::updateListForAll();
+        parent()->updateList();
         break;
     }
 }
@@ -536,9 +528,13 @@ void ConfigList::changeValue(ConfigItem* item)
                 item->setExpanded(true);
         }
         if (oldexpr != newexpr)
-            ConfigList::updateListForAll();
+            parent()->updateList();
+            emit UpdateConflictsViewColorization();
         break;
-    default:
+    case S_INT:
+    case S_HEX:
+    case S_STRING:
+        parent()->lineEdit->show(item);
         break;
     }
 }
@@ -821,6 +817,15 @@ void ConfigList::mouseReleaseEvent(QMouseEvent* e)
             }
         }
         break;
+    case noColIdx:
+        setValue(item, no);
+        break;
+    case modColIdx:
+        setValue(item, mod);
+        break;
+    case yesColIdx:
+        setValue(item, yes);
+        break;
     case dataColIdx:
         changeValue(item);
         break;
@@ -890,32 +895,107 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
         headerPopup = new QMenu(this);
         action = new QAction("Show Name", this);
         action->setCheckable(true);
-        connect(action, &QAction::toggled,
-            this, &ConfigList::setShowName);
-        connect(this, &ConfigList::showNameChanged,
-            action, &QAction::setChecked);
+        connect(action, SIGNAL(toggled(bool)),
+            parent(), SLOT(setShowName(bool)));
+        connect(parent(), SIGNAL(showNameChanged(bool)),
+            action, SLOT(setChecked(bool)));
         action->setChecked(showName);
         headerPopup->addAction(action);
+
+        action = new QAction("Show Range", this);
+        action->setCheckable(true);
+        connect(action, SIGNAL(toggled(bool)),
+            parent(), SLOT(setShowRange(bool)));
+        connect(parent(), SIGNAL(showRangeChanged(bool)),
+            action, SLOT(setChecked(bool)));
+        action->setChecked(showRange);
+        headerPopup->addAction(action);
+
+        action = new QAction("Show Data", this);
+        action->setCheckable(true);
+        connect(action, SIGNAL(toggled(bool)),
+            parent(), SLOT(setShowData(bool)));
+        connect(parent(), SIGNAL(showDataChanged(bool)),
+            action, SLOT(setChecked(bool)));
+        action->setChecked(showData);
+        headerPopup->addAction(action);
     }
 
     headerPopup->exec(e->globalPos());
     e->accept();
 }
 
-void ConfigList::setShowName(bool on)
+ConfigView*ConfigView::viewList;
+QAction *ConfigList::showNormalAction;
+QAction *ConfigList::showAllAction;
+QAction *ConfigList::showPromptAction;
+QAction *ConfigList::addSymbolsFromContextMenu;
+
+ConfigView::ConfigView(QWidget* parent, const char *name)
+    : Parent(parent)
 {
-    if (showName == on)
-        return;
+    setObjectName(name);
+    QVBoxLayout *verticalLayout = new QVBoxLayout(this);
+    verticalLayout->setContentsMargins(0, 0, 0, 0);
 
-    showName = on;
-    reinit();
-    emit showNameChanged(on);
+    list = new ConfigList(this);
+    list->setSelectionMode(QAbstractItemView::ExtendedSelection);
+    list->setContextMenuPolicy(Qt::CustomContextMenu);
+    connect(list, SIGNAL(customContextMenuRequested(const QPoint &)),
+        this, SLOT(ShowContextMenu(const QPoint &)));
+    verticalLayout->addWidget(list);
+    lineEdit = new ConfigLineEdit(this);
+    lineEdit->hide();
+    verticalLayout->addWidget(lineEdit);
+
+    this->nextView = viewList;
+    viewList = this;
 }
+void ConfigView::ShowContextMenu(const QPoint& pos){
+   QMenu contextMenu(tr("Context menu"), this);
 
-QList<ConfigList *> ConfigList::allLists;
-QAction *ConfigList::showNormalAction;
-QAction *ConfigList::showAllAction;
-QAction *ConfigList::showPromptAction;
+   contextMenu.addAction(ConfigList::addSymbolsFromContextMenu);
+   contextMenu.exec(mapToGlobal(pos));
+}
+
+ConfigView::~ConfigView(void)
+{
+    ConfigView** vp;
+
+    for (vp = &viewList; *vp; vp = &(*vp)->nextView) {
+        if (*vp == this) {
+            *vp = nextView;
+            break;
+        }
+    }
+}
+
+void ConfigView::setShowName(bool b)
+{
+    if (list->showName != b) {
+        list->showName = b;
+        list->reinit();
+        emit showNameChanged(b);
+    }
+}
+
+void ConfigView::setShowRange(bool b)
+{
+    if (list->showRange != b) {
+        list->showRange = b;
+        list->reinit();
+        emit showRangeChanged(b);
+    }
+}
+
+void ConfigView::setShowData(bool b)
+{
+    if (list->showData != b) {
+        list->showData = b;
+        list->reinit();
+        emit showDataChanged(b);
+    }
+}
 
 void ConfigList::setAllOpen(bool open)
 {
@@ -928,6 +1008,415 @@ void ConfigList::setAllOpen(bool open)
     }
 }
 
+void ConfigView::updateList()
+{
+    ConfigView* v;
+
+    for (v = viewList; v; v = v->nextView)
+        v->list->updateList();
+}
+
+void ConfigView::updateListAll(void)
+{
+    ConfigView* v;
+
+    for (v = viewList; v; v = v->nextView)
+        v->list->updateListAll();
+}
+
+ConflictsView::ConflictsView(QWidget* parent, const char *name)
+    : Parent(parent)
+{
+    currentSelectedMenu = nullptr;
+    setObjectName(name);
+    QHBoxLayout *horizontalLayout = new QHBoxLayout(this);
+    QVBoxLayout *verticalLayout = new QVBoxLayout();
+    verticalLayout->setContentsMargins(0, 0, 0, 0);
+    conflictsToolBar = new QToolBar("ConflictTools", this);
+
+    // toolbar buttons [n] [m] [y] [calculate fixes] [remove]
+    QAction *addSymbol = new QAction("Add Symbol");
+    QAction *setConfigSymbolAsNo = new QAction("N");
+    QAction *setConfigSymbolAsModule = new QAction("M");
+    QAction *setConfigSymbolAsYes = new QAction("Y");
+    fixConflictsAction_ = new QAction("Calculate Fixes");
+    QAction *removeSymbol = new QAction("Remove Symbol");
+
+    // If you change the order of buttons here, change the code where
+    // module button was disabled if symbol is boolean, selecting module
+    // button depends on a specific index in list of action
+    fixConflictsAction_->setCheckable(false);
+    conflictsToolBar->addAction(addSymbol);
+    conflictsToolBar->addAction(setConfigSymbolAsNo);
+    conflictsToolBar->addAction(setConfigSymbolAsModule);
+    conflictsToolBar->addAction(setConfigSymbolAsYes);
+    conflictsToolBar->addAction(fixConflictsAction_);
+    conflictsToolBar->addAction(removeSymbol);
+
+    verticalLayout->addWidget(conflictsToolBar);
+
+    connect(addSymbol, SIGNAL(triggered(bool)), SLOT(addSymbol()));
+    connect(setConfigSymbolAsNo, SIGNAL(triggered(bool)), SLOT(changeToNo()));
+    connect(setConfigSymbolAsModule, SIGNAL(triggered(bool)), SLOT(changeToModule()));
+    connect(setConfigSymbolAsYes, SIGNAL(triggered(bool)), SLOT(changeToYes()));
+    connect(removeSymbol, SIGNAL(triggered(bool)), SLOT(removeSymbol()));
+    connect(this, SIGNAL(resultsReady()), SLOT(updateResults()));
+    // connect clicking 'calculate fixes' to 'change all symbol values to fix all conflicts'
+    // no longer used anymore for now.
+    connect(fixConflictsAction_, SIGNAL(triggered(bool)), SLOT(calculateFixes()));
+
+    conflictsTable = (QTableWidget*) new droppableView(this);
+    conflictsTable->setRowCount(0);
+    conflictsTable->setColumnCount(3);
+    conflictsTable->setSelectionBehavior(QAbstractItemView::SelectRows);
+
+    conflictsTable->setHorizontalHeaderLabels(QStringList()  << "Option" << "Wanted value" << "Current value" );
+    verticalLayout->addWidget(conflictsTable);
+
+    conflictsTable->setDragDropMode(QAbstractItemView::DropOnly);
+    setAcceptDrops(true);
+
+    connect(conflictsTable, SIGNAL(cellClicked(int, int)), SLOT(cellClicked(int,int)));
+    horizontalLayout->addLayout(verticalLayout);
+
+    // populate the solution view on the right hand side:
+    QVBoxLayout *solutionLayout = new QVBoxLayout();
+    solutionLayout->setContentsMargins(0, 0, 0, 0);
+    solutionSelector = new QComboBox();
+    connect(solutionSelector, QOverload<int>::of(&QComboBox::currentIndexChanged),
+        [=](int index){ changeSolutionTable(index); });
+    solutionTable = new QTableWidget();
+    solutionTable->setRowCount(0);
+    solutionTable->setColumnCount(2);
+    solutionTable->setHorizontalHeaderLabels(QStringList()  << "Symbol" << "New Value" );
+
+    applyFixButton = new QPushButton("Apply Selected solution");
+    connect(applyFixButton, SIGNAL(clicked(bool)), SLOT(applyFixButtonClick()));
+
+    numSolutionLabel = new QLabel("Solutions:");
+    solutionLayout->addWidget(numSolutionLabel);
+    solutionLayout->addWidget(solutionSelector);
+    solutionLayout->addWidget(solutionTable);
+    solutionLayout->addWidget(applyFixButton);
+
+    horizontalLayout->addLayout(solutionLayout);
+
+}
+void QTableWidget::dropEvent(QDropEvent *event)
+{
+}
+
+void ConflictsView::changeToNo()
+{
+    QItemSelectionModel *select = conflictsTable->selectionModel();
+
+    if (select->hasSelection()) {
+        QModelIndexList rows = select->selectedRows();
+
+        for (int i = 0;i < rows.count(); i++) {
+            conflictsTable->item(rows[i].row(),1)->setText("NO");
+        }
+    }
+}
+
+void ConflictsView::applyFixButtonClick()
+{
+    signed int solution_number = solutionSelector->currentIndex();
+
+    if (solution_number == -1 || solution_output == NULL) {
+        return;
+    }
+
+    struct sfix_list * selected_solution = select_solution(solution_output, solution_number);
+
+    apply_fix(selected_solution);
+    ConfigView::updateListAll();
+}
+
+void ConflictsView::changeToYes()
+{
+    QItemSelectionModel *select = conflictsTable->selectionModel();
+
+    if (select->hasSelection()) {
+        QModelIndexList rows = select->selectedRows();
+
+        for (int i = 0;i < rows.count(); i++) {
+            conflictsTable->item(rows[i].row(),1)->setText("YES");
+        }
+    }
+
+}
+void ConflictsView::changeToModule()
+{
+    QItemSelectionModel *select = conflictsTable->selectionModel();
+
+    if (select->hasSelection()) {
+        QModelIndexList rows = select->selectedRows();
+
+        for (int i = 0;i < rows.count(); i++) {
+            conflictsTable->item(rows[i].row(),1)->setText("MODULE");
+        }
+    }
+
+}
+
+void ConflictsView::menuChanged1(struct menu *m)
+{
+    currentSelectedMenu = m;
+}
+
+void ConflictsView::addSymbol()
+{
+    addSymbol(currentSelectedMenu);
+}
+
+void ConflictsView::selectedChanged(QList<QTreeWidgetItem *> selection)
+{
+    currentSelection = selection;
+
+}
+
+void ConflictsView::addSymbol(struct menu *m)
+{
+    if (m != nullptr) {
+        if (m->sym != nullptr) {
+            struct symbol *sym = m->sym;
+            tristate currentval = sym_get_tristate_value(sym);
+            // if symbol is not added yet:
+            QAbstractItemModel* tableModel = conflictsTable->model();
+            QModelIndexList matches = tableModel->match(tableModel->index(0,0), Qt::DisplayRole, sym->name );
+
+            if (matches.isEmpty()) {
+                conflictsTable->insertRow(conflictsTable->rowCount());
+                conflictsTable->setItem(conflictsTable->rowCount()-1,0,new QTableWidgetItem(sym->name));
+                conflictsTable->setItem(conflictsTable->rowCount()-1,1,new QTableWidgetItem(tristate_value_to_string(currentval)));
+                conflictsTable->setItem(conflictsTable->rowCount()-1,2,new QTableWidgetItem(tristate_value_to_string(currentval)));
+            } else {
+                conflictsTable->item(matches[0].row(),2)->setText(tristate_value_to_string(currentval));
+            }
+        }
+    }
+}
+
+void ConflictsView::addSymbolFromContextMenu()
+{
+    struct menu *menu;
+
+    if (currentSelection.count() == 0)
+        return;
+
+    for (auto el: currentSelection) {
+        ConfigItem* item = (ConfigItem*)el;
+
+        if (!item) {
+            continue;
+        }
+
+        menu = item->menu;
+        addSymbol(menu);
+    }
+}
+
+void ConflictsView::removeSymbol()
+{
+    QItemSelectionModel *select = conflictsTable->selectionModel();
+    QAbstractItemModel *itemModel = select->model();
+
+    if (select->hasSelection()) {
+        QModelIndexList rows = select->selectedRows();
+        itemModel->removeRows(rows[0].row(),rows.size());
+    }
+}
+
+void ConflictsView::cellClicked(int row, int column)
+{
+    auto itemText = conflictsTable->item(row,0)->text().toUtf8().data();
+
+
+    struct symbol* sym = sym_find(itemText);
+    if (sym == NULL) {
+        return;
+    }
+    struct property* prop = sym->prop;
+    struct menu* men = prop->menu;
+    // uncommenting following like somehow disables click signal of 'apply selected solution'
+    if (sym->type == symbol_type::S_BOOLEAN) {
+        conflictsToolBar->actions()[2]->setDisabled(true);
+    } else {
+        conflictsToolBar->actions()[2]->setDisabled(false);
+    }
+    emit(conflictSelected(men));
+}
+
+void ConflictsView::changeSolutionTable(int solution_number)
+{
+    if(solution_output == nullptr || solution_number < 0) {
+        return;
+    }
+
+    struct sfix_list* selected_solution = select_solution(solution_output, solution_number);
+    current_solution_number = solution_number;
+    solutionTable->setRowCount(0);
+
+    for (unsigned int i = 0; i <selected_solution->size; i++) {
+        solutionTable->insertRow(solutionTable->rowCount());
+
+        struct symbol_fix* cur_symbol = select_symbol(selected_solution,i);
+        QTableWidgetItem* symbol_name = new QTableWidgetItem(cur_symbol->sym->name);
+
+        solutionTable->setItem(solutionTable->rowCount()-1,0,symbol_name);
+
+        if (cur_symbol->type == symbolfix_type::SF_BOOLEAN) {
+            QTableWidgetItem* symbol_value =
+               new QTableWidgetItem(
+                 tristate_value_to_string(cur_symbol->tri));
+            solutionTable->setItem(
+                  solutionTable->rowCount() - 1,
+                  1,
+                  symbol_value);
+        } else if (cur_symbol->type == symbolfix_type::SF_NONBOOLEAN) {
+            QTableWidgetItem* symbol_value =
+               new QTableWidgetItem(cur_symbol->nb_val.s);
+            solutionTable->setItem(
+                  solutionTable->rowCount() - 1,
+                  1,
+                  symbol_value);
+        } else {
+            QTableWidgetItem* symbol_value =
+               new QTableWidgetItem(cur_symbol->disallowed.s);
+            solutionTable->setItem(
+                  solutionTable->rowCount() - 1,
+                  1,
+                  symbol_value);
+        }
+    }
+    UpdateConflictsViewColorization();
+}
+
+void ConflictsView::UpdateConflictsViewColorization(void)
+{
+    auto green = QColor(0, 170, 0);
+    auto red = QColor(255, 0, 0);
+    auto grey = QColor(180, 180, 180);
+
+    if (solutionTable->rowCount() == 0 || current_solution_number < 0)
+        return;
+
+    for (int i = 0; i < solutionTable->rowCount(); i++) {
+        QTableWidgetItem *symbol = solutionTable->item(i, 0);
+        struct sfix_list * selected_solution =
+           select_solution(solution_output, current_solution_number);
+        struct symbol_fix* cur_symbol = select_symbol(selected_solution,i);
+
+        // Red: symbol is editable but value is not from solution
+        // Green: symbol is editable and value is from solution
+        // Grey: symbol is not editable and value is not target value
+        // Green: symbol is not editable and value is target value
+        auto editable = sym_string_within_range(cur_symbol->sym,
+              tristate_value_to_string(cur_symbol->tri).toStdString().c_str());
+        auto _symbol = solutionTable->item(i,0)->text().toUtf8().data();
+        struct symbol* sym_ = sym_find(_symbol);
+
+        tristate current_value_of_symbol = sym_get_tristate_value(sym_);
+        tristate target_value_of_symbol = string_value_to_tristate(solutionTable->item(i,1)->text());
+        bool symbol_value_same_as_target = current_value_of_symbol == target_value_of_symbol;
+
+        if (editable && !symbol_value_same_as_target) {
+            symbol->setForeground(red);
+        } else if (editable && symbol_value_same_as_target) {
+            symbol->setForeground(green);
+        } else if (!editable && !symbol_value_same_as_target) {
+            symbol->setForeground(grey);
+        } else if (!editable && symbol_value_same_as_target) {
+            symbol->setForeground(green);
+        }
+    }
+}
+
+void ConflictsView::runSatConfAsync()
+{
+    // loop through the rows in conflicts table adding each row into the array:
+    struct symbol_dvalue* p = nullptr;
+
+    p = static_cast<struct symbol_dvalue*>(calloc(conflictsTable->rowCount(),sizeof(struct symbol_dvalue)));
+
+    if (!p)
+        return;
+
+    struct sdv_list *wanted_symbols = sdv_list_init();
+
+    for (int i = 0; i < conflictsTable->rowCount(); i++) {
+
+        struct symbol_dvalue *tmp = (p+i);
+        auto _symbol = conflictsTable->item(i,0)->text().toUtf8().data();
+        struct symbol* sym = sym_find(_symbol);
+
+        tmp->sym = sym;
+        tmp->type = static_cast<symboldv_type>(sym->type == symbol_type::S_BOOLEAN?0:1);
+        tmp->tri = string_value_to_tristate(conflictsTable->item(i,1)->text());
+        sdv_list_add(wanted_symbols,tmp);
+    }
+
+    fixConflictsAction_->setText("Cancel");
+    struct sfl_list *ret = run_satconf(wanted_symbols);
+    solution_output = ret;
+
+    free(p);
+
+    emit resultsReady();
+    {
+        std::lock_guard<std::mutex> lk{satconf_mutex};
+        satconf_cancelled = true;
+    }
+
+    satconf_cancellation_cv.notify_one();
+}
+
+void ConflictsView::updateResults(void)
+{
+    fixConflictsAction_->setText("Calculate Fixes");
+
+    if (!(solution_output == nullptr || solution_output->size == 0)) {
+        solutionSelector->clear();
+
+        for (unsigned int i = 0; i < solution_output->size; i++) {
+            solutionSelector->addItem(QString::number(i+1));
+        }
+
+        numSolutionLabel->setText(QString("Solutions: (%1) found").arg(solution_output->size));
+        changeSolutionTable(0);
+    }
+
+    if (runSatConfAsyncThread->joinable()) {
+        runSatConfAsyncThread->join();
+        delete runSatConfAsyncThread;
+        runSatConfAsyncThread  = nullptr;
+    }
+}
+
+void ConflictsView::calculateFixes(void)
+{
+    if (conflictsTable->rowCount() == 0)
+        return;
+
+    if (runSatConfAsyncThread == nullptr) {
+        std::unique_lock<std::mutex> lk{satconf_mutex};
+
+        numSolutionLabel->setText(QString("Solutions: "));
+        solutionSelector->clear();
+        solutionTable->setRowCount(0);
+        satconf_cancelled = false;
+        runSatConfAsyncThread = new std::thread(&ConflictsView::runSatConfAsync,this);
+    } else {
+        interrupt_rangefix();
+        std::unique_lock<std::mutex> lk{satconf_mutex};
+        satconf_cancellation_cv.wait(lk,[this] {
+            return satconf_cancelled == true;
+        });
+    }
+
+}
+
 ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
     : Parent(parent), sym(0), _menu(0)
 {
@@ -938,18 +1427,15 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
         configSettings->beginGroup(objectName());
         setShowDebug(configSettings->value("/showDebug", false).toBool());
         configSettings->endGroup();
-        connect(configApp, &QApplication::aboutToQuit,
-            this, &ConfigInfoView::saveSettings);
+        connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
     }
 
     contextMenu = createStandardContextMenu();
     QAction *action = new QAction("Show Debug Info", contextMenu);
 
     action->setCheckable(true);
-    connect(action, &QAction::toggled,
-        this, &ConfigInfoView::setShowDebug);
-    connect(this, &ConfigInfoView::showDebugChanged,
-        action, &QAction::setChecked);
+    connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
+    connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setChecked(bool)));
     action->setChecked(showDebug());
     contextMenu->addSeparator();
     contextMenu->addAction(action);
@@ -1236,26 +1722,27 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
     layout2->setSpacing(6);
     layout2->addWidget(new QLabel("Find:", this));
     editField = new QLineEdit(this);
-    connect(editField, &QLineEdit::returnPressed,
-        this, &ConfigSearchWindow::search);
+    connect(editField, SIGNAL(returnPressed()), SLOT(search()));
     layout2->addWidget(editField);
     searchButton = new QPushButton("Search", this);
     searchButton->setAutoDefault(false);
-    connect(searchButton, &QPushButton::clicked,
-        this, &ConfigSearchWindow::search);
+    connect(searchButton, SIGNAL(clicked()), SLOT(search()));
     layout2->addWidget(searchButton);
     layout1->addLayout(layout2);
 
     split = new QSplitter(this);
     split->setOrientation(Qt::Vertical);
-    list = new ConfigList(split, "search");
-    list->mode = listMode;
+    list = new ConfigView(split, "search");
+    list->list->mode = listMode;
     info = new ConfigInfoView(split, "search");
-    connect(list, &ConfigList::menuChanged,
-        info, &ConfigInfoView::setInfo);
-    connect(list, &ConfigList::menuChanged,
-        parent, &ConfigMainWindow::setMenuLink);
-
+    connect(list->list, SIGNAL(menuChanged(struct menu *)),
+        info, SLOT(setInfo(struct menu *)));
+    connect(list->list, SIGNAL(menuChanged(struct menu *)),
+        parent, SLOT(setMenuLink(struct menu *)));
+    connect(list->list, SIGNAL(menuChanged(struct menu *)),
+        parent, SLOT(conflictSelected(struct menu *)));
+
+    connect(list->list,SIGNAL(UpdateConflictsViewColorization()),SLOT(UpdateConflictsViewColorizationFowarder()));
     layout1->addWidget(split);
 
     QVariant x, y;
@@ -1274,10 +1761,12 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
     if (ok)
         split->setSizes(sizes);
     configSettings->endGroup();
-    connect(configApp, &QApplication::aboutToQuit,
-        this, &ConfigSearchWindow::saveSettings);
+    connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 }
 
+void ConfigSearchWindow::UpdateConflictsViewColorizationFowarder(void){
+    emit UpdateConflictsViewColorization();
+}
 void ConfigSearchWindow::saveSettings(void)
 {
     if (!objectName().isEmpty()) {
@@ -1298,7 +1787,7 @@ void ConfigSearchWindow::search(void)
     ConfigItem *lastItem = NULL;
 
     free(result);
-    list->clear();
+    list->list->clear();
     info->clear();
 
     result = sym_re_search(editField->text().toLatin1());
@@ -1306,7 +1795,7 @@ void ConfigSearchWindow::search(void)
         return;
     for (p = result; *p; p++) {
         for_all_prompts((*p), prop)
-            lastItem = new ConfigItem(list, lastItem, prop->menu,
+            lastItem = new ConfigItem(list->list, lastItem, prop->menu,
                           menu_is_visible(prop->menu));
     }
 }
@@ -1354,44 +1843,59 @@ ConfigMainWindow::ConfigMainWindow(void)
     split1->setOrientation(Qt::Horizontal);
     split1->setChildrenCollapsible(false);
 
-    menuList = new ConfigList(widget, "menu");
+    menuView = new ConfigView(widget, "menu");
+    menuList = menuView->list;
 
     split2 = new QSplitter(widget);
     split2->setChildrenCollapsible(false);
     split2->setOrientation(Qt::Vertical);
 
     // create config tree
-    configList = new ConfigList(widget, "config");
+    configView = new ConfigView(widget, "config");
+    configList = configView->list;
 
     helpText = new ConfigInfoView(widget, "help");
 
     layout->addWidget(split2);
     split2->addWidget(split1);
-    split1->addWidget(configList);
-    split1->addWidget(menuList);
+    split1->addWidget(configView);
+    split1->addWidget(menuView);
     split2->addWidget(helpText);
 
+    split3 = new QSplitter(split2);
+    split3->setOrientation(Qt::Vertical);
+    conflictsView = new ConflictsView(split3, "help");
+    /* conflictsSelected signal in conflictsview triggers when a conflict is selected
+         in the view. this line connects that event to conflictselected event in mainwindow
+         which updates the selection to match (in the configlist) the symbol that was selected.
+    */
+    connect(conflictsView,SIGNAL(conflictSelected(struct menu *)),SLOT(conflictSelected(struct menu *)));
+    connect(conflictsView,SIGNAL(refreshMenu()),SLOT(refreshMenu()));
+    connect(menuList,SIGNAL(UpdateConflictsViewColorization()),conflictsView,SLOT(UpdateConflictsViewColorization()));
+    connect(configList,SIGNAL(UpdateConflictsViewColorization()),conflictsView,SLOT(UpdateConflictsViewColorization()));
     setTabOrder(configList, helpText);
+
     configList->setFocus();
 
+    // menu = menuBar();
+    toolBar = new QToolBar("Tools", this);
+    addToolBar(toolBar);
+
+
     backAction = new QAction(QPixmap(xpm_back), "Back", this);
-    connect(backAction, &QAction::triggered,
-        this, &ConfigMainWindow::goBack);
+    connect(backAction, SIGNAL(triggered(bool)), SLOT(goBack()));
 
     QAction *quitAction = new QAction("&Quit", this);
     quitAction->setShortcut(Qt::CTRL + Qt::Key_Q);
-    connect(quitAction, &QAction::triggered,
-        this, &ConfigMainWindow::close);
+    connect(quitAction, SIGNAL(triggered(bool)), SLOT(close()));
 
     QAction *loadAction = new QAction(QPixmap(xpm_load), "&Load", this);
     loadAction->setShortcut(Qt::CTRL + Qt::Key_L);
-    connect(loadAction, &QAction::triggered,
-        this, &ConfigMainWindow::loadConfig);
+    connect(loadAction, SIGNAL(triggered(bool)), SLOT(loadConfig()));
 
     saveAction = new QAction(QPixmap(xpm_save), "&Save", this);
     saveAction->setShortcut(Qt::CTRL + Qt::Key_S);
-    connect(saveAction, &QAction::triggered,
-        this, &ConfigMainWindow::saveConfig);
+    connect(saveAction, SIGNAL(triggered(bool)), SLOT(saveConfig()));
 
     conf_set_changed_callback(conf_changed);
 
@@ -1400,37 +1904,39 @@ ConfigMainWindow::ConfigMainWindow(void)
     configname = xstrdup(conf_get_configname());
 
     QAction *saveAsAction = new QAction("Save &As...", this);
-    connect(saveAsAction, &QAction::triggered,
-        this, &ConfigMainWindow::saveConfigAs);
+      connect(saveAsAction, SIGNAL(triggered(bool)), SLOT(saveConfigAs()));
     QAction *searchAction = new QAction("&Find", this);
     searchAction->setShortcut(Qt::CTRL + Qt::Key_F);
-    connect(searchAction, &QAction::triggered,
-        this, &ConfigMainWindow::searchConfig);
+      connect(searchAction, SIGNAL(triggered(bool)), SLOT(searchConfig()));
     singleViewAction = new QAction(QPixmap(xpm_single_view), "Single View", this);
     singleViewAction->setCheckable(true);
-    connect(singleViewAction, &QAction::triggered,
-        this, &ConfigMainWindow::showSingleView);
+      connect(singleViewAction, SIGNAL(triggered(bool)), SLOT(showSingleView()));
     splitViewAction = new QAction(QPixmap(xpm_split_view), "Split View", this);
     splitViewAction->setCheckable(true);
-    connect(splitViewAction, &QAction::triggered,
-        this, &ConfigMainWindow::showSplitView);
+      connect(splitViewAction, SIGNAL(triggered(bool)), SLOT(showSplitView()));
     fullViewAction = new QAction(QPixmap(xpm_tree_view), "Full View", this);
     fullViewAction->setCheckable(true);
-    connect(fullViewAction, &QAction::triggered,
-        this, &ConfigMainWindow::showFullView);
+      connect(fullViewAction, SIGNAL(triggered(bool)), SLOT(showFullView()));
+
+
 
     QAction *showNameAction = new QAction("Show Name", this);
       showNameAction->setCheckable(true);
-    connect(showNameAction, &QAction::toggled,
-        configList, &ConfigList::setShowName);
-    showNameAction->setChecked(configList->showName);
+      connect(showNameAction, SIGNAL(toggled(bool)), configView, SLOT(setShowName(bool)));
+      showNameAction->setChecked(configView->showName());
+    QAction *showRangeAction = new QAction("Show Range", this);
+      showRangeAction->setCheckable(true);
+      connect(showRangeAction, SIGNAL(toggled(bool)), configView, SLOT(setShowRange(bool)));
+    QAction *showDataAction = new QAction("Show Data", this);
+      showDataAction->setCheckable(true);
+      connect(showDataAction, SIGNAL(toggled(bool)), configView, SLOT(setShowData(bool)));
 
     QActionGroup *optGroup = new QActionGroup(this);
     optGroup->setExclusive(true);
-    connect(optGroup, &QActionGroup::triggered,
-        configList, &ConfigList::setOptionMode);
-    connect(optGroup, &QActionGroup::triggered,
-        menuList, &ConfigList::setOptionMode);
+    connect(optGroup, SIGNAL(triggered(QAction*)), configList,
+        SLOT(setOptionMode(QAction *)));
+    connect(optGroup, SIGNAL(triggered(QAction *)), menuList,
+        SLOT(setOptionMode(QAction *)));
 
     ConfigList::showNormalAction = new QAction("Show Normal Options", optGroup);
     ConfigList::showNormalAction->setCheckable(true);
@@ -1438,19 +1944,18 @@ ConfigMainWindow::ConfigMainWindow(void)
     ConfigList::showAllAction->setCheckable(true);
     ConfigList::showPromptAction = new QAction("Show Prompt Options", optGroup);
     ConfigList::showPromptAction->setCheckable(true);
+    ConfigList::addSymbolsFromContextMenu = new QAction("Add symbol from context menu");
+    connect(ConfigList::addSymbolsFromContextMenu, SIGNAL(triggered()),conflictsView, SLOT(addSymbolFromContextMenu()));
 
     QAction *showDebugAction = new QAction("Show Debug Info", this);
       showDebugAction->setCheckable(true);
-    connect(showDebugAction, &QAction::toggled,
-        helpText, &ConfigInfoView::setShowDebug);
+      connect(showDebugAction, SIGNAL(toggled(bool)), helpText, SLOT(setShowDebug(bool)));
       showDebugAction->setChecked(helpText->showDebug());
 
     QAction *showIntroAction = new QAction("Introduction", this);
-    connect(showIntroAction, &QAction::triggered,
-        this, &ConfigMainWindow::showIntro);
+      connect(showIntroAction, SIGNAL(triggered(bool)), SLOT(showIntro()));
     QAction *showAboutAction = new QAction("About", this);
-    connect(showAboutAction, &QAction::triggered,
-        this, &ConfigMainWindow::showAbout);
+      connect(showAboutAction, SIGNAL(triggered(bool)), SLOT(showAbout()));
 
     // init tool bar
     QToolBar *toolBar = addToolBar("Tools");
@@ -1462,6 +1967,7 @@ ConfigMainWindow::ConfigMainWindow(void)
     toolBar->addAction(singleViewAction);
     toolBar->addAction(splitViewAction);
     toolBar->addAction(fullViewAction);
+    toolBar->addSeparator();
 
     // create file menu
     QMenu *menu = menuBar()->addMenu("&File");
@@ -1478,6 +1984,8 @@ ConfigMainWindow::ConfigMainWindow(void)
     // create options menu
     menu = menuBar()->addMenu("&Option");
     menu->addAction(showNameAction);
+    menu->addAction(showRangeAction);
+    menu->addAction(showDataAction);
     menu->addSeparator();
     menu->addActions(optGroup->actions());
     menu->addSeparator();
@@ -1488,30 +1996,37 @@ ConfigMainWindow::ConfigMainWindow(void)
     menu->addAction(showIntroAction);
     menu->addAction(showAboutAction);
 
-    connect(helpText, &ConfigInfoView::anchorClicked,
-        helpText, &ConfigInfoView::clicked);
-
-    connect(configList, &ConfigList::menuChanged,
-        helpText, &ConfigInfoView::setInfo);
-    connect(configList, &ConfigList::menuSelected,
-        this, &ConfigMainWindow::changeMenu);
-    connect(configList, &ConfigList::itemSelected,
-        this, &ConfigMainWindow::changeItens);
-    connect(configList, &ConfigList::parentSelected,
-        this, &ConfigMainWindow::goBack);
-    connect(menuList, &ConfigList::menuChanged,
-        helpText, &ConfigInfoView::setInfo);
-    connect(menuList, &ConfigList::menuSelected,
-        this, &ConfigMainWindow::changeMenu);
-
-    connect(configList, &ConfigList::gotFocus,
-        helpText, &ConfigInfoView::setInfo);
-    connect(menuList, &ConfigList::gotFocus,
-        helpText, &ConfigInfoView::setInfo);
-    connect(menuList, &ConfigList::gotFocus,
-        this, &ConfigMainWindow::listFocusChanged);
-    connect(helpText, &ConfigInfoView::menuSelected,
-        this, &ConfigMainWindow::setMenuLink);
+    connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
+         helpText, SLOT (clicked (const QUrl &)) );
+
+    connect(configList, SIGNAL(menuChanged(struct menu *)),
+        helpText, SLOT(setInfo(struct menu *)));
+    connect(configList, SIGNAL(menuSelected(struct menu *)),
+        SLOT(changeMenu(struct menu *)));
+    connect(configList, SIGNAL(itemSelected(struct menu *)),
+        SLOT(changeItens(struct menu *)));
+    connect(configList, SIGNAL(parentSelected()),
+        SLOT(goBack()));
+    connect(menuList, SIGNAL(menuChanged(struct menu *)),
+        helpText, SLOT(setInfo(struct menu *)));
+    connect(menuList, SIGNAL(menuSelected(struct menu *)),
+        SLOT(changeMenu(struct menu *)));
+
+    //pass the list of selected items in configList to conflictsView so that
+    //when right click 'add symbols to conflict' is clicked it will be added
+    //to the list
+    connect(configList, SIGNAL(selectedChanged(QList<QTreeWidgetItem*>)),
+        conflictsView, SLOT(selectedChanged(QList<QTreeWidgetItem*>)));
+    connect(configList, SIGNAL(menuChanged(struct menu *)),
+        conflictsView, SLOT(menuChanged1(struct menu *)));
+    connect(configList, SIGNAL(gotFocus(struct menu *)),
+        helpText, SLOT(setInfo(struct menu *)));
+    connect(menuList, SIGNAL(gotFocus(struct menu *)),
+        helpText, SLOT(setInfo(struct menu *)));
+    connect(menuList, SIGNAL(gotFocus(struct menu *)),
+        SLOT(listFocusChanged(void)));
+    connect(helpText, SIGNAL(menuSelected(struct menu *)),
+        SLOT(setMenuLink(struct menu *)));
 
     QString listMode = configSettings->value("/listMode", "symbol").toString();
     if (listMode == "single")
@@ -1550,7 +2065,7 @@ void ConfigMainWindow::loadConfig(void)
     free(configname);
     configname = xstrdup(name);
 
-    ConfigList::updateListAllForAll();
+    ConfigView::updateListAll();
 }
 
 bool ConfigMainWindow::saveConfig(void)
@@ -1588,8 +2103,10 @@ void ConfigMainWindow::saveConfigAs(void)
 
 void ConfigMainWindow::searchConfig(void)
 {
-    if (!searchWindow)
+    if (!searchWindow){
         searchWindow = new ConfigSearchWindow(this);
+        connect(searchWindow,SIGNAL(UpdateConflictsViewColorization()),conflictsView,SLOT(UpdateConflictsViewColorization()));
+    }
     searchWindow->show();
 }
 
@@ -1685,7 +2202,7 @@ void ConfigMainWindow::showSingleView(void)
 
     backAction->setEnabled(true);
 
-    menuList->hide();
+    menuView->hide();
     menuList->setRootMenu(0);
     configList->mode = singleMode;
     if (configList->rootEntry == &rootmenu)
@@ -1716,10 +2233,17 @@ void ConfigMainWindow::showSplitView(void)
     menuList->mode = symbolMode;
     menuList->setRootMenu(&rootmenu);
     menuList->setAllOpen(true);
-    menuList->show();
+    menuView->show();
     menuList->setFocus();
 }
 
+void ConfigMainWindow::conflictSelected(struct menu * men)
+{
+    configList->clearSelection();
+    menuList->clearSelection();
+    emit(setMenuLink(men));
+}
+
 void ConfigMainWindow::showFullView(void)
 {
     singleViewAction->setEnabled(true);
@@ -1731,7 +2255,7 @@ void ConfigMainWindow::showFullView(void)
 
     backAction->setEnabled(false);
 
-    menuList->hide();
+    menuView->hide();
     menuList->setRootMenu(0);
     configList->mode = fullMode;
     if (configList->rootEntry == &rootmenu)
@@ -1773,26 +2297,17 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 
 void ConfigMainWindow::showIntro(void)
 {
-    static const QString str =
-        "Welcome to the qconf graphical configuration tool.\n"
-        "\n"
-        "For bool and tristate options, a blank box indicates the "
-        "feature is disabled, a check indicates it is enabled, and a "
-        "dot indicates that it is to be compiled as a module. Clicking "
-        "on the box will cycle through the three states. For int, hex, "
-        "and string options, double-clicking or pressing F2 on the "
-        "Value cell will allow you to edit the value.\n"
-        "\n"
-        "If you do not see an option (e.g., a device driver) that you "
-        "believe should be present, try turning on Show All Options "
-        "under the Options menu. Enabling Show Debug Info will help you"
-        "figure out what other options must be enabled to support the "
-        "option you are interested in, and hyperlinks will navigate to "
-        "them.\n"
-        "\n"
-        "Toggling Show Debug Info under the Options menu will show the "
-        "dependencies, which you can then match by examining other "
-        "options.\n";
+    static const QString str = "Welcome to the qconf graphical configuration tool.\n\n"
+        "For each option, a blank box indicates the feature is disabled, a check\n"
+        "indicates it is enabled, and a dot indicates that it is to be compiled\n"
+        "as a module.  Clicking on the box will cycle through the three states.\n\n"
+        "If you do not see an option (e.g., a device driver) that you believe\n"
+        "should be present, try turning on Show All Options under the Options menu.\n"
+        "Although there is no cross reference yet to help you figure out what other\n"
+        "options must be enabled to support the option you are interested in, you can\n"
+        "still view the help of a grayed-out option.\n\n"
+        "Toggling Show Debug Info under the Options menu will show the dependencies,\n"
+        "which you can then match by examining other options.\n\n";
 
     QMessageBox::information(this, "qconf", str);
 }
@@ -1800,13 +2315,10 @@ void ConfigMainWindow::showIntro(void)
 void ConfigMainWindow::showAbout(void)
 {
     static const QString str = "qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n"
-        "Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n"
-        "\n"
-        "Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n"
-        "\n"
-        "Qt Version: ";
+        "Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n\n"
+        "Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n";
 
-    QMessageBox::information(this, "qconf", str + qVersion());
+    QMessageBox::information(this, "qconf", str);
 }
 
 void ConfigMainWindow::saveSettings(void)
@@ -1844,6 +2356,10 @@ void ConfigMainWindow::conf_changed(void)
     if (saveAction)
         saveAction->setEnabled(conf_get_changed());
 }
+void ConfigMainWindow::refreshMenu(void)
+{
+    configList->updateListAll();
+}
 
 void fixup_rootmenu(struct menu *menu)
 {
@@ -1875,6 +2391,7 @@ int main(int ac, char** av)
     const char *name;
 
     progname = av[0];
+    configApp = new QApplication(ac, av);
     if (ac > 1 && av[1][0] == '-') {
         switch (av[1][1]) {
         case 's':
@@ -1895,8 +2412,6 @@ int main(int ac, char** av)
     conf_read(NULL);
     //zconfdump(stdout);
 
-    configApp = new QApplication(ac, av);
-
     configSettings = new ConfigSettings();
     configSettings->beginGroup("/kconfig/qconf");
     v = new ConfigMainWindow();
@@ -1914,3 +2429,33 @@ int main(int ac, char** av)
 
     return 0;
 }
+
+void droppableView::dropEvent(QDropEvent *event)
+{
+    event->acceptProposedAction();
+}
+
+QString tristate_value_to_string(tristate val)
+{
+    switch (val) {
+    case yes:
+        return QString::fromStdString("YES");
+    case mod:
+        return QString::fromStdString("MODULE");
+    case no:
+        return QString::fromStdString("NO");
+    default:
+        return QString::fromStdString("");
+    }
+}
+tristate string_value_to_tristate(QString s)
+{
+    if (s == "YES")
+        return tristate::yes;
+    else if (s == "MODULE")
+        return tristate::mod;
+    else if (s == "NO")
+        return tristate::no;
+    else
+        return tristate::no;
+}
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 78b0a1dfcd53..3b0b398ebfe6 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -11,14 +11,25 @@
 #include <QPushButton>
 #include <QSettings>
 #include <QSplitter>
-#include <QStyledItemDelegate>
 #include <QTextBrowser>
 #include <QTreeWidget>
+#include <QListWidget>
+#include <QTableWidget>
+#include <QList>
+#include <QComboBox>
+#include <QLabel>
+#include <qstring.h>
+#include <thread>
+#include <condition_variable>
 
 #include "expr.h"
 
+#include "configfix.h"
+
+class ConfigView;
 class ConfigList;
 class ConfigItem;
+class ConfigLineEdit;
 class ConfigMainWindow;
 
 class ConfigSettings : public QSettings {
@@ -29,7 +40,7 @@ class ConfigSettings : public QSettings {
 };
 
 enum colIdx {
-    promptColIdx, nameColIdx, dataColIdx
+    promptColIdx, nameColIdx, noColIdx, modColIdx, yesColIdx, dataColIdx
 };
 enum listMode {
     singleMode, menuMode, symbolMode, fullMode, listMode
@@ -38,14 +49,31 @@ enum optionMode {
     normalOpt = 0, allOpt, promptOpt
 };
 
+enum symbolStatus {
+    UNSATISFIED, SATISFIED
+};
+
+typedef struct {
+    QString symbol;
+    QString change_needed;
+    enum symbolStatus status;
+    tristate change_requested;
+} Constraint;
+
+QString tristate_value_to_string(tristate val);
+tristate string_value_to_tristate(QString s);
+
 class ConfigList : public QTreeWidget {
     Q_OBJECT
     typedef class QTreeWidget Parent;
 public:
-    ConfigList(QWidget *parent, const char *name = 0);
-    ~ConfigList();
+    ConfigList(ConfigView* p, const char *name = 0);
     void reinit(void);
     ConfigItem* findConfigItem(struct menu *);
+    ConfigView* parent(void) const
+    {
+        return (ConfigView*)Parent::parent();
+    }
     void setSelected(QTreeWidgetItem *item, bool enable) {
         for (int i = 0; i < selectedItems().size(); i++)
             selectedItems().at(i)->setSelected(false);
@@ -71,7 +99,6 @@ public slots:
     void updateSelection(void);
     void saveSettings(void);
     void setOptionMode(QAction *action);
-    void setShowName(bool on);
 
 signals:
     void menuChanged(struct menu *menu);
@@ -79,7 +106,8 @@ public slots:
     void itemSelected(struct menu *menu);
     void parentSelected(void);
     void gotFocus(struct menu *);
-    void showNameChanged(bool on);
+    void selectedChanged(QList<QTreeWidgetItem*> selection);
+    void UpdateConflictsViewColorization();
 
 public:
     void updateListAll(void)
@@ -98,7 +126,7 @@ public slots:
 
     bool updateAll;
 
-    bool showName;
+    bool showName, showRange, showData;
     enum listMode mode;
     enum optionMode optMode;
     struct menu *rootEntry;
@@ -106,11 +134,7 @@ public slots:
     QPalette inactivedColorGroup;
     QMenu* headerPopup;
 
-    static QList<ConfigList *> allLists;
-    static void updateListForAll();
-    static void updateListAllForAll();
-
-    static QAction *showNormalAction, *showAllAction, *showPromptAction;
+    static QAction *showNormalAction, *showAllAction, *showPromptAction, *addSymbolsFromContextMenu;
 };
 
 class ConfigItem : public QTreeWidgetItem {
@@ -133,6 +157,7 @@ class ConfigItem : public QTreeWidgetItem {
     }
     ~ConfigItem(void);
     void init(void);
+    void okRename(int col);
     void updateMenu(void);
     void testUpdateMenu(bool v);
     ConfigList* listView() const
@@ -169,18 +194,104 @@ class ConfigItem : public QTreeWidgetItem {
     static QIcon menuIcon, menubackIcon;
 };
 
-class ConfigItemDelegate : public QStyledItemDelegate
-{
-private:
-    struct menu *menu;
+class ConfigLineEdit : public QLineEdit {
+    Q_OBJECT
+    typedef class QLineEdit Parent;
+public:
+    ConfigLineEdit(ConfigView* parent);
+    ConfigView* parent(void) const
+    {
+        return (ConfigView*)Parent::parent();
+    }
+    void show(ConfigItem *i);
+    void keyPressEvent(QKeyEvent *e);
+
+public:
+    ConfigItem *item;
+};
+
+class ConfigView : public QWidget {
+    Q_OBJECT
+    typedef class QWidget Parent;
 public:
-    ConfigItemDelegate(QObject *parent = nullptr)
-        : QStyledItemDelegate(parent) {}
-    QWidget *createEditor(QWidget *parent,
-                  const QStyleOptionViewItem &option,
-                  const QModelIndex &index) const override;
-    void setModelData(QWidget *editor, QAbstractItemModel *model,
-              const QModelIndex &index) const override;
+    ConfigView(QWidget* parent, const char *name = 0);
+    ~ConfigView(void);
+    static void updateList();
+    static void updateListAll(void);
+
+    bool showName(void) const { return list->showName; }
+    bool showRange(void) const { return list->showRange; }
+    bool showData(void) const { return list->showData; }
+public slots:
+    void setShowName(bool);
+    void setShowRange(bool);
+    void setShowData(bool);
+
+    void ShowContextMenu(const QPoint& p);
+signals:
+    void showNameChanged(bool);
+    void showRangeChanged(bool);
+    void showDataChanged(bool);
+public:
+    ConfigList* list;
+    ConfigLineEdit* lineEdit;
+
+    static ConfigView* viewList;
+    ConfigView* nextView;
+
+    static QAction *showNormalAction;
+    static QAction *showAllAction;
+    static QAction *showPromptAction;
+    static QAction *addSymbolsFromContextMenu;
+};
+class ConflictsView : public QWidget {
+    ConfigLineEdit* lineEdit;
+    Q_OBJECT
+    typedef class QWidget Parent;
+public:
+    ConflictsView(QWidget* parent, const char *name = 0);
+    void addSymbol(struct menu * m);
+    int current_solution_number = -1;
+
+public slots:
+    void cellClicked(int, int);
+    void addSymbol();
+    void addSymbolFromContextMenu();
+    void removeSymbol();
+    void menuChanged1(struct menu *);
+    void changeToNo();
+    void changeToYes();
+    void changeToModule();
+    void selectedChanged(QList<QTreeWidgetItem*> selection);
+    void applyFixButtonClick();
+    void UpdateConflictsViewColorization();
+    void updateResults();
+    void changeSolutionTable(int solution_number);
+    void calculateFixes();
+signals:
+    void showNameChanged(bool);
+    void showRangeChanged(bool);
+    void showDataChanged(bool);
+    void conflictSelected(struct menu *);
+    void refreshMenu();
+    void resultsReady();
+public:
+    QTableWidget* conflictsTable;
+    QList<Constraint> constraints;
+    QComboBox* solutionSelector{nullptr};
+    QTableWidget* solutionTable{nullptr};
+    QPushButton* applyFixButton{nullptr};
+    struct sfl_list * solution_output{nullptr};
+    QToolBar *conflictsToolBar;
+    struct menu * currentSelectedMenu ;
+    QLabel* numSolutionLabel{nullptr};
+    QList<QTreeWidgetItem*> currentSelection;
+    QAction *fixConflictsAction_{nullptr};
+    void runSatConfAsync();
+    std::thread* runSatConfAsyncThread{nullptr};
+    std::mutex satconf_mutex;
+    std::condition_variable satconf_cancellation_cv;
+    bool satconf_cancelled{false};
 };
 
 class ConfigInfoView : public QTextBrowser {
@@ -223,17 +334,21 @@ class ConfigSearchWindow : public QDialog {
 public slots:
     void saveSettings(void);
     void search(void);
+    void UpdateConflictsViewColorizationFowarder();
+signals:
+    void UpdateConflictsViewColorization();
 
 protected:
     QLineEdit* editField;
     QPushButton* searchButton;
     QSplitter* split;
-    ConfigList *list;
+    ConfigView* list;
     ConfigInfoView* info;
 
     struct symbol **result;
 };
 
+
 class ConfigMainWindow : public QMainWindow {
     Q_OBJECT
 
@@ -258,18 +373,34 @@ public slots:
     void showIntro(void);
     void showAbout(void);
     void saveSettings(void);
+    void conflictSelected(struct menu *);
+    void refreshMenu();
 
 protected:
     void closeEvent(QCloseEvent *e);
 
     ConfigSearchWindow *searchWindow;
+    ConfigView *menuView;
     ConfigList *menuList;
+    ConfigView *configView;
     ConfigList *configList;
     ConfigInfoView *helpText;
+    ConflictsView *conflictsView;
+    QToolBar *toolBar;
+    QToolBar *conflictsToolBar;
     QAction *backAction;
     QAction *singleViewAction;
     QAction *splitViewAction;
     QAction *fullViewAction;
     QSplitter *split1;
     QSplitter *split2;
+    QSplitter *split3;
+};
+
+class droppableView : public QTableWidget
+{
+public:
+    droppableView(QWidget *parent = nullptr) {}
+protected:
+    void dropEvent(QDropEvent *event);
 };
-- 
2.33.0


