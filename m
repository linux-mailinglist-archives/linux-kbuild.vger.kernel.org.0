Return-Path: <linux-kbuild+bounces-1981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890868D8705
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 18:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4439A2836EE
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382A1136987;
	Mon,  3 Jun 2024 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQxmAnTA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10451136678;
	Mon,  3 Jun 2024 16:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717431551; cv=none; b=beUNQp49hzRA0cuR21XDijtA5gockW2yJZWckL5QW+qMMLxPuQALhOtOTheovWOw2hWaucf8b8veP+Y8jWiGb82cRseQCvCmc65k8ax4vmydoD2dfSEyqsqxGi/1BH372ubzxQLFS36KTVW2ozFTmnZMFDLqrLBFzjlxcORv7WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717431551; c=relaxed/simple;
	bh=sDykRe91pnVD0aexHRUrL+T0DqPd40abH1ku26aKwb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NYrySQ9mGECDq4qt65ljTKAPFGv3G8nyaR7Aj4Uzx/eNm6UdOrZWiVc691H88kNwCQS+mA31cqCScTkJvpnlzpA6n1foUaGFSqjwuJgcVcQKdI5bjZdMDx+hw05xh9/94jAmsl2cob6yp1/SzaHlR8VWZA00xq33nIEsPZ//H4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQxmAnTA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B9DC4AF0B;
	Mon,  3 Jun 2024 16:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717431550;
	bh=sDykRe91pnVD0aexHRUrL+T0DqPd40abH1ku26aKwb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQxmAnTAqzNIBBqxRpYsPrOV0V4qbolxwqi2y3tMK6SJVzoO00FKwjrWKNxfp9BEA
	 1NU8/Ct9DGzSkPRBhMmmc4RFhnadeAJZZjYfhqFcVThGoXd/Q4Q9oPo9rK/ToItTfC
	 6HrDPXcvBsHq2EcoliLlO83u1Q5wGUf4WM2Y12YeCPKcG3FagmH0PCPDoS/vXIYJl2
	 mp/2Q27IQQGqSP0vNZkQpFtfDJCwOAOFPvAwz4tc0UyrcSZVQeMNQ/Kk++Xriwf0j7
	 GPhcUY5vYmO0xBygt9hB2oBY3t5qV3/OEkhLfliXjztd3VocGNcURc227CUIarixJB
	 7SUqPhu37bnKQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kconfig: remove wrong expr_trans_bool()
Date: Tue,  4 Jun 2024 01:19:04 +0900
Message-Id: <20240603161904.1663388-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240603161904.1663388-1-masahiroy@kernel.org>
References: <20240603161904.1663388-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

This result is incorrect because CONFIG_C=y is expected.

Documentation/kbuild/kconfig-language.rst clearly explains the function
of the '!=' operator:

  (3) If the values of both symbols are equal, it returns 'n',
      otherwise 'y'.

Therefore, the statement:

    select C if A != n

should be equivalent to:

    select C if y

Hence, the symbol C should be selected by 'y' instead of 'm'.

The comment block of expr_trans_bool() correctly explains its intention:

  * bool FOO!=n => FOO
    ^^^^

If FOO is bool, FOO!=n can be simplified into FOO. This is correct.

However, the actual code performs this transformation when FOO is
tristate.

    if (e->left.sym->type == S_TRISTATE) {
                             ^^^^^^^^^^

While, it can be fixed to S_BOOLEAN, there is no point in doing so
because expr_tranform() already transforms FOO!=n to FOO when FOO is
bool. (see the "case E_UNEQUAL" part)

expr_trans_bool() is wrong and unnecessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 29 -----------------------------
 scripts/kconfig/expr.h |  1 -
 scripts/kconfig/menu.c |  2 --
 3 files changed, 32 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 4d95fce5f9a7..fcc190b67b6f 100644
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
index fa50fc45622e..7c0c242318bc 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -284,7 +284,6 @@ void expr_free(struct expr *e);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
 int expr_eq(struct expr *e1, struct expr *e2);
 tristate expr_calc_value(struct expr *e);
-struct expr *expr_trans_bool(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
 int expr_contains_symbol(struct expr *dep, struct symbol *sym);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 53151c5a6028..eef9b63cdf11 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -398,8 +398,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 				dep = expr_transform(dep);
 				dep = expr_alloc_and(expr_copy(basedep), dep);
 				dep = expr_eliminate_dups(dep);
-				if (menu->sym && menu->sym->type != S_TRISTATE)
-					dep = expr_trans_bool(dep);
 				prop->visible.expr = dep;
 
 				/*
-- 
2.40.1


