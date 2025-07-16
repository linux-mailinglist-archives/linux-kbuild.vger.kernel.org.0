Return-Path: <linux-kbuild+bounces-8018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E1B080FA
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 01:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A825D565CCC
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 23:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC702EF677;
	Wed, 16 Jul 2025 23:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riCN4pma"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302227281F;
	Wed, 16 Jul 2025 23:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708349; cv=none; b=MzEqtbY2o6UTb6h710xWzMhmqAoPLSzI1MzXiqraVijCMXESPTqntgUWTzdDO36bMnY0CHcbD8lffJngGaEW53s4yxLmkrh98tJS/Q+7jj3TD5Pr/qrrc2IpOGFD9H3lzTGFm4UDQnzYLcTeZ6Kv4kbNckfafd+vxwc1d6bynEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708349; c=relaxed/simple;
	bh=ABjov0yRO9SIqH2T1GjUhudmgn/ZUVNqwLFrx73q9dI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geVyGVZ2Hxo5vWfkEWWWdXtUAaaZDKaRbToWXG2oByh3PuUZ/xoqiXCU9dZT37EOVsHLI9pPD3uXJBihe2aok+n0mXZL17W71HRZ0C53C7S94F6l3M9rXCy62TiKmhDy6qkiKpxLNASU735EORBCWu7/W8mdCwTY3jO1LSGqhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riCN4pma; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934DEC4CEEB;
	Wed, 16 Jul 2025 23:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752708348;
	bh=ABjov0yRO9SIqH2T1GjUhudmgn/ZUVNqwLFrx73q9dI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=riCN4pmarVhMmIEkZVZYHxk2iFAb5auvZMZCV8bAMb0F6WSR3s7O6RZnANEcuXjQY
	 SxiFRgxELNH8udRikSOOM9I8yWRAjWV52tugaPT1qqDRbXAFHXytUfCDR0/MmkSDT9
	 +W3HzDkrg+Z/Okt2zFriq0mJgku/GgF3rOMa/BiyJ+QPXtq5B9rj2+OkRiSoiYt9rX
	 1+QK1PMYPDbZ5t5X+laF356NrdWclWnPrUaCTAwSW+uqyzNZJ9Kvd4uN0iFr36QxwC
	 mTN67eUgjWUq+rSEcgKgGTN0heLBbumKmz177EmNb8X5TC+KGm0ij8aFPT0peIFdF9
	 IG5CtIkrAMoFQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] kconfig: gconf: Fix Back button behavior
Date: Thu, 17 Jul 2025 08:24:09 +0900
Message-ID: <20250716232542.873747-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716232542.873747-1-masahiroy@kernel.org>
References: <20250716232542.873747-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clicking the Back button may navigate to a non-menu hierarchy level.

[Example]

  menu "menu1"

  config A
          bool "A"
          default y

  config B
          bool "B"
          depends on A
          default y

  menu "menu2"
          depends on B

  config C
          bool "C"
          default y

  endmenu

  endmenu

After being re-parented by menu_finalize(), the menu tree is structured
like follows:

  menu "menu1"
  \-- A
      \-- B
          \-- menu "menu2"
              \-- C

In Single view, visit "menu2" and click the Back button. It should go up
to "menu1" and show A, B and "menu2", but instead goes up to A and show
only B and "menu2". This is a bug in on_back_clicked().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index c67b35807e8e..d9ea71664412 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -553,12 +553,8 @@ static void on_license1_activate(GtkMenuItem *menuitem, gpointer user_data)
 /* toolbar handlers */
 static void on_back_clicked(GtkButton *button, gpointer user_data)
 {
-	enum prop_type ptype;
+	browsed = menu_get_parent_menu(browsed) ?: &rootmenu;
 
-	browsed = browsed->parent;
-	ptype = browsed->prompt ? browsed->prompt->type : P_UNKNOWN;
-	if (ptype != P_MENU)
-		browsed = browsed->parent;
 	recreate_tree();
 
 	if (browsed == &rootmenu)
-- 
2.43.0


