Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D6E23E9FE
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgHGJTi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:19:38 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41481 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgHGJTg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBPx032147;
        Fri, 7 Aug 2020 18:19:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBPx032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791953;
        bh=l6uF0cV4W2EhnygKik53RY21xJuQdqw7BWYuhjEKF/A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P+RqlobI6lW91VFUhdS9vUc2cI+Nk7wwJOcrJfh8P0XLiUlTXySwBZLxfi0RCfAyr
         l2dziH41osxyOkEpjsXgoYBTLB+0ctmHRSvThYmlCDLxQhj/QaZji+nEepboDgMwEn
         Wyoh2V/J/HGSG8cWNoy7V8y5GOJEjE69f2GBxS0w5QQFEdpQOI1RZcvprvOpJojFmX
         QLi0qWDjwX7FQlVJbK+t+QG2LIYyAWeCfeRF8f5YRH74obSa6FQQyATUbTHGnTR7r7
         HfNstP99E6XfvWHK9GAf2Gg2ofgEv2WgkoILZZ9srsGlMe5WG5RMsNPDzetAtBTPRM
         cpoEBTf6BvmuA==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/19] kconfig: qconf: use 'menu' variable for (QMenu *)
Date:   Fri,  7 Aug 2020 18:18:53 +0900
Message-Id: <20200807091909.2985787-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The variable 'config' for the file menu is inconsistent.

You do not need to use different variables. Use 'menu' for every menu.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 scripts/kconfig/qconf.cc | 41 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index aa2792f4ac46..2f7c13a758b6 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1515,33 +1515,32 @@ ConfigMainWindow::ConfigMainWindow(void)
 	toolBar->addAction(splitViewAction);
 	toolBar->addAction(fullViewAction);
 
-	// create config menu
-	QMenu* config = menuBar()->addMenu("&File");
-	config->addAction(loadAction);
-	config->addAction(saveAction);
-	config->addAction(saveAsAction);
-	config->addSeparator();
-	config->addAction(quitAction);
+	// create file menu
+	QMenu *menu = menuBar()->addMenu("&File");
+	menu->addAction(loadAction);
+	menu->addAction(saveAction);
+	menu->addAction(saveAsAction);
+	menu->addSeparator();
+	menu->addAction(quitAction);
 
 	// create edit menu
-	QMenu* editMenu = menuBar()->addMenu("&Edit");
-	editMenu->addAction(searchAction);
+	menu = menuBar()->addMenu("&Edit");
+	menu->addAction(searchAction);
 
 	// create options menu
-	QMenu* optionMenu = menuBar()->addMenu("&Option");
-	optionMenu->addAction(showNameAction);
-
-	optionMenu->addAction(showRangeAction);
-	optionMenu->addAction(showDataAction);
-	optionMenu->addSeparator();
-	optionMenu->addActions(optGroup->actions());
-	optionMenu->addSeparator();
-	optionMenu->addAction(showDebugAction);
+	menu = menuBar()->addMenu("&Option");
+	menu->addAction(showNameAction);
+	menu->addAction(showRangeAction);
+	menu->addAction(showDataAction);
+	menu->addSeparator();
+	menu->addActions(optGroup->actions());
+	menu->addSeparator();
+	menu->addAction(showDebugAction);
 
 	// create help menu
-	QMenu* helpMenu = menuBar()->addMenu("&Help");
-	helpMenu->addAction(showIntroAction);
-	helpMenu->addAction(showAboutAction);
+	menu = menuBar()->addMenu("&Help");
+	menu->addAction(showIntroAction);
+	menu->addAction(showAboutAction);
 
 	connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
 		 helpText, SLOT (clicked (const QUrl &)) );
-- 
2.25.1

