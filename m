Return-Path: <linux-kbuild+bounces-2067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE39042DD
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34401F242A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EFC74407;
	Tue, 11 Jun 2024 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJHBlzd7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E874079;
	Tue, 11 Jun 2024 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128564; cv=none; b=n5ERZT0L7Mgp20/dSwwjOlWLTTMc1QG4bYFlLXXwvUel+0mTjpRSArl+i1MrVHRu545eurMWqdRReqXN+U5HJlDI/CzVB3xgIQEauZGozExkShxf+sX3ydxRDYODgBLfjoi0yNgjnG0thgh1sChi3yvlPDYBr7EQYAJGUTsorQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128564; c=relaxed/simple;
	bh=yfQDTv6MlSf5SMz6cU5RG7DZF8B3ediOPWStjd9jKHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXXXN8hrOvEinsxi9XZvFW3s2nLVORs5UAIDgDCYlMjmhx1CzUAbTBm8cRFcE2dnsMawTtEPLVvBa29ijpnMc2z/UoHibJdzUAMgNz7O2HBPHHmzmsUPNog5IJfjGDpAaoxl+u2a7V0s+gfS1v+Yt+BFULNPqc9muGj/pG0dSIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJHBlzd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86090C32786;
	Tue, 11 Jun 2024 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128564;
	bh=yfQDTv6MlSf5SMz6cU5RG7DZF8B3ediOPWStjd9jKHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MJHBlzd7GRDkeW5TrONfyrguc5P8LYHCa6QgXmjxaYh/JugFGq3yOej4lhEcbQTDm
	 vBTa5IoDNXxjfgXYe5uUgobqoi8FRd37MsHJMTGIoAFBpxD9jUsFiXKMZ0LlYt/bPO
	 FPETvjVVjyT1dQ2huwmUG6L0jh3rqU1wHtbTUURd6NoJnlrdjz232aZjIk6EcyeP//
	 7uUr6hUQkZ1gS4IshsLmAkMemWZ/iqOQSVkuk0a+nR76Qu1TAlSY91dV05JXr7ru7N
	 rLvj1x5fCzeXEbLcbraVGDf1CUPUupNpcGKA5mkQkcV5qBqbrxcTzEEoH4HdHTl0BQ
	 wjQOaWAOh9LGg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/16] kconfig: introduce choice_set_value() helper
Date: Wed, 12 Jun 2024 02:55:12 +0900
Message-ID: <20240611175536.3518179-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, sym_set_tristate_value() is used to set 'y' to a choice
member, which is confusing because it not only sets 'y' to the given
symbol but also tweaks flags of other symbols as a side effect.

Add a dedicated function for setting the value of the given choice.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c      |  2 +-
 scripts/kconfig/lkc_proto.h |  1 +
 scripts/kconfig/mconf.c     |  2 +-
 scripts/kconfig/nconf.c     |  2 +-
 scripts/kconfig/symbol.c    | 62 +++++++++++++++++++++++++------------
 5 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index cf8193fc00fc..5dbdd9459f21 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -507,7 +507,7 @@ static void conf_choice(struct menu *menu)
 			print_help(child);
 			continue;
 		}
-		sym_set_tristate_value(child->sym, yes);
+		choice_set_value(menu, child->sym);
 		return;
 	}
 }
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index c663fd8b35d2..1221709efac1 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -28,6 +28,7 @@ bool sym_dep_errors(void);
 enum symbol_type sym_get_type(struct symbol *sym);
 bool sym_tristate_within_range(struct symbol *sym,tristate tri);
 bool sym_set_tristate_value(struct symbol *sym,tristate tri);
+void choice_set_value(struct menu *choice, struct symbol *sym);
 tristate sym_toggle_tristate_value(struct symbol *sym);
 bool sym_string_valid(struct symbol *sym, const char *newval);
 bool sym_string_within_range(struct symbol *sym, const char *str);
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index e6227af51658..03709eb734ae 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -636,7 +636,7 @@ static void conf_choice(struct menu *menu)
 				if (!child->sym)
 					break;
 
-				sym_set_tristate_value(child->sym, yes);
+				choice_set_value(menu, child->sym);
 			}
 			return;
 		case 1:
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index addc89ee61d4..eb5fc3ccaf9d 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1331,7 +1331,7 @@ static void conf_choice(struct menu *menu)
 		case ' ':
 		case  10:
 		case KEY_RIGHT:
-			sym_set_tristate_value(child->sym, yes);
+			choice_set_value(menu, child->sym);
 			return;
 		case 'h':
 		case '?':
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index eaff7ac496bd..8df0a75f40b9 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -516,8 +516,6 @@ bool sym_tristate_within_range(struct symbol *sym, tristate val)
 		return false;
 	if (sym->visible <= sym->rev_dep.tri)
 		return false;
-	if (sym_is_choice_value(sym) && sym->visible == yes)
-		return val == yes;
 	return val >= sym->rev_dep.tri && val <= sym->visible;
 }
 
@@ -532,23 +530,6 @@ bool sym_set_tristate_value(struct symbol *sym, tristate val)
 		sym->flags |= SYMBOL_DEF_USER;
 		sym_set_changed(sym);
 	}
-	/*
-	 * setting a choice value also resets the new flag of the choice
-	 * symbol and all other choice values.
-	 */
-	if (sym_is_choice_value(sym) && val == yes) {
-		struct symbol *cs = prop_get_symbol(sym_get_choice_prop(sym));
-		struct property *prop;
-		struct expr *e;
-
-		cs->def[S_DEF_USER].val = sym;
-		cs->flags |= SYMBOL_DEF_USER;
-		prop = sym_get_choice_prop(cs);
-		for (e = prop->expr; e; e = e->left.expr) {
-			if (e->right.sym->visible != no)
-				e->right.sym->flags |= SYMBOL_DEF_USER;
-		}
-	}
 
 	sym->def[S_DEF_USER].tri = val;
 	if (oldval != val)
@@ -557,10 +538,53 @@ bool sym_set_tristate_value(struct symbol *sym, tristate val)
 	return true;
 }
 
+/**
+ * choice_set_value - set the user input to a choice
+ *
+ * @choice: menu entry for the choice
+ * @sym: selected symbol
+ */
+void choice_set_value(struct menu *choice, struct symbol *sym)
+{
+	struct menu *menu;
+	bool changed = false;
+
+	menu_for_each_sub_entry(menu, choice) {
+		tristate val;
+
+		if (!menu->sym)
+			continue;
+
+		if (menu->sym->visible == no)
+			continue;
+
+		val = menu->sym == sym ? yes : no;
+
+		if (menu->sym->curr.tri != val)
+			changed = true;
+
+		menu->sym->def[S_DEF_USER].tri = val;
+		menu->sym->flags |= SYMBOL_DEF_USER;
+	}
+
+	choice->sym->def[S_DEF_USER].val = sym;
+	choice->sym->flags |= SYMBOL_DEF_USER;
+
+	if (changed)
+		sym_clear_all_valid();
+}
+
 tristate sym_toggle_tristate_value(struct symbol *sym)
 {
+	struct menu *choice;
 	tristate oldval, newval;
 
+	choice = sym_get_choice_menu(sym);
+	if (choice) {
+		choice_set_value(choice, sym);
+		return yes;
+	}
+
 	oldval = newval = sym_get_tristate_value(sym);
 	do {
 		switch (newval) {
-- 
2.43.0


