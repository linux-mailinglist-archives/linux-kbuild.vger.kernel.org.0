Return-Path: <linux-kbuild+bounces-2180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B2190C98C
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1731C22A48
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67381153597;
	Tue, 18 Jun 2024 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnvMeuB7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE2152190;
	Tue, 18 Jun 2024 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706954; cv=none; b=dnpJzoKhsEQXD5vR54eQR6sDj/OZgzlRXDYjzV94cPmllO+EbEJiD8AWhAfs0VeWwG4R0shzD91fay7sm6BI4LozwOTaIneo5feOFCCJUlI6re+a0g18sgzxdwTnonf0QzrCLQFj7nWTXPQB7DNsGr7M3UJFLaKTfmJeDF9iHSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706954; c=relaxed/simple;
	bh=89rZp1LMGMVtrPRcf+VYLbCQcVQcrBkdgxFz3VVj0VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bf/7MrZkVEU47XHXNHdTTgFYVhr16TO86w3tPOXv92BmqKkFVcWfFFNJi3GGaK26ecFD9VUUNiBt1ve1ddIflP/ZNVfuigcM5LJ/AKm5pU777uO337TGXXx/aNEGBOG5mvptizqGNwNP+Z7i3ShvZqsMVbo1A7XjHoCCBe9hgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnvMeuB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CA2C4AF48;
	Tue, 18 Jun 2024 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706953;
	bh=89rZp1LMGMVtrPRcf+VYLbCQcVQcrBkdgxFz3VVj0VA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CnvMeuB7Liih1qy13tWMQH1Ygj9sW96MSfxHKUhQrUkGN5rTI27KQmscwBW7OKDBk
	 73Dd8x4hq+NCPZ6Lk55n2V/aiSOQTtW4RlM0kmreXmp0ecxbmsrlxDJrjx0wQGwThp
	 ADAnWl8FKjClco8FlAhVvB/4igSIPsUKQu19d131UIC6PYt4CoRwgt1C2dVp1BeKTP
	 k2/ysxg5y7Ipk2UFiK4OULG4+Ob51pagoGyvDg4raVrUDAc750TWPtM8nmJ++0gkfm
	 DxosX+G492Vi3FPtsmCekLGKEqa/K/2jItuYbfSfbwWkIekMeB+/6/hc9g6H0ivzD2
	 7X2x3XbeXo/kg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 05/12] kconfig: change sym_choice_default() to take the choice menu
Date: Tue, 18 Jun 2024 19:35:24 +0900
Message-ID: <20240618103541.3508486-6-masahiroy@kernel.org>
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

Change the argument of sym_choice_default() to ease further cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/confdata.c | 2 +-
 scripts/kconfig/lkc.h      | 2 +-
 scripts/kconfig/symbol.c   | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 4359fbc9255b..76193ce5a792 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -779,7 +779,7 @@ int conf_write_defconfig(const char *filename)
 		if (choice) {
 			struct symbol *ds;
 
-			ds = sym_choice_default(choice->sym);
+			ds = sym_choice_default(choice);
 			if (sym == ds && sym_get_tristate_value(sym) == yes)
 				continue;
 		}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index d820272a85fb..586a5e11f51e 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -109,7 +109,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help);
 
 /* symbol.c */
 void sym_clear_all_valid(void);
-struct symbol *sym_choice_default(struct symbol *sym);
+struct symbol *sym_choice_default(struct menu *choice);
 struct symbol *sym_calc_choice(struct menu *choice);
 struct property *sym_get_range_prop(struct symbol *sym);
 const char *sym_get_string_default(struct symbol *sym);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 344a241e1e94..3d68ab8e1eb4 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -255,14 +255,14 @@ static void sym_calc_visibility(struct symbol *sym)
  * Next locate the first visible choice value
  * Return NULL if none was found
  */
-struct symbol *sym_choice_default(struct symbol *sym)
+struct symbol *sym_choice_default(struct menu *choice)
 {
 	struct symbol *def_sym;
 	struct property *prop;
 	struct expr *e;
 
 	/* any of the defaults visible? */
-	for_all_defaults(sym, prop) {
+	for_all_defaults(choice->sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
 		if (prop->visible.tri == no)
 			continue;
@@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct symbol *sym)
 	}
 
 	/* just get the first visible value */
-	prop = sym_get_choice_prop(sym);
+	prop = sym_get_choice_prop(choice->sym);
 	expr_list_for_each_sym(prop->expr, e, def_sym)
 		if (def_sym->visible != no)
 			return def_sym;
@@ -312,7 +312,7 @@ struct symbol *sym_calc_choice(struct menu *choice)
 	 * explicitly set to 'n'.
 	 */
 	if (!res) {
-		res = sym_choice_default(choice->sym);
+		res = sym_choice_default(choice);
 		if (res && sym_has_value(res) && res->def[S_DEF_USER].tri == no)
 			res = NULL;
 	}
-- 
2.43.0


