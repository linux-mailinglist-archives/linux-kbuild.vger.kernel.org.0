Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4622E16240D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 10:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgBRJ7K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 04:59:10 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:33652 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgBRJ7K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 04:59:10 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 01I9x18W005260;
        Tue, 18 Feb 2020 18:59:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 01I9x18W005260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582019941;
        bh=7hztNWwkPF1IHvl8qgr2FXfKE2sZO9qLeIR6zGqkn5M=;
        h=From:To:Cc:Subject:Date:From;
        b=W/eIDJ81fDqWmWyOOKt3KzPhVujWRDL4FALFcC+lFa8xTeV8LHt2eywHoP3ZVN4B3
         7IBdyW8PMJWYD/1svrGpRGCV3KYsjmvdh55IItfa4yHZwtPoeg2JxnticYM0qUJJep
         bhWTnqErcsRvfRoD7LTwP6fFImOo9x1JTfNvUrt0dyWgSeoPRe4ZTEJW5FqZ0A6JH7
         RRWG+OfgW0kn4CRNRrBLEh0PQQWelmlWc/AOss9fj8LAJcf4M0Zi15lVyhJt/nKeNk
         W7KvEo+yt97E0ZffS0NaP46JSvTxXXDvzzwyQJn9xo1H3BiG6Ea1wSxS8K/VqHFPhM
         upogNwhjeH8pg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] fixdep: remove unneeded code and comments about *.ver files
Date:   Tue, 18 Feb 2020 18:58:59 +0900
Message-Id: <20200218095859.9725-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is probably stale code. In old days (~ Linux 2.5.59), Kbuild made
genksyms generate include/linux/modules/*.ver files.

The currenct Kbuild does not generate *.ver files at all.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/basic/fixdep.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 9ba47b0a47b9..ad2041817985 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -77,11 +77,6 @@
  * dependencies on include/config/my/option.h for every
  * CONFIG_MY_OPTION encountered in any of the prerequisites.
  *
- * It will also filter out all the dependencies on *.ver. We need
- * to make sure that the generated version checksum are globally up
- * to date before even starting the recursive build, so it's too late
- * at this point anyway.
- *
  * We don't even try to really parse the header files, but
  * merely grep, i.e. if CONFIG_FOO is mentioned in a comment, it will
  * be picked up as well. It's not a problem with respect to
@@ -299,8 +294,7 @@ static void *read_file(const char *filename)
 static int is_ignored_file(const char *s, int len)
 {
 	return str_ends_with(s, len, "include/generated/autoconf.h") ||
-	       str_ends_with(s, len, "include/generated/autoksyms.h") ||
-	       str_ends_with(s, len, ".ver");
+	       str_ends_with(s, len, "include/generated/autoksyms.h");
 }
 
 /*
-- 
2.17.1

