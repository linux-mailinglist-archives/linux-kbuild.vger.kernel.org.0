Return-Path: <linux-kbuild+bounces-54-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C304E7EFE62
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 08:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3351C208EA
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 07:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4464F8B9;
	Sat, 18 Nov 2023 07:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RydCbEjN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2C323CA
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 07:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342B5C433C9;
	Sat, 18 Nov 2023 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700294358;
	bh=YxFaQuWjuJpS5NUYQ/dIR/BuE2+ge6XoKjKGeh3QdZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RydCbEjNwUvyzYgnPXpoQnsDGmvaPa+DqH6m/UGtiqzLQFwoJrZf7xfrMvZGXemYD
	 Bz79mX4w5aXFlxf1Y5x5RmvFwkfbE52Sk7sGpYhI03McpyvaF7yq/z1FX7+ciOU3Og
	 qACTu2uaSzjvPjyGPqG40OPkBVNiZAU7Ymkre/xaFOu6E70W3X03PkuAVEn2b58B3x
	 fE+0Bwd+tUFK0mfFJnSJgkyiJgpqhVNZtj7p/6MkwF0u2tZ4LP/8COrEspm3vCQHJ2
	 phJY39ZuMaH5l32Ra64ba4Hjo3cXPiYj1URfxSUkznp8MuNyZU+2oykoLHIlImL3Ix
	 H12/nymBeAr+w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/6] kconfig: deduplicate code in conf_read_simple()
Date: Sat, 18 Nov 2023 16:59:09 +0900
Message-Id: <20231118075912.1303509-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118075912.1303509-1-masahiroy@kernel.org>
References: <20231118075912.1303509-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig accepts both "# CONFIG_FOO is not set" and "CONFIG_FOO=n" as
a valid input, but conf_read_simple() duplicates similar code to handle
them. Factor out the common code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 89 +++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 54 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 92e8e37aca4d..b6a90f6baea1 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -342,11 +342,10 @@ int conf_read_simple(const char *name, int def)
 	FILE *in = NULL;
 	char   *line = NULL;
 	size_t  line_asize = 0;
-	char *p, *p2;
+	char *p, *p2, *val;
 	struct symbol *sym;
 	int i, def_flags;
-	const char *warn_unknown;
-	const char *werror;
+	const char *warn_unknown, *werror, *sym_name;
 
 	warn_unknown = getenv("KCONFIG_WARN_UNKNOWN_SYMBOLS");
 	werror = getenv("KCONFIG_WERROR");
@@ -424,77 +423,34 @@ int conf_read_simple(const char *name, int def)
 
 	while (compat_getline(&line, &line_asize, in) != -1) {
 		conf_lineno++;
-		sym = NULL;
 		if (line[0] == '#') {
 			if (line[1] != ' ')
 				continue;
-			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
+			p = line + 2;
+			if (memcmp(p, CONFIG_, strlen(CONFIG_)))
 				continue;
-			p = strchr(line + 2 + strlen(CONFIG_), ' ');
+			sym_name = p + strlen(CONFIG_);
+			p = strchr(sym_name, ' ');
 			if (!p)
 				continue;
 			*p++ = 0;
 			if (strncmp(p, "is not set", 10))
 				continue;
 
-			sym = sym_find(line + 2 + strlen(CONFIG_));
-			if (!sym) {
-				if (warn_unknown)
-					conf_warning("unknown symbol: %s",
-						     line + 2 + strlen(CONFIG_));
-
-				conf_set_changed(true);
-				continue;
-			}
-			if (sym->flags & def_flags) {
-				conf_warning("override: reassigning to symbol %s", sym->name);
-			}
-			switch (sym->type) {
-			case S_BOOLEAN:
-			case S_TRISTATE:
-				sym->def[def].tri = no;
-				sym->flags |= def_flags;
-				break;
-			default:
-				;
-			}
+			val = "n";
 		} else if (memcmp(line, CONFIG_, strlen(CONFIG_)) == 0) {
-			p = strchr(line + strlen(CONFIG_), '=');
+			sym_name = line + strlen(CONFIG_);
+			p = strchr(sym_name, '=');
 			if (!p)
 				continue;
 			*p++ = 0;
+			val = p;
 			p2 = strchr(p, '\n');
 			if (p2) {
 				*p2-- = 0;
 				if (*p2 == '\r')
 					*p2 = 0;
 			}
-
-			sym = sym_find(line + strlen(CONFIG_));
-			if (!sym) {
-				if (def == S_DEF_AUTO) {
-					/*
-					 * Reading from include/config/auto.conf
-					 * If CONFIG_FOO previously existed in
-					 * auto.conf but it is missing now,
-					 * include/config/FOO must be touched.
-					 */
-					conf_touch_dep(line + strlen(CONFIG_));
-				} else {
-					if (warn_unknown)
-						conf_warning("unknown symbol: %s",
-							     line + strlen(CONFIG_));
-
-					conf_set_changed(true);
-				}
-				continue;
-			}
-
-			if (sym->flags & def_flags) {
-				conf_warning("override: reassigning to symbol %s", sym->name);
-			}
-			if (conf_set_sym_val(sym, def, def_flags, p))
-				continue;
 		} else {
 			if (line[0] != '\r' && line[0] != '\n')
 				conf_warning("unexpected data: %.*s",
@@ -503,6 +459,31 @@ int conf_read_simple(const char *name, int def)
 			continue;
 		}
 
+		sym = sym_find(sym_name);
+		if (!sym) {
+			if (def == S_DEF_AUTO) {
+				/*
+				 * Reading from include/config/auto.conf.
+				 * If CONFIG_FOO previously existed in auto.conf
+				 * but it is missing now, include/config/FOO
+				 * must be touched.
+				 */
+				conf_touch_dep(sym_name);
+			} else {
+				if (warn_unknown)
+					conf_warning("unknown symbol: %s", sym_name);
+
+				conf_set_changed(true);
+			}
+			continue;
+		}
+
+		if (sym->flags & def_flags)
+			conf_warning("override: reassigning to symbol %s", sym->name);
+
+		if (conf_set_sym_val(sym, def, def_flags, val))
+			continue;
+
 		if (sym && sym_is_choice_value(sym)) {
 			struct symbol *cs = prop_get_symbol(sym_get_choice_prop(sym));
 			switch (sym->def[def].tri) {
-- 
2.40.1


