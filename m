Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD0419BE9C
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 11:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgDBJ2Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 05:28:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:49230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387721AbgDBJ2I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 05:28:08 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6C492078C;
        Thu,  2 Apr 2020 09:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585819687;
        bh=cywDP6eNSmYYa3KeaQgosXJi4aqsO1zjpdq6I2/ZdSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HUZP7ipkni1ynrf/4zsRG4qpMiYSMcAxWfYuGiG75cP/GAEkg2z2j5rjYThRLCPR5
         AMvxPEM3LHwFhhoscGrR9YYS8tGIZ0HH9PRuqf4ZsWzxH3nOJZv2b2StxdO35h9BuU
         4e+WhgxrufovTdOWAYdoOIKJQq/YGQsAtibLreiY=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jJw8s-000AaA-2Y; Thu, 02 Apr 2020 11:28:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 2/6] kconfig: qconf: Change title for the item window
Date:   Thu,  2 Apr 2020 11:27:59 +0200
Message-Id: <39c72450d98fc16b735237df296b066c8eebb066.1585819250.git.mchehab+huawei@kernel.org>
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

Both main config window and the item window have "Option"
name. That sounds weird, and makes harder to debug issues
of a window appearing at the wrong place.

So, change the title to reflect the contents of each
window.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index daa3325c0a49..2f4971906207 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -318,7 +318,10 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	setVerticalScrollMode(ScrollPerPixel);
 	setHorizontalScrollMode(ScrollPerPixel);
 
-	setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
+	if (mode == symbolMode)
+		setHeaderLabels(QStringList() << "Item" << "Name" << "N" << "M" << "Y" << "Value");
+	else
+		setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
 
 	connect(this, SIGNAL(itemSelectionChanged(void)),
 		SLOT(updateSelection(void)));
@@ -399,6 +402,11 @@ void ConfigList::updateSelection(void)
 	struct menu *menu;
 	enum prop_type type;
 
+	if (mode == symbolMode)
+		setHeaderLabels(QStringList() << "Item" << "Name" << "N" << "M" << "Y" << "Value");
+	else
+		setHeaderLabels(QStringList() << "Option" << "Name" << "N" << "M" << "Y" << "Value");
+
 	if (selectedItems().count() == 0)
 		return;
 
-- 
2.25.1

