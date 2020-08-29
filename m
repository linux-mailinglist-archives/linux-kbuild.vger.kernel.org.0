Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9812565F3
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbgH2IPt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:15:49 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47525 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgH2IOz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:14:55 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfh014307;
        Sat, 29 Aug 2020 17:14:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfh014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688861;
        bh=rnMeFxtUozgRoWaZOL+eXZBgvS1kKsvPqvmSLOem0ZM=;
        h=From:To:Cc:Subject:Date:From;
        b=D8kMxkhPZnYAOPqqTCXoj2ogevhLJAt4RKNqt9a++veTajLxSbTL+PRKQfuXG/SjU
         RWDP8EOoFdIqg5c81atNI0kO+h0WBnAxfLO/AUV5nSgcagvKxYAIj3mKYP+TR6szEo
         J5kG5569QItVGN0vxuozLCACK/2Mwrj4NPVn0qoFRB6hmpzU0+i7Mb1SkYrtIR9u9M
         y2G5JkVje/an3rusIUBE4/cX+e+dgRkdAtDwE0YEjzDiJd+/Fp8R0HLWnNvr0zf9DA
         OZkx1nOxDbLZ1WlpwRAgulxnQv2pIfzZcBwjT5I5trxjJC7PvwLT3HxSzall05QmTR
         xke13ZVWkWNXA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] kconfig: qconf: reformat the intro message
Date:   Sat, 29 Aug 2020 17:14:07 +0900
Message-Id: <20200829081417.725978-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The introduction message displayed by 'Help -> Introduction' does not
look nice due to excessive new lines.

Reformat the message.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 8638785328a7..c40e37656f3f 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1831,17 +1831,24 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 
 void ConfigMainWindow::showIntro(void)
 {
-	static const QString str = "Welcome to the qconf graphical configuration tool.\n\n"
-		"For each option, a blank box indicates the feature is disabled, a check\n"
-		"indicates it is enabled, and a dot indicates that it is to be compiled\n"
-		"as a module.  Clicking on the box will cycle through the three states.\n\n"
-		"If you do not see an option (e.g., a device driver) that you believe\n"
-		"should be present, try turning on Show All Options under the Options menu.\n"
-		"Although there is no cross reference yet to help you figure out what other\n"
-		"options must be enabled to support the option you are interested in, you can\n"
-		"still view the help of a grayed-out option.\n\n"
-		"Toggling Show Debug Info under the Options menu will show the dependencies,\n"
-		"which you can then match by examining other options.\n\n";
+	static const QString str =
+		"Welcome to the qconf graphical configuration tool.\n\n"
+
+		"For each option, a blank box indicates the feature is "
+		"disabled, a check indicates it is enabled, and a dot "
+		"indicates that it is to be compiled as a module. Clicking on "
+		"the box will cycle through the three states.\n\n"
+
+		"If you do not see an option (e.g., a device driver) that you "
+		"believe should be present, try turning on Show All Options "
+		"under the Options menu. Although there is no cross reference "
+		"yet to help you figure out what other options must be enabled "
+		"to support the option you are interested in, you can still "
+		"view the help of a grayed-out option.\n\n"
+
+		"Toggling Show Debug Info under the Options menu will show the "
+		"dependencies, which you can then match by examining other "
+		"options.\n\n";
 
 	QMessageBox::information(this, "qconf", str);
 }
-- 
2.25.1

