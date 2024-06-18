Return-Path: <linux-kbuild+bounces-2184-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D690C992
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 197E128728B
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60899168483;
	Tue, 18 Jun 2024 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfK1tZLW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350B116631F;
	Tue, 18 Jun 2024 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706959; cv=none; b=oXKVJxI95+cn4Z8kK72fTUdEe7CadrVbK9fpXF7XVH0niMcPEEDJqZpzeLu6thWVp0UGC/po9VBF/D2rYyDxykG2oHcYFYL03bQSVykhBnutaFD3emMcDwfowNO7B+orlubLBRiOSI2m9j4NE/98U+OlmZfno2CSMclC4bqzJbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706959; c=relaxed/simple;
	bh=KMKjpRrUMrhHnBtEg/qi4ptkiP8z74lL1tK2it7gnEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hakmTuXm/3UDKxiXdTDUdldIuGN3kRk/V2vxu0gVr3ndhrxAZsZkF6lVWif/Uq5+x+0fS0WcnSiVsBo/qTp1NETksQP1485YdlrlQpesOvthsmVKi4AGL75CQTalf/fUl/B/pbdG5GGXMpXfYRBrKyaUHTSaO3nZSMQfv5j3bNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfK1tZLW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A386C4AF49;
	Tue, 18 Jun 2024 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706959;
	bh=KMKjpRrUMrhHnBtEg/qi4ptkiP8z74lL1tK2it7gnEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfK1tZLW2mWz808ex1tUpW0puKR5glfC/GUg3XP0qtOpQTEKKIgN1CvaGIgm7VRyo
	 XUNntXyQqVSGrDZF8bMas0ArxtU/v5BoNzcKMSh55UxvtUyrnBKSWI1Me3DzoUb7nw
	 Ct0DULlaXkdY24Q6a0WMQLocpg2zvaGK1Dn95HC8mhj3NPyHBmDO3wwijB7tFQyBgT
	 6pJu1YMpijFDFeJnUAFrIt9XuizOUZoJtMHLe/9YpF3Aa6ZoE149/Pm3Tsvtpq/B23
	 J4qMJFB47QokGStiVtrQRblJA1xpvdbR1qBtF3aFJuusq5eHQx+WF7czHELwtaorcJ
	 jiLgIK7SCMM0w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 09/12] kconfig: use sym_get_choice_menu() in sym_check_choice_deps()
Date: Tue, 18 Jun 2024 19:35:28 +0900
Message-ID: <20240618103541.3508486-10-masahiroy@kernel.org>
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

Currently, prop_get_symbol(sym_get_choice_prop()) is used to obtain
the choice of the given choice member.

Replace it with sym_get_choice_menu(), which retrieves the choice
without relying on P_CHOICE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/symbol.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 79f1b5e1cc9e..22c15a103371 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1280,9 +1280,13 @@ static struct symbol *sym_check_choice_deps(struct symbol *choice)
 		if (menu->sym)
 			menu->sym->flags &= ~SYMBOL_CHECK;
 
-	if (sym2 && sym_is_choice_value(sym2) &&
-	    prop_get_symbol(sym_get_choice_prop(sym2)) == choice)
-		sym2 = choice;
+	if (sym2) {
+		struct menu *choice_menu2;
+
+		choice_menu2 = sym_get_choice_menu(sym2);
+		if (choice_menu2 == choice_menu)
+			sym2 = choice;
+	}
 
 	dep_stack_remove();
 
-- 
2.43.0


