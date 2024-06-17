Return-Path: <linux-kbuild+bounces-2153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF2D90B14C
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 16:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B6428A18C
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 14:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23ACE19FBC7;
	Mon, 17 Jun 2024 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxiWX9A/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78F19FBC2;
	Mon, 17 Jun 2024 13:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718630856; cv=none; b=rc4MDx31YCa/m5W9us56NLLL3v5adwqFjEqUxzX/0Blxfk0cOcIKOf+JLIfwAUHmXyS113Bsl1GDojsFzrNoUlx+OaRkctXhdcvKVM4LOYKt2QxJ2CbqlQMBnWFsPCL/MSfCcmgD+ooOaMEi/ihPCOcCD9kChFj91ahsMuiRMEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718630856; c=relaxed/simple;
	bh=fSSCSXLeOzmRV7GPuyzZNQRkSoTvXuyzp8El8fot1eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTvACXEZjudRBhCL1UZNQozzm+Or/7EKc3P+sMhcz1CC5EGXrfDwOhI7cG75Y3JbjLOKOoGpWaAnOBS92NwWNMOz4fNLCh5/UuI+k7AL4Hz737Hz5A81O/YpXT8A3nWPBNclNzM4vLGaPaz5INLpkZFHBOM1rcGw5yg5E5xuVMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxiWX9A/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FB5C4AF1D;
	Mon, 17 Jun 2024 13:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718630855;
	bh=fSSCSXLeOzmRV7GPuyzZNQRkSoTvXuyzp8El8fot1eA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uxiWX9A/DhSXqsyzGvz9QhDZm8+dc1/CZNW+ZDYJ1eeswBYIZMzd8lnrFLf+ePdJx
	 hjvNphA6FsmP1pqKEhblnuUOR3wU4KWdvqw3ogsVnWLUzQac0iHj5G2puy21RWg7gI
	 k+px2PBR58Eu+Lge5fUQ0gp5hgCsiQ4zsW5mdGH/YRUew4eQK5AFYITKL1+b5T6AS+
	 fx7KLTKgVvpSQb9VifutxNQPUsZAbX9k61LsKeKjf9fuXdjQOB+e9k9M6mM+rU1M8Y
	 l2dveweHQh51BD5HJaqNf3rQqfZQYuq9O1QQE3fmNLrGLLCxh+80A0TCf6XfVOXiJM
	 bz4z8EioDhHxw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 13/13] kconfig: remove wrong expr_trans_bool()
Date: Mon, 17 Jun 2024 09:27:02 -0400
Message-ID: <20240617132710.2590101-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617132710.2590101-1-sashal@kernel.org>
References: <20240617132710.2590101-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.219
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
index 81ebf8108ca74..81dfdf4470f75 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -396,35 +396,6 @@ static struct expr *expr_eliminate_yn(struct expr *e)
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
index 5c3443692f346..385a47daa3643 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -302,7 +302,6 @@ void expr_free(struct expr *e);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
 int expr_eq(struct expr *e1, struct expr *e2);
 tristate expr_calc_value(struct expr *e);
-struct expr *expr_trans_bool(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
 int expr_contains_symbol(struct expr *dep, struct symbol *sym);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index a5fbd6ccc006e..e5ad6313cfa1d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -401,8 +401,6 @@ void menu_finalize(struct menu *parent)
 				dep = expr_transform(dep);
 				dep = expr_alloc_and(expr_copy(basedep), dep);
 				dep = expr_eliminate_dups(dep);
-				if (menu->sym && menu->sym->type != S_TRISTATE)
-					dep = expr_trans_bool(dep);
 				prop->visible.expr = dep;
 
 				/*
-- 
2.43.0


