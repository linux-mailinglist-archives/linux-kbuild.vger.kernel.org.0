Return-Path: <linux-kbuild+bounces-3476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22A970796
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 14:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A5631C21272
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 12:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD37168486;
	Sun,  8 Sep 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4XqvHTN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A63167DB8;
	Sun,  8 Sep 2024 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799451; cv=none; b=H9HrJWU+5h0J5stZolSeSJo5/2RFSIGNDjviWMXgEABBGMHUVy8+8iLhkh2PSirc1+vJ9g/U6MEC12oD4QJ/xANtCxfKgivZ3vCSw5twJxZFuZtu81igfnnUsjEkny4g7gxFpjEeeUaTJhUO7cDvWvkNTxThkE9TjARXaqJ9zTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799451; c=relaxed/simple;
	bh=eaDlb4JznD8YbuRoVtwHakqm/r/IqQrTYjV9cMcZ8sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVedDcnXdh60MtE8mMKnDXGk9I/9PGxwR4dupcZ+z5l5Q+J27G/+iitGkOKGTG7XVRVwSbtgKoIjHHlsu984dtEgqVOPCP0OuN6lZWVPqtBmiqp2l8cHLWT9UWVYnlvCdSNh2td0LxvseK/TyEbqFyqiefGB+cyDczYO0aPpcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4XqvHTN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730D1C4CEC9;
	Sun,  8 Sep 2024 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725799450;
	bh=eaDlb4JznD8YbuRoVtwHakqm/r/IqQrTYjV9cMcZ8sE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g4XqvHTNzyQQEAGowR3ccYXasmdSvXFb2P27l/v59pCDTeHHYl2hhC9jSlh2XVTfw
	 coYdBMWw2a5pknFYyncwMXA5IuyPUSAy43gwn0sHt6oJt4Fswg8XScGI+pB3q367MA
	 V2eqp1TmU1lotPLedHpCrMFO6g+md4tmoeoMCA81zjJuyXPRukKTMKEUeWNNTIl5f+
	 84ObEyadsj/9/fol7oIXQGmPWexFnkSN/4jp+K68cbvKxvU2T6LLrHLKmGafkQbnD3
	 CCZ3dVTJnt05wISRTBod9gsS8FLg0QQ1KT915T04iUCD/65VGbf/CQGTsmQ/mynPjU
	 zEly+Z0pVtztA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 5/6] kconfig: use hash table to reuse expressions
Date: Sun,  8 Sep 2024 21:43:20 +0900
Message-ID: <20240908124352.1828890-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240908124352.1828890-1-masahiroy@kernel.org>
References: <20240908124352.1828890-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, every expression in Kconfig files produces a new abstract
syntax tree (AST), even if it is identical to a previously encountered
one.

Consider the following code:

    config FOO
           bool "FOO"
           depends on (A || B) && C

    config BAR
           bool "BAR"
           depends on (A || B) && C

    config BAZ
           bool "BAZ"
           depends on A || B

The "depends on" lines are similar, but currently a separate AST is
allocated for each one.

The current data structure looks like this:

  FOO->dep ==> AND        BAR->dep ==> AND        BAZ->dep ==> OR
              /   \                   /   \                   /  \
            OR     C                OR     C                 A    B
           /  \                    /  \
          A    B                  A    B

This is redundant; FOO->dep and BAR->dep have identical ASTs but
different memory instances.

We can optimize this; FOO->dep and BAR->dep can share the same AST, and
BAZ->dep can reference its sub tree.

The optimized data structure looks like this:

  FOO->dep, BAR->dep ==> AND
                        /   \
         BAZ->dep ==> OR     C
                     /  \
                    A    B

This commit introduces a hash table to keep track of allocated
expressions. If an identical expression is found, it is reused.

This does not necessarily result in memory savings, as menu_finalize()
transforms expressions without freeing up stale ones.

One further optimization that can be easily implemented is caching the
expression's value. Once FOO's dependency, (A || B) && C, is calculated,
it can be cached, eliminating the need to recalculate it for BAR.

This commit also reverts commit e983b7b17ad1 ("kconfig/menu.c: fix
multiple references to expressions in menu_add_prop()").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/include/hash.h     |  13 ++
 scripts/kconfig/expr.c     | 381 +++++++++++++------------------------
 scripts/kconfig/expr.h     |  16 +-
 scripts/kconfig/internal.h |   4 +
 scripts/kconfig/menu.c     |  33 +---
 5 files changed, 170 insertions(+), 277 deletions(-)

diff --git a/scripts/include/hash.h b/scripts/include/hash.h
index ce2bc43b308b..efa904368a62 100644
--- a/scripts/include/hash.h
+++ b/scripts/include/hash.h
@@ -12,4 +12,17 @@ static inline unsigned int hash_str(const char *s)
 	return hash;
 }
 
+/* simplified version of functions from include/linux/hash.h */
+#define GOLDEN_RATIO_32 0x61C88647
+
+static inline unsigned int hash_32(unsigned int val)
+{
+	return 0x61C88647 * val;
+}
+
+static inline unsigned int hash_ptr(const void *ptr)
+{
+	return hash_32((unsigned int)(unsigned long)ptr);
+}
+
 #endif /* HASH_H */
diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 5b826d197f12..b7cfaf1a22e6 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -9,45 +9,68 @@
 #include <stdlib.h>
 #include <string.h>
 
+#include <hash.h>
 #include <xalloc.h>
+#include "internal.h"
 #include "lkc.h"
 
 #define DEBUG_EXPR	0
 
+HASHTABLE_DEFINE(expr_hashtable, EXPR_HASHSIZE);
+
 static struct expr *expr_eliminate_yn(struct expr *e);
 
+/**
+ * expr_lookup - return the expression for the given type and sub-nodes
+ * This looks up an expression with the specified type and sub-nodes. If such
+ * an expression is found in the hash table, it is returned. Otherwise, a new
+ * expression node is allocated and added to the hash table.
+ * @type: expression type
+ * @l: left node
+ * @r: right node
+ * return: expression
+ */
+static struct expr *expr_lookup(enum expr_type type, void *l, void *r)
+{
+	struct expr *e;
+	int hash;
+
+	hash = hash_32((unsigned int)type ^ hash_ptr(l) ^ hash_ptr(r));
+
+	hash_for_each_possible(expr_hashtable, e, node, hash) {
+		if (e->type == type && e->left._initdata == l &&
+		    e->right._initdata == r)
+			return e;
+	}
+
+	e = xmalloc(sizeof(*e));
+	e->type = type;
+	e->left._initdata = l;
+	e->right._initdata = r;
+
+	hash_add(expr_hashtable, &e->node, hash);
+
+	return e;
+}
+
 struct expr *expr_alloc_symbol(struct symbol *sym)
 {
-	struct expr *e = xcalloc(1, sizeof(*e));
-	e->type = E_SYMBOL;
-	e->left.sym = sym;
-	return e;
+	return expr_lookup(E_SYMBOL, sym, NULL);
 }
 
 struct expr *expr_alloc_one(enum expr_type type, struct expr *ce)
 {
-	struct expr *e = xcalloc(1, sizeof(*e));
-	e->type = type;
-	e->left.expr = ce;
-	return e;
+	return expr_lookup(type, ce, NULL);
 }
 
 struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e2)
 {
-	struct expr *e = xcalloc(1, sizeof(*e));
-	e->type = type;
-	e->left.expr = e1;
-	e->right.expr = e2;
-	return e;
+	return expr_lookup(type, e1, e2);
 }
 
 struct expr *expr_alloc_comp(enum expr_type type, struct symbol *s1, struct symbol *s2)
 {
-	struct expr *e = xcalloc(1, sizeof(*e));
-	e->type = type;
-	e->left.sym = s1;
-	e->right.sym = s2;
-	return e;
+	return expr_lookup(type, s1, s2);
 }
 
 struct expr *expr_alloc_and(struct expr *e1, struct expr *e2)
@@ -64,76 +87,6 @@ struct expr *expr_alloc_or(struct expr *e1, struct expr *e2)
 	return e2 ? expr_alloc_two(E_OR, e1, e2) : e1;
 }
 
-struct expr *expr_copy(const struct expr *org)
-{
-	struct expr *e;
-
-	if (!org)
-		return NULL;
-
-	e = xmalloc(sizeof(*org));
-	memcpy(e, org, sizeof(*org));
-	switch (org->type) {
-	case E_SYMBOL:
-		e->left = org->left;
-		break;
-	case E_NOT:
-		e->left.expr = expr_copy(org->left.expr);
-		break;
-	case E_EQUAL:
-	case E_GEQ:
-	case E_GTH:
-	case E_LEQ:
-	case E_LTH:
-	case E_UNEQUAL:
-		e->left.sym = org->left.sym;
-		e->right.sym = org->right.sym;
-		break;
-	case E_AND:
-	case E_OR:
-		e->left.expr = expr_copy(org->left.expr);
-		e->right.expr = expr_copy(org->right.expr);
-		break;
-	default:
-		fprintf(stderr, "can't copy type %d\n", e->type);
-		free(e);
-		e = NULL;
-		break;
-	}
-
-	return e;
-}
-
-void expr_free(struct expr *e)
-{
-	if (!e)
-		return;
-
-	switch (e->type) {
-	case E_SYMBOL:
-		break;
-	case E_NOT:
-		expr_free(e->left.expr);
-		break;
-	case E_EQUAL:
-	case E_GEQ:
-	case E_GTH:
-	case E_LEQ:
-	case E_LTH:
-	case E_UNEQUAL:
-		break;
-	case E_OR:
-	case E_AND:
-		expr_free(e->left.expr);
-		expr_free(e->right.expr);
-		break;
-	default:
-		fprintf(stderr, "how to free type %d?\n", e->type);
-		break;
-	}
-	free(e);
-}
-
 static int trans_count;
 
 /*
@@ -146,16 +99,24 @@ static int trans_count;
  */
 static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct expr **ep2)
 {
+	struct expr *l, *r;
+
 	/* Recurse down to leaves */
 
 	if ((*ep1)->type == type) {
-		__expr_eliminate_eq(type, &(*ep1)->left.expr, ep2);
-		__expr_eliminate_eq(type, &(*ep1)->right.expr, ep2);
+		l = (*ep1)->left.expr;
+		r = (*ep1)->right.expr;
+		__expr_eliminate_eq(type, &l, ep2);
+		__expr_eliminate_eq(type, &r, ep2);
+		*ep1 = expr_alloc_two(type, l, r);
 		return;
 	}
 	if ((*ep2)->type == type) {
-		__expr_eliminate_eq(type, ep1, &(*ep2)->left.expr);
-		__expr_eliminate_eq(type, ep1, &(*ep2)->right.expr);
+		l = (*ep2)->left.expr;
+		r = (*ep2)->right.expr;
+		__expr_eliminate_eq(type, ep1, &l);
+		__expr_eliminate_eq(type, ep1, &r);
+		*ep2 = expr_alloc_two(type, l, r);
 		return;
 	}
 
@@ -171,7 +132,6 @@ static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct e
 	/* *ep1 and *ep2 are equal leaves. Prepare them for elimination. */
 
 	trans_count++;
-	expr_free(*ep1); expr_free(*ep2);
 	switch (type) {
 	case E_OR:
 		*ep1 = expr_alloc_symbol(&symbol_no);
@@ -271,14 +231,10 @@ bool expr_eq(struct expr *e1, struct expr *e2)
 		return expr_eq(e1->left.expr, e2->left.expr);
 	case E_AND:
 	case E_OR:
-		e1 = expr_copy(e1);
-		e2 = expr_copy(e2);
 		old_count = trans_count;
 		expr_eliminate_eq(&e1, &e2);
 		res = (e1->type == E_SYMBOL && e2->type == E_SYMBOL &&
 		       e1->left.sym == e2->left.sym);
-		expr_free(e1);
-		expr_free(e2);
 		trans_count = old_count;
 		return res;
 	case E_RANGE:
@@ -297,7 +253,7 @@ bool expr_eq(struct expr *e1, struct expr *e2)
 }
 
 /*
- * Recursively performs the following simplifications in-place (as well as the
+ * Recursively performs the following simplifications (as well as the
  * corresponding simplifications with swapped operands):
  *
  *	expr && n  ->  n
@@ -309,79 +265,39 @@ bool expr_eq(struct expr *e1, struct expr *e2)
  */
 static struct expr *expr_eliminate_yn(struct expr *e)
 {
-	struct expr *tmp;
+	struct expr *l, *r;
 
 	if (e) switch (e->type) {
 	case E_AND:
-		e->left.expr = expr_eliminate_yn(e->left.expr);
-		e->right.expr = expr_eliminate_yn(e->right.expr);
-		if (e->left.expr->type == E_SYMBOL) {
-			if (e->left.expr->left.sym == &symbol_no) {
-				expr_free(e->left.expr);
-				expr_free(e->right.expr);
-				e->type = E_SYMBOL;
-				e->left.sym = &symbol_no;
-				e->right.expr = NULL;
-				return e;
-			} else if (e->left.expr->left.sym == &symbol_yes) {
-				free(e->left.expr);
-				tmp = e->right.expr;
-				*e = *(e->right.expr);
-				free(tmp);
-				return e;
-			}
+		l = expr_eliminate_yn(e->left.expr);
+		r = expr_eliminate_yn(e->right.expr);
+		if (l->type == E_SYMBOL) {
+			if (l->left.sym == &symbol_no)
+				return l;
+			else if (l->left.sym == &symbol_yes)
+				return r;
 		}
-		if (e->right.expr->type == E_SYMBOL) {
-			if (e->right.expr->left.sym == &symbol_no) {
-				expr_free(e->left.expr);
-				expr_free(e->right.expr);
-				e->type = E_SYMBOL;
-				e->left.sym = &symbol_no;
-				e->right.expr = NULL;
-				return e;
-			} else if (e->right.expr->left.sym == &symbol_yes) {
-				free(e->right.expr);
-				tmp = e->left.expr;
-				*e = *(e->left.expr);
-				free(tmp);
-				return e;
-			}
+		if (r->type == E_SYMBOL) {
+			if (r->left.sym == &symbol_no)
+				return r;
+			else if (r->left.sym == &symbol_yes)
+				return l;
 		}
 		break;
 	case E_OR:
-		e->left.expr = expr_eliminate_yn(e->left.expr);
-		e->right.expr = expr_eliminate_yn(e->right.expr);
-		if (e->left.expr->type == E_SYMBOL) {
-			if (e->left.expr->left.sym == &symbol_no) {
-				free(e->left.expr);
-				tmp = e->right.expr;
-				*e = *(e->right.expr);
-				free(tmp);
-				return e;
-			} else if (e->left.expr->left.sym == &symbol_yes) {
-				expr_free(e->left.expr);
-				expr_free(e->right.expr);
-				e->type = E_SYMBOL;
-				e->left.sym = &symbol_yes;
-				e->right.expr = NULL;
-				return e;
-			}
+		l = expr_eliminate_yn(e->left.expr);
+		r = expr_eliminate_yn(e->right.expr);
+		if (l->type == E_SYMBOL) {
+			if (l->left.sym == &symbol_no)
+				return r;
+			else if (l->left.sym == &symbol_yes)
+				return l;
 		}
-		if (e->right.expr->type == E_SYMBOL) {
-			if (e->right.expr->left.sym == &symbol_no) {
-				free(e->right.expr);
-				tmp = e->left.expr;
-				*e = *(e->left.expr);
-				free(tmp);
-				return e;
-			} else if (e->right.expr->left.sym == &symbol_yes) {
-				expr_free(e->left.expr);
-				expr_free(e->right.expr);
-				e->type = E_SYMBOL;
-				e->left.sym = &symbol_yes;
-				e->right.expr = NULL;
-				return e;
-			}
+		if (r->type == E_SYMBOL) {
+			if (r->left.sym == &symbol_no)
+				return l;
+			else if (r->left.sym == &symbol_yes)
+				return r;
 		}
 		break;
 	default:
@@ -399,7 +315,7 @@ static struct expr *expr_join_or(struct expr *e1, struct expr *e2)
 	struct symbol *sym1, *sym2;
 
 	if (expr_eq(e1, e2))
-		return expr_copy(e1);
+		return e1;
 	if (e1->type != E_EQUAL && e1->type != E_UNEQUAL && e1->type != E_SYMBOL && e1->type != E_NOT)
 		return NULL;
 	if (e2->type != E_EQUAL && e2->type != E_UNEQUAL && e2->type != E_SYMBOL && e2->type != E_NOT)
@@ -464,7 +380,7 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 	struct symbol *sym1, *sym2;
 
 	if (expr_eq(e1, e2))
-		return expr_copy(e1);
+		return e1;
 	if (e1->type != E_EQUAL && e1->type != E_UNEQUAL && e1->type != E_SYMBOL && e1->type != E_NOT)
 		return NULL;
 	if (e2->type != E_EQUAL && e2->type != E_UNEQUAL && e2->type != E_SYMBOL && e2->type != E_NOT)
@@ -561,18 +477,24 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
  */
 static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct expr **ep2)
 {
-	struct expr *tmp;
+	struct expr *tmp, *l, *r;
 
 	/* Recurse down to leaves */
 
 	if ((*ep1)->type == type) {
-		expr_eliminate_dups1(type, &(*ep1)->left.expr, ep2);
-		expr_eliminate_dups1(type, &(*ep1)->right.expr, ep2);
+		l = (*ep1)->left.expr;
+		r = (*ep1)->right.expr;
+		expr_eliminate_dups1(type, &l, ep2);
+		expr_eliminate_dups1(type, &r, ep2);
+		*ep1 = expr_alloc_two(type, l, r);
 		return;
 	}
 	if ((*ep2)->type == type) {
-		expr_eliminate_dups1(type, ep1, &(*ep2)->left.expr);
-		expr_eliminate_dups1(type, ep1, &(*ep2)->right.expr);
+		l = (*ep2)->left.expr;
+		r = (*ep2)->right.expr;
+		expr_eliminate_dups1(type, ep1, &l);
+		expr_eliminate_dups1(type, ep1, &r);
+		*ep2 = expr_alloc_two(type, l, r);
 		return;
 	}
 
@@ -582,7 +504,6 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 	case E_OR:
 		tmp = expr_join_or(*ep1, *ep2);
 		if (tmp) {
-			expr_free(*ep1); expr_free(*ep2);
 			*ep1 = expr_alloc_symbol(&symbol_no);
 			*ep2 = tmp;
 			trans_count++;
@@ -591,7 +512,6 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 	case E_AND:
 		tmp = expr_join_and(*ep1, *ep2);
 		if (tmp) {
-			expr_free(*ep1); expr_free(*ep2);
 			*ep1 = expr_alloc_symbol(&symbol_yes);
 			*ep2 = tmp;
 			trans_count++;
@@ -621,12 +541,15 @@ struct expr *expr_eliminate_dups(struct expr *e)
 
 	oldcount = trans_count;
 	do {
+		struct expr *l, *r;
+
 		trans_count = 0;
 		switch (e->type) {
 		case E_OR: case E_AND:
-			e->left.expr = expr_eliminate_dups(e->left.expr);
-			e->right.expr = expr_eliminate_dups(e->right.expr);
-			expr_eliminate_dups1(e->type, &e->left.expr, &e->right.expr);
+			l = expr_eliminate_dups(e->left.expr);
+			r = expr_eliminate_dups(e->right.expr);
+			expr_eliminate_dups1(e->type, &l, &r);
+			e = expr_alloc_two(e->type, l, r);
 		default:
 			;
 		}
@@ -668,8 +591,6 @@ struct expr *expr_eliminate_dups(struct expr *e)
  */
 struct expr *expr_transform(struct expr *e)
 {
-	struct expr *tmp;
-
 	if (!e)
 		return NULL;
 	switch (e->type) {
@@ -682,8 +603,9 @@ struct expr *expr_transform(struct expr *e)
 	case E_SYMBOL:
 		break;
 	default:
-		e->left.expr = expr_transform(e->left.expr);
-		e->right.expr = expr_transform(e->right.expr);
+		e = expr_alloc_two(e->type,
+				   expr_transform(e->left.expr),
+				   expr_transform(e->right.expr));
 	}
 
 	switch (e->type) {
@@ -692,23 +614,18 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		if (e->right.sym == &symbol_no) {
 			// A=n -> !A
-			e->type = E_NOT;
-			e->left.expr = expr_alloc_symbol(e->left.sym);
-			e->right.sym = NULL;
+			e = expr_alloc_one(E_NOT, expr_alloc_symbol(e->left.sym));
 			break;
 		}
 		if (e->right.sym == &symbol_mod) {
 			// A=m -> n
 			printf("boolean symbol %s tested for 'm'? test forced to 'n'\n", e->left.sym->name);
-			e->type = E_SYMBOL;
-			e->left.sym = &symbol_no;
-			e->right.sym = NULL;
+			e = expr_alloc_symbol(&symbol_no);
 			break;
 		}
 		if (e->right.sym == &symbol_yes) {
 			// A=y -> A
-			e->type = E_SYMBOL;
-			e->right.sym = NULL;
+			e = expr_alloc_symbol(e->left.sym);
 			break;
 		}
 		break;
@@ -717,23 +634,18 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		if (e->right.sym == &symbol_no) {
 			// A!=n -> A
-			e->type = E_SYMBOL;
-			e->right.sym = NULL;
+			e = expr_alloc_symbol(e->left.sym);
 			break;
 		}
 		if (e->right.sym == &symbol_mod) {
 			// A!=m -> y
 			printf("boolean symbol %s tested for 'm'? test forced to 'y'\n", e->left.sym->name);
-			e->type = E_SYMBOL;
-			e->left.sym = &symbol_yes;
-			e->right.sym = NULL;
+			e = expr_alloc_symbol(&symbol_yes);
 			break;
 		}
 		if (e->right.sym == &symbol_yes) {
 			// A!=y -> !A
-			e->type = E_NOT;
-			e->left.expr = expr_alloc_symbol(e->left.sym);
-			e->right.sym = NULL;
+			e = expr_alloc_one(E_NOT, e->left.expr);
 			break;
 		}
 		break;
@@ -741,82 +653,51 @@ struct expr *expr_transform(struct expr *e)
 		switch (e->left.expr->type) {
 		case E_NOT:
 			// !!A -> A
-			tmp = e->left.expr->left.expr;
-			free(e->left.expr);
-			free(e);
-			e = tmp;
-			e = expr_transform(e);
+			e = e->left.expr->left.expr;
 			break;
 		case E_EQUAL:
 		case E_UNEQUAL:
 			// !(A=B) -> A!=B
-			tmp = e->left.expr;
-			free(e);
-			e = tmp;
-			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
+			e = expr_alloc_comp(e->left.expr->type == E_EQUAL ? E_UNEQUAL : E_EQUAL,
+					    e->left.expr->left.sym,
+					    e->left.expr->right.sym);
 			break;
 		case E_LEQ:
 		case E_GEQ:
 			// !(A<=B) -> A>B
-			tmp = e->left.expr;
-			free(e);
-			e = tmp;
-			e->type = e->type == E_LEQ ? E_GTH : E_LTH;
+			e = expr_alloc_comp(e->left.expr->type == E_LEQ ? E_GTH : E_LTH,
+					    e->left.expr->left.sym,
+					    e->left.expr->right.sym);
 			break;
 		case E_LTH:
 		case E_GTH:
 			// !(A<B) -> A>=B
-			tmp = e->left.expr;
-			free(e);
-			e = tmp;
-			e->type = e->type == E_LTH ? E_GEQ : E_LEQ;
+			e = expr_alloc_comp(e->left.expr->type == E_LTH ? E_GEQ : E_LEQ,
+					    e->left.expr->left.sym,
+					    e->left.expr->right.sym);
 			break;
 		case E_OR:
 			// !(A || B) -> !A && !B
-			tmp = e->left.expr;
-			e->type = E_AND;
-			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-			tmp->type = E_NOT;
-			tmp->right.expr = NULL;
+			e = expr_alloc_and(expr_alloc_one(E_NOT, e->left.expr->left.expr),
+					   expr_alloc_one(E_NOT, e->left.expr->right.expr));
 			e = expr_transform(e);
 			break;
 		case E_AND:
 			// !(A && B) -> !A || !B
-			tmp = e->left.expr;
-			e->type = E_OR;
-			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-			tmp->type = E_NOT;
-			tmp->right.expr = NULL;
+			e = expr_alloc_or(expr_alloc_one(E_NOT, e->left.expr->left.expr),
+					  expr_alloc_one(E_NOT, e->left.expr->right.expr));
 			e = expr_transform(e);
 			break;
 		case E_SYMBOL:
-			if (e->left.expr->left.sym == &symbol_yes) {
+			if (e->left.expr->left.sym == &symbol_yes)
 				// !'y' -> 'n'
-				tmp = e->left.expr;
-				free(e);
-				e = tmp;
-				e->type = E_SYMBOL;
-				e->left.sym = &symbol_no;
-				break;
-			}
-			if (e->left.expr->left.sym == &symbol_mod) {
+				e = expr_alloc_symbol(&symbol_no);
+			else if (e->left.expr->left.sym == &symbol_mod)
 				// !'m' -> 'm'
-				tmp = e->left.expr;
-				free(e);
-				e = tmp;
-				e->type = E_SYMBOL;
-				e->left.sym = &symbol_mod;
-				break;
-			}
-			if (e->left.expr->left.sym == &symbol_no) {
+				e = expr_alloc_symbol(&symbol_mod);
+			else if (e->left.expr->left.sym == &symbol_no)
 				// !'n' -> 'y'
-				tmp = e->left.expr;
-				free(e);
-				e = tmp;
-				e->type = E_SYMBOL;
-				e->left.sym = &symbol_yes;
-				break;
-			}
+				e = expr_alloc_symbol(&symbol_yes);
 			break;
 		default:
 			;
@@ -940,18 +821,18 @@ struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symb
 	case E_EQUAL:
 		if (type == E_EQUAL) {
 			if (sym == &symbol_yes)
-				return expr_copy(e);
+				return e;
 			if (sym == &symbol_mod)
 				return expr_alloc_symbol(&symbol_no);
 			if (sym == &symbol_no)
-				return expr_alloc_one(E_NOT, expr_copy(e));
+				return expr_alloc_one(E_NOT, e);
 		} else {
 			if (sym == &symbol_yes)
-				return expr_alloc_one(E_NOT, expr_copy(e));
+				return expr_alloc_one(E_NOT, e);
 			if (sym == &symbol_mod)
 				return expr_alloc_symbol(&symbol_yes);
 			if (sym == &symbol_no)
-				return expr_copy(e);
+				return e;
 		}
 		break;
 	case E_SYMBOL:
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 4ab7422ddbd8..a398b2b2dbe0 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -29,11 +29,21 @@ enum expr_type {
 };
 
 union expr_data {
-	struct expr *expr;
-	struct symbol *sym;
+	struct expr * const expr;
+	struct symbol * const sym;
+	void *_initdata;
 };
 
+/**
+ * struct expr - expression
+ *
+ * @node:  link node for the hash table
+ * @type:  expressoin type
+ * @left:  left node
+ * @right: right node
+ */
 struct expr {
+	struct hlist_node node;
 	enum expr_type type;
 	union expr_data left, right;
 };
@@ -275,8 +285,6 @@ struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e
 struct expr *expr_alloc_comp(enum expr_type type, struct symbol *s1, struct symbol *s2);
 struct expr *expr_alloc_and(struct expr *e1, struct expr *e2);
 struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
-struct expr *expr_copy(const struct expr *org);
-void expr_free(struct expr *e);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
 bool expr_eq(struct expr *e1, struct expr *e2);
 tristate expr_calc_value(struct expr *e);
diff --git a/scripts/kconfig/internal.h b/scripts/kconfig/internal.h
index 02106eb7815e..84c2ea0389fd 100644
--- a/scripts/kconfig/internal.h
+++ b/scripts/kconfig/internal.h
@@ -11,6 +11,10 @@ extern HASHTABLE_DECLARE(sym_hashtable, SYMBOL_HASHSIZE);
 #define for_all_symbols(sym) \
 	hash_for_each(sym_hashtable, sym, node)
 
+#define EXPR_HASHSIZE		(1U << 14)
+
+extern HASHTABLE_DECLARE(expr_hashtable, EXPR_HASHSIZE);
+
 struct menu;
 
 extern struct menu *current_menu, *current_entry;
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index f61327fabead..4addd33749bb 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -107,12 +107,13 @@ static struct expr *rewrite_m(struct expr *e)
 
 	switch (e->type) {
 	case E_NOT:
-		e->left.expr = rewrite_m(e->left.expr);
+		e = expr_alloc_one(E_NOT, rewrite_m(e->left.expr));
 		break;
 	case E_OR:
 	case E_AND:
-		e->left.expr = rewrite_m(e->left.expr);
-		e->right.expr = rewrite_m(e->right.expr);
+		e = expr_alloc_two(e->type,
+				   rewrite_m(e->left.expr),
+				   rewrite_m(e->right.expr));
 		break;
 	case E_SYMBOL:
 		/* change 'm' into 'm' && MODULES */
@@ -192,21 +193,11 @@ struct property *menu_add_prompt(enum prop_type type, const char *prompt,
 		struct menu *menu = current_entry;
 
 		while ((menu = menu->parent) != NULL) {
-			struct expr *dup_expr;
 
 			if (!menu->visibility)
 				continue;
-			/*
-			 * Do not add a reference to the menu's visibility
-			 * expression but use a copy of it. Otherwise the
-			 * expression reduction functions will modify
-			 * expressions that have multiple references which
-			 * can cause unwanted side effects.
-			 */
-			dup_expr = expr_copy(menu->visibility);
-
 			prop->visible.expr = expr_alloc_and(prop->visible.expr,
-							    dup_expr);
+							    menu->visibility);
 		}
 	}
 
@@ -322,7 +313,7 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			 */
 			basedep = rewrite_m(menu->dep);
 			basedep = expr_transform(basedep);
-			basedep = expr_alloc_and(expr_copy(parent->dep), basedep);
+			basedep = expr_alloc_and(parent->dep, basedep);
 			basedep = expr_eliminate_dups(basedep);
 			menu->dep = basedep;
 
@@ -366,7 +357,7 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 				 */
 				dep = rewrite_m(prop->visible.expr);
 				dep = expr_transform(dep);
-				dep = expr_alloc_and(expr_copy(basedep), dep);
+				dep = expr_alloc_and(basedep, dep);
 				dep = expr_eliminate_dups(dep);
 				prop->visible.expr = dep;
 
@@ -377,11 +368,11 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 				if (prop->type == P_SELECT) {
 					struct symbol *es = prop_get_symbol(prop);
 					es->rev_dep.expr = expr_alloc_or(es->rev_dep.expr,
-							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+							expr_alloc_and(expr_alloc_symbol(menu->sym), dep));
 				} else if (prop->type == P_IMPLY) {
 					struct symbol *es = prop_get_symbol(prop);
 					es->implied.expr = expr_alloc_or(es->implied.expr,
-							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+							expr_alloc_and(expr_alloc_symbol(menu->sym), dep));
 				}
 			}
 		}
@@ -441,22 +432,18 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			 */
 			dep = expr_trans_compare(dep, E_UNEQUAL, &symbol_no);
 			dep = expr_eliminate_dups(expr_transform(dep));
-			dep2 = expr_copy(basedep);
+			dep2 = basedep;
 			expr_eliminate_eq(&dep, &dep2);
-			expr_free(dep);
 			if (!expr_is_yes(dep2)) {
 				/* Not superset, quit */
-				expr_free(dep2);
 				break;
 			}
 			/* Superset, put in submenu */
-			expr_free(dep2);
 		next:
 			_menu_finalize(menu, false);
 			menu->parent = parent;
 			last_menu = menu;
 		}
-		expr_free(basedep);
 		if (last_menu) {
 			parent->list = parent->next;
 			parent->next = last_menu->next;
-- 
2.43.0


