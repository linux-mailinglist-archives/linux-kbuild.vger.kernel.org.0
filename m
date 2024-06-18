Return-Path: <linux-kbuild+bounces-2181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6832890C98D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8240D2840D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776101607A0;
	Tue, 18 Jun 2024 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ma7tieZ5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D6F160794;
	Tue, 18 Jun 2024 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706955; cv=none; b=I9YgpLP2eyCrNCvXAcJTzYXulhnBERMKbkr//Dlss29Px2bqU6wU4L+vHQGJN3YqEZFKi/4Pj1FqPoEMTOzceIPF827vbrvbAkKla39L3Y1fgufc5G/eDFbOvPjQYa3+qNY3MKAfPp6lvHsaVa0XJbN1MMX0Z1avgdmDMYRFji8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706955; c=relaxed/simple;
	bh=xqAZ1RL0F/hPdqwRl9UQxAnKkiryZIJ50fRy3kNV7Is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7PqmodVTWN5mtsu4WXXFmI1Co0zxJ5NT56FVOiuyWgA77shURnhmklEPCTIXUoiIwPq2cVjeJ6xmUojlS18tR05fr2+CDj4BmVVi4xTTEXtsh+iVVyvlJ5lg1NdWPSNTOQufOYFJ9kynfqavM4T3YaKUCdAtpOnugIeg+G8qN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ma7tieZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A6FC4AF1A;
	Tue, 18 Jun 2024 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706955;
	bh=xqAZ1RL0F/hPdqwRl9UQxAnKkiryZIJ50fRy3kNV7Is=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ma7tieZ5JzEfgkD/cGBZJWKG0tIhfYA6hTrtIodLz+Xgun85Ub0yITnQUMCyb5YZW
	 XFYmeVRxcDWPTef7Oyd1/NupF+SOUnnS2VPzrYwudg69wRXMcXGdj0aA1/KZY73gt3
	 yCXf23XR4lt6+Zo6IbWx43BxCxGLT9XYE5+InIZjIw98lQBqxzh99vaW2Bd4XgkyLB
	 2G5h+bbJ42rqaHREID8erTyHcqoJGWN4ql/JRGQRUQGYpNPfCDv93JIVHBVqf4UtnQ
	 tHrWHWiQnGbMQnNgREPOAz3ochyP2c70skGn49xmKXjckn1vyMQunGBvNl9BJhg1j2
	 EY7zzCH0Klsew==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 06/12] kconfig: use menu_list_for_each_sym() in sym_choice_default()
Date: Tue, 18 Jun 2024 19:35:25 +0900
Message-ID: <20240618103541.3508486-7-masahiroy@kernel.org>
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

Choices and their members are associated via the P_CHOICE property.

Currently, sym_get_choice_prop() and expr_list_for_each_sym() are
used to iterate on choice members.

Replace them with menu_for_each_sub_entry(), which achieves the same
without relying on P_CHOICE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/symbol.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 3d68ab8e1eb4..56e7a76e7a77 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -257,9 +257,9 @@ static void sym_calc_visibility(struct symbol *sym)
  */
 struct symbol *sym_choice_default(struct menu *choice)
 {
+	struct menu *menu;
 	struct symbol *def_sym;
 	struct property *prop;
-	struct expr *e;
 
 	/* any of the defaults visible? */
 	for_all_defaults(choice->sym, prop) {
@@ -272,10 +272,9 @@ struct symbol *sym_choice_default(struct menu *choice)
 	}
 
 	/* just get the first visible value */
-	prop = sym_get_choice_prop(choice->sym);
-	expr_list_for_each_sym(prop->expr, e, def_sym)
-		if (def_sym->visible != no)
-			return def_sym;
+	menu_for_each_sub_entry(menu, choice)
+		if (menu->sym && menu->sym->visible != no)
+			return menu->sym;
 
 	/* failed to locate any defaults */
 	return NULL;
-- 
2.43.0


