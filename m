Return-Path: <linux-kbuild+bounces-789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A398473E5
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 17:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EFAB291FD1
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Feb 2024 16:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8FA14A0B1;
	Fri,  2 Feb 2024 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M43/Ok1/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55A14A0AB;
	Fri,  2 Feb 2024 15:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706889519; cv=none; b=JEJTQAqbeePQQDES1nGgrr55vwOz+047CdiSkyCqqKyM6dkQGTa0MBeui+wLicsJTnlgdvkfw1cpmBNBo7ettQc2cIRn3UQaoyiQATcKzgWAZDNBoxk2SKdPGYZRQuSN30RkUD2iT7blAv0eqmHLqmC/zSSDQ1r5J8XdGFjCtLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706889519; c=relaxed/simple;
	bh=6fgo0sRjNFgx+31jjBB4hfJzesvi3QurT2SN9+UQZOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZgrIK0BBf1wdfNKG+0qspwYpos49k23xKJxK38cXpcDlcilBzVnnxHVIQbib3appwI1IkfHBDa28XheiZS53tydQ4TBTRUHVRZoZD+U3CmBKqy0izU58yjfNzWXLYiZjyz5kIHrFlQf/7INsjNbNNkjdZdJHZPPad0k02M6rAPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M43/Ok1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA29C433C7;
	Fri,  2 Feb 2024 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706889519;
	bh=6fgo0sRjNFgx+31jjBB4hfJzesvi3QurT2SN9+UQZOc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M43/Ok1/EiL895vytxYLJICTMw4tmYih6gGNoN69mxCxzVNpA6pNFX1yIxYTv8AV3
	 CuINhA4h/5ghM8yLCdurI9dqa9wXeR/ATg8CMBFoYnHkQkCHbQHCQbp3FJqdI9aTkV
	 tAWPnJAFNDTNA0VdPTf3knNglwkR3axa6PQMcXCLkv6RNEaKym4ATEjupRa+yKdTxv
	 IljyEMvCDvsPN1FoG4w8JklfWerggQiNk51ykC4cbGrmwT+Q+gSiJh9DMbFqw8FNf/
	 90O9NnmcTQLZcR5ye35mjXIhS9IgTbjepWMcBmHqZC/bhlr2nJ0ah1nC/cRv6/PUxl
	 QTN+OBYS9ZYJA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 08/27] kconfig: split preprocessor prototypes into preprocess.h
Date: Sat,  3 Feb 2024 00:58:06 +0900
Message-Id: <20240202155825.314567-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240202155825.314567-1-masahiroy@kernel.org>
References: <20240202155825.314567-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are needed only for the parse stage. Move the prototypes into
a separate header to make sure they are not used after that.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lexer.l      |  2 ++
 scripts/kconfig/lkc_proto.h  | 13 -------------
 scripts/kconfig/parser.y     |  1 +
 scripts/kconfig/preprocess.c |  1 +
 scripts/kconfig/preprocess.h | 19 +++++++++++++++++++
 5 files changed, 23 insertions(+), 13 deletions(-)
 create mode 100644 scripts/kconfig/preprocess.h

diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 5f1bc3320307..1bb372868ecf 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -14,6 +14,8 @@
 #include <string.h>
 
 #include "lkc.h"
+#include "preprocess.h"
+
 #include "parser.tab.h"
 
 #define YY_DECL		static int yylex1(void)
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 85491d74a094..94299e42402f 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -40,19 +40,6 @@ const char * sym_get_string_value(struct symbol *sym);
 
 const char * prop_get_type_name(enum prop_type type);
 
-/* preprocess.c */
-enum variable_flavor {
-	VAR_SIMPLE,
-	VAR_RECURSIVE,
-	VAR_APPEND,
-};
-void env_write_dep(struct gstr *gs);
-void variable_add(const char *name, const char *value,
-		  enum variable_flavor flavor);
-void variable_all_del(void);
-char *expand_dollar(const char **str);
-char *expand_one_token(const char **str);
-
 /* expr.c */
 void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken);
 
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index cfb82ba09037..ff68def09a2b 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -13,6 +13,7 @@
 
 #include "lkc.h"
 #include "internal.h"
+#include "preprocess.h"
 
 #define printd(mask, fmt...) if (cdebug & (mask)) printf(fmt)
 
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index b9853d4a891c..12665b981c3e 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -11,6 +11,7 @@
 
 #include "list.h"
 #include "lkc.h"
+#include "preprocess.h"
 
 #define ARRAY_SIZE(arr)		(sizeof(arr) / sizeof((arr)[0]))
 
diff --git a/scripts/kconfig/preprocess.h b/scripts/kconfig/preprocess.h
new file mode 100644
index 000000000000..a7e4a550638c
--- /dev/null
+++ b/scripts/kconfig/preprocess.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef PREPROCESS_H
+#define PREPROCESS_H
+
+enum variable_flavor {
+	VAR_SIMPLE,
+	VAR_RECURSIVE,
+	VAR_APPEND,
+};
+
+struct gstr;
+void env_write_dep(struct gstr *gs);
+void variable_add(const char *name, const char *value,
+		  enum variable_flavor flavor);
+void variable_all_del(void);
+char *expand_dollar(const char **str);
+char *expand_one_token(const char **str);
+
+#endif /* PREPROCESS_H */
-- 
2.40.1


