Return-Path: <linux-kbuild+bounces-5185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B69839F7550
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 08:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 795E6188F884
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 07:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041DD21660F;
	Thu, 19 Dec 2024 07:23:17 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842607082A;
	Thu, 19 Dec 2024 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734592996; cv=none; b=Zejc2SyFMSKgHRDN3R4vjQz457muvQDtkhKYZTq81BD53AzpeZX4MoaBCKDAY6fYTehJTaR8RbCtA5YszE0AX2i/kxdl1pDq1AITDklqGFJcr/gbmtksvgLPAZ8w3bV38kB97buhYUl4EjSydnYvfx95UtLoUo3p//MtJMbhMak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734592996; c=relaxed/simple;
	bh=TVzI0563c4bn+xjscJQaU/9w+t12qIXwTg7ww21M9kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sr5TgWAJFn4middw5KspHhX7Ef0MHfV5WtRJxqGq3aHS1Rk/Q96HD9hsiq2S7xeFEihOAGMSr7fLDme7ufrQEFN00emHLrHcrmBaQFE4yz2tbPJOxe6GO4IY7BqhPPDK0RahBjC9bJGMiMe+N1hvgEEt0RHWSJcfTSlO6UXHesI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 3D1175F8DD;
	Thu, 19 Dec 2024 08:23:11 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] kconfig: qconf: use nullptr in C++11 code
Date: Thu, 19 Dec 2024 08:22:59 +0100
Message-ID: <2968348.e9J7NaK4W3@devpool47.emlix.com>
Organization: emlix GmbH
In-Reply-To: <5843611.DvuYhMxLoT@devpool47.emlix.com>
References: <5843611.DvuYhMxLoT@devpool47.emlix.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

This C++11 keyword is typesafe, i.e. it can't be assigned to non-pointers, =
and
it makes it visually clear that this is about a pointer.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 scripts/kconfig/qconf.cc | 42 ++++++++++++++++++++--------------------
 scripts/kconfig/qconf.h  |  8 ++++----
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 4d500cc9ba9d..7cfd19dadc51 100644
=2D-- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -303,7 +303,7 @@ ConfigList::ConfigList(QWidget *parent, const char *nam=
e)
 	: QTreeWidget(parent),
 	  updateAll(false),
 	  showName(false), mode(singleMode), optMode(normalOpt),
=2D	  rootEntry(0), headerPopup(0)
+	  rootEntry(nullptr), headerPopup(nullptr)
 {
 	setObjectName(name);
 	setSortingEnabled(false);
@@ -417,7 +417,7 @@ void ConfigList::updateSelection(void)
=20
 void ConfigList::updateList()
 {
=2D	ConfigItem* last =3D 0;
+	ConfigItem* last =3D nullptr;
 	ConfigItem *item;
=20
 	if (!rootEntry) {
@@ -439,7 +439,7 @@ void ConfigList::updateList()
 	if (rootEntry !=3D &rootmenu && mode =3D=3D singleMode) {
 		item =3D (ConfigItem *)topLevelItem(0);
 		if (!item)
=2D			item =3D new ConfigItem(this, 0);
+			item =3D new ConfigItem(this, nullptr);
 		last =3D item;
 	}
 	if ((mode =3D=3D singleMode || (mode =3D=3D symbolMode && !(rootEntry->fl=
ags & MENU_ROOT))) &&
@@ -489,7 +489,7 @@ void ConfigList::setValue(ConfigItem* item, tristate va=
l)
 	int type;
 	tristate oldval;
=20
=2D	sym =3D item->menu ? item->menu->sym : 0;
+	sym =3D item->menu ? item->menu->sym : nullptr;
 	if (!sym)
 		return;
=20
@@ -553,7 +553,7 @@ void ConfigList::setRootMenu(struct menu *menu)
 	type =3D menu && menu->prompt ? menu->prompt->type : P_UNKNOWN;
 	if (type !=3D P_MENU)
 		return;
=2D	updateMenuList(0);
+	updateMenuList(nullptr);
 	rootEntry =3D menu;
 	updateListAll();
 	if (currentItem()) {
@@ -610,7 +610,7 @@ void ConfigList::updateMenuList(ConfigItem *parent, str=
uct menu* menu)
=20
 	last =3D parent->firstChild();
 	if (last && !last->goParent)
=2D		last =3D 0;
+		last =3D nullptr;
 	for (child =3D menu->list; child; child =3D child->next) {
 		item =3D last ? last->nextSibling() : parent->firstChild();
 		type =3D child->prompt ? child->prompt->type : P_UNKNOWN;
@@ -639,7 +639,7 @@ void ConfigList::updateMenuList(ConfigItem *parent, str=
uct menu* menu)
 			if (mode =3D=3D fullMode || mode =3D=3D menuMode || type !=3D P_MENU)
 				updateMenuList(item, child);
 			else
=2D				updateMenuList(item, 0);
+				updateMenuList(item, nullptr);
 			last =3D item;
 			continue;
 		}
@@ -647,7 +647,7 @@ hide:
 		if (item && item->menu =3D=3D child) {
 			last =3D parent->firstChild();
 			if (last =3D=3D item)
=2D				last =3D 0;
+				last =3D nullptr;
 			else while (last->nextSibling() !=3D item)
 				last =3D last->nextSibling();
 			delete item;
@@ -673,7 +673,7 @@ void ConfigList::updateMenuList(struct menu *menu)
=20
 	last =3D (ConfigItem *)topLevelItem(0);
 	if (last && !last->goParent)
=2D		last =3D 0;
+		last =3D nullptr;
 	for (child =3D menu->list; child; child =3D child->next) {
 		item =3D last ? last->nextSibling() : (ConfigItem *)topLevelItem(0);
 		type =3D child->prompt ? child->prompt->type : P_UNKNOWN;
@@ -702,7 +702,7 @@ void ConfigList::updateMenuList(struct menu *menu)
 			if (mode =3D=3D fullMode || mode =3D=3D menuMode || type !=3D P_MENU)
 				updateMenuList(item, child);
 			else
=2D				updateMenuList(item, 0);
+				updateMenuList(item, nullptr);
 			last =3D item;
 			continue;
 		}
@@ -710,7 +710,7 @@ hide:
 		if (item && item->menu =3D=3D child) {
 			last =3D (ConfigItem *)topLevelItem(0);
 			if (last =3D=3D item)
=2D				last =3D 0;
+				last =3D nullptr;
 			else while (last->nextSibling() !=3D item)
 				last =3D last->nextSibling();
 			delete item;
@@ -853,7 +853,7 @@ skip:
=20
 void ConfigList::focusInEvent(QFocusEvent *e)
 {
=2D	struct menu *menu =3D NULL;
+	struct menu *menu =3D nullptr;
=20
 	Parent::focusInEvent(e);
=20
@@ -912,7 +912,7 @@ void ConfigList::setAllOpen(bool open)
 }
=20
 ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
=2D	: Parent(parent), sym(0), _menu(0)
+	: Parent(parent), sym(nullptr), _menu(nullptr)
 {
 	setObjectName(name);
 	setOpenLinks(false);
@@ -964,7 +964,7 @@ void ConfigInfoView::setInfo(struct menu *m)
 	if (_menu =3D=3D m)
 		return;
 	_menu =3D m;
=2D	sym =3D NULL;
+	sym =3D nullptr;
 	if (!_menu)
 		clear();
 	else
@@ -1156,7 +1156,7 @@ void ConfigInfoView::contextMenuEvent(QContextMenuEve=
nt *event)
 }
=20
 ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
=2D	: Parent(parent), result(NULL)
+	: Parent(parent), result(nullptr)
 {
 	setObjectName("search");
 	setWindowTitle("Search Config");
@@ -1228,7 +1228,7 @@ void ConfigSearchWindow::search(void)
 {
 	struct symbol **p;
 	struct property *prop;
=2D	ConfigItem *lastItem =3D NULL;
+	ConfigItem *lastItem =3D nullptr;
=20
 	free(result);
 	list->clear();
@@ -1247,7 +1247,7 @@ void ConfigSearchWindow::search(void)
  * Construct the complete config widget
  */
 ConfigMainWindow::ConfigMainWindow(void)
=2D	: searchWindow(0)
+	: searchWindow(nullptr)
 {
 	bool ok =3D true;
 	QVariant x, y;
@@ -1524,7 +1524,7 @@ void ConfigMainWindow::changeMenu(struct menu *menu)
 void ConfigMainWindow::setMenuLink(struct menu *menu)
 {
 	struct menu *parent;
=2D	ConfigList* list =3D NULL;
+	ConfigList* list =3D nullptr;
 	ConfigItem* item;
=20
 	if (configList->menuSkip(menu))
@@ -1601,7 +1601,7 @@ void ConfigMainWindow::showSingleView(void)
 	backAction->setEnabled(true);
=20
 	menuList->hide();
=2D	menuList->setRootMenu(0);
+	menuList->setRootMenu(nullptr);
 	configList->mode =3D singleMode;
 	if (configList->rootEntry =3D=3D &rootmenu)
 		configList->updateListAll();
@@ -1647,7 +1647,7 @@ void ConfigMainWindow::showFullView(void)
 	backAction->setEnabled(false);
=20
 	menuList->hide();
=2D	menuList->setRootMenu(0);
+	menuList->setRootMenu(nullptr);
 	configList->mode =3D fullMode;
 	if (configList->rootEntry =3D=3D &rootmenu)
 		configList->updateListAll();
@@ -1800,7 +1800,7 @@ int main(int ac, char** av)
 	cmdline.process(*configApp);
=20
 	if (cmdline.isSet(silent))
=2D		conf_set_message_callback(NULL);
+		conf_set_message_callback(nullptr);
=20
 	QStringList args =3D cmdline.positionalArguments();
 	if (args.isEmpty())
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 1c90fec4c2da..5f6c57383aba 100644
=2D-- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -42,7 +42,7 @@ class ConfigList : public QTreeWidget {
 	Q_OBJECT
 	typedef class QTreeWidget Parent;
 public:
=2D	ConfigList(QWidget *parent, const char *name =3D 0);
+	ConfigList(QWidget *parent, const char *name =3D nullptr);
 	~ConfigList();
 	void reinit(void);
 	ConfigItem* findConfigItem(struct menu *);
@@ -115,12 +115,12 @@ class ConfigItem : public QTreeWidgetItem {
 	typedef class QTreeWidgetItem Parent;
 public:
 	ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m =3D null=
ptr)
=2D	: Parent(parent, after), nextItem(0), menu(m), goParent(false)
+	: Parent(parent, after), nextItem(nullptr), menu(m), goParent(false)
 	{
 		init();
 	}
 	ConfigItem(ConfigItem *parent, ConfigItem *after, struct menu *m)
=2D	: Parent(parent, after), nextItem(0), menu(m), goParent(false)
+	: Parent(parent, after), nextItem(nullptr), menu(m), goParent(false)
 	{
 		init();
 	}
@@ -180,7 +180,7 @@ class ConfigInfoView : public QTextBrowser {
 	typedef class QTextBrowser Parent;
 	QMenu *contextMenu;
 public:
=2D	ConfigInfoView(QWidget* parent, const char *name =3D 0);
+	ConfigInfoView(QWidget* parent, const char *name =3D nullptr);
 	bool showDebug(void) const { return _showDebug; }
=20
 public slots:
=2D-=20
2.47.1


=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner



