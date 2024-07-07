Return-Path: <linux-kbuild+bounces-2421-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DFB9298AF
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 17:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A81041C220C7
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 15:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A5844369;
	Sun,  7 Jul 2024 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y37mgM+y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF23405E6;
	Sun,  7 Jul 2024 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720366745; cv=none; b=MLOpYEZZcbsjF8+vjT2+gU/cf825135N9moe0c9xtNCYrXUOkBIjVuDYhM0oT4wHMae3JIOxxxsr9hQ8OlK0eb203pe8wm03RhLqr5+UL+9oYNjeb7uAGB5NAt73YzWU5DDSEX4fQ46rr5zok5x5VUQ5w/urc1b2ztDDPIfrEg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720366745; c=relaxed/simple;
	bh=Bvgq5Dh/o3TVhL4qcwFRWp1OFJpVti4RsoXG1ndKF1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rpva1mzW/jkWy9+KbVgHYQjj3BpxQmU0jXvASUYpVyr/6CL3/QPB9E50zrRh7vLw3IkgNrr/9FKUANHKjGUgeiuROlzMG8Wh3xidKgHrg7XWmTFa7zcq6rnOYiPlDOFA5UTcg9O2Huz+RqRpYkNcVyWoLY4o6xz9to+kT9JJC9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y37mgM+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648C8C4AF0E;
	Sun,  7 Jul 2024 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720366745;
	bh=Bvgq5Dh/o3TVhL4qcwFRWp1OFJpVti4RsoXG1ndKF1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y37mgM+y88H3AZSDnbM1b43qAjGPcDB+EC+dylnzbafZqvI24n2zp7SpIZtcmZaHf
	 U/nkJM4h5HC/1Fli572CD7/S6Lamj5IKtXIkcGft7Ejnlt085XNpdI9P1myNFxnBr3
	 cBQ3rMQqkjQNX0MONyIP1K9/znFM7yvvLSbagjFtvaohP53k8QOtl2fWpPx7aheq6s
	 a1T4rq2W+PHy+wGpc8xqlIJhI2ByZDg1/Ua+2uZKW4BJhvGKALmFkUpXdKLMaA94gt
	 dYiS0XWReWRxfc9ZCNeNSDtHJUPMKAovTd5QsQ+JAl7Bal+Ga6HgdTivAG3CuGRd7B
	 ZO1s57mL1AV/g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/4] kconfig: remove P_CHOICEVAL property
Date: Mon,  8 Jul 2024 00:38:06 +0900
Message-ID: <20240707153856.2483047-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240707153856.2483047-1-masahiroy@kernel.org>
References: <20240707153856.2483047-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag is unneeded because a choice member can be detected by
other means.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h   | 1 -
 scripts/kconfig/gconf.c  | 2 +-
 scripts/kconfig/lkc.h    | 5 +----
 scripts/kconfig/menu.c   | 5 -----
 scripts/kconfig/symbol.c | 6 ++++++
 5 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 54b008c0161d..6e47e0ad6e6e 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -131,7 +131,6 @@ struct symbol {
 
 #define SYMBOL_CONST      0x0001  /* symbol is const */
 #define SYMBOL_CHECK      0x0008  /* used during dependency checking */
-#define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block */
 #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
 #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_WRITTEN    0x0800  /* track info to avoid double-write to .config */
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 6b50e25133e3..c0f46f189060 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1070,7 +1070,7 @@ static gchar **fill_row(struct menu *menu)
 		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
 		return row;
 	}
-	if (sym->flags & SYMBOL_CHOICEVAL)
+	if (sym_is_choice_value(sym))
 		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
 
 	stype = sym_get_type(sym);
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 3fa46610f25f..401bdf36323a 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -128,10 +128,7 @@ static inline bool sym_is_choice(const struct symbol *sym)
 	return sym->name == NULL;
 }
 
-static inline bool sym_is_choice_value(const struct symbol *sym)
-{
-	return sym->flags & SYMBOL_CHOICEVAL ? true : false;
-}
+bool sym_is_choice_value(const struct symbol *sym);
 
 static inline bool sym_has_value(const struct symbol *sym)
 {
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 2a9b4c4f4428..cd34cc5aefcf 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -467,11 +467,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 		sym->dir_dep.expr = expr_alloc_or(sym->dir_dep.expr, parent->dep);
 	}
 	for (menu = parent->list; menu; menu = menu->next) {
-		if (sym && sym_is_choice(sym) &&
-		    menu->sym && !sym_is_choice_value(menu->sym)) {
-			menu->sym->flags |= SYMBOL_CHOICEVAL;
-		}
-
 		/*
 		 * This code serves two purposes:
 		 *
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 3255bf310cb2..6c6f238c4f7b 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -871,6 +871,11 @@ bool sym_is_changeable(const struct symbol *sym)
 	return !sym_is_choice(sym) && sym->visible > sym->rev_dep.tri;
 }
 
+bool sym_is_choice_value(const struct symbol *sym)
+{
+	return !list_empty(&sym->choice_link);
+}
+
 HASHTABLE_DEFINE(sym_hashtable, SYMBOL_HASHSIZE);
 
 struct symbol *sym_lookup(const char *name, int flags)
@@ -908,6 +913,7 @@ struct symbol *sym_lookup(const char *name, int flags)
 	symbol->type = S_UNKNOWN;
 	symbol->flags = flags;
 	INIT_LIST_HEAD(&symbol->menus);
+	INIT_LIST_HEAD(&symbol->choice_link);
 
 	hash_add(sym_hashtable, &symbol->node, hash);
 
-- 
2.43.0


