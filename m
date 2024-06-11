Return-Path: <linux-kbuild+bounces-2077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094E9042F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC05BB2568D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBE8153838;
	Tue, 11 Jun 2024 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMoWwTeb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DDA153584;
	Tue, 11 Jun 2024 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128576; cv=none; b=XWYKADaMqChMZ1TNZrX5N0s82WxZGcITHWa+JD2SiWd9QBC+ZbiqX2dtXC9cEzAtPl5uFSdL9JlR/4pzloDyoi4dgQdb6CLSP7EQIDQnSCFBqpfKmnRiJDIkNb4JmNhwjhI9uTS+7EIia2NMchdsAXNBFbTGNS8nw1Ju8x+B3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128576; c=relaxed/simple;
	bh=xG26G4d1ul6MF7ShnOaqRAWp7QAAzxRQqAxuii9Pltw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0qDhehKwZX8EjN1NbWT7CQIqAr/9dVvnx/UoNDRqEIIBwl5OJHxNfRPwKl2QWDxvhKI58w0Io4upUewRuR3XiV3QgiIMUtSeck8ZPI1F3R1ecVFehB91hgz5s8fR4oL2DUohqzSv/T1ixv4k9i4He23eSNDsQbb629evDN/5Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMoWwTeb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960E9C4AF1C;
	Tue, 11 Jun 2024 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128576;
	bh=xG26G4d1ul6MF7ShnOaqRAWp7QAAzxRQqAxuii9Pltw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aMoWwTeb0fHLJPPNZxY3+GUVRYrm/ZHNzjGcwm/OpfYFgHJAQEYFzsKbpezy6Wrl5
	 btPkmY7b5XRrlDDJ/Idrn+so71auRfTVUzQfx+xCdnJqR3pgIok62dEIVTGY/GkjO8
	 Okqc3JcMAnblS9C4qEYoHvot66PTzOCf7OsYNECBUruWL4luKJCkf/plVCwIA9acew
	 t6tKqbcfNbUBdut6pujHJNjnB7uwHIDcOjnDzOQxo36Z9qxNokkIMz9fOAbkyxAX3N
	 vf7GVEG1l4wGnt+WCJQCoANXFcwAgG6jDXVcdhd7hDcrso12F88fW8chY9nE90BI4o
	 R+P9X3aKfWA6w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 13/16] kconfig: use sym_get_choice_menu() in sym_check_choice_deps()
Date: Wed, 12 Jun 2024 02:55:22 +0900
Message-ID: <20240611175536.3518179-14-masahiroy@kernel.org>
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

Choices and their members are associated via the P_CHOICE property.

Currently, prop_get_symbol(sym_get_choice_prop()) is used to obtain
the choice of the given choice member.

Replace it with sym_get_choice_menu(), which retrieves the choice
without relying on P_CHOICE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 86358cfb39cc..d30d70b43656 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1270,9 +1270,13 @@ static struct symbol *sym_check_choice_deps(struct symbol *choice)
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


