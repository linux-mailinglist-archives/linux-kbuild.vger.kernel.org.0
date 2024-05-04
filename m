Return-Path: <linux-kbuild+bounces-1761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D86278BBDAF
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147CC1C20CE9
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C14684DF3;
	Sat,  4 May 2024 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am59WeL8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E1384DEC;
	Sat,  4 May 2024 18:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847653; cv=none; b=WzgpLagiwKdNGbqrc8c/bZRhLPa6KIDw27Qfne31MTAsdx/2aXKa4LboAI1rQHGlPEF4d5DOtyq+7qJ3UYSj5AVdoAqw2xX1zFsybNj8DxeuxoQswEOX1gjCXefqv8HL14qeYcRJgwAq/AspNBnNb6uIG5oZ0sUrf5SYwCCg4SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847653; c=relaxed/simple;
	bh=Nq8nXPC8Rz0nAfIq0jS+qR4DEI3gHUkggdiRm+SnbmE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SUk/kVI4FF+i6tE46OFe4mniph11/Yij8VnuNAm62RBWGgY2B8gtISuCUe2XwoXHGxh3fhVgfqnkBnwSOdE277epRU3w/iNf7CQ3K4dRRaTePp9ucfSPgbsEKSJfwgS1SZ6MLQs4lcntNvuWED/hMsdT8Ew/UQqNooS4ZMddjo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am59WeL8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC98C4AF1B;
	Sat,  4 May 2024 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847652;
	bh=Nq8nXPC8Rz0nAfIq0jS+qR4DEI3gHUkggdiRm+SnbmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Am59WeL8b0uHj1MyH9pYdvZ8bAKUMqtcxwpzimWapUZd5k7MhUrW+kcjc7DGfT00N
	 mw7v1WAhF47/fvpzWb/nb4zfQvIyNlA3QqTS0S6Rqew5y2R564sIbI8QPrqZnFmjgd
	 UedkwJDKdirR6zOBIOtDQwrYGc3R1ayu7hi3N23LN1IJQO8KnYWJixz9Vw77uk234k
	 txRoJA7O7nBpSdJLOPpxDUXYYkmwIp5l5X2n2KrFnOu1iQ3L86SldsArpaXO/t8Dca
	 SbXrCVisuOy1rE6ADYmz2ECuEXKAY9VKu9tW31XB1KI4Td4vGThvl4xT2OJmqwLhq9
	 3kb4uk+83cUFg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/10] kconfig: used linked list in sym_set_changed()
Date: Sun,  5 May 2024 03:33:27 +0900
Message-Id: <20240504183333.2031860-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504183333.2031860-1-masahiroy@kernel.org>
References: <20240504183333.2031860-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the approach employed in commit bedf92362317 ("kconfig: use
linked list in get_symbol_str() to iterate over menus"), simplify the
iteration on the menus of the specified symbol.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index b909c64f3bac..8512c29c84bb 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -152,13 +152,11 @@ static void sym_validate_range(struct symbol *sym)
 
 static void sym_set_changed(struct symbol *sym)
 {
-	struct property *prop;
+	struct menu *menu;
 
 	sym->flags |= SYMBOL_CHANGED;
-	for (prop = sym->prop; prop; prop = prop->next) {
-		if (prop->menu)
-			prop->menu->flags |= MENU_CHANGED;
-	}
+	list_for_each_entry(menu, &sym->menus, link)
+		menu->flags |= MENU_CHANGED;
 }
 
 static void sym_set_all_changed(void)
-- 
2.40.1


