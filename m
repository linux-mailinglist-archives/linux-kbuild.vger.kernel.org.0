Return-Path: <linux-kbuild+bounces-2949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEA94ED54
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 14:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DFFE1F2339C
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 12:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D1F17B505;
	Mon, 12 Aug 2024 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ha1Ykl0Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E717B4F6;
	Mon, 12 Aug 2024 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466943; cv=none; b=dygEVxoarvQpp4UCVLkBXF5rgPbbCMjGLkoHs42qo4aQuhWatJERJqkXcvDEoCTpJedOGzZL2G5z8Vq2bIM6VI2P2vfs/Ano2MrRTkYjaIRcBMsrrFb3hotzlC8kFtCFr4gIN3GZ71mCUy2djL9LPcNmwMl73XzAqm7neK+U0OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466943; c=relaxed/simple;
	bh=Ye4kmdG3MnrVhtoYZ45dT1ihmCJkAh8t9Hvkm/sofMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAxaWYlBrVLUjvuX6V07yNyRIkPWATNdXoexqkUcyqCrDtumLer/WJVSQfuEm6FbIliabE+Iat4rKgrGaY5kZTN3U3Brh8KYI8Xbz0sesWIa4E2vZZgdmzbfoH9BO1IqaCbKczmDr8V3IRb0S2gGRE0q3FR0UQ4doHgGcy1WfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ha1Ykl0Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1EDC32782;
	Mon, 12 Aug 2024 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723466943;
	bh=Ye4kmdG3MnrVhtoYZ45dT1ihmCJkAh8t9Hvkm/sofMg=;
	h=From:To:Cc:Subject:Date:From;
	b=ha1Ykl0Q4b9T6NSxJnTl+rSYtuogmkW7D+tBb8db7inzMscEo6X22R0LeaoEZwBmx
	 SsoW6OmTdoFIxwQiOWk1iIPNCeBiZo2uIQpNMPY48b78KG3uBU5XGnv2JkpI1eXvtk
	 hUz7EV5tvdI4E5AdlogRXjL+RUgSTj/Y7VtBtnvm4N0OTBjWf7ZYb1As4zh9tMncMy
	 fm+qdLa9pOtR1ovr+kd7KLP1pa4QkAX22dwxhicyqnKQ8xUj6uAmeRmXsNw9ZY2Vex
	 ITDS9wHDkFuCAc/UDyG9OSRRV3yTzG/tJLXYLOUEJIurwP6QMDO5z6bGS1glthHqzg
	 oUH2mRlm0oXwQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/4] kbuild: split x*alloc() functions in kconfig to scripts/include/xalloc.h
Date: Mon, 12 Aug 2024 21:48:50 +0900
Message-ID: <20240812124858.2107328-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions will be useful for other host programs.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/include/xalloc.h     | 53 ++++++++++++++++++++++++++++++++++++
 scripts/kconfig/confdata.c   |  1 +
 scripts/kconfig/expr.c       |  1 +
 scripts/kconfig/lexer.l      |  1 +
 scripts/kconfig/lkc.h        |  5 ----
 scripts/kconfig/mconf.c      |  1 +
 scripts/kconfig/menu.c       |  1 +
 scripts/kconfig/nconf.c      |  1 +
 scripts/kconfig/nconf.gui.c  |  1 +
 scripts/kconfig/parser.y     |  1 +
 scripts/kconfig/preprocess.c |  1 +
 scripts/kconfig/qconf.cc     |  1 +
 scripts/kconfig/symbol.c     |  1 +
 scripts/kconfig/util.c       | 50 +---------------------------------
 14 files changed, 65 insertions(+), 54 deletions(-)
 create mode 100644 scripts/include/xalloc.h

diff --git a/scripts/include/xalloc.h b/scripts/include/xalloc.h
new file mode 100644
index 000000000000..cdadb07d0592
--- /dev/null
+++ b/scripts/include/xalloc.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XALLOC_H
+#define XALLOC_H
+
+#include <stdlib.h>
+#include <string.h>
+
+static inline void *xmalloc(size_t size)
+{
+	void *p = malloc(size);
+
+	if (!p)
+		exit(1);
+	return p;
+}
+
+static inline void *xcalloc(size_t nmemb, size_t size)
+{
+	void *p = calloc(nmemb, size);
+
+	if (!p)
+		exit(1);
+	return p;
+}
+
+static inline void *xrealloc(void *p, size_t size)
+{
+	p = realloc(p, size);
+	if (!p)
+		exit(1);
+	return p;
+}
+
+static inline char *xstrdup(const char *s)
+{
+	char *p = strdup(s);
+
+	if (!p)
+		exit(1);
+	return p;
+}
+
+static inline char *xstrndup(const char *s, size_t n)
+{
+	char *p = strndup(s, n);
+
+	if (!p)
+		exit(1);
+	return p;
+}
+
+#endif /* XALLOC_H */
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 76193ce5a792..d8849dfb06db 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -18,6 +18,7 @@
 #include <time.h>
 #include <unistd.h>
 
+#include <xalloc.h>
 #include "internal.h"
 #include "lkc.h"
 
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index c349da7fe3f8..a16451347f63 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -9,6 +9,7 @@
 #include <stdlib.h>
 #include <string.h>
 
+#include <xalloc.h>
 #include "lkc.h"
 
 #define DEBUG_EXPR	0
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 8dd597c4710d..9c2cdfc33c6f 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -13,6 +13,7 @@
 #include <stdlib.h>
 #include <string.h>
 
+#include <xalloc.h>
 #include "lkc.h"
 #include "preprocess.h"
 
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 401bdf36323a..ddfb2b1cb737 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -53,11 +53,6 @@ static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 /* util.c */
 unsigned int strhash(const char *s);
 const char *file_lookup(const char *name);
-void *xmalloc(size_t size);
-void *xcalloc(size_t nmemb, size_t size);
-void *xrealloc(void *p, size_t size);
-char *xstrdup(const char *s);
-char *xstrndup(const char *s, size_t n);
 
 /* lexer.l */
 int yylex(void);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 3887eac75289..84ea9215c0a7 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -20,6 +20,7 @@
 #include <unistd.h>
 
 #include <list.h>
+#include <xalloc.h>
 #include "lkc.h"
 #include "lxdialog/dialog.h"
 #include "mnconf-common.h"
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 323cc0b62be6..dbf3b49eb0fb 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -9,6 +9,7 @@
 #include <string.h>
 
 #include <list.h>
+#include <xalloc.h>
 #include "lkc.h"
 #include "internal.h"
 
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index b91ca47e9e9a..063b4f7ccbdb 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 
 #include <list.h>
+#include <xalloc.h>
 #include "lkc.h"
 #include "mnconf-common.h"
 #include "nconf.h"
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 25a7263ef3c8..72b605efe549 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -4,6 +4,7 @@
  *
  * Derived from menuconfig.
  */
+#include <xalloc.h>
 #include "nconf.h"
 #include "lkc.h"
 
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 61900feb4254..212e496ce9e2 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -11,6 +11,7 @@
 #include <string.h>
 #include <stdbool.h>
 
+#include <xalloc.h>
 #include "lkc.h"
 #include "internal.h"
 #include "preprocess.h"
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 67d1fb95c491..783abcaa5cc5 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -11,6 +11,7 @@
 
 #include <array_size.h>
 #include <list.h>
+#include <xalloc.h>
 #include "internal.h"
 #include "lkc.h"
 #include "preprocess.h"
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 7d239c032b3d..379768699b57 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -22,6 +22,7 @@
 
 #include <stdlib.h>
 
+#include <xalloc.h>
 #include "lkc.h"
 #include "qconf.h"
 
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 71502abd3b12..55c9eb30c006 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -9,6 +9,7 @@
 #include <string.h>
 #include <regex.h>
 
+#include <xalloc.h>
 #include "internal.h"
 #include "lkc.h"
 
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 696ff477671e..50698fff5b9d 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -9,6 +9,7 @@
 #include <string.h>
 
 #include <hashtable.h>
+#include <xalloc.h>
 #include "lkc.h"
 
 unsigned int strhash(const char *s)
@@ -102,52 +103,3 @@ char *str_get(const struct gstr *gs)
 {
 	return gs->s;
 }
-
-void *xmalloc(size_t size)
-{
-	void *p = malloc(size);
-	if (p)
-		return p;
-	fprintf(stderr, "Out of memory.\n");
-	exit(1);
-}
-
-void *xcalloc(size_t nmemb, size_t size)
-{
-	void *p = calloc(nmemb, size);
-	if (p)
-		return p;
-	fprintf(stderr, "Out of memory.\n");
-	exit(1);
-}
-
-void *xrealloc(void *p, size_t size)
-{
-	p = realloc(p, size);
-	if (p)
-		return p;
-	fprintf(stderr, "Out of memory.\n");
-	exit(1);
-}
-
-char *xstrdup(const char *s)
-{
-	char *p;
-
-	p = strdup(s);
-	if (p)
-		return p;
-	fprintf(stderr, "Out of memory.\n");
-	exit(1);
-}
-
-char *xstrndup(const char *s, size_t n)
-{
-	char *p;
-
-	p = strndup(s, n);
-	if (p)
-		return p;
-	fprintf(stderr, "Out of memory.\n");
-	exit(1);
-}
-- 
2.43.0


