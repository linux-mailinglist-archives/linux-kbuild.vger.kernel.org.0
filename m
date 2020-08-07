Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2109B23E9FC
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgHGJTg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41484 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbgHGJTf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:35 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQ0032147;
        Fri, 7 Aug 2020 18:19:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQ0032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791954;
        bh=mpfNPfPqiVao3oZ/c3NU7ZKvxQ18iH//rapEaLj9PUo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v30nadyfDA8UYzFtmonPfnRZG28HBDhwm6GYLzUmd/0iRRTkiSvB8l0bONPmZ3oN2
         Zjg8P1EgKKnWjqkEccf9pI/clA2GPsxJjthDSzqmI2wVNPtKglGiuCcNSd+PFin4a6
         cyqNUIOz1fWq5JHKm3Zzg0BTL2Da0Y7S/HG8l/ToG+S4o1x2wk3xHmKpQ3OYzm5sFw
         WxrWG8tiCjW2NFSAZGUg6DIU0WzbmBn2OpZxWVxDSdEP5/KxBkWARdC7vzxRlHo5UK
         87/+nu0LDYm741p9ShQTRqpVLc9xMKpZ2I2XSC9mF6W23tuS11ytMCe5IxGRnJSwu4
         M+JC0IflpRpcA==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/19] kconfig: qconf: remove toolBar from ConfigMainWindow members
Date:   Fri,  7 Aug 2020 18:18:54 +0900
Message-Id: <20200807091909.2985787-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
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

(no changes since v1)

 scripts/kconfig/qconf.cc | 2 +-
 scripts/kconfig/qconf.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 2f7c13a758b6..b4f32199e0df 100644
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

