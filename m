Return-Path: <linux-kbuild+bounces-7677-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A59AE6AB5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 626965A3485
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3302FBFE5;
	Tue, 24 Jun 2025 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bayJ/vIk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD82FBFE1;
	Tue, 24 Jun 2025 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777740; cv=none; b=HO2jvdeNH9rDvyh0leREXAigwZ9S9rdzOn9kjJHUkyUtMIaminIvado7mC0LQEyce5nM5dKLCdjzy6EKEqzuPDz7m7hn+UYgCPCKgn7tWf99xfSPfYh+SPzNyaU1Wh50tEMROg4twCJut8Gtia+4sFinBcSZ8vPKlsZEOxu/dc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777740; c=relaxed/simple;
	bh=06rZLWBazpQ9tGXbkXlybCFX2VlRsw2zu1ihD0jaZnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFUUC1HeJrFOy1Fn4xvHCo9mDJBpmUPU6M0zVrFqhmjG75IrYryYa9eBEpS+sZ09aFT9s9Ln2Bwn6juO8vr4Mz988+y+W2Ff7Fc6iUcBOfnzeoWKtMqTVZLavaXYWDnlc2b9GC3iuryzZj+bFKmRvskPf+rbute/yGw4ok3EPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bayJ/vIk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1034C4CEE3;
	Tue, 24 Jun 2025 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777740;
	bh=06rZLWBazpQ9tGXbkXlybCFX2VlRsw2zu1ihD0jaZnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bayJ/vIki9oKHMtMZZVH24txlsSukTgLXQNqrcyP0o3KXkLTf1RVgNqhWhndNjVKT
	 eWnFQrYgZmlj8Thb/pb+tEGljdRSFdinnnnJ+CwXnmnvt1HA7WI7LLvP6e9NO+CbsR
	 D4YTKl5w9iTCc4kXL4BHaOWqjW3fgFhm1r6LFgw2K1+0ob+3q8VUR9IXyuKg7LLVvt
	 lIXIfhlIr5HpxqS9gFVHXmhJif02SgpYEWjCI5KZ5Dtm8Y695/DOEmjLPgljhwIig1
	 Fj5xcwGrDvAwQrlo9vPmbfkrSsC3aGlX440ASXBcasuTguikbx5NruuVa/RndFL+LP
	 1xzWFG0IHdYlg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 50/66] kconfig: gconf: remove dead code in display_tree_part()
Date: Wed, 25 Jun 2025 00:05:38 +0900
Message-ID: <20250624150645.1107002-51-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is no longer called in the FULL_VIEW mode, so remove the
dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 29b73f0bea38..64defbe59afc 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -974,10 +974,7 @@ static void display_tree(GtkTreeStore *store, struct menu *menu)
 static void display_tree_part(void)
 {
 	gtk_tree_store_clear(tree2);
-	if (view_mode == SINGLE_VIEW || view_mode == SPLIT_VIEW)
-		display_tree(tree2, browsed);
-	else if (view_mode == FULL_VIEW)
-		display_tree(tree2, &rootmenu);
+	display_tree(tree2, browsed);
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
 }
 
-- 
2.43.0


