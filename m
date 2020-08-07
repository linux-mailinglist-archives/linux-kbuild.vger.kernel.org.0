Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DEE23EA05
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgHGJTm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:19:42 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41597 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbgHGJTl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:41 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQA032147;
        Fri, 7 Aug 2020 18:19:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQA032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791963;
        bh=BVTMN4LAdRMgBfNC+zBOHVAbvF2zmdeoZJN01upM2bU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bw5R/WPbADMT1mvPdOOZ01NI4TWmg3l20wQpyxbYrJRh3Tkb1rMIfyIKxUWn2A94a
         gjumf0aNaIWdx0yPM/3hrlMzcBo1hM878nH/R1HYu+5jOEKGkftIvBI8i2B964nlpn
         ZgLugdta9kOq99dDLZ0rg8F/OPqj6MUAZ9AKsZu8RX+VHLh1L4URijftBla0tgxR7H
         ogZEdOxd+xnWaBTMDJmvtKTWliAi3GPc/Z8VSXUzrOZs7TrenGZKz2JpDIAhPgyV/9
         Eueb4qk9GvNiCF/NReU2vC1Xv5Q8N4YUcIMJgOo2qBkmO8wVduPbHogxG/06uqLFXh
         Cx9P2PfOYgEyw==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/19] kconfig: qconf: remove ConfigList::addColumn/removeColumn
Date:   Fri,  7 Aug 2020 18:19:04 +0900
Message-Id: <20200807091909.2985787-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use QTreeView::showColumn/hideColumn directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.cc | 22 +++++++++++-----------
 scripts/kconfig/qconf.h  |  8 --------
 2 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 56b5cdd8b1c9..04da1397575a 100644
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

