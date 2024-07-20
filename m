Return-Path: <linux-kbuild+bounces-2599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA4937FB1
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 09:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29E841F214C1
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 07:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FFA25601;
	Sat, 20 Jul 2024 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTq6dyfa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F78522F17;
	Sat, 20 Jul 2024 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721460512; cv=none; b=XWdc83ECxvsS08yWV+YDdB0FFfCp3IHROuQkpUc4WGPk4P7grFLXX16K11T98zHpu4qvAckFp8cbqS7JrmCUme1gjiAi6k4FZFfhARHUCRwX86nCGjPLomzvp1F7DR3CzfIGkbTPpgpnWLl/aA+Ad21Ypr18AYIF9fbU1WpQOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721460512; c=relaxed/simple;
	bh=L+ngnlusEBe7BwFkIELqCvUVqWJzBxAP2qHtqLxrJaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hp3lZ+ctQG5622iCBVvSFZX19v+DhJuPw9fFHsFcaDtWmYoyOSarvi4sWcBhwMoWvXInSejHQkTXR8UjBXs+g7GdUwHmbUr2XCf8EW5YEWATbL6NLyeUC5wTFWgDoZlK8+gkNkIHFyhqrIvbancDCju1G3j7RdJJ0I9dGlvjb98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTq6dyfa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8D4C4AF09;
	Sat, 20 Jul 2024 07:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721460512;
	bh=L+ngnlusEBe7BwFkIELqCvUVqWJzBxAP2qHtqLxrJaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gTq6dyfaGFiTcZ1ArDYXZDuEZ93y3Gk2iEzWTz0IOFZjBcaY2D+iPwrU98nYNan9v
	 o5HLFLJ7SNhLzDOsYXQbV2EDvr6YZM9uRgD7DkfpkMzeXIhpYpwW8YQ5eBx6PjFhji
	 XZE18bc887k9mg63QTxC79TK1DNKNRli/1ejADOEz+IsJ3Bx6wnW814Sx9AhbLaH1R
	 J03lIab96qFGfiIM5CZ2rGUOte9KBiOvG8yFqwN2cvNpH0TWdyztcAMNdRN1uh4uCP
	 0T52x5C/Lp76LJVZi6htSfod1yvxxmgllFwfx913R8U9fmvsxciGcKvLOULOT+wZ2U
	 YaFqmFUUl+QFg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/2] modpost: use generic macros for hash table implementation
Date: Sat, 20 Jul 2024 16:27:39 +0900
Message-ID: <20240720072750.2840541-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720072750.2840541-1-masahiroy@kernel.org>
References: <20240720072750.2840541-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use macros provided by hashtable.h

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 9eade18b4388..b78d93919712 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -21,6 +21,7 @@
 #include <stdbool.h>
 #include <errno.h>
 
+#include <hashtable.h>
 #include <list.h>
 #include "modpost.h"
 #include "../../include/linux/license.h"
@@ -201,13 +202,8 @@ static struct module *new_module(const char *name, size_t namelen)
 	return mod;
 }
 
-/* A hash of all exported symbols,
- * struct symbol is also used for lists of unresolved symbols */
-
-#define SYMBOL_HASH_SIZE 1024
-
 struct symbol {
-	struct symbol *next;
+	struct hlist_node hnode;/* link to hash table */
 	struct list_head list;	/* link to module::exported_symbols or module::unresolved_symbols */
 	struct module *module;
 	char *namespace;
@@ -220,7 +216,7 @@ struct symbol {
 	char name[];
 };
 
-static struct symbol *symbolhash[SYMBOL_HASH_SIZE];
+static HASHTABLE_DEFINE(symbol_hashtable, 1U << 10);
 
 /* This is based on the hash algorithm from gdbm, via tdb */
 static inline unsigned int tdb_hash(const char *name)
@@ -252,11 +248,7 @@ static struct symbol *alloc_symbol(const char *name)
 /* For the hash of exported symbols */
 static void hash_add_symbol(struct symbol *sym)
 {
-	unsigned int hash;
-
-	hash = tdb_hash(sym->name) % SYMBOL_HASH_SIZE;
-	sym->next = symbolhash[hash];
-	symbolhash[hash] = sym;
+	hash_add(symbol_hashtable, &sym->hnode, tdb_hash(sym->name));
 }
 
 static void sym_add_unresolved(const char *name, struct module *mod, bool weak)
@@ -277,7 +269,7 @@ static struct symbol *sym_find_with_module(const char *name, struct module *mod)
 	if (name[0] == '.')
 		name++;
 
-	for (s = symbolhash[tdb_hash(name) % SYMBOL_HASH_SIZE]; s; s = s->next) {
+	hash_for_each_possible(symbol_hashtable, s, hnode, tdb_hash(name)) {
 		if (strcmp(s->name, name) == 0 && (!mod || s->module == mod))
 			return s;
 	}
-- 
2.43.0


