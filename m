Return-Path: <linux-kbuild+bounces-2080-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 877029042F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D0EE289C61
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D75155353;
	Tue, 11 Jun 2024 17:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiQRtqJg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F915534E;
	Tue, 11 Jun 2024 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128580; cv=none; b=S/R5LHgOx1xxB1SatxLj2R9yIPIWkjUjfyNqTp4Azxqnw89iLHyMkH+dtNk0+Jon0Yz/g0fPwAASq3OLCWlOdHSKj6wFHWpZfSmsERb/2UmQsOtBO0kMvPVPtToY2yvvA/rpphOt8OWsxpwEmKClj62mc18rlKa2ldvD9+EBbgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128580; c=relaxed/simple;
	bh=PBo//4aJrsXf6XHAbijgizpIwmV57rDMalOKmV3B/Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MRz+TJ89NzZW7BpoWRglI7SBThfoyvPmjeJpgzaW7ppSsG/NBTZI4R6y3FBDfxBlQFzJNQKl/vVJGOUJRy4+pipzOmNKpN4+8balluUnfQilkUO1qcR/ODtOFAbIKe0n/vfrHICvFkC1N5z21NwPuTOEitnYQsIx7QYn2l4q7g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiQRtqJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F8FC4AF49;
	Tue, 11 Jun 2024 17:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128579;
	bh=PBo//4aJrsXf6XHAbijgizpIwmV57rDMalOKmV3B/Hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiQRtqJg4d1N+9Za+l5rVpzW3RPzKc9n1FYfPCUWWUQpgEvKAbtxhGUTsqX4qZWJ7
	 hrOACGCvvEoJXX8T2FmcGDOivmMkdpE8zPdj/ayMiistj6FK3Go2aHrJx2Wn0fcQDv
	 N+UzalmTlf+8oQlXD8Sv5smqMsgRzGARrnCJN6gHG8dQsWwB+xPQYHM8/+NvBMGY8w
	 +MZ9ifUnukby2Kyi60EPIdXR3W6mL0Xlw30gbVQI/Z0GRmX552J3UdZ5IIHkO2M0Gy
	 yEdkKqJROXDsXs1Wjj9honfpeSoJ0ZuOpNWCepZ24apSD9wVRrhhY6Stg/qxdAOdZt
	 UupQIoo25l12w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/16] kconfig: remove E_LIST expression type
Date: Wed, 12 Jun 2024 02:55:25 +0900
Message-ID: <20240611175536.3518179-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

E_LIST was preveously used to form an expression tree consisting of
choice members.

It is no longer used.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c   | 15 ---------------
 scripts/kconfig/expr.h   |  2 +-
 scripts/kconfig/symbol.c |  3 +--
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index bea82d5cac83..6d4b5a5a1e62 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -90,7 +90,6 @@ struct expr *expr_copy(const struct expr *org)
 		break;
 	case E_AND:
 	case E_OR:
-	case E_LIST:
 		e->left.expr = expr_copy(org->left.expr);
 		e->right.expr = expr_copy(org->right.expr);
 		break;
@@ -286,7 +285,6 @@ int expr_eq(struct expr *e1, struct expr *e2)
 		expr_free(e2);
 		trans_count = old_count;
 		return res;
-	case E_LIST:
 	case E_RANGE:
 	case E_NONE:
 		/* panic */;
@@ -676,7 +674,6 @@ struct expr *expr_transform(struct expr *e)
 	case E_LTH:
 	case E_UNEQUAL:
 	case E_SYMBOL:
-	case E_LIST:
 		break;
 	default:
 		e->left.expr = expr_transform(e->left.expr);
@@ -947,7 +944,6 @@ struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symb
 		break;
 	case E_SYMBOL:
 		return expr_alloc_comp(type, e->left.sym, sym);
-	case E_LIST:
 	case E_RANGE:
 	case E_NONE:
 		/* panic */;
@@ -1097,10 +1093,6 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 		if (t2 == E_OR)
 			return 1;
 		/* fallthrough */
-	case E_OR:
-		if (t2 == E_LIST)
-			return 1;
-		/* fallthrough */
 	default:
 		break;
 	}
@@ -1173,13 +1165,6 @@ void expr_print(struct expr *e,
 		fn(data, NULL, " && ");
 		expr_print(e->right.expr, fn, data, E_AND);
 		break;
-	case E_LIST:
-		fn(data, e->right.sym, e->right.sym->name);
-		if (e->left.expr) {
-			fn(data, NULL, " ^ ");
-			expr_print(e->left.expr, fn, data, E_LIST);
-		}
-		break;
 	case E_RANGE:
 		fn(data, NULL, "[");
 		fn(data, e->left.sym, e->left.sym->name);
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 58fd4c8c3762..8849a243b5e7 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -26,7 +26,7 @@ typedef enum tristate {
 enum expr_type {
 	E_NONE, E_OR, E_AND, E_NOT,
 	E_EQUAL, E_UNEQUAL, E_LTH, E_LEQ, E_GTH, E_GEQ,
-	E_LIST, E_SYMBOL, E_RANGE
+	E_SYMBOL, E_RANGE
 };
 
 union expr_data {
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 9d9b73760969..b4d085342b94 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1306,8 +1306,7 @@ struct symbol *sym_check_deps(struct symbol *sym)
 
 struct symbol *prop_get_symbol(struct property *prop)
 {
-	if (prop->expr && (prop->expr->type == E_SYMBOL ||
-			   prop->expr->type == E_LIST))
+	if (prop->expr && prop->expr->type == E_SYMBOL)
 		return prop->expr->left.sym;
 	return NULL;
 }
-- 
2.43.0


