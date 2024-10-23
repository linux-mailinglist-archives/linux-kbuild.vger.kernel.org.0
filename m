Return-Path: <linux-kbuild+bounces-4294-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA039AD3E5
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CC6F28590F
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFA921FCC6F;
	Wed, 23 Oct 2024 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NmDt1FCK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E831D0E3E;
	Wed, 23 Oct 2024 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707521; cv=none; b=oI+41gok6qBQIeyl/w0wyltr1SwYl/jGwFR39CJmQjKIIRK5yCoolh0ERcIsyikAbNkhWVMQstYxyRZan9QzNXtu80H9iYIT13okrYuBaZq1BhDtEbq5pgqfF/P/HRfUOQeaOW2B526JjyQRtveKmNwJqvM0kVPPpHUcB/d1N94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707521; c=relaxed/simple;
	bh=LIylYfq3W+Z7C+TuWMmSTLzgP9BFGIyXtCZHD975w/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efbjfvvhMnT4190sh+scSSRnNjNyTKUQBSixUlYsO6IvFBL3UUqe9UCEvlVRjfhWriH3HWraKPfm6rvh3w4TnFniJZA+bUmVASQM4YtmYarHk09rMpDoFOVJquIzIX21p3DbRqLA9GAzr7jAjKi6t2Z3tc2nMcY6jFY8lD98aN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NmDt1FCK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4977C4CEC7;
	Wed, 23 Oct 2024 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707521;
	bh=LIylYfq3W+Z7C+TuWMmSTLzgP9BFGIyXtCZHD975w/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NmDt1FCK+IaevsR35hvwRvkkX2HO602rv2EOxDCpiuaHDKGNkjW9kGJ3fJIIVBWQU
	 nOOKzzveWVCi2kBhByWEY/rItQq8zuZFvFlf2I5DbTy2Ef3kYywyEPAWp1+BcfhDTM
	 5pf8ljZ7XZyAtMc0W42Xjl3raseGcpqt+KPl+EbjNccd3aDibuy9DLs8DCm143gHGk
	 HhnwUsfoRlgDUNNmcQfdnXbBN062Jc5nggvscxyD6qWXZRLplvOiDGPXMEpZpi53Ci
	 QGsyaJG/jCcje2I6Le0G0ReUkaxQvOIvcija0mDcpaByGHV5UBEmEBAzccnXVgs0qx
	 3cdBOop3DEgOw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] kconfig: add sym_get_prompt_menu() helper function
Date: Thu, 24 Oct 2024 03:18:01 +0900
Message-ID: <20241023181823.138524-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split out the code that retrieves the menu entry with a prompt, so it
can be reused in other functions.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/lkc_proto.h |  1 +
 scripts/kconfig/symbol.c    | 26 +++++++++++++++++++-------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 63519cd24bc7..8914b4e8f2a8 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -34,6 +34,7 @@ bool sym_string_valid(struct symbol *sym, const char *newval);
 bool sym_string_within_range(struct symbol *sym, const char *str);
 bool sym_set_string_value(struct symbol *sym, const char *newval);
 bool sym_is_changeable(const struct symbol *sym);
+struct menu *sym_get_prompt_menu(const struct symbol *sym);
 struct menu *sym_get_choice_menu(const struct symbol *sym);
 const char * sym_get_string_value(struct symbol *sym);
 
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index a3af93aaaf32..89b84bf8e21f 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -70,6 +70,24 @@ const char *sym_type_name(enum symbol_type type)
 	return "???";
 }
 
+/**
+ * sym_get_prompt_menu - get the menu entry with a prompt
+ *
+ * @sym: a symbol pointer
+ *
+ * Return: the menu entry with a prompt.
+ */
+struct menu *sym_get_prompt_menu(const struct symbol *sym)
+{
+	struct menu *m;
+
+	list_for_each_entry(m, &sym->menus, link)
+		if (m->prompt)
+			return m;
+
+	return NULL;
+}
+
 /**
  * sym_get_choice_menu - get the parent choice menu if present
  *
@@ -80,18 +98,12 @@ const char *sym_type_name(enum symbol_type type)
 struct menu *sym_get_choice_menu(const struct symbol *sym)
 {
 	struct menu *menu = NULL;
-	struct menu *m;
 
 	/*
 	 * Choice members must have a prompt. Find a menu entry with a prompt,
 	 * and assume it resides inside a choice block.
 	 */
-	list_for_each_entry(m, &sym->menus, link)
-		if (m->prompt) {
-			menu = m;
-			break;
-		}
-
+	menu = sym_get_prompt_menu(sym);
 	if (!menu)
 		return NULL;
 
-- 
2.43.0


