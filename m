Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2ACA2A239A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 04:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgKBDk5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 1 Nov 2020 22:40:57 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:56789 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgKBDk5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Nov 2020 22:40:57 -0500
Received: from grover.RMN.KIBA.LAB.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 0A23e2Gx007813;
        Mon, 2 Nov 2020 12:40:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0A23e2Gx007813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604288408;
        bh=gpml3RQZVXbbe4n9D9DZTs3pRYLXmv+1iU0BKpxfrxE=;
        h=From:To:Cc:Subject:Date:From;
        b=sgRY7l2ZT+Dy/mN7tUQTE57CAath2WYbskYyiUF9CTwvLp8/OzeEdHqcCqidAyVnO
         T9RadavsgTx5ykiOfQF+PEpuu+YMQRhsA+d0Fjg0k2MCkkmHsbmsbKNWnayERant9m
         0oM4GhUd9kSdRsd8HhOCHmRnEUhQBlVHxDVarJN3cpPR9hMD8WIe4jbN6DVORyC+1E
         elCVt7A+4rHZe1lPInJy1JyHvxswqhJjEc3cRAE8ohH8QJuQn89t9JYgxpVBKXUSe7
         sDWN1JrcKOzqvSxVSxM2DPYmZ/pGMmeXlhTEPUYImEX4pF37VnXLE1gvabwxWOuwXO
         QdcpCxNlJ7eKw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Kolpackov <boris@codesynthesis.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: show Qt version in the About dialog
Date:   Mon,  2 Nov 2020 12:40:01 +0900
Message-Id: <20201102034001.409945-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

You can get the Qt version by running "pkg-config --modversion Qt5Core"
or something, but this might be useful to get the runtime Qt version
more easily. Go to the menu "Help" -> "About", then you can see it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index cbe749b44b1a..d000869b787c 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1799,10 +1799,13 @@ void ConfigMainWindow::showIntro(void)
 void ConfigMainWindow::showAbout(void)
 {
 	static const QString str = "qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n"
-		"Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n\n"
-		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n";
+		"Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n"
+		"\n"
+		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n"
+		"\n"
+		"Qt Version: ";
 
-	QMessageBox::information(this, "qconf", str);
+	QMessageBox::information(this, "qconf", str + qVersion());
 }
 
 void ConfigMainWindow::saveSettings(void)
-- 
2.25.1

