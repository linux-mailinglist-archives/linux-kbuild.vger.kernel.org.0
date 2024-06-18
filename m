Return-Path: <linux-kbuild+bounces-2186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D6090C999
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 800D9282AA8
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E014A16A940;
	Tue, 18 Jun 2024 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1pUU4P+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96D716A937;
	Tue, 18 Jun 2024 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706961; cv=none; b=pTJA3zbi3yQY2PU5TgUaQtbeVHAO+wPu+61De0zS92A1x51QK0dlwAbowi+94DWDoRF53jtZ4jCIoMhNIsQHhkR5Tve/KaZGm/VIxVQUU1SJIaSAtfEzhTdGvLgZvWSuxWzacGdHADKmqBAV9LY5bg3AxIXCo5oknmLvNduN4io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706961; c=relaxed/simple;
	bh=anUXtfDLkTpjZ0U4pS6AA+Ic6/jhl3ebRv79CDRjrLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUOS26Y0RKTyaZKNwXcGIApn+4ylCt1IrSKUBPZaCaB/huJsfyVSSFzul+BHLHNlrqAmOBquVoyiLtix5jO0cZ56yD4xWqxAPDPoWBnVBfvxGyVs7fZCA58LvBJ9Jnklm0q4RoByRQr5YBiUU1D69B/g1GGX5898+OwJQMN1Qyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1pUU4P+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAE5C4AF1D;
	Tue, 18 Jun 2024 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706961;
	bh=anUXtfDLkTpjZ0U4pS6AA+Ic6/jhl3ebRv79CDRjrLM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I1pUU4P+LMikyn5LNEklElIIBWw38Nk8Ck3HYn965S1EkEavUXzEUFyFfUHyEVmoB
	 i6fnHKn1O7LAjA2nIS936zIHVsuE5WLYv+CZjtavajCHsnq2y0LYk44qivWWYfKxbn
	 evunNrQfJiZ4xFhUSH0FG2KBng7i6+K0KabvQdCvyYeuCX+Me2346uQTcr3Rd2ncpc
	 Pr1W7MfpAZESYvYU0gh4FqidfhmPPmIG44bs9QfV4YM+nNcqA6f2I7YqTrKkruj/Of
	 +1L34kHUEarijoHGlOoU+LwjAS4/VlrlY405+iVYeK7XIkRKNv5YmFkFAuKgr0b7lN
	 KfeQ096MQd2/g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 11/12] kconfig: remove P_CHOICE property
Date: Tue, 18 Jun 2024 19:35:30 +0900
Message-ID: <20240618103541.3508486-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618103541.3508486-1-masahiroy@kernel.org>
References: <20240618103541.3508486-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

P_CHOICE is a pseudo property used to link a choice with its members.

There is no more code relying on this, except for some debug code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/expr.h      |  4 +---
 scripts/kconfig/lkc_proto.h |  1 -
 scripts/kconfig/menu.c      |  8 +-------
 scripts/kconfig/parser.y    |  4 ----
 scripts/kconfig/qconf.cc    |  8 --------
 scripts/kconfig/symbol.c    | 14 +-------------
 6 files changed, 3 insertions(+), 36 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 1d1c4442c941..58fd4c8c3762 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -167,7 +167,6 @@ enum prop_type {
 	P_COMMENT,  /* text associated with a comment */
 	P_MENU,     /* prompt associated with a menu or menuconfig symbol */
 	P_DEFAULT,  /* default y */
-	P_CHOICE,   /* choice value */
 	P_SELECT,   /* select BAR */
 	P_IMPLY,    /* imply BAR */
 	P_RANGE,    /* range 7..100 (for a symbol) */
@@ -181,7 +180,7 @@ struct property {
 	struct expr_value visible;
 	struct expr *expr;         /* the optional conditional part of the property */
 	struct menu *menu;         /* the menu the property are associated with
-	                            * valid for: P_SELECT, P_RANGE, P_CHOICE,
+	                            * valid for: P_SELECT, P_RANGE,
 	                            * P_PROMPT, P_DEFAULT, P_MENU, P_COMMENT */
 	const char *filename;      /* what file was this property defined */
 	int lineno;                /* what lineno was this property defined */
@@ -191,7 +190,6 @@ struct property {
 	for (st = sym->prop; st; st = st->next) \
 		if (st->type == (tok))
 #define for_all_defaults(sym, st) for_all_properties(sym, st, P_DEFAULT)
-#define for_all_choices(sym, st) for_all_properties(sym, st, P_CHOICE)
 #define for_all_prompts(sym, st) \
 	for (st = sym->prop; st; st = st->next) \
 		if (st->text)
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 1221709efac1..49cc649d2810 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -34,7 +34,6 @@ bool sym_string_valid(struct symbol *sym, const char *newval);
 bool sym_string_within_range(struct symbol *sym, const char *str);
 bool sym_set_string_value(struct symbol *sym, const char *newval);
 bool sym_is_changeable(struct symbol *sym);
-struct property * sym_get_choice_prop(struct symbol *sym);
 struct menu *sym_get_choice_menu(struct symbol *sym);
 const char * sym_get_string_value(struct symbol *sym);
 
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index 170a269a8d7c..0353f621ecaa 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -306,7 +306,7 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 	struct menu *menu, *last_menu;
 	struct symbol *sym;
 	struct property *prop;
-	struct expr *parentdep, *basedep, *dep, *dep2, **ep;
+	struct expr *parentdep, *basedep, *dep, *dep2;
 
 	sym = parent->sym;
 	if (parent->list) {
@@ -492,12 +492,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 		    menu->sym && !sym_is_choice_value(menu->sym)) {
 			current_entry = menu;
 			menu->sym->flags |= SYMBOL_CHOICEVAL;
-			menu_add_symbol(P_CHOICE, sym, NULL);
-			prop = sym_get_choice_prop(sym);
-			for (ep = &prop->expr; *ep; ep = &(*ep)->left.expr)
-				;
-			*ep = expr_alloc_one(E_LIST, NULL);
-			(*ep)->right.sym = menu->sym;
 		}
 
 		/*
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 9d58544b0255..745c82ee15d0 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -241,7 +241,6 @@ choice: T_CHOICE T_EOL
 	struct symbol *sym = sym_lookup(NULL, 0);
 
 	menu_add_entry(sym);
-	menu_add_expr(P_CHOICE, NULL, NULL);
 	menu_set_type(S_BOOLEAN);
 	INIT_LIST_HEAD(&current_entry->choice_members);
 
@@ -696,9 +695,6 @@ static void print_symbol(FILE *out, struct menu *menu)
 			}
 			fputc('\n', out);
 			break;
-		case P_CHOICE:
-			fputs("  #choice value\n", out);
-			break;
 		case P_SELECT:
 			fputs( "  select ", out);
 			expr_fprint(prop->expr, out);
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 30346e294d1a..7d239c032b3d 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1101,14 +1101,6 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 				   &stream, E_NONE);
 			stream << "<br>";
 			break;
-		case P_CHOICE:
-			if (sym_is_choice(sym)) {
-				stream << "choice: ";
-				expr_print(prop->expr, expr_print_help,
-					   &stream, E_NONE);
-				stream << "<br>";
-			}
-			break;
 		default:
 			stream << "unknown property: ";
 			stream << prop_get_type_name(prop->type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index b50911bcb08d..cf682a8a3f1e 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -68,15 +68,6 @@ const char *sym_type_name(enum symbol_type type)
 	return "???";
 }
 
-struct property *sym_get_choice_prop(struct symbol *sym)
-{
-	struct property *prop;
-
-	for_all_choices(sym, prop)
-		return prop;
-	return NULL;
-}
-
 /**
  * sym_get_choice_menu - get the parent choice menu if present
  *
@@ -1225,8 +1216,7 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
 	stack.expr = NULL;
 
 	for (prop = sym->prop; prop; prop = prop->next) {
-		if (prop->type == P_CHOICE || prop->type == P_SELECT ||
-		    prop->type == P_IMPLY)
+		if (prop->type == P_SELECT || prop->type == P_IMPLY)
 			continue;
 		stack.prop = prop;
 		sym2 = sym_check_expr_deps(prop->visible.expr);
@@ -1343,8 +1333,6 @@ const char *prop_get_type_name(enum prop_type type)
 		return "menu";
 	case P_DEFAULT:
 		return "default";
-	case P_CHOICE:
-		return "choice";
 	case P_SELECT:
 		return "select";
 	case P_IMPLY:
-- 
2.43.0


