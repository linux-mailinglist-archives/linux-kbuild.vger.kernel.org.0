Return-Path: <linux-kbuild+bounces-1766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5F8BBDB9
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84C1F281E58
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B0A8595C;
	Sat,  4 May 2024 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyqA3Bm6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3F285953;
	Sat,  4 May 2024 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847660; cv=none; b=OumMr0lWQcjjlzvT2cPQa+Lph5K93xsfYw+bhz8M+uU3/jrNp4NsAsQ6M40EumGxlr2rmcjOkcbxD4D5Uk8yjv03NJFiXXh3O1sweBjKYiMtnTR1lb58zNpUUYzaW2Ytl4qEAxocjKQrLMncNEq2NsQW3SSITZjdzRC5Py7pDkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847660; c=relaxed/simple;
	bh=IjS/X0Zg7nzLrbnNApIqBryuz3RpzFI+6nuPMvnXyQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9wXXVvzcVn8YbL+V8uXjE3LcVVWlPAMOUEnXAhZn49y6kQnDHt+MWtCc0YXL6o1Zp1c26IEzgj76/eJX33ZBBp83QNWoSkh/0bItmz9+SlwIjVgZUMf+KWj85gn7/EgjUyws9/ShVDXhxNKcDR2iDDHNbyRCaWmXx7uB/1pq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyqA3Bm6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C0DC4AF1B;
	Sat,  4 May 2024 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847659;
	bh=IjS/X0Zg7nzLrbnNApIqBryuz3RpzFI+6nuPMvnXyQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pyqA3Bm6fsbLqFuCLaJ1FTzdxPwvjd9T3kZymn37zTC9zvyF8qjT0HAdKveohvoor
	 nYKvTEcTrUmbEbDPP5IuGKnGbYNANtRD+eRY5HBFbhgM5FkJ0eT6UT62JPFWzjgf1+
	 FRJ9Ew6tpXAe/ed/b7Yfr8judF+Io/YYqUAbqSDgmfCl2Tss9Z+x7w5avYk74klux7
	 i4/XlrvzXPHmKFsnUryrC2P9jK/iv79VPD8gWBZ01+SRZ7u1TuhuwFuvnrK79VZAst
	 f1BNoh57M2GLu8q0nwrYBP6GpjKwMlaCtcDJKcCw5jyKX2Z7xP7Ym58X4/+69n8w2Z
	 vhOCy5u4YvY0A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/10] kconfig: turn missing prompt for choice members into error
Date: Sun,  5 May 2024 03:33:32 +0900
Message-Id: <20240504183333.2031860-9-masahiroy@kernel.org>
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

Choice members must have a prompt; hence make it an error.

While I was here, I moved the check to the parser to slim down
_menu_finalize().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c   |  2 --
 scripts/kconfig/parser.y | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index e01b9ee87c05..a9b1e451dfe7 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -507,8 +507,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 		    menu->sym && !sym_is_choice_value(menu->sym)) {
 			current_entry = menu;
 			menu->sym->flags |= SYMBOL_CHOICEVAL;
-			if (!menu->prompt)
-				menu_warn(menu, "choice value must have a prompt");
 			for (prop = menu->sym->prop; prop; prop = prop->next) {
 				if (prop->type == P_DEFAULT)
 					prop_warn(prop, "defaults for choice "
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 613fa8c9c2d0..ed86869e5ed0 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -30,6 +30,8 @@ static bool zconf_endtoken(const char *tokenname,
 
 struct menu *current_menu, *current_entry;
 
+static bool inside_choice = false;
+
 %}
 
 %union
@@ -145,6 +147,14 @@ config_entry_start: T_CONFIG nonconst_symbol T_EOL
 
 config_stmt: config_entry_start config_option_list
 {
+	if (inside_choice) {
+		if (!current_entry->prompt) {
+			fprintf(stderr, "%s:%d: error: choice member must have a prompt\n",
+				current_entry->filename, current_entry->lineno);
+			yynerrs++;
+		}
+	}
+
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", cur_filename, cur_lineno);
 };
 
@@ -237,10 +247,14 @@ choice_entry: choice choice_option_list
 	}
 
 	$$ = menu_add_menu();
+
+	inside_choice = true;
 };
 
 choice_end: end
 {
+	inside_choice = false;
+
 	if (zconf_endtoken($1, "choice")) {
 		menu_end_menu();
 		printd(DEBUG_PARSE, "%s:%d:endchoice\n", cur_filename, cur_lineno);
-- 
2.40.1


