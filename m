Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D676B235857
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgHBQSH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:07 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48907 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOae003720;
        Mon, 3 Aug 2020 01:17:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOae003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385046;
        bh=hqiIXIqdCOcES7qgpPpJ8J0MEsEi3bePazNZOEv2i18=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GJ4yFE95su/9EDUh+wbvFz2rn9zl8n3Wpb18zB5RlCgpWcaie0DDVGU/UI7s6elCM
         fC4jNWc5zFcJhfYuipxAY/aSUU8VnSW7ix2duAJ5evacq3rCqRDNpE/++DDeEIn7lu
         sehDfAvQvknhHhjmUabLqDQqBXDjtMmNyGCUJ2J43V05eCPenkws4FYtobragnIHg7
         1TOcEE9Eol/t+wGaJLVidXTW/FRQt9FH7h7pr2+TNgWVBKLlhdKq1X8SANqFZTUdi8
         ilnnaGv93dA1axblFcB+r/AUq7LFdcn6voyvhS9on+C+xphlB1OTbtGKKBzcHuy66s
         QStzxb0jk86/w==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] kconfig: qconf: remove toolBar from ConfigMainWindow members
Date:   Mon,  3 Aug 2020 01:17:08 +0900
Message-Id: <20200802161721.921721-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This pointer is only used in the ConfigMainWindow constructor.

Drop it from the private members.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 scripts/kconfig/qconf.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 0ef9a1da6475..4eb846c90b1d 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1431,7 +1431,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	setTabOrder(configList, helpText);
 	configList->setFocus();
 
-	toolBar = new QToolBar("Tools", this);
+	QToolBar *toolBar = new QToolBar("Tools", this);
 	addToolBar(toolBar);
 
 	backAction = new QAction(QPixmap(xpm_back), "Back", this);
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 5eeab4a8bb43..b80683998635 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -326,7 +326,6 @@ public slots:
 	ConfigView *configView;
 	ConfigList *configList;
 	ConfigInfoView *helpText;
-	QToolBar *toolBar;
 	QAction *backAction;
 	QAction *singleViewAction;
 	QAction *splitViewAction;
-- 
2.25.1

