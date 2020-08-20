Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C78124C1F2
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 17:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728812AbgHTPRT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 11:17:19 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41946 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728619AbgHTPRP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 11:17:15 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 07KFGnDv000586;
        Fri, 21 Aug 2020 00:16:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 07KFGnDv000586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597936610;
        bh=jTy1QzIhvnmiaRAypycouWs77kNzM/Xh65o7wo9awu4=;
        h=From:To:Cc:Subject:Date:From;
        b=VlvFwshsn/aM5lnfjGVCT3HjPBH7XP2x1wXlw2NW69F1VvVu5DeD/mNY6eiNCDRwV
         KFijhH4aLxabO33L5Ww83IYCSm6H70zyjuchoReUZICrAes1y+Bb0+fXhx3a2nzMoI
         paXLdQ87uMsKoPc0yKJiakEMrM8LtBrB1ajL/+uMFggEKIhLhkHzx44ztpMh9hkMID
         rD8nKzCI7HRMSk3i/5Qox580XqKgfW7XN1pHPRFi7lwLLI5AB6BKRUfG+KkcaxDlSR
         MvasBDye8CVyUX1aZsvRXdqVnhmNODJlH8Amduq/weQ6syjBicXX0L/J28h4fkhK52
         PKWRZB1PoyWnQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ronald Warsow <rwarsow@gmx.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: remove qInfo() to get back Qt4 support
Date:   Fri, 21 Aug 2020 00:16:46 +0900
Message-Id: <20200820151646.465947-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

qconf is supposed to work with Qt4 and Qt5, but since commit
c4f7398bee9c ("kconfig: qconf: make debug links work again"),
building with Qt4 fails as follows:

  HOSTCXX scripts/kconfig/qconf.o
scripts/kconfig/qconf.cc: In member function ‘void ConfigInfoView::clicked(const QUrl&)’:
scripts/kconfig/qconf.cc:1241:3: error: ‘qInfo’ was not declared in this scope; did you mean ‘setInfo’?
 1241 |   qInfo() << "Clicked link is empty";
      |   ^~~~~
      |   setInfo
scripts/kconfig/qconf.cc:1254:3: error: ‘qInfo’ was not declared in this scope; did you mean ‘setInfo’?
 1254 |   qInfo() << "Clicked symbol is invalid:" << data;
      |   ^~~~~
      |   setInfo
make[1]: *** [scripts/Makefile.host:129: scripts/kconfig/qconf.o] Error 1
make: *** [Makefile:606: xconfig] Error 2

qInfo() does not exist in Qt4. I think these call-sites should be
unreachable. qInfo() is not the right one to use, at least.

Link: https://lkml.org/lkml/2020/8/19/1096
Fixes: c4f7398bee9c ("kconfig: qconf: make debug links work again")
Reported-by: Ronald Warsow <rwarsow@gmx.de>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 5a0aa159ec80..3a8f6251a727 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1238,7 +1238,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 	struct menu *m = NULL;
 
 	if (count < 1) {
-		qInfo() << "Clicked link is empty";
 		delete[] data;
 		return;
 	}
@@ -1251,7 +1250,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 	strcat(data, "$");
 	result = sym_re_search(data);
 	if (!result) {
-		qInfo() << "Clicked symbol is invalid:" << data;
 		delete[] data;
 		return;
 	}
-- 
2.25.1

