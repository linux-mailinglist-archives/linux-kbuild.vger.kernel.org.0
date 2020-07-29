Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972532323A6
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 19:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgG2Rqn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 13:46:43 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:32170 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgG2Rqn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 13:46:43 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 06THkLYL020666;
        Thu, 30 Jul 2020 02:46:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 06THkLYL020666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596044781;
        bh=80NhEGhFnmq+LfOA+LEcAhYXbr9MxvJGqlh6jZrySBk=;
        h=From:To:Cc:Subject:Date:From;
        b=Yu+P3IsdxyXhfbKXHNFyUz3t3xywcMI5rvCA4aI0RoxoeFRMF9nRec3Hk6IDZo7p6
         iYzc1twLphxG9fEL4CLi01f3cx0mGLlKY1VyZWJkYGPBgCo5LG/ayrQsS9W3+NOBJr
         i1TaHSC0fDlfTgJfwYfPnCzK0mShf1W+xfqV3l9I4XzqJKF4mbd2Op51AnkFk1cXjY
         dIe9cmQ1by5PS3TrbdvvpduAM36p/ZaJhL24HSEb8uzE/n8eCz0tm6ydwi67YiYxpR
         2J5s6Rp8kgkBMai7KEzjyFd50cJgDlRtrv5+9HM2AvWZvPpo3FzQtETipX6zwXgb/X
         tsRgZOjbSCOBA==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "kconfig: qconf: Change title for the item window"
Date:   Thu, 30 Jul 2020 02:46:17 +0900
Message-Id: <20200729174617.169319-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 5752ff07fd90d764d96e3c586cc95c09598abfdd.

It added pointless dead code to ConfigList:ConfigList().

The constructor of ConfigList has the initializer, mode(singleMode).

    if (mode == symbolMode)
           setHeaderLabels(QStringList() << "Item" << "Name" << "N" << "M" << "Y" << "Value");
    else
           setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");

... always takes the else part.

The change to ConfigList::updateSelection() is strange too.
When you click the split view icon for the first time, the titles in
both windows show "Option". After you click something in the right
window, the title suddenly changes to "Item".

ConfigList::updateSelection() is not the right place to do this,
at least. It was not a good idea, I think.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 1c61c768b99e..dfd0b5863a9b 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -308,10 +308,7 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	setVerticalScrollMode(ScrollPerPixel);
 	setHorizontalScrollMode(ScrollPerPixel);
 
-	if (mode == symbolMode)
-		setHeaderLabels(QStringList() << "Item" << "Name" << "N" << "M" << "Y" << "Value");
-	else
-		setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
+	setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
 
 	connect(this, SIGNAL(itemSelectionChanged(void)),
 		SLOT(updateSelection(void)));
@@ -392,11 +389,6 @@ void ConfigList::updateSelection(void)
 	struct menu *menu;
 	enum prop_type type;
 
-	if (mode == symbolMode)
-		setHeaderLabels(QStringList() << "Item" << "Name" << "N" << "M" << "Y" << "Value");
-	else
-		setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
-
 	if (selectedItems().count() == 0)
 		return;
 
-- 
2.25.1

