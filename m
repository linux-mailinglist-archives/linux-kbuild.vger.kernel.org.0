Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614FF235855
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbgHBQSH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:07 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48899 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOaf003720;
        Mon, 3 Aug 2020 01:17:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOaf003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385046;
        bh=D8cZPxfdH13g2h9tnQXi8Kk8vvwyegez8SFX7ls7ooI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uhDKkX+Qe22HvK1zSfyc5sXaDAxitXSDo6rMErpg8nuNbeuXpz0xdZcxeW7xClOg0
         e+tSF+RXmTIL01Omyy718zOM8pqMEVPzJJPUAULoxPmCp4OJww/SvsqD+ALkS8Mxiy
         8G1xXZKYdMI/iYbR/u+yMIGAA5d6EOvBoqdhqpG53zLjdkILYmt3C2sqG7EP0AVrcM
         SNz5/2yOREcEhZRyzw7p3PL/aHFXSHTiXwpsyhs3toJ/VZYDToqXZWdXAo2E4bDGu8
         P92ZPtytH8HGpjP1W9Jh6OlFjqsPeCRFM/IoRLVU2C2Gy/Q/KkUR/qohzAKhyw1Swr
         skc40P15Y1pPg==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] kconfig: qconf: overload addToolBar() to create and insert toolbar
Date:   Mon,  3 Aug 2020 01:17:09 +0900
Message-Id: <20200802161721.921721-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
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

 scripts/kconfig/qconf.cc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 4eb846c90b1d..e17c46bb75e8 100644
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

