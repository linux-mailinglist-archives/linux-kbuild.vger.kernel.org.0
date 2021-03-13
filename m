Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246E733A0B0
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234617AbhCMTtp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:45 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:40186 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234395AbhCMTt3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:29 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmefB018162;
        Sun, 14 Mar 2021 04:48:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmefB018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664928;
        bh=cAMWYYhyZD8UJwLAsv+L4OvivNuJrDEaUet3BclM7Ho=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GgPqxH8gmFo7WD7HYgnNSoTfKtd/bpav4RpnRk1Ww+Um/bWFy5MuzfbTrEtMQyhID
         iAWmDd0Tcn2LYWYNIIGkEm8fyF4AyhzG7aiPZ2johkcSmwjp/fRpTJxUPyTq9Y5SLn
         TQX+Itr8eJ9wVIDzp4XS5Lqywm36H0/kmDKEKzKs0Onv4XGC6IHNPsLmt7mpw/GaqL
         b/zX6eyV92ETxzd2SGjJquQXfOjSRk7JPdLVgS1dXsQmkOOwziEJa0fEYQB+3Bqvna
         c378AOVrAjum/hJf3n8eEMG7EyoI350GbAldBBu75Y4vtMvtg2UpmufovjTryBnLUv
         M0gbbyqDXTNqQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] kconfig: remove allnoconfig_y option
Date:   Sun, 14 Mar 2021 04:48:35 +0900
Message-Id: <20210313194836.372585-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that the only user CONFIG_EMBEDDED has stopped using this option,
remove it entirely.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 4 ----
 scripts/kconfig/conf.c                    | 5 +----
 scripts/kconfig/expr.h                    | 3 ---
 scripts/kconfig/lexer.l                   | 1 -
 scripts/kconfig/lkc.h                     | 1 -
 scripts/kconfig/menu.c                    | 5 -----
 scripts/kconfig/parser.y                  | 6 ------
 7 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 3cbccfc42798..4a796c601446 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -234,10 +234,6 @@ applicable everywhere (see syntax).
     enables the third modular state for all config symbols.
     At most one symbol may have the "modules" option set.
 
-  - "allnoconfig_y"
-    This declares the symbol as one that should have the value y when
-    using "allnoconfig". Used for symbols that hide other symbols.
-
 Menu dependencies
 -----------------
 
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index caad875da483..06901120a9ea 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -232,10 +232,7 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = mod;
 				break;
 			case def_no:
-				if (sym->flags & SYMBOL_ALLNOCONFIG_Y)
-					sym->def[S_DEF_USER].tri = yes;
-				else
-					sym->def[S_DEF_USER].tri = no;
+				sym->def[S_DEF_USER].tri = no;
 				break;
 			case def_random:
 				sym->def[S_DEF_USER].tri = no;
diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index dc17152b1f14..9c9caca5bd5f 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -156,9 +156,6 @@ struct symbol {
 /* choice values need to be set before calculating this symbol value */
 #define SYMBOL_NEED_SET_CHOICE_VALUES  0x100000
 
-/* Set symbol to y if allnoconfig; used for symbols that hide others */
-#define SYMBOL_ALLNOCONFIG_Y 0x200000
-
 #define SYMBOL_MAXLENGTH	256
 #define SYMBOL_HASHSIZE		9973
 
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index e918950f94a6..08c96a6ffe05 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -91,7 +91,6 @@ n	[A-Za-z0-9_-]
 [ \t]*			/* whitespaces */
 \\\n			/* escaped new line */
 \n			return T_EOL;
-"allnoconfig_y"		return T_ALLNOCONFIG_Y;
 "bool"			return T_BOOL;
 "choice"		return T_CHOICE;
 "comment"		return T_COMMENT;
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 8d89a6275197..c1ab05f73ca2 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -106,7 +106,6 @@ struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
 void menu_add_option_modules(void);
-void menu_add_option_allnoconfig_y(void);
 void menu_finalize(struct menu *parent);
 void menu_set_type(int type);
 
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 5dcfc173da41..d50d0de55222 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -219,11 +219,6 @@ void menu_add_option_modules(void)
 	modules_sym = current_entry->sym;
 }
 
-void menu_add_option_allnoconfig_y(void)
-{
-	current_entry->sym->flags |= SYMBOL_ALLNOCONFIG_Y;
-}
-
 static int menu_validate_number(struct symbol *sym, struct symbol *sym2)
 {
 	return sym2->type == S_INT || sym2->type == S_HEX ||
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index f11d8382e9e6..2ada169c8b5d 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -45,7 +45,6 @@ static struct menu *current_menu, *current_entry;
 %token <string> T_HELPTEXT
 %token <string> T_WORD
 %token <string> T_WORD_QUOTE
-%token T_ALLNOCONFIG_Y
 %token T_BOOL
 %token T_CHOICE
 %token T_CLOSE_PAREN
@@ -222,11 +221,6 @@ config_option: T_OPTION T_MODULES T_EOL
 	menu_add_option_modules();
 };
 
-config_option: T_OPTION T_ALLNOCONFIG_Y T_EOL
-{
-	menu_add_option_allnoconfig_y();
-};
-
 /* choice entry */
 
 choice: T_CHOICE word_opt T_EOL
-- 
2.27.0

