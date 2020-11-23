Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7D52C0276
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 10:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgKWJpi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 04:45:38 -0500
Received: from codesynthesis.com ([188.40.148.39]:49824 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgKWJpi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 04:45:38 -0500
X-Greylist: delayed 434 seconds by postgrey-1.27 at vger.kernel.org; Mon, 23 Nov 2020 04:45:37 EST
Received: from brak.codesynthesis.com (unknown [105.226.15.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id A01595F6E0;
        Mon, 23 Nov 2020 09:38:22 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id E42DF1A800C5; Mon, 23 Nov 2020 11:38:18 +0200 (SAST)
Date:   Mon, 23 Nov 2020 11:38:18 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: [PATCH v2 2/2] kconfig: clean up header inclusion
Message-ID: <boris.20201123113332@codesynthesis.com>
References: <20201029155152.2467-1-boris@codesynthesis.com>
 <20201029155152.2467-3-boris@codesynthesis.com>
 <CAK7LNARRfK7LFrmJdMj4n77rb6pBYY=gXNLkfoSjk=pBJkg79w@mail.gmail.com>
 <boris.20201102162336@codesynthesis.com>
 <CAK7LNAR4jxyOpGYspNUK==-pcdpMLkwv7_ejOO500RwfqAqL=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR4jxyOpGYspNUK==-pcdpMLkwv7_ejOO500RwfqAqL=w@mail.gmail.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

- Add missing includes.
- Remove no longer necessary includes.
---

v2: Don't re-arrange includes.

 scripts/kconfig/conf.c     | 1 -
 scripts/kconfig/confdata.c | 1 +
 scripts/kconfig/lexer.l    | 1 -
 scripts/kconfig/symbol.c   | 2 +-
 4 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index f6e548b..db03e2f 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -11,7 +11,6 @@
 #include <time.h>
 #include <unistd.h>
 #include <getopt.h>
-#include <sys/stat.h>
 #include <sys/time.h>
 #include <errno.h>
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index a39d93e..2568dbe 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -5,6 +5,7 @@
 
 #include <sys/mman.h>
 #include <sys/stat.h>
+#include <sys/types.h>
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
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
index ffa3ec6..fe38e6f 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -3,11 +3,11 @@
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
  */
 
+#include <sys/types.h>
 #include <ctype.h>
 #include <stdlib.h>
 #include <string.h>
 #include <regex.h>
-#include <sys/utsname.h>
 
 #include "lkc.h"
 
-- 
2.29.0

