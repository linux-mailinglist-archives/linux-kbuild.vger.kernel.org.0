Return-Path: <linux-kbuild+bounces-7632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE588AE6A28
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494BE3BC699
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D075F2D877C;
	Tue, 24 Jun 2025 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFxYOyvi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939132D8767;
	Tue, 24 Jun 2025 15:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777645; cv=none; b=G9Kck/NuigsnZVbfNJy8V+aYVjppDfiyi7rXUBwZ5IlowLTAN6qMWFhIm+KVSV45qKNPqeMdQytp6++tE+93YDlhYsUivFh3HdbnDlPsn8XlRto7veSueSVqGGwUk0nNQoBJfGTdubX3cTAPnqdD1txS5YPn1w2BAkEp/LQ2OHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777645; c=relaxed/simple;
	bh=vKo/nq5vHH6eHCMGShD9+g/EuhouM/MDhkRb8XCdg64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWntVmqEH6f6GJoB2tmzooYCV7XTFQYN7+rp58G8LTHB8LUrpQddVjgSmZITWPKKEgE5jNsts54J3VLQgZH9d9BZfN2RyNsN5WR6CG1dn889kVQ/pyGjorwjHA9j5kcx7YbzUMgseRPgp0s2svnT0Ld3n7sMVqkGErDuh2Mtnsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFxYOyvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1D0C4CEEE;
	Tue, 24 Jun 2025 15:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777645;
	bh=vKo/nq5vHH6eHCMGShD9+g/EuhouM/MDhkRb8XCdg64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JFxYOyvik5Yy4kdGWjaNtaPKSepEqz8KY6YFfJTdesprnTKtzfME92gOZs+QzFxE1
	 O9Nge/dqTciSvykSix1c32icMwFveCfO20hGDezORXfts7J5BGaTx0tm5UqcPmd95/
	 6A2a94MdP2C8QmqzHpJkAjF4J5s+70ygBs6+ixawIQ2jIIEAOYVvI+Y1NoIJDUN14R
	 RapyVBUVLu2rX9yhyhYH3tTeHeHpTRaHww/zbiIrpMl9csYGTEQeFjFuhmUvT3LLCU
	 EkiJiM9mgRWAzMc/JinbF/Hs7MjbdayM3xtMTd5tFxi8FKKYh39CQQ6bfmHlKrRATj
	 LCezawCS89qAQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/66] kconfig: re-add menu_get_parent_menu() that returns parent menu
Date: Wed, 25 Jun 2025 00:04:53 +0900
Message-ID: <20250624150645.1107002-6-masahiroy@kernel.org>
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

This helper returns the parent menu, or NULL if there is no parent.
The main difference from the previous version is that it always returns
the parent menu even when the given argument is itself a menu.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc.h  |  1 +
 scripts/kconfig/menu.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 5cc85c3d4aaa..37b606c74bff 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -97,6 +97,7 @@ bool menu_is_empty(struct menu *menu);
 bool menu_is_visible(struct menu *menu);
 bool menu_has_prompt(const struct menu *menu);
 const char *menu_get_prompt(const struct menu *menu);
+struct menu *menu_get_parent_menu(struct menu *menu);
 struct menu *menu_get_menu_or_parent_menu(struct menu *menu);
 int get_jump_key_char(void);
 struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index ccb690bbf05d..a5e5b4fdcd93 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -575,6 +575,20 @@ const char *menu_get_prompt(const struct menu *menu)
 	return NULL;
 }
 
+/**
+ * menu_get_parent_menu - return the parent menu or NULL
+ * @menu: pointer to the menu
+ * return: the parent menu, or NULL if there is no parent.
+ */
+struct menu *menu_get_parent_menu(struct menu *menu)
+{
+	for (menu = menu->parent; menu; menu = menu->parent)
+		if (menu->type == M_MENU)
+			return menu;
+
+	return NULL;
+}
+
 /**
  * menu_get_menu_or_parent_menu - return the parent menu or the menu itself
  * @menu: pointer to the menu
-- 
2.43.0


