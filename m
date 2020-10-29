Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1282129F092
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 16:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgJ2Pww (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 11:52:52 -0400
Received: from codesynthesis.com ([142.44.161.217]:46810 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbgJ2Pww (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 11:52:52 -0400
Received: from brak.codesynthesis.com (unknown [105.184.207.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id DABF55F6C4;
        Thu, 29 Oct 2020 15:52:50 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 456981A800C4; Thu, 29 Oct 2020 17:52:47 +0200 (SAST)
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>, linux-kbuild@vger.kernel.org,
        Boris Kolpackov <boris@codesynthesis.com>
Subject: [PATCH 2/2] kconfig: clean up header inclusion
Date:   Thu, 29 Oct 2020 17:51:52 +0200
Message-Id: <20201029155152.2467-3-boris@codesynthesis.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029155152.2467-1-boris@codesynthesis.com>
References: <20201029155152.2467-1-boris@codesynthesis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

- Add missing includes.
- Remove no longer necessary includes.
- Separate non-portable header includes for easier porting.

Signed-off-by: Boris Kolpackov <boris@codesynthesis.com>
---
 scripts/kconfig/conf.c     | 6 +++---
 scripts/kconfig/confdata.c | 4 +++-
 scripts/kconfig/lexer.l    | 1 -
 scripts/kconfig/symbol.c   | 3 ++-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index f6e548b..74974df 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -9,12 +9,12 @@
 #include <stdlib.h>
 #include <string.h>
 #include <time.h>
-#include <unistd.h>
 #include <getopt.h>
-#include <sys/stat.h>
-#include <sys/time.h>
 #include <errno.h>
 
+#include <unistd.h>
+#include <sys/time.h>
+
 #include "lkc.h"
 
 static void conf(struct menu *menu);
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index a39d93e..64344b9 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  */
 
-#include <sys/mman.h>
+#include <sys/types.h>
 #include <sys/stat.h>
 #include <ctype.h>
 #include <errno.h>
@@ -14,7 +14,9 @@
 #include <stdlib.h>
 #include <string.h>
 #include <time.h>
+
 #include <unistd.h>
+#include <sys/mman.h>
 
 #include "lkc.h"
 
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 240109f..9c22cb5 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -12,7 +12,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <unistd.h>
 
 #include "lkc.h"
 #include "parser.tab.h"
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index ffa3ec6..0e0f1cc 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -6,8 +6,9 @@
 #include <ctype.h>
 #include <stdlib.h>
 #include <string.h>
+#include <sys/types.h> // off_t
+
 #include <regex.h>
-#include <sys/utsname.h>
 
 #include "lkc.h"
 
-- 
2.29.0

