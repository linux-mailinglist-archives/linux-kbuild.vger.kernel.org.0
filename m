Return-Path: <linux-kbuild+bounces-2419-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 913939298AC
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 17:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58493B20ABF
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 15:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576E126AC1;
	Sun,  7 Jul 2024 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxulsIlo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D26B1865B;
	Sun,  7 Jul 2024 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720366743; cv=none; b=ec3XewRUIk1Ncw9jCTD/poOLNfB2RteEML11YsupaS5TDElbc5v+s31e+m4BrmAhiXXbcofGEV22EsUI2bqjwJUc3UNmlZ/lc+rMbtNWaeU83XS10ZFRvQPdaX3VW0uBldjuKxkGhP5O/onlYnUN8XVdeXZsw6GghEsxCeJCIqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720366743; c=relaxed/simple;
	bh=uWSCu9FKRpxsc31Anmfae7tDKV0+IKVLEdfz3P7wDSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7FhAk6uPKZcZDse4DPlfoykNLyXQixUojVHsRfsR4TJwb2Zhuo5cyL3nALPoCqCXs6ZvKLDQRRNWVP/Njvzp8QNC9coKNpRdXnGp1iPcvL9m7RxzSHO+p5UgF+hOj2SDZsDBnjaus4HBb8MhSFo9RZdsO79xAtVmi18mx36CS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxulsIlo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB20C4AF0B;
	Sun,  7 Jul 2024 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720366742;
	bh=uWSCu9FKRpxsc31Anmfae7tDKV0+IKVLEdfz3P7wDSs=;
	h=From:To:Cc:Subject:Date:From;
	b=lxulsIloRg2CeJk6OvWo43kBw/+RNw55JopxJWzamG/222fdI1IEgsYfv/sOdO2/i
	 XMaZs2iPsqhheTW1sb5PNnYA6kbt7N4dk2HF5Bz03e6SoffnxXjqLANWJHE5iXNeWe
	 mKj4EsFcCH9RwSc/okKYTSG088iHU2GxTLXvCVk+8wq8KABeDOqE+WIWQXYkrZ7sOF
	 f83jQUKvJrPCQqkX8CfwlPxYEjNGg+mSYrCee5DxkkYYuRpaE4NeIqtksFRjv9HKHz
	 WZN9quY0MGRJ7lpp8TNkXNBpuS3gPQZArA1oEizZiLX7Eyosj9CVarPNWMs6tbrx2P
	 on5O1w4hnqD+Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/4] kconfig: call expr_eliminate_yn() at least once in expr_eliminate_dups()
Date: Mon,  8 Jul 2024 00:38:04 +0900
Message-ID: <20240707153856.2483047-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig simplifies expressions, but redundant '&&' and '||' operators
involving constant symbols 'y' and 'n' are sometimes trimmed and
sometimes not.

[Test Code]

    config DEP
            def_bool y

    config A
            bool "A"
            depends on DEP && y

    config B
            bool "B"
            depends on DEP && y && y

[Result]

    $ make helpnewconfig
      [ snip ]
    -----

    There is no help available for this option.
    Symbol: A [=n]
    Type  : bool
    Defined at Kconfig:4
      Prompt: A
      Depends on: DEP [=y] && y [=y]
      Location:
        -> A (A [=n])

    -----
    -----

    There is no help available for this option.
    Symbol: B [=n]
    Type  : bool
    Defined at Kconfig:8
      Prompt: B
      Depends on: DEP [=y]
      Location:
        -> B (B [=n])

    -----

The dependency for A, 'DEP && y', remains as-is, while that for B,
'DEP && y && y', has been reduced to 'DEP'.

Currently, expr_eliminate_dups() calls expr_eliminate_yn() only when
trans_count != 0, in other words, only when expr_eliminate_dups1() has
trimmed at least one leaf. It fails to trim a single '&& y', etc.

To fix this inconsistent behavior, expr_eliminate_yn() should be called
at least once even if no leaf has been trimmed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 6d4b5a5a1e62..b2dfd3123a5d 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -637,7 +637,7 @@ struct expr *expr_eliminate_dups(struct expr *e)
 		return e;
 
 	oldcount = trans_count;
-	while (1) {
+	do {
 		trans_count = 0;
 		switch (e->type) {
 		case E_OR: case E_AND:
@@ -645,11 +645,8 @@ struct expr *expr_eliminate_dups(struct expr *e)
 		default:
 			;
 		}
-		if (!trans_count)
-			/* No simplifications done in this pass. We're done */
-			break;
 		e = expr_eliminate_yn(e);
-	}
+	} while (trans_count); /* repeat until we get no more simplifications */
 	trans_count = oldcount;
 	return e;
 }
-- 
2.43.0


