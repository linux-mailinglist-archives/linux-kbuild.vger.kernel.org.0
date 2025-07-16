Return-Path: <linux-kbuild+bounces-8017-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB69B080F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 01:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF739560594
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 23:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69082EF29F;
	Wed, 16 Jul 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUABKTlC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DC2EE60F;
	Wed, 16 Jul 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708347; cv=none; b=qfS/nMDR1Q+hI13PDeCNLQmceEvUaurK4JTEOdNAb5mu85ztkkmeSIXEKd4ERKTGg65nYYZZ1plnYYFUsrP+8tjxW8cLXQAjzULmMJOlTJB0aUCcN3zzCHjfgGNLr/PpfAeGDB+Z8ZbFUmEYsN8W2SQgdIlxdaxX1x4EpvrV8vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708347; c=relaxed/simple;
	bh=/oB4x2fY33AeIIap+cOdq5iykz/kR5cqetgjYon6kT0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNGVLHHxMRpUZlu/vp7qt9vsD8Elf+KBaJfa5ki5oUB+Ej5Ry2M2x2CVpPlcwQMDPEUjCuBb84GccWHL+r7245nEvjvp4rnFIOuEw9t8lhZMIj/fqRbqY5v73CNKQPplwC1SOCY0rz8fFMXmN6iS++6rhIWVVlC3SoP2tvf/cNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUABKTlC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C77C4CEE7;
	Wed, 16 Jul 2025 23:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752708347;
	bh=/oB4x2fY33AeIIap+cOdq5iykz/kR5cqetgjYon6kT0=;
	h=From:To:Cc:Subject:Date:From;
	b=KUABKTlCYQ2D5jl70fCIkhTE1FKboohNUusTtN/9gxSifF7vZwGmdf8wCIY7EZMvg
	 GqOIUvoNsGt2G99ihP/YQ4Fu3YTUdCWAdQjwT1c4CclJBmY0a0vwHAZqfJcFr+c8U0
	 uu20nTg7WCuexUwxrvZMmGMYVD2tfGWwBSq68kJ/JXT7JKRu7/eSyY9o2yP/uue/Lq
	 4R2+ammCW6EtGu9jxE4RcLojH3eF0QNbia55Y+y6MXhUt1iVLx70UcL+L9gRqwK5ao
	 65UhZKlSYz+moSGYn5W+wFznRl/ZGOQy8KQrUxldcmfMV8Ttdk6Nq5TTXJAogaYh9z
	 5xBt1bnqJlhtg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] kconfig: gconf: fix single view to display dependent symbols correctly
Date: Thu, 17 Jul 2025 08:24:08 +0900
Message-ID: <20250716232542.873747-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the following example, the symbol C was never displayed in Single
view. Fix the recursion logic so that all symbols are shown.

  menu "menu"

  config A
          bool "A"

  config B
          bool "B"
          depends on A

  config C
          bool "C"
          depends on B

  endmenu

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 7725d2c9d92a..c67b35807e8e 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -914,9 +914,7 @@ static gboolean on_treeview1_button_press_event(GtkWidget *widget,
 static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 			  GtkTreeIter *parent)
 {
-	struct property *prop;
 	struct menu *child;
-	enum prop_type ptype;
 	GtkTreeIter iter;
 
 	for (child = menu->list; child; child = child->next) {
@@ -929,9 +927,6 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 		if (child->type == M_IF)
 			continue;
 
-		prop = child->prompt;
-		ptype = prop ? prop->type : P_UNKNOWN;
-
 		if ((view_mode == SPLIT_VIEW)
 		    && !(child->flags & MENU_ROOT) && (tree == tree1))
 			continue;
@@ -943,16 +938,7 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 		gtk_tree_store_append(tree, &iter, parent);
 		set_node(tree, &iter, child);
 
-		if ((view_mode == SINGLE_VIEW) && (ptype == P_MENU))
-			continue;
-/*
-		if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
-		    || (view_mode == FULL_VIEW)
-		    || (view_mode == SPLIT_VIEW))*/
-
-		if (((view_mode == SINGLE_VIEW) && (menu->flags & MENU_ROOT))
-		    || (view_mode == FULL_VIEW)
-		    || (view_mode == SPLIT_VIEW))
+		if (view_mode != SINGLE_VIEW || child->type != M_MENU)
 			_display_tree(tree, child, &iter);
 	}
 }
-- 
2.43.0


