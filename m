Return-Path: <linux-kbuild+bounces-3475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA75970790
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 14:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CBBE282004
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 12:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA46166F1D;
	Sun,  8 Sep 2024 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgGJ61pR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D0158207;
	Sun,  8 Sep 2024 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725799449; cv=none; b=ke6VhdKa/MWe+kBlRC4VQiUlpGsroskupoCTex2lHi8dpSWG8PmkuLYkGS5GNTcQH5DI/mIfpZbXuOwjaMDu5MvOwlldpWR8VlQ/JNkJ9T/KDOFOPU9Euw5m+ApuRC2dUvgFyF+0ZGfyqTms/9Rr+2Lj9w5/w+PYE4KFdCg0No0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725799449; c=relaxed/simple;
	bh=kv+vHc8mbpg5KVF2uw90wNMXJvKCsvKQlGuPl3Mon4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ise//PX4pgPpal3ZLCqr2+hqg2N4sj1ZBS1MIVszIZtg1zVChfiv0BYXIowPKKM3CglXVfds9u+C8GyN6uosV+d+l6WBDf3Q7wtMC3ZZdLSFgtSi7QMMkRyAoVVWvsQOhHB/y7JabI4TdafT2y8MvnyqrqmpMubek6Wpqaxz1hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgGJ61pR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E10C4CEC9;
	Sun,  8 Sep 2024 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725799448;
	bh=kv+vHc8mbpg5KVF2uw90wNMXJvKCsvKQlGuPl3Mon4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fgGJ61pRJmS6lIcw3O0kM95yQDttE/WnfX6SXr+Yp4WM4UlCjKgQ/c4nj3qolGF80
	 LoypfmzV+zFSRCB0vJkZqfNjASuW0yMwovFJetwlbsDMjzvMLFK4g/rEyXb0Y/3xTG
	 647WK+j21Kvp/UQAsPQ87lk7BKcdm4nwtNmJgFTL6hnh08uj0r8ANaOkZYoGWL4Eks
	 vocFWuQq9ho9c8/48J7Nxl48ejqPvGYV0NeZPyxUA9xmOSUpwB+iFZQP4KgkTlsfgn
	 kCBzNcZO5SEme8nmazP4qM8pr4wBdrIcKm7BMeyHrRQne4ULizys7xtWxUvYV/n5Lq
	 CRUaNLLy+RWFw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/6] kconfig: refactor expr_eliminate_dups()
Date: Sun,  8 Sep 2024 21:43:19 +0900
Message-ID: <20240908124352.1828890-4-masahiroy@kernel.org>
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

Currently, expr_eliminate_dups() passes two identical pointers down to
expr_eliminate_dups1(), which later skips processing identical leaves.

This approach is somewhat tricky and, more importantly, it will not work
with the refactoring made in the next commit.

This commit slightly changes the recursion logic; it deduplicates both
the left and right arms, and then passes them to expr_eliminate_dups1().
expr_eliminate_dups() should produce the same result.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index e83fe0c3d62f..5b826d197f12 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -578,16 +578,6 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 
 	/* *ep1 and *ep2 are leaves. Compare and process them. */
 
-	if (*ep1 == *ep2)
-		return;
-
-	switch ((*ep1)->type) {
-	case E_OR: case E_AND:
-		expr_eliminate_dups1((*ep1)->type, ep1, ep1);
-	default:
-		;
-	}
-
 	switch (type) {
 	case E_OR:
 		tmp = expr_join_or(*ep1, *ep2);
@@ -634,7 +624,9 @@ struct expr *expr_eliminate_dups(struct expr *e)
 		trans_count = 0;
 		switch (e->type) {
 		case E_OR: case E_AND:
-			expr_eliminate_dups1(e->type, &e, &e);
+			e->left.expr = expr_eliminate_dups(e->left.expr);
+			e->right.expr = expr_eliminate_dups(e->right.expr);
+			expr_eliminate_dups1(e->type, &e->left.expr, &e->right.expr);
 		default:
 			;
 		}
-- 
2.43.0


