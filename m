Return-Path: <linux-kbuild+bounces-2071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F10F9042E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 301581C22C0F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5193280BEE;
	Tue, 11 Jun 2024 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyYKPjoX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD2D80607;
	Tue, 11 Jun 2024 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128569; cv=none; b=JiXf0Zhl49hvtBPTAnQZXFXTaEmldw/9+EjzJrMTSnwB7VU7La3d6iGaSuN8vhETc5EF0XrO6+wz6QuFa6qgD6k4z727hhIeCyNBmhL6NCl/rs1i0dEYPTNdwGkqpf9D+yPUOccGTmWST9oZCax7N+R+4hnqsZTr9n1ArR2UHOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128569; c=relaxed/simple;
	bh=SqoXWXIq3NVYSHdK3EzSYWYwGR6/kM2HqUcSteYpPys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWO0snW0s+IC4nc+pA3/dQaG3mUzN2ewdhou5ZX1JxjsZsPCfGz4U2jwdeL+0/xMNoqnbFFChnFBRohu3Q7jygjmO8dyShhvEodjIahmLrQobThofauq0w4EPrnwS2+kyita7NgLp4eAh1eNVD+l0OtxdH3lx33dgtdrXpLVCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyYKPjoX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAA0C4AF48;
	Tue, 11 Jun 2024 17:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128568;
	bh=SqoXWXIq3NVYSHdK3EzSYWYwGR6/kM2HqUcSteYpPys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eyYKPjoXfYapr6xq/o7PfPg3munTJZnbFpb+GW2jOZ1fOAd2hy3tOoGzwi8MMA2uL
	 laf1lBT/PfE3We6bFTxZJPyE9TNJ4ShdWcSC5P0GLFmpt3CNv7adI3ycxXVjTJ4Ro7
	 dFiZR317qGKol4fyg9kQSAoLU/bRIriUf37WATXXcD24JCtWGnmtWMRbORLp2hlqnX
	 y8I5AJ2quKbYt8T0eKucrPIHv387Es4aoNlcCv3DyPdBZWjIRUOnrJ+iUUR4C9ZzvT
	 culzoMLkm+CLadotH0KY2zFosBuk/y/IOXV8cjxbf1RXoj6Wjv7P8kCrvEVhT5kv+w
	 eDiP1S5hnBx3g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 07/16] kconfig: remove sym_get_choice_value()
Date: Wed, 12 Jun 2024 02:55:16 +0900
Message-ID: <20240611175536.3518179-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
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
index e59f2d2ce4e6..b2fdae15f367 100644
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
@@ -360,13 +360,6 @@ static struct symbol *sym_calc_choice(struct menu *choice)
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


