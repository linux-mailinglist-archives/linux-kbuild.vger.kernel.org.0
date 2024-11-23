Return-Path: <linux-kbuild+bounces-4821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4C9D682F
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 09:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28F4B281CE3
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 08:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3948916EBE9;
	Sat, 23 Nov 2024 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjLR4ZzV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114C22309A9;
	Sat, 23 Nov 2024 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732350988; cv=none; b=RBBtd8rxdOu8O9w6w73eVTj9cYmCyBvUAoBZDN6n1rA7PO8c13hgqOs9PKYg9u2m1Nvu9NHMUDyALFOm4SqNKKlrrbpBvmpZkMllvXtgjlpTtGRdOUxu/B/Q1KtEdRyDSuuu6edgxvd/8AbleYZndtRwMayXgK/tkSqnThD0Vsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732350988; c=relaxed/simple;
	bh=vCbbUDU7YR5rexB85RZdHO0TXSgA9XOay8yeEWw+d84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5E0eQUIOqhrvsXEN9AgyiIPRY2g8U6hd0aarzgove+WaIQ2a4aWjfGbd6dwXBXKVGKk2ibU0z4Njz/OaBldRJLusQDTW5nnKmDFzFtg1fpUsM+RQI9eRXAhMucl9glexzRy3Pe8Bw+xypsuE8jO6ZYcU3g4zT518sQLWpCXg4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjLR4ZzV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B50C4CECD;
	Sat, 23 Nov 2024 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732350985;
	bh=vCbbUDU7YR5rexB85RZdHO0TXSgA9XOay8yeEWw+d84=;
	h=From:To:Cc:Subject:Date:From;
	b=YjLR4ZzVxTPIzbtu1h2wqZeIuBzkIGsrldIOIKcUO5JVjdIwg4N7hcdiIFZWzz3Xi
	 vFhIp8GX6beMIC7FgUgVN0GIILQom5Z1m/i9pjllf8Ik/rX5kDxJE6ftPCFNiaeCSn
	 Lm2eY+X+oR3fA9G6znkKfFbh4BVR+lgVVv18Gy0NmDgmpirDU9XZNsxFHfl/DrwXFh
	 0FNPCT7bGSl1S+wWc9Y29XGtm2i/R7f7mZsnpro0J2qkBnUWVniP+4VRAb9PhMAklo
	 AiiEVXtZu+J2NJdXpP0BVD+jm+c0ukiMoeJHdg7mnTmpESRyROiYpd5lnY7A2uTrBV
	 MHL72Jwu4JYIg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: replace tdb_hash() with hash_str()
Date: Sat, 23 Nov 2024 17:36:08 +0900
Message-ID: <20241123083609.29811-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a helper available in scripts/include/hash.h.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 3bbd5efcf3f3..0584cbcdbd2d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -21,6 +21,7 @@
 #include <stdbool.h>
 #include <errno.h>
 
+#include <hash.h>
 #include <hashtable.h>
 #include <list.h>
 #include <xalloc.h>
@@ -210,19 +211,6 @@ struct symbol {
 
 static HASHTABLE_DEFINE(symbol_hashtable, 1U << 10);
 
-/* This is based on the hash algorithm from gdbm, via tdb */
-static inline unsigned int tdb_hash(const char *name)
-{
-	unsigned value;	/* Used to compute the hash value.  */
-	unsigned   i;	/* Used to cycle through random values. */
-
-	/* Set the initial value from the key size. */
-	for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
-		value = (value + (((unsigned char *)name)[i] << (i*5 % 24)));
-
-	return (1103515243 * value + 12345);
-}
-
 /**
  * Allocate a new symbols for use in the hash of exported symbols or
  * the list of unresolved symbols per module
@@ -240,7 +228,7 @@ static struct symbol *alloc_symbol(const char *name)
 /* For the hash of exported symbols */
 static void hash_add_symbol(struct symbol *sym)
 {
-	hash_add(symbol_hashtable, &sym->hnode, tdb_hash(sym->name));
+	hash_add(symbol_hashtable, &sym->hnode, hash_str(sym->name));
 }
 
 static void sym_add_unresolved(const char *name, struct module *mod, bool weak)
@@ -261,7 +249,7 @@ static struct symbol *sym_find_with_module(const char *name, struct module *mod)
 	if (name[0] == '.')
 		name++;
 
-	hash_for_each_possible(symbol_hashtable, s, hnode, tdb_hash(name)) {
+	hash_for_each_possible(symbol_hashtable, s, hnode, hash_str(name)) {
 		if (strcmp(s->name, name) == 0 && (!mod || s->module == mod))
 			return s;
 	}
-- 
2.43.0


