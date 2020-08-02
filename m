Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF345235854
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgHBQSG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48902 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgHBQSF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:05 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOar003720;
        Mon, 3 Aug 2020 01:17:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOar003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385052;
        bh=Fx4RBBuLEX1RyuzYReHJPlRR6nF9JYaZi1x4BFu3SOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hNYqxS8PG7FKFhnRI/Kw8GHEMux3F6osUkMwyc3WJzFHARMFLeLlH8wD1IHvm52wE
         qBIeQq1+mwdg21nNmkNotBrcWeoNr5Y6yu6GNSJXjptDvoFWOzOGEsf0GbODvaCefg
         CKlYdHYdMTjDEGM6lh+C8gOG4eHjEGBngR3vrpKwboZNHNcdGuNy9A8rop+QwFa93F
         EOaqTCE4QPffT5g1WrGvVgTn9CIg4JYGheYE9goEaLIr3O4S5kvsZcSKAIIr7hA2Sr
         KkB1RS9qi678jLMDP3Rqorr/uOnV9gYTe6zfwXnIXcPLMX8OQhA6y+08I1wKZQVEK9
         a4UlDx0TDUZjQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/16] kconfig: qconf: refactor icon setups
Date:   Mon,  3 Aug 2020 01:17:21 +0900
Message-Id: <20200802161721.921721-16-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These icon data are used by ConfigItem, but stored in each instance
of ConfigView. There is no point to keep the same data in each of 3
instances ("menu", "config", and "search").

Move the icon data to the more relevant ConfigItem class, and make
them static members.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 33 +++++++++++++++++++++++----------
 scripts/kconfig/qconf.h  |  8 ++++----
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 00b2f56186c2..1944abe8f028 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -74,6 +74,13 @@ bool ConfigSettings::writeSizes(const QString& key, const QList<int>& value)
 	return true;
 }
 
+QIcon ConfigItem::symbolYesIcon;
+QIcon ConfigItem::symbolModIcon;
+QIcon ConfigItem::symbolNoIcon;
+QIcon ConfigItem::choiceYesIcon;
+QIcon ConfigItem::choiceNoIcon;
+QIcon ConfigItem::menuIcon;
+QIcon ConfigItem::menubackIcon;
 
 /*
  * set the new data
@@ -97,7 +104,7 @@ void ConfigItem::updateMenu(void)
 
 	list = listView();
 	if (goParent) {
-		setIcon(promptColIdx, list->menuBackPix);
+		setIcon(promptColIdx, menubackIcon);
 		prompt = "..";
 		goto set_prompt;
 	}
@@ -114,7 +121,7 @@ void ConfigItem::updateMenu(void)
 			 */
 			if (sym && list->rootEntry == menu)
 				break;
-			setIcon(promptColIdx, list->menuPix);
+			setIcon(promptColIdx, menuIcon);
 		} else {
 			if (sym)
 				break;
@@ -149,22 +156,22 @@ void ConfigItem::updateMenu(void)
 		switch (expr) {
 		case yes:
 			if (sym_is_choice_value(sym) && type == S_BOOLEAN)
-				setIcon(promptColIdx, list->choiceYesPix);
+				setIcon(promptColIdx, choiceYesIcon);
 			else
-				setIcon(promptColIdx, list->symbolYesPix);
+				setIcon(promptColIdx, symbolYesIcon);
 			setText(yesColIdx, "Y");
 			ch = 'Y';
 			break;
 		case mod:
-			setIcon(promptColIdx, list->symbolModPix);
+			setIcon(promptColIdx, symbolModIcon);
 			setText(modColIdx, "M");
 			ch = 'M';
 			break;
 		default:
 			if (sym_is_choice_value(sym) && type == S_BOOLEAN)
-				setIcon(promptColIdx, list->choiceNoPix);
+				setIcon(promptColIdx, choiceNoIcon);
 			else
-				setIcon(promptColIdx, list->symbolNoPix);
+				setIcon(promptColIdx, symbolNoIcon);
 			setText(noColIdx, "N");
 			ch = 'N';
 			break;
@@ -289,9 +296,6 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 ConfigList::ConfigList(ConfigView* p, const char *name)
 	: Parent(p),
 	  updateAll(false),
-	  symbolYesPix(xpm_symbol_yes), symbolModPix(xpm_symbol_mod), symbolNoPix(xpm_symbol_no),
-	  choiceYesPix(xpm_choice_yes), choiceNoPix(xpm_choice_no),
-	  menuPix(xpm_menu), menuBackPix(xpm_menuback),
 	  showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
 	  rootEntry(0), headerPopup(0)
 {
@@ -1395,6 +1399,15 @@ ConfigMainWindow::ConfigMainWindow(void)
 	if ((x.isValid())&&(y.isValid()))
 		move(x.toInt(), y.toInt());
 
+	// set up icons
+	ConfigItem::symbolYesIcon = QIcon(QPixmap(xpm_symbol_yes));
+	ConfigItem::symbolModIcon = QIcon(QPixmap(xpm_symbol_mod));
+	ConfigItem::symbolNoIcon = QIcon(QPixmap(xpm_symbol_no));
+	ConfigItem::choiceYesIcon = QIcon(QPixmap(xpm_choice_yes));
+	ConfigItem::choiceNoIcon = QIcon(QPixmap(xpm_choice_no));
+	ConfigItem::menubackIcon = QIcon(QPixmap(xpm_menuback));
+	ConfigItem::menuIcon = QIcon(QPixmap(xpm_menu));
+
 	QWidget *widget = new QWidget(this);
 	QVBoxLayout *layout = new QVBoxLayout(widget);
 	setCentralWidget(widget);
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index c46a79a69001..460b858b0faa 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -98,10 +98,6 @@ public slots:
 
 	bool updateAll;
 
-	QPixmap symbolYesPix, symbolModPix, symbolNoPix;
-	QPixmap choiceYesPix, choiceNoPix;
-	QPixmap menuPix, menuBackPix;
-
 	bool showName, showRange, showData;
 	enum listMode mode;
 	enum optionMode optMode;
@@ -162,6 +158,10 @@ class ConfigItem : public QTreeWidgetItem {
 	struct menu *menu;
 	bool visible;
 	bool goParent;
+
+	static QIcon symbolYesIcon, symbolModIcon, symbolNoIcon;
+	static QIcon choiceYesIcon, choiceNoIcon;
+	static QIcon menuIcon, menubackIcon;
 };
 
 class ConfigLineEdit : public QLineEdit {
-- 
2.25.1

