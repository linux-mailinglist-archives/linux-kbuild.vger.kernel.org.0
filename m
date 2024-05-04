Return-Path: <linux-kbuild+bounces-1767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344D8BBDBB
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EC4CB214D3
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF9F8624C;
	Sat,  4 May 2024 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HV4a5+bE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916486246;
	Sat,  4 May 2024 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847661; cv=none; b=pO43+pF4gA7t9n1lux0BfR9XeyDZqh2PZ4dC/8lFoCBW7pGbvXGKljkZCnGUMmbw7v3cNsrMAYwkZcM/hAZ5H2Nw9SQZPH+MdcDlecdg54sUYlOejKIDUP2egiKPAqQAZcPFqp0J/6u8pnaizviL6PLTtaMwEMb9OoK+TDXWxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847661; c=relaxed/simple;
	bh=XMH+AE/Klmn9DMqBahtTcW2r5APi9nvotzI6xvIKwkM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pUIeEsZ4pxTfwUXBmTfBL38H9qOkWN6ZIE2HX8D+bG2Kjl4tOe7qm4VoE+RDM65OIxUBy0emoe7zxJRyAuWiN6b85z1nMMdm8BPMEtO14F8ur+9HmgoBEtJJ9wDYd6McloacOdOA2v510nuNX4uCqsaap54030gzdE8Dz1ECiWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HV4a5+bE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F69BC4AF18;
	Sat,  4 May 2024 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847661;
	bh=XMH+AE/Klmn9DMqBahtTcW2r5APi9nvotzI6xvIKwkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HV4a5+bEoFroBVyEmLVu/jIdqDyZ08rYKs/9wlQjSuXCXYns7ZX/t5robna8UCPqC
	 iq8gKnoIYXesAZ2XXIGIBjUyc9pmKnAT/zal/J+DhS/xZBZG48jDBiqVWSyiWoc7NU
	 hRNmrY8BnaBCCQ7oZU49K6HwwMO34SrYE6EGfVQRnBl3JeigaBOg030MCutCSWcaHC
	 u9TsaduYy5LOJcY83Mau5bQhkFROcnmnuxzZMNrC3JZKzD9qxjQhCvv9CU+lGodmJm
	 RZJfb6mosgx6myFQ8wHk5YZ6fhy9e+2pDYgyxX4FF1BIvEuvV1b0UgirkLPqlJSWG9
	 b0POmvtOII0Tw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/10] kconfig: turn defaults and additional prompt for choice members into error
Date: Sun,  5 May 2024 03:33:33 +0900
Message-Id: <20240504183333.2031860-10-masahiroy@kernel.org>
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

menu_finalize() warns default properties for choice members and prompts
outside the choice block. These should be hard errors.

While I was here, I moved the checks to slim down menu_finalize().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/menu.c   | 10 ----------
 scripts/kconfig/parser.y | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index a9b1e451dfe7..bee96c9964fd 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -507,16 +507,6 @@ static void _menu_finalize(struct menu *parent, bool inside_choice)
 		    menu->sym && !sym_is_choice_value(menu->sym)) {
 			current_entry = menu;
 			menu->sym->flags |= SYMBOL_CHOICEVAL;
-			for (prop = menu->sym->prop; prop; prop = prop->next) {
-				if (prop->type == P_DEFAULT)
-					prop_warn(prop, "defaults for choice "
-						  "values not supported");
-				if (prop->menu == menu)
-					continue;
-				if (prop->type == P_PROMPT &&
-				    prop->menu->parent->sym != sym)
-					prop_warn(prop, "choice value used outside its choice group");
-			}
 			/* Non-tristate choice values of tristate choices must
 			 * depend on the choice being set to Y. The choice
 			 * values' dependencies were propagated to their
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index ed86869e5ed0..0a9e249b5dcc 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -476,6 +476,37 @@ assign_val:
 
 %%
 
+/**
+ * choice_check_sanity - check sanity of a choice member
+ *
+ * @menu: menu of the choice member
+ *
+ * Return: -1 if an error is found, 0 otherwise.
+ */
+static int choice_check_sanity(struct menu *menu)
+{
+	struct property *prop;
+	int ret = 0;
+
+	for (prop = menu->sym->prop; prop; prop = prop->next) {
+		if (prop->type == P_DEFAULT) {
+			fprintf(stderr, "%s:%d: error: %s",
+				prop->filename, prop->lineno,
+				"defaults for choice values not supported\n");
+			ret = -1;
+		}
+
+		if (prop->menu != menu && prop->type == P_PROMPT) {
+			fprintf(stderr, "%s:%d: error: %s",
+				prop->filename, prop->lineno,
+				"choice value has a prompt outside its choice group\n");
+			ret = -1;
+		}
+	}
+
+	return ret;
+}
+
 void conf_parse(const char *name)
 {
 	struct menu *menu;
@@ -523,8 +554,16 @@ void conf_parse(const char *name)
 	menu_finalize();
 
 	menu_for_each_entry(menu) {
+		struct menu *child;
+
 		if (menu->sym && sym_check_deps(menu->sym))
 			yynerrs++;
+
+		if (menu->sym && sym_is_choice(menu->sym)) {
+			menu_for_each_sub_entry(child, menu)
+				if (child->sym && choice_check_sanity(child))
+					yynerrs++;
+		}
 	}
 
 	if (yynerrs)
-- 
2.40.1


