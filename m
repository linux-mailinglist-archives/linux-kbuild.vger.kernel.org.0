Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CFB235865
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgHBQSd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:33 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48903 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726956AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOah003720;
        Mon, 3 Aug 2020 01:17:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOah003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385047;
        bh=dIQiuFuXJX/6WFvX4m7dkBVvzX0JYCw0Yn5678SsA1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jsYb6WG3NhEt4vsCAoE6JVuyo78CL9PS+BIvDRQM+vLgYbgzldVV0SZd29yzfiHiv
         8tamTLm1UukR+wrEsxyNnNG1GvDDgZ/EYaVcq1yUWTFP5lcpub5zPwrxnK/K2bJ7vL
         q2E/104dfNbpRR5ftq0XzDQZJNpyqnuR+2Cn0NFRqDAT9RUhZooAbKDHpctpMOtmHt
         0nY4AaWuF9GZr/8j7CC/oQmuwlmxL7HHjkA3JxIMGAW6ne93OY0aa3UXraX13WgXSL
         yfQGf60LL3QyHjljDJqNkCYg1uEDVYhb2QmzX4NiJiNVZwLCoxHDXYVbcE98eAjgCx
         CkTLtPsnSg9yA==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] kconfig: qconf: remove name from ConfigSearchWindow constructor
Date:   Mon,  3 Aug 2020 01:17:11 +0900
Message-Id: <20200802161721.921721-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This constructor is only called with "search" as the second argument.

Hard-code the name in the constructor, and drop it from the function
argument.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 44 +++++++++++++++++++---------------------
 scripts/kconfig/qconf.h  |  2 +-
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index e17c46bb75e8..a74bfc65b633 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1287,10 +1287,10 @@ void ConfigInfoView::contextMenuEvent(QContextMenuEvent *e)
 	Parent::contextMenuEvent(e);
 }
 
-ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *name)
+ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 	: Parent(parent), result(NULL)
 {
-	setObjectName(name);
+	setObjectName("search");
 	setWindowTitle("Search Config");
 
 	QVBoxLayout* layout1 = new QVBoxLayout(this);
@@ -1311,9 +1311,9 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 
 	split = new QSplitter(this);
 	split->setOrientation(Qt::Vertical);
-	list = new ConfigView(split, name);
+	list = new ConfigView(split, "search");
 	list->list->mode = listMode;
-	info = new ConfigInfoView(split, name);
+	info = new ConfigInfoView(split, "search");
 	connect(list->list, SIGNAL(menuChanged(struct menu *)),
 		info, SLOT(setInfo(struct menu *)));
 	connect(list->list, SIGNAL(menuChanged(struct menu *)),
@@ -1321,25 +1321,23 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 
 	layout1->addWidget(split);
 
-	if (name) {
-		QVariant x, y;
-		int width, height;
-		bool ok;
+	QVariant x, y;
+	int width, height;
+	bool ok;
 
-		configSettings->beginGroup(name);
-		width = configSettings->value("/window width", parent->width() / 2).toInt();
-		height = configSettings->value("/window height", parent->height() / 2).toInt();
-		resize(width, height);
-		x = configSettings->value("/window x");
-		y = configSettings->value("/window y");
-		if ((x.isValid())&&(y.isValid()))
-			move(x.toInt(), y.toInt());
-		QList<int> sizes = configSettings->readSizes("/split", &ok);
-		if (ok)
-			split->setSizes(sizes);
-		configSettings->endGroup();
-		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
-	}
+	configSettings->beginGroup("search");
+	width = configSettings->value("/window width", parent->width() / 2).toInt();
+	height = configSettings->value("/window height", parent->height() / 2).toInt();
+	resize(width, height);
+	x = configSettings->value("/window x");
+	y = configSettings->value("/window y");
+	if (x.isValid() && y.isValid())
+		move(x.toInt(), y.toInt());
+	QList<int> sizes = configSettings->readSizes("/split", &ok);
+	if (ok)
+		split->setSizes(sizes);
+	configSettings->endGroup();
+	connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 }
 
 void ConfigSearchWindow::saveSettings(void)
@@ -1643,7 +1641,7 @@ void ConfigMainWindow::saveConfigAs(void)
 void ConfigMainWindow::searchConfig(void)
 {
 	if (!searchWindow)
-		searchWindow = new ConfigSearchWindow(this, "search");
+		searchWindow = new ConfigSearchWindow(this);
 	searchWindow->show();
 }
 
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 6e6bb0a96348..335f0776984f 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -272,7 +272,7 @@ class ConfigSearchWindow : public QDialog {
 	Q_OBJECT
 	typedef class QDialog Parent;
 public:
-	ConfigSearchWindow(ConfigMainWindow* parent, const char *name = 0);
+	ConfigSearchWindow(ConfigMainWindow *parent);
 
 public slots:
 	void saveSettings(void);
-- 
2.25.1

