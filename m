Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8FE20E56D
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403836AbgF2Vg5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:36:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:60646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728422AbgF2Skj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:39 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4B29233F8;
        Mon, 29 Jun 2020 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593423343;
        bh=VCjY49ferZsCCxqph3DjOC0Gs9TAo8BZtaFmbJ/4AOI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qbqYiyFNA51rrCZeB53ddQFVfqqhdwpfKQ9aC58nXmDz2JG+8nSzYVQldrwZ1vnoc
         ORLWCcUOEYpt9U1FE/jn5wkQglaMDonXe+ZzGT3gyv31zRA0VRyLbyjm7i7vdQem2F
         Ub0mVJY11igHRbWJlyr0OsYES2mSVfZ+linnK3ZQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jpqCS-006cAN-GX; Mon, 29 Jun 2020 11:35:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] kconfig: qconf: make search fully work again on split mode
Date:   Mon, 29 Jun 2020 11:35:37 +0200
Message-Id: <a7aebb6046cab082f6f0d589195ca717f8b81070.1593423060.git.mchehab+huawei@kernel.org>
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
index 67dac2406a98..85782da3e464 100644
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

