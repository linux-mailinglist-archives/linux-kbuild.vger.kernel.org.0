Return-Path: <linux-kbuild+bounces-1968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A78D7178
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 20:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C5AD2821ED
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E11208D4;
	Sat,  1 Jun 2024 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxyaOpfl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0C1171D;
	Sat,  1 Jun 2024 18:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717266050; cv=none; b=KdgedI6G4cubygOkEV0L8EjUwU4HNYUXw1V/2lY3o3A9y0lcb1ZPNTp30moejB4Jl+zusBjwhUmDp6FUqfEA3Pk+9BOPxOYab2eClq1z7WEzcjDjqltnPffkMOkQuz5uzTwPyqHdueFkBsrZvsT0MIqgaKJfw3eR86XTnStK5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717266050; c=relaxed/simple;
	bh=BuND9162WRwUGkN0x/0r2+6kLEtp01n8cDxLZ4FYcdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pnMuFJWQ1oymwrwq23gVdziTmAm0dHfVXNln8EU749VRgXoMZddtRwnx9DdLRmXbgKQTapyoS5VX1S/WzXfCwAE8tayq9L75DrtOmJx0X7S/9KTs9XN+pgO3PAh7SLtrN30aLmWW6+0dia18mevjwrzBOvCQ24pf+m+c5C7jJ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxyaOpfl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D491C116B1;
	Sat,  1 Jun 2024 18:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717266049;
	bh=BuND9162WRwUGkN0x/0r2+6kLEtp01n8cDxLZ4FYcdU=;
	h=From:To:Cc:Subject:Date:From;
	b=CxyaOpfldcpC2z5qicSfy4up96V4iORtuHmZqeCW+Dcbou/W6zQG/wSwpBi6WHoJW
	 Ree8Am9nxvp8m9/E7VVtWnt4sdv8b1Sg0J2ENeMoFjdUY/xG8I3sewZ/sIgvL0K/Am
	 HUfPx4lhuYj+XGd5dhsDOW49oTe5my9EOHNjRM4u96zjF+PO1mmpQoHhW54JCB1crt
	 FxC1of9X20TGhUtGSD32K9g9PFKNpoKvKXyITlhivN5c9e/CQ71Xwo9okLQ/mBP84m
	 EVd+KVDJY+ZnDdm5HKVySia0xkO0BoifYq1sxnhydhmY+1RZAqFvPTlhbGIu6/LTgW
	 o+pLlum+QQUug==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/6] kconfig: remove unneeded code for user-supplied values being out of range
Date: Sun,  2 Jun 2024 03:20:38 +0900
Message-Id: <20240601182043.876249-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a leftover from commit ce1fc9345a59 ("kconfig: do not clear
SYMBOL_DEF_USER when the value is out of range").

This code is now redundant because if a user-supplied value is out
of range, the value adjusted by sym_validate_range() differs, and
conf_unsaved has already been incremented a few lines above.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 387503daf0f7..85b53069ba7a 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -533,19 +533,6 @@ int conf_read(const char *name)
 			 */
 			if (sym->visible == no && !conf_unsaved)
 				sym->flags &= ~SYMBOL_DEF_USER;
-			switch (sym->type) {
-			case S_STRING:
-			case S_INT:
-			case S_HEX:
-				/* Reset a string value if it's out of range */
-				if (sym_string_within_range(sym, sym->def[S_DEF_USER].val))
-					break;
-				sym->flags &= ~SYMBOL_VALID;
-				conf_unsaved++;
-				break;
-			default:
-				break;
-			}
 		}
 	}
 
-- 
2.40.1


