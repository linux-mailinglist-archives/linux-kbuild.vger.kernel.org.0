Return-Path: <linux-kbuild+bounces-1760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 744A98BBDAD
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30EF5281D78
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EA784D10;
	Sat,  4 May 2024 18:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0aqiMt5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80984D05;
	Sat,  4 May 2024 18:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847651; cv=none; b=JhIBQimZrMotyBGsIARYpIbzmZFStHXKkfzXl3OZOQ6E/r6RYYJipXy+tIYlaCJeODhetVenqp70LuU/gg2S9UId9qXsXrnAhpFdFXCtjmDumwclxaOYfZCM/T4qUFrt1UNBH4Ws6Taf6Crxf8MPDvjTCZtZOijDnXLoX7hivzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847651; c=relaxed/simple;
	bh=GWbCaBdcnf01W2IHy2aEsnhjZHDC3HN1ToNEvWOVz2c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2wHVl1FWPL6gyU4DiIDD9bOzHpo+TshCKljY8FYgDnbyDDTyX3WV2EJQdwgzZS6kaX2bZKlK+PlnFwy/N9PVm+XgAXoSYSXUJKn22q8b3BWbg/Jkxo1GoCDQgMfnN09vFNmJaXQbsqtEJPVLjQ3UEm5Y4ZOYYhG7tDC4x8oREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0aqiMt5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C76C4AF1A;
	Sat,  4 May 2024 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847651;
	bh=GWbCaBdcnf01W2IHy2aEsnhjZHDC3HN1ToNEvWOVz2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m0aqiMt5vfstVZCTb5/OvPNzg7S0yoxYokcKNSqbEvJrMuM34iHkan3rtNG4p0XVj
	 16JNdAPT5Q+3aBmMFNfTavwaVOVUpr83ygOtGohBuThPw0nWmU4ia0oxAQ7Cg4ifaP
	 yANBsXk3NmNtjkaUUQojF+kO36Ir85RcdHoyzy+7JpGVweBbh7av7loAUWDvezEMhH
	 M+gheW0wIo/YL677ZT1EDR++iarjgyPzLsrx/T07OmLXnhP+k63SUFq7v3wajpJxAe
	 4FGPDAa99CVACKIH6De9URzabWgFaQD/grxE5VrMbb9Fp5kjnMiOtJYxmxn+zdH/uR
	 7CJ2Cbw1C4TXA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/10] kconfig: gconf: use MENU_CHANGED instead of SYMBOL_CHANGED
Date: Sun,  5 May 2024 03:33:26 +0900
Message-Id: <20240504183333.2031860-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504183333.2031860-1-masahiroy@kernel.org>
References: <20240504183333.2031860-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SYMBOL_CHANGED and MENU_CHANGED are used to update GUI frontends
when the symbol value is changed. These are used inconsistently:
SYMBOL_CHANGED in gconf.c and MENU_CHANGE in qconf.cc.

MENU_CHANGED works more properly when a symbol has multiple prompts
(although such code is not ideal).

[test code]

    config FOO
            bool "foo prompt 1"

    config FOO
            bool "foo prompt 2"

In gconfig, if one of the two checkboxes is clicked, only the first
one is toggled. In xconfig, the two checkboxes work in sync.

Replace SYMBOL_CHANGED in gconf.c with MENU_CHANGED to align with
the xconfig behavior.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 89614f1e49e6..10d602faa51e 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1047,7 +1047,7 @@ static gchar **fill_row(struct menu *menu)
 	row[COL_NAME] = g_strdup(sym->name);
 
 	sym_calc_value(sym);
-	sym->flags &= ~SYMBOL_CHANGED;
+	menu->flags &= ~MENU_CHANGED;
 
 	if (sym_is_choice(sym)) {	// parse childs for getting final value
 		struct menu *child;
@@ -1273,7 +1273,7 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 				else
 					goto reparse;	// next child
 			}
-		} else if (sym && (sym->flags & SYMBOL_CHANGED)) {
+		} else if (sym && (child1->flags & MENU_CHANGED)) {
 			set_node(child2, menu1, fill_row(menu1));
 		}
 
@@ -1289,7 +1289,6 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 /* Display the whole tree (single/split/full view) */
 static void display_tree(struct menu *menu)
 {
-	struct symbol *sym;
 	struct property *prop;
 	struct menu *child;
 	enum prop_type ptype;
@@ -1301,11 +1300,9 @@ static void display_tree(struct menu *menu)
 
 	for (child = menu->list; child; child = child->next) {
 		prop = child->prompt;
-		sym = child->sym;
 		ptype = prop ? prop->type : P_UNKNOWN;
 
-		if (sym)
-			sym->flags &= ~SYMBOL_CHANGED;
+		menu->flags &= ~MENU_CHANGED;
 
 		if ((view_mode == SPLIT_VIEW)
 		    && !(child->flags & MENU_ROOT) && (tree == tree1))
-- 
2.40.1


