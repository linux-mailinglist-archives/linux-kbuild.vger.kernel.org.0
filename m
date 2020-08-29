Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A9B2565DD
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 10:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgH2IOz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 04:14:55 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47552 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgH2IOz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 04:14:55 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07T8ELfi014307;
        Sat, 29 Aug 2020 17:14:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07T8ELfi014307
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598688862;
        bh=OJdLICH6DzcmIBplrKxa7jTYDvkryW66ZqYjNneMHRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZUdoEEcp8+kfmRObSXgUaPWBbiaQ9VJS+dR7NoThcFUWmQ5dznfEeVXpf0VDhMXI1
         pYVZfEGWidA9SzdXFZbGYFhXYxAbz4reUB01wVAR4zdBQNPErnyZbw2xUWHCSah8mh
         I/Ydbb1M4322qln7srVkFQ2kcuucUNqR6lnQacN7jK/2sSo2y95yIpcJqS/a+SS5KH
         mOx5gmi90UV93FEhrTGT2iTeTM8db+r6o7S8PQiq3gxjYSQTb0FrPYuMCo+LkK70Lt
         GRW7d3JXdyGIOmFD5zXlP4A74pII7/Eeu67EdfFky7Ez5CUwgg/0JKM5oE35KdgK4E
         8O7Uw4mYd5vVg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] kconfig: qconf: update the intro message to match to the current code
Date:   Sat, 29 Aug 2020 17:14:08 +0900
Message-Id: <20200829081417.725978-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829081417.725978-1-masahiroy@kernel.org>
References: <20200829081417.725978-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I do not think "Although there is no cross reference yet ..." is valid
any longer.

The cross reference is supported via hyperlinks enabled by the
"show Debug Info" option.

Update the message.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c40e37656f3f..30a58aa6507a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1841,10 +1841,10 @@ void ConfigMainWindow::showIntro(void)
 
 		"If you do not see an option (e.g., a device driver) that you "
 		"believe should be present, try turning on Show All Options "
-		"under the Options menu. Although there is no cross reference "
-		"yet to help you figure out what other options must be enabled "
-		"to support the option you are interested in, you can still "
-		"view the help of a grayed-out option.\n\n"
+		"under the Options menu. Enabling Show Debug Info will help you"
+		"figure out what other options must be enabled to support the "
+		"option you are interested in, and hyperlinks will navigate to "
+		"them.\n\n"
 
 		"Toggling Show Debug Info under the Options menu will show the "
 		"dependencies, which you can then match by examining other "
-- 
2.25.1

