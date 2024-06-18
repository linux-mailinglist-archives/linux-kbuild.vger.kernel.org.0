Return-Path: <linux-kbuild+bounces-2185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCE90C995
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3D901C20A6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C76D1684B3;
	Tue, 18 Jun 2024 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgQHWuzR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762EF1684AE;
	Tue, 18 Jun 2024 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706960; cv=none; b=knJ6IL/U31LUeDzC2xhGh21TYMOu7XqcsEA//go/m3I3pTjf0V08ni5kXEUwRdTWnoTPZa2F/QL7cWKriZqhIyTD1TzDKkChrZ4Q8WXHFXypdA35PVfRzdiKhN/HiEJr4ILeT+rKZ+/eRMPKNdcN0bbR00d7eEG6pV17zDkraF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706960; c=relaxed/simple;
	bh=EVFK8w87PnUqrfPFgXu/haExX3fSdvbdjb18w2A9iTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7vtojoOomfWLbh3AmDFQ21PP5IEc85tftABpXAilY2sASInAGHT9g8Uv33JSIKezLnXzS0fw14K7bNrkutqmrpLW6fdUzoVGnv1mnbp0L7u4fqiCv/rDXQH8Mp0khQQznbw9OzaQJtMjiXp6fYBnt/otpcV/YTqP7PWxOsTu0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgQHWuzR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895EDC3277B;
	Tue, 18 Jun 2024 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706960;
	bh=EVFK8w87PnUqrfPFgXu/haExX3fSdvbdjb18w2A9iTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OgQHWuzRHelqmepYO8Cm/O9P5IgBxvzb/TZaO05nLVZpfPRvcSKynPWv3cIlWPxzc
	 iRD2WB3hjUZyHI6rSfzTrYuxwvBi5qsj+QxHjYGV6lf5mFCQNR/4gSMScQsni9b1Kv
	 rsxZXW1Y5yQ5Qf3oIvFA/o+dktcO579VmoIfArJnCVyqf2jXq4XhWxxgqGDUkGwrMo
	 /kkjvh1QM3KJMELLfYvrGymlarQV5Iylj15Hx5D7MhJSB/e3UHf+TjU2dFn+yHanP/
	 aiEl1Yfx5HagbqlkJyivH5COiNpOxVjZjzVomjXqvJBT6vzdiRg7nQGolr6hHyTJ5C
	 6x1C+Zeax454w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 10/12] kconfig: use sym_get_choice_menu() in sym_check_deps()
Date: Tue, 18 Jun 2024 19:35:29 +0900
Message-ID: <20240618103541.3508486-11-masahiroy@kernel.org>
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

 scripts/kconfig/symbol.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 22c15a103371..b50911bcb08d 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1295,8 +1295,8 @@ static struct symbol *sym_check_choice_deps(struct symbol *choice)
 
 struct symbol *sym_check_deps(struct symbol *sym)
 {
+	struct menu *choice;
 	struct symbol *sym2;
-	struct property *prop;
 
 	if (sym->flags & SYMBOL_CHECK) {
 		sym_check_print_recursive(sym);
@@ -1305,13 +1305,13 @@ struct symbol *sym_check_deps(struct symbol *sym)
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


