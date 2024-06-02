Return-Path: <linux-kbuild+bounces-1975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 969A78D7572
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 14:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F2B1F223D1
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 12:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818B73BBF5;
	Sun,  2 Jun 2024 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ON9g1ybz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545033BBF4;
	Sun,  2 Jun 2024 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717332865; cv=none; b=Pv3vM3NLbiiBoFiB5O6lwbEygU4UCyymx7p5kkBwKEHYm8CR7QjvTUbZ/ag2GtLZBDjwTyNQ8haeRP1VvXTzja9Bkv75O+o6e2xJbUj/g++HGNI4DpFtj+T+ucRyXJWGEtLDYl84A4jhUPbC+scqnQE2KUj3lHq+b3hzRafOzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717332865; c=relaxed/simple;
	bh=7PqJ/TFv28dUxN0fesK7iaZojwUIjQ7tFfz2mnc3GrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ichtmtKLZ1yBSCQ4gfdd/IgvxdErkMMrFwNN5uz96NITkOroS5yteXV+M6XYGkuzpvmcluVWb6uPpgkZwh8NpCmfPyDeWIjr5PHS/LVRBff79EGAVoBCyN1dpetFJEEmZm82Z9fnn3B0TQ8CKClZw7D+/Yh8Z+8kcQvi2T9WnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ON9g1ybz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC3EC2BBFC;
	Sun,  2 Jun 2024 12:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717332864;
	bh=7PqJ/TFv28dUxN0fesK7iaZojwUIjQ7tFfz2mnc3GrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ON9g1ybzE3XfQWUzqc3TUeE3HgGdbigaYOmEnCxStzk+941weLn/JW77C9VknHxQi
	 eq9sc5khe7iRjJTQTNyXyw7lsZuL8JpBb/mty7AhPCXP49wNvk/PXRvqoYPRQXYpV8
	 xmbOUM2rqpqStgErMDlwwoFa4VOkme+K40tVPEPAlL825bT9C+6YHDFKQdK1xS4USO
	 P+wn0OUz3OWZvzBjuiOJQ1iVb2E9cIG4+nnfCwRhX95xxn5nwKMp4bPDvHOszSMJ2g
	 j0Uf9TOwAa57oJuG6v4SIGkV8UUjt1bpw/uYX28gNEYTPojn07UNuVUkuLaQ3GO3q4
	 Ht9IKQKZ2obvA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/3] kconfig: remove tristate choice support
Date: Sun,  2 Jun 2024 21:54:14 +0900
Message-Id: <20240602125416.976336-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I previously submitted a fix for a bug in the choice feature [1], where
I mentioned, "Another (much cleaner) approach would be to remove the
tristate choice support entirely".

There are more issues in the tristate choice feature. For example, you
can observe a couple of bugs in the following test code.

[Test Code]

    config MODULES
            def_bool y
            modules

    choice
            prompt "tristate choice"
            default A

    config A
            tristate "A"

    config B
            tristate "B"

    endchoice

[Bug 1] the 'default' property is not correctly processed

'make alldefconfig' produces:

    CONFIG_MODULES=y
    # CONFIG_A is not set
    # CONFIG_B is not set

However, the correct output should be:

    CONFIG_MODULES=y
    CONFIG_A=y
    # CONFIG_B is not set

The unit test file, scripts/kconfig/tests/choice/alldef_expected_config,
is wrong as well.

[Bug 2] choice members never get 'y' with randconfig

For the test code above, the following combinations are possible:

               A    B
        (1)    y    n
        (2)    n    y
        (3)    m    m
        (4)    m    n
        (5)    n    m
        (6)    n    n

'make randconfig' never produces (1) or (2).

These bugs are fixable, but a more critical problem is the lack of a
sensible syntax to specify the default for the tristate choice.
The default for the choice must be one of the choice members, which
cannot specify any of the patterns (3) through (6) above.

In addition, I have never seen it being used in a useful way.

The following commits removed unnecessary use of tristate choices:

 - df8df5e4bc37 ("usb: get rid of 'choice' for legacy gadget drivers")
 - bfb57ef0544a ("rapidio: remove choice for enumeration")

This commit removes the tristate choice support entirely, which allows
me to delete a lot of code, making further refactoring easier.

This includes the revert of commit fa64e5f6a35e ("kconfig/symbol.c:
handle choice_values that depend on 'm' symbols"). It was suspicious
because it did not address the root cause but introduced inconsistency
in visibility between choice members and other symbols.

[1]: https://lore.kernel.org/linux-kbuild/20240427104231.2728905-1-masahiroy@kernel.org/T/#m0a1bb6992581462ceca861b409bb33cb8fd7dbae

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst     | 11 +---
 scripts/kconfig/conf.c                        | 56 ++-----------------
 scripts/kconfig/confdata.c                    | 17 +-----
 scripts/kconfig/gconf.c                       |  5 +-
 scripts/kconfig/mconf.c                       | 28 +++-------
 scripts/kconfig/menu.c                        | 27 ---------
 scripts/kconfig/nconf.c                       | 28 ++--------
 scripts/kconfig/parser.y                      | 23 +++++---
 scripts/kconfig/qconf.cc                      |  2 +-
 scripts/kconfig/symbol.c                      | 24 +-------
 scripts/kconfig/tests/choice/Kconfig          | 17 ------
 scripts/kconfig/tests/choice/__init__.py      | 10 ----
 .../tests/choice/alldef_expected_config       |  3 -
 .../tests/choice/allmod_expected_config       |  3 -
 .../tests/choice/allno_expected_config        |  3 -
 .../tests/choice/allyes_expected_config       |  3 -
 .../tests/choice/oldask0_expected_stdout      |  4 --
 scripts/kconfig/tests/choice/oldask1_config   |  1 -
 .../tests/choice/oldask1_expected_stdout      |  9 ---
 .../tests/choice_value_with_m_dep/Kconfig     | 21 -------
 .../tests/choice_value_with_m_dep/__init__.py | 16 ------
 .../tests/choice_value_with_m_dep/config      |  2 -
 .../choice_value_with_m_dep/expected_config   |  3 -
 .../choice_value_with_m_dep/expected_stdout   |  4 --
 scripts/kconfig/tests/inter_choice/Kconfig    | 25 ---------
 .../kconfig/tests/inter_choice/__init__.py    | 15 -----
 scripts/kconfig/tests/inter_choice/defconfig  |  1 -
 .../tests/inter_choice/expected_config        |  4 --
 28 files changed, 42 insertions(+), 323 deletions(-)
 delete mode 100644 scripts/kconfig/tests/choice/oldask1_config
 delete mode 100644 scripts/kconfig/tests/choice/oldask1_expected_stdout
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/__init__.py
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/config
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/expected_config
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout
 delete mode 100644 scripts/kconfig/tests/inter_choice/Kconfig
 delete mode 100644 scripts/kconfig/tests/inter_choice/__init__.py
 delete mode 100644 scripts/kconfig/tests/inter_choice/defconfig
 delete mode 100644 scripts/kconfig/tests/inter_choice/expected_config

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 555c2f839969..dc50b5b12577 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -399,16 +399,9 @@ choices::
 	"endchoice"
 
 This defines a choice group and accepts any of the above attributes as
-options. A choice can only be of type bool or tristate.  If no type is
-specified for a choice, its type will be determined by the type of
-the first choice element in the group or remain unknown if none of the
-choice elements have a type specified, as well.
+options.
 
-While a boolean choice only allows a single config entry to be
-selected, a tristate choice also allows any number of config entries
-to be set to 'm'. This can be used if multiple drivers for a single
-hardware exists and only a single driver can be compiled/loaded into
-the kernel, but all drivers can be compiled as modules.
+A choice only allows a single config entry to be selected.
 
 comment::
 
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 8ad2c52d9b1f..9a20e9e9bdad 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -114,21 +114,13 @@ static void set_randconfig_seed(void)
 	srand(seed);
 }
 
-static bool randomize_choice_values(struct symbol *csym)
+static void randomize_choice_values(struct symbol *csym)
 {
 	struct property *prop;
 	struct symbol *sym;
 	struct expr *e;
 	int cnt, def;
 
-	/*
-	 * If choice is mod then we may have more items selected
-	 * and if no then no-one.
-	 * In both cases stop.
-	 */
-	if (csym->curr.tri != yes)
-		return false;
-
 	prop = sym_get_choice_prop(csym);
 
 	/* count entries in choice block */
@@ -157,8 +149,6 @@ static bool randomize_choice_values(struct symbol *csym)
 	csym->flags |= SYMBOL_DEF_USER;
 	/* clear VALID to get value calculated */
 	csym->flags &= ~SYMBOL_VALID;
-
-	return true;
 }
 
 enum conf_def_mode {
@@ -269,15 +259,6 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	sym_clear_all_valid();
 
-	/*
-	 * We have different type of choice blocks.
-	 * If curr.tri equals to mod then we can select several
-	 * choice symbols in one block.
-	 * In this case we do nothing.
-	 * If curr.tri equals yes then only one symbol can be
-	 * selected in a choice block and we set it to yes,
-	 * and the rest to no.
-	 */
 	if (mode != def_random) {
 		for_all_symbols(csym) {
 			if ((sym_is_choice(csym) && !sym_has_value(csym)) ||
@@ -292,11 +273,10 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
 
 		sym_calc_value(csym);
 		if (mode == def_random)
-			has_changed |= randomize_choice_values(csym);
-		else {
+			randomize_choice_values(csym);
+		else
 			set_all_choice_values(csym);
-			has_changed = true;
-		}
+		has_changed = true;
 	}
 
 	return has_changed;
@@ -454,27 +434,6 @@ static void conf_choice(struct menu *menu)
 
 	sym = menu->sym;
 	is_new = !sym_has_value(sym);
-	if (sym_is_changeable(sym)) {
-		conf_sym(menu);
-		sym_calc_value(sym);
-		switch (sym_get_tristate_value(sym)) {
-		case no:
-		case mod:
-			return;
-		case yes:
-			break;
-		}
-	} else {
-		switch (sym_get_tristate_value(sym)) {
-		case no:
-			return;
-		case mod:
-			printf("%*s%s\n", indent - 1, "", menu_get_prompt(menu));
-			return;
-		case yes:
-			break;
-		}
-	}
 
 	while (1) {
 		int cnt, def;
@@ -596,9 +555,7 @@ static void conf(struct menu *menu)
 
 	if (sym_is_choice(sym)) {
 		conf_choice(menu);
-		if (sym->curr.tri != mod)
-			return;
-		goto conf_childs;
+		return;
 	}
 
 	switch (sym->type) {
@@ -631,8 +588,7 @@ static void check_conf(struct menu *menu)
 
 	sym = menu->sym;
 	if (sym && !sym_has_value(sym) &&
-	    (sym_is_changeable(sym) ||
-	     (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes))) {
+	    (sym_is_changeable(sym) || sym_is_choice(sym))) {
 
 		switch (input_mode) {
 		case listnewconfig:
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 946185506380..25c327ae3c5c 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -462,22 +462,12 @@ int conf_read_simple(const char *name, int def)
 
 		if (sym && sym_is_choice_value(sym)) {
 			struct symbol *cs = prop_get_symbol(sym_get_choice_prop(sym));
-			switch (sym->def[def].tri) {
-			case no:
-				break;
-			case mod:
-				if (cs->def[def].tri == yes) {
-					conf_warning("%s creates inconsistent choice state", sym->name);
-					cs->flags &= ~def_flags;
-				}
-				break;
-			case yes:
+			if (sym->def[def].tri == yes) {
 				if (cs->def[def].tri != no)
 					conf_warning("override: %s changes choice state", sym->name);
 				cs->def[def].val = sym;
-				break;
+				cs->def[def].tri = yes;
 			}
-			cs->def[def].tri = EXPR_OR(cs->def[def].tri, sym->def[def].tri);
 		}
 	}
 	free(line);
@@ -806,8 +796,7 @@ int conf_write_defconfig(const char *filename)
 
 				ds = sym_choice_default(choice->sym);
 				if (sym == ds) {
-					if ((sym->type == S_BOOLEAN) &&
-					    sym_get_tristate_value(sym) == yes)
+					if (sym_get_tristate_value(sym) == yes)
 						continue;
 				}
 			}
diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index baa1c512de3c..217f85ea0910 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1067,10 +1067,7 @@ static gchar **fill_row(struct menu *menu)
 			row[COL_VALUE] =
 			    g_strdup(menu_get_prompt(def_menu));
 
-		if (sym_get_type(sym) == S_BOOLEAN) {
-			row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-			return row;
-		}
+		return row;
 	}
 	if (sym->flags & SYMBOL_CHOICEVAL)
 		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index d6a61ca1a984..e6227af51658 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -523,28 +523,14 @@ static void build_conf(struct menu *menu)
 				def_menu = child;
 		}
 
-		val = sym_get_tristate_value(sym);
-		if (sym_is_changeable(sym)) {
-			switch (val) {
-			case yes: ch = '*'; break;
-			case mod: ch = 'M'; break;
-			default:  ch = ' '; break;
-			}
-			item_make("<%c>", ch);
-			item_set_tag('t');
-			item_set_data(menu);
-		} else {
-			item_make("   ");
-			item_set_tag(def_menu ? 't' : ':');
-			item_set_data(menu);
-		}
+		item_make("   ");
+		item_set_tag(def_menu ? 't' : ':');
+		item_set_data(menu);
 
 		item_add_str("%*c%s", indent + 1, ' ', menu_get_prompt(menu));
-		if (val == yes) {
-			if (def_menu)
-				item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
-			return;
-		}
+		if (def_menu)
+			item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
+		return;
 	} else {
 		if (menu == current_menu) {
 			item_make("---%*c%s", indent + 1, ' ', menu_get_prompt(menu));
@@ -814,7 +800,7 @@ static void conf(struct menu *menu, struct menu *active_menu)
 					conf(submenu, NULL);
 				break;
 			case 't':
-				if (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)
+				if (sym_is_choice(sym))
 					conf_choice(submenu);
 				else if (submenu->prompt->type == P_MENU)
 					conf(submenu, NULL);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 53151c5a6028..503f5bc561cd 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -321,17 +321,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 			is_choice = true;
 
 		if (is_choice) {
-			if (sym->type == S_UNKNOWN) {
-				/* find the first choice value to find out choice type */
-				current_entry = parent;
-				for (menu = parent->list; menu; menu = menu->next) {
-					if (menu->sym && menu->sym->type != S_UNKNOWN) {
-						menu_set_type(menu->sym->type);
-						break;
-					}
-				}
-			}
-
 			/*
 			 * Use the choice itself as the parent dependency of
 			 * the contained items. This turns the mode of the
@@ -505,22 +494,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 		    menu->sym && !sym_is_choice_value(menu->sym)) {
 			current_entry = menu;
 			menu->sym->flags |= SYMBOL_CHOICEVAL;
-			/* Non-tristate choice values of tristate choices must
-			 * depend on the choice being set to Y. The choice
-			 * values' dependencies were propagated to their
-			 * properties above, so the change here must be re-
-			 * propagated.
-			 */
-			if (sym->type == S_TRISTATE && menu->sym->type != S_TRISTATE) {
-				basedep = expr_alloc_comp(E_EQUAL, sym, &symbol_yes);
-				menu->dep = expr_alloc_and(basedep, menu->dep);
-				for (prop = menu->sym->prop; prop; prop = prop->next) {
-					if (prop->menu != menu)
-						continue;
-					prop->visible.expr = expr_alloc_and(expr_copy(basedep),
-									    prop->visible.expr);
-				}
-			}
 			menu_add_symbol(P_CHOICE, sym, NULL);
 			prop = sym_get_choice_prop(sym);
 			for (ep = &prop->expr; *ep; ep = &(*ep)->left.expr)
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index e1cb09418cbe..addc89ee61d4 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -825,30 +825,13 @@ static void build_conf(struct menu *menu)
 		}
 
 		val = sym_get_tristate_value(sym);
-		if (sym_is_changeable(sym)) {
-			switch (val) {
-			case yes:
-				ch = '*';
-				break;
-			case mod:
-				ch = 'M';
-				break;
-			default:
-				ch = ' ';
-				break;
-			}
-			item_make(menu, 't', "<%c>", ch);
-		} else {
-			item_make(menu, def_menu ? 't' : ':', "   ");
-		}
+		item_make(menu, def_menu ? 't' : ':', "   ");
 
 		item_add_str("%*c%s", indent + 1,
 				' ', menu_get_prompt(menu));
-		if (val == yes) {
-			if (def_menu)
-				item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
-			return;
-		}
+		if (def_menu)
+			item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
+		return;
 	} else {
 		if (menu == current_menu) {
 			item_make(menu, ':',
@@ -1191,8 +1174,7 @@ static void selected_conf(struct menu *menu, struct menu *active_menu)
 					conf(submenu);
 				break;
 			case 't':
-				if (sym_is_choice(sym) &&
-				    sym_get_tristate_value(sym) == yes)
+				if (sym_is_choice(sym))
 					conf_choice(submenu);
 				else if (submenu->prompt &&
 					 submenu->prompt->type == P_MENU)
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index ff709001b1f0..8adb2f70121e 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -90,7 +90,7 @@ static bool inside_choice = false;
 
 %type <symbol> nonconst_symbol
 %type <symbol> symbol
-%type <type> type logic_type default
+%type <type> type default
 %type <expr> expr
 %type <expr> if_expr
 %type <string> end
@@ -153,6 +153,12 @@ config_stmt: config_entry_start config_option_list
 				current_entry->filename, current_entry->lineno);
 			yynerrs++;
 		}
+
+		if (current_entry->sym->type != S_BOOLEAN) {
+			fprintf(stderr, "%s:%d: error: choice member must be bool\n",
+				current_entry->filename, current_entry->lineno);
+			yynerrs++;
+		}
 	}
 
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", cur_filename, cur_lineno);
@@ -235,6 +241,8 @@ choice: T_CHOICE T_EOL
 
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
+	menu_set_type(S_BOOLEAN);
+
 	printd(DEBUG_PARSE, "%s:%d:choice\n", cur_filename, cur_lineno);
 };
 
@@ -277,10 +285,10 @@ choice_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", cur_filename, cur_lineno);
 };
 
-choice_option: logic_type prompt_stmt_opt T_EOL
+choice_option: T_BOOL T_WORD_QUOTE if_expr T_EOL
 {
-	menu_set_type($1);
-	printd(DEBUG_PARSE, "%s:%d:type(%u)\n", cur_filename, cur_lineno, $1);
+	menu_add_prompt(P_PROMPT, $2, $3);
+	printd(DEBUG_PARSE, "%s:%d:bool\n", cur_filename, cur_lineno);
 };
 
 choice_option: T_DEFAULT nonconst_symbol if_expr T_EOL
@@ -290,15 +298,12 @@ choice_option: T_DEFAULT nonconst_symbol if_expr T_EOL
 };
 
 type:
-	  logic_type
+	  T_BOOL		{ $$ = S_BOOLEAN; }
+	| T_TRISTATE		{ $$ = S_TRISTATE; }
 	| T_INT			{ $$ = S_INT; }
 	| T_HEX			{ $$ = S_HEX; }
 	| T_STRING		{ $$ = S_STRING; }
 
-logic_type:
-	  T_BOOL		{ $$ = S_BOOLEAN; }
-	| T_TRISTATE		{ $$ = S_TRISTATE; }
-
 default:
 	  T_DEFAULT		{ $$ = S_UNKNOWN; }
 	| T_DEF_BOOL		{ $$ = S_BOOLEAN; }
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 03fa096074b4..30346e294d1a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -147,7 +147,7 @@ void ConfigItem::updateMenu(void)
 		expr = sym_get_tristate_value(sym);
 		switch (expr) {
 		case yes:
-			if (sym_is_choice_value(sym) && type == S_BOOLEAN)
+			if (sym_is_choice_value(sym))
 				setIcon(promptColIdx, choiceYesIcon);
 			else
 				setIcon(promptColIdx, symbolYesIcon);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 0e439d3d48d1..98310a8ce1e5 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -44,12 +44,8 @@ enum symbol_type sym_get_type(struct symbol *sym)
 {
 	enum symbol_type type = sym->type;
 
-	if (type == S_TRISTATE) {
-		if (sym_is_choice_value(sym) && sym->visible == yes)
-			type = S_BOOLEAN;
-		else if (modules_val == no)
-			type = S_BOOLEAN;
-	}
+	if (type == S_TRISTATE && modules_val == no)
+		type = S_BOOLEAN;
 	return type;
 }
 
@@ -208,26 +204,12 @@ static void sym_set_all_changed(void)
 static void sym_calc_visibility(struct symbol *sym)
 {
 	struct property *prop;
-	struct symbol *choice_sym = NULL;
 	tristate tri;
 
 	/* any prompt visible? */
 	tri = no;
-
-	if (sym_is_choice_value(sym))
-		choice_sym = prop_get_symbol(sym_get_choice_prop(sym));
-
 	for_all_prompts(sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
-		/*
-		 * Tristate choice_values with visibility 'mod' are
-		 * not visible if the corresponding choice's value is
-		 * 'yes'.
-		 */
-		if (choice_sym && sym->type == S_TRISTATE &&
-		    prop->visible.tri == mod && choice_sym->curr.tri == yes)
-			prop->visible.tri = no;
-
 		tri = EXPR_OR(tri, prop->visible.tri);
 	}
 	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
@@ -479,7 +461,7 @@ void sym_calc_value(struct symbol *sym)
 	}
 
 	sym->curr = newval;
-	if (sym_is_choice(sym) && newval.tri == yes)
+	if (sym_is_choice(sym))
 		sym->curr.val = sym_calc_choice(sym);
 	sym_validate_range(sym);
 
diff --git a/scripts/kconfig/tests/choice/Kconfig b/scripts/kconfig/tests/choice/Kconfig
index 8cdda40868a1..cd252579a623 100644
--- a/scripts/kconfig/tests/choice/Kconfig
+++ b/scripts/kconfig/tests/choice/Kconfig
@@ -1,10 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config MODULES
-	bool "Enable loadable module support"
-	modules
-	default y
-
 choice
 	prompt "boolean choice"
 	default BOOL_CHOICE1
@@ -16,15 +11,3 @@ config BOOL_CHOICE1
 	bool "choice 1"
 
 endchoice
-
-choice
-	prompt "tristate choice"
-	default TRI_CHOICE1
-
-config TRI_CHOICE0
-	tristate "choice 0"
-
-config TRI_CHOICE1
-	tristate "choice 1"
-
-endchoice
diff --git a/scripts/kconfig/tests/choice/__init__.py b/scripts/kconfig/tests/choice/__init__.py
index 05e162220085..0fc7bf9b5c78 100644
--- a/scripts/kconfig/tests/choice/__init__.py
+++ b/scripts/kconfig/tests/choice/__init__.py
@@ -1,11 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 """
 Basic choice tests.
-
-The handling of 'choice' is a bit complicated part in Kconfig.
-
-The behavior of 'y' choice is intuitive.  If choice values are tristate,
-the choice can be 'm' where each value can be enabled independently.
 """
 
 
@@ -14,11 +9,6 @@ def test_oldask0(conf):
     assert conf.stdout_contains('oldask0_expected_stdout')
 
 
-def test_oldask1(conf):
-    assert conf.oldaskconfig('oldask1_config') == 0
-    assert conf.stdout_contains('oldask1_expected_stdout')
-
-
 def test_allyes(conf):
     assert conf.allyesconfig() == 0
     assert conf.config_contains('allyes_expected_config')
diff --git a/scripts/kconfig/tests/choice/alldef_expected_config b/scripts/kconfig/tests/choice/alldef_expected_config
index 7a754bf4be94..b359a2e6493e 100644
--- a/scripts/kconfig/tests/choice/alldef_expected_config
+++ b/scripts/kconfig/tests/choice/alldef_expected_config
@@ -1,5 +1,2 @@
-CONFIG_MODULES=y
 # CONFIG_BOOL_CHOICE0 is not set
 CONFIG_BOOL_CHOICE1=y
-# CONFIG_TRI_CHOICE0 is not set
-# CONFIG_TRI_CHOICE1 is not set
diff --git a/scripts/kconfig/tests/choice/allmod_expected_config b/scripts/kconfig/tests/choice/allmod_expected_config
index d1f51651740c..b359a2e6493e 100644
--- a/scripts/kconfig/tests/choice/allmod_expected_config
+++ b/scripts/kconfig/tests/choice/allmod_expected_config
@@ -1,5 +1,2 @@
-CONFIG_MODULES=y
 # CONFIG_BOOL_CHOICE0 is not set
 CONFIG_BOOL_CHOICE1=y
-CONFIG_TRI_CHOICE0=m
-CONFIG_TRI_CHOICE1=m
diff --git a/scripts/kconfig/tests/choice/allno_expected_config b/scripts/kconfig/tests/choice/allno_expected_config
index b88ee7a43136..b359a2e6493e 100644
--- a/scripts/kconfig/tests/choice/allno_expected_config
+++ b/scripts/kconfig/tests/choice/allno_expected_config
@@ -1,5 +1,2 @@
-# CONFIG_MODULES is not set
 # CONFIG_BOOL_CHOICE0 is not set
 CONFIG_BOOL_CHOICE1=y
-# CONFIG_TRI_CHOICE0 is not set
-CONFIG_TRI_CHOICE1=y
diff --git a/scripts/kconfig/tests/choice/allyes_expected_config b/scripts/kconfig/tests/choice/allyes_expected_config
index 8a76c1816893..b359a2e6493e 100644
--- a/scripts/kconfig/tests/choice/allyes_expected_config
+++ b/scripts/kconfig/tests/choice/allyes_expected_config
@@ -1,5 +1,2 @@
-CONFIG_MODULES=y
 # CONFIG_BOOL_CHOICE0 is not set
 CONFIG_BOOL_CHOICE1=y
-# CONFIG_TRI_CHOICE0 is not set
-CONFIG_TRI_CHOICE1=y
diff --git a/scripts/kconfig/tests/choice/oldask0_expected_stdout b/scripts/kconfig/tests/choice/oldask0_expected_stdout
index d2257db46423..80ec34c61ebc 100644
--- a/scripts/kconfig/tests/choice/oldask0_expected_stdout
+++ b/scripts/kconfig/tests/choice/oldask0_expected_stdout
@@ -1,8 +1,4 @@
-Enable loadable module support (MODULES) [Y/n/?] (NEW) 
 boolean choice
   1. choice 0 (BOOL_CHOICE0) (NEW)
 > 2. choice 1 (BOOL_CHOICE1) (NEW)
 choice[1-2?]: 
-tristate choice [M/y/?] (NEW) 
-  choice 0 (TRI_CHOICE0) [N/m/?] (NEW) 
-  choice 1 (TRI_CHOICE1) [N/m/?] (NEW) 
diff --git a/scripts/kconfig/tests/choice/oldask1_config b/scripts/kconfig/tests/choice/oldask1_config
deleted file mode 100644
index 0f417856c81c..000000000000
--- a/scripts/kconfig/tests/choice/oldask1_config
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_MODULES is not set
diff --git a/scripts/kconfig/tests/choice/oldask1_expected_stdout b/scripts/kconfig/tests/choice/oldask1_expected_stdout
deleted file mode 100644
index ffa20ad7f38e..000000000000
--- a/scripts/kconfig/tests/choice/oldask1_expected_stdout
+++ /dev/null
@@ -1,9 +0,0 @@
-Enable loadable module support (MODULES) [N/y/?] 
-boolean choice
-  1. choice 0 (BOOL_CHOICE0) (NEW)
-> 2. choice 1 (BOOL_CHOICE1) (NEW)
-choice[1-2?]: 
-tristate choice
-  1. choice 0 (TRI_CHOICE0) (NEW)
-> 2. choice 1 (TRI_CHOICE1) (NEW)
-choice[1-2?]: 
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig b/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
deleted file mode 100644
index bd970cec07d6..000000000000
--- a/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
+++ /dev/null
@@ -1,21 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-config MODULES
-	def_bool y
-	modules
-
-config DEP
-	tristate
-	default m
-
-choice
-	prompt "Tristate Choice"
-
-config CHOICE0
-	tristate "Choice 0"
-
-config CHOICE1
-	tristate "Choice 1"
-	depends on DEP
-
-endchoice
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/__init__.py b/scripts/kconfig/tests/choice_value_with_m_dep/__init__.py
deleted file mode 100644
index 075b4e08696e..000000000000
--- a/scripts/kconfig/tests/choice_value_with_m_dep/__init__.py
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-"""
-Hide tristate choice values with mod dependency in y choice.
-
-If tristate choice values depend on symbols set to 'm', they should be
-hidden when the choice containing them is changed from 'm' to 'y'
-(i.e. exclusive choice).
-
-Related Linux commit: fa64e5f6a35efd5e77d639125d973077ca506074
-"""
-
-
-def test(conf):
-    assert conf.oldaskconfig('config', 'y') == 0
-    assert conf.config_contains('expected_config')
-    assert conf.stdout_contains('expected_stdout')
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/config b/scripts/kconfig/tests/choice_value_with_m_dep/config
deleted file mode 100644
index 3a126b7a2546..000000000000
--- a/scripts/kconfig/tests/choice_value_with_m_dep/config
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_CHOICE0=m
-CONFIG_CHOICE1=m
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/expected_config b/scripts/kconfig/tests/choice_value_with_m_dep/expected_config
deleted file mode 100644
index 4d07b449540e..000000000000
--- a/scripts/kconfig/tests/choice_value_with_m_dep/expected_config
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_MODULES=y
-CONFIG_DEP=m
-CONFIG_CHOICE0=y
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout b/scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout
deleted file mode 100644
index 2b50ab65c86a..000000000000
--- a/scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout
+++ /dev/null
@@ -1,4 +0,0 @@
-Tristate Choice [M/y/?] y
-Tristate Choice
-> 1. Choice 0 (CHOICE0)
-choice[1]: 1
diff --git a/scripts/kconfig/tests/inter_choice/Kconfig b/scripts/kconfig/tests/inter_choice/Kconfig
deleted file mode 100644
index 26c25f68695b..000000000000
--- a/scripts/kconfig/tests/inter_choice/Kconfig
+++ /dev/null
@@ -1,25 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-config MODULES
-	def_bool y
-	modules
-
-choice
-	prompt "Choice"
-
-config CHOICE_VAL0
-	tristate "Choice 0"
-
-config CHOIVE_VAL1
-	tristate "Choice 1"
-
-endchoice
-
-choice
-	prompt "Another choice"
-	depends on CHOICE_VAL0
-
-config DUMMY
-	bool "dummy"
-
-endchoice
diff --git a/scripts/kconfig/tests/inter_choice/__init__.py b/scripts/kconfig/tests/inter_choice/__init__.py
deleted file mode 100644
index ffea6b1148a6..000000000000
--- a/scripts/kconfig/tests/inter_choice/__init__.py
+++ /dev/null
@@ -1,15 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-"""
-Do not affect user-assigned choice value by another choice.
-
-Handling of state flags for choices is complecated.  In old days,
-the defconfig result of a choice could be affected by another choice
-if those choices interact by 'depends on', 'select', etc.
-
-Related Linux commit: fbe98bb9ed3dae23e320c6b113e35f129538d14a
-"""
-
-
-def test(conf):
-    assert conf.defconfig('defconfig') == 0
-    assert conf.config_contains('expected_config')
diff --git a/scripts/kconfig/tests/inter_choice/defconfig b/scripts/kconfig/tests/inter_choice/defconfig
deleted file mode 100644
index 162c4148e2a5..000000000000
--- a/scripts/kconfig/tests/inter_choice/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_CHOICE_VAL0=y
diff --git a/scripts/kconfig/tests/inter_choice/expected_config b/scripts/kconfig/tests/inter_choice/expected_config
deleted file mode 100644
index 5dceefb054e3..000000000000
--- a/scripts/kconfig/tests/inter_choice/expected_config
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_MODULES=y
-CONFIG_CHOICE_VAL0=y
-# CONFIG_CHOIVE_VAL1 is not set
-CONFIG_DUMMY=y
-- 
2.40.1


