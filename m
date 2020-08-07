Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5442D23EA20
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728291AbgHGJUv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:20:51 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:42284 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728233AbgHGJUH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:20:07 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQE032147;
        Fri, 7 Aug 2020 18:19:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQE032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791965;
        bh=CHGYyKC6ZwhAz/bcMeo5wBWhWaERIRrhB+YayXBw4hI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n2fdm4SUDFq97F7DLvTR/XgQoWX2yAQgDfA47hg4gkV2eDQtS9mMrNpO7BIfX0scK
         Zm+0/SAZ6T/076XK3sQhNZgbSula/eMAEMOOUB0BMwETFNcFWqbUw9BCalmBCOJjwH
         hvyTkJJZBO3gnBrRI6N1ZcuqJI5G55nHj9P+VSBeCjK+XOSn6JXFcILW0yeATV3SFb
         PIcpOfwzZq60WZEHDJ5B+AuqoIZLVM7hqxIjF02gmUaw+vUo5eysJe76YmOAZGL8lj
         weJPo6afGzmDRqcdeg3Z1ReWFEi0u5FR/mDFjatThEKXuUMj39T3oW8egTYesgdkTS
         KvzKfBgLSBAxQ==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/19] kconfig: qconf: do not limit the pop-up menu to the first row
Date:   Fri,  7 Aug 2020 18:19:08 +0900
Message-Id: <20200807091909.2985787-18-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If you right-click the first row in the option tree, the pop-up menu
shows up, but if you right-click the second row or below, the event
is ignored due to the following check:

  if (e->y() <= header()->geometry().bottom()) {

Perhaps, the intention was to show the pop-menu only when the tree
header was right-clicked, but this handler is not called in that case.

Since the origin of e->y() starts from the bottom of the header,
this check is odd.

Going forward, you can right-click anywhere in the tree to get the
pop-up menu.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
 - new patch

 scripts/kconfig/qconf.cc | 68 ++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 19f7764c1d68..8eacebfeb030 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -863,40 +863,40 @@ void ConfigList::focusInEvent(QFocusEvent *e)
 
 void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 {
-	if (e->y() <= header()->geometry().bottom()) {
-		if (!headerPopup) {
-			QAction *action;
-
-			headerPopup = new QMenu(this);
-			action = new QAction("Show Name", this);
-			  action->setCheckable(true);
-			  connect(action, SIGNAL(toggled(bool)),
-				  parent(), SLOT(setShowName(bool)));
-			  connect(parent(), SIGNAL(showNameChanged(bool)),
-				  action, SLOT(setOn(bool)));
-			  action->setChecked(showName);
-			  headerPopup->addAction(action);
-			action = new QAction("Show Range", this);
-			  action->setCheckable(true);
-			  connect(action, SIGNAL(toggled(bool)),
-				  parent(), SLOT(setShowRange(bool)));
-			  connect(parent(), SIGNAL(showRangeChanged(bool)),
-				  action, SLOT(setOn(bool)));
-			  action->setChecked(showRange);
-			  headerPopup->addAction(action);
-			action = new QAction("Show Data", this);
-			  action->setCheckable(true);
-			  connect(action, SIGNAL(toggled(bool)),
-				  parent(), SLOT(setShowData(bool)));
-			  connect(parent(), SIGNAL(showDataChanged(bool)),
-				  action, SLOT(setOn(bool)));
-			  action->setChecked(showData);
-			  headerPopup->addAction(action);
-		}
-		headerPopup->exec(e->globalPos());
-		e->accept();
-	} else
-		e->ignore();
+	if (!headerPopup) {
+		QAction *action;
+
+		headerPopup = new QMenu(this);
+		action = new QAction("Show Name", this);
+		action->setCheckable(true);
+		connect(action, SIGNAL(toggled(bool)),
+			parent(), SLOT(setShowName(bool)));
+		connect(parent(), SIGNAL(showNameChanged(bool)),
+			action, SLOT(setOn(bool)));
+		action->setChecked(showName);
+		headerPopup->addAction(action);
+
+		action = new QAction("Show Range", this);
+		action->setCheckable(true);
+		connect(action, SIGNAL(toggled(bool)),
+			parent(), SLOT(setShowRange(bool)));
+		connect(parent(), SIGNAL(showRangeChanged(bool)),
+			action, SLOT(setOn(bool)));
+		action->setChecked(showRange);
+		headerPopup->addAction(action);
+
+		action = new QAction("Show Data", this);
+		action->setCheckable(true);
+		connect(action, SIGNAL(toggled(bool)),
+			parent(), SLOT(setShowData(bool)));
+		connect(parent(), SIGNAL(showDataChanged(bool)),
+			action, SLOT(setOn(bool)));
+		action->setChecked(showData);
+		headerPopup->addAction(action);
+	}
+
+	headerPopup->exec(e->globalPos());
+	e->accept();
 }
 
 ConfigView*ConfigView::viewList;
-- 
2.25.1

