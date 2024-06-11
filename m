Return-Path: <linux-kbuild+bounces-2078-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 367639042F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2A531F2114D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61F615444E;
	Tue, 11 Jun 2024 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qI21hgpY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F34660BBE;
	Tue, 11 Jun 2024 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128577; cv=none; b=gwCBx0juCx+QdbCAAKCXDmnoM7Tm4MqqlbZ8e47EHlmU7lI1eKmvGczSDBUdZcHwqh3K/+pmLZ13ScAckVAuGEMfKyZ4sOMVKUYHLXRBOyCmsY1hAUrlatM+OtwuXn7givQQa2q8ea52N/T0NtgtRwAQmfaxZLV0c0VScvUvDxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128577; c=relaxed/simple;
	bh=0d/7irtLqvVKvQbLdv1BtkgLma4a6BUs9FbNciqSICc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grjyw0IXSrlNrWGwMDjnvKYhu6M6gnSny7FVPC94wstjkNmqmGWTb5olP1VaRaw/T8rUnf1HLYqh+c6qDGf5xxdHMFHbxdaZcmLyJxLeQpIeR2wgQFgp4eJd4Q/xLifeH6eZzoWW3ur6lTQstG9Z5D1nEPuTjdyZN5GMHGkjfAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qI21hgpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BBCC32786;
	Tue, 11 Jun 2024 17:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128577;
	bh=0d/7irtLqvVKvQbLdv1BtkgLma4a6BUs9FbNciqSICc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qI21hgpYKpiSVyYprF38vn68ympALpgB24t1NhRRP6n5Nx2T8EbNG7U0ampYYjC0+
	 Vz08Fr6M4r0GgmJL8TcJ175keXlVu43Jrw1pV36vv6PeMPY18xXwtnxzFu36I1QIoG
	 9mGDEaLa4w8L7+l1VxbvYScdUwF+4SRmWreuydp6p1Su8gXRchTg8jfxOY1rBJewLU
	 IaPiKJ2v4U30m9wF+353fRnJyUlR6RIlNwN66uKEt1dWk+g2A4zfhLeMpE8Cs9ivB/
	 8mneK7y5aJcazz8LCGfDAvLfs+WskG1/zQoLO+lR7QiRg/m+piaB2L8jENEZTWx5t9
	 P++RlMe4VzSjQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 14/16] kconfig: use sym_get_choice_menu() in sym_check_deps()
Date: Wed, 12 Jun 2024 02:55:23 +0900
Message-ID: <20240611175536.3518179-15-masahiroy@kernel.org>
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

 scripts/kconfig/symbol.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index d30d70b43656..3e91ecc35bc3 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1285,8 +1285,8 @@ static struct symbol *sym_check_choice_deps(struct symbol *choice)
 
 struct symbol *sym_check_deps(struct symbol *sym)
 {
+	struct menu *choice;
 	struct symbol *sym2;
-	struct property *prop;
 
 	if (sym->flags & SYMBOL_CHECK) {
 		sym_check_print_recursive(sym);
@@ -1295,13 +1295,13 @@ struct symbol *sym_check_deps(struct symbol *sym)
 	if (sym->flags & SYMBOL_CHECKED)
 		return NULL;
 
-	if (sym_is_choice_value(sym)) {
+	choice = sym_get_choice_menu(sym);
+	if (choice) {
 		struct dep_stack stack;
 
 		/* for choice groups start the check with main choice symbol */
 		dep_stack_insert(&stack, sym);
-		prop = sym_get_choice_prop(sym);
-		sym2 = sym_check_deps(prop_get_symbol(prop));
+		sym2 = sym_check_deps(choice->sym);
 		dep_stack_remove();
 	} else if (sym_is_choice(sym)) {
 		sym2 = sym_check_choice_deps(sym);
-- 
2.43.0


