Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB3E519BE9D
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 11:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387736AbgDBJ2Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 05:28:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:49244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387723AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCC6E207FF;
        Thu,  2 Apr 2020 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585819688;
        bh=GxD2mP2VPelWfZbCtWzT8FlS64HgoRgkaYW8jMe+pTM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QLC3SaPDWXGYceTPisq3HpJrpQw6Ks98LM3ZbWZYFtsLToL0c2fk7FuDEPGzZy/gT
         8DOYh9nmoe8ywSUOwh/IY5wK6/kpx02gdAnTjpt0VRayhFPQKlP/tQu3M3EjaDub0p
         jqUpVXyFAVZC3rMzBtkXC3k+s7DgcoQTJXSLbjOM=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJw8s-000AaF-3M; Thu, 02 Apr 2020 11:28:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 3/6] kconfig: qconf: fix the content of the main widget
Date:   Thu,  2 Apr 2020 11:28:00 +0200
Message-Id: <3f87c3c69b198ee3b42b92d5d230c3976115b60e.1585819250.git.mchehab+huawei@kernel.org>
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

The port to Qt5 tried to preserve the same way as it used
to work with Qt3 and Qt4. However, at least with newer
versions of Qt5 (5.13), this doesn't work properly.

Change the schema by adding a vertical layout, in order
for it to start working properly again.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 2f4971906207..81ae6c059c1c 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1362,21 +1362,32 @@ ConfigMainWindow::ConfigMainWindow(void)
 	if ((x.isValid())&&(y.isValid()))
 		move(x.toInt(), y.toInt());
 
-	split1 = new QSplitter(this);
+	QWidget *widget = new QWidget(this);
+	QVBoxLayout *layout = new QVBoxLayout(widget);
+	setCentralWidget(widget);
+
+	split1 = new QSplitter(widget);
 	split1->setOrientation(Qt::Horizontal);
-	setCentralWidget(split1);
+	split1->setChildrenCollapsible(false);
 
-	menuView = new ConfigView(split1, "menu");
+	menuView = new ConfigView(widget, "menu");
 	menuList = menuView->list;
 
-	split2 = new QSplitter(split1);
+	split2 = new QSplitter(widget);
+	split2->setChildrenCollapsible(false);
 	split2->setOrientation(Qt::Vertical);
 
 	// create config tree
-	configView = new ConfigView(split2, "config");
+	configView = new ConfigView(widget, "config");
 	configList = configView->list;
 
-	helpText = new ConfigInfoView(split2, "help");
+	helpText = new ConfigInfoView(widget, "help");
+
+	layout->addWidget(split2);
+	split2->addWidget(split1);
+	split1->addWidget(configView);
+	split1->addWidget(menuView);
+	split2->addWidget(helpText);
 
 	setTabOrder(configList, helpText);
 	configList->setFocus();
-- 
2.25.1

