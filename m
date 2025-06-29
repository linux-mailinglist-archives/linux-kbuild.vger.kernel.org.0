Return-Path: <linux-kbuild+bounces-7745-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94DAECFB4
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E7C6171610
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8996923504D;
	Sun, 29 Jun 2025 18:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEyOcyRy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6193322E40F;
	Sun, 29 Jun 2025 18:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222922; cv=none; b=M/LnmCPYnvldtohYLDcbgque8IlfNBnB/oUPFXfhq7zoQ5/Re4UD9BibrPKMa7VP7kbT4vS4jiSbAsPErO9KuKInbFPMf946Ic8D71h7NdoBpsBCMeRKYhL5NtPonhA6jIU4Ll1OI6k0or60g2d5p56BrMlEGBPg9E7dCzFAsVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222922; c=relaxed/simple;
	bh=JGkngKGR+SCUkYMJ34z+x49MD9C3ka/8GBc30C7jMrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TT2/F7QWI6zK2OopcPOklUpyOs9UdL5uxDizPwYalIJXYi6f3XmqmkggoE3DBeFRRebvofoF2o6R/VLb0IXdfYEZhIcxk2t6VF1Yfc4Zf0HYrdamIDRFziHmvmyyJ7zmyqntG39wMILbfuZ0mL4j3AOt49hh8/C35zXXVTWCsMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEyOcyRy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395D0C4CEEB;
	Sun, 29 Jun 2025 18:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222922;
	bh=JGkngKGR+SCUkYMJ34z+x49MD9C3ka/8GBc30C7jMrI=;
	h=From:To:Cc:Subject:Date:From;
	b=BEyOcyRyvoJ+IMmfFsCC9/L90fyCu9esPEnfmJOVVRLMK+NAVMD2VsGXJFDBy2c+4
	 5s7TFv0H3g2vpr4DHYlYcUsyd2Nfjk1jXHxEOwBeHc5wVrDb9dBRveHGISb39cJxEX
	 9JYV6J35+Mi4yBl/Gf/J+mEX/8y5irmTNN4MHqiDi+lX9a8V/zvk7wS9En8Mq8z2fq
	 yNe+31zKouPqS4jlPN/yRSudQWBG7KYMq7uhWTfbSqN6sXrvCk3N4cyZ7ywoyYVdx5
	 W2UF/CY09yvMdMWCE3NPISMBsAr9ck31EVvA1eVqtRqA1IOnuJmY1gOab7Gc79/kwE
	 ij+IlxY5bjJnA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: add a function to dump all menu entries in a tree-like format
Date: Mon, 30 Jun 2025 03:48:31 +0900
Message-ID: <20250629184837.411733-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is useful for debugging purposes. menu_finalize() re-parents menu
entries, and this function can be used to dump the final structure of
the menu tree.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc.h  |  1 +
 scripts/kconfig/menu.c | 74 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 37b606c74bff..56548efc14d7 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -102,6 +102,7 @@ struct menu *menu_get_menu_or_parent_menu(struct menu *menu);
 int get_jump_key_char(void);
 struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
 void menu_get_ext_help(struct menu *menu, struct gstr *help);
+void menu_dump(void);
 
 /* symbol.c */
 void sym_clear_all_valid(void);
diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index a5e5b4fdcd93..0f1a6513987c 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -788,3 +788,77 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 	if (sym)
 		get_symbol_str(help, sym, NULL);
 }
+
+/**
+ * menu_dump - dump all menu entries in a tree-like format
+ */
+void menu_dump(void)
+{
+	struct menu *menu = &rootmenu;
+	unsigned long long bits = 0;
+	int indent = 0;
+
+	while (menu) {
+
+		for (int i = indent - 1; i >= 0; i--) {
+			if (bits & (1ULL << i)) {
+				if (i > 0)
+					printf("|   ");
+				else
+					printf("|-- ");
+			} else {
+				if (i > 0)
+					printf("    ");
+				else
+					printf("`-- ");
+			}
+		}
+
+		switch (menu->type) {
+		case M_CHOICE:
+			printf("choice \"%s\"\n", menu->prompt->text);
+			break;
+		case M_COMMENT:
+			printf("comment \"%s\"\n", menu->prompt->text);
+			break;
+		case M_IF:
+			printf("if\n");
+			break;
+		case M_MENU:
+			printf("menu \"%s\"", menu->prompt->text);
+			if (!menu->sym) {
+				printf("\n");
+				break;
+			}
+			printf(" + ");
+			/* fallthrough */
+		case M_NORMAL:
+			printf("symbol %s\n", menu->sym->name);
+			break;
+		}
+		if (menu->list) {
+			bits <<= 1;
+			menu = menu->list;
+			if (menu->next)
+				bits |= 1;
+			else
+				bits &= ~1;
+			indent++;
+			continue;
+		}
+
+		while (menu && !menu->next) {
+			menu = menu->parent;
+			bits >>= 1;
+			indent--;
+		}
+
+		if (menu) {
+			menu = menu->next;
+			if (menu->next)
+				bits |= 1;
+			else
+				bits &= ~1;
+		}
+	}
+}
-- 
2.43.0


