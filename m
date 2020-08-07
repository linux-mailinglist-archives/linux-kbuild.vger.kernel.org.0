Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECEC23EA2C
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbgHGJVF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:21:05 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41487 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbgHGJTg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQ5032147;
        Fri, 7 Aug 2020 18:19:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQ5032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791959;
        bh=wcQtGbOj9XhHI6wWL7vZJQ63g4ziMw2pUhgbDBbdCek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rmu7h0Asv4aQ4U6rI66EVNpzQXcJu1zZ9z99DYPzKb12bPs45M9ESQCHAalLonq5R
         dQr42LisLxu0V31JDp/NrplWi0dNCwmM75cofKox0t59sKKWufwpM5r6TWAVpjEg3h
         zVq22PV85x2g7KkqaljOyp3KU9PnZRbUdVmeAkb/Y4/UFW87zgRbyK2dtx1sUKXNkW
         eUuJiuk68+zNu+cCQOfARqeo41dRkggwFMRXcAg2B/rkpLEfJztR0/VorCNpYFr1nT
         MFLGBBQTHlFHO2XvJ7RVaGT3C62tY8DCjzqNPe4M7yuSTFm1IRK7sP1Mj26FG2OZEd
         XymffCisAm4Cg==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/19] kconfig: qconf: remove unused argument from ConfigList::updateList()
Date:   Fri,  7 Aug 2020 18:18:59 +0900
Message-Id: <20200807091909.2985787-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This function allocates 'item' before using it, so the argument 'item'
is always shadowed.

Remove the meaningless argument.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.cc | 6 +++---
 scripts/kconfig/qconf.h  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 0b93db2d61aa..8455f81e101f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -404,15 +404,15 @@ void ConfigList::updateSelection(void)
 		emit menuSelected(menu);
 }
 
-void ConfigList::updateList(ConfigItem* item)
+void ConfigList::updateList()
 {
 	ConfigItem* last = 0;
+	ConfigItem *item;
 
 	if (!rootEntry) {
 		if (mode != listMode)
 			goto update;
 		QTreeWidgetItemIterator it(this);
-		ConfigItem* item;
 
 		while (*it) {
 			item = (ConfigItem*)(*it);
@@ -989,7 +989,7 @@ void ConfigView::updateList(ConfigItem* item)
 	ConfigView* v;
 
 	for (v = viewList; v; v = v->nextView)
-		v->list->updateList(item);
+		v->list->updateList();
 }
 
 void ConfigView::updateListAll(void)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 335f0776984f..4dc5d34a6bca 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -69,7 +69,7 @@ class ConfigList : public QTreeWidget {
 public slots:
 	void setRootMenu(struct menu *menu);
 
-	void updateList(ConfigItem *item);
+	void updateList();
 	void setValue(ConfigItem* item, tristate val);
 	void changeValue(ConfigItem* item);
 	void updateSelection(void);
@@ -85,7 +85,7 @@ public slots:
 	void updateListAll(void)
 	{
 		updateAll = true;
-		updateList(NULL);
+		updateList();
 		updateAll = false;
 	}
 	void addColumn(colIdx idx)
-- 
2.25.1

