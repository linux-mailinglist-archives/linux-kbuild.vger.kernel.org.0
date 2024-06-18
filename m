Return-Path: <linux-kbuild+bounces-2178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA690C988
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5052A1F22800
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D4814F114;
	Tue, 18 Jun 2024 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YchCiD2U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F81F14F110;
	Tue, 18 Jun 2024 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706951; cv=none; b=QbXzqxlfIzPBdQXdgNjbXo7+2qHbV9bELe7jZqxvgws0gOIj+Zw72qwT90nm7/iMK7zovpkDfkim3+T55hPoCcU/QtnWp5vbIOduO1/YN7tZOv7GWUEofUOjRnlOn9YN6/+DeObvYxBixURJIbmAKALsNVjN5ZxNCgM9DJwowak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706951; c=relaxed/simple;
	bh=L5+V8qIFYp3VcWCaebsx4V5WsPKJDTEppVzdSwqF/Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GX9bPwsIFehw9qChl/0aF4iitUhjj54E3Kmxk7AL1xlPdqatuuXgCCgrh8XoapvRh8w5Qqksy4yiB6PYjy8mBovUpxqm8lcwlx9Uf06Fh5Da/IipGmiPSxlHUBpPeOL8oTl00A7LXj8uJVzcbVVr+TfufBqIwtgbN1INHgQ9SUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YchCiD2U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D4AC3277B;
	Tue, 18 Jun 2024 10:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706950;
	bh=L5+V8qIFYp3VcWCaebsx4V5WsPKJDTEppVzdSwqF/Ao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YchCiD2UAWrKbPWD8ouQDL6oB8VxIoUzE2wUlk1S6qziAXyZq5Wl7UZJWmU01o5QM
	 3+Di9qG411/hG3P/LUlBwBY2NKCky6MFVuT8u/wPcwR4loDEZflV95c6L7GsJY0730
	 rhLlUWDTxx0e/B+VwgQZHBS/YtxKvbkJo5g4if4i8AvPMCQpGp0zsy8GyAGL2Erf1p
	 91anI5S60YKrj5krP9D+oUXXoN9FU3gH0Z4y4n80BmIErUVXvY8kCu+vIIOqhCJ1+0
	 UaTVpvLVZccV7VnNUFpfY6bBXcLaLp76vavTRiwP14rLhQk2Bzu03YuWJY9jxcBWZa
	 hB99Afn9622Dw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 03/12] kconfig: remove sym_get_choice_value()
Date: Tue, 18 Jun 2024 19:35:22 +0900
Message-ID: <20240618103541.3508486-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618103541.3508486-1-masahiroy@kernel.org>
References: <20240618103541.3508486-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sym_get_choice_value(menu->sym) is equivalent to sym_calc_choice(menu).

Convert all call sites of sym_get_choice_value() and then remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/conf.c   | 6 ++----
 scripts/kconfig/gconf.c  | 2 +-
 scripts/kconfig/lkc.h    | 3 +--
 scripts/kconfig/mconf.c  | 6 +++---
 scripts/kconfig/nconf.c  | 6 +++---
 scripts/kconfig/symbol.c | 9 +--------
 6 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 1c59998a62f7..3d7d454c54da 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -422,17 +422,15 @@ static int conf_sym(struct menu *menu)
 
 static void conf_choice(struct menu *menu)
 {
-	struct symbol *sym, *def_sym;
+	struct symbol *def_sym;
 	struct menu *child;
 	bool is_new = false;
 
-	sym = menu->sym;
-
 	while (1) {
 		int cnt, def;
 
 		printf("%*s%s\n", indent - 1, "", menu_get_prompt(menu));
-		def_sym = sym_get_choice_value(sym);
+		def_sym = sym_calc_choice(menu);
 		cnt = def = 0;
 		line[0] = 0;
 		for (child = menu->list; child; child = child->next) {
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 380421a5cfb2..6b50e25133e3 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1054,7 +1054,7 @@ static gchar **fill_row(struct menu *menu)
 
 	if (sym_is_choice(sym)) {	// parse childs for getting final value
 		struct menu *child;
-		struct symbol *def_sym = sym_get_choice_value(sym);
+		struct symbol *def_sym = sym_calc_choice(menu);
 		struct menu *def_menu = NULL;
 
 		for (child = menu->list; child; child = child->next) {
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index bdd37a16b040..d820272a85fb 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -110,6 +110,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help);
 /* symbol.c */
 void sym_clear_all_valid(void);
 struct symbol *sym_choice_default(struct symbol *sym);
+struct symbol *sym_calc_choice(struct menu *choice);
 struct property *sym_get_range_prop(struct symbol *sym);
 const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
@@ -120,8 +121,6 @@ static inline tristate sym_get_tristate_value(struct symbol *sym)
 	return sym->curr.tri;
 }
 
-struct symbol *sym_get_choice_value(struct symbol *sym);
-
 static inline bool sym_is_choice(struct symbol *sym)
 {
 	/* A choice is a symbol with no name */
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 03709eb734ae..4a0a97bb342f 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -514,7 +514,7 @@ static void build_conf(struct menu *menu)
 
 	type = sym_get_type(sym);
 	if (sym_is_choice(sym)) {
-		struct symbol *def_sym = sym_get_choice_value(sym);
+		struct symbol *def_sym = sym_calc_choice(menu);
 		struct menu *def_menu = NULL;
 
 		child_count++;
@@ -600,7 +600,7 @@ static void conf_choice(struct menu *menu)
 	struct menu *child;
 	struct symbol *active;
 
-	active = sym_get_choice_value(menu->sym);
+	active = sym_calc_choice(menu);
 	while (1) {
 		int res;
 		int selected;
@@ -619,7 +619,7 @@ static void conf_choice(struct menu *menu)
 			item_set_data(child);
 			if (child->sym == active)
 				item_set_selected(1);
-			if (child->sym == sym_get_choice_value(menu->sym))
+			if (child->sym == sym_calc_choice(menu))
 				item_set_tag('X');
 		}
 		dialog_clear();
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index eb5fc3ccaf9d..1456e24969aa 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -815,7 +815,7 @@ static void build_conf(struct menu *menu)
 
 	type = sym_get_type(sym);
 	if (sym_is_choice(sym)) {
-		struct symbol *def_sym = sym_get_choice_value(sym);
+		struct symbol *def_sym = sym_calc_choice(menu);
 		struct menu *def_menu = NULL;
 
 		child_count++;
@@ -1239,7 +1239,7 @@ static void conf_choice(struct menu *menu)
 		.pattern = "",
 	};
 
-	active = sym_get_choice_value(menu->sym);
+	active = sym_calc_choice(menu);
 	/* this is mostly duplicated from the conf() function. */
 	while (!global_exit) {
 		reset_menu();
@@ -1248,7 +1248,7 @@ static void conf_choice(struct menu *menu)
 			if (!show_all_items && !menu_is_visible(child))
 				continue;
 
-			if (child->sym == sym_get_choice_value(menu->sym))
+			if (child->sym == sym_calc_choice(menu))
 				item_make(child, ':', "<X> %s",
 						menu_get_prompt(child));
 			else if (child->sym)
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 329c7bd314cf..344a241e1e94 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -288,7 +288,7 @@ struct symbol *sym_choice_default(struct symbol *sym)
  *
  * Return: a chosen symbol
  */
-static struct symbol *sym_calc_choice(struct menu *choice)
+struct symbol *sym_calc_choice(struct menu *choice)
 {
 	struct symbol *res = NULL;
 	struct symbol *sym;
@@ -365,13 +365,6 @@ static struct symbol *sym_calc_choice(struct menu *choice)
 	return res;
 }
 
-struct symbol *sym_get_choice_value(struct symbol *sym)
-{
-	struct menu *menu = list_first_entry(&sym->menus, struct menu, link);
-
-	return sym_calc_choice(menu);
-}
-
 static void sym_warn_unmet_dep(struct symbol *sym)
 {
 	struct gstr gs = str_new();
-- 
2.43.0


