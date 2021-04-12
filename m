Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E5535B7EB
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Apr 2021 03:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbhDLBNP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 21:13:15 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:54772 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236104AbhDLBNO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 21:13:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 13C1CVI8003364;
        Mon, 12 Apr 2021 10:12:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 13C1CVI8003364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618189952;
        bh=8n44YieJK85qmJRfL1CyMbvcWKDxnqK4wAAYrHCBx+s=;
        h=From:To:Cc:Subject:Date:From;
        b=RH4aKHoyUdthyn7W1ClmLfSFUUjO+6QDJc5/fn04qsO/WWKzfRFAokmU9nZn3sOZG
         UjpaQYcysbuXfoyOZOmZ1i9hF27T1MH5jr41bfTZawHWu29din/9L1bF2rAc7CQshe
         9HOtUBZ4ZXz5a6EDyCr5zkDvPUqT9jX8xddeHMYL77vK8dTZz8ykoHUkslCV8ffTgR
         MEiNEb4RRCWaBztN3rypsNRRFP+gCkqO+cYJpAWgiBxJuT8mqWD3624gpYwMAzWXCe
         5pv2NhE8zK/IHhZ96O4XNWp3UJexbbaDLmerhdKZuHCBwNGJgI6f6zoFqini7xl9Q9
         tLsJ0Cnuwdw1g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kconfig: nconf: change set_config_filename() to void function
Date:   Mon, 12 Apr 2021 10:12:25 +0900
Message-Id: <20210412011227.249534-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No one uses the return value of this function.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/nconf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index e86d3511b939..d8a6ab5fb521 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -631,13 +631,12 @@ static int item_is_tag(char tag)
 
 static char filename[PATH_MAX+1];
 static char menu_backtitle[PATH_MAX+128];
-static const char *set_config_filename(const char *config_filename)
+static void set_config_filename(const char *config_filename)
 {
 	snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s",
 		 config_filename, rootmenu.prompt->text);
 
 	snprintf(filename, sizeof(filename), "%s", config_filename);
-	return menu_backtitle;
 }
 
 /* return = 0 means we are successful.
-- 
2.27.0

