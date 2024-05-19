Return-Path: <linux-kbuild+bounces-1888-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 757268C94CA
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 15:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D7252814E2
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 13:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B264745025;
	Sun, 19 May 2024 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ucnnH8LJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249D1401B;
	Sun, 19 May 2024 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716125797; cv=none; b=ZnHguPgU3OSiUeMiEKCkuy8DPByEiL04tfVjNsE42qYC8V4YiVaj+5COJFpVacxVif1dZqnSaDObjjwzjhMXXqqQ5HNv+Ht/INzGN9KWdnHJx8fVeHAHjD15sPpGnuloDQh4JBeA139YIVBMy4vb/XcqLw7l2GKHLYCeD+8Ivwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716125797; c=relaxed/simple;
	bh=3zOjnH9twAh9RM0OcFtavYQmwEm7aEsSMb4hvSGCWQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jwimo9cuSxmhWq/WHTjBIAIGzEpH2EdyLbQ2H3XdrfZrZ7I6JQjgkY6Srrjd3hDzs1CgMg95saAm/JKgOCmO0Tztkakul5NDket1xsfY8qMrRknGf2EQjd12D8MpjwMRfePICjaXuzKDQedefhDrOoXH0jFYhieAhGGawwMsbCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ucnnH8LJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE59C32781;
	Sun, 19 May 2024 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716125797;
	bh=3zOjnH9twAh9RM0OcFtavYQmwEm7aEsSMb4hvSGCWQc=;
	h=From:To:Cc:Subject:Date:From;
	b=ucnnH8LJCe325CEDMcyTrpY+mLGB1UDFRhUMEav8uWgWcqFVmiRe1PrsZssHz1n73
	 drml/18VK7u52aaB7BMqfiVQuRsGXLGMRqotEhnX/hLLraFCEpwKHrfpx431TbYJsW
	 QJxam1YnoZU7C7rdXyf7XX8hoLLvULMND7GxjGDXUArlVtbO2OUCaz61U/+DFbptIK
	 8gpUvfhN1iRGul+hI+6YQhQZ3EQCrZaQIHQLOirQVDWM+CPblIXqaFizaYKspwWsZN
	 dI0rQKb4SEtif4MOHyq277HXMAPj2e9fb2bgh74dvpHcXRRo3TBCfOb2wLf7Qii9XQ
	 Z0Jb3nn9L48pQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: remove redundant check in expr_join_or()
Date: Sun, 19 May 2024 22:34:02 +0900
Message-Id: <20240519133403.2121105-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check for 'sym1 == sym2' is redundant here because it has already
been done a few lines above:

    if (sym1 != sym2)
            return NULL;

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index a290de36307b..4d95fce5f9a7 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -476,7 +476,7 @@ static struct expr *expr_join_or(struct expr *e1, struct expr *e2)
 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
 		}
 	}
-	if (sym1->type == S_BOOLEAN && sym1 == sym2) {
+	if (sym1->type == S_BOOLEAN) {
 		if ((e1->type == E_NOT && e1->left.expr->type == E_SYMBOL && e2->type == E_SYMBOL) ||
 		    (e2->type == E_NOT && e2->left.expr->type == E_SYMBOL && e1->type == E_SYMBOL))
 			return expr_alloc_symbol(&symbol_yes);
-- 
2.40.1


