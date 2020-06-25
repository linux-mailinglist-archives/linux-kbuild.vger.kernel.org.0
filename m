Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5154420A14A
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 16:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405605AbgFYOxE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 10:53:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:48900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405604AbgFYOxE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 10:53:04 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B06920775;
        Thu, 25 Jun 2020 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593096783;
        bh=eaDjc9XDnzcYv1o13R7slCS+uNfd015+MUC7D5f1QOo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y1Kfdf2LQ19taDhC1+x6HKaABLQAQNscrO8uYDA6BxzFhhLxKBckiI75NRGWnWQz7
         kcTyRdj92kLDbMBnpJSufvmxVRvN2loInUXJ9Y9C/B3XB4AMRenDQ5IMp1Ab5HOrt5
         PwisR1a3WK8mh7E6Vcec8qn5uDwYIDsXKnkwK+Dc=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1joTFN-00DakR-6p; Thu, 25 Jun 2020 16:53:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH] kconfig: qconf: Fix find on split mode
Date:   Thu, 25 Jun 2020 16:52:56 +0200
Message-Id: <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200625154226.25692cd1@coco.lan>
References: <20200625154226.25692cd1@coco.lan>
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


