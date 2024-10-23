Return-Path: <linux-kbuild+bounces-4290-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4899AD3DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B574428473F
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4751E6DFE;
	Wed, 23 Oct 2024 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0oEtqX5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451211E5704;
	Wed, 23 Oct 2024 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707515; cv=none; b=hZcKzxzMi+idGLGaekFU8txT7iviZPoZmbzR3KHYoPUQ5UZXvKzbNXMxr3PaxaVoZNrlkt48WNUh1kBhi4ncAJZLN1zxeAgI+f+ZXVhJ6uu1u49cH4sMCTXWgy1m7QlYNeXQp4lEaFaG1Ee6iaKzIQc3iarJJaklGzGfwrPlPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707515; c=relaxed/simple;
	bh=A1r7zP0PIncfUZS87tTmj6EBYB7OCJiCmMceL7+bLy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Euz8l7j1V5GkAbvBAVlKw8cgKyfoag9Dnbwp3BG+gEskI5sjm3Bxa/Si8hFpyqNAwGo/iRIReF7BeCpo2Ztm8nuy/i9cGkJ6ZF3Kr4QnmJ/VU2pP9/TPwUV/TbCwF60xh4ehPxTyrgB79QQCxMnM06ucgZl0r+pyWg1c1NTQOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0oEtqX5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F24C4CEC7;
	Wed, 23 Oct 2024 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707514;
	bh=A1r7zP0PIncfUZS87tTmj6EBYB7OCJiCmMceL7+bLy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h0oEtqX58sAs99904//ZkZxCC/Llc65kbhdZ89Bds1W8EgAdRB5jMyFOSYJ00/tdM
	 KggFiuzQ7jFeuvzho7ekJMHI6AjOKXTOHnzRIu3WPdJWKWubbmDOx8D8l06BK4njbd
	 U6NM4MVUERw8cCq+9hbcTS7tJCEYU8B1jZ9bLkW/2fm1tqq7+4TDo5ukdnP/S5WmCf
	 StmJ2mhtBjiKh1RdkkMw25K1uEVwHvIKmgRnhJrdjZUxPEImilydcfO3Wi1wbFrJNo
	 PFnL5too5w7XAef+vcZWVUXwMCVxv82+v7TnTj15K82FaCbt/BK1yt/vlGmlovmBga
	 CyhlVsIhLjCug==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] kconfig: qconf: remove ConfigItem::visible member
Date: Thu, 24 Oct 2024 03:17:57 +0900
Message-ID: <20241023181823.138524-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The " (NEW)" string should be displayed regardless of the visibility
of the associated menu.

The ConfigItem::visible member is not used for any other purpose.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 28 +++++++++++-----------------
 scripts/kconfig/qconf.h  | 15 +++++++--------
 2 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 7c844c4a119e..5b1237bf085a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -175,17 +175,16 @@ void ConfigItem::updateMenu(void)
 		setText(dataColIdx, sym_get_string_value(sym));
 		break;
 	}
-	if (!sym_has_value(sym) && visible)
+	if (!sym_has_value(sym))
 		prompt += " (NEW)";
 set_prompt:
 	setText(promptColIdx, prompt);
 }
 
-void ConfigItem::testUpdateMenu(bool v)
+void ConfigItem::testUpdateMenu(void)
 {
 	ConfigItem* i;
 
-	visible = v;
 	if (!menu)
 		return;
 
@@ -429,7 +428,7 @@ void ConfigList::updateList()
 			item = (ConfigItem*)(*it);
 			if (!item->menu)
 				continue;
-			item->testUpdateMenu(menu_is_visible(item->menu));
+			item->testUpdateMenu();
 
 			++it;
 		}
@@ -439,16 +438,16 @@ void ConfigList::updateList()
 	if (rootEntry != &rootmenu && mode == singleMode) {
 		item = (ConfigItem *)topLevelItem(0);
 		if (!item)
-			item = new ConfigItem(this, 0, true);
+			item = new ConfigItem(this, 0);
 		last = item;
 	}
 	if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
 	    rootEntry->sym && rootEntry->prompt) {
 		item = last ? last->nextSibling() : nullptr;
 		if (!item)
-			item = new ConfigItem(this, last, rootEntry, true);
+			item = new ConfigItem(this, last, rootEntry);
 		else
-			item->testUpdateMenu(true);
+			item->testUpdateMenu();
 
 		updateMenuList(item, rootEntry);
 		update();
@@ -597,7 +596,6 @@ void ConfigList::updateMenuList(ConfigItem *parent, struct menu* menu)
 	struct menu* child;
 	ConfigItem* item;
 	ConfigItem* last;
-	bool visible;
 	enum prop_type type;
 
 	if (!menu) {
@@ -629,14 +627,13 @@ void ConfigList::updateMenuList(ConfigItem *parent, struct menu* menu)
 			break;
 		}
 
-		visible = menu_is_visible(child);
 		if (!menuSkip(child)) {
 			if (!child->sym && !child->list && !child->prompt)
 				continue;
 			if (!item || item->menu != child)
-				item = new ConfigItem(parent, last, child, visible);
+				item = new ConfigItem(parent, last, child);
 			else
-				item->testUpdateMenu(visible);
+				item->testUpdateMenu();
 
 			if (mode == fullMode || mode == menuMode || type != P_MENU)
 				updateMenuList(item, child);
@@ -662,7 +659,6 @@ void ConfigList::updateMenuList(struct menu *menu)
 	struct menu* child;
 	ConfigItem* item;
 	ConfigItem* last;
-	bool visible;
 	enum prop_type type;
 
 	if (!menu) {
@@ -694,14 +690,13 @@ void ConfigList::updateMenuList(struct menu *menu)
 			break;
 		}
 
-		visible = menu_is_visible(child);
 		if (!menuSkip(child)) {
 			if (!child->sym && !child->list && !child->prompt)
 				continue;
 			if (!item || item->menu != child)
-				item = new ConfigItem(this, last, child, visible);
+				item = new ConfigItem(this, last, child);
 			else
-				item->testUpdateMenu(visible);
+				item->testUpdateMenu();
 
 			if (mode == fullMode || mode == menuMode || type != P_MENU)
 				updateMenuList(item, child);
@@ -1274,8 +1269,7 @@ void ConfigSearchWindow::search(void)
 		return;
 	for (p = result; *p; p++) {
 		for_all_prompts((*p), prop)
-			lastItem = new ConfigItem(list, lastItem, prop->menu,
-						  menu_is_visible(prop->menu));
+			lastItem = new ConfigItem(list, lastItem, prop->menu);
 	}
 }
 
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 0b62fb26821a..62ab3286d04f 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -114,25 +114,25 @@ public slots:
 class ConfigItem : public QTreeWidgetItem {
 	typedef class QTreeWidgetItem Parent;
 public:
-	ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m, bool v)
-	: Parent(parent, after), nextItem(0), menu(m), visible(v), goParent(false)
+	ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m)
+	: Parent(parent, after), nextItem(0), menu(m), goParent(false)
 	{
 		init();
 	}
-	ConfigItem(ConfigItem *parent, ConfigItem *after, struct menu *m, bool v)
-	: Parent(parent, after), nextItem(0), menu(m), visible(v), goParent(false)
+	ConfigItem(ConfigItem *parent, ConfigItem *after, struct menu *m)
+	: Parent(parent, after), nextItem(0), menu(m), goParent(false)
 	{
 		init();
 	}
-	ConfigItem(ConfigList *parent, ConfigItem *after, bool v)
-	: Parent(parent, after), nextItem(0), menu(0), visible(v), goParent(true)
+	ConfigItem(ConfigList *parent, ConfigItem *after)
+	: Parent(parent, after), nextItem(0), menu(0), goParent(true)
 	{
 		init();
 	}
 	~ConfigItem(void);
 	void init(void);
 	void updateMenu(void);
-	void testUpdateMenu(bool v);
+	void testUpdateMenu(void);
 	ConfigList* listView() const
 	{
 		return (ConfigList*)Parent::treeWidget();
@@ -159,7 +159,6 @@ class ConfigItem : public QTreeWidgetItem {
 
 	ConfigItem* nextItem;
 	struct menu *menu;
-	bool visible;
 	bool goParent;
 
 	static QIcon symbolYesIcon, symbolModIcon, symbolNoIcon;
-- 
2.43.0


