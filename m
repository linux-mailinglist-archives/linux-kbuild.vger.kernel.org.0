Return-Path: <linux-kbuild+bounces-2950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2EA94ED56
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 14:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0959B1C21960
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 12:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFE917B51B;
	Mon, 12 Aug 2024 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVUL+Qb4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1131517B515;
	Mon, 12 Aug 2024 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466945; cv=none; b=ewMqQu5YR8tX+R7ZI/XWKw3H+C61qjs2eynE4+5MSAZxCxyVYn+5EZbcUcsZ2e2GbXquoMMcZLzwVOLKTzXjdUqFyVHhEfeE+/uir+oSZybEapn0v8Fqtb04pBXYPOf33aw56f6Mtw2gge1NeSy1H9ul8WPB+FsRBNPFII/fYg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466945; c=relaxed/simple;
	bh=BLXeB1ErP7FsWen/tkLkEVUKQQmwuds8LsOvl8m/2Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWMU9O5VTQK9oeEVk1GNv7zCdd1tZKGj3WY5gm0L8N9WKE/0p8Chb+8vy6q3SZrN+IUtp8y+F5z9bN2Z8lDGsi00edjZtfrILrsjnB5u2Rfll+vXXumwlNJo7YtqG4f6fnpNUsgaula5sChhuIk759m9POjQ66kGDgHt4UZfIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVUL+Qb4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADCDC4AF0D;
	Mon, 12 Aug 2024 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723466944;
	bh=BLXeB1ErP7FsWen/tkLkEVUKQQmwuds8LsOvl8m/2Cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NVUL+Qb4KMCiXslu95Q/rdtjTeZUG6VSZzUJkiH4qZAlV40jp390RcevE4fJ+PdBg
	 08zcPp1yfdO2OxY4lc5yIcItMgYFWuY6XLcQ+orDdspBsoMSni3PAclELRYBPv1wn0
	 keIv4kXCwBMet3PMC9rQb1xbfh6Xcno+hKx2uf20KqlUPFDlRDYR8nOpMOvc9dTSm2
	 XoaElTqFyBeRBn/moRsdMrS73IJc8oWZsJk2mThFe5BkUFcvITn+IJvfgfCEuYsfpV
	 VH6uh0TgWecgF5Qn88O1dHH5nG3qgqVPJ1qWXivotsakdYZ4/LWP2kG0wTxoSmH8si
	 wrZ1F9SEuL2GQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/4] modpost: replace the use of NOFAIL() with xmalloc() etc.
Date: Mon, 12 Aug 2024 21:48:51 +0900
Message-ID: <20240812124858.2107328-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812124858.2107328-1-masahiroy@kernel.org>
References: <20240812124858.2107328-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I think x*alloc() functions are cleaner.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c    | 20 ++++++++++----------
 scripts/mod/modpost.h    |  2 --
 scripts/mod/sumversion.c |  6 ++++--
 scripts/mod/symsearch.c  |  6 +++---
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d16d0ace2775..dfcf14f7e960 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -23,6 +23,7 @@
 
 #include <hashtable.h>
 #include <list.h>
+#include <xalloc.h>
 #include "modpost.h"
 #include "../../include/linux/license.h"
 
@@ -120,7 +121,7 @@ char *read_text_file(const char *filename)
 		exit(1);
 	}
 
-	buf = NOFAIL(malloc(st.st_size + 1));
+	buf = xmalloc(st.st_size + 1);
 
 	nbytes = st.st_size;
 
@@ -178,7 +179,7 @@ static struct module *new_module(const char *name, size_t namelen)
 {
 	struct module *mod;
 
-	mod = NOFAIL(malloc(sizeof(*mod) + namelen + 1));
+	mod = xmalloc(sizeof(*mod) + namelen + 1);
 	memset(mod, 0, sizeof(*mod));
 
 	INIT_LIST_HEAD(&mod->exported_symbols);
@@ -237,7 +238,7 @@ static inline unsigned int tdb_hash(const char *name)
  **/
 static struct symbol *alloc_symbol(const char *name)
 {
-	struct symbol *s = NOFAIL(malloc(sizeof(*s) + strlen(name) + 1));
+	struct symbol *s = xmalloc(sizeof(*s) + strlen(name) + 1);
 
 	memset(s, 0, sizeof(*s));
 	strcpy(s->name, name);
@@ -310,8 +311,7 @@ static void add_namespace(struct list_head *head, const char *namespace)
 	struct namespace_list *ns_entry;
 
 	if (!contains_namespace(head, namespace)) {
-		ns_entry = NOFAIL(malloc(sizeof(*ns_entry) +
-					 strlen(namespace) + 1));
+		ns_entry = xmalloc(sizeof(*ns_entry) + strlen(namespace) + 1);
 		strcpy(ns_entry->namespace, namespace);
 		list_add_tail(&ns_entry->list, head);
 	}
@@ -366,7 +366,7 @@ static struct symbol *sym_add_exported(const char *name, struct module *mod,
 	s = alloc_symbol(name);
 	s->module = mod;
 	s->is_gpl_only = gpl_only;
-	s->namespace = NOFAIL(strdup(namespace));
+	s->namespace = xstrdup(namespace);
 	list_add_tail(&s->list, &mod->exported_symbols);
 	hash_add_symbol(s);
 
@@ -622,7 +622,7 @@ static void handle_symbol(struct module *mod, struct elf_info *info,
 			if (ELF_ST_TYPE(sym->st_info) == STT_SPARC_REGISTER)
 				break;
 			if (symname[0] == '.') {
-				char *munged = NOFAIL(strdup(symname));
+				char *munged = xstrdup(symname);
 				munged[0] = '_';
 				munged[1] = toupper(munged[1]);
 				symname = munged;
@@ -1662,7 +1662,7 @@ void buf_write(struct buffer *buf, const char *s, int len)
 {
 	if (buf->size - buf->pos < len) {
 		buf->size += len + SZ;
-		buf->p = NOFAIL(realloc(buf->p, buf->size));
+		buf->p = xrealloc(buf->p, buf->size);
 	}
 	strncpy(buf->p + buf->pos, s, len);
 	buf->pos += len;
@@ -1947,7 +1947,7 @@ static void write_if_changed(struct buffer *b, const char *fname)
 	if (st.st_size != b->pos)
 		goto close_write;
 
-	tmp = NOFAIL(malloc(b->pos));
+	tmp = xmalloc(b->pos);
 	if (fread(tmp, 1, b->pos, file) != b->pos)
 		goto free_write;
 
@@ -2133,7 +2133,7 @@ int main(int argc, char **argv)
 			external_module = true;
 			break;
 		case 'i':
-			dl = NOFAIL(malloc(sizeof(*dl)));
+			dl = xmalloc(sizeof(*dl));
 			dl->file = optarg;
 			list_add_tail(&dl->list, &dump_lists);
 			break;
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 58197b34a3c8..cf04043c7e93 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -72,8 +72,6 @@
 
 #endif
 
-#define NOFAIL(ptr)   do_nofail((ptr), #ptr)
-
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
 void *do_nofail(void *ptr, const char *expr);
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index dc4878502276..e7d2da45b0df 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -8,6 +8,8 @@
 #include <errno.h>
 #include <string.h>
 #include <limits.h>
+
+#include <xalloc.h>
 #include "modpost.h"
 
 /*
@@ -305,7 +307,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 	const char *base;
 	int dirlen, ret = 0, check_files = 0;
 
-	cmd = NOFAIL(malloc(strlen(objfile) + sizeof("..cmd")));
+	cmd = xmalloc(strlen(objfile) + sizeof("..cmd"));
 
 	base = strrchr(objfile, '/');
 	if (base) {
@@ -316,7 +318,7 @@ static int parse_source_files(const char *objfile, struct md4_ctx *md)
 		dirlen = 0;
 		sprintf(cmd, ".%s.cmd", objfile);
 	}
-	dir = NOFAIL(malloc(dirlen + 1));
+	dir = xmalloc(dirlen + 1);
 	strncpy(dir, objfile, dirlen);
 	dir[dirlen] = '\0';
 
diff --git a/scripts/mod/symsearch.c b/scripts/mod/symsearch.c
index aa4ed51f9960..b9737b92f7f8 100644
--- a/scripts/mod/symsearch.c
+++ b/scripts/mod/symsearch.c
@@ -4,7 +4,7 @@
  * Helper functions for finding the symbol in an ELF which is "nearest"
  * to a given address.
  */
-
+#include <xalloc.h>
 #include "modpost.h"
 
 struct syminfo {
@@ -125,8 +125,8 @@ void symsearch_init(struct elf_info *elf)
 {
 	unsigned int table_size = symbol_count(elf);
 
-	elf->symsearch = NOFAIL(malloc(sizeof(struct symsearch) +
-				       sizeof(struct syminfo) * table_size));
+	elf->symsearch = xmalloc(sizeof(struct symsearch) +
+				       sizeof(struct syminfo) * table_size);
 	elf->symsearch->table_size = table_size;
 
 	symsearch_populate(elf, elf->symsearch->table, table_size);
-- 
2.43.0


