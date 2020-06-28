Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0131720C7C9
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 14:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgF1MFB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 08:05:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:45434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726243AbgF1MFB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 08:05:01 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E464C2076E;
        Sun, 28 Jun 2020 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593345901;
        bh=eaDjc9XDnzcYv1o13R7slCS+uNfd015+MUC7D5f1QOo=;
        h=From:To:Cc:Subject:Date:From;
        b=DTwrA34tymYz5kYhRJOtfRrjzAK8XKlcICw/BXkHoPt9pT1htV65nOuQIHI6Zn1rz
         Q+07pcJF3SX4Cuw0GaxrWV68P4fl64GqdRTUdnjdRPO7YIqAeUxyMY6eaFp83/lqZv
         3nsz2THWUkamBXsDnv0gNr7AZmGraiT0VnF48pLQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jpW3O-004gV7-Pi; Sun, 28 Jun 2020 14:04:58 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH] kconfig: qconf: Fix find on split mode
Date:   Sun, 28 Jun 2020 14:04:53 +0200
Message-Id: <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593345886.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The logic handling find on split mode is currently broken.
Fix it, making it work again as expected.

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c0ac8f7b5f1a..b8f577c6e8aa 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1645,22 +1645,21 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
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
+			configList->setRootMenu(menu);
+			configList->clearSelection();
+
 			parent = menu_get_parent_menu(menu->parent);
 			if (!parent)
 				return;
-			item = menuList->findConfigItem(parent);
-			if (item) {
-				item->setSelected(true);
-				menuList->scrollToItem(item);
-			}
-			list->setRootMenu(parent);
+			menuList->setRootMenu(parent);
+
+			list = menuList;
 		}
 		break;
 	case fullMode:
-- 
2.26.2

