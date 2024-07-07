Return-Path: <linux-kbuild+bounces-2422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AFC9298B1
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 17:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102C41F22D5A
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 15:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E1245BE4;
	Sun,  7 Jul 2024 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBPn59u5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D714596F;
	Sun,  7 Jul 2024 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720366747; cv=none; b=skF5b8JwpB+xWLsNSu5unvH7SgIKUzIGKXD3qIsSDaJen8YNzPzo9shgU7vly/ez0Xd8piC4YN4r4ykMHfGWLtKmEt7Qju4hb45pPbKMM7WtqQP4uFr9XkTvcAZbKRltD4VhJOOe13oODtAP+0omdXfVY4b26XizgpEv4+KMBm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720366747; c=relaxed/simple;
	bh=Szn9QbqU+k18L3rnViBkFWEjGJmTSkPDDXuoWw9cflU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4F/Vb0YtHVFLyshfOqih8qSjDpVCGh35di6TJcHpBtne7nvh/ucX/pHRiTyUTgdkZJiOjVLsB6AyxxyxMyDFR1Tyza+lDx9PspDTEqOCzYt6sci9HbHt+LGwoqdJLQFzN7aR0k4+r1/dVkw/+AhlbyRtvPfLbZeT2OnQZwWjqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBPn59u5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5405C4AF07;
	Sun,  7 Jul 2024 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720366746;
	bh=Szn9QbqU+k18L3rnViBkFWEjGJmTSkPDDXuoWw9cflU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vBPn59u5BGNUUFMGWQSpgZOwbXi+vvzNSRvDqQ0q6Hgz7Vwt9A5gJDRd47pbBR5B7
	 6MWLL+fXD8EjbCxco2khJyJphOFm14mnJy0VzuIpPS4xY5rfTVP3eVsVu4rfunXFf6
	 t92HlVDDLlehmpLyxh+Uw0KCcsdzs8/MGKnlJ/+/626XWTe8IvcYAv7U7/m4aOG5Xn
	 BnU48flpyVKc+fWPlc5/B2erminukKtGSoZRgUFM+T5jOjYMRHPyvLRzNcV07Zjsj8
	 i0/lf1bj6Cb2HCaQ+MHg2clRaN5SwaK8Op5Po6zt02fhxVz9domZCPCkgFIHUngy5K
	 dB+IMh4PA96JA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/4] kconfig: remove 'e1' and 'e2' macros from expressoin deduplication
Date: Mon,  8 Jul 2024 00:38:07 +0900
Message-ID: <20240707153856.2483047-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240707153856.2483047-1-masahiroy@kernel.org>
References: <20240707153856.2483047-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I do not think the macros 'e1' and 'e2' are readable.

The statement:

    e1 = expr_alloc_symbol(...);

affects the caller's variable, but this is not sufficiently clear from the code.

Remove the macros. No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 94 +++++++++++++++++++-----------------------
 1 file changed, 42 insertions(+), 52 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index a85e0d603322..c349da7fe3f8 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -135,9 +135,6 @@ void expr_free(struct expr *e)
 
 static int trans_count;
 
-#define e1 (*ep1)
-#define e2 (*ep2)
-
 /*
  * expr_eliminate_eq() helper.
  *
@@ -150,38 +147,38 @@ static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct e
 {
 	/* Recurse down to leaves */
 
-	if (e1->type == type) {
-		__expr_eliminate_eq(type, &e1->left.expr, &e2);
-		__expr_eliminate_eq(type, &e1->right.expr, &e2);
+	if ((*ep1)->type == type) {
+		__expr_eliminate_eq(type, &(*ep1)->left.expr, ep2);
+		__expr_eliminate_eq(type, &(*ep1)->right.expr, ep2);
 		return;
 	}
-	if (e2->type == type) {
-		__expr_eliminate_eq(type, &e1, &e2->left.expr);
-		__expr_eliminate_eq(type, &e1, &e2->right.expr);
+	if ((*ep2)->type == type) {
+		__expr_eliminate_eq(type, ep1, &(*ep2)->left.expr);
+		__expr_eliminate_eq(type, ep1, &(*ep2)->right.expr);
 		return;
 	}
 
-	/* e1 and e2 are leaves. Compare them. */
+	/* *ep1 and *ep2 are leaves. Compare them. */
 
-	if (e1->type == E_SYMBOL && e2->type == E_SYMBOL &&
-	    e1->left.sym == e2->left.sym &&
-	    (e1->left.sym == &symbol_yes || e1->left.sym == &symbol_no))
+	if ((*ep1)->type == E_SYMBOL && (*ep2)->type == E_SYMBOL &&
+	    (*ep1)->left.sym == (*ep2)->left.sym &&
+	    ((*ep1)->left.sym == &symbol_yes || (*ep1)->left.sym == &symbol_no))
 		return;
-	if (!expr_eq(e1, e2))
+	if (!expr_eq(*ep1, *ep2))
 		return;
 
-	/* e1 and e2 are equal leaves. Prepare them for elimination. */
+	/* *ep1 and *ep2 are equal leaves. Prepare them for elimination. */
 
 	trans_count++;
-	expr_free(e1); expr_free(e2);
+	expr_free(*ep1); expr_free(*ep2);
 	switch (type) {
 	case E_OR:
-		e1 = expr_alloc_symbol(&symbol_no);
-		e2 = expr_alloc_symbol(&symbol_no);
+		*ep1 = expr_alloc_symbol(&symbol_no);
+		*ep2 = expr_alloc_symbol(&symbol_no);
 		break;
 	case E_AND:
-		e1 = expr_alloc_symbol(&symbol_yes);
-		e2 = expr_alloc_symbol(&symbol_yes);
+		*ep1 = expr_alloc_symbol(&symbol_yes);
+		*ep2 = expr_alloc_symbol(&symbol_yes);
 		break;
 	default:
 		;
@@ -219,29 +216,26 @@ static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct e
  */
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
 {
-	if (!e1 || !e2)
+	if (!*ep1 || !*ep2)
 		return;
-	switch (e1->type) {
+	switch ((*ep1)->type) {
 	case E_OR:
 	case E_AND:
-		__expr_eliminate_eq(e1->type, ep1, ep2);
+		__expr_eliminate_eq((*ep1)->type, ep1, ep2);
 	default:
 		;
 	}
-	if (e1->type != e2->type) switch (e2->type) {
+	if ((*ep1)->type != (*ep2)->type) switch ((*ep2)->type) {
 	case E_OR:
 	case E_AND:
-		__expr_eliminate_eq(e2->type, ep1, ep2);
+		__expr_eliminate_eq((*ep2)->type, ep1, ep2);
 	default:
 		;
 	}
-	e1 = expr_eliminate_yn(e1);
-	e2 = expr_eliminate_yn(e2);
+	*ep1 = expr_eliminate_yn(*ep1);
+	*ep2 = expr_eliminate_yn(*ep2);
 }
 
-#undef e1
-#undef e2
-
 /*
  * Returns true if 'e1' and 'e2' are equal, after minor simplification. Two
  * &&/|| expressions are considered equal if every operand in one expression
@@ -564,59 +558,55 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
  */
 static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct expr **ep2)
 {
-#define e1 (*ep1)
-#define e2 (*ep2)
 	struct expr *tmp;
 
 	/* Recurse down to leaves */
 
-	if (e1->type == type) {
-		expr_eliminate_dups1(type, &e1->left.expr, &e2);
-		expr_eliminate_dups1(type, &e1->right.expr, &e2);
+	if ((*ep1)->type == type) {
+		expr_eliminate_dups1(type, &(*ep1)->left.expr, ep2);
+		expr_eliminate_dups1(type, &(*ep1)->right.expr, ep2);
 		return;
 	}
-	if (e2->type == type) {
-		expr_eliminate_dups1(type, &e1, &e2->left.expr);
-		expr_eliminate_dups1(type, &e1, &e2->right.expr);
+	if ((*ep2)->type == type) {
+		expr_eliminate_dups1(type, ep1, &(*ep2)->left.expr);
+		expr_eliminate_dups1(type, ep1, &(*ep2)->right.expr);
 		return;
 	}
 
-	/* e1 and e2 are leaves. Compare and process them. */
+	/* *ep1 and *ep2 are leaves. Compare and process them. */
 
-	if (e1 == e2)
+	if (*ep1 == *ep2)
 		return;
 
-	switch (e1->type) {
+	switch ((*ep1)->type) {
 	case E_OR: case E_AND:
-		expr_eliminate_dups1(e1->type, &e1, &e1);
+		expr_eliminate_dups1((*ep1)->type, ep1, ep1);
 	default:
 		;
 	}
 
 	switch (type) {
 	case E_OR:
-		tmp = expr_join_or(e1, e2);
+		tmp = expr_join_or(*ep1, *ep2);
 		if (tmp) {
-			expr_free(e1); expr_free(e2);
-			e1 = expr_alloc_symbol(&symbol_no);
-			e2 = tmp;
+			expr_free(*ep1); expr_free(*ep2);
+			*ep1 = expr_alloc_symbol(&symbol_no);
+			*ep2 = tmp;
 			trans_count++;
 		}
 		break;
 	case E_AND:
-		tmp = expr_join_and(e1, e2);
+		tmp = expr_join_and(*ep1, *ep2);
 		if (tmp) {
-			expr_free(e1); expr_free(e2);
-			e1 = expr_alloc_symbol(&symbol_yes);
-			e2 = tmp;
+			expr_free(*ep1); expr_free(*ep2);
+			*ep1 = expr_alloc_symbol(&symbol_yes);
+			*ep2 = tmp;
 			trans_count++;
 		}
 		break;
 	default:
 		;
 	}
-#undef e1
-#undef e2
 }
 
 /*
-- 
2.43.0


