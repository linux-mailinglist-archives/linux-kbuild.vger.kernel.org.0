Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E8B19BE94
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 11:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387858AbgDBJ2K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 05:28:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387734AbgDBJ2J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:09 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC66B2080C;
        Thu,  2 Apr 2020 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585819688;
        bh=arJuEu1VaCuRLLMtEVLbOj/nXcpJ/nIL0njuJu/AVCc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Js3TaHpbnk17qr53i8vzInaYB0+ldzlG0BFyxz8OL8ROt+5tUx3meQW6VGgLOFN3m
         Rj2ILK0L7r/1gZ9c5ewaQtH3bYB15D85m3rLnbyT5rdFoNNT1yo162mMvwz41DHlWl
         mPh35GJcX/v8DK/wwuL6mNkKrObpzNFleWfuAKKM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJw8s-000AaU-6S; Thu, 02 Apr 2020 11:28:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 6/6] kconfig: qconf: Fix a few alignment issues
Date:   Thu,  2 Apr 2020 11:28:03 +0200
Message-Id: <e1d57b9e1dca8680b32744920642ab27aec14ad7.1585819250.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585819250.git.mchehab+huawei@kernel.org>
References: <cover.1585819250.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There are a few items with wrong alignments. Solve them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index f3eaeb2b70da..84976b9d2174 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -635,7 +635,7 @@ void ConfigList::updateMenuList(ConfigItem *parent, struct menu* menu)
 			last = item;
 			continue;
 		}
-	hide:
+hide:
 		if (item && item->menu == child) {
 			last = parent->firstChild();
 			if (last == item)
@@ -700,7 +700,7 @@ void ConfigList::updateMenuList(ConfigList *parent, struct menu* menu)
 			last = item;
 			continue;
 		}
-	hide:
+hide:
 		if (item && item->menu == child) {
 			last = (ConfigItem*)parent->topLevelItem(0);
 			if (last == item)
@@ -1239,10 +1239,11 @@ QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
 {
 	QMenu* popup = Parent::createStandardContextMenu(pos);
 	QAction* action = new QAction("Show Debug Info", popup);
-	  action->setCheckable(true);
-	  connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
-	  connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setOn(bool)));
-	  action->setChecked(showDebug());
+
+	action->setCheckable(true);
+	connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
+	connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setOn(bool)));
+	action->setChecked(showDebug());
 	popup->addSeparator();
 	popup->addAction(action);
 	return popup;
-- 
2.25.1

