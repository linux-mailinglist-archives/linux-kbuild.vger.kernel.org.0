Return-Path: <linux-kbuild+bounces-2200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 973AC90CED2
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 15:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E1D91F21F4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1691BBBF5;
	Tue, 18 Jun 2024 12:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDtJsLW3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010351BBBEF;
	Tue, 18 Jun 2024 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714595; cv=none; b=sZF6BrTWS42S4AOOhld/KoI6WQX9WJe4anSRumyt5lZ2d36DYgwNPSC8WZVePKXwxsaNL3wqMl+WGKT26UPU0LQmHr9WhBOAc2nBmJNPS45qupSTSzykjoJMtDKYq4aHcPf8DNpSft7JJP06iitVCwDcilaUHRSAShlMiYyj7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714595; c=relaxed/simple;
	bh=mtKmnpNKk/XW5quuPM8GLHMtcxZJX+6UlMAagjYekFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjOrH3hf1qjGGK6PFByS4Gd/lsEGayoFEJd5+yIxE0xWkD4cVI8l+xL7B6JWHUwyltITzCKqb0SsOtGDGQnHMVrblEj+d1JLALyUNfvinjvF68T3wEYo+QxHbo+XR84hZLVYszHqC+dGETo3HWfQnzlrrJiCETDyw2ZfLy1wCSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDtJsLW3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE29C3277B;
	Tue, 18 Jun 2024 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718714594;
	bh=mtKmnpNKk/XW5quuPM8GLHMtcxZJX+6UlMAagjYekFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UDtJsLW3JuvzndU8NjOS3zzI06btNURePBUPM5z5iVW9Qt3a3CYmholGDV5On3C+Z
	 YDwwipdLwMyUm+3ylsSh00TfzFHItbkvVGazLG1S8zzThYJFegsIA13zc07Zt5hDUg
	 Mn1XMs+OQKVZX286pjKRhFty/mUlfB+FhYkTHFwbM9s/86Tca72pO/6Qw1Mr8hQw46
	 DpOo1ck5pMZLqEPVPYhQG5j5lgO4hM1vN4BnPqz4rRqODxzz1JWWSpWHyxKJJD6v1K
	 XR0bneNqVP/rNYwrtO3dF1wxheh2iWYaVSDlX3UwdZSXN4XY/S7Ah+XH47UnIWJjA9
	 rgIKu1/QU4xUw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 9/9] kconfig: remove wrong expr_trans_bool()
Date: Tue, 18 Jun 2024 08:42:57 -0400
Message-ID: <20240618124300.3304600-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618124300.3304600-1-sashal@kernel.org>
References: <20240618124300.3304600-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.278
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 77a92660d8fe8d29503fae768d9f5eb529c88b36 ]

expr_trans_bool() performs an incorrect transformation.

[Test Code]

    config MODULES
            def_bool y
            modules

    config A
            def_bool y
            select C if B != n

    config B
            def_tristate m

    config C
            tristate

[Result]

    CONFIG_MODULES=y
    CONFIG_A=y
    CONFIG_B=m
    CONFIG_C=m

This output is incorrect because CONFIG_C=y is expected.

Documentation/kbuild/kconfig-language.rst clearly explains the function
of the '!=' operator:

    If the values of both symbols are equal, it returns 'n',
    otherwise 'y'.

Therefore, the statement:

    select C if B != n

should be equivalent to:

    select C if y

Or, more simply:

    select C

Hence, the symbol C should be selected by the value of A, which is 'y'.

However, expr_trans_bool() wrongly transforms it to:

    select C if B

Therefore, the symbol C is selected by (A && B), which is 'm'.

The comment block of expr_trans_bool() correctly explains its intention:

  * bool FOO!=n => FOO
    ^^^^

If FOO is bool, FOO!=n can be simplified into FOO. This is correct.

However, the actual code performs this transformation when FOO is
tristate:

    if (e->left.sym->type == S_TRISTATE) {
                             ^^^^^^^^^^

While it can be fixed to S_BOOLEAN, there is no point in doing so
because expr_tranform() already transforms FOO!=n to FOO when FOO is
bool. (see the "case E_UNEQUAL" part)

expr_trans_bool() is wrong and unnecessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/expr.c | 29 -----------------------------
 scripts/kconfig/expr.h |  1 -
 scripts/kconfig/menu.c |  2 --
 3 files changed, 32 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 9f1de58e9f0c9..9e409418534b8 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -397,35 +397,6 @@ static struct expr *expr_eliminate_yn(struct expr *e)
 	return e;
 }
 
-/*
- * bool FOO!=n => FOO
- */
-struct expr *expr_trans_bool(struct expr *e)
-{
-	if (!e)
-		return NULL;
-	switch (e->type) {
-	case E_AND:
-	case E_OR:
-	case E_NOT:
-		e->left.expr = expr_trans_bool(e->left.expr);
-		e->right.expr = expr_trans_bool(e->right.expr);
-		break;
-	case E_UNEQUAL:
-		// FOO!=n -> FOO
-		if (e->left.sym->type == S_TRISTATE) {
-			if (e->right.sym == &symbol_no) {
-				e->type = E_SYMBOL;
-				e->right.sym = NULL;
-			}
-		}
-		break;
-	default:
-		;
-	}
-	return e;
-}
-
 /*
  * e1 || e2 -> ?
  */
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 017843c9a4f42..fbbd8ebe852a1 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -302,7 +302,6 @@ struct expr *expr_copy(const struct expr *org);
 void expr_free(struct expr *e);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
 tristate expr_calc_value(struct expr *e);
-struct expr *expr_trans_bool(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
 int expr_contains_symbol(struct expr *dep, struct symbol *sym);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d9d16469859ab..2c95e8a7ef165 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -387,8 +387,6 @@ void menu_finalize(struct menu *parent)
 				dep = expr_transform(dep);
 				dep = expr_alloc_and(expr_copy(basedep), dep);
 				dep = expr_eliminate_dups(dep);
-				if (menu->sym && menu->sym->type != S_TRISTATE)
-					dep = expr_trans_bool(dep);
 				prop->visible.expr = dep;
 
 				/*
-- 
2.43.0


