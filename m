Return-Path: <linux-kbuild+bounces-7736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9CDAECFA1
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAFE8174050
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD032397B0;
	Sun, 29 Jun 2025 18:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojAeSwWZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F66238D56;
	Sun, 29 Jun 2025 18:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222760; cv=none; b=KDkPT/KB3w23zJCXpHbJfCMuudroAeO0NYRzXvC+nJ41qxEks7YUXysuh44QyQthn1u9eT2u1QL6GCniNM95osl9vmzT2clhTRAIWkRteiU6OOGaZNzDMMdyawEZIT1LNc9ZtowRrY7eTvOhpfD6g3yIuhrJOj6AENPIHEn3v5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222760; c=relaxed/simple;
	bh=7DyXO+EX3WfxelWY4pMDsRbHT+kgdvu4B85zzjnLvjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m4Wo4LyQFx7DXqqnGGTU5BfJN8UcpGqq3v7tMiIXRZzkxisFTuJcTsty/nLPSh+NhKV6XG9PBSrt6QGH7fK2DkYnJj3ZkMmEncbVF8Aicz7m7JE0iPjz0UoeJhK0Zmu6HnuU0wB1fct4TrW3TbKai9681RVTXXAk4bdLIt39SuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojAeSwWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD86C4CEEB;
	Sun, 29 Jun 2025 18:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222760;
	bh=7DyXO+EX3WfxelWY4pMDsRbHT+kgdvu4B85zzjnLvjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ojAeSwWZ6jWGW1wc12yhd8wJ9KsUJweqL+v/ykTSeS8/np8lmSoykw1a2afXW9usR
	 wGWX791AyCn/FQj5fgQrdb1vVXB6Q+vLspBdi9SkCfzzuycKg45Vc48TTuWxNc+mh6
	 ki0lTAgw8l38iLVPMlJ1WTuArG6rASJRsxiAPmJ6FdzdgIHBk1C6YMk9CgZOkrhKq8
	 HivK/5jtxlsTwb7iM+GJ9naqsw1FeP/cG6aV+p+dGR3SqTgfog0mg27x5uPA4rCxHx
	 HcHMwH20TwQFc3SJUVgqCI63deZ+whDuIT9mLav0lYNv5Kroj6rB9FyQwsZXjx/9bp
	 Q8erXTJ26BAJQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] kconfig: gconf: fix behavior of a menu under a symbol in split view
Date: Mon, 30 Jun 2025 03:43:27 +0900
Message-ID: <20250629184554.407497-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A menu can be created under a symbol.

[Example]

  menu "outer menu"

  config A
          bool "A"

  menu "inner menu"
          depends on A

  config B
          bool "B"

  endmenu

  endmenu

After being re-parented by menu_finalize(), the menu tree is structured
like follows:

  menu "outer menu"
  \-- A
      \-- menu "inner menu"
          \-- B

In split view, the symbol A is shown in the right pane, so all of its
descendants must also be shown there. This has never worked correctly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - A new patch

 scripts/kconfig/gconf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 529a836ed5da..22badd2f710e 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -801,7 +801,7 @@ static gboolean on_treeview2_button_press_event(GtkWidget *widget,
 		enum prop_type ptype;
 		ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
 
-		if (ptype == P_MENU && view_mode != FULL_VIEW && col == COL_OPTION) {
+		if (ptype == P_MENU && view_mode == SINGLE_VIEW && col == COL_OPTION) {
 			// goes down into menu
 			browsed = menu;
 			display_tree_part();
@@ -951,8 +951,7 @@ static void _display_tree(GtkTreeStore *tree, struct menu *menu,
 		gtk_tree_store_append(tree, &iter, parent);
 		set_node(tree, &iter, child);
 
-		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
-		    && (tree == tree2))
+		if ((view_mode == SINGLE_VIEW) && (ptype == P_MENU))
 			continue;
 /*
 		if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
-- 
2.43.0


