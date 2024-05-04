Return-Path: <linux-kbuild+bounces-1759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03418BBDAB
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D57A1C20AC0
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7409083CD3;
	Sat,  4 May 2024 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSdielt+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0B83CB8;
	Sat,  4 May 2024 18:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847650; cv=none; b=rqZn+Q9bHxMq9cInVSo1QLuGevIympYGNcyxs5K53xhR/X5D1pBhA4y0fpe5A0UAiA4mN+hoSKQU1gZCg2eqToZRPSN5aYndA6uE9JKHjbRl/pKVeeqI9J9RetqdIedxyPqveyJAYqKTZwxBKLLkXhtwWwILsD+ythHK+6TRZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847650; c=relaxed/simple;
	bh=/4u7V5qiFPZq7A2fjkQbdEptgQwpMRiVnwYeqYcRlLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YJ7PtCsnud11jITR9k0i4sxJocO9NhE3cWEIZhdjKD9CwyWmdKymwDU/F2hknv/iSsxcI09UjhBWkq3gRfz13tp0vASyw96rad2zWvN+5t9qPwddWa9yAg1pWExvhofhiZ3boGUL4WKLwf/fG8+77zpf503jXtUW/xDxd1Oyq2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSdielt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC42CC4AF19;
	Sat,  4 May 2024 18:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847649;
	bh=/4u7V5qiFPZq7A2fjkQbdEptgQwpMRiVnwYeqYcRlLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSdielt+kvWy/o93TH5nBGaxPJKuGciN07K7smnYGcvCnlsmzUA+/h19E9CiBmT9T
	 m/HmSXPrt5tXr6kf5cRiavcFFWwAyNcnJll0c3bDJA4f4QMn9t+BCtyuqnaQGJk9KX
	 H4XijaDtnCAooYFjsA6Wz8cBXzpwo3WZ+NrZ7sXQhhvxdznB5kK95aWPuUA50b0wpO
	 KNDWC3uuBoRwiyfWO3Zkaj5xtrFN9WchWWSckoTuQesG07K7lc1YMgrfj2gQd4Rphd
	 +7qI6hfMj+dUU7b8pjhofJ1J37aod5Q2w/zyecYDfPgU5QDp9Wqp7p9Njxpx8sncmJ
	 4xr91/yQ11EdA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 02/10] kconfig: gconf: remove debug code
Date: Sun,  5 May 2024 03:33:25 +0900
Message-Id: <20240504183333.2031860-2-masahiroy@kernel.org>
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

This is not so useful. If necessary, you can insert printf() or
whatever during debugging.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 49 +----------------------------------------
 1 file changed, 1 insertion(+), 48 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 12b55f2e369b..89614f1e49e6 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -18,8 +18,6 @@
 #include <unistd.h>
 #include <time.h>
 
-//#define DEBUG
-
 enum {
 	SINGLE_VIEW, SPLIT_VIEW, FULL_VIEW
 };
@@ -71,33 +69,6 @@ static void set_node(GtkTreeIter * node, struct menu *menu, gchar ** row);
 static gchar **fill_row(struct menu *menu);
 static void conf_changed(void);
 
-/* Helping/Debugging Functions */
-#ifdef DEBUG
-static const char *dbg_sym_flags(int val)
-{
-	static char buf[256];
-
-	bzero(buf, 256);
-
-	if (val & SYMBOL_CONST)
-		strcat(buf, "const/");
-	if (val & SYMBOL_CHECK)
-		strcat(buf, "check/");
-	if (val & SYMBOL_CHOICEVAL)
-		strcat(buf, "choiceval/");
-	if (val & SYMBOL_VALID)
-		strcat(buf, "valid/");
-	if (val & SYMBOL_WRITE)
-		strcat(buf, "write/");
-	if (val & SYMBOL_CHANGED)
-		strcat(buf, "changed/");
-
-	buf[strlen(buf) - 1] = '\0';
-
-	return buf;
-}
-#endif
-
 static void replace_button_icon(GladeXML *xml, GdkDrawable *window,
 				GtkStyle *style, gchar *btn_name, gchar **xpm)
 {
@@ -1262,12 +1233,6 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 		else
 			menu2 = NULL;	// force adding of a first child
 
-#ifdef DEBUG
-		printf("%*c%s | %s\n", indent, ' ',
-		       menu1 ? menu_get_prompt(menu1) : "nil",
-		       menu2 ? menu_get_prompt(menu2) : "nil");
-#endif
-
 		if ((opt_mode == OPT_NORMAL && !menu_is_visible(child1)) ||
 		    (opt_mode == OPT_PROMPT && !menu_has_prompt(child1)) ||
 		    (opt_mode == OPT_ALL    && !menu_get_prompt(child1))) {
@@ -1354,19 +1319,7 @@ static void display_tree(struct menu *menu)
 		    (opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
 		    (opt_mode == OPT_ALL    && menu_get_prompt(child)))
 			place_node(child, fill_row(child));
-#ifdef DEBUG
-		printf("%*c%s: ", indent, ' ', menu_get_prompt(child));
-		printf("%s", child->flags & MENU_ROOT ? "rootmenu | " : "");
-		printf("%s", prop_get_type_name(ptype));
-		printf(" | ");
-		if (sym) {
-			printf("%s", sym_type_name(sym->type));
-			printf(" | ");
-			printf("%s", dbg_sym_flags(sym->flags));
-			printf("\n");
-		} else
-			printf("\n");
-#endif
+
 		if ((view_mode != FULL_VIEW) && (ptype == P_MENU)
 		    && (tree == tree2))
 			continue;
-- 
2.40.1


