Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77985235860
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgHBQSY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:24 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48914 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726975AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOao003720;
        Mon, 3 Aug 2020 01:17:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOao003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385051;
        bh=Ap0/SOrgdWrc0cVJydhT7UgXLUOg9wnxtYtpXHl1wxk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ErjTkBoCwmdQBnWeoRACFUI24TEztcZBpB+2fzVuWRdLFRKI4tYBpC+njeHV8dwJd
         CxKado7L0HUYttuTxialguev6O9VOHKNyVQEMW0seDSZcKKflfuulNTCWQKUgNv6Pq
         e5M20pvuz6+SJ/aluZlYsbWHd7Hum97jc+0jMcfgBSHWV9kfVKVG1m10FFWZCfITaX
         mddplkpf5grOSpdkKyaeudDgzVDFlWvE28bseESupfLsMwVSBXidEFou46Or3+mLI4
         gtoa6MlAavZ4L1aBdQOWNGo7u7WSEr+7HiBszXF3pVU7OL/gih5geT4RsiOcDh9G3q
         OvhL3lRdc3/qQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] kconfig: qconf: remove ConfigList::addColumn/removeColumn
Date:   Mon,  3 Aug 2020 01:17:18 +0900
Message-Id: <20200802161721.921721-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use QTreeView::showColumn/hideColumn directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 22 +++++++++++-----------
 scripts/kconfig/qconf.h  |  8 --------
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 94ffb64d3eca..a73665d9ca78 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -317,7 +317,7 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 	}
 
-	addColumn(promptColIdx);
+	showColumn(promptColIdx);
 
 	reinit();
 }
@@ -335,21 +335,21 @@ bool ConfigList::menuSkip(struct menu *menu)
 
 void ConfigList::reinit(void)
 {
-	removeColumn(dataColIdx);
-	removeColumn(yesColIdx);
-	removeColumn(modColIdx);
-	removeColumn(noColIdx);
-	removeColumn(nameColIdx);
+	hideColumn(dataColIdx);
+	hideColumn(yesColIdx);
+	hideColumn(modColIdx);
+	hideColumn(noColIdx);
+	hideColumn(nameColIdx);
 
 	if (showName)
-		addColumn(nameColIdx);
+		showColumn(nameColIdx);
 	if (showRange) {
-		addColumn(noColIdx);
-		addColumn(modColIdx);
-		addColumn(yesColIdx);
+		showColumn(noColIdx);
+		showColumn(modColIdx);
+		showColumn(yesColIdx);
 	}
 	if (showData)
-		addColumn(dataColIdx);
+		showColumn(dataColIdx);
 
 	updateListAll();
 }
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 5cda89a51740..daa180bdb9b4 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -88,14 +88,6 @@ public slots:
 		updateList();
 		updateAll = false;
 	}
-	void addColumn(colIdx idx)
-	{
-		showColumn(idx);
-	}
-	void removeColumn(colIdx idx)
-	{
-		hideColumn(idx);
-	}
 	void setAllOpen(bool open);
 	void setParentMenu(void);
 
-- 
2.25.1

