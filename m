Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B58020E563
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729328AbgF2Vg2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:36:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728439AbgF2Skl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:41 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D46AF2313F;
        Mon, 29 Jun 2020 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593423343;
        bh=uaEYaj64jJNvDMfBvwTCam7FOAO6+8uqFEsZk/mX7tc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zqGYu0UYDuk58ikGtJ5IfdWKoANHEk1LWsm4Ie3+le/uhaQINtoodnukq8+q1amjb
         y7dqCpOd9f+BrjfaRMA6tz8wLhvIyn8XWqc4Kt+k/nfw3xjT+yqJdQhpn94QF9Xgeq
         2ok+eg2uw5IfeZGSwtrfw89pexoKFHoF9m8+iJmc=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jpqCS-006cAR-IK; Mon, 29 Jun 2020 11:35:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] kconfig: qconf: make debug links work again
Date:   Mon, 29 Jun 2020 11:35:38 +0200
Message-Id: <b10b8bf2c21f4288ecb6081a967c302000346ff1.1593423060.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593423060.git.mchehab+huawei@kernel.org>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The Qt5 conversion broke support for debug info links.

Restore the behaviour added by changeset
ab45d190fd4a ("kconfig: create links in info window").

The original approach were to pass a pointer for a data struct
via an <a href>. That doesn't sound a good idea, as, if something
gets wrong, the app could crash. So, instead, pass the name of
the symbol, and validate such symbol at the hyperlink handling
logic.

Link: https://lore.kernel.org/lkml/20200628125421.12458086@coco.lan/
Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 75 +++++++++++++++++++++++++++++++++++++---
 scripts/kconfig/qconf.h  |  1 +
 2 files changed, 71 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 85782da3e464..49f0688fceb8 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -7,6 +7,7 @@
 #include <QAction>
 #include <QApplication>
 #include <QCloseEvent>
+#include <QDebug>
 #include <QDesktopWidget>
 #include <QFileDialog>
 #include <QLabel>
@@ -1012,7 +1013,7 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
 	: Parent(parent), sym(0), _menu(0)
 {
 	setObjectName(name);
-
+	setOpenLinks(false);
 
 	if (!objectName().isEmpty()) {
 		configSettings->beginGroup(objectName());
@@ -1085,7 +1086,7 @@ void ConfigInfoView::menuInfo(void)
 			if (sym->name) {
 				head += " (";
 				if (showDebug())
-					head += QString().sprintf("<a href=\"s%p\">", sym);
+					head += QString().sprintf("<a href=\"s%s\">", sym->name);
 				head += print_filter(sym->name);
 				if (showDebug())
 					head += "</a>";
@@ -1094,7 +1095,7 @@ void ConfigInfoView::menuInfo(void)
 		} else if (sym->name) {
 			head += "<big><b>";
 			if (showDebug())
-				head += QString().sprintf("<a href=\"s%p\">", sym);
+				head += QString().sprintf("<a href=\"s%s\">", sym->name);
 			head += print_filter(sym->name);
 			if (showDebug())
 				head += "</a>";
@@ -1145,7 +1146,7 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 		switch (prop->type) {
 		case P_PROMPT:
 		case P_MENU:
-			debug += QString().sprintf("prompt: <a href=\"m%p\">", prop->menu);
+			debug += QString().sprintf("prompt: <a href=\"m%s\">", sym->name);
 			debug += print_filter(prop->text);
 			debug += "</a><br>";
 			break;
@@ -1217,13 +1218,74 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
 	QString str2 = print_filter(str);
 
 	if (sym && sym->name && !(sym->flags & SYMBOL_CONST)) {
-		*text += QString().sprintf("<a href=\"s%p\">", sym);
+		*text += QString().sprintf("<a href=\"s%s\">", sym->name);
 		*text += str2;
 		*text += "</a>";
 	} else
 		*text += str2;
 }
 
+void ConfigInfoView::clicked(const QUrl &url)
+{
+	QByteArray str = url.toEncoded();
+	const std::size_t count = str.size();
+	char *data = new char[count + 1];
+	struct symbol **result;
+	struct menu *m = NULL;
+	char type;
+
+	if (count < 1) {
+		qInfo() << "Clicked link is empty";
+		delete data;
+		return;
+	}
+
+	memcpy(data, str.constData(), count);
+	data[count] = '\0';
+	type = data[0];
+
+	/* Seek for exact match */
+	data[0] = '^';
+	strcat(data, "$");
+	result = sym_re_search(data);
+	if (!result) {
+		qInfo() << "Clicked symbol is invalid:" << data;
+		delete data;
+		return;
+	}
+
+	sym = *result;
+	if (type == 's') {
+		symbolInfo();
+		emit showDebugChanged(true);
+		free(result);
+		delete data;
+		return;
+	}
+
+	/* URL is a menu */
+	for (struct property *prop = sym->prop; prop; prop = prop->next) {
+		    if (prop->type != P_PROMPT && prop->type != P_MENU)
+			    continue;
+		    m = prop->menu;
+		    break;
+	}
+
+	if (!m) {
+		qInfo() << "Clicked menu is invalid:" << data;
+		free(result);
+		delete data;
+		return;
+	}
+
+	_menu = m;
+	menuInfo();
+
+	emit showDebugChanged(true);
+	free(result);
+	delete data;
+}
+
 QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
 {
 	QMenu* popup = Parent::createStandardContextMenu(pos);
@@ -1497,6 +1559,9 @@ ConfigMainWindow::ConfigMainWindow(void)
 	helpMenu->addAction(showIntroAction);
 	helpMenu->addAction(showAboutAction);
 
+	connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
+		 helpText, SLOT (clicked (const QUrl &)) );
+
 	connect(configList, SIGNAL(menuChanged(struct menu *)),
 		helpText, SLOT(setInfo(struct menu *)));
 	connect(configList, SIGNAL(menuSelected(struct menu *)),
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index d913a02967ae..a193137f2314 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -250,6 +250,7 @@ public slots:
 	void setInfo(struct menu *menu);
 	void saveSettings(void);
 	void setShowDebug(bool);
+	void clicked (const QUrl &url);
 
 signals:
 	void showDebugChanged(bool);
-- 
2.26.2

