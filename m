Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E3133A0B6
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhCMTuQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:50:16 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:40811 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbhCMTuH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:50:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef8018162;
        Sun, 14 Mar 2021 04:48:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef8018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664926;
        bh=4h4gGA260dypAY3vrg3/RB5Y4ctghhyfHpP04GDrqFY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PT/QrLH1x/v0uAA481BuRaIZ7NxJc2er3ul4NpPj99GaerU7fzQgpMdgLHGPGr17X
         adQikAJbR37RbeRqXajYagc3hJVEx1bju8qA7OGHHLQP7KWfegw8D6F9NdYMlVMQee
         ydRMkqInRcDQeRmPWw9aFLQ795IcGKeox616knnvOikxa2ZzYUZhfvOvbHaVRClVmS
         8X01GTRUAx9uxVJ9MBlXr+RtFfEyfvLyeCdwPHnYlzzIzsU/4J5xrMVf22dGWy+6AQ
         OvJX71s7mnD30SCLbgIxmRgyndKkOCgr2xFBeOEiWgcQ/uTXGM4sOIZrzZ3Aaz8ekZ
         +4S14aLJEc7PA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        KP Singh <kpsingh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] kconfig: change defconfig_list option to environment variable
Date:   Sun, 14 Mar 2021 04:48:32 +0900
Message-Id: <20210313194836.372585-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

"defconfig_list" is a weird option that defines static symbol that
declares the list of base config files in case the .config does not
exist yet.

This is quite different from other normal symbols; we just abused the
"string" type and the "default" properties to list out the input files.
They must be fixed values since these are searched for and loaded in
the parse stage.

It is an ugly hack, and should not exist in the first place. Providing
this features as an environment variable is a saner approach.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst |  5 ---
 Documentation/kbuild/kconfig.rst          |  8 +++++
 init/Kconfig                              |  9 ------
 scripts/kconfig/Makefile                  | 10 ++++++
 scripts/kconfig/confdata.c                | 38 +++++++++++++++++------
 scripts/kconfig/expr.h                    |  1 -
 scripts/kconfig/lexer.l                   |  1 -
 scripts/kconfig/lkc.h                     |  1 -
 scripts/kconfig/menu.c                    |  9 ------
 scripts/kconfig/parser.y                  |  6 ----
 scripts/kconfig/symbol.c                  |  1 -
 scripts/kconfig/tests/conftest.py         |  4 +++
 12 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 226ae072da7d..3cbccfc42798 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -229,11 +229,6 @@ applicable everywhere (see syntax).
   which can modify the behaviour of the menu entry and its config
   symbol. These options are currently possible:
 
-  - "defconfig_list"
-    This declares a list of default entries which can be used when
-    looking for the default configuration (which is used when the main
-    .config doesn't exists yet.)
-
   - "modules"
     This declares the symbol to be used as the MODULES symbol, which
     enables the third modular state for all config symbols.
diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index dce6801d66c9..5967c79c3baa 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -41,6 +41,14 @@ KCONFIG_CONFIG
 This environment variable can be used to specify a default kernel config
 file name to override the default name of ".config".
 
+KCONFIG_DEFCONFIG_LIST
+----------------------
+
+This environment variable specifies a list of config files which can be used
+as a base configuration in case the .config does not exist yet. Entries in
+the list are separated with whitespaces to each other, and the first one
+that exists is used.
+
 KCONFIG_OVERWRITECONFIG
 -----------------------
 If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
diff --git a/init/Kconfig b/init/Kconfig
index 22946fe5ded9..46b87ad73f6a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1,13 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config DEFCONFIG_LIST
-	string
-	depends on !UML
-	option defconfig_list
-	default "/lib/modules/$(shell,uname -r)/.config"
-	default "/etc/kernel-config"
-	default "/boot/config-$(shell,uname -r)"
-	default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
-
 config CC_VERSION_TEXT
 	string
 	default "$(CC_VERSION_TEXT)"
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 8c19b82c6035..31c5735663c8 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -13,6 +13,16 @@ ifeq ($(quiet),silent_)
 silent := -s
 endif
 
+export KCONFIG_DEFCONFIG_LIST :=
+ifneq ($(SRCARCH),um)
+kernel-release := $(shell uname -r)
+KCONFIG_DEFCONFIG_LIST := \
+	/lib/modules/$(kernel-release)/.config \
+	/etc/kernel-config \
+	/boot/config-$(kernel-release) \
+	arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)
+endif
+
 # We need this, in case the user has it in its environment
 unexport CONFIG_
 
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 198f70957fbf..f3998d5ddd02 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -360,28 +360,46 @@ int conf_read_simple(const char *name, int def)
 	if (name) {
 		in = zconf_fopen(name);
 	} else {
-		struct property *prop;
+		char *env;
 
 		name = conf_get_configname();
 		in = zconf_fopen(name);
 		if (in)
 			goto load;
 		sym_add_change_count(1);
-		if (!sym_defconfig_list)
+
+		env = getenv("KCONFIG_DEFCONFIG_LIST");
+		if (!env)
 			return 1;
 
-		for_all_defaults(sym_defconfig_list, prop) {
-			if (expr_calc_value(prop->visible.expr) == no ||
-			    prop->expr->type != E_SYMBOL)
-				continue;
-			sym_calc_value(prop->expr->left.sym);
-			name = sym_get_string_value(prop->expr->left.sym);
-			in = zconf_fopen(name);
+		while (1) {
+			bool is_last;
+
+			while (isspace(*env))
+				env++;
+
+			if (!*env)
+				break;
+
+			p = env;
+			while (*p && !isspace(*p))
+				p++;
+
+			is_last = (*p == '\0');
+
+			*p = '\0';
+
+			in = zconf_fopen(env);
 			if (in) {
 				conf_message("using defaults found in %s",
-					 name);
+					     env);
 				goto load;
 			}
+
+			if (is_last)
+				break;
+
+			env = p + 1;
 		}
 	}
 	if (!in)
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index bbca80a0dc24..dc17152b1f14 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -287,7 +287,6 @@ struct file *lookup_file(const char *name);
 
 extern struct symbol symbol_yes, symbol_no, symbol_mod;
 extern struct symbol *modules_sym;
-extern struct symbol *sym_defconfig_list;
 extern int cdebug;
 struct expr *expr_alloc_symbol(struct symbol *sym);
 struct expr *expr_alloc_one(enum expr_type type, struct expr *ce);
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 9c22cb554673..e918950f94a6 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -99,7 +99,6 @@ n	[A-Za-z0-9_-]
 "def_bool"		return T_DEF_BOOL;
 "def_tristate"		return T_DEF_TRISTATE;
 "default"		return T_DEFAULT;
-"defconfig_list"	return T_DEFCONFIG_LIST;
 "depends"		return T_DEPENDS;
 "endchoice"		return T_ENDCHOICE;
 "endif"			return T_ENDIF;
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index d0d5acecb530..8d89a6275197 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -106,7 +106,6 @@ struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
 void menu_add_option_modules(void);
-void menu_add_option_defconfig_list(void);
 void menu_add_option_allnoconfig_y(void);
 void menu_finalize(struct menu *parent);
 void menu_set_type(int type);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index a5fbd6ccc006..5dcfc173da41 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -219,15 +219,6 @@ void menu_add_option_modules(void)
 	modules_sym = current_entry->sym;
 }
 
-void menu_add_option_defconfig_list(void)
-{
-	if (!sym_defconfig_list)
-		sym_defconfig_list = current_entry->sym;
-	else if (sym_defconfig_list != current_entry->sym)
-		zconf_error("trying to redefine defconfig symbol");
-	sym_defconfig_list->flags |= SYMBOL_NO_WRITE;
-}
-
 void menu_add_option_allnoconfig_y(void)
 {
 	current_entry->sym->flags |= SYMBOL_ALLNOCONFIG_Y;
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 190f1117f35a..f11d8382e9e6 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -53,7 +53,6 @@ static struct menu *current_menu, *current_entry;
 %token T_COMMENT
 %token T_CONFIG
 %token T_DEFAULT
-%token T_DEFCONFIG_LIST
 %token T_DEF_BOOL
 %token T_DEF_TRISTATE
 %token T_DEPENDS
@@ -223,11 +222,6 @@ config_option: T_OPTION T_MODULES T_EOL
 	menu_add_option_modules();
 };
 
-config_option: T_OPTION T_DEFCONFIG_LIST T_EOL
-{
-	menu_add_option_defconfig_list();
-};
-
 config_option: T_OPTION T_ALLNOCONFIG_Y T_EOL
 {
 	menu_add_option_allnoconfig_y();
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index fe38e6fd2c2a..36b0fcb18117 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -35,7 +35,6 @@ static struct symbol symbol_empty = {
 	.flags = SYMBOL_VALID,
 };
 
-struct symbol *sym_defconfig_list;
 struct symbol *modules_sym;
 static tristate modules_val;
 
diff --git a/scripts/kconfig/tests/conftest.py b/scripts/kconfig/tests/conftest.py
index 0345ef6e3273..af8774a5697c 100644
--- a/scripts/kconfig/tests/conftest.py
+++ b/scripts/kconfig/tests/conftest.py
@@ -53,6 +53,10 @@ class Conf:
         # Override 'srctree' environment to make the test as the top directory
         extra_env['srctree'] = self._test_dir
 
+        # Clear KCONFIG_DEFCONFIG_LIST to keep unit tests from being affected
+        # by the user's environment.
+        extra_env['KCONFIG_DEFCONFIG_LIST'] = ''
+
         # Run Kconfig in a temporary directory.
         # This directory is automatically removed when done.
         with tempfile.TemporaryDirectory() as temp_dir:
-- 
2.27.0

