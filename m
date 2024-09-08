Return-Path: <linux-kbuild+bounces-3473-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A359B97078B
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 14:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8031F20B68
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 12:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AD6165F15;
	Sun,  8 Sep 2024 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZmO1/BE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA131165F01;
	Sun,  8 Sep 2024 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799446; cv=none; b=FxHoskSnqkZZpuQ25u3qyyZ7v8CiF+Sa0M/vjSIUjCFcWjhzw2xmiPw/is5VlfGNFKnYgaoRxmZ0LasYr2tXjq+CiuF77nQQQfpA4PAcBLXdTjkXNBhikqWiaWy5SZ68cCgP3qHIXonQwAnZEEOdCllujSR34pMyyLHmbY7Tiqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799446; c=relaxed/simple;
	bh=4LXYQvQc2no5tWKFYWcwrQMNZ+2XmcVjWZzCRnlScNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmMLO10xLRpRwU07lBd70Xdocl/fcnb+OZZk8J1zYzh2WniSRrH2zR65fyTUemclCkoLpI1IZpPHdUmkPYKs2lmpz+lMBSIdUR6cV7PspOc747lpKzwVcWzljwuwAzCQozesvBEX/7D42GWV3v7GWeE5cIXj5G44g7QGAgizA7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZmO1/BE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA0CC4CEC9;
	Sun,  8 Sep 2024 12:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725799446;
	bh=4LXYQvQc2no5tWKFYWcwrQMNZ+2XmcVjWZzCRnlScNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZmO1/BE2qkbCxp7GpGiDIuDYq53jg2qKNuQtGc3UGvrDlQoRQob/RMzaFtEBLVz6
	 kwpM1MhyHNmS4E+rFEnXJxWAhacLvAZxBLWvEbXSntkhb0kSGF2pNRyj1HhnXbmDz3
	 muy8tkebKt27E1CGMsK30HkzdYuRz4N5nfAoBl4kR5it+01CfzYCkxcoAfmK7JSrXo
	 WKw6MvTDTHgPviQvsP/nT8uPFuSLR95Nywccq+UeTICST6Tc++smaxcA2OngovqqQI
	 6depTXoORos66g2uGo8oLUh3Ey5gKTmSQ7PDlj6cyzt90rFEengG+BTqXHCMGmCk1i
	 iE1qbP6DKZEhQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/6] kconfig: change some expr_*() functions to bool
Date: Sun,  8 Sep 2024 21:43:17 +0900
Message-ID: <20240908124352.1828890-2-masahiroy@kernel.org>
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

This clarifies the behavior of these functions.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 15 ++++++++-------
 scripts/kconfig/expr.h |  6 +++---
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index a16451347f63..d5dc682f7dc6 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -243,9 +243,10 @@ void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
  * equals some operand in the other (operands do not need to appear in the same
  * order), recursively.
  */
-int expr_eq(struct expr *e1, struct expr *e2)
+bool expr_eq(struct expr *e1, struct expr *e2)
 {
-	int res, old_count;
+	int old_count;
+	bool res;
 
 	/*
 	 * A NULL expr is taken to be yes, but there's also a different way to
@@ -255,7 +256,7 @@ int expr_eq(struct expr *e1, struct expr *e2)
 		return expr_is_yes(e1) && expr_is_yes(e2);
 
 	if (e1->type != e2->type)
-		return 0;
+		return false;
 	switch (e1->type) {
 	case E_EQUAL:
 	case E_GEQ:
@@ -292,7 +293,7 @@ int expr_eq(struct expr *e1, struct expr *e2)
 		printf(" ?\n");
 	}
 
-	return 0;
+	return false;
 }
 
 /*
@@ -804,10 +805,10 @@ struct expr *expr_transform(struct expr *e)
 	return e;
 }
 
-int expr_contains_symbol(struct expr *dep, struct symbol *sym)
+bool expr_contains_symbol(struct expr *dep, struct symbol *sym)
 {
 	if (!dep)
-		return 0;
+		return false;
 
 	switch (dep->type) {
 	case E_AND:
@@ -829,7 +830,7 @@ int expr_contains_symbol(struct expr *dep, struct symbol *sym)
 	default:
 		;
 	}
-	return 0;
+	return false;
 }
 
 bool expr_depends_symbol(struct expr *dep, struct symbol *sym)
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index c82d08bbd704..4ab7422ddbd8 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -278,11 +278,11 @@ struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
 struct expr *expr_copy(const struct expr *org);
 void expr_free(struct expr *e);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
-int expr_eq(struct expr *e1, struct expr *e2);
+bool expr_eq(struct expr *e1, struct expr *e2);
 tristate expr_calc_value(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
-int expr_contains_symbol(struct expr *dep, struct symbol *sym);
+bool expr_contains_symbol(struct expr *dep, struct symbol *sym);
 bool expr_depends_symbol(struct expr *dep, struct symbol *sym);
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
 
@@ -292,7 +292,7 @@ void expr_gstr_print(const struct expr *e, struct gstr *gs);
 void expr_gstr_print_revdep(struct expr *e, struct gstr *gs,
 			    tristate pr_type, const char *title);
 
-static inline int expr_is_yes(const struct expr *e)
+static inline bool expr_is_yes(const struct expr *e)
 {
 	return !e || (e->type == E_SYMBOL && e->left.sym == &symbol_yes);
 }
-- 
2.43.0


