Return-Path: <linux-kbuild+bounces-2183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D98390CA17
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A733B22916
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436641662FA;
	Tue, 18 Jun 2024 10:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M23BDdK2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCE41662F4;
	Tue, 18 Jun 2024 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706958; cv=none; b=XlqIOgca992XGee9LSI2SRgU766DvL9FJvCGGDotjoKu9v2gUy7oD5l/vf9k6oCFZE4xxm4C8VuJP4dZhyz5VeLKGcJhFQEnFmJX00IMjVMxRwy1grR+sjrTMEHR+86j/34P0MU4SOYItmPlMYh1WrTLBY8czpioJOVYAQ0q7BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706958; c=relaxed/simple;
	bh=ZWLDCB3utaQsaEy2c+3V5CHbgpS/GzA+J8NQQ4Hivcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXN49HR5+IsIrskdWCsI9Bw4hqoM8PZKxNqSnfzgt2/IqJD4dDZN15eZxBVRaF1oE7CaFzMM3lVc8vRHpG7zrYgOWcpoRGMOSrLcyCaBLzaaPnvsGL/JljG5o8aHjnu3zZXNhs8wA80q2BHA2sgbOhSNiS8DRucl/vt12jIoLs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M23BDdK2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A0BC3277B;
	Tue, 18 Jun 2024 10:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706957;
	bh=ZWLDCB3utaQsaEy2c+3V5CHbgpS/GzA+J8NQQ4Hivcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M23BDdK2L1v7o1yDmuYHMITBga4i188ETamwZh0HmcC3RexT7ta2HDSxtY+zD6kdA
	 rvLgxg5C6/apKvQJF/EKbxbt22K5bImn9bGExjrQVfIvl/uQjQwScoNxcrZVbxNUJF
	 2EFUL4Oe5KHzPNS6DRDTU1jHW/DOb5lEPjbQNNqYTQmD5kSp4nrRjF9GvBcouSQ6Fr
	 xnBVm/jzU66r4jIgIFltKqs1WXkfihYQyPokOQJR6Syymq4BhHjkZTYwSPe7zqnUZH
	 kAsjpr+1wh4Q+WxMi+Exhe3YS5IyZVAJJ87lmq/lnBKFPzvC/FlMlAvAYetDJYIz63
	 KjoAHFz5Ni7fw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 08/12] kconfig: use sym_get_choice_menu() in sym_check_print_recursive()
Date: Tue, 18 Jun 2024 19:35:27 +0900
Message-ID: <20240618103541.3508486-9-masahiroy@kernel.org>
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

 scripts/kconfig/symbol.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 56e7a76e7a77..79f1b5e1cc9e 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1078,12 +1078,14 @@ static void sym_check_print_recursive(struct symbol *last_sym)
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


