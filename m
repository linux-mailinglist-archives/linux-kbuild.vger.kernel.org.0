Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B231222FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 05:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727690AbfLQEOv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 23:14:51 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:49410 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727472AbfLQEOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:51 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xBH4EPAI024524;
        Tue, 17 Dec 2019 13:14:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xBH4EPAI024524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576556071;
        bh=2R2qiN5dNPqF6NEga1JY7x7NqLiqE7O4OMCOP5WmCd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dYqTKlChd96JXA4L9b0zfGNe66UAWKUC8O+AYVgsbNpLG0SYAn8s9jlITw/mx5zxo
         2/J3hrzpjxOqFoQMMs/C2XAu1cTmFr9NyleQa0PB6VNIXP4Kiv6z30U2YTG8OemIyy
         dFlCUHruAEpPeudnqhQHxR4fUMg0hZCxtkB88ljeOK0G12c1HAcujvb21y9Kv6OOm+
         yAKDg+Btv+0/EAAkTn+TpAB1zfSjcVkIOsLFh5ZeKik8v5sS6u9YPOwRvR1tEq58LM
         1NfIi7OLHpXcjAIUi4z7pzlQTDtzjA8duB3dpM/fBx3vasv+qLzUrAlL0hXQu+86MB
         /NBePIEylyIgw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] kconfig: squash prop_alloc() into menu_add_prop()
Date:   Tue, 17 Dec 2019 13:14:23 +0900
Message-Id: <20191217041424.29285-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217041424.29285-1-masahiroy@kernel.org>
References: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

prop_alloc() is only called from menu_add_prop(). Squash it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc.h    |  1 -
 scripts/kconfig/menu.c   | 18 +++++++++++++++++-
 scripts/kconfig/symbol.c | 21 ---------------------
 3 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 4fb16f316626..73d3f01f1736 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -112,7 +112,6 @@ struct symbol *sym_choice_default(struct symbol *sym);
 struct property *sym_get_range_prop(struct symbol *sym);
 const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
-struct property *prop_alloc(enum prop_type type, struct symbol *sym);
 struct symbol *prop_get_symbol(struct property *prop);
 
 static inline tristate sym_get_tristate_value(struct symbol *sym)
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 5a43784ded2c..8b772ced755d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -127,12 +127,28 @@ void menu_set_type(int type)
 static struct property *menu_add_prop(enum prop_type type, struct expr *expr,
 				      struct expr *dep)
 {
-	struct property *prop = prop_alloc(type, current_entry->sym);
+	struct property *prop;
 
+	prop = xmalloc(sizeof(*prop));
+	memset(prop, 0, sizeof(*prop));
+	prop->type = type;
+	prop->file = current_file;
+	prop->lineno = zconf_lineno();
 	prop->menu = current_entry;
 	prop->expr = expr;
 	prop->visible.expr = dep;
 
+	/* append property to the prop list of symbol */
+	if (current_entry->sym) {
+		struct property **propp;
+
+		for (propp = &current_entry->sym->prop;
+		     *propp;
+		     propp = &(*propp)->next)
+			;
+		*propp = prop;
+	}
+
 	return prop;
 }
 
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dbc5365d8bbc..8d38b700b314 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1273,27 +1273,6 @@ struct symbol *sym_check_deps(struct symbol *sym)
 	return sym2;
 }
 
-struct property *prop_alloc(enum prop_type type, struct symbol *sym)
-{
-	struct property *prop;
-	struct property **propp;
-
-	prop = xmalloc(sizeof(*prop));
-	memset(prop, 0, sizeof(*prop));
-	prop->type = type;
-	prop->file = current_file;
-	prop->lineno = zconf_lineno();
-
-	/* append property to the prop list of symbol */
-	if (sym) {
-		for (propp = &sym->prop; *propp; propp = &(*propp)->next)
-			;
-		*propp = prop;
-	}
-
-	return prop;
-}
-
 struct symbol *prop_get_symbol(struct property *prop)
 {
 	if (prop->expr && (prop->expr->type == E_SYMBOL ||
-- 
2.17.1

