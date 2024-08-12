Return-Path: <linux-kbuild+bounces-2942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C953094E9CE
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 11:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE56B1C21714
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBD016D9CB;
	Mon, 12 Aug 2024 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmTaImnH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709B20323;
	Mon, 12 Aug 2024 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723454977; cv=none; b=ILUtl89rhs1JxTLf5c5Ihk5vDaEV7ovmSpW9/FwKKtLoLXagwpUWzqlMJb0tCE1WXdUjsGvuCyh0AOlvFoKpO4tbs7JI+4SKsueipel3atUjYaHGapmkjQ0X+7fwBi5VxNeFmfk5DuH3oCFcnyOKZ4flF48Br0Vnv098IYoL/tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723454977; c=relaxed/simple;
	bh=qD4221qfEoT3Q7JJ0IbVncBx0D1cP9HcDrggWBn1twM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sROW5XS6MTdAbIYuiDVWWi7ATexO6LoUTpKEJ8ZJQ//Wp96SX2Xg3sWU+HUAqeG9ryLkM19Ojl+T4XrSkLgIZPpjPvDUfGQj1dpqg5vBJH152eJl+hZsT7GWSaCE/seBtkD738KgBcUA6upyODGva7me0xIu7+FQnm2Ixmw3KT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmTaImnH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4937DC32782;
	Mon, 12 Aug 2024 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723454976;
	bh=qD4221qfEoT3Q7JJ0IbVncBx0D1cP9HcDrggWBn1twM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tmTaImnHZP/uhYwVv7o1PlhPBBP0LYFp8xDV0e0078ge05USUF5vv8lAdGGPjAkQs
	 pFMOkmI8enma600YONoCgi95yCoMsWz+V2r5oRcAF09L0JggyTsHrX9ks5JgdnSehW
	 IN3eYQbv1qR3KMeggvrVrcup9IEYLym39As675sWS2UfhxofTpkZefWqqBjLFN8UyF
	 wyuh3/i0nCiQBujNRxyhwMTDOWPQSRraAfLsQ7xZR4oKqUhfNIByrAc4oJDLeY/5Ek
	 guolY8DBpw3SikGO+NSE4Z6WeY2+atNAcWsIaGYVNb43/VNI8FxuDsK/Xg9d0D6twX
	 jOBFKtzlHFFWw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so44294311fa.1;
        Mon, 12 Aug 2024 02:29:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGCSDxK58Uy1km8CCLN8KLLa1J+CdLmZPTbrwSoPvrRZI5G0gZN6C7AVE1kDLHWv+wAD0MS3hCiVBZMHH8hDtzOd1iXLvmskinWuVp
X-Gm-Message-State: AOJu0YwzYofyeotj/r35Ocm7FgzDwxUbGO+aZ5DHX5VZcr3drRC4UcJl
	UC8CY8N8v7ERZuYFZRY4r6tPlXC/f0xSk5NTc236taNvT7wiuGySOiMyAcqlei3TNKOTZWj38pT
	EL7XoI0iqJFIPIe57FNkL3/qI9eE=
X-Google-Smtp-Source: AGHT+IFMJ8y6FgcwuK8TQjHYshUvSew/nebl4iXbnm2eS2fqMHTm5VPD9XnOVrDZQxQA8r0swrW9Mr274Dhc71/63jc=
X-Received: by 2002:a2e:f01:0:b0:2ef:2b38:8796 with SMTP id
 38308e7fff4ca-2f1a6cdbedamr64108591fa.32.1723454974792; Mon, 12 Aug 2024
 02:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710065255.10338-1-ole0811sch@gmail.com> <20240710065255.10338-12-ole0811sch@gmail.com>
In-Reply-To: <20240710065255.10338-12-ole0811sch@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 12 Aug 2024 18:28:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZwyYWrxZXGtD7-Ujh9or8ECsXSA+ba+91Fymg8wUjBg@mail.gmail.com>
Message-ID: <CAK7LNARZwyYWrxZXGtD7-Ujh9or8ECsXSA+ba+91Fymg8wUjBg@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] kconfig: Add xconfig-modifications
To: Ole Schuerks <ole0811sch@gmail.com>
Cc: linux-kbuild@vger.kernel.org, jude.gyimah@rub.de, thorsten.berger@rub.de, 
	deltaone@debian.org, jan.sollmann@rub.de, mcgrof@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 3:54=E2=80=AFPM Ole Schuerks <ole0811sch@gmail.com>=
 wrote:
>
> The tool can be called from any configurator. We chose to modify xconfig
> for this purpose. These files contain the necessary modifications to
> xconfig in order to resolve conflicts.
>
> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Ole Schuerks <ole0811sch@gmail.com>
> ---
>  scripts/kconfig/qconf.cc | 515 ++++++++++++++++++++++++++++++++++++++-
>  scripts/kconfig/qconf.h  | 103 ++++++++
>  2 files changed, 616 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index 7d239c032b3d..20ca9936d592 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -3,7 +3,7 @@
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   * Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>
>   */
> -
> +#include "qnamespace.h"
>  #include <QAction>
>  #include <QActionGroup>
>  #include <QApplication>
> @@ -19,14 +19,27 @@
>  #include <QRegularExpression>
>  #include <QScreen>
>  #include <QToolBar>
> +#include <QListWidget>
> +#include <QComboBox>
> +#include <QTableWidget>
> +#include <QHBoxLayout>
> +#include <QMovie>
> +#include <QMessageBox>
>
>  #include <stdlib.h>
> +#include <QAbstractItemView>
> +#include <QMimeData>
> +#include <QBrush>
> +#include <QColor>
>
>  #include "lkc.h"
>  #include "qconf.h"
> +#include "configfix.h"
>
>  #include "images.h"
>
> +static QString tristate_value_to_string(tristate val);
> +static tristate string_value_to_tristate(QString s);
>
>  static QApplication *configApp;
>  static ConfigSettings *configSettings;
> @@ -178,6 +191,7 @@ void ConfigItem::updateMenu(void)
>                 prompt +=3D " (NEW)";
>  set_prompt:
>         setText(promptColIdx, prompt);
> +
>  }



Unrelated change.
(Same in many places)






>  void ConfigItem::testUpdateMenu(bool v)
> @@ -225,6 +239,7 @@ void ConfigItem::init(void)
>                 }
>         }
>         updateMenu();
> +
>  }
>
>  /*
> @@ -405,7 +420,7 @@ void ConfigList::updateSelection(void)
>         ConfigItem* item =3D (ConfigItem*)selectedItems().first();
>         if (!item)
>                 return;
> -
> +       emit selectionChanged(selectedItems());
>         menu =3D item->menu;
>         emit menuChanged(menu);
>         if (!menu)
> @@ -471,6 +486,7 @@ void ConfigList::updateListForAll()
>
>                 list->updateList();
>         }
> +
>  }
>
>  void ConfigList::updateListAllForAll()
> @@ -539,6 +555,7 @@ void ConfigList::changeValue(ConfigItem* item)
>                 }
>                 if (oldexpr !=3D newexpr)
>                         ConfigList::updateListForAll();
> +                       emit updateConflictsViewColorization();
>                 break;
>         default:
>                 break;
> @@ -898,6 +915,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *=
e)
>                         action, &QAction::setChecked);
>                 action->setChecked(showName);
>                 headerPopup->addAction(action);
> +               headerPopup->addAction(addSymbolFromContextMenu);
>         }
>
>         headerPopup->exec(e->globalPos());
> @@ -918,6 +936,7 @@ QList<ConfigList *> ConfigList::allLists;
>  QAction *ConfigList::showNormalAction;
>  QAction *ConfigList::showAllAction;
>  QAction *ConfigList::showPromptAction;
> +QAction *ConfigList::addSymbolFromContextMenu;
>
>  void ConfigList::setAllOpen(bool open)
>  {
> @@ -1249,7 +1268,10 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainW=
indow *parent)
>                 info, &ConfigInfoView::setInfo);
>         connect(list, &ConfigList::menuChanged,
>                 parent, &ConfigMainWindow::setMenuLink);
> +       connect(list, &ConfigList::menuChanged,
> +               parent, &ConfigMainWindow::conflictSelected);
>
> +       connect(list,&ConfigList::updateConflictsViewColorization,this,&C=
onfigSearchWindow::updateConflictsViewColorizationFowarder);
>         layout1->addWidget(split);
>
>         QVariant x, y;
> @@ -1272,6 +1294,10 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainW=
indow *parent)
>                 this, &ConfigSearchWindow::saveSettings);
>  }
>
> +void ConfigSearchWindow::updateConflictsViewColorizationFowarder(void){
> +       emit updateConflictsViewColorization();
> +}
> +
>  void ConfigSearchWindow::saveSettings(void)
>  {
>         if (!objectName().isEmpty()) {
> @@ -1364,6 +1390,17 @@ ConfigMainWindow::ConfigMainWindow(void)
>         split1->addWidget(configList);
>         split1->addWidget(menuList);
>         split2->addWidget(helpText);
> +       split3 =3D new QSplitter(split2);
> +       split3->setOrientation(Qt::Vertical);
> +       conflictsView =3D new ConflictsView(split3, "help");
> +       /* conflictsSelected signal in conflictsview triggers when a conf=
lict is selected
> +                in the view. this line connects that event to conflictse=
lected event in mainwindow
> +                which updates the selection to match (in the configlist)=
 the symbol that was selected.
> +       */
> +       connect(conflictsView,SIGNAL(conflictSelected(struct menu *)),SLO=
T(conflictSelected(struct menu *)));
> +       connect(conflictsView,SIGNAL(refreshMenu()),SLOT(refreshMenu()));
> +       connect(menuList,SIGNAL(updateConflictsViewColorization()),confli=
ctsView,SLOT(updateConflictsViewColorization()));
> +       connect(configList,SIGNAL(updateConflictsViewColorization()),conf=
lictsView,SLOT(updateConflictsViewColorization()));
>
>         setTabOrder(configList, helpText);
>         configList->setFocus();
> @@ -1430,6 +1467,8 @@ ConfigMainWindow::ConfigMainWindow(void)
>         ConfigList::showAllAction->setCheckable(true);
>         ConfigList::showPromptAction =3D new QAction("Show Prompt Options=
", optGroup);
>         ConfigList::showPromptAction->setCheckable(true);
> +       ConfigList::addSymbolFromContextMenu =3D new QAction("Add symbol =
from context menu");
> +       connect(ConfigList::addSymbolFromContextMenu, &QAction::triggered=
, conflictsView, &ConflictsView::addSymbol);
>
>         QAction *showDebugAction =3D new QAction("Show Debug Info", this)=
;
>           showDebugAction->setCheckable(true);
> @@ -1485,6 +1524,8 @@ ConfigMainWindow::ConfigMainWindow(void)
>
>         connect(configList, &ConfigList::menuChanged,
>                 helpText, &ConfigInfoView::setInfo);
> +       connect(configList, &ConfigList::menuChanged,
> +               conflictsView, &ConflictsView::menuChanged);
>         connect(configList, &ConfigList::menuSelected,
>                 this, &ConfigMainWindow::changeMenu);
>         connect(configList, &ConfigList::itemSelected,
> @@ -1493,6 +1534,8 @@ ConfigMainWindow::ConfigMainWindow(void)
>                 this, &ConfigMainWindow::goBack);
>         connect(menuList, &ConfigList::menuChanged,
>                 helpText, &ConfigInfoView::setInfo);
> +       connect(menuList, &ConfigList::menuChanged,
> +               conflictsView, &ConflictsView::menuChanged);
>         connect(menuList, &ConfigList::menuSelected,
>                 this, &ConfigMainWindow::changeMenu);
>
> @@ -1712,6 +1755,13 @@ void ConfigMainWindow::showSplitView(void)
>         menuList->setFocus();
>  }
>
> +void ConfigMainWindow::conflictSelected(struct menu * men)
> +{
> +       configList->clearSelection();
> +       menuList->clearSelection();
> +       emit(setMenuLink(men));
> +}
> +
>  void ConfigMainWindow::showFullView(void)
>  {
>         singleViewAction->setEnabled(true);
> @@ -1847,6 +1897,432 @@ void ConfigMainWindow::conf_changed(bool dirty)
>                 saveAction->setEnabled(dirty);
>  }
>
> +void ConfigMainWindow::refreshMenu(void)
> +{
> +       configList->updateListAll();
> +}
> +
> +void QTableWidget::dropEvent(QDropEvent *event)
> +{
> +}
> +
> +ConflictsView::ConflictsView(QWidget *parent, const char *name)
> +       : Parent(parent)
> +{
> +       currentSelectedMenu =3D nullptr;
> +       setObjectName(name);
> +       QHBoxLayout *horizontalLayout =3D new QHBoxLayout(this);
> +       QVBoxLayout *verticalLayout =3D new QVBoxLayout();
> +       verticalLayout->setContentsMargins(0, 0, 0, 0);
> +       conflictsToolBar =3D new QToolBar("ConflictTools", this);
> +       // toolbar buttons [n] [m] [y] [calculate fixes] [remove]
> +       QAction *addSymbol =3D new QAction("Add Symbol");
> +       QAction *setConfigSymbolAsNo =3D new QAction("N");
> +       QAction *setConfigSymbolAsModule =3D new QAction("M");
> +       QAction *setConfigSymbolAsYes =3D new QAction("Y");
> +       fixConflictsAction_ =3D new QAction("Calculate Fixes");
> +       QAction *removeSymbol =3D new QAction("Remove Symbol");
> +       QMovie *loadingGif =3D new QMovie("scripts/kconfig/loader.gif");
> +       auto loadingLabel =3D new QLabel;
> +
> +       if (loadingGif->isValid()) {
> +               loadingGif->setScaledSize(loadingGif->scaledSize().scaled=
(
> +                       20, 20, Qt::KeepAspectRatioByExpanding));
> +               loadingGif->start();
> +               loadingLabel->setMovie(loadingGif);
> +       } else {
> +               loadingLabel->setText("Calculating...");
> +       }
> +
> +       //if you change the order of buttons here, change the code where
> +       //module button was disabled if symbol is boolean, selecting modu=
le button
> +       //depends on a specific index in list of action
> +       fixConflictsAction_->setCheckable(false);
> +       conflictsToolBar->addAction(addSymbol);
> +       conflictsToolBar->addAction(setConfigSymbolAsNo);
> +       conflictsToolBar->addAction(setConfigSymbolAsModule);
> +       conflictsToolBar->addAction(setConfigSymbolAsYes);
> +       conflictsToolBar->addAction(fixConflictsAction_);
> +       conflictsToolBar->addAction(removeSymbol);
> +       // loadingLabel->setMargin(5);
> +       loadingLabel->setContentsMargins(5, 5, 5, 5);
> +       loadingAction =3D conflictsToolBar->addWidget(loadingLabel);
> +       loadingAction->setVisible(false);
> +
> +
> +       verticalLayout->addWidget(conflictsToolBar);
> +
> +       connect(addSymbol, &QAction::triggered, this, &ConflictsView::add=
Symbol);
> +       connect(setConfigSymbolAsNo, &QAction::triggered,this, &Conflicts=
View::changeToNo);
> +       connect(setConfigSymbolAsModule, &QAction::triggered,this, &Confl=
ictsView::changeToModule);
> +       connect(setConfigSymbolAsYes, &QAction::triggered,this, &Conflict=
sView::changeToYes);
> +       connect(removeSymbol, &QAction::triggered,this, &ConflictsView::r=
emoveSymbol);
> +       connect(this, SIGNAL(resultsReady()), SLOT(updateResults()));
> +       //connect clicking 'calculate fixes' to 'change all symbol values=
 to fix all conflicts'
> +       // no longer used anymore for now.
> +       connect(fixConflictsAction_, &QAction::triggered,this, &Conflicts=
View::calculateFixes);
> +
> +       conflictsTable =3D (QTableWidget *) new dropAbleView(this);
> +       conflictsTable->setRowCount(0);
> +       conflictsTable->setColumnCount(3);
> +       conflictsTable->setSelectionBehavior(QAbstractItemView::SelectRow=
s);
> +
> +       conflictsTable->setHorizontalHeaderLabels(QStringList()  << "Opti=
on" << "Wanted value" << "Current value" );
> +       verticalLayout->addWidget(conflictsTable);
> +
> +       conflictsTable->setDragDropMode(QAbstractItemView::DropOnly);
> +       setAcceptDrops(true);
> +
> +       connect(conflictsTable, SIGNAL(cellClicked(int, int)), SLOT(cellC=
licked(int,int)));
> +       horizontalLayout->addLayout(verticalLayout);
> +
> +       // populate the solution view on the right hand side:
> +       QVBoxLayout *solutionLayout =3D new QVBoxLayout();
> +       solutionLayout->setContentsMargins(0, 0, 0, 0);
> +       solutionSelector =3D new QComboBox();
> +       connect(solutionSelector, QOverload<int>::of(&QComboBox::currentI=
ndexChanged),
> +               [=3D](int index){ changeSolutionTable(index); });
> +       solutionTable =3D new QTableWidget();
> +       solutionTable->setRowCount(0);
> +       solutionTable->setColumnCount(2);
> +       solutionTable->setHorizontalHeaderLabels(QStringList()  << "Symbo=
l" << "New Value" );
> +
> +       applyFixButton =3D new QPushButton("Apply Selected solution");
> +       connect(applyFixButton, SIGNAL(clicked(bool)), SLOT(applyFixButto=
nClick()));
> +
> +       numSolutionLabel =3D new QLabel("Solutions:");
> +       solutionLayout->addWidget(numSolutionLabel);
> +       solutionLayout->addWidget(solutionSelector);
> +       solutionLayout->addWidget(solutionTable);
> +       solutionLayout->addWidget(applyFixButton);
> +
> +       horizontalLayout->addLayout(solutionLayout);
> +}



The "Current value" does not reflect the current value.


1.  "Add Symbol" button.
2.  Edit the "Option" column

  -> The "Current value" stay the same
     (it shows the value of the previous symbol)



The "Wanted value" should toggle when you click on the cell.

See how the existing window works.
The values should be "Y", "M", "N" instead of
"YES", "MODULE", "NO", for consistency.






> +
> +void ConflictsView::changeToNo(){
> +       QItemSelectionModel *select =3D conflictsTable->selectionModel();
> +       if (select->hasSelection()){
> +               QModelIndexList rows =3D select->selectedRows();
> +               for (int i =3D 0;i < rows.count(); i++)
> +               {
> +                       conflictsTable->item(rows[i].row(),1)->setText("N=
O");
> +               }
> +       }
> +}
> +
> +void ConflictsView::applyFixButtonClick(){
> +       signed int solution_number =3D solutionSelector->currentIndex();
> +
> +       if (solution_number =3D=3D -1 || solution_output =3D=3D NULL) {
> +               return;
> +       }
> +
> +       struct sfix_list * selected_solution =3D select_solution(solution=
_output, solution_number);
> +       apply_fix(selected_solution);
> +
> +
> +       ConfigList::updateListForAll();
> +       for (int i =3D 0;i < conflictsTable->rowCount(); i++)
> +       {
> +               conflictsTable->item(i,2)->setText(conflictsTable->item(i=
,1)->text());
> +       }
> +       updateConflictsViewColorization();
> +       QMessageBox msgBox;
> +       msgBox.setText("The solution has been applied.");
> +       msgBox.exec();
> +}
> +
> +void ConflictsView::changeToYes(){
> +       QItemSelectionModel *select =3D conflictsTable->selectionModel();
> +       if (select->hasSelection()){
> +               QModelIndexList rows =3D select->selectedRows();
> +               for (int i =3D 0;i < rows.count(); i++)
> +               {
> +                       conflictsTable->item(rows[i].row(),1)->setText("Y=
ES");
> +               }
> +       }
> +
> +}
> +
> +void ConflictsView::changeToModule() {
> +       QItemSelectionModel *select =3D conflictsTable->selectionModel();
> +       if (select->hasSelection()){
> +               QModelIndexList rows =3D select->selectedRows();
> +               for (int i =3D 0;i < rows.count(); i++)
> +               {
> +                       conflictsTable->item(rows[i].row(),1)->setText("M=
ODULE");
> +               }
> +       }
> +
> +}
> +
> +void ConflictsView::menuChanged(struct menu *m)
> +{
> +       currentSelectedMenu =3D m;
> +}
> +
> +void ConflictsView::addSymbol()
> +{
> +       addSymbolFromMenu(currentSelectedMenu);
> +}
> +
> +void ConflictsView::selectionChanged(QList<QTreeWidgetItem *> selection)
> +{
> +       currentSelection =3D selection;
> +
> +}
> +
> +void ConflictsView::addSymbolFromMenu(struct menu *m)
> +{
> +       // adds a symbol to the conflict resolver list
> +       if (m !=3D nullptr){
> +               if (m->sym !=3D nullptr){
> +                       struct symbol *sym =3D m->sym;
> +                       tristate currentval =3D sym_get_tristate_value(sy=
m);
> +                       //if symbol is not added yet:
> +                       QAbstractItemModel *tableModel =3D conflictsTable=
->model();
> +                       QModelIndexList matches =3D tableModel->match(tab=
leModel->index(0,0), Qt::DisplayRole, QString(sym->name));
> +                       if (matches.isEmpty()){
> +                               conflictsTable->insertRow(conflictsTable-=
>rowCount());
> +                               conflictsTable->setItem(conflictsTable->r=
owCount()-1,0,new QTableWidgetItem(sym->name));
> +                               conflictsTable->setItem(conflictsTable->r=
owCount()-1,1,new QTableWidgetItem(tristate_value_to_string(currentval)));
> +                               conflictsTable->setItem(conflictsTable->r=
owCount()-1,2,new QTableWidgetItem(tristate_value_to_string(currentval)));
> +                       }else{
> +                               conflictsTable->item(matches[0].row(),2)-=
>setText(tristate_value_to_string(currentval));
> +                       }
> +               }
> +       }
> +}
> +
> +void ConflictsView::addSymbolFromContextMenu() {
> +       struct menu *menu;
> +
> +       if (currentSelection.count() < 0){
> +               return;
> +       }
> +       for (auto el: currentSelection){
> +               ConfigItem *item =3D (ConfigItem *)el;
> +               if (!item)
> +               {
> +                       continue;
> +               }
> +               menu =3D item->menu;
> +               addSymbolFromMenu(menu);
> +       }
> +
> +}
> +
> +void ConflictsView::removeSymbol()
> +{
> +       QItemSelectionModel *select =3D conflictsTable->selectionModel();
> +       QAbstractItemModel *itemModel =3D select->model();
> +       if (select->hasSelection()){
> +               QModelIndexList rows =3D select->selectedRows();
> +               itemModel->removeRows(rows[0].row(),rows.size());
> +       }
> +}
> +
> +void ConflictsView::cellClicked(int row, int column)
> +{
> +       auto itemText =3D conflictsTable->item(row,0)->text().toUtf8().da=
ta();
> +       struct property *prop;
> +       struct menu *men;
> +       struct symbol *sym =3D sym_find(itemText);
> +
> +       if (sym =3D=3D NULL)
> +               return;
> +       prop =3D sym->prop;
> +       men =3D prop->menu;
> +       // uncommenting following like somehow disables click signal of '=
apply selected solution'
> +       if (sym->type =3D=3D symbol_type::S_BOOLEAN) {
> +               //disable module button
> +               conflictsToolBar->actions()[2]->setDisabled(true);
> +       } else {
> +               //enable module button
> +               conflictsToolBar->actions()[2]->setDisabled(false);
> +       }
> +       emit(conflictSelected(men));
> +}
> +
> +void ConflictsView::changeSolutionTable(int solution_number){
> +       if (solution_output =3D=3D nullptr || solution_number < 0){
> +               return;
> +       }
> +       struct sfix_list *selected_solution =3D select_solution(solution_=
output, solution_number);
> +       current_solution_number =3D solution_number;
> +       solutionTable->setRowCount(0);
> +       for (unsigned int i =3D 0; i <selected_solution->size; i++)
> +       {
> +               solutionTable->insertRow(solutionTable->rowCount());
> +               struct symbol_fix *cur_symbol =3D select_symbol(selected_=
solution,i);
> +
> +               QTableWidgetItem *symbol_name =3D new QTableWidgetItem(cu=
r_symbol->sym->name);
> +
> +               solutionTable->setItem(solutionTable->rowCount()-1,0,symb=
ol_name);
> +
> +               if (cur_symbol->type =3D=3D symbolfix_type::SF_BOOLEAN){
> +                       QTableWidgetItem *symbol_value =3D new QTableWidg=
etItem(tristate_value_to_string(cur_symbol->tri));
> +                       solutionTable->setItem(solutionTable->rowCount()-=
1,1,symbol_value);
> +               } else if(cur_symbol->type =3D=3D symbolfix_type::SF_NONB=
OOLEAN){
> +                       QTableWidgetItem *symbol_value =3D new QTableWidg=
etItem(cur_symbol->nb_val.s);
> +                       solutionTable->setItem(solutionTable->rowCount()-=
1,1,symbol_value);
> +               } else {
> +                       QTableWidgetItem *symbol_value =3D new QTableWidg=
etItem(cur_symbol->disallowed.s);
> +                       solutionTable->setItem(solutionTable->rowCount()-=
1,1,symbol_value);
> +               }
> +       }
> +       updateConflictsViewColorization();
> +}
> +
> +void ConflictsView::updateConflictsViewColorization(void)
> +{
> +       auto green =3D QColor(0,170,0);
> +       auto red =3D QColor(255,0,0);
> +       auto grey =3D QColor(180,180,180);
> +
> +       if (solutionTable->rowCount() =3D=3D 0 || current_solution_number=
 < 0)
> +               return;
> +
> +       for (int i=3D0; i< solutionTable->rowCount(); i++) {
> +               QTableWidgetItem *symbol =3D  solutionTable->item(i,0);
> +               //symbol from solution list
> +               struct sfix_list *selected_solution =3D select_solution(s=
olution_output, current_solution_number);
> +               struct symbol_fix *cur_symbol =3D select_symbol(selected_=
solution,i);
> +
> +               // if symbol is editable but the value is not the target =
value from solution we got, the color is red
> +               // if symbol is editable but the value is the target valu=
e from solution we got, the color is green
> +               // if symbol is not editable , the value is not the targe=
t value, the color is grey
> +               // if symbol is not editable , the value is the target va=
lue, the color is green
> +               auto editable =3D sym_string_within_range(cur_symbol->sym=
, tristate_value_to_string(cur_symbol->tri).toStdString().c_str());
> +               auto _symbol =3D solutionTable->item(i,0)->text().toUtf8(=
).data();
> +               struct symbol *sym_ =3D sym_find(_symbol);
> +
> +               tristate current_value_of_symbol =3D sym_get_tristate_val=
ue(sym_);
> +               tristate target_value_of_symbol =3D string_value_to_trist=
ate(solutionTable->item(i,1)->text());
> +               bool symbol_value_same_as_target =3D current_value_of_sym=
bol =3D=3D target_value_of_symbol;
> +
> +               if (editable && !symbol_value_same_as_target){
> +                       symbol->setForeground(red);
> +               } else if (editable && symbol_value_same_as_target){
> +                       symbol->setForeground(green);
> +               } else if (!editable && !symbol_value_same_as_target){
> +                       symbol->setForeground(grey);
> +               } else if (!editable && symbol_value_same_as_target){
> +                       symbol->setForeground(green);
> +               }
> +    }
> +
> +}
> +
> +void ConflictsView::runSatConfAsync()
> +{
> +       //loop through the rows in conflicts table adding each row into t=
he array:
> +       struct symbol_dvalue *p =3D nullptr;
> +       p =3D static_cast<struct symbol_dvalue *>(calloc(conflictsTable->=
rowCount(),sizeof(struct symbol_dvalue)));
> +       if (!p)
> +       {
> +               printf("memory allocation error\n");
> +               return;
> +       }
> +
> +       struct sdv_list *wanted_symbols =3D sdv_list_init();
> +
> +       for (int i =3D 0; i < conflictsTable->rowCount(); i++)
> +       {
> +
> +               struct symbol_dvalue *tmp =3D (p+i);
> +               auto _symbol =3D conflictsTable->item(i,0)->text().toUtf8=
().data();
> +               struct symbol *sym =3D sym_find(_symbol);
> +
> +               tmp->sym =3D sym;
> +               tmp->type =3D static_cast<symboldv_type>(sym->type =3D=3D=
 symbol_type::S_BOOLEAN?0:1);
> +               tmp->tri =3D string_value_to_tristate(conflictsTable->ite=
m(i,1)->text());
> +               sdv_list_add(wanted_symbols,tmp);
> +       }
> +       fixConflictsAction_->setText("Cancel");
> +       loadingAction->setVisible(true);
> +
> +       struct sfl_list *ret =3D run_satconf(wanted_symbols);
> +       solution_output =3D ret;
> +
> +       free(p);
> +       emit resultsReady();
> +       {
> +               std::lock_guard<std::mutex> lk{satconf_mutex};
> +               satconf_cancelled =3D true;
> +       }
> +       satconf_cancellation_cv.notify_one();
> +
> +}
> +
> +void ConflictsView::updateResults(void)
> +{
> +       fixConflictsAction_->setText("Calculate Fixes");
> +       loadingAction->setVisible(false);
> +       if (!(solution_output =3D=3D nullptr || solution_output->size =3D=
=3D 0))
> +       {
> +               solutionSelector->clear();
> +               for (unsigned int i =3D 0; i < solution_output->size; i++=
)
> +               {
> +                       solutionSelector->addItem(QString::number(i+1));
> +               }
> +               // populate the solution table from the first solution go=
tten
> +               numSolutionLabel->setText(QString("Solutions: (%1) found"=
).arg(solution_output->size));
> +               changeSolutionTable(0);
> +       }
> +       else {
> +               QMessageBox msgBox;
> +               msgBox.setText("All symbols are already within range.");
> +               msgBox.exec();
> +       }
> +       if (runSatConfAsyncThread->joinable()){
> +               runSatConfAsyncThread->join();
> +               delete runSatConfAsyncThread;
> +               runSatConfAsyncThread  =3D nullptr;
> +       }
> +
> +}
> +
> +void ConflictsView::calculateFixes()
> +{
> +       if(conflictsTable->rowCount() =3D=3D 0)
> +       {
> +               printd("table is empty\n");
> +               return;
> +       }
> +
> +       if (runSatConfAsyncThread =3D=3D nullptr)
> +       {
> +               // fire away asynchronous call
> +               std::unique_lock<std::mutex> lk{satconf_mutex};
> +
> +               numSolutionLabel->setText(QString("Solutions: "));
> +               solutionSelector->clear();
> +               solutionTable->setRowCount(0);
> +               satconf_cancelled =3D false;
> +               runSatConfAsyncThread =3D new std::thread(&ConflictsView:=
:runSatConfAsync,this);
> +       }else{
> +               printd("Interrupting rangefix\n");
> +               interrupt_rangefix();
> +               std::unique_lock<std::mutex> lk{satconf_mutex};
> +               satconf_cancellation_cv.wait(lk,[this] {return satconf_ca=
ncelled =3D=3D true;});
> +       }
> +
> +}
> +
> +void ConflictsView::changeAll(void)
> +{
> +       // not implemented for now
> +       return;
> +}
> +
> +ConflictsView::~ConflictsView(void)
> +{
> +
> +}
> +
> +
>  void fixup_rootmenu(struct menu *menu)
>  {
>         struct menu *child;
> @@ -1918,3 +2394,38 @@ int main(int ac, char** av)
>
>         return 0;
>  }
> +
> +dropAbleView::dropAbleView(QWidget *parent) :
> +    QTableWidget(parent) {}
> +
> +dropAbleView::~dropAbleView() {}
> +void dropAbleView::dropEvent(QDropEvent *event)
> +{
> +   event->acceptProposedAction();
> +}
> +
> +static QString tristate_value_to_string(tristate val)
> +{
> +       switch ( val ) {
> +       case yes:
> +               return QString::fromStdString("YES");
> +       case mod:
> +               return QString::fromStdString("MODULE");
> +       case no:
> +               return QString::fromStdString("NO");
> +       default:
> +               return QString::fromStdString("");
> +       }
> +
> +}
> +
> +static tristate string_value_to_tristate(QString s){
> +       if (s =3D=3D "YES")
> +               return tristate::yes;
> +       else if (s =3D=3D "MODULE")
> +               return tristate::mod;
> +       else if (s =3D=3D "NO")
> +               return tristate::no;
> +       else
> +               return tristate::no;
> +}
> diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> index 53373064d90a..1ace9f673fd0 100644
> --- a/scripts/kconfig/qconf.h
> +++ b/scripts/kconfig/qconf.h
> @@ -14,9 +14,16 @@
>  #include <QStyledItemDelegate>
>  #include <QTextBrowser>
>  #include <QTreeWidget>
> +#include <QTableWidget>
> +#include <QList>
> +#include <QComboBox>
> +#include <QLabel>
> +#include <thread>
> +#include <condition_variable>
>
>  #include "expr.h"
>
> +


Unrelated change.
(Do not add excessive brank line)





>  class ConfigList;
>  class ConfigItem;
>  class ConfigMainWindow;
> @@ -80,6 +87,8 @@ public slots:
>         void parentSelected(void);
>         void gotFocus(struct menu *);
>         void showNameChanged(bool on);
> +       void selectionChanged(QList<QTreeWidgetItem *> selection);
> +       void updateConflictsViewColorization();
>
>  public:
>         void updateListAll(void)
> @@ -111,6 +120,82 @@ public slots:
>         static void updateListAllForAll();
>
>         static QAction *showNormalAction, *showAllAction, *showPromptActi=
on;
> +       static QAction *addSymbolFromContextMenu;
> +
> +};
> +
> +class ConflictsView : public QWidget {
> +       Q_OBJECT
> +       typedef class QWidget Parent;
> +private:
> +       QAction *loadingAction;
> +public:
> +       ConflictsView(QWidget *parent, const char *name =3D 0);
> +       ~ConflictsView(void);
> +       void addSymbolFromMenu(struct menu *m);
> +       int current_solution_number =3D -1;
> +
> +public slots:
> +       void cellClicked(int, int);
> +       void changeAll();
> +       // triggered by Qactions on the tool bar that adds/remove symbol
> +       void addSymbol();
> +       // triggered from config list right click -> add symbols
> +       void addSymbolFromContextMenu();
> +       void removeSymbol();
> +       void menuChanged(struct menu *);
> +       void changeToNo();
> +       void changeToYes();
> +       void changeToModule();
> +       void selectionChanged(QList<QTreeWidgetItem *> selection);
> +
> +
> +       void applyFixButtonClick();
> +       void updateConflictsViewColorization();
> +       void updateResults();
> +
> +
> +
> +       // switches the solution table with selected solution index from =
 solution_output
> +       void changeSolutionTable(int solution_number);
> +
> +       // calls satconfig to solve to get wanted value to current value
> +       void calculateFixes();
> +signals:
> +       void showNameChanged(bool);
> +       void showRangeChanged(bool);
> +       void showDataChanged(bool);
> +       void conflictSelected(struct menu *);
> +       void refreshMenu();
> +       void resultsReady();
> +public:
> +       QTableWidget *conflictsTable;
> +
> +       // the comobox on the right hand side. used to select a solution =
after
> +       // getting solution from satconfig
> +       QComboBox *solutionSelector{nullptr};
> +
> +       // the table which shows the selected solution showing variable =
=3D New value changes
> +       QTableWidget *solutionTable{nullptr};
> +
> +       // Apply fixes button on the solution view
> +       QPushButton *applyFixButton{nullptr};
> +
> +       struct sfl_list *solution_output{nullptr};
> +
> +       QToolBar *conflictsToolBar;
> +       struct menu *currentSelectedMenu;
> +       QLabel *numSolutionLabel{nullptr};
> +       // currently selected config items in configlist.
> +       QList<QTreeWidgetItem *> currentSelection;
> +       QAction *fixConflictsAction_{nullptr};
> +       void runSatConfAsync();
> +       std::thread *runSatConfAsyncThread{nullptr};
> +
> +       std::mutex satconf_mutex;
> +       std::condition_variable satconf_cancellation_cv;
> +       bool satconf_cancelled{false};
> +
>  };
>
>  class ConfigItem : public QTreeWidgetItem {
> @@ -223,6 +308,9 @@ class ConfigSearchWindow : public QDialog {
>  public slots:
>         void saveSettings(void);
>         void search(void);
> +       void updateConflictsViewColorizationFowarder();
> +signals:
> +       void updateConflictsViewColorization();
>
>  protected:
>         QLineEdit* editField;
> @@ -258,6 +346,8 @@ public slots:
>         void showIntro(void);
>         void showAbout(void);
>         void saveSettings(void);
> +       void conflictSelected(struct menu *);
> +       void refreshMenu();
>
>  protected:
>         void closeEvent(QCloseEvent *e);
> @@ -266,10 +356,23 @@ public slots:
>         ConfigList *menuList;
>         ConfigList *configList;
>         ConfigInfoView *helpText;
> +       ConflictsView *conflictsView;
> +       QToolBar *conflictsToolBar;
>         QAction *backAction;
>         QAction *singleViewAction;
>         QAction *splitViewAction;
>         QAction *fullViewAction;
>         QSplitter *split1;
>         QSplitter *split2;
> +       QSplitter *split3;
> +};
> +
> +class dropAbleView : public QTableWidget
> +{
> +public:
> +       dropAbleView(QWidget *parent =3D nullptr);
> +       ~dropAbleView();
> +
> +protected:
> +       void dropEvent(QDropEvent *event);
>  };
> --
> 2.39.2
>
>


--
Best Regards
Masahiro Yamada

