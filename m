Return-Path: <linux-kbuild+bounces-1808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C538BE72E
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 17:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7F41F26F2E
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 15:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E84C161338;
	Tue,  7 May 2024 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTyxmjez"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5611816132B;
	Tue,  7 May 2024 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094972; cv=none; b=X8ZtHH21Lv5Z1NnbSlAoUDeCC8TpvJRbDaWzhEFkLzxrl4phgK5F5O6SMdRmMmltkTRz3+D+RkhKowIGJB0WRU/wuxf8CRLVhIUGeRT1Ry/4lSaTL2twKLSkIVFShxd6xwU0NHLW0b+E4IqLJWft1JoZKQ0wQ3Cd7CBxBBJU+fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094972; c=relaxed/simple;
	bh=QUogm6XbstFvYkcjv7KK2GaltaFkqCsX5pzRZC70Pt8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nCojN/fA+vGVAFe0e2UYiVkUP8nSmB+4SGxXPfb2NixNcd2/te8mEKp3+uE+lD2uukyU9o8xxmYy81u056FdQ7eQtl5jKCiJkl2cj4VpuWhdoUNw4fuYi8AfNhalUyIR2gS4jCKnHPGOdRo5LzZjSZIlvLcRVh6YjQpwas7kmvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTyxmjez; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0E7C4AF63;
	Tue,  7 May 2024 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715094971;
	bh=QUogm6XbstFvYkcjv7KK2GaltaFkqCsX5pzRZC70Pt8=;
	h=From:To:Cc:Subject:Date:From;
	b=fTyxmjezSM4F9xUXLUWV898774LiGYOMQmXu6h5Jct6lyqa+b2nB2VzwkPQsqkRjm
	 QFeoQ8RYNYFUDexZpVKDVrjNGiPaF5ev0/tPNNGSPya9nHnYZ/263vcN3Obj8Gfuqt
	 1WuLxGXiZhnPLDZDcK2Z5/Ysfvludx0WBia800MGtsu4sqvrQKzJ0pBhZF3BZiwYWS
	 u0jRlIy8BXtxLwZ86KiynLKkuFI7UmaUpqrM2xVh7tmS+7Ayo87rIBpiEIHHxH+W0l
	 k8eyWDuDRcAzYJieZ5QCEEzv+scb8OhVeLVeCiFHz5Ir3vNR+Bn6DNMAtkLMgox1fQ
	 gWTnS562J/n/w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: gconf: show checkbox for choice correctly
Date: Wed,  8 May 2024 00:14:50 +0900
Message-Id: <20240507151450.1417814-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, bool choices have a checkbox, but tristate choices do not.
It is opposite.

Bool choices should not have a checkbox, as they are fixed to 'y' since
commit 6a1215888e23 ("kconfig: remove 'optional' property support").
Tristate choices, however, should have a checkbox to allow users to
toggle the value.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 10d602faa51e..cc400ffe6615 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1054,8 +1054,6 @@ static gchar **fill_row(struct menu *menu)
 		struct symbol *def_sym = sym_get_choice_value(sym);
 		struct menu *def_menu = NULL;
 
-		row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
-
 		for (child = menu->list; child; child = child->next) {
 			if (menu_is_visible(child)
 			    && child->sym == def_sym)
@@ -1065,6 +1063,11 @@ static gchar **fill_row(struct menu *menu)
 		if (def_menu)
 			row[COL_VALUE] =
 			    g_strdup(menu_get_prompt(def_menu));
+
+		if (sym_get_type(sym) == S_BOOLEAN) {
+			row[COL_BTNVIS] = GINT_TO_POINTER(FALSE);
+			return row;
+		}
 	}
 	if (sym->flags & SYMBOL_CHOICEVAL)
 		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
@@ -1072,11 +1075,6 @@ static gchar **fill_row(struct menu *menu)
 	stype = sym_get_type(sym);
 	switch (stype) {
 	case S_BOOLEAN:
-		if (GPOINTER_TO_INT(row[COL_PIXVIS]) == FALSE)
-			row[COL_BTNVIS] = GINT_TO_POINTER(TRUE);
-		if (sym_is_choice(sym))
-			break;
-		/* fall through */
 	case S_TRISTATE:
 		val = sym_get_tristate_value(sym);
 		switch (val) {
-- 
2.40.1


