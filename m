Return-Path: <linux-kbuild+bounces-2076-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144F9042F0
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16FE41F22736
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22961534FC;
	Tue, 11 Jun 2024 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cY0QvwRU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA121534EB;
	Tue, 11 Jun 2024 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128575; cv=none; b=r6223VqcHqNJRBt2dG5+xYuwQn5BWHyQSqrlKpHBZ8DYFe931usB3IQFUUEFK844xFx21UM7Gb6MaLvXMimcayqFJIC3HcYB3DKifPN3EAhTIUYwjAiClpbPOpk00mxAQFcw64q4DXDbdN4dPjfOhqT/FlHNvwcKE7piutlYhvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128575; c=relaxed/simple;
	bh=qpviQ1ERfH+WJ2ZfrRjot8me/WrXcMTZ24tdvkIstK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mw06u3jrlTFvoA4WQf+/LGNiw6kKzRvKuGoVhX5bmPKW13yelLVbp8aVwZiHzc06PbjLR4RRfa/NhtqleOeEF8UTp1a83pYSJ2dEOKumKi4skuQbF8lGU+r345ua0II00kA4cI3ZO0nSAkHIjtBSJ4LUcQEZqCTwJgJ+3st9vV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cY0QvwRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E54C32786;
	Tue, 11 Jun 2024 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128575;
	bh=qpviQ1ERfH+WJ2ZfrRjot8me/WrXcMTZ24tdvkIstK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cY0QvwRU3froZ6qec0HZ+AAWgrCD78FR1O0r/TAlSKq5PP4aqN18MV6lbqH3n4SUC
	 IUFVx1FyM5p8MjTpLXDO85hEt43YygAkOWskUvuYLLWjKmm7xb56vezP66SiBMLDAC
	 AkGdlB9rE9H4HOO+RRJGYnEgIt37SJiz17BMLCPTsuWjWAj7BtM/XAmTojFyTnALAD
	 h0Slh0TNl9RCt4buh5J0ax9kELMxisrqCz/5ULYenC3FfYUbDliIt0WEiXYy6nNyBY
	 qRJv/wYYe8PxXFCumpOVh8YtquKTXD/xRE8jy58/ICqHWQKCnFOHlNPYHfAG3jl8Ps
	 9JilaLOB4BD0A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 12/16] kconfig: use sym_get_choice_menu() in sym_check_print_recursive()
Date: Wed, 12 Jun 2024 02:55:21 +0900
Message-ID: <20240611175536.3518179-13-masahiroy@kernel.org>
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

 scripts/kconfig/symbol.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 32b38724c960..86358cfb39cc 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1068,12 +1068,14 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 	struct dep_stack *stack;
 	struct symbol *sym, *next_sym;
 	struct menu *menu = NULL;
+	struct menu *choice;
 	struct property *prop;
 	struct dep_stack cv_stack;
 
-	if (sym_is_choice_value(last_sym)) {
+	choice = sym_get_choice_menu(last_sym);
+	if (choice) {
 		dep_stack_insert(&cv_stack, last_sym);
-		last_sym = prop_get_symbol(sym_get_choice_prop(last_sym));
+		last_sym = choice->sym;
 	}
 
 	for (stack = check_top; stack != NULL; stack = stack->prev)
-- 
2.43.0


