Return-Path: <linux-kbuild+bounces-7676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0028AE6ACB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D76B16B948
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776A22F94A8;
	Tue, 24 Jun 2025 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uyzeyyis"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7422F949D;
	Tue, 24 Jun 2025 15:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777738; cv=none; b=pNB2ytPjvVnOKny2I7Ou7uOG7PgW43HOxz4PZDnYyKRO/LldpBhyEJ4njeV3XvziTAlmEU2RcieV3kCnfGsr1YvNJQjRUnSj0m48fl6oCMhjYrvply/HBFlKJ39kIn7n2hJSuxzjqUh3c1l24gaPX9NQ9K7Ex24A8QRY61zhYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777738; c=relaxed/simple;
	bh=vu6L3/V67OE7+Pil3oqFcjU/RjpFh4fq9CGIuiBcMTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZf60/hBdR3W2Zj9qle6dW/vyzpkcE4Gk419Nlu1yHYm+pukatdkxIY7hVUZm6kidy3bECynahXfpnxUpw5gfacXKvX9AoATjL/JcizDjN8jUDHiIiv5vh7aOUA+AGH2jc7KHxk7l4HfHMJp2WoFFzDY+NBaD9qDFmgZduQrOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uyzeyyis; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836D7C4CEF1;
	Tue, 24 Jun 2025 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777737;
	bh=vu6L3/V67OE7+Pil3oqFcjU/RjpFh4fq9CGIuiBcMTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyzeyyisF/tF+vA6CNyQGUrZuxMW4F1eSIrqScz3HHQu37ft6M5o4nWLMICOBEDlz
	 UcdFwOdcc8bkvAit8V1q5YFdo9iMrW9xHB2kCDQnEDmHhPF1T8ok5K2o2d/VWsRSmu
	 m45HJMIUQjcft/2KojzfBpOC/au2xMFOuCAd4YLeAFcZlsO2/1bhwzE4cNSFU43wa5
	 ZgwfkbwtZ4hlnWusRASm4NWNftj+mCRQ6Nogi9yeSqaY1c6PvWnB49Fe1MV/QlNeY8
	 e+nxi4C0o515zh/cAf7gZ5eT16ZTtsmK5iUIeYgMOMCFCFWkssTRYBi5yzehczmQjI
	 dfH1c5QsOqyXg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 49/66] kconfig: gconf: inline display_list() into set_view_mode()
Date: Wed, 25 Jun 2025 00:05:37 +0900
Message-ID: <20250624150645.1107002-50-masahiroy@kernel.org>
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

This function is now only called by set_view_mode(), so inline it
for simplicity.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index a358589535e3..29b73f0bea38 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -56,7 +56,6 @@ enum {
 	COL_NUMBER
 };
 
-static void display_list(void);
 static void display_tree(GtkTreeStore *store, struct menu *menu);
 static void display_tree_part(void);
 
@@ -292,8 +291,10 @@ static void set_view_mode(enum view_mode mode)
 			else
 				browsed = menu_get_parent_menu(selected);
 		}
+		gtk_tree_store_clear(tree1);
+		display_tree(tree1, &rootmenu);
+		gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));
 		gtk_tree_store_clear(tree2);
-		display_list();
 		if (browsed)
 			display_tree(tree2, browsed);
 		select_menu(GTK_TREE_VIEW(tree1_w), browsed);
@@ -980,15 +981,6 @@ static void display_tree_part(void)
 	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree2_w));
 }
 
-/* Display the list in the left frame (split view) */
-static void display_list(void)
-{
-	gtk_tree_store_clear(tree1);
-
-	display_tree(tree1, &rootmenu);
-	gtk_tree_view_expand_all(GTK_TREE_VIEW(tree1_w));
-}
-
 static void fixup_rootmenu(struct menu *menu)
 {
 	struct menu *child;
-- 
2.43.0


