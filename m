Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E91C20EE4C
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730099AbgF3G0s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:26:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730080AbgF3G0r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:26:47 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BECA1207FF;
        Tue, 30 Jun 2020 06:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593498405;
        bh=JuODmNQ54Xlmx3f0CzHGZh/WPPiH3/FVYyWJpfhaPZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SVsS0hE2t7LARWIDMce6DWaBiHNe0GREg56hGSlK0NQAD2thEOXRhG6eDAIUx9Fke
         o+My5d5geODSvZ+b1qPMCOS0bGlg39H58TqnGyZh4H/QLz2fWs5qH2gV75M2PTl6MN
         VehejzweSjs39nXUjk2WV1fedU8yItXGOZdcVRtQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jq9j9-008WbF-UV; Tue, 30 Jun 2020 08:26:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] kconfig: qconf: navigate menus on hyperlinks
Date:   Tue, 30 Jun 2020 08:26:41 +0200
Message-Id: <6f7162e40f127e76c7169315d33a14946a85719a.1593498345.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593498345.git.mchehab+huawei@kernel.org>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of just changing the helper window to show a
dependency, also navigate to it at the config and menu
widgets.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6a327b69ff5f..f49fbac91995 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1233,7 +1233,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 	char *data = new char[count + 1];
 	struct symbol **result;
 	struct menu *m = NULL;
-	char type;
 
 	if (count < 1) {
 		qInfo() << "Clicked link is empty";
@@ -1243,7 +1242,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 
 	memcpy(data, str.constData(), count);
 	data[count] = '\0';
-	type = data[0];
 
 	/* Seek for exact match */
 	data[0] = '^';
@@ -1256,15 +1254,8 @@ void ConfigInfoView::clicked(const QUrl &url)
 	}
 
 	sym = *result;
-	if (type == 's') {
-		symbolInfo();
-		emit showDebugChanged(true);
-		free(result);
-		delete data;
-		return;
-	}
 
-	/* URL is a menu */
+	/* Seek for the menu which holds the symbol */
 	for (struct property *prop = sym->prop; prop; prop = prop->next) {
 		    if (prop->type != P_PROMPT && prop->type != P_MENU)
 			    continue;
@@ -1272,17 +1263,11 @@ void ConfigInfoView::clicked(const QUrl &url)
 		    break;
 	}
 
-	if (!m) {
+	if (!m)
 		qInfo() << "Clicked menu is invalid:" << data;
-		free(result);
-		delete data;
-		return;
-	}
+	else
+		emit menuSelected(m);
 
-	_menu = m;
-	menuInfo();
-
-	emit showDebugChanged(true);
 	free(result);
 	delete data;
 }
@@ -1731,6 +1716,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 			list->setSelected(item, true);
 			list->scrollToItem(item);
 			list->setFocus();
+			helpText->setInfo(menu);
 		}
 	}
 }
-- 
2.26.2

