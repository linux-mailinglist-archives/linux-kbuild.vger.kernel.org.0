Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8EC23E9FA
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbgHGJTg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41485 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgHGJTf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:35 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQ1032147;
        Fri, 7 Aug 2020 18:19:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQ1032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791955;
        bh=JVeY+lZTgfed2xMudnwbriYDO7ghha4ZbXi0Duc0vcI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pJXmMtD924wU0Od0S0fHunemS5zFp6+ADAl9dmAkYZ0xVhCyV/PSkZVquakqWyGC3
         QUAAEdtWZgwDYsujy/O4jeicRkJM+BMExhrFVW8RUAgOHEJ+q8dW2j7vU5n+3K0Qiq
         YAXMsNfOuMnTIhmeha/cE8fRuCliQgoey/rX9bDw69syG8NdC83982A7CareN9KZIS
         /7PeeuPNqv57sHSMgN+J0H1I08C7pLXgJz97wvLgWbeQWYFNndlWFKnVksScy/GFKV
         wcAvr/t4JbiWQK97u2YvLt8DMLZfk9X0UDHFY7ognQutHY5c6tFGvRwhAxym5PiWs7
         pSVu9C1ylc5ew==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/19] kconfig: qconf: overload addToolBar() to create and insert toolbar
Date:   Fri,  7 Aug 2020 18:18:55 +0900
Message-Id: <20200807091909.2985787-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use the overloaded function, addToolBar(const QString &title)
to create a QToolBar object, setting its window title, and inserts
it into the toolbar area.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.cc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index b4f32199e0df..0385804cfd08 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1431,9 +1431,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 	setTabOrder(configList, helpText);
 	configList->setFocus();
 
-	QToolBar *toolBar = new QToolBar("Tools", this);
-	addToolBar(toolBar);
-
 	backAction = new QAction(QPixmap(xpm_back), "Back", this);
 	connect(backAction, SIGNAL(triggered(bool)), SLOT(goBack()));
 
@@ -1506,6 +1503,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	  connect(showAboutAction, SIGNAL(triggered(bool)), SLOT(showAbout()));
 
 	// init tool bar
+	QToolBar *toolBar = addToolBar("Tools");
 	toolBar->addAction(backAction);
 	toolBar->addSeparator();
 	toolBar->addAction(loadAction);
-- 
2.25.1

