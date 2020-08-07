Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0859823EA29
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgHGJVE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:21:04 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41478 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727838AbgHGJTg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBPw032147;
        Fri, 7 Aug 2020 18:19:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBPw032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791952;
        bh=ejkNoCkwee2SrbatlcPdlyRlA7xLolSLizTlHDa1NkE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZmW2SF02W+2wAfduGqEZ6gr9OT+2REIejZ3yr5H8yP74FUjnP7UvmoA7XX/CWrTnp
         hk0Rgp0nZNj4Pky6Bx1ltT0NNMko46bYaVuoI2nstfpv4rLvAPL1aNeOukozRmI01y
         kuZtl25L9jjX5R5uJB0v8bwbRn5QpwmoCOQUn//4i5Jckjn3wvNGmL2MWBBrGFAcIY
         5YEmYRAoaJmxXVQ6C+KTHyLeyU/yy0VMNzVUueHAzVNUt4hLbBDIlfY9jMuE5UXJDB
         zR7rBtzcsVR92TqAJY0QMaAgFrWcexKPa7GSJtOp1JlCxbXmjoCqMZzs6ksaWOdSXQ
         YXY6PWIWtXJGw==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/19] kconfig: qconf: do not use 'menu' variable for (QMenuBar *)
Date:   Fri,  7 Aug 2020 18:18:52 +0900
Message-Id: <20200807091909.2985787-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think it is a bit confusing to use 'menu' to hold a QMenuBar pointer.
I want to use 'menu' for a QMenu pointer.

You do not need to use a local variable here. Use menuBar() directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - change subject

 scripts/kconfig/qconf.cc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 55023a9e8315..aa2792f4ac46 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1381,7 +1381,6 @@ void ConfigSearchWindow::search(void)
 ConfigMainWindow::ConfigMainWindow(void)
 	: searchWindow(0)
 {
-	QMenuBar* menu;
 	bool ok = true;
 	QVariant x, y;
 	int width, height;
@@ -1432,7 +1431,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 	setTabOrder(configList, helpText);
 	configList->setFocus();
 
-	menu = menuBar();
 	toolBar = new QToolBar("Tools", this);
 	addToolBar(toolBar);
 
@@ -1518,7 +1516,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	toolBar->addAction(fullViewAction);
 
 	// create config menu
-	QMenu* config = menu->addMenu("&File");
+	QMenu* config = menuBar()->addMenu("&File");
 	config->addAction(loadAction);
 	config->addAction(saveAction);
 	config->addAction(saveAsAction);
@@ -1526,12 +1524,13 @@ ConfigMainWindow::ConfigMainWindow(void)
 	config->addAction(quitAction);
 
 	// create edit menu
-	QMenu* editMenu = menu->addMenu("&Edit");
+	QMenu* editMenu = menuBar()->addMenu("&Edit");
 	editMenu->addAction(searchAction);
 
 	// create options menu
-	QMenu* optionMenu = menu->addMenu("&Option");
+	QMenu* optionMenu = menuBar()->addMenu("&Option");
 	optionMenu->addAction(showNameAction);
+
 	optionMenu->addAction(showRangeAction);
 	optionMenu->addAction(showDataAction);
 	optionMenu->addSeparator();
@@ -1540,7 +1539,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	optionMenu->addAction(showDebugAction);
 
 	// create help menu
-	QMenu* helpMenu = menu->addMenu("&Help");
+	QMenu* helpMenu = menuBar()->addMenu("&Help");
 	helpMenu->addAction(showIntroAction);
 	helpMenu->addAction(showAboutAction);
 
-- 
2.25.1

