Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7953C20EE59
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730183AbgF3G1Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:27:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730015AbgF3G0q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:26:46 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A59D520768;
        Tue, 30 Jun 2020 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593498405;
        bh=eCfi2orVb6Q/mnzdtfC6fPJiHcL9lh7S6Q9cS68MP0g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ClcoMkx+mf41VFcHVwzR5QPKHymZZSmowiel3g5fCTakMPJMmg061uo/nilB5epd4
         kNlFDAGtN8BZiQ5H2TUJswt6r8NaR3g7a2WECC2kzUTEc0v38zUO36l1xIGj99MN4n
         gaU9ml5UTRTQsoIk6bzoBDOR7ND518j1W5Yo6fdE=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jq9j9-008Wat-PP; Tue, 30 Jun 2020 08:26:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] kconfig: qconf: make search fully work again on split mode
Date:   Tue, 30 Jun 2020 08:26:36 +0200
Message-Id: <7febfd14786f364acb6351ab07f6ce6434475b31.1593498345.git.mchehab+huawei@kernel.org>
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

When the search dialog box finds symbols/menus that match
the search criteria, it presents all results at the window.

Clicking on a search result should make qconf to navigate
to the selected item. This works on singleMode and on
fullMode, but on splitMode, the navigation is broken.

This was partially caused by an incomplete Qt5 conversion
and by the followup patches that restored the original
behavior.

When qconf is on split mode, it has to update both the
config and the menu views. Right now, such logic is broken,
as it is not seeking using the right structures.

On qconf, the screen is split into 3 parts:

	+------------+-------+
	|            |       |
	|   Config   | Menu  |
	|            |       |
	+------------+-------+
	|                    |
	|     ConfigInfo     |
	|                    |
	+--------------------+

On singleMode and on fullMode, the menuView is hidden, and search
updates only the configList (which controls the ConfigView).

On SplitMode, the search logic should detect if the variable is a
leaf or not. If it is a leaf, it should be presented at the menuView,
and both configList and menuList should be updated. Otherwise, just
the configList should be updated.

Link: https://lore.kernel.org/lkml/a98b0f0ebe0c23615a76f1d23f25fd0c84835e6b.camel@redhat.com/
Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 0e06afa08908..9def59423743 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1636,22 +1636,33 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 			return;
 		list->setRootMenu(parent);
 		break;
-	case symbolMode:
+	case menuMode:
 		if (menu->flags & MENU_ROOT) {
-			configList->setRootMenu(menu);
+			menuList->setRootMenu(menu);
 			configList->clearSelection();
-			list = menuList;
-		} else {
 			list = configList;
+		} else {
 			parent = menu_get_parent_menu(menu->parent);
 			if (!parent)
 				return;
-			item = menuList->findConfigItem(parent);
+
+			/* Clear an already-selected item */
+			if (!configList->selectedItems().isEmpty()) {
+				item = (ConfigItem*)configList->selectedItems().first();
+				if (item)
+					item->setSelected(false);
+			}
+
+			/* Select the config view */
+			item = configList->findConfigItem(parent);
 			if (item) {
 				item->setSelected(true);
-				menuList->scrollToItem(item);
+				configList->scrollToItem(item);
 			}
-			list->setRootMenu(parent);
+
+			menuList->setRootMenu(parent);
+			menuList->clearSelection();
+			list = menuList;
 		}
 		break;
 	case fullMode:
-- 
2.26.2

