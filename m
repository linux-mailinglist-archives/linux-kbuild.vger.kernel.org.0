Return-Path: <linux-kbuild+bounces-8671-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06169B3C740
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Aug 2025 04:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F1AFA078F8
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Aug 2025 02:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341F0201266;
	Sat, 30 Aug 2025 02:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOs4ufRW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E052AE89;
	Sat, 30 Aug 2025 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756519284; cv=none; b=HVeONPZDvCeSCKiN/dmwyTeO6LXzNKePxgCEna55yEh4uUYxf4Nf8nTUzBk+7PFgl9Nd262XhxILb/chi+K1sQo4qEmS2mFwjKwmd/EThidO5sgyxdyJE68YICwd/9TTj3pl/+Y6tRGBNnknffRHEYVsSIxPGzWb7AySWZBoYl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756519284; c=relaxed/simple;
	bh=eF2d4oMiTdNKhzCUAyGBPX1FxQCwgyYrgcQFxh4pvxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=g1+FliU+VYJBwrpFW58XoxdI45PFQD13f8ygsJ9weQ+P5n9DNyfsCysXSN9B0iq80Ukp0V61QUhF4PH0dgSnOS46kb5FmE40j9RQecwopGFqU7y6vwFp9Q9zrxXEXM2c3WObdM2UjaDlhKVesmgWBJ1PgzhfzdIkua/CLhGNQ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOs4ufRW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6E3C4CEF0;
	Sat, 30 Aug 2025 02:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756519283;
	bh=eF2d4oMiTdNKhzCUAyGBPX1FxQCwgyYrgcQFxh4pvxQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ZOs4ufRWHAZFRcx8GSezSuP3Vx+9gJxYcAnICyBZD9WGwYx5Mi45edvWIDBilN/b+
	 YVk7cKQ+n58m9DgGh44iD/R6ROGpUzumG3ZYWNGzkfHnW+c/R+iZfoiIGoCsIAD1NZ
	 OrnaWvxkWQ+od36mDqdeGcwfuGwS2PCuD9V/Z8wBCi5AeIHS3mG5SbQQqGiTUUYQ0Z
	 Ve2pd8VPRwbGlEe+mZs6SQI47+UnRgs2IY776IMBbAZc3hL0IeO3uAM3RIisSnnDML
	 GbUnZ2+zu7CbxiBVT6rtkXcrh8Pfo2S/fjrLqVfBzBbuM7FOdfiPcOokHQBMewQOci
	 xnLveFMlrOxRA==
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Marco Bonelli <marco@mebeim.net>,
	Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] kconfig: Add transitional symbol attribute for migration support
Date: Fri, 29 Aug 2025 19:01:13 -0700
Message-Id: <20250830020109.it.598-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9620; i=kees@kernel.org; h=from:subject:message-id; bh=eF2d4oMiTdNKhzCUAyGBPX1FxQCwgyYrgcQFxh4pvxQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmbojMlOnkO7n5ZWTnXZ9LCgiNaf+4XLIhW0RWr8op74 /vfnWF1RykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwETE/Rn+x6/5IaLMKHBTyir0 mMTM87F+fHPbfEKFjwnfOOxYZ1sYzPDPNrkueNWZ+2dc7e4wHWXbHKB2RT7Jvkz86q+HZ15s8z/ CDwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

During kernel option migrations (e.g. CONFIG_CFI_CLANG to CONFIG_CFI),
existing .config files need to maintain backward compatibility while
preventing deprecated options from appearing in newly generated
configurations. This is challenging with existing Kconfig mechanisms
because:

1. Simply removing old options breaks existing .config files.
2. Manually listing an option as "deprecated" leaves it needlessly
   visible and still writes them to new .config files.
3. Using any method to remove visibility (.e.g no 'prompt', 'if n',
   etc) prevents the option from being processed at all.

Add a "transitional" attribute that creates symbols which are:
- Processed during configuration (can influence other symbols' defaults)
- Hidden from user menus (no prompts appear)
- Omitted from newly written .config files (gets migrated)
- Restricted to only having help sections (no defaults, selects, etc)
  making it truly just a "prior value pass-through" option.

The transitional syntax requires a type argument and prevents type
redefinition:

    config OLD_OPTION
        transitional bool
        help
          Transitional config for OLD_OPTION migration.

    config NEW_OPTION
        bool "New option"
        default OLD_OPTION

This allows seamless migration: olddefconfig processes existing
CONFIG_OLD_OPTION=y settings to enable CONFIG_NEW_OPTION=y, while
CONFIG_OLD_OPTION is omitted from newly generated .config files.

Implementation details:
- Parser validates transitional symbols can only have help sections
- Symbol visibility logic updated: usable = (visible != no || transitional)
- Transitional symbols preserve user values during configuration
- Type safety enforced to prevent redefinition after transitional declaration
- Used distinct struct members instead of new flags for readability
- Documentation added to show the usage

Signed-off-by: Kees Cook <kees@kernel.org>
---
With help from Claude Code to show me how to navigate the kconfig parser.

 v2: fixed human-introduced errors
 v1: https://lore.kernel.org/all/20250830014438.work.682-kees@kernel.org/

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <linux-doc@vger.kernel.org>
---
 scripts/kconfig/expr.h                    | 15 +++++++
 scripts/kconfig/lexer.l                   |  1 +
 scripts/kconfig/parser.y                  | 51 +++++++++++++++++++++++
 scripts/kconfig/symbol.c                  | 11 +++--
 Documentation/kbuild/kconfig-language.rst | 31 ++++++++++++++
 5 files changed, 106 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index fe2231e0e6a4..be51574d6c77 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -127,6 +127,21 @@ struct symbol {
 	/* SYMBOL_* flags */
 	int flags;
 
+	/*
+	 * Transitional symbol - processed during configuration but hidden from
+	 * user in menus and omitted from newly written .config files. Used for
+	 * backward compatibility during config option migrations (e.g.,
+	 * CFI_CLANG → CFI). Transitional symbols can still influence default
+	 * expressions of other symbols.
+	 */
+	bool transitional:1;
+
+	/*
+	 * Symbol usability - calculated as (visible != no || transitional).
+	 * Determines if symbol can be used in expressions.
+	 */
+	bool usable:1;
+
 	/* List of properties. See prop_type. */
 	struct property *prop;
 
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 9c2cdfc33c6f..6d2c92c6095d 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -126,6 +126,7 @@ n	[A-Za-z0-9_-]
 "select"		return T_SELECT;
 "source"		return T_SOURCE;
 "string"		return T_STRING;
+"transitional"		return T_TRANSITIONAL;
 "tristate"		return T_TRISTATE;
 "visible"		return T_VISIBLE;
 "||"			return T_OR;
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index e9c3c664e925..01d2d0f720ce 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -75,6 +75,7 @@ struct menu *current_menu, *current_entry, *current_choice;
 %token T_SELECT
 %token T_SOURCE
 %token T_STRING
+%token T_TRANSITIONAL
 %token T_TRISTATE
 %token T_VISIBLE
 %token T_EOL
@@ -205,6 +206,16 @@ config_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", cur_filename, cur_lineno);
 };
 
+config_option: T_TRANSITIONAL type T_EOL
+{
+	if (current_entry->sym->type != S_UNKNOWN)
+		yyerror("transitional type cannot be set after symbol type is already defined");
+	menu_set_type($2);
+	current_entry->sym->transitional = true;
+	printd(DEBUG_PARSE, "%s:%d:transitional(%u)\n", cur_filename, cur_lineno,
+		$2);
+};
+
 config_option: default expr if_expr T_EOL
 {
 	menu_add_expr(P_DEFAULT, $2, $3);
@@ -482,6 +493,43 @@ assign_val:
 
 %%
 
+/**
+ * transitional_check_sanity - check transitional symbols have no other
+ *			       properties
+ *
+ * @menu: menu of the potentially transitional symbol
+ *
+ * Return: -1 if an error is found, 0 otherwise.
+ */
+static int transitional_check_sanity(const struct menu *menu)
+{
+	struct property *prop;
+
+	if (!menu->sym || !menu->sym->transitional)
+		return 0;
+
+	/* Check for depends and visible conditions. */
+	if ((menu->dep && !expr_is_yes(menu->dep)) ||
+	    (menu->visibility && !expr_is_yes(menu->visibility))) {
+		fprintf(stderr, "%s:%d: error: %s",
+			menu->filename, menu->lineno,
+			"transitional symbols can only have help sections\n");
+		return -1;
+	}
+
+	/* Check for any property other than "help". */
+	for (prop = menu->sym->prop; prop; prop = prop->next) {
+		if (prop->type != P_COMMENT) {
+			fprintf(stderr, "%s:%d: error: %s",
+				prop->filename, prop->lineno,
+				"transitional symbols can only have help sections\n");
+			return -1;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * choice_check_sanity - check sanity of a choice member
  *
@@ -558,6 +606,9 @@ void conf_parse(const char *name)
 		if (menu->sym && sym_check_deps(menu->sym))
 			yynerrs++;
 
+		if (transitional_check_sanity(menu))
+			yynerrs++;
+
 		if (menu->sym && sym_is_choice(menu->sym)) {
 			menu_for_each_sub_entry(child, menu)
 				if (child->sym && choice_check_sanity(child))
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 26ab10c0fd76..b822c0c897e5 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -447,6 +447,9 @@ void sym_calc_value(struct symbol *sym)
 	if (sym->visible != no)
 		sym->flags |= SYMBOL_WRITE;
 
+	/* Calculate usable flag */
+	sym->usable = (sym->visible != no || sym->transitional);
+
 	/* set default if recursively called */
 	sym->curr = newval;
 
@@ -459,13 +462,15 @@ void sym_calc_value(struct symbol *sym)
 			sym_calc_choice(choice_menu);
 			newval.tri = sym->curr.tri;
 		} else {
-			if (sym->visible != no) {
+			if (sym->usable) {
 				/* if the symbol is visible use the user value
 				 * if available, otherwise try the default value
 				 */
 				if (sym_has_value(sym)) {
+					tristate value = sym->transitional ?
+						sym->def[S_DEF_USER].tri : sym->visible;
 					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
-							      sym->visible);
+							      value);
 					goto calc_newval;
 				}
 			}
@@ -497,7 +502,7 @@ void sym_calc_value(struct symbol *sym)
 	case S_STRING:
 	case S_HEX:
 	case S_INT:
-		if (sym->visible != no && sym_has_value(sym)) {
+		if (sym->usable && sym_has_value(sym)) {
 			newval.val = sym->def[S_DEF_USER].val;
 			break;
 		}
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index a91abb8f6840..345c334ce680 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -232,6 +232,37 @@ applicable everywhere (see syntax).
   enables the third modular state for all config symbols.
   At most one symbol may have the "modules" option set.
 
+- transitional attribute: "transitional"
+  This declares the symbol as transitional, meaning it should be processed
+  during configuration but omitted from newly written .config files.
+  Transitional symbols are useful for backward compatibility during config
+  option migrations - they allow olddefconfig to process existing .config
+  files while ensuring the old option doesn't appear in new configurations.
+
+  A transitional symbol:
+  - Has no prompt (is not visible to users in menus)
+  - Is processed normally during configuration (values are read and used)
+  - Can be referenced in default expressions of other symbols
+  - Is not written to new .config files
+  - Cannot have any other properties (it is a pass-through option)
+
+  Example migration from OLD_NAME to NEW_NAME::
+
+    config NEW_NAME
+	bool "New option name"
+	default OLD_NAME
+	help
+	  This replaces the old CONFIG_OLD_NAME option.
+
+    config OLD_NAME
+	transitional bool
+	help
+	  Transitional config for OLD_NAME to NEW_NAME migration.
+
+  With this setup, existing .config files with "CONFIG_OLD_NAME=y" will
+  result in "CONFIG_NEW_NAME=y" being set, while CONFIG_OLD_NAME will be
+  omitted from newly written .config files.
+
 Menu dependencies
 -----------------
 
-- 
2.34.1


