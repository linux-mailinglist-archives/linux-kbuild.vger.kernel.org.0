Return-Path: <linux-kbuild+bounces-3474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A11D97078E
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 14:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7842A1C21261
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 12:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477FC16631D;
	Sun,  8 Sep 2024 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gks++DrI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE45166F03;
	Sun,  8 Sep 2024 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799448; cv=none; b=mYKejnxtfRoVWfYSw1KRDKTZ9B+6f0o+YWybNiQhaSRD/VUgPzSnroW9AdiQ2wSTMCYKze87N4lOjDaAgFoUKWNTykpILP+IEJXKMcne8VK9fwQqD9pC7zoFiE6XM8efXd6r8C6DoqX2KPdqokO0bdD/RhzyLRQJ0PIZ1jI2Xsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799448; c=relaxed/simple;
	bh=jD1e4pYggDtDYf4yNsrFOPNi5Q/cX6VUdhkhhALj95Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pDy9emuOPiMkov/mLp+NBzngZMdcMR4XnAukm+6sv/qVtcRNbtCOR1EVEL92cZydLKR43JwquKeyRPV5lJtfAPHnjQg4P8syoyjg/6pSgvvp6xzg15IU2nOE0kpYsR+7LRDgkXAK4tojSvH5dKNfXu/PZLSQrsdzq5KK0XE9jqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gks++DrI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D47C4CEC8;
	Sun,  8 Sep 2024 12:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725799447;
	bh=jD1e4pYggDtDYf4yNsrFOPNi5Q/cX6VUdhkhhALj95Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gks++DrIKsZym/cRPSoMJnmI7qL44n2Z6TnNAUSAhSQBvmTvRGrZCVuWKWLjlewWZ
	 J3L1+SLQ3rTuLUB8SYhKGVKOblZmM3zlPe7+4wtKVj6sLdLRfRaXLKrdGUc3BgLv0X
	 aOpzc1qrDsSqXQSht3H+1RLs72+FePk8SgAIdwCOerFR4QUQEIvia3YphUkeZOxLeW
	 6fomkjpJAUeq6zMf9rENpQ/aJW9MmXQnWKIsPcz4hk7x0iqvmRc9kiOzLeQrUIpJ/E
	 2+5Tj5goznG8S2WWV3LO/LH0dWnAQ9ulsvgtES5M7YqDkCwNr/0HcCuM9bdcDOyjui
	 5N6Y8jRlRe6qQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/6] kconfig: add comments to expression transformations
Date: Sun,  8 Sep 2024 21:43:18 +0900
Message-ID: <20240908124352.1828890-3-masahiroy@kernel.org>
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

Provide explanations for complex transformations.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 43 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index d5dc682f7dc6..e83fe0c3d62f 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -442,6 +442,7 @@ static struct expr *expr_join_or(struct expr *e1, struct expr *e2)
 		}
 	}
 	if (sym1->type == S_BOOLEAN) {
+		// a || !a -> y
 		if ((e1->type == E_NOT && e1->left.expr->type == E_SYMBOL && e2->type == E_SYMBOL) ||
 		    (e2->type == E_NOT && e2->left.expr->type == E_SYMBOL && e1->type == E_SYMBOL))
 			return expr_alloc_symbol(&symbol_yes);
@@ -647,6 +648,30 @@ struct expr *expr_eliminate_dups(struct expr *e)
  * Performs various simplifications involving logical operators and
  * comparisons.
  *
+ *   For bool type:
+ *     A=n        ->  !A
+ *     A=m        ->  n
+ *     A=y        ->  A
+ *     A!=n       ->  A
+ *     A!=m       ->  y
+ *     A!=y       ->  !A
+ *
+ *   For any type:
+ *     !!A        ->  A
+ *     !(A=B)     ->  A!=B
+ *     !(A!=B)    ->  A=B
+ *     !(A<=B)    ->  A>B
+ *     !(A>=B)    ->  A<B
+ *     !(A<B)     ->  A>=B
+ *     !(A>B)     ->  A<=B
+ *     !(A || B)  ->  !A && !B
+ *     !(A && B)  ->  !A || !B
+ *
+ *   For constant:
+ *     !y         ->  n
+ *     !m         ->  m
+ *     !n         ->  y
+ *
  * Allocates and returns a new expression.
  */
 struct expr *expr_transform(struct expr *e)
@@ -674,12 +699,14 @@ struct expr *expr_transform(struct expr *e)
 		if (e->left.sym->type != S_BOOLEAN)
 			break;
 		if (e->right.sym == &symbol_no) {
+			// A=n -> !A
 			e->type = E_NOT;
 			e->left.expr = expr_alloc_symbol(e->left.sym);
 			e->right.sym = NULL;
 			break;
 		}
 		if (e->right.sym == &symbol_mod) {
+			// A=m -> n
 			printf("boolean symbol %s tested for 'm'? test forced to 'n'\n", e->left.sym->name);
 			e->type = E_SYMBOL;
 			e->left.sym = &symbol_no;
@@ -687,6 +714,7 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		}
 		if (e->right.sym == &symbol_yes) {
+			// A=y -> A
 			e->type = E_SYMBOL;
 			e->right.sym = NULL;
 			break;
@@ -696,11 +724,13 @@ struct expr *expr_transform(struct expr *e)
 		if (e->left.sym->type != S_BOOLEAN)
 			break;
 		if (e->right.sym == &symbol_no) {
+			// A!=n -> A
 			e->type = E_SYMBOL;
 			e->right.sym = NULL;
 			break;
 		}
 		if (e->right.sym == &symbol_mod) {
+			// A!=m -> y
 			printf("boolean symbol %s tested for 'm'? test forced to 'y'\n", e->left.sym->name);
 			e->type = E_SYMBOL;
 			e->left.sym = &symbol_yes;
@@ -708,6 +738,7 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		}
 		if (e->right.sym == &symbol_yes) {
+			// A!=y -> !A
 			e->type = E_NOT;
 			e->left.expr = expr_alloc_symbol(e->left.sym);
 			e->right.sym = NULL;
@@ -717,7 +748,7 @@ struct expr *expr_transform(struct expr *e)
 	case E_NOT:
 		switch (e->left.expr->type) {
 		case E_NOT:
-			// !!a -> a
+			// !!A -> A
 			tmp = e->left.expr->left.expr;
 			free(e->left.expr);
 			free(e);
@@ -726,7 +757,7 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		case E_EQUAL:
 		case E_UNEQUAL:
-			// !a='x' -> a!='x'
+			// !(A=B) -> A!=B
 			tmp = e->left.expr;
 			free(e);
 			e = tmp;
@@ -734,7 +765,7 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		case E_LEQ:
 		case E_GEQ:
-			// !a<='x' -> a>'x'
+			// !(A<=B) -> A>B
 			tmp = e->left.expr;
 			free(e);
 			e = tmp;
@@ -742,14 +773,14 @@ struct expr *expr_transform(struct expr *e)
 			break;
 		case E_LTH:
 		case E_GTH:
-			// !a<'x' -> a>='x'
+			// !(A<B) -> A>=B
 			tmp = e->left.expr;
 			free(e);
 			e = tmp;
 			e->type = e->type == E_LTH ? E_GEQ : E_LEQ;
 			break;
 		case E_OR:
-			// !(a || b) -> !a && !b
+			// !(A || B) -> !A && !B
 			tmp = e->left.expr;
 			e->type = E_AND;
 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
@@ -758,7 +789,7 @@ struct expr *expr_transform(struct expr *e)
 			e = expr_transform(e);
 			break;
 		case E_AND:
-			// !(a && b) -> !a || !b
+			// !(A && B) -> !A || !B
 			tmp = e->left.expr;
 			e->type = E_OR;
 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-- 
2.43.0


