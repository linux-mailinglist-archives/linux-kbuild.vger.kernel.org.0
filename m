Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4D220E5B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391316AbgF2Vkr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:40:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728211AbgF2SkW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:22 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 93344239EB;
        Mon, 29 Jun 2020 10:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593428270;
        bh=HcI2xoslyx35NhmXNHGQ6SltaGNwVVmR149tf8bukok=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q6ZvW0Q2Zji1S022ZPEy0rHL9G0AiIAbnzvM1O+PwWKleo95q6udALhwSKjsSf+/q
         jtPd3P+BH8MsMr6fBUgVJKgKpL0XVHfY7dM5DpcgDtfvAI3ZGdxj/S8T9KRjysoxl1
         T4tbDH1Nczj8GcPWIrCYTFzAz1MeOTNOs9f8E0eM=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jprTw-006kPP-F2; Mon, 29 Jun 2020 12:57:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: re-implement setSelected()
Date:   Mon, 29 Jun 2020 12:57:45 +0200
Message-Id: <7778611fde57d3e221cc1ed077c7b78bedb3cbd7.1593428163.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593423060.git.mchehab+huawei@kernel.org>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The default implementation for setSelected() at QTreeWidgetItem
allows multiple items to be selected.

Well, this should never be possible for the configItem lists.

So, implement a function that will automatically clean any
previous selection. This simplifies the logic somewhat, while
making the selection logic to be applied atomically, avoiding
future issues on that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

This is a followup patch after the series I sent previously.

I noticed that there are still some situations where it might be
possible to have multiple lines selected at the config lists.

This patch addresses it on a different way, ensuring that it shouldn't
be possible anymore to have more than one lines selected.

 scripts/kconfig/qconf.cc | 22 ++++------------------
 scripts/kconfig/qconf.h  | 14 ++++++++++----
 2 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index d8870b15a178..0ba373a3cdd4 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -537,7 +537,7 @@ void ConfigList::setRootMenu(struct menu *menu)
 	rootEntry = menu;
 	updateListAll();
 	if (currentItem()) {
-		currentItem()->setSelected(hasFocus());
+		setSelected(currentItem(), hasFocus());
 		scrollToItem(currentItem());
 	}
 }
@@ -865,7 +865,7 @@ void ConfigList::focusInEvent(QFocusEvent *e)
 
 	ConfigItem* item = (ConfigItem *)currentItem();
 	if (item) {
-		item->setSelected(true);
+		setSelected(item, true);
 		menu = item->menu;
 	}
 	emit gotFocus(menu);
@@ -1696,17 +1696,10 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 			if (!parent)
 				return;
 
-			/* Clear an already-selected item */
-			if (!configList->selectedItems().isEmpty()) {
-				item = (ConfigItem*)configList->selectedItems().first();
-				if (item)
-					item->setSelected(false);
-			}
-
 			/* Select the config view */
 			item = configList->findConfigItem(parent);
 			if (item) {
-				item->setSelected(true);
+				configList->setSelected(item, true);
 				configList->scrollToItem(item);
 			}
 
@@ -1723,16 +1716,9 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	}
 
 	if (list) {
-		/* Clear an already-selected item */
-		if (!list->selectedItems().isEmpty()) {
-			item = (ConfigItem*)list->selectedItems().first();
-			if (item)
-				item->setSelected(false);
-		}
-
 		item = list->findConfigItem(menu);
 		if (item) {
-			item->setSelected(true);
+			list->setSelected(item, true);
 			list->scrollToItem(item);
 			list->setFocus();
 			helpText->setInfo(menu);
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index a193137f2314..fb9e9729266f 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -45,11 +45,17 @@ class ConfigList : public QTreeWidget {
 public:
 	ConfigList(ConfigView* p, const char *name = 0);
 	void reinit(void);
-	ConfigView* parent(void) const
-	{
-		return (ConfigView*)Parent::parent();
-	}
 	ConfigItem* findConfigItem(struct menu *);
+	ConfigView* parent(void) const
+	{
+		return (ConfigView*)Parent::parent();
+	}
+	void setSelected(QTreeWidgetItem *item, bool enable) {
+		for (int i = 0; i < selectedItems().size(); i++)
+			selectedItems().at(i)->setSelected(false);
+
+		item->setSelected(enable);
+	}
 
 protected:
 	void keyPressEvent(QKeyEvent *e);
-- 
2.26.2


