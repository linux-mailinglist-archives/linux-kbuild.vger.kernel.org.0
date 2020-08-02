Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15F0235869
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgHBQSe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:34 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48905 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOal003720;
        Mon, 3 Aug 2020 01:17:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOal003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385049;
        bh=qPig2vflg/7ZPARWjjn8bjUvyZZG6lOHLx5Ds8QNDF4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dt5KpR2Hmfslmk/Y0EYV5HeJSJTHofvwodcGZCEFSk9DShmFyPpeLxwbLA0vTDmWg
         7KVSXCQsDugEZaqS2K5w2nHv+IyplDy7sYAj8Qo1065QLVR9r6x4jF9guxS8Z6IvYR
         X7yj1coShLhnO6c8klRV2L7n+0TcMrjxGfN4G+bdfyOvkXlh2aClpdql9z4rKH7vXV
         MZIvtS40FldagXQDjQgZ05bS7p1vjMieJNyPjdXKH4faI885/6JGG/0g8OomvksPPJ
         VNMA4P8c9nIBnSWWgUbkQIDaC1lA089n2ZkQDMiu7wmq7X7MQ9glDnfVs1L48a8cpU
         gIfpViYlLIp8A==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/16] kconfig: qconf: remove 'parent' from ConfigList::updateMenuList()
Date:   Mon,  3 Aug 2020 01:17:15 +0900
Message-Id: <20200802161721.921721-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

All the callers of this function passes 'this' to the first argument.

So, 'parent' is always 'this'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 18 +++++++++---------
 scripts/kconfig/qconf.h  |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f492e8810f89..7f7164c71163 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -446,7 +446,7 @@ void ConfigList::updateList()
 		return;
 	}
 update:
-	updateMenuList(this, rootEntry);
+	updateMenuList(rootEntry);
 	update();
 	resizeColumnToContents(0);
 }
@@ -524,7 +524,7 @@ void ConfigList::setRootMenu(struct menu *menu)
 	type = menu && menu->prompt ? menu->prompt->type : P_UNKNOWN;
 	if (type != P_MENU)
 		return;
-	updateMenuList(this, 0);
+	updateMenuList(0);
 	rootEntry = menu;
 	updateListAll();
 	if (currentItem()) {
@@ -628,7 +628,7 @@ hide:
 	}
 }
 
-void ConfigList::updateMenuList(ConfigList *parent, struct menu* menu)
+void ConfigList::updateMenuList(struct menu* menu)
 {
 	struct menu* child;
 	ConfigItem* item;
@@ -637,19 +637,19 @@ void ConfigList::updateMenuList(ConfigList *parent, struct menu* menu)
 	enum prop_type type;
 
 	if (!menu) {
-		while (parent->topLevelItemCount() > 0)
+		while (topLevelItemCount() > 0)
 		{
-			delete parent->takeTopLevelItem(0);
+			delete takeTopLevelItem(0);
 		}
 
 		return;
 	}
 
-	last = (ConfigItem*)parent->topLevelItem(0);
+	last = (ConfigItem*)topLevelItem(0);
 	if (last && !last->goParent)
 		last = 0;
 	for (child = menu->list; child; child = child->next) {
-		item = last ? last->nextSibling() : (ConfigItem*)parent->topLevelItem(0);
+		item = last ? last->nextSibling() : (ConfigItem*)topLevelItem(0);
 		type = child->prompt ? child->prompt->type : P_UNKNOWN;
 
 		switch (mode) {
@@ -670,7 +670,7 @@ void ConfigList::updateMenuList(ConfigList *parent, struct menu* menu)
 			if (!child->sym && !child->list && !child->prompt)
 				continue;
 			if (!item || item->menu != child)
-				item = new ConfigItem(parent, last, child, visible);
+				item = new ConfigItem(this, last, child, visible);
 			else
 				item->testUpdateMenu(visible);
 
@@ -683,7 +683,7 @@ void ConfigList::updateMenuList(ConfigList *parent, struct menu* menu)
 		}
 hide:
 		if (item && item->menu == child) {
-			last = (ConfigItem*)parent->topLevelItem(0);
+			last = (ConfigItem*)topLevelItem(0);
 			if (last == item)
 				last = 0;
 			else while (last->nextSibling() != item)
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 6d06ec399ff0..952bd98d7912 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -102,7 +102,7 @@ public slots:
 	bool menuSkip(struct menu *);
 
 	void updateMenuList(ConfigItem *parent, struct menu*);
-	void updateMenuList(ConfigList *parent, struct menu*);
+	void updateMenuList(struct menu *menu);
 
 	bool updateAll;
 
-- 
2.25.1

