Return-Path: <linux-kbuild+bounces-1764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C128BBDB5
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 20:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D3A9B2130B
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 18:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7135585287;
	Sat,  4 May 2024 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U845aXRS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A98985274;
	Sat,  4 May 2024 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714847657; cv=none; b=hsBK5vZCE9G8z24RmV+VLk1fc9gPiLoEyihox+kA3ulC5EkWkMqI4Q74RCUpA4Ft34wUpjiom0eiWdLkLERdgte4a8Nic271tcefpoUocutrmPpd3VydK6kBI0O0lokzAT6A8vKCUXi18LxEWsN2kyq37c3deNK/lWjMkm0rgfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714847657; c=relaxed/simple;
	bh=eo6+W6TnHuiRwkZe3ODc0AWjobnC6OZhSBkg+ENoBXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pdaOFpAPCOvHFy+zr5uIIc2fdsjE9XnJ5v2BjLgsm/Ip+nS6PS/Yuu2wapJkqtOiz3Gz6vn2OD9uHNDVpG8mj2NEOCPvK8ZFQbX2m30QvDxpxBtPTyEJJwTFK1/8CvXM+Y3GOg7L2YmkgeIls/ZpOJN3dGHhEBc5MEhm8dm5idA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U845aXRS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9623C4AF4D;
	Sat,  4 May 2024 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714847656;
	bh=eo6+W6TnHuiRwkZe3ODc0AWjobnC6OZhSBkg+ENoBXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U845aXRS+VZXmdPDmoV+oKrIcCqc0nwa1AOyC/4xFx74PI6wQy5Bed9XZ+js/M9T4
	 xdcE4PFLJioiOSnnCdV8Yg2ylVOY71d2NwjYsIJCBDc/aIXoGFIjsNPdbVKpeDGYtf
	 Sf5wuXfoOn8n8C0SZBEP6moovDuet03fvbEdpYhMr44tRURPICnSYjCapMI/XV27KT
	 OE7jIC1eHbt2+CQvvO617+wZvMR2oTnmGtzsGJD0Mh771ihuqmAqrF7A/ESdtpS6zs
	 k5Fc5BSKRapdoun8EgWVnIQWRMWL4jrf+2fhaJjGAxaCBX8ktG4bKXO/Hgw7vu33sX
	 O1v/4VmzcWUpw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 07/10] kconfig: use menu_list_for_each_sym() in sym_check_choice_deps()
Date: Sun,  5 May 2024 03:33:30 +0900
Message-Id: <20240504183333.2031860-7-masahiroy@kernel.org>
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

Currently, sym_get_choice_prop() and expr_list_for_each_sym() are
used to iterate on choice members.

Replace them with menu_for_each_sub_entry(), which achieves the same
without relying on P_CHOICE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 23829f44b8f8..75e7506fcb5c 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1204,16 +1204,18 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
 
 static struct symbol *sym_check_choice_deps(struct symbol *choice)
 {
-	struct symbol *sym, *sym2;
-	struct property *prop;
-	struct expr *e;
+	struct menu *menu, *child;
+	struct symbol *sym2;
 	struct dep_stack stack;
 
 	dep_stack_insert(&stack, choice);
 
-	prop = sym_get_choice_prop(choice);
-	expr_list_for_each_sym(prop->expr, e, sym)
-		sym->flags |= (SYMBOL_CHECK | SYMBOL_CHECKED);
+	menu = list_first_entry(&choice->menus, struct menu, link);
+
+	menu_for_each_sub_entry(child, menu) {
+		if (child->sym)
+			child->sym->flags |= SYMBOL_CHECK | SYMBOL_CHECKED;
+	}
 
 	choice->flags |= (SYMBOL_CHECK | SYMBOL_CHECKED);
 	sym2 = sym_check_sym_deps(choice);
@@ -1221,14 +1223,17 @@ static struct symbol *sym_check_choice_deps(struct symbol *choice)
 	if (sym2)
 		goto out;
 
-	expr_list_for_each_sym(prop->expr, e, sym) {
-		sym2 = sym_check_sym_deps(sym);
+	menu_for_each_sub_entry(child, menu) {
+		if (!child->sym)
+			continue;
+		sym2 = sym_check_sym_deps(child->sym);
 		if (sym2)
 			break;
 	}
 out:
-	expr_list_for_each_sym(prop->expr, e, sym)
-		sym->flags &= ~SYMBOL_CHECK;
+	menu_for_each_sub_entry(child, menu)
+		if (child->sym)
+			child->sym->flags &= ~SYMBOL_CHECK;
 
 	if (sym2 && sym_is_choice_value(sym2) &&
 	    prop_get_symbol(sym_get_choice_prop(sym2)) == choice)
-- 
2.40.1


