Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4073E23584F
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgHBQRk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:17:40 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48423 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgHBQRk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:17:40 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOac003720;
        Mon, 3 Aug 2020 01:17:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOac003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385044;
        bh=Ms1SMsEQKmMZBTX6ILMMZvwlhQrJfGkj/nzYKWYupUU=;
        h=From:To:Cc:Subject:Date:From;
        b=cz0pM2jYAUHhklEwWU1tDkhSOB9zD9qYha53HYhPqOUnaOI6CjqCcQYOLWqCloRcR
         sYay2GaNHL6m1L29pHHrXW/HqCOiXrooEFjQbyI4woXDgiCBQYa/99VMDLYNUCxQWH
         Og1Eol4BGdL0QYayG7l8gHZhPwEkj1iRX/WI+d4tex7iwACkcM+D0m9vjdW7em8cQP
         azbyrAvtmLXnTozoQJWVPLcxEa7Gcnl19CBmkYCXJMNIPlulkV7wZyaZGWzVWPU8zP
         utoibfro10iJpjn7+zxU3eNjfDeFJyW7v99WXO9tdXJu6vCT2ZIiK9wAnBIwAb1Qtr
         V9JBkrpUnI/xQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/16] kconfig: qconf: rename 'config' to 'fileMenu'
Date:   Mon,  3 Aug 2020 01:17:06 +0900
Message-Id: <20200802161721.921721-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Rename for clarification and consistency.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 23d1cb01a41a..9513c0ba8d0c 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1517,13 +1517,13 @@ ConfigMainWindow::ConfigMainWindow(void)
 	toolBar->addAction(splitViewAction);
 	toolBar->addAction(fullViewAction);
 
-	// create config menu
-	QMenu* config = menu->addMenu("&File");
-	config->addAction(loadAction);
-	config->addAction(saveAction);
-	config->addAction(saveAsAction);
-	config->addSeparator();
-	config->addAction(quitAction);
+	// create file menu
+	QMenu *fileMenu = menu->addMenu("&File");
+	fileMenu->addAction(loadAction);
+	fileMenu->addAction(saveAction);
+	fileMenu->addAction(saveAsAction);
+	fileMenu->addSeparator();
+	fileMenu->addAction(quitAction);
 
 	// create edit menu
 	QMenu* editMenu = menu->addMenu("&Edit");
-- 
2.25.1

