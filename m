Return-Path: <linux-kbuild+bounces-2074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E29042EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15FAA1F238B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C84152189;
	Tue, 11 Jun 2024 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFawKK/t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A25615216C;
	Tue, 11 Jun 2024 17:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128573; cv=none; b=afo3YYCtGa8HB8NvA9L+yofZiBR/9Yw2V5iBSxP+JJ7hfGnaMmP4mPEQ0YIBmvPk4xMEa/XMRtuufgzqB9uJJ9xLT157Ke65BDf5P19HIyNGI/98sfrnr+pRJ/8QXqZsbek6MGvACDcuLF4c9b9DBUSdLn9O484kyOg9rzKKKzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128573; c=relaxed/simple;
	bh=fw7gwYH6PjjTv166bTFSFEw2m1wKgdODwKV9veoJHuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzcV5nl278qpy0ljIj0rP0ed6AU7Fr8uZkqk8TyeGDZZRiPuGYW6BHfcrl+2GhxH+zcx1/XYwT8mpzQU2fk9OilJCeMQBJ1RwyC2KQKpXb8vGSvM3iE2/CEmQ2HkUOCHqeK9VV+CZv5/eXe3HYEIG7oAXAQvWmKDz5KGn4HzqUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFawKK/t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24627C32786;
	Tue, 11 Jun 2024 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128572;
	bh=fw7gwYH6PjjTv166bTFSFEw2m1wKgdODwKV9veoJHuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TFawKK/tCtZlu0C4bPbY7iDBoxQciVi6hp7bTnAYjgL6lrBmJ/XkMzPS/AlhSYFUW
	 S6xEmuNZW7rXzIoy9YzcTfJpcDWb5Mq4VEyJlNCXUJt9gKeQsl8qaYbWwno09nE0Nh
	 DEc/iElB4427ZxYBOG5N2w31lZFYJFE9ayo8HS7X68cZ1yM6LQXzH48OV91017VJd0
	 oi9FQeDPpG+JB3A8cl2r/SXDXi22ite0K+Mf0qHAhS1ShCrIyPEE/LSx+yTKCpUyvz
	 c3tW5Yji9opbCmTfMDn2XrGX0x1yZWoFj8t3opEqyKneM7+h+0GkzgoI9lpfKLo3GM
	 hg2r8hG3QA0Lw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/16] kconfig: use menu_list_for_each_sym() in sym_choice_default()
Date: Wed, 12 Jun 2024 02:55:19 +0900
Message-ID: <20240611175536.3518179-11-masahiroy@kernel.org>
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

Currently, sym_get_choice_prop() and expr_list_for_each_sym() are
used to iterate on choice members.

Replace them with menu_for_each_sub_entry(), which achieves the same
without relying on P_CHOICE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 32c80a29dcd4..32b38724c960 100644
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


