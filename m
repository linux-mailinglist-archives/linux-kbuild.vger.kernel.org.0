Return-Path: <linux-kbuild+bounces-8705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD9B43091
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14981A003F7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D72D22A4FC;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqsKGPfC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C780225A4F;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=MSJ8AgrDv5O6gch/PBtPjiW0kEuyUv+M4mpVzuKLnarDe/+7xh864eHYd+q28lfXkosyxe8fct25aXFDxse7nnMvmSvRlABVEhOVf24Ahl3b4/mO2y+JMbjPFaYJbRR5i02zyBto46vaIY5ops6X85a6TEhUHf0Bz4pysdyKne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=pr+YoVUXdyYWMn2tMjP3zE+G8H1rGuamvFiupzUQ/S0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IPGPAraPaaIH/opVB+Xm8vbfn1WJRg66RhvaNysNGbkeH2Y5/XJycI5EfGtKy/A6UT5X9Qpaj+jFI8Jrp2NNgsfq+WX63KFlATXDaWAYMyv7JbKd6Lx8zPDNDzfPn4nQV5pidrIbd9t/vzOr4ajyOShip+3vZP4HpoShzBJVNpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqsKGPfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4007C4CEFA;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=pr+YoVUXdyYWMn2tMjP3zE+G8H1rGuamvFiupzUQ/S0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rqsKGPfCH1qCEMRQytUXr49gIDeg0KXuGdWIgszBD8TrMXhgvZCEIz3wYmAvdmSPy
	 8Ld3MnjmENjzDW91LFSFQe6xVoFhZpuNeGHc1OxLSKXGWSoySBoO5SDH8HhH3XVIMs
	 1DEU2R6qjSgu8H9LswT3nyTNCqpBoVIAXCx+qOrVUL8FXRoqtJewCDDtjHy9NK/ByN
	 VnNORWkFwx+NuT3PYB67/4IH9m74tt14xRTkWd9/86WPnpMBFUwwiDpTX70R3mHTXk
	 qJuQWzzWuvXOdsCMNVVLOcmfQHwu1AOoiuF4aN1FUM2PTO6IVMFvYVMulOK5s2055Y
	 qhRLrrQgMZV7g==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 7/9] kconfig: Add transitional symbol attribute for migration support
Date: Wed,  3 Sep 2025 20:46:46 -0700
Message-Id: <20250904034656.3670313-7-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17987; i=kees@kernel.org; h=from:subject; bh=pr+YoVUXdyYWMn2tMjP3zE+G8H1rGuamvFiupzUQ/S0=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OUtSz9wrPvd9j0iTCq/gtB31V4yFUts/P33mHR/TX H1xGd+9jlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIks6mNk+LCd3dI74ZqU8SGt h43HjbQM8zJPWr9Z/vDBVo/bU7av387wk3FywFbHSc/1FysKPos9/jRN4eE1y9C1l1SnKPDoZGs ysgIA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

    config NEW_OPTION
        bool "New option"
        default OLD_OPTION

    config OLD_OPTION
        bool
        transitional
        help
          Transitional config for OLD_OPTION migration.

This allows seamless migration: olddefconfig processes existing
CONFIG_OLD_OPTION=y settings to enable CONFIG_NEW_OPTION=y, while
CONFIG_OLD_OPTION is omitted from newly generated .config files.

Implementation details:
- Parser validates transitional symbols can only have help sections
- Symbol visibility logic updated: usable = (visible != no || transitional)
- Transitional symbols preserve user values during configuration
- Documentation added to show the usage
- Added positive and negative testing via "testconfig" target

Signed-off-by: Kees Cook <kees@kernel.org>
---
With help from Claude Code to show me how to navigate the kconfig parser.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <linux-doc@vger.kernel.org>
---
 .../kconfig/tests/err_transitional/Kconfig    |  52 +++++++++
 scripts/kconfig/tests/transitional/Kconfig    | 100 ++++++++++++++++++
 scripts/kconfig/expr.h                        |   1 +
 scripts/kconfig/lexer.l                       |   1 +
 scripts/kconfig/parser.y                      |  47 ++++++++
 scripts/kconfig/symbol.c                      |  16 ++-
 .../tests/err_transitional/__init__.py        |  14 +++
 .../tests/err_transitional/expected_stderr    |   7 ++
 .../kconfig/tests/transitional/__init__.py    |  18 ++++
 .../tests/transitional/expected_config        |  12 +++
 .../kconfig/tests/transitional/initial_config |  16 +++
 Documentation/kbuild/kconfig-language.rst     |  32 ++++++
 12 files changed, 313 insertions(+), 3 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_transitional/Kconfig
 create mode 100644 scripts/kconfig/tests/transitional/Kconfig
 create mode 100644 scripts/kconfig/tests/err_transitional/__init__.py
 create mode 100644 scripts/kconfig/tests/err_transitional/expected_stderr
 create mode 100644 scripts/kconfig/tests/transitional/__init__.py
 create mode 100644 scripts/kconfig/tests/transitional/expected_config
 create mode 100644 scripts/kconfig/tests/transitional/initial_config

diff --git a/scripts/kconfig/tests/err_transitional/Kconfig b/scripts/kconfig/tests/err_transitional/Kconfig
new file mode 100644
index 000000000000..a75ed3b2fe5e
--- /dev/null
+++ b/scripts/kconfig/tests/err_transitional/Kconfig
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test that transitional symbols cannot have properties other than help
+
+config BAD_DEFAULT
+	bool
+	transitional
+	default y
+	help
+	  This transitional symbol illegally has a default property.
+
+config BAD_PROMPT
+	bool
+	transitional
+	prompt "Bad prompt"
+	help
+	  This transitional symbol illegally has a prompt.
+
+config BAD_SELECT
+	bool
+	transitional
+	select OTHER_SYMBOL
+	help
+	  This transitional symbol illegally has a select.
+
+config BAD_IMPLY
+	bool
+	transitional
+	imply OTHER_SYMBOL
+	help
+	  This transitional symbol illegally has an imply.
+
+config BAD_DEPENDS
+	bool
+	transitional
+	depends on OTHER_SYMBOL
+	help
+	  This transitional symbol illegally has a depends.
+
+config BAD_RANGE
+	int
+	transitional
+	range 1 10
+	help
+	  This transitional symbol illegally has a range.
+
+config BAD_NO_TYPE
+	transitional
+	help
+	  This transitional symbol illegally has no type specified.
+
+config OTHER_SYMBOL
+	bool
diff --git a/scripts/kconfig/tests/transitional/Kconfig b/scripts/kconfig/tests/transitional/Kconfig
new file mode 100644
index 000000000000..62c3b24665b9
--- /dev/null
+++ b/scripts/kconfig/tests/transitional/Kconfig
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0
+# Test transitional symbols for config migration with all Kconfig types
+
+# Enable module support for tristate testing
+config MODULES
+	bool "Enable loadable module support"
+	modules
+	default y
+
+# Basic migration tests for all types
+config NEW_BOOL
+	bool "New bool option"
+	default OLD_BOOL
+
+config OLD_BOOL
+	bool
+	transitional
+
+config NEW_TRISTATE
+	tristate "New tristate option"
+	default OLD_TRISTATE
+
+config OLD_TRISTATE
+	tristate
+	transitional
+
+config NEW_STRING
+	string "New string option"
+	default OLD_STRING
+
+config OLD_STRING
+	string
+	transitional
+
+config NEW_HEX
+	hex "New hex option"
+	default OLD_HEX
+
+config OLD_HEX
+	hex
+	transitional
+
+config NEW_INT
+	int "New int option"
+	default OLD_INT
+
+config OLD_INT
+	int
+	transitional
+
+# Precedence tests for all types
+config NEW_BOOL_PRECEDENCE
+	bool "New bool option with precedence"
+	default OLD_BOOL_PRECEDENCE
+
+config OLD_BOOL_PRECEDENCE
+	bool
+	transitional
+
+config NEW_STRING_PRECEDENCE
+	string "New string option with precedence"
+	default OLD_STRING_PRECEDENCE
+
+config OLD_STRING_PRECEDENCE
+	string
+	transitional
+
+config NEW_TRISTATE_PRECEDENCE
+	tristate "New tristate option with precedence"
+	default OLD_TRISTATE_PRECEDENCE
+
+config OLD_TRISTATE_PRECEDENCE
+	tristate
+	transitional
+
+config NEW_HEX_PRECEDENCE
+	hex "New hex option with precedence"
+	default OLD_HEX_PRECEDENCE
+
+config OLD_HEX_PRECEDENCE
+	hex
+	transitional
+
+config NEW_INT_PRECEDENCE
+	int "New int option with precedence"
+	default OLD_INT_PRECEDENCE
+
+config OLD_INT_PRECEDENCE
+	int
+	transitional
+
+# Test that help sections are allowed for transitional symbols
+config OLD_WITH_HELP
+	bool
+	transitional
+	help
+	  This transitional symbol has a help section to validate that help is allowed.
+
+config REGULAR_OPTION
+	bool "Regular option"
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index fe2231e0e6a4..5e7cdabc029c 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -145,6 +145,7 @@ struct symbol {
 #define SYMBOL_CONST      0x0001  /* symbol is const */
 #define SYMBOL_CHECK      0x0008  /* used during dependency checking */
 #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
+#define SYMBOL_HIDDEN     0x0100  /* symbol is hidden (usable but invisible) */
 #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
 #define SYMBOL_WRITTEN    0x0800  /* track info to avoid double-write to .config */
 #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
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
index e9c3c664e925..c95271c22183 100644
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
@@ -205,6 +206,12 @@ config_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", cur_filename, cur_lineno);
 };
 
+config_option: T_TRANSITIONAL T_EOL
+{
+	current_entry->sym->flags |= SYMBOL_HIDDEN;
+	printd(DEBUG_PARSE, "%s:%d:transitional\n", cur_filename, cur_lineno);
+};
+
 config_option: default expr if_expr T_EOL
 {
 	menu_add_expr(P_DEFAULT, $2, $3);
@@ -482,6 +489,43 @@ assign_val:
 
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
+	if (!menu->sym || !(menu->sym->flags & SYMBOL_HIDDEN))
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
@@ -558,6 +602,9 @@ void conf_parse(const char *name)
 		if (menu->sym && sym_check_deps(menu->sym))
 			yynerrs++;
 
+		if (transitional_check_sanity(menu))
+			yynerrs++;
+
 		if (menu->sym && sym_is_choice(menu->sym)) {
 			menu_for_each_sub_entry(child, menu)
 				if (child->sym && choice_check_sanity(child))
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 26ab10c0fd76..b2686dba05ec 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -408,6 +408,7 @@ void sym_calc_value(struct symbol *sym)
 	struct symbol_value newval, oldval;
 	struct property *prop;
 	struct menu *choice_menu;
+	bool usable;
 
 	if (!sym)
 		return;
@@ -447,6 +448,13 @@ void sym_calc_value(struct symbol *sym)
 	if (sym->visible != no)
 		sym->flags |= SYMBOL_WRITE;
 
+	/*
+	 * For a symbol to be processed during configuration it needs to
+	 * be either visible or a transitional symbol that is hidden from
+	 * menus and omitted from newly written .config files.
+	 */
+	usable = (sym->visible != no || (sym->flags & SYMBOL_HIDDEN));
+
 	/* set default if recursively called */
 	sym->curr = newval;
 
@@ -459,13 +467,15 @@ void sym_calc_value(struct symbol *sym)
 			sym_calc_choice(choice_menu);
 			newval.tri = sym->curr.tri;
 		} else {
-			if (sym->visible != no) {
+			if (usable) {
 				/* if the symbol is visible use the user value
 				 * if available, otherwise try the default value
 				 */
 				if (sym_has_value(sym)) {
+					tristate value = (sym->flags & SYMBOL_HIDDEN) ?
+						sym->def[S_DEF_USER].tri : sym->visible;
 					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
-							      sym->visible);
+							      value);
 					goto calc_newval;
 				}
 			}
@@ -497,7 +507,7 @@ void sym_calc_value(struct symbol *sym)
 	case S_STRING:
 	case S_HEX:
 	case S_INT:
-		if (sym->visible != no && sym_has_value(sym)) {
+		if (usable && sym_has_value(sym)) {
 			newval.val = sym->def[S_DEF_USER].val;
 			break;
 		}
diff --git a/scripts/kconfig/tests/err_transitional/__init__.py b/scripts/kconfig/tests/err_transitional/__init__.py
new file mode 100644
index 000000000000..7dffb5b0833f
--- /dev/null
+++ b/scripts/kconfig/tests/err_transitional/__init__.py
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Test that transitional symbols with invalid properties are rejected.
+
+Transitional symbols can only have help sections. Any other properties
+(default, select, depends, etc.) should cause a parser error.
+"""
+
+def test(conf):
+    # This should fail with exit code 1 due to invalid transitional symbol
+    assert conf.olddefconfig() == 1
+
+    # Check that the error message is about transitional symbols
+    assert conf.stderr_contains('expected_stderr')
diff --git a/scripts/kconfig/tests/err_transitional/expected_stderr b/scripts/kconfig/tests/err_transitional/expected_stderr
new file mode 100644
index 000000000000..b52db4f680f4
--- /dev/null
+++ b/scripts/kconfig/tests/err_transitional/expected_stderr
@@ -0,0 +1,7 @@
+Kconfig:46:warning: config symbol defined without type
+Kconfig:7: error: transitional symbols can only have help sections
+Kconfig:14: error: transitional symbols can only have help sections
+Kconfig:21: error: transitional symbols can only have help sections
+Kconfig:28: error: transitional symbols can only have help sections
+Kconfig:32: error: transitional symbols can only have help sections
+Kconfig:42: error: transitional symbols can only have help sections
diff --git a/scripts/kconfig/tests/transitional/__init__.py b/scripts/kconfig/tests/transitional/__init__.py
new file mode 100644
index 000000000000..61937d10edf1
--- /dev/null
+++ b/scripts/kconfig/tests/transitional/__init__.py
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+"""
+Test transitional symbol migration functionality for all Kconfig types.
+
+This tests that:
+- OLD_* options in existing .config cause NEW_* options to be set
+- OLD_* options are not written to the new .config file
+- NEW_* options appear in the new .config file with correct values
+- All Kconfig types work correctly: bool, tristate, string, hex, int
+- User-set NEW values take precedence over conflicting OLD transitional values
+"""
+
+def test(conf):
+    # Run olddefconfig to process the migration with the initial config
+    assert conf.olddefconfig(dot_config='initial_config') == 0
+
+    # Check that the configuration matches expected output
+    assert conf.config_contains('expected_config')
diff --git a/scripts/kconfig/tests/transitional/expected_config b/scripts/kconfig/tests/transitional/expected_config
new file mode 100644
index 000000000000..846e9ddcab91
--- /dev/null
+++ b/scripts/kconfig/tests/transitional/expected_config
@@ -0,0 +1,12 @@
+CONFIG_MODULES=y
+CONFIG_NEW_BOOL=y
+CONFIG_NEW_TRISTATE=m
+CONFIG_NEW_STRING="test string"
+CONFIG_NEW_HEX=0x1234
+CONFIG_NEW_INT=42
+# CONFIG_NEW_BOOL_PRECEDENCE is not set
+CONFIG_NEW_STRING_PRECEDENCE="user value"
+CONFIG_NEW_TRISTATE_PRECEDENCE=y
+CONFIG_NEW_HEX_PRECEDENCE=0xABCD
+CONFIG_NEW_INT_PRECEDENCE=100
+# CONFIG_REGULAR_OPTION is not set
diff --git a/scripts/kconfig/tests/transitional/initial_config b/scripts/kconfig/tests/transitional/initial_config
new file mode 100644
index 000000000000..e648a65e504c
--- /dev/null
+++ b/scripts/kconfig/tests/transitional/initial_config
@@ -0,0 +1,16 @@
+CONFIG_MODULES=y
+CONFIG_OLD_BOOL=y
+CONFIG_OLD_TRISTATE=m
+CONFIG_OLD_STRING="test string"
+CONFIG_OLD_HEX=0x1234
+CONFIG_OLD_INT=42
+# CONFIG_NEW_BOOL_PRECEDENCE is not set
+CONFIG_OLD_BOOL_PRECEDENCE=y
+CONFIG_NEW_STRING_PRECEDENCE="user value"
+CONFIG_OLD_STRING_PRECEDENCE="old value"
+CONFIG_NEW_TRISTATE_PRECEDENCE=y
+CONFIG_OLD_TRISTATE_PRECEDENCE=m
+CONFIG_NEW_HEX_PRECEDENCE=0xABCD
+CONFIG_OLD_HEX_PRECEDENCE=0x5678
+CONFIG_NEW_INT_PRECEDENCE=100
+CONFIG_OLD_INT_PRECEDENCE=200
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index a91abb8f6840..abce88f15d7c 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -232,6 +232,38 @@ applicable everywhere (see syntax).
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
+	bool
+	transitional
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


