Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1243535B02C
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 21:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbhDJTqF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 15:46:05 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41074 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbhDJTqF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 15:46:05 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 13AJjaXV021927;
        Sun, 11 Apr 2021 04:45:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13AJjaXV021927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618083937;
        bh=zi0Vo9Np8JFaIDZXKYaiJxvqb6uRulLIa5OSp9iTGRg=;
        h=From:To:Cc:Subject:Date:From;
        b=0tdpBbWnhlHwpDrxMCO045dPfuumV4mVf10AXQxuqJfbFJo6+9ZY9JvYBPzDtDe+8
         F79toY8+H93BzXH3shScELDU1zenn/DMDVHMe2YQKucPL/ceiPbYMxHu2DfGVdmZ2R
         kotGFViKafrlbVuLNLD72zTZSzudiz6KFQEb84tOKp3lR+cRQkx1+ELcFKcga8EWXK
         0Cf3BhIAxtBH+OgMZAEZC9lCn+t2cFK3GZAWlIzfudbK/nDkBxE+JpkRzVFmB65JcB
         PsB8cLv9Xhzn4MCzUuUTdCzcPQoLksdA8KzS5ghGto9P2+1dzzkM1o64etXCsvlm0C
         cNwGgkI1d4JjA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] kconfig: mconf,nconf: remove unneeded '\0' termination after snprintf()
Date:   Sun, 11 Apr 2021 04:45:30 +0900
Message-Id: <20210410194534.187588-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

snprintf() always terminates the destination buffer with '\0' even if
the buffer is not long enough. (In this case, the last element of the
buffer becomes '\0'.)

The explicit termination is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/mconf.c | 11 +++--------
 scripts/kconfig/nconf.c | 12 +++---------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 4cfbe62938cd..9d3cf510562f 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -299,17 +299,12 @@ static char filename[PATH_MAX+1];
 static void set_config_filename(const char *config_filename)
 {
 	static char menu_backtitle[PATH_MAX+128];
-	int size;
 
-	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-			"%s - %s", config_filename, rootmenu.prompt->text);
-	if (size >= sizeof(menu_backtitle))
-		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
+	snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s",
+		 config_filename, rootmenu.prompt->text);
 	set_dialog_backtitle(menu_backtitle);
 
-	size = snprintf(filename, sizeof(filename), "%s", config_filename);
-	if (size >= sizeof(filename))
-		filename[sizeof(filename)-1] = '\0';
+	snprintf(filename, sizeof(filename), "%s", config_filename);
 }
 
 struct subtitle_part {
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 86ca42b5ab80..232eb3011efe 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -635,16 +635,10 @@ static char filename[PATH_MAX+1];
 static char menu_backtitle[PATH_MAX+128];
 static const char *set_config_filename(const char *config_filename)
 {
-	int size;
+	snprintf(menu_backtitle, sizeof(menu_backtitle), "%s - %s",
+		 config_filename, rootmenu.prompt->text);
 
-	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-			"%s - %s", config_filename, rootmenu.prompt->text);
-	if (size >= sizeof(menu_backtitle))
-		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
-
-	size = snprintf(filename, sizeof(filename), "%s", config_filename);
-	if (size >= sizeof(filename))
-		filename[sizeof(filename)-1] = '\0';
+	snprintf(filename, sizeof(filename), "%s", config_filename);
 	return menu_backtitle;
 }
 
-- 
2.27.0

