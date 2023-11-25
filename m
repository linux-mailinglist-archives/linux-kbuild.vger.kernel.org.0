Return-Path: <linux-kbuild+bounces-163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED687F8C75
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 17:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CE41F20EEC
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 16:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9200C946F;
	Sat, 25 Nov 2023 16:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEd9SbMW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ABB20FB
	for <linux-kbuild@vger.kernel.org>; Sat, 25 Nov 2023 16:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F0EC433C7;
	Sat, 25 Nov 2023 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700930166;
	bh=fts8SLIgVhLqO6eGUFoOp3dpYL3AguZRASLqnEn6BEE=;
	h=From:To:Cc:Subject:Date:From;
	b=FEd9SbMWzCapCGVZ+4jpMWoK4eQS8yPkj94F713Q+hvBnfjHUNSl4aMHzyjFarDxC
	 cbWR0A0f2qg2x+aJrjSHf9uucae4tP3rjxVX+CJibfWYlDppMoVUEQpooHGMjVzrD+
	 hpOx+u77ESqDTALTXi+AiKX4bNXeOOJdmmVDyQpt0Q2RbqJZB83a3zcbNWr+DRd8UQ
	 EOvfhRa97GdF71iW30ywiagQ0GVbRXjmsxilOf7IE/jz0SOPW2qFCH/xP7cUch1iP/
	 JQ5cFbpL5norJUWwB7+PUnAuCgTEuQvmyT2a7QrfMkypcr/W3Bsea1mNkZ4gmPuSei
	 HNafJf1OL3eSQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: remove unneeded symbol_empty variable
Date: Sun, 26 Nov 2023 01:35:58 +0900
Message-Id: <20231125163559.824210-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is used only for initializing other variables.

Use the empty string "".

Please note newval.tri is unused for S_INT/HEX/STRING.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index a76925b46ce6..f7075d148ac7 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -29,12 +29,6 @@ struct symbol symbol_no = {
 	.flags = SYMBOL_CONST|SYMBOL_VALID,
 };
 
-static struct symbol symbol_empty = {
-	.name = "",
-	.curr = { "", no },
-	.flags = SYMBOL_VALID,
-};
-
 struct symbol *modules_sym;
 static tristate modules_val;
 
@@ -346,7 +340,7 @@ void sym_calc_value(struct symbol *sym)
 	case S_INT:
 	case S_HEX:
 	case S_STRING:
-		newval = symbol_empty.curr;
+		newval.val = "";
 		break;
 	case S_BOOLEAN:
 	case S_TRISTATE:
@@ -697,13 +691,12 @@ const char *sym_get_string_default(struct symbol *sym)
 {
 	struct property *prop;
 	struct symbol *ds;
-	const char *str;
+	const char *str = "";
 	tristate val;
 
 	sym_calc_visibility(sym);
 	sym_calc_value(modules_sym);
 	val = symbol_no.curr.tri;
-	str = symbol_empty.curr.val;
 
 	/* If symbol has a default value look it up */
 	prop = sym_get_default_prop(sym);
-- 
2.40.1


