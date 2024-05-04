Return-Path: <linux-kbuild+bounces-1762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B94FC8BBDB1
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DB95B214D4
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C09D84E1D;
	Sat,  4 May 2024 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQrd8ykV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8884E17;
	Sat,  4 May 2024 18:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847654; cv=none; b=Lb78mDLYCPZJeetk5l5CG99oAyhhbo2BDsyojhF8yvwiBL6yHXgdXIDjkf8uThDyS2YDW+YEDasOCOHc9N442gx2wqlLhygN3Fc3mDlURG2xLuigeUonwJ5oClWkRpfKD8P4ntdmdx4kh0351cu0TTjYHPKbUphU7Dmdmt0mRaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847654; c=relaxed/simple;
	bh=tnu4Sm6RDAbK7lE25RylH7+gcqO8XLwyS5Zea6M1TcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OPVN6ThonOjDELQF5FYPtdcUL0QWUfa4RS7rdlm0eV1MyVjSgf2IBDd/N/7IwG3jmd2Z1x0OYdenMwhLYJRK+RoYLnEfJqQDctEBcDWD0namMdqBUPMVPA3IJe4M2Ubnl6sKTEXcz5tPTFNcnEtitio78biPIcrx0xymRtb6n9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQrd8ykV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299BAC4AF14;
	Sat,  4 May 2024 18:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847654;
	bh=tnu4Sm6RDAbK7lE25RylH7+gcqO8XLwyS5Zea6M1TcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQrd8ykVwxeFW6cGp7B8J2wdYRh0inOEzKZJr5cbRX1v1KQtlDvKw8oHunV220vMY
	 KhO0tVI6fcFceW9jWSE0r20m4SbpSG+0VIW/8RsOwa98qhs43N17zqD1UuOhv8i0kN
	 v9D21R9IU1aza0C0pIB/DZ574om1MmdaNKcqaDueIovFEU7G5f9EgT7aX0GfbDU8c2
	 g3ixjoNm28ikAaIoxryv41T8YiqdhItbqy5p0gaEqNzKlcviX2RjHm1Z/2ksu4QCCT
	 6SfWzLrtu5Fo6t7l+XxnzbVUYcz68s/unYTVARk6Ra7O8hyJH0vOdBka2ktYRVjqPq
	 DqYXl6GwUrRXQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 05/10] kconfig: add sym_get_choice_menu() helper
Date: Sun,  5 May 2024 03:33:28 +0900
Message-Id: <20240504183333.2031860-5-masahiroy@kernel.org>
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

Choices and their members are associated via the P_CHOICE property.

Currently, prop_get_symbol(sym_get_choice_prop(sym)) is used to obtain
the choice of the given choice member.

We can do this without relying on P_CHOICE by checking the parent in
the menu structure.

Introduce a new helper to retrieve the choice if the given symbol is a
choice member.

This is intended to replace prop_get_symbol(sym_get_choice_prop(sym))
and deprecate P_CHOICE eventually.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc_proto.h |  1 +
 scripts/kconfig/symbol.c    | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 2807fa584c2b..d76aaf4ea117 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -34,6 +34,7 @@ bool sym_string_within_range(struct symbol *sym, const char *str);
 bool sym_set_string_value(struct symbol *sym, const char *newval);
 bool sym_is_changeable(struct symbol *sym);
 struct property * sym_get_choice_prop(struct symbol *sym);
+struct menu *sym_get_choice_menu(struct symbol *sym);
 const char * sym_get_string_value(struct symbol *sym);
 
 const char * prop_get_type_name(enum prop_type type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 8512c29c84bb..23829f44b8f8 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -78,6 +78,41 @@ struct property *sym_get_choice_prop(struct symbol *sym)
 	return NULL;
 }
 
+/**
+ * sym_get_choice_menu - get the parent choice menu if present
+ *
+ * @sym: a symbol pointer
+ *
+ * Return: a choice menu if this function is called against a choice member.
+ */
+struct menu *sym_get_choice_menu(struct symbol *sym)
+{
+	struct menu *menu = NULL;
+	struct menu *m;
+
+	/*
+	 * Choice members must have a prompt. Find a menu entry with a prompt,
+	 * and assume it resides inside a choice block.
+	 */
+	list_for_each_entry(m, &sym->menus, link)
+		if (m->prompt) {
+			menu = m;
+			break;
+		}
+
+	if (!menu)
+		return NULL;
+
+	do {
+		menu = menu->parent;
+	} while (menu && !menu->sym);
+
+	if (menu && menu->sym && sym_is_choice(menu->sym))
+		return menu;
+
+	return NULL;
+}
+
 static struct property *sym_get_default_prop(struct symbol *sym)
 {
 	struct property *prop;
-- 
2.40.1


