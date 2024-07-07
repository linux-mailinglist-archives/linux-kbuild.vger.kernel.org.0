Return-Path: <linux-kbuild+bounces-2420-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B31159298AD
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 17:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39E231F22D67
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 15:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8590C3CF5E;
	Sun,  7 Jul 2024 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqMAt2xz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1003B182;
	Sun,  7 Jul 2024 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720366744; cv=none; b=ceEmFnTujDddBNoX0e4fstY1DA0LGGL9BUH1qZMPZFJvfM+MTbh7ZMJRhNwX4CdOSxDbfgrqJVCpsWS03iYsRabcXwvjQIbYYNW8KapLJnVl3zQh4i7VKaUUltrBvOme4OvaEdStIRj7h1YYAoqvth/AeUbvZpRN+/NsK9q4n+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720366744; c=relaxed/simple;
	bh=Ftgt30ANGetkuj6XeBhv1Ks1vUAgfzD5fF7fymxtJJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRpGy/W0KSKAHbO9TQN9CYaZsF53ceaQWv0RucHvB9c41spE4kq9bCdS/vTSIh+FMwnyq1ulsonorUzO5QGGvoZL+f8AR6GYyd+2GiQigaqdAtmDuhPmbfOdb9xHwnoUT15bN1wTCBHNpPKT8pg4tJAcoSxvx5rdYJFvpXZErUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqMAt2xz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4597AC4AF0C;
	Sun,  7 Jul 2024 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720366743;
	bh=Ftgt30ANGetkuj6XeBhv1Ks1vUAgfzD5fF7fymxtJJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqMAt2xz86dG0DgjUsowFy5Prv3ZIAkvsUU/TH04vRJvCgCYAL2sKV3oPI0tkNmtS
	 FBoARkoUcdIjcLojVzmOe1tD3LI3RVated+oseNkgc+Bi7s/+xmGgp/KN1hfV8x4k6
	 XkNiBNrw0Tc4PJ9AyF/+/xP4S7epsMrP98b4H19S9mxAErHhFpGkLvPJoSFZYBHwoD
	 MEPXIG2NKmMdMCkWlJIMpcqH/CRrGZxvg7o3V0eghFFrwna2U8TYvZOdomEgazP6l3
	 aAOUZQFeKnPgROh5+UNMFx+PsU0JfYb5xx6F6/QcGwxPT7qD2uJ081km12lbyjHJ5C
	 wpuf8AscNEomA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/4] kconfig: add const qualifiers to several function arguments
Date: Mon,  8 Jul 2024 00:38:05 +0900
Message-ID: <20240707153856.2483047-2-masahiroy@kernel.org>
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

Clarify that the given structures are not modified.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c      |  4 ++--
 scripts/kconfig/expr.h      |  4 ++--
 scripts/kconfig/lkc.h       | 21 +++++++++++----------
 scripts/kconfig/lkc_proto.h | 12 +++++++-----
 scripts/kconfig/menu.c      | 15 ++++++++-------
 scripts/kconfig/parser.y    |  4 ++--
 scripts/kconfig/symbol.c    | 14 +++++++-------
 scripts/kconfig/util.c      |  2 +-
 8 files changed, 40 insertions(+), 36 deletions(-)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index b2dfd3123a5d..a85e0d603322 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -1096,7 +1096,7 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	return 0;
 }
 
-void expr_print(struct expr *e,
+void expr_print(const struct expr *e,
 		void (*fn)(void *, struct symbol *, const char *),
 		void *data, int prevtoken)
 {
@@ -1221,7 +1221,7 @@ static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *s
 		str_printf(gs, " [=%s]", sym_str);
 }
 
-void expr_gstr_print(struct expr *e, struct gstr *gs)
+void expr_gstr_print(const struct expr *e, struct gstr *gs)
 {
 	expr_print(e, expr_print_gstr_helper, gs, E_NONE);
 }
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 8849a243b5e7..54b008c0161d 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -291,11 +291,11 @@ struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symb
 
 void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
-void expr_gstr_print(struct expr *e, struct gstr *gs);
+void expr_gstr_print(const struct expr *e, struct gstr *gs);
 void expr_gstr_print_revdep(struct expr *e, struct gstr *gs,
 			    tristate pr_type, const char *title);
 
-static inline int expr_is_yes(struct expr *e)
+static inline int expr_is_yes(const struct expr *e)
 {
 	return !e || (e->type == E_SYMBOL && e->left.sym == &symbol_yes);
 }
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 586a5e11f51e..3fa46610f25f 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -75,7 +75,7 @@ struct gstr str_new(void);
 void str_free(struct gstr *gs);
 void str_append(struct gstr *gs, const char *s);
 void str_printf(struct gstr *gs, const char *fmt, ...);
-char *str_get(struct gstr *gs);
+char *str_get(const struct gstr *gs);
 
 /* menu.c */
 struct menu *menu_next(struct menu *menu, struct menu *root);
@@ -84,13 +84,14 @@ struct menu *menu_next(struct menu *menu, struct menu *root);
 #define menu_for_each_entry(menu) \
 	menu_for_each_sub_entry(menu, &rootmenu)
 void _menu_init(void);
-void menu_warn(struct menu *menu, const char *fmt, ...);
+void menu_warn(const struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
 void menu_add_entry(struct symbol *sym);
 void menu_add_dep(struct expr *dep);
 void menu_add_visibility(struct expr *dep);
-struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
+struct property *menu_add_prompt(enum prop_type type, const char *prompt,
+				 struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
 void menu_finalize(void);
@@ -100,8 +101,8 @@ extern struct menu rootmenu;
 
 bool menu_is_empty(struct menu *menu);
 bool menu_is_visible(struct menu *menu);
-bool menu_has_prompt(struct menu *menu);
-const char *menu_get_prompt(struct menu *menu);
+bool menu_has_prompt(const struct menu *menu);
+const char *menu_get_prompt(const struct menu *menu);
 struct menu *menu_get_parent_menu(struct menu *menu);
 int get_jump_key_char(void);
 struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
@@ -114,25 +115,25 @@ struct symbol *sym_calc_choice(struct menu *choice);
 struct property *sym_get_range_prop(struct symbol *sym);
 const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
-struct symbol *prop_get_symbol(struct property *prop);
+struct symbol *prop_get_symbol(const struct property *prop);
 
-static inline tristate sym_get_tristate_value(struct symbol *sym)
+static inline tristate sym_get_tristate_value(const struct symbol *sym)
 {
 	return sym->curr.tri;
 }
 
-static inline bool sym_is_choice(struct symbol *sym)
+static inline bool sym_is_choice(const struct symbol *sym)
 {
 	/* A choice is a symbol with no name */
 	return sym->name == NULL;
 }
 
-static inline bool sym_is_choice_value(struct symbol *sym)
+static inline bool sym_is_choice_value(const struct symbol *sym)
 {
 	return sym->flags & SYMBOL_CHOICEVAL ? true : false;
 }
 
-static inline bool sym_has_value(struct symbol *sym)
+static inline bool sym_has_value(const struct symbol *sym)
 {
 	return sym->flags & SYMBOL_DEF_USER ? true : false;
 }
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 49cc649d2810..63519cd24bc7 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -25,21 +25,23 @@ struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
 bool sym_dep_errors(void);
-enum symbol_type sym_get_type(struct symbol *sym);
-bool sym_tristate_within_range(struct symbol *sym,tristate tri);
+enum symbol_type sym_get_type(const struct symbol *sym);
+bool sym_tristate_within_range(const struct symbol *sym, tristate tri);
 bool sym_set_tristate_value(struct symbol *sym,tristate tri);
 void choice_set_value(struct menu *choice, struct symbol *sym);
 tristate sym_toggle_tristate_value(struct symbol *sym);
 bool sym_string_valid(struct symbol *sym, const char *newval);
 bool sym_string_within_range(struct symbol *sym, const char *str);
 bool sym_set_string_value(struct symbol *sym, const char *newval);
-bool sym_is_changeable(struct symbol *sym);
-struct menu *sym_get_choice_menu(struct symbol *sym);
+bool sym_is_changeable(const struct symbol *sym);
+struct menu *sym_get_choice_menu(const struct symbol *sym);
 const char * sym_get_string_value(struct symbol *sym);
 
 const char * prop_get_type_name(enum prop_type type);
 
 /* expr.c */
-void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken);
+void expr_print(const struct expr *e,
+		void (*fn)(void *, struct symbol *, const char *),
+		void *data, int prevtoken);
 
 #endif /* LKC_PROTO_H */
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b1fbaf2ff792..2a9b4c4f4428 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -38,7 +38,7 @@ struct menu *menu_next(struct menu *menu, struct menu *root)
 	return menu->next;
 }
 
-void menu_warn(struct menu *menu, const char *fmt, ...)
+void menu_warn(const struct menu *menu, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
@@ -48,7 +48,7 @@ void menu_warn(struct menu *menu, const char *fmt, ...)
 	va_end(ap);
 }
 
-static void prop_warn(struct property *prop, const char *fmt, ...)
+static void prop_warn(const struct property *prop, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
@@ -175,7 +175,7 @@ static struct property *menu_add_prop(enum prop_type type, struct expr *expr,
 	return prop;
 }
 
-struct property *menu_add_prompt(enum prop_type type, char *prompt,
+struct property *menu_add_prompt(enum prop_type type, const char *prompt,
 				 struct expr *dep)
 {
 	struct property *prop = menu_add_prop(type, NULL, dep);
@@ -527,7 +527,7 @@ void menu_finalize(void)
 	_menu_finalize(&rootmenu, false);
 }
 
-bool menu_has_prompt(struct menu *menu)
+bool menu_has_prompt(const struct menu *menu)
 {
 	if (!menu->prompt)
 		return false;
@@ -573,7 +573,7 @@ bool menu_is_visible(struct menu *menu)
 	return visible != no;
 }
 
-const char *menu_get_prompt(struct menu *menu)
+const char *menu_get_prompt(const struct menu *menu)
 {
 	if (menu->prompt)
 		return menu->prompt->text;
@@ -594,13 +594,14 @@ struct menu *menu_get_parent_menu(struct menu *menu)
 	return menu;
 }
 
-static void get_def_str(struct gstr *r, struct menu *menu)
+static void get_def_str(struct gstr *r, const struct menu *menu)
 {
 	str_printf(r, "Defined at %s:%d\n",
 		   menu->filename, menu->lineno);
 }
 
-static void get_dep_str(struct gstr *r, struct expr *expr, const char *prefix)
+static void get_dep_str(struct gstr *r, const struct expr *expr,
+			const char *prefix)
 {
 	if (!expr_is_yes(expr)) {
 		str_append(r, prefix);
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 745c82ee15d0..61900feb4254 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -489,7 +489,7 @@ assign_val:
  *
  * Return: -1 if an error is found, 0 otherwise.
  */
-static int choice_check_sanity(struct menu *menu)
+static int choice_check_sanity(const struct menu *menu)
 {
 	struct property *prop;
 	int ret = 0;
@@ -644,7 +644,7 @@ static void print_quoted_string(FILE *out, const char *str)
 	putc('"', out);
 }
 
-static void print_symbol(FILE *out, struct menu *menu)
+static void print_symbol(FILE *out, const struct menu *menu)
 {
 	struct symbol *sym = menu->sym;
 	struct property *prop;
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index c05d188a1857..3255bf310cb2 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -40,7 +40,7 @@ struct symbol *modules_sym;
 static tristate modules_val;
 static int sym_warnings;
 
-enum symbol_type sym_get_type(struct symbol *sym)
+enum symbol_type sym_get_type(const struct symbol *sym)
 {
 	enum symbol_type type = sym->type;
 
@@ -75,7 +75,7 @@ const char *sym_type_name(enum symbol_type type)
  *
  * Return: a choice menu if this function is called against a choice member.
  */
-struct menu *sym_get_choice_menu(struct symbol *sym)
+struct menu *sym_get_choice_menu(const struct symbol *sym)
 {
 	struct menu *menu = NULL;
 	struct menu *m;
@@ -355,7 +355,7 @@ struct symbol *sym_calc_choice(struct menu *choice)
 	return res;
 }
 
-static void sym_warn_unmet_dep(struct symbol *sym)
+static void sym_warn_unmet_dep(const struct symbol *sym)
 {
 	struct gstr gs = str_new();
 
@@ -521,7 +521,7 @@ void sym_clear_all_valid(void)
 	sym_calc_value(modules_sym);
 }
 
-bool sym_tristate_within_range(struct symbol *sym, tristate val)
+bool sym_tristate_within_range(const struct symbol *sym, tristate val)
 {
 	int type = sym_get_type(sym);
 
@@ -866,7 +866,7 @@ const char *sym_get_string_value(struct symbol *sym)
 	return (const char *)sym->curr.val;
 }
 
-bool sym_is_changeable(struct symbol *sym)
+bool sym_is_changeable(const struct symbol *sym)
 {
 	return !sym_is_choice(sym) && sym->visible > sym->rev_dep.tri;
 }
@@ -1150,7 +1150,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		dep_stack_remove();
 }
 
-static struct symbol *sym_check_expr_deps(struct expr *e)
+static struct symbol *sym_check_expr_deps(const struct expr *e)
 {
 	struct symbol *sym;
 
@@ -1309,7 +1309,7 @@ struct symbol *sym_check_deps(struct symbol *sym)
 	return sym2;
 }
 
-struct symbol *prop_get_symbol(struct property *prop)
+struct symbol *prop_get_symbol(const struct property *prop)
 {
 	if (prop->expr && prop->expr->type == E_SYMBOL)
 		return prop->expr->left.sym;
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index 439c131b424e..1ea78927121d 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -98,7 +98,7 @@ void str_printf(struct gstr *gs, const char *fmt, ...)
 }
 
 /* Retrieve value of growable string */
-char *str_get(struct gstr *gs)
+char *str_get(const struct gstr *gs)
 {
 	return gs->s;
 }
-- 
2.43.0


