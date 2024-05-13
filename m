Return-Path: <linux-kbuild+bounces-1848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A08C4A1D
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 May 2024 01:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672F41F21A5C
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 23:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5443585938;
	Mon, 13 May 2024 23:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOZr0mVY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D63A85622;
	Mon, 13 May 2024 23:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715643107; cv=none; b=k+n1rYu0wEWWW6ZIi2qxPd5++LQ8lgWJottgCHOA+N4G/5f0oPmzq7APqJTZBd0Tr4u15vmuhbCLqOhWO80d4PY2qBREN+ICuHwxXuOUBpNvun8HHzpRny6oEE8Z5pQky3ZgYG//dBQqjUxldKSsH7w9iFkkxZpg3tyFdjYdVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715643107; c=relaxed/simple;
	bh=8aCK+9otNEWX8teUIuXuFTHKu5bAZsokXv23+TwPN/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pDxWKBdz+Wc9y+XrmVlGU3HU8CueZqTzMxWixMB1ptdvk2Wfv2d4F1sF58PeEyZt71tNTW9xIbSaRK5YpT+sgNgsfZAxMZuP1473QtlKMvgdmtICxtdPqyDcSbzl81b8WDN9WgfOYuQpkr724OZDmsk4ro4IONaCVAczE2wWa8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOZr0mVY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D9EC113CC;
	Mon, 13 May 2024 23:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715643107;
	bh=8aCK+9otNEWX8teUIuXuFTHKu5bAZsokXv23+TwPN/E=;
	h=From:To:Cc:Subject:Date:From;
	b=eOZr0mVYNyHiTSvYNAsECBCdwV4kuWKj3Or8DhPSPVAPcULSJxHrJqQj50ZPtjNkb
	 0HsVTsONC2EYsB4+FpNA5FEjjnY/c8PjaWDbYSoOhxxUMotK4hlIu9tcSN+VE6QHwd
	 XkQa/FsURRh7Wwq0IL0Fps1liEi+LVyB8dVCNFi7N5fBIy9CXtb+mqzw0TJRDZ0mdN
	 OuKh9Il+9EXFKq5v8yLXUIy2wAGQcFZA6vaR2NDLRvmVKh9nqNL1w1XIMSNp/SaHsQ
	 XQ2kjgdqzEqqfjPxVJCXZlhhb8HD0eCQmp7LroU+nGc8sbuzWXggNr/Gh+Tnl5iq8q
	 x/sWxe7+vF8HQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: use sym_get_choice_menu() in sym_check_prop()
Date: Tue, 14 May 2024 08:31:42 +0900
Message-Id: <20240513233142.458372-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
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

 scripts/kconfig/menu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index bee96c9964fd..53151c5a6028 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -263,11 +263,9 @@ static void sym_check_prop(struct symbol *sym)
 					    sym->name);
 			}
 			if (sym_is_choice(sym)) {
-				struct property *choice_prop =
-					sym_get_choice_prop(sym2);
+				struct menu *choice = sym_get_choice_menu(sym2);
 
-				if (!choice_prop ||
-				    prop_get_symbol(choice_prop) != sym)
+				if (!choice || choice->sym != sym)
 					prop_warn(prop,
 						  "choice default symbol '%s' is not contained in the choice",
 						  sym2->name);
-- 
2.40.1


