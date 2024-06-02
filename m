Return-Path: <linux-kbuild+bounces-1977-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C18D7576
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 14:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14AA81F223EF
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Jun 2024 12:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47723D551;
	Sun,  2 Jun 2024 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBlomwSg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E13DBBF;
	Sun,  2 Jun 2024 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717332867; cv=none; b=CZxmk9exZmgo2VGWvG8UI3d3bKC93wE0gmpxtIzRquDok+jPMFZmyoIZJft8UKv0E5gtjlcgu5pEzxNpXTUS/2NuJ507qHmxt0C4LYcuf959+0iGEP3cYjns0yb9K1G555f7ppiARMJJ3KokwOWWQdqMs/1x+2LGGwYG1OGfoFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717332867; c=relaxed/simple;
	bh=UPF+rTM68XnLpCea7WoA/GMqSo6CeLlyZ02RZ4r0zac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lXuJk3ikDqMqq6rJW/EP3YiURQnyR3G8K2jQ0XH2MdtXCOfLLBGzcjYuLOd0BH2+GUcRVrfWPdkP2G07SX3VgimR3aKslHfbSQ5s6HFT9x/Ac6QU818/nxCFbvGeI2fmf4IV3caHzcxsIL3nW+HnHGYR8pZJcZDdsGWzDQvkY9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBlomwSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A708AC4AF0A;
	Sun,  2 Jun 2024 12:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717332867;
	bh=UPF+rTM68XnLpCea7WoA/GMqSo6CeLlyZ02RZ4r0zac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QBlomwSguqYcinAwop9pB9hUmtgoAkonroAhYBEAPS6PgSDsoS7gLuU/t9pkReNLi
	 sVzdCZe09vnVN4vS715Srp+RZJN72Ikoi/SkqeGziROhnN0tBSCJ0IpRid80QjZ5G0
	 pRoXZL7TE3JF0eWSVatt73qObCTMcDnzLe48TEBzAweRwSGzXGUCYSKRGPYnYTx/rJ
	 9DhrrQGgwy1uOLHKYpTX6F1WhIjVw3mMWnM9L+n3ti4ACkvxMEMJLK1/8wcmV4a7g0
	 xapAP5Vb/91MjelH/xgapwsGFjOtksA6htpew0THyWN+KJcN1OsuXUV8RnURl1nIlV
	 jHQFtz0kniQ9Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kconfig: refactor conf_write_defconfig() to reduce indentation level
Date: Sun,  2 Jun 2024 21:54:16 +0900
Message-Id: <20240602125416.976336-3-masahiroy@kernel.org>
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

Reduce the indentation level by continue'ing the loop earlier
if (!sym || sym_is_choice(sym)).

No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 47 ++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 25c327ae3c5c..1ac7fc9ad756 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -774,34 +774,31 @@ int conf_write_defconfig(const char *filename)
 		struct menu *choice;
 
 		sym = menu->sym;
-		if (sym && !sym_is_choice(sym)) {
-			sym_calc_value(sym);
-			if (!(sym->flags & SYMBOL_WRITE))
-				continue;
-			sym->flags &= ~SYMBOL_WRITE;
-			/* If we cannot change the symbol - skip */
-			if (!sym_is_changeable(sym))
-				continue;
-			/* If symbol equals to default value - skip */
-			if (strcmp(sym_get_string_value(sym), sym_get_string_default(sym)) == 0)
-				continue;
 
-			/*
-			 * If symbol is a choice value and equals to the
-			 * default for a choice - skip.
-			 */
-			choice = sym_get_choice_menu(sym);
-			if (choice) {
-				struct symbol *ds;
+		if (!sym || sym_is_choice(sym))
+			continue;
 
-				ds = sym_choice_default(choice->sym);
-				if (sym == ds) {
-					if (sym_get_tristate_value(sym) == yes)
-						continue;
-				}
-			}
-			print_symbol_for_dotconfig(out, sym);
+		sym_calc_value(sym);
+		if (!(sym->flags & SYMBOL_WRITE))
+			continue;
+		sym->flags &= ~SYMBOL_WRITE;
+		/* Skip unchangeable symbols */
+		if (!sym_is_changeable(sym))
+			continue;
+		/* Skip symbols that are equal to the default */
+		if (!strcmp(sym_get_string_value(sym), sym_get_string_default(sym)))
+			continue;
+
+		/* Skip choice values that are equal to the default */
+		choice = sym_get_choice_menu(sym);
+		if (choice) {
+			struct symbol *ds;
+
+			ds = sym_choice_default(choice->sym);
+			if (sym == ds && sym_get_tristate_value(sym) == yes)
+				continue;
 		}
+		print_symbol_for_dotconfig(out, sym);
 	}
 	fclose(out);
 	return 0;
-- 
2.40.1


