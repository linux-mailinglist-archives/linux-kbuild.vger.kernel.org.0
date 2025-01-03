Return-Path: <linux-kbuild+bounces-5331-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF61A004FA
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 08:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 937171632FC
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 07:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6921C9DC6;
	Fri,  3 Jan 2025 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJmaT0KI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A61CCEF8;
	Fri,  3 Jan 2025 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889461; cv=none; b=gqRzzK9LfEGQHg5E82aQM8RptvBqj/9bGIo/hW+LUVuyTizSM0zIpO39eU7fCVtSCTKd4BUu2VKtKpOkmNS9YzZH0MGJaYr18fbaZ1E6cpPGUkzVBN/oy1yERnzqWeJUeF45J8wzvphAbGRrfrHmngOYJoULIev15q/E+Q6efpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889461; c=relaxed/simple;
	bh=SFiUna5KUZn58JKpA4mHDy0Sh8iLZ8a7ZHUX599JidU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3YExQ3fES21Khcxl09enSVkyHs8Pgqj2E1HzLhneRH0wOT7NrT8vdItsR1MDIzG6vne0wuB4svoXF0fQMTh3gnA4Of66JpoTpBr/xT4qzAam739oceXlnwZrReHqQvswIfzcvE0M9nB2MdYAqVeUKIpBN2uoI6f4nlNRkMIFuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJmaT0KI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3B8C4CECE;
	Fri,  3 Jan 2025 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735889460;
	bh=SFiUna5KUZn58JKpA4mHDy0Sh8iLZ8a7ZHUX599JidU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lJmaT0KIkPTYEipuaNbr8gi5hCuQbQSKyXu+G2X8HemXN7dHHr//kP6LrQf8mKBBG
	 9C/iyGaGYHDmhM3iGb0+z7MCdWA7cwRqYmB8QoFkt2b6wP3k4TZbNTJMFa17h5YEZJ
	 Li1uMyChpuRSP954fV/2H1avBepEUD7LuFZQJVzce9pgte9XStdLD60Hy5eQxJA7ln
	 xP2xvUWnvXY+jezfXDMC2YPiJcE4S3a1y+eqBwc+NWiYBfKyDxSdPZ79G2P7eiykt0
	 jcuuEhkIvm9nPHkpQ6VGoZRqNkTWyJGIcVtBNR4E9MFW+cczysE/2cMbVSns2/lD1d
	 b+bYH0Ln6l06g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 5/6] genksyms: use generic macros for hash table implementation
Date: Fri,  3 Jan 2025 16:30:42 +0900
Message-ID: <20250103073046.2609911-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103073046.2609911-1-masahiroy@kernel.org>
References: <20250103073046.2609911-1-masahiroy@kernel.org>
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

 scripts/genksyms/genksyms.c | 32 ++++++++++++--------------------
 scripts/genksyms/genksyms.h |  4 +++-
 2 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 41d6cfce0088..e2cd3dcb469f 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -18,12 +18,12 @@
 #include <stdarg.h>
 #include <getopt.h>
 
+#include <hashtable.h>
+
 #include "genksyms.h"
 /*----------------------------------------------------------------------*/
 
-#define HASH_BUCKETS  4096
-
-static struct symbol *symtab[HASH_BUCKETS];
+static HASHTABLE_DEFINE(symbol_hashtable, 1U << 12);
 static FILE *debugfile;
 
 int cur_line = 1;
@@ -151,14 +151,14 @@ static enum symbol_type map_to_ns(enum symbol_type t)
 
 struct symbol *find_symbol(const char *name, enum symbol_type ns, int exact)
 {
-	unsigned long h = crc32(name) % HASH_BUCKETS;
 	struct symbol *sym;
 
-	for (sym = symtab[h]; sym; sym = sym->hash_next)
+	hash_for_each_possible(symbol_hashtable, sym, hnode, crc32(name)) {
 		if (map_to_ns(sym->type) == map_to_ns(ns) &&
 		    strcmp(name, sym->name) == 0 &&
 		    sym->is_declared)
 			break;
+	}
 
 	if (exact && sym && sym->type != ns)
 		return NULL;
@@ -224,8 +224,8 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 			return NULL;
 	}
 
-	h = crc32(name) % HASH_BUCKETS;
-	for (sym = symtab[h]; sym; sym = sym->hash_next) {
+	h = crc32(name);
+	hash_for_each_possible(symbol_hashtable, sym, hnode, h) {
 		if (map_to_ns(sym->type) != map_to_ns(type) ||
 		    strcmp(name, sym->name))
 			continue;
@@ -257,14 +257,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 	}
 
 	if (sym) {
-		struct symbol **psym;
-
-		for (psym = &symtab[h]; *psym; psym = &(*psym)->hash_next) {
-			if (*psym == sym) {
-				*psym = sym->hash_next;
-				break;
-			}
-		}
+		hash_del(&sym->hnode);
 
 		free_list(sym->defn, NULL);
 		free(sym->name);
@@ -280,8 +273,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 	sym->visited = NULL;
 	sym->is_extern = is_extern;
 
-	sym->hash_next = symtab[h];
-	symtab[h] = sym;
+	hash_add(symbol_hashtable, &sym->hnode, h);
 
 	sym->is_declared = !is_reference;
 	sym->status = status;
@@ -832,9 +824,9 @@ int main(int argc, char **argv)
 	}
 
 	if (flag_debug) {
-		fprintf(debugfile, "Hash table occupancy %d/%d = %g\n",
-			nsyms, HASH_BUCKETS,
-			(double)nsyms / (double)HASH_BUCKETS);
+		fprintf(debugfile, "Hash table occupancy %d/%zd = %g\n",
+			nsyms, HASH_SIZE(symbol_hashtable),
+			(double)nsyms / HASH_SIZE(symbol_hashtable));
 	}
 
 	if (dumpfile)
diff --git a/scripts/genksyms/genksyms.h b/scripts/genksyms/genksyms.h
index 5621533dcb8e..8c45ada59ece 100644
--- a/scripts/genksyms/genksyms.h
+++ b/scripts/genksyms/genksyms.h
@@ -14,6 +14,8 @@
 
 #include <stdio.h>
 
+#include <list_types.h>
+
 enum symbol_type {
 	SYM_NORMAL, SYM_TYPEDEF, SYM_ENUM, SYM_STRUCT, SYM_UNION,
 	SYM_ENUM_CONST
@@ -31,7 +33,7 @@ struct string_list {
 };
 
 struct symbol {
-	struct symbol *hash_next;
+	struct hlist_node hnode;
 	char *name;
 	enum symbol_type type;
 	struct string_list *defn;
-- 
2.43.0


