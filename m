Return-Path: <linux-kbuild+bounces-7631-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDB0AE6A26
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 137D03BB95A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB0D2D6626;
	Tue, 24 Jun 2025 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzwSxHsK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7593A2D6620;
	Tue, 24 Jun 2025 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777643; cv=none; b=fTVcJluK9R0rs4Y7CMiA+/fK3o0F65Yu5baObHnFh1a+GL8CCdTAgxuBIeisFCVAYqcP5ZMwPYbgXn0fXZ5pth5M8Kt2tyVjEKTPYlC4dPyRNgfje9pJdHX8nuNK/kCqV7b+QWqsco+Xa5ugMOUQGUoCtpgpC2xz1qpRPh+TeXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777643; c=relaxed/simple;
	bh=XsP6+V0DTewo004bods7bfikqWbO40qxSasczyigGqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgzIJFfMrPK+X6BUL1I11Lp1xE/sZuSWFb6gsHAv9Nr7n3CT0wfR0iZnFUWsxqjdBQmdW+AZiAgWxru1Xxo3V2PCO2D/D4OgiKDb4pagZiW9WTtIsv+vSjfHkF6RNUqh7ROT88l/EaY8qhAwyL9bGaLk1FsO14sTg5djl3E50yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzwSxHsK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B056CC4CEEE;
	Tue, 24 Jun 2025 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777643;
	bh=XsP6+V0DTewo004bods7bfikqWbO40qxSasczyigGqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CzwSxHsKfxVv1GRpwt/LbZ4FH0+GFEBcBMlaYL8o7RZjvMuCV1Et23nMn5pCs5l4a
	 vgaXsDObxS9Xu4Akh1izFo+4BTrS9bmd9BlSArwbmigb92fu8OTEe2L6loeMta0BDP
	 tQ7yV70V0ynlQ0FheCAGVHqPIa2uaeRMz1Xq4u0OzsU0zkx0nlVjcVsHFNcSfL64K2
	 ECPEUVbw6cwGitWgXBy7WgSsd5vf8xc/9eULC0/oYcJqzUoX8Sxw6QtrZwNIDCG0Bx
	 yJ+9ZN5jA1H+K2GgatT+mZVVFOGB/DUxowLRwwlrawuJxZaHU4mJ0zD0EzsKha+4ZC
	 1fE1l6fZCYodg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/66] kconfig: rename menu_get_parent_menu() to menu_get_menu_or_parent_menu()
Date: Wed, 25 Jun 2025 00:04:52 +0900
Message-ID: <20250624150645.1107002-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current menu_get_parent_menu() does not always return the parent
menu; if the given argument is itself a menu, it returns that menu.

Rename this function to better reflect this behavior.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c   | 2 +-
 scripts/kconfig/lkc.h    | 2 +-
 scripts/kconfig/menu.c   | 8 +++++++-
 scripts/kconfig/qconf.cc | 6 +++---
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 8abe57041955..a7b44cd8ae14 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -594,7 +594,7 @@ static void check_conf(struct menu *menu)
 		default:
 			if (!conf_cnt++)
 				printf("*\n* Restart config...\n*\n");
-			rootEntry = menu_get_parent_menu(menu);
+			rootEntry = menu_get_menu_or_parent_menu(menu);
 			conf(rootEntry);
 			break;
 		}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index fbc907f75eac..5cc85c3d4aaa 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -97,7 +97,7 @@ bool menu_is_empty(struct menu *menu);
 bool menu_is_visible(struct menu *menu);
 bool menu_has_prompt(const struct menu *menu);
 const char *menu_get_prompt(const struct menu *menu);
-struct menu *menu_get_parent_menu(struct menu *menu);
+struct menu *menu_get_menu_or_parent_menu(struct menu *menu);
 int get_jump_key_char(void);
 struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
 void menu_get_ext_help(struct menu *menu, struct gstr *help);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 7d48a692bd27..ccb690bbf05d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -575,7 +575,13 @@ const char *menu_get_prompt(const struct menu *menu)
 	return NULL;
 }
 
-struct menu *menu_get_parent_menu(struct menu *menu)
+/**
+ * menu_get_menu_or_parent_menu - return the parent menu or the menu itself
+ * @menu: pointer to the menu
+ * return: the parent menu. If the given argument is already a menu, return
+ *         itself.
+ */
+struct menu *menu_get_menu_or_parent_menu(struct menu *menu)
 {
 	enum prop_type type;
 
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 68640e507ec4..dc056b0a8fde 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -577,7 +577,7 @@ void ConfigList::setParentMenu(void)
 	oldroot = rootEntry;
 	if (rootEntry == &rootmenu)
 		return;
-	setRootMenu(menu_get_parent_menu(rootEntry->parent));
+	setRootMenu(menu_get_menu_or_parent_menu(rootEntry->parent));
 
 	QTreeWidgetItemIterator it(this);
 	while (*it) {
@@ -1540,7 +1540,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	switch (configList->mode) {
 	case singleMode:
 		list = configList;
-		parent = menu_get_parent_menu(menu);
+		parent = menu_get_menu_or_parent_menu(menu);
 		if (!parent)
 			return;
 		list->setRootMenu(parent);
@@ -1551,7 +1551,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 			configList->clearSelection();
 			list = configList;
 		} else {
-			parent = menu_get_parent_menu(menu->parent);
+			parent = menu_get_menu_or_parent_menu(menu->parent);
 			if (!parent)
 				return;
 
-- 
2.43.0


