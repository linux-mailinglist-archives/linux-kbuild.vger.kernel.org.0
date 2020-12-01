Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE9B2C9FE1
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 11:37:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbgLAKfd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 05:35:33 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:24201 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729846AbgLAKfd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 05:35:33 -0500
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 0B1AYKHd001992;
        Tue, 1 Dec 2020 19:34:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 0B1AYKHd001992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606818861;
        bh=14hHLn0gihVMVkJ3AN6v+GnGdZ/fCtITftkO1TeIJdg=;
        h=From:To:Cc:Subject:Date:From;
        b=M6dBUTseHBP7mIf9+V1nFNrqBboYHueA9dqU0euQem7YGn0OvQ3LRE9E0bDyIpqjB
         hbXHQ3eGQQGYr+7W371cawDc+PY2F1hHo8VTkM5OzuCz+Lepcou12rageiKuj2X1hE
         dZxpJE8QkqZ2hozVs79AVTNxoB4ttvRTvRh7vqVpRFOYe+C3EJ0s+GK0vYAgYqfksb
         17zbMuf8/ALa5qdb85EAopJyBCOyrzLSZNyrROQGJfuOWS+Pjc0oWRpfnqzpJMII33
         B6igfK3JnNhFvwNy3VcHWTC78zFQ+bUNxB131qv7dN2zHwGfmXEe3EpNp1SogWPDO0
         Rkjwtr4NdK/xg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Quentin Perret <qperret@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] modpost: rename merror() to error()
Date:   Tue,  1 Dec 2020 19:34:14 +0900
Message-Id: <20201201103418.675850-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The log function names, warn(), merror(), fatal() are inconsistent.

Commit 2a11665945d5 ("kbuild: distinguish between errors and warnings
in modpost") intentionally chose merror() to avoid the conflict with
the library function error(). See man page of error(3).

But, we are already causing the conflict with warn() because it is also
a library function. See man page of warn(3). err() would be a problem
for the same reason.

The common technique to work around name conflicts is to use macros.

    #define error __error
    void __error(const char *fmt, ...)
    {
            <our own implementation>
    }

    #define warn __warn
    void __warn(const char *fmt, ...)
    {
            <our own implementation>
    }

In this way, we can implement our own warn() and error(), still we can
include <error.h> and <err.h> with no problem.

And, commit 93c95e526a4e ("modpost: rework and consolidate logging
interface") already did that.

Since the log functions are all macros, we can use error() without
causing "conflicting types" errors.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 10 +++++-----
 scripts/mod/modpost.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index f882ce0d9327..337f6ca4bda3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -403,8 +403,8 @@ static void sym_update_namespace(const char *symname, const char *namespace)
 	 * actually an assertion.
 	 */
 	if (!s) {
-		merror("Could not update namespace(%s) for symbol %s\n",
-		       namespace, symname);
+		error("Could not update namespace(%s) for symbol %s\n",
+		      namespace, symname);
 		return;
 	}
 
@@ -2226,7 +2226,7 @@ static int check_modname_len(struct module *mod)
 	else
 		mod_name++;
 	if (strlen(mod_name) >= MODULE_NAME_LEN) {
-		merror("module name is too long [%s.ko]\n", mod->name);
+		error("module name is too long [%s.ko]\n", mod->name);
 		return 1;
 	}
 
@@ -2319,8 +2319,8 @@ static int add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			merror("too long symbol \"%s\" [%s.ko]\n",
-			       s->name, mod->name);
+			error("too long symbol \"%s\" [%s.ko]\n",
+			      s->name, mod->name);
 			err = 1;
 			break;
 		}
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 3aa052722233..f453504ad4df 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -202,5 +202,5 @@ enum loglevel {
 void modpost_log(enum loglevel loglevel, const char *fmt, ...);
 
 #define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
-#define merror(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
+#define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
 #define fatal(fmt, args...)	modpost_log(LOG_FATAL, fmt, ##args)
-- 
2.27.0

