Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE1220EE4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730090AbgF3G0r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:26:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:55704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730047AbgF3G0q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:26:46 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA2BB207D0;
        Tue, 30 Jun 2020 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593498405;
        bh=v+fJP3zpnLdDqpCxjw9RsnC9MqdLnPMCDMn2cVHwDew=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SZPsWt5gjjvoK9c1Tl4sFnb0CvJbUqtQBuhZnt9YboBXVABfiz8NhcZAg780i/1vG
         bIt9qmj+jxelZBJQSLa7bPmy7OIpLuoupELcpfbCqy+gjHXXk1rNPY8nPGM7jXPuDL
         TxvNHMdzmauWtDcBImUaEQmRoF7P+Soy0Ofxsxz4=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jq9j9-008Wb2-Ri; Tue, 30 Jun 2020 08:26:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] kconfig: qconf: re-implement setSelected()
Date:   Tue, 30 Jun 2020 08:26:38 +0200
Message-Id: <872efc941f9780bb9e2ee919437be3babbc38da8.1593498345.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593498345.git.mchehab+huawei@kernel.org>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
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
 scripts/kconfig/qconf.cc | 15 ++++-----------
 scripts/kconfig/qconf.h  | 14 ++++++++++----
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 1fddbdfa58b4..29ca4823cfb9 100644
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
@@ -1711,17 +1711,10 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
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
 
@@ -1740,7 +1733,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	if (list) {
 		item = list->findConfigItem(menu);
 		if (item) {
-			item->setSelected(true);
+			list->setSelected(item, true);
 			list->scrollToItem(item);
 			list->setFocus();
 		}
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

