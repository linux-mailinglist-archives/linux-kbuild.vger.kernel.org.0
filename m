Return-Path: <linux-kbuild+bounces-3472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D1970789
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 14:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264101F2124F
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 12:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95BE165EF7;
	Sun,  8 Sep 2024 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cM2cxsWN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F45515F3F3;
	Sun,  8 Sep 2024 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799445; cv=none; b=asfO3rCf52tidueGbt5O68/sJWIiZt0HITROg7NfM8TX43h5PkhCjer7jqj7SoIxsu3Fjp+biWQYq5Mgp7OvFYNGv8bdlRUjqGh3jmPkbsOQP7NADqywZLDwwUY+Zn5K+80XiUcTnB1WQUKtu3pqT4dHm2Ms99BHdy4tIOIRPQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799445; c=relaxed/simple;
	bh=SBTEtiyEiAxysFHy1lrokIISQuJXKcwSNQZjCTO0YD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gtHbg9Kdj8BWjGFhLMxMLGGdefqhPe5ttsLwnYykvKt+BY8XTYIlDMbwbNDJq8Q+spvkQaB9xonWYOwRxzKTwrb6SdZwlGN1aJRYROyjH9i8sHzLmpZtyEQ6U3pufpRJtgT+RSHmFnCun1i6hJdCsNynQ3+SWfw80WHFPEtbcRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cM2cxsWN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AE7C4CEC3;
	Sun,  8 Sep 2024 12:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725799445;
	bh=SBTEtiyEiAxysFHy1lrokIISQuJXKcwSNQZjCTO0YD4=;
	h=From:To:Cc:Subject:Date:From;
	b=cM2cxsWNoRdZ/wHMTeQVqrnIS5Xc0vPdEt3ePe52bgRLWu4FfMF/fsM5bwkj4C+7+
	 9qNfPofIKKTsWmi9RxXbGcyJxCl+0+QtvQLcnciYx22jdYnA3vot1C98Fhf59oep7a
	 idX/1++Ajto/BWnnH6h27fAd7nEXUewg9zM4D2EZdXSqVUa7ypexJkpqVEuK6pWNaw
	 j0mzmQr4zpi0nH3sNvJzVKUxF4lAxn2UGOJuKkjY2wjLrfiCbH5PGya/TSKUJxNu+V
	 3YoNkFZDxUOBl5LuhKB1Ti4W4pRIxmVPYEgfdWnosMRoMGBU38OfLjz1f+SnsQb1Te
	 Qzy6zxRjKG5yA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/6] scripts: move hash function from scripts/kconfig/ to scripts/include/
Date: Sun,  8 Sep 2024 21:43:16 +0900
Message-ID: <20240908124352.1828890-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function was originally added by commit 8af27e1dc4e4 ("fixdep: use
hash table instead of a single array").

Move it to scripts/include/ so that other host programs can use it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/include/hash.h   | 15 +++++++++++++++
 scripts/kconfig/lkc.h    |  1 -
 scripts/kconfig/symbol.c |  5 +++--
 scripts/kconfig/util.c   | 13 ++-----------
 4 files changed, 20 insertions(+), 14 deletions(-)
 create mode 100644 scripts/include/hash.h

diff --git a/scripts/include/hash.h b/scripts/include/hash.h
new file mode 100644
index 000000000000..ce2bc43b308b
--- /dev/null
+++ b/scripts/include/hash.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef HASH_H
+#define HASH_H
+
+static inline unsigned int hash_str(const char *s)
+{
+	/* fnv32 hash */
+	unsigned int hash = 2166136261U;
+
+	for (; *s; s++)
+		hash = (hash ^ *s) * 0x01000193;
+	return hash;
+}
+
+#endif /* HASH_H */
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index ddfb2b1cb737..b8ebc3094a23 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -51,7 +51,6 @@ static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 }
 
 /* util.c */
-unsigned int strhash(const char *s);
 const char *file_lookup(const char *name);
 
 /* lexer.l */
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 6793f016af5e..6243f0143ecf 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -9,6 +9,7 @@
 #include <string.h>
 #include <regex.h>
 
+#include <hash.h>
 #include <xalloc.h>
 #include "internal.h"
 #include "lkc.h"
@@ -893,7 +894,7 @@ struct symbol *sym_lookup(const char *name, int flags)
 			case 'n': return &symbol_no;
 			}
 		}
-		hash = strhash(name);
+		hash = hash_str(name);
 
 		hash_for_each_possible(sym_hashtable, symbol, node, hash) {
 			if (symbol->name &&
@@ -936,7 +937,7 @@ struct symbol *sym_find(const char *name)
 		case 'n': return &symbol_no;
 		}
 	}
-	hash = strhash(name);
+	hash = hash_str(name);
 
 	hash_for_each_possible(sym_hashtable, symbol, node, hash) {
 		if (symbol->name &&
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 50698fff5b9d..5cdcee144b58 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -8,20 +8,11 @@
 #include <stdlib.h>
 #include <string.h>
 
+#include <hash.h>
 #include <hashtable.h>
 #include <xalloc.h>
 #include "lkc.h"
 
-unsigned int strhash(const char *s)
-{
-	/* fnv32 hash */
-	unsigned int hash = 2166136261U;
-
-	for (; *s; s++)
-		hash = (hash ^ *s) * 0x01000193;
-	return hash;
-}
-
 /* hash table of all parsed Kconfig files */
 static HASHTABLE_DEFINE(file_hashtable, 1U << 11);
 
@@ -35,7 +26,7 @@ const char *file_lookup(const char *name)
 {
 	struct file *file;
 	size_t len;
-	int hash = strhash(name);
+	int hash = hash_str(name);
 
 	hash_for_each_possible(file_hashtable, file, node, hash)
 		if (!strcmp(name, file->name))
-- 
2.43.0


