Return-Path: <linux-kbuild+bounces-1976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4E08D7573
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 14:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036351C210D4
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 12:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AEE3C092;
	Sun,  2 Jun 2024 12:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+dqZw2h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801493BBFB;
	Sun,  2 Jun 2024 12:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717332866; cv=none; b=hDqnzCsAARMgwVWD/v4kMdYtNnER35PfpFzXR6UcY3rFxZRwP4RO5vOv1tinEDQP7sO+9tgOeR+SLD2G3yTiuwkiL2GqqlTsnzx5G3w0xl32sCd7H0hFv0c1OCWPbeZYUjhum7HhrWjAWUOAS88gPj8ioit/0/HW98iWmKMwPgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717332866; c=relaxed/simple;
	bh=jhtE2dYSDGcTkB1IPIYvXqLDX0YEkcCTRydIkDHQ7Ko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=izHbmMQKPeEUOu63P5fGiGQc2kDEAaULRtjG5e4cWKHrhvbiyMmizvBVGOK6e4y8aLGu64pNN5kKGZQvErR803Mm1GcrpLvbTYb5Uri/GQLxXtDd+qZMVLmdBfHwAlqJK/CVtJEeMiPZ84RaLN1ebhBYWOD2O7ydcLaDiThnBAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+dqZw2h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEF9C4AF08;
	Sun,  2 Jun 2024 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717332866;
	bh=jhtE2dYSDGcTkB1IPIYvXqLDX0YEkcCTRydIkDHQ7Ko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M+dqZw2hcg+sZ0bs2YbOGjgzhrMhWxueFdqTAmJsiAh0Z7mza4u2ekmsvtaY5ivcG
	 5pVjClZ3cYlhe83KpyAzwNMWdiz8WQAzmb4/Ak7LQjR+4k842ylnxhllxyT2Sjwk6P
	 hLUH8ZsiRyiub6uOvEio5OAOn79Db0OA1X6Ce3v+tu1RCKJUIYNuUVGcFyK9wGA0Kk
	 PmBJkPbPwSgRDK5df9k36yRhdYFsLYdsrJVUII+LlM0bSVMYlibfpZb/kf6m9b3szs
	 WVOwZXIXPPjWcJmdi/cCTRh3ENpcXwYG/dCvinN5hY5BrFrI6VM5tnbq94nK4jJok5
	 C05xcAE4NJEZA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kconfig: refactor conf_set_all_new_symbols() to reduce indentation level
Date: Sun,  2 Jun 2024 21:54:15 +0900
Message-Id: <20240602125416.976336-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240602125416.976336-1-masahiroy@kernel.org>
References: <20240602125416.976336-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The outer switch statement can be avoided by continue'ing earlier the
loop when the symbol type is neither S_BOOLEAN nor S_TRISTATE.

Remove it to reduce the indentation level by one. In addition, avoid
the repetition of sym->def[S_DEF_USER].tri.

No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 61 +++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 9a20e9e9bdad..cf8193fc00fc 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -218,43 +218,42 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
 	}
 
 	for_all_symbols(sym) {
-		if (sym_has_value(sym) || sym->flags & SYMBOL_VALID)
+		tristate val;
+
+		if (sym_has_value(sym) || sym->flags & SYMBOL_VALID ||
+		    (sym->type != S_BOOLEAN && sym->type != S_TRISTATE))
 			continue;
-		switch (sym_get_type(sym)) {
-		case S_BOOLEAN:
-		case S_TRISTATE:
-			has_changed = true;
-			switch (mode) {
-			case def_yes:
-				sym->def[S_DEF_USER].tri = yes;
-				break;
-			case def_mod:
-				sym->def[S_DEF_USER].tri = mod;
-				break;
-			case def_no:
-				sym->def[S_DEF_USER].tri = no;
-				break;
-			case def_random:
-				sym->def[S_DEF_USER].tri = no;
-				cnt = rand() % 100;
-				if (sym->type == S_TRISTATE) {
-					if (cnt < pty)
-						sym->def[S_DEF_USER].tri = yes;
-					else if (cnt < pty + ptm)
-						sym->def[S_DEF_USER].tri = mod;
-				} else if (cnt < pby)
-					sym->def[S_DEF_USER].tri = yes;
-				break;
-			default:
-				continue;
+
+		has_changed = true;
+		switch (mode) {
+		case def_yes:
+			val = yes;
+			break;
+		case def_mod:
+			val = mod;
+			break;
+		case def_no:
+			val = no;
+			break;
+		case def_random:
+			val = no;
+			cnt = rand() % 100;
+			if (sym->type == S_TRISTATE) {
+				if (cnt < pty)
+					val = yes;
+				else if (cnt < pty + ptm)
+					val = mod;
+			} else if (cnt < pby) {
+				val = yes;
 			}
-			if (!(sym_is_choice(sym) && mode == def_random))
-				sym->flags |= SYMBOL_DEF_USER;
 			break;
 		default:
-			break;
+			continue;
 		}
+		sym->def[S_DEF_USER].tri = val;
 
+		if (!(sym_is_choice(sym) && mode == def_random))
+			sym->flags |= SYMBOL_DEF_USER;
 	}
 
 	sym_clear_all_valid();
-- 
2.40.1


