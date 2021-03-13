Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191F133A0B8
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234433AbhCMTuQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:50:16 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:40816 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbhCMTuH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:50:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmefC018162;
        Sun, 14 Mar 2021 04:48:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmefC018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664929;
        bh=ZuPe/bNbHJvZwK00JxrmLYSLm2hmLxZEK/PBz1r2NmI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aGllyCA3QeSLvfIGkIcViyl3OL5CeNbKdGL6LKTDMudW7lB1+ftIYgsohQvaz9OVp
         tJf9lzH1/k/Mvdy0kuo7MFiSEKmUQoAOlNHLHFcj3wC9A38DCxgIVgawLeWwRPCQOM
         hlOOx1wL1OJ3UkWrdgu6ZDTVVFnYWHT/QBQ+DwJe6iTxyYbKqc61oBam2poDpgYFp4
         izKOcMmG4ltavLm3phTovBazRx7aB020wX/CvSrrq0qieUX928V58pnbGONueBZRqj
         h0uIUPXPl0CnkfKEL54jvIHG7pvcYXw9cDwG72uiltegJzfIgBpcNMvj9gcAIUsHJU
         8e480jtXJzUwQ==
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
Subject: [PATCH 13/13] kconfig: change "modules" from sub-option to first-level attribute
Date:   Sun, 14 Mar 2021 04:48:36 +0900
Message-Id: <20210313194836.372585-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now "modules" is the only member of the "option" property.

Remove "option", and move "modules" to the top level property.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst          | 14 ++++----------
 init/Kconfig                                       |  2 +-
 scripts/kconfig/lexer.l                            |  1 -
 scripts/kconfig/lkc.h                              |  1 -
 scripts/kconfig/menu.c                             |  8 --------
 scripts/kconfig/parser.y                           |  8 +++++---
 scripts/kconfig/tests/choice/Kconfig               |  2 +-
 .../kconfig/tests/choice_value_with_m_dep/Kconfig  |  2 +-
 scripts/kconfig/tests/inter_choice/Kconfig         |  2 +-
 9 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 4a796c601446..98c24183d8c3 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -223,16 +223,10 @@ applicable everywhere (see syntax).
   the indentation level, this means it ends at the first line which has
   a smaller indentation than the first line of the help text.
 
-- misc options: "option" <symbol>[=<value>]
-
-  Various less common options can be defined via this option syntax,
-  which can modify the behaviour of the menu entry and its config
-  symbol. These options are currently possible:
-
-  - "modules"
-    This declares the symbol to be used as the MODULES symbol, which
-    enables the third modular state for all config symbols.
-    At most one symbol may have the "modules" option set.
+- module attribute: "modules"
+  This declares the symbol to be used as the MODULES symbol, which
+  enables the third modular state for all config symbols.
+  At most one symbol may have the "modules" option set.
 
 Menu dependencies
 -----------------
diff --git a/init/Kconfig b/init/Kconfig
index beb8314fdf96..5b71e1c0edb4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2043,7 +2043,7 @@ config MODULE_SIG_FORMAT
 
 menuconfig MODULES
 	bool "Enable loadable module support"
-	option modules
+	modules
 	help
 	  Kernel modules are small pieces of compiled code which can
 	  be inserted in the running kernel, rather than being
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 08c96a6ffe05..312cbad2d34d 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -112,7 +112,6 @@ n	[A-Za-z0-9_-]
 "menuconfig"		return T_MENUCONFIG;
 "modules"		return T_MODULES;
 "on"			return T_ON;
-"option"		return T_OPTION;
 "optional"		return T_OPTIONAL;
 "prompt"		return T_PROMPT;
 "range"			return T_RANGE;
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index c1ab05f73ca2..246eba37ca0e 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -105,7 +105,6 @@ void menu_add_visibility(struct expr *dep);
 struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
-void menu_add_option_modules(void);
 void menu_finalize(struct menu *parent);
 void menu_set_type(int type);
 
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index d50d0de55222..8b2108b74821 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -211,14 +211,6 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 	menu_add_prop(type, expr_alloc_symbol(sym), dep);
 }
 
-void menu_add_option_modules(void)
-{
-	if (modules_sym)
-		zconf_error("symbol '%s' redefines option 'modules' already defined by symbol '%s'",
-			    current_entry->sym->name, modules_sym->name);
-	modules_sym = current_entry->sym;
-}
-
 static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
 {
 	return sym2->type == S_INT || sym2->type == S_HEX ||
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 2ada169c8b5d..e46ce21a2fc4 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -69,7 +69,6 @@ static struct menu *current_menu, *current_entry;
 %token T_MODULES
 %token T_ON
 %token T_OPEN_PAREN
-%token T_OPTION
 %token T_OPTIONAL
 %token T_PLUS_EQUAL
 %token T_PROMPT
@@ -216,9 +215,12 @@ config_option: T_RANGE symbol symbol if_expr T_EOL
 	printd(DEBUG_PARSE, "%s:%d:range\n", zconf_curname(), zconf_lineno());
 };
 
-config_option: T_OPTION T_MODULES T_EOL
+config_option: T_MODULES T_EOL
 {
-	menu_add_option_modules();
+	if (modules_sym)
+		zconf_error("symbol '%s' redefines option 'modules' already defined by symbol '%s'",
+			    current_entry->sym->name, modules_sym->name);
+	modules_sym = current_entry->sym;
 };
 
 /* choice entry */
diff --git a/scripts/kconfig/tests/choice/Kconfig b/scripts/kconfig/tests/choice/Kconfig
index a412205b1b0c..0930eb65e932 100644
--- a/scripts/kconfig/tests/choice/Kconfig
+++ b/scripts/kconfig/tests/choice/Kconfig
@@ -2,7 +2,7 @@
 
 config MODULES
 	bool "Enable loadable module support"
-	option modules
+	modules
 	default y
 
 choice
diff --git a/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig b/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
index 7106c26bb3a8..bd970cec07d6 100644
--- a/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
+++ b/scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
@@ -2,7 +2,7 @@
 
 config MODULES
 	def_bool y
-	option modules
+	modules
 
 config DEP
 	tristate
diff --git a/scripts/kconfig/tests/inter_choice/Kconfig b/scripts/kconfig/tests/inter_choice/Kconfig
index 5698a4018dd0..26c25f68695b 100644
--- a/scripts/kconfig/tests/inter_choice/Kconfig
+++ b/scripts/kconfig/tests/inter_choice/Kconfig
@@ -2,7 +2,7 @@
 
 config MODULES
 	def_bool y
-	option modules
+	modules
 
 choice
 	prompt "Choice"
-- 
2.27.0

