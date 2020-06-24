Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8E4207D76
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 22:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406668AbgFXUe1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 16:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406514AbgFXUdU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 16:33:20 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87376C061797
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:20 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id q5so2476765qvq.18
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=79pxKTlkNWyJf2vmlsIGe03zgp7TGuVtfyoMyMkArK8=;
        b=btHNoJ4LCTKmKU6iX1nY/p97V+Ay3nMJGlrn7bXF/L/XPTDGtt58AsD3Mh0Aeg8xli
         i/d+HGMtV5Jn6jA8Cx1FqZSW6wKGv/sOjgspsd/CVSg+LkYGEeeEYLFxrYYGQ8I8QOWM
         Cf5JM3EZjmGV5qQFBgWfzxMp2Kdb9qPFRU+2kPmr0e4ZXejzdyDXKQQDGqzly1C9+syM
         lYUlij36WBcULQ7G2HzWI/6+G60YtbxUYFeFxnsxSan8nd8WAH4jUNFN9Tmd4BJJC3/J
         4MhqOa97DkCrf9Gdui9rH2qj5BT7xXSCfX6fHqyZfik5WekbjJGEyd8PzAGt7HITNkeO
         mMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=79pxKTlkNWyJf2vmlsIGe03zgp7TGuVtfyoMyMkArK8=;
        b=iEek+LFrWI8FUdIhWyV/KRG4VX0ICc18jFJFXGVaqL3bPtAHRV3oyBS9CuK5slREsN
         VjNyjo0YtzdB3Ux/P2CnkWkk+O9XCTkvIXegFPyqqs1u3xatSsJPm1nqgNdP8TBXm2G1
         BuJH8DmOksYrxzK2sYV3SJ4lLZwKIhPv7stUw/9EJ7XsaDgpPsTBTN/cx0dI7yADIdOZ
         ycJwzL1E0AM8wP2nLsBXLYQrkrTw1CeUxWoz+IIgaIlscsW9JyNz9wvDMQMdNaRiY/Zj
         EqFqEAxox0q3jTPw7w5tu5EIbuCkrED05wcQCHB3jLXfzb8ddhxnpymNnsvD6tCgrKbb
         NpbA==
X-Gm-Message-State: AOAM530913iS3DoLfv1K+gCCRI++Oe6Mk7MzkjWisnqyOrjDrhlaWtdT
        SuojgJt/hXwZbczbi5ya7sRDzyHn74n0klykBRc=
X-Google-Smtp-Source: ABdhPJy99/FHT6zeXiAeW8pt9PlVxSQustzITSBwdPIStntc1HUQSuUCUDUljn+nyEC3jv0BNwyMPNZxyCKzoS4QiwE=
X-Received: by 2002:a0c:f109:: with SMTP id i9mr18665621qvl.154.1593030799673;
 Wed, 24 Jun 2020 13:33:19 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:31:50 -0700
In-Reply-To: <20200624203200.78870-1-samitolvanen@google.com>
Message-Id: <20200624203200.78870-13-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 12/22] modpost: lto: strip .lto from module names
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>,
        Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With LTO, everything is compiled into LLVM bitcode, so we have to link
each module into native code before modpost. Kbuild uses the .lto.o
suffix for these files, which also ends up in module information. This
change strips the unnecessary .lto suffix from the module name.

Suggested-by: Bill Wendling <morbo@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/mod/modpost.c    | 16 +++++++---------
 scripts/mod/modpost.h    |  9 +++++++++
 scripts/mod/sumversion.c |  6 +++++-
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 6aea65c65745..8352f8a1a138 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -17,7 +17,6 @@
 #include <ctype.h>
 #include <string.h>
 #include <limits.h>
-#include <stdbool.h>
 #include <errno.h>
 #include "modpost.h"
 #include "../../include/linux/license.h"
@@ -80,14 +79,6 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...)
 		exit(1);
 }
 
-static inline bool strends(const char *str, const char *postfix)
-{
-	if (strlen(str) < strlen(postfix))
-		return false;
-
-	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
-}
-
 void *do_nofail(void *ptr, const char *expr)
 {
 	if (!ptr)
@@ -1975,6 +1966,10 @@ static char *remove_dot(char *s)
 		size_t m = strspn(s + n + 1, "0123456789");
 		if (m && (s[n + m] == '.' || s[n + m] == 0))
 			s[n] = 0;
+
+		/* strip trailing .lto */
+		if (strends(s, ".lto"))
+			s[strlen(s) - 4] = '\0';
 	}
 	return s;
 }
@@ -1998,6 +1993,9 @@ static void read_symbols(const char *modname)
 		/* strip trailing .o */
 		tmp = NOFAIL(strdup(modname));
 		tmp[strlen(tmp) - 2] = '\0';
+		/* strip trailing .lto */
+		if (strends(tmp, ".lto"))
+			tmp[strlen(tmp) - 4] = '\0';
 		mod = new_module(tmp);
 		free(tmp);
 	}
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 3aa052722233..fab30d201f9e 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -2,6 +2,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <stdarg.h>
+#include <stdbool.h>
 #include <string.h>
 #include <sys/types.h>
 #include <sys/stat.h>
@@ -180,6 +181,14 @@ static inline unsigned int get_secindex(const struct elf_info *info,
 	return info->symtab_shndx_start[sym - info->symtab_start];
 }
 
+static inline bool strends(const char *str, const char *postfix)
+{
+	if (strlen(str) < strlen(postfix))
+		return false;
+
+	return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
+}
+
 /* file2alias.c */
 extern unsigned int cross_build;
 void handle_moddevtable(struct module *mod, struct elf_info *info,
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index d587f40f1117..760e6baa7eda 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -391,10 +391,14 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	struct md4_ctx md;
 	char *fname;
 	char filelist[PATH_MAX + 1];
+	int postfix_len = 1;
+
+	if (strends(modname, ".lto.o"))
+		postfix_len = 5;
 
 	/* objects for a module are listed in the first line of *.mod file. */
 	snprintf(filelist, sizeof(filelist), "%.*smod",
-		 (int)strlen(modname) - 1, modname);
+		 (int)strlen(modname) - postfix_len, modname);
 
 	buf = read_text_file(filelist);
 
-- 
2.27.0.212.ge8ba1cc988-goog

