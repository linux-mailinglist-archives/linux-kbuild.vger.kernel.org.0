Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9690823EA18
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgHGJTh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:19:37 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41486 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgHGJTg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBPv032147;
        Fri, 7 Aug 2020 18:19:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBPv032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791951;
        bh=PmJ0GVxR3KXmtIUW/pYRqsxX2UAZbsS3qkoMiv7ZHE8=;
        h=From:To:Cc:Subject:Date:From;
        b=BN/fPfN9+CsRd7c5l6WGpeN/qLi5F++n1lharkHduu8WFNWBXjJ9udGRsVOdwTPbH
         i8TET+gjnrMTVPFrHVLD8//hQIJJH801jrgHjbFmL0NLSmMegvGQelpDVeW8QMl4u7
         FJKRHFEl45dAblwo6mHRhHlKsIwPhFN6lAKHUAqJgD5h6zRijDPaUskqwbGKO13S8m
         YuG+teVXj/xr/mf+gUV/B+JFfVJHvSImPXdhDwDxrgyB6ETMXsIYLXw0kG0BhjhyBo
         uSv4Ok8UIOHc2FmC9gKoRDkCPYh7no5TsLoeqQBr8+Gse7Oz5+1slkawHmnezmrxle
         XxSFmKx4GsvWw==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/19] kconfig: qconf: remove ->addSeparator() to menuBar
Date:   Fri,  7 Aug 2020 18:18:51 +0900
Message-Id: <20200807091909.2985787-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not understand the purpose of this ->addSeparator().
It does not make any difference.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 scripts/kconfig/qconf.cc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 23d1cb01a41a..55023a9e8315 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1540,7 +1540,6 @@ ConfigMainWindow::ConfigMainWindow(void)
 	optionMenu->addAction(showDebugAction);
 
 	// create help menu
-	menu->addSeparator();
 	QMenu* helpMenu = menu->addMenu("&Help");
 	helpMenu->addAction(showIntroAction);
 	helpMenu->addAction(showAboutAction);
-- 
2.25.1

