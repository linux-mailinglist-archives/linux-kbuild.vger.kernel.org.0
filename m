Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E46D5F6EE
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 12:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbfGDK6x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jul 2019 06:58:53 -0400
Received: from mx-rz-1.rrze.uni-erlangen.de ([131.188.11.20]:57651 "EHLO
        mx-rz-1.rrze.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727436AbfGDK6x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 06:58:53 -0400
X-Greylist: delayed 483 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Jul 2019 06:58:51 EDT
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 45fZWq5pSMz8syK;
        Thu,  4 Jul 2019 12:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2013;
        t=1562237447; bh=4+sdxQVUoVMQRuexpL8X9Pv/RrsF9c2/UJzoDy48BUI=;
        h=From:To:Cc:Subject:Date:From:To:CC:Subject;
        b=mV2Nnwl7gKG0R/8fNkl3PctnU/2t0wlJ7u0UIdnlqXJB1UWNS3MDapbEJKSgzwR5B
         tghQ15TX6lqlGr0NNWQ36HI6KlRQvC5wvl4n1CDwxtt2vGOyMxC1lPW4FNhHT7PSBR
         5OoIXzeXCmPbyQhJ7IXZN0R4Ug29GEABgyzlJSyaJOL89lpPqrHTdZwpqAhTbTAn6A
         uM08wCa59UgCJhrXV7RLEvcv7u15tH82Em0ue29nLiHYrsXk5UouuSPN7Q5WZRrOeB
         CeR2MnpCcBgSAXU/wqGRWu3c2L6WcRYP6V+qt4qpv9PVVvEMDuC6/tUo9Qy+E15Brt
         NmvFlJ2QNJyrQ==
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 131.188.40.42
Received: from localhost.localdomain (i4stubs-unpriv.informatik.uni-erlangen.de [131.188.40.42])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: U2FsdGVkX1/Ym/fsjy3oLlugjH0ynysm/z4gbshlsWI=)
        by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 45fZWn2Z80z8vTf;
        Thu,  4 Jul 2019 12:50:45 +0200 (CEST)
From:   Marco Ammon <marco.ammon@fau.de>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Marco Ammon <marco.ammon@fau.de>
Subject: [PATCH] lkc_proto.h: Fix spelling of sym_is_changable
Date:   Thu,  4 Jul 2019 12:50:41 +0200
Message-Id: <20190704105041.7646-1-marco.ammon@fau.de>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is a spelling mistake in "changable", it is corrected to
"changeable" and all call sites are updated accordingly.

Signed-off-by: Marco Ammon <marco.ammon@fau.de>
---
 scripts/kconfig/conf.c      |  6 +++---
 scripts/kconfig/confdata.c  |  2 +-
 scripts/kconfig/lkc_proto.h |  2 +-
 scripts/kconfig/mconf.c     | 10 +++++-----
 scripts/kconfig/nconf.c     | 10 +++++-----
 scripts/kconfig/qconf.cc    |  2 +-
 scripts/kconfig/symbol.c    |  2 +-
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 0d4c4f3a8f29..40e16e871ae2 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -90,7 +90,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	line[0] = '\n';
 	line[1] = 0;
 
-	if (!sym_is_changable(sym)) {
+	if (!sym_is_changeable(sym)) {
 		printf("%s\n", def);
 		line[0] = '\n';
 		line[1] = 0;
@@ -234,7 +234,7 @@ static int conf_choice(struct menu *menu)
 
 	sym = menu->sym;
 	is_new = !sym_has_value(sym);
-	if (sym_is_changable(sym)) {
+	if (sym_is_changeable(sym)) {
 		conf_sym(menu);
 		sym_calc_value(sym);
 		switch (sym_get_tristate_value(sym)) {
@@ -418,7 +418,7 @@ static void check_conf(struct menu *menu)
 
 	sym = menu->sym;
 	if (sym && !sym_has_value(sym)) {
-		if (sym_is_changable(sym) ||
+		if (sym_is_changeable(sym) ||
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
 			if (input_mode == listnewconfig) {
 				if (sym->name) {
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 18e8051d89d7..caab7336abc1 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -796,7 +796,7 @@ int conf_write_defconfig(const char *filename)
 				goto next_menu;
 			sym->flags &= ~SYMBOL_WRITE;
 			/* If we cannot change the symbol - skip */
-			if (!sym_is_changable(sym))
+			if (!sym_is_changeable(sym))
 				goto next_menu;
 			/* If symbol equals to default value - skip */
 			if (strcmp(sym_get_string_value(sym), sym_get_string_default(sym)) == 0)
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 38a32b1c1a28..f9ab98238aef 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -42,7 +42,7 @@ tristate sym_toggle_tristate_value(struct symbol *sym);
 bool sym_string_valid(struct symbol *sym, const char *newval);
 bool sym_string_within_range(struct symbol *sym, const char *str);
 bool sym_set_string_value(struct symbol *sym, const char *newval);
-bool sym_is_changable(struct symbol *sym);
+bool sym_is_changeable(struct symbol *sym);
 struct property * sym_get_choice_prop(struct symbol *sym);
 const char * sym_get_string_value(struct symbol *sym);
 
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 694091f3ef9d..49c26ea9dd98 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -536,7 +536,7 @@ static void build_conf(struct menu *menu)
 		}
 
 		val = sym_get_tristate_value(sym);
-		if (sym_is_changable(sym)) {
+		if (sym_is_changeable(sym)) {
 			switch (type) {
 			case S_BOOLEAN:
 				item_make("[%c]", val == no ? ' ' : '*');
@@ -587,7 +587,7 @@ static void build_conf(struct menu *menu)
 		} else {
 			switch (type) {
 			case S_BOOLEAN:
-				if (sym_is_changable(sym))
+				if (sym_is_changeable(sym))
 					item_make("[%c]", val == no ? ' ' : '*');
 				else
 					item_make("-%c-", val == no ? ' ' : '*');
@@ -600,7 +600,7 @@ static void build_conf(struct menu *menu)
 				case mod: ch = 'M'; break;
 				default:  ch = ' '; break;
 				}
-				if (sym_is_changable(sym)) {
+				if (sym_is_changeable(sym)) {
 					if (sym->rev_dep.tri == mod)
 						item_make("{%c}", ch);
 					else
@@ -617,7 +617,7 @@ static void build_conf(struct menu *menu)
 				if (tmp < 0)
 					tmp = 0;
 				item_add_str("%*c%s%s", tmp, ' ', menu_get_prompt(menu),
-					     (sym_has_value(sym) || !sym_is_changable(sym)) ?
+					     (sym_has_value(sym) || !sym_is_changeable(sym)) ?
 					     "" : " (NEW)");
 				item_set_tag('s');
 				item_set_data(menu);
@@ -625,7 +625,7 @@ static void build_conf(struct menu *menu)
 			}
 		}
 		item_add_str("%*c%s%s", indent + 1, ' ', menu_get_prompt(menu),
-			  (sym_has_value(sym) || !sym_is_changable(sym)) ?
+			  (sym_has_value(sym) || !sym_is_changeable(sym)) ?
 			  "" : " (NEW)");
 		if (menu->prompt->type == P_MENU) {
 			item_add_str("  %s", menu_is_empty(menu) ? "----" : "--->");
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index cbafe3bf082e..b7c1ef757178 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -803,7 +803,7 @@ static void build_conf(struct menu *menu)
 		}
 
 		val = sym_get_tristate_value(sym);
-		if (sym_is_changable(sym)) {
+		if (sym_is_changeable(sym)) {
 			switch (type) {
 			case S_BOOLEAN:
 				item_make(menu, 't', "[%c]",
@@ -857,7 +857,7 @@ static void build_conf(struct menu *menu)
 		} else {
 			switch (type) {
 			case S_BOOLEAN:
-				if (sym_is_changable(sym))
+				if (sym_is_changeable(sym))
 					item_make(menu, 't', "[%c]",
 						val == no ? ' ' : '*');
 				else
@@ -876,7 +876,7 @@ static void build_conf(struct menu *menu)
 					ch = ' ';
 					break;
 				}
-				if (sym_is_changable(sym)) {
+				if (sym_is_changeable(sym)) {
 					if (sym->rev_dep.tri == mod)
 						item_make(menu,
 							't', "{%c}", ch);
@@ -896,14 +896,14 @@ static void build_conf(struct menu *menu)
 				item_add_str("%*c%s%s", tmp, ' ',
 						menu_get_prompt(menu),
 						(sym_has_value(sym) ||
-						 !sym_is_changable(sym)) ? "" :
+						 !sym_is_changeable(sym)) ? "" :
 						" (NEW)");
 				goto conf_childs;
 			}
 		}
 		item_add_str("%*c%s%s", indent + 1, ' ',
 				menu_get_prompt(menu),
-				(sym_has_value(sym) || !sym_is_changable(sym)) ?
+				(sym_has_value(sym) || !sym_is_changeable(sym)) ?
 				"" : " (NEW)");
 		if (menu->prompt && menu->prompt->type == P_MENU) {
 			item_add_str("  %s", menu_is_empty(menu) ? "----" : "--->");
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index ce7fc87a49a7..82773cc35d35 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -152,7 +152,7 @@ void ConfigItem::updateMenu(void)
 	case S_TRISTATE:
 		char ch;
 
-		if (!sym_is_changable(sym) && list->optMode == normalOpt) {
+		if (!sym_is_changeable(sym) && list->optMode == normalOpt) {
 			setPixmap(promptColIdx, QIcon());
 			setText(noColIdx, QString::null);
 			setText(modColIdx, QString::null);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 1f9266dadedf..b78650cf2dbe 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -785,7 +785,7 @@ const char *sym_get_string_value(struct symbol *sym)
 	return (const char *)sym->curr.val;
 }
 
-bool sym_is_changable(struct symbol *sym)
+bool sym_is_changeable(struct symbol *sym)
 {
 	return sym->visible > sym->rev_dep.tri;
 }
-- 
2.22.0

