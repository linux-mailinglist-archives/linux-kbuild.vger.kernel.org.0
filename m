Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F55262284
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Sep 2020 00:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgIHWRy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Sep 2020 18:17:54 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47291 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgIHWRx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Sep 2020 18:17:53 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 088MGrFk012572;
        Wed, 9 Sep 2020 07:16:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 088MGrFk012572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599603415;
        bh=ofEPr9hBQLToa0tnpSFXT71R901tENs3+t3picjYQYs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D7ghS5PkAIHPitB5/n6EHnmjhmm/oinxegLnKiiN3WO3AAJIwD//zOR60ZfxFlwO/
         47sjqnxrpVsE/w22W0UKc1iszBi2vruwc3f/1t8CPauJ2v0QVOxOtKvOSWSXgDZwjY
         /ukYHxwsAHb/LMTCiO7x7l73txMM7ArHaJhDXKJKM92Yisgqt6w2FvV9lLZEo6fSfa
         hZmCtKuvmtpWF+nt71nKbBYMzra13oV84EPpV+UtzeEZzmo8dankKJiGFGWXHRmAvd
         Us2jF5CHt9pouh6hRQbDEpQTAmJ8DmuFoYcbHxmpHC+mOUo5pqwHzJpFFjg5rR0oAI
         TZkrEZoH3Jb0A==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: fix incomplete type 'struct gstr' warning
Date:   Wed,  9 Sep 2020 07:16:38 +0900
Message-Id: <20200908221638.2782778-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200908221638.2782778-1-masahiroy@kernel.org>
References: <20200908221638.2782778-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

"make HOSTCXX=clang++ xconfig" reports the following:

  HOSTCXX scripts/kconfig/qconf.o
In file included from scripts/kconfig/qconf.cc:23:
In file included from scripts/kconfig/lkc.h:15:
scripts/kconfig/lkc_proto.h:26:13: warning: 'get_relations_str' has C-linkage specified, but returns incomplete type 'struct gstr' which could be incompatible with C [-Wreturn-type-c-linkage]
struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
            ^

Currently, get_relations_str() is declared before the struct gstr
definition.

Move all declarations of menu.c functions below.

BTW, some are declared in lkc.h and some in lkc_proto.h, but the
difference is unclear. I guess some refactoring is needed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc.h       | 47 +++++++++++++++++++++++--------------
 scripts/kconfig/lkc_proto.h | 14 -----------
 2 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index d4ca8297364f..8454649b17bd 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -66,23 +66,6 @@ static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 		fprintf(stderr, "Error in writing or end of file.\n");
 }
 
-/* menu.c */
-void _menu_init(void);
-void menu_warn(struct menu *menu, const char *fmt, ...);
-struct menu *menu_add_menu(void);
-void menu_end_menu(void);
-void menu_add_entry(struct symbol *sym);
-void menu_add_dep(struct expr *dep);
-void menu_add_visibility(struct expr *dep);
-struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
-void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
-void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
-void menu_add_option_modules(void);
-void menu_add_option_defconfig_list(void);
-void menu_add_option_allnoconfig_y(void);
-void menu_finalize(struct menu *parent);
-void menu_set_type(int type);
-
 /* util.c */
 struct file *file_lookup(const char *name);
 void *xmalloc(size_t size);
@@ -109,6 +92,36 @@ void str_append(struct gstr *gs, const char *s);
 void str_printf(struct gstr *gs, const char *fmt, ...);
 const char *str_get(struct gstr *gs);
 
+/* menu.c */
+void _menu_init(void);
+void menu_warn(struct menu *menu, const char *fmt, ...);
+struct menu *menu_add_menu(void);
+void menu_end_menu(void);
+void menu_add_entry(struct symbol *sym);
+void menu_add_dep(struct expr *dep);
+void menu_add_visibility(struct expr *dep);
+struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
+void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
+void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
+void menu_add_option_modules(void);
+void menu_add_option_defconfig_list(void);
+void menu_add_option_allnoconfig_y(void);
+void menu_finalize(struct menu *parent);
+void menu_set_type(int type);
+
+extern struct menu rootmenu;
+
+bool menu_is_empty(struct menu *menu);
+bool menu_is_visible(struct menu *menu);
+bool menu_has_prompt(struct menu *menu);
+const char *menu_get_prompt(struct menu *menu);
+struct menu *menu_get_root_menu(struct menu *menu);
+struct menu *menu_get_parent_menu(struct menu *menu);
+bool menu_has_help(struct menu *menu);
+const char *menu_get_help(struct menu *menu);
+struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
+void menu_get_ext_help(struct menu *menu, struct gstr *help);
+
 /* symbol.c */
 void sym_clear_all_valid(void);
 struct symbol *sym_choice_default(struct symbol *sym);
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index f9ab98238aef..9e81be33c40f 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -12,20 +12,6 @@ bool conf_get_changed(void);
 void conf_set_changed_callback(void (*fn)(void));
 void conf_set_message_callback(void (*fn)(const char *s));
 
-/* menu.c */
-extern struct menu rootmenu;
-
-bool menu_is_empty(struct menu *menu);
-bool menu_is_visible(struct menu *menu);
-bool menu_has_prompt(struct menu *menu);
-const char * menu_get_prompt(struct menu *menu);
-struct menu * menu_get_root_menu(struct menu *menu);
-struct menu * menu_get_parent_menu(struct menu *menu);
-bool menu_has_help(struct menu *menu);
-const char * menu_get_help(struct menu *menu);
-struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
-void menu_get_ext_help(struct menu *menu, struct gstr *help);
-
 /* symbol.c */
 extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
 
-- 
2.25.1

