Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE6C20EEC9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730423AbgF3Gsk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:48:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730386AbgF3Gsk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:48:40 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 861F3207E8;
        Tue, 30 Jun 2020 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593499719;
        bh=opNErX80aVhTkL1c4dyREpBW+fGK/RxUQFOWoLcp5BI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FyZD4XE6wpxkoacblxnl9e06qqq8MKS8jp/35ef65p/HA653JKNVJtIviX9TXHH9m
         A9ByMyMm+v7+1j+ZhEifXS8+89/+IB5Tge/kedmS2rq7VRJ0dE+fiDeJywVToXi9ec
         XY7/lAPEeY+7njxxXYN0BCqATBIV7a5Dzu6Id5aY=
Date:   Tue, 30 Jun 2020 08:48:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3.1 7/7] kconfig: qconf: navigate menus on hyperlinks
Message-ID: <20200630084835.4db1331f@coco.lan>
In-Reply-To: <6f7162e40f127e76c7169315d33a14946a85719a.1593498345.git.mchehab+huawei@kernel.org>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
        <6f7162e40f127e76c7169315d33a14946a85719a.1593498345.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of just changing the helper window to show a
dependency, also navigate to it at the config and menu
widgets.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>


---

I ended re-sending the same version as on patch series 2. Please
consider this patch instead.

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 6a327b69ff5f..fd721c6c4c94 100644
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
@@ -1273,16 +1264,13 @@ void ConfigInfoView::clicked(const QUrl &url)
 	}
 
 	if (!m) {
-		qInfo() << "Clicked menu is invalid:" << data;
-		free(result);
-		delete data;
-		return;
+		/* Symbol is not visible as a menu */
+		symbolInfo();
+		emit showDebugChanged(true);
+	} else {
+		emit menuSelected(m);
 	}
 
-	_menu = m;
-	menuInfo();
-
-	emit showDebugChanged(true);
 	free(result);
 	delete data;
 }
@@ -1731,6 +1719,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 			list->setSelected(item, true);
 			list->scrollToItem(item);
 			list->setFocus();
+			helpText->setInfo(menu);
 		}
 	}
 }
