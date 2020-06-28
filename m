Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1869B20C8F8
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 18:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgF1QU6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 12:20:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:38546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbgF1QU5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 12:20:57 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9339F20720;
        Sun, 28 Jun 2020 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593361257;
        bh=RcEujEHL5VjBR1kogQARYLuzR1HyrB6e+JRCkRnS/yI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=C/Oio8DzOhFrrKARKdRgXBi/+TB4qXh5w4eo3RkAfkIpkqOOWC3T1+5Vexa4tsrCL
         pcVcLSXL9K+/yAgTmluXbOz8lK/nweg+HhmDuTorzedUrPXDtHIh8+Dihm6Hf5HOjU
         UMwILB6pwjBtg4xcUbncNCpaEPqEKK2mvD6Ye/nA=
Date:   Sun, 28 Jun 2020 18:20:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] kconfig: qconf: make debug links work again
Message-ID: <20200628182053.18bfe307@coco.lan>
In-Reply-To: <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
References: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
        <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Sun, 28 Jun 2020 23:41:46 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> On Sun, Jun 28, 2020 at 9:21 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > The Qt5 conversion broke support for debug info links.
> >
> > Restore the behaviour added by changeset
> > ab45d190fd4a ("kconfig: create links in info window").
> >
> > Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> 
> 
> I tested this patch, but this caused
> segmentation fault.
> 
> 
> I enabled 'Show Debug Info',
> and then clicked
> dep: <symbol name>.
> 
> Then, xconfig crashed.
> 
> (without this patch, it did not cause
> segfault at least)
> 
> Did you see this?

Could you please try the attached version? It should validate again the
symbols, instead of relying on a pointer passed via an URL.

This version still passes pointers via URLs for menus, though,
as it doesn't implement any logic for seeking the menu->prompt
string.

With this version, if something bad happens when parsing a
symbol internal URL, the code will print a message and ignore
it.

Thanks,
Mauro

[PATCH] kconfig: qconf: make debug links work again

The Qt5 conversion broke support for debug info links.

Restore the behaviour added by changeset
ab45d190fd4a ("kconfig: create links in info window").

Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 631e19659504..7dae5c5989db 100644
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
@@ -1217,13 +1218,56 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
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
+	char *hex = new char[count + 1];
+	char type;
+	struct symbol **result;
+
+	if (count < 1) {
+		qInfo() << "Clicked link is empty";
+		return;
+	}
+
+	memcpy(hex, str.constData(), count);
+	type = hex[0];
+
+	if (type == 's') {
+		/* Seek for exact match */
+		hex[0] = '^';
+		strcat(hex, "$");
+		result = sym_re_search(hex);
+		if (!result) {
+			qInfo() << "Clicked symbol is invalid";
+			return;
+		}
+
+		sym = *result;
+		symbolInfo();
+	} else {
+		unsigned long p = (int)strtol(hex + 1, NULL, 16);
+		if (!p) {
+			qInfo() << "Clicked menu is invalid";
+			return;
+		}
+
+		struct menu *m = (struct menu *)p;
+
+		_menu = m;
+		menuInfo();
+	}
+	emit showDebugChanged(true);
+}
+
 QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
 {
 	QMenu* popup = Parent::createStandardContextMenu(pos);
@@ -1497,6 +1541,9 @@ ConfigMainWindow::ConfigMainWindow(void)
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

