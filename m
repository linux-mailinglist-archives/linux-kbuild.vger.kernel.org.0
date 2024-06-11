Return-Path: <linux-kbuild+bounces-2073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCBB9042EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14D67286BB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44C7140E30;
	Tue, 11 Jun 2024 17:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMtRScR+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B865313D2B2;
	Tue, 11 Jun 2024 17:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128571; cv=none; b=WwTdjSn4J87Wr4+Duq/VC05ofp/9hYNg/m3dLN8MwwFVOX1bGEY5YQE5rY3g2SWL+7iIO2RrCLv9kDYz7iXck5RTPsRigtidISAQtcsVudHPETCrGJzGOSyfk+MIvtmzk/xghuSrFCCu8ufR6Mj+O017xHE6lTW6ypdHr3TZMBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128571; c=relaxed/simple;
	bh=+/lE6+H5ABqs4SlKsAZy4Du0516Zahbwztxm4gigQf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIA1POxKptwrfQiZ8izZirLXWhxrtXqfgRAU7cCOQeFHhSgVp4TAqbc+J5Rg4649h+Cx6PCuFsjEEoaRM/zLDmfz4dB5wnjc5xcw3ATRLBRzexCRVdJv73GVOeiWxjOgV2nMbndc9ZS3paV5E443etLnyRyRiHvwzrwWVEEtsOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMtRScR+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65AFC4AF48;
	Tue, 11 Jun 2024 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128571;
	bh=+/lE6+H5ABqs4SlKsAZy4Du0516Zahbwztxm4gigQf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMtRScR+8VyEbauMWoAq2hIGK3K34VVmzRlq04OffhN5gfrz4+ILW4zoxgvXMNxYZ
	 zpW0I2CdLX+v/35a3o9ZOIjWFsKLeR7ZvMHfzoticck8nxqzV6ARvS36mn+WUpZ4bz
	 xTVx/UgOrlpgCFwlVIDC9WvPwH533VNRNb10B6AVFlJRKvStd/wvpFghG1djmOLvOf
	 TFv5qoEnZyWYe4du04ZGtqHAoKOpm+z/Dd/FXPrIxbuX5D1yQIylHAjTNORH/m3GRX
	 hxO4HEAwV+ym6bXuzI9K8kupk459+r12izcbgmUpiZu0Gz4FG3j64VnFsUgMGFhUEY
	 IZPknyhbEcOXg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/16] kconfig: change sym_choice_default() to take the choice menu
Date: Wed, 12 Jun 2024 02:55:18 +0900
Message-ID: <20240611175536.3518179-10-masahiroy@kernel.org>
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

Change the argument of sym_choice_default() to ease further cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

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
index b2fdae15f367..32c80a29dcd4 100644
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
@@ -309,7 +309,7 @@ struct symbol *sym_calc_choice(struct menu *choice)
 
 	/* If 'y' is not found in the user input, try the default */
 	if (!res) {
-		res = sym_choice_default(choice->sym);
+		res = sym_choice_default(choice);
 		if (res && sym_has_value(res) && res->def[S_DEF_USER].tri == no)
 			res = NULL;
 	}
-- 
2.43.0


