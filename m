Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFDF23EA08
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgHGJT6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:19:58 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41593 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgHGJTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:40 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQD032147;
        Fri, 7 Aug 2020 18:19:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQD032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791965;
        bh=ip028Ys+1XuhC727EvA1DiIeDJuyfL2ax2HjydvDfv0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tvbGc3qRW7ZYz4oS/IW9t9peeRnNIyxyBWgWuYMHU+bvBlTq3dzhkSD74QEA2F4SV
         glCbwLc9ssru2FbAkE03xh7XWw8MoROuxu4zlgJIC1FA4zNUHwE9/DoS7UuJG6rG5Q
         G3ZIlwThyhMxiRLRkKALFJAsznQ2dDzO/pVSNvp4IuIUl614FUCmVdWQV4Sw/XFGJC
         EVsjyjuHwj5JTWaz5Yug4ludJ+vawqHosogf+owOZrSrkKahCdAGnxHqvpxs9+04kW
         S/fzbHjuZkG4/RaH+URkvhwLdnxyW55mMbX4b4l68ksi4GFa2vZnBM+n3ZmIs3yVDK
         DWNiqfOCW0VRw==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/19] kconfig: qconf: refactor icon setups
Date:   Fri,  7 Aug 2020 18:19:07 +0900
Message-Id: <20200807091909.2985787-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These icon data are used by ConfigItem, but stored in each instance
of ConfigView. There is no point to keep the same data in each of 3
instances, "menu", "config", and "search".

Move the icon data to the more relevant ConfigItem class, and make
them static members.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.cc | 33 +++++++++++++++++++++++----------
 scripts/kconfig/qconf.h  |  8 ++++----
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 90b618785239..19f7764c1d68 100644
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
+	ConfigItem::menuIcon = QIcon(QPixmap(xpm_menu));
+	ConfigItem::menubackIcon = QIcon(QPixmap(xpm_menuback));
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

