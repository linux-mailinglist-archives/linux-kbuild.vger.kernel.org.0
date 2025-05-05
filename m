Return-Path: <linux-kbuild+bounces-6953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC17AAA9A0
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 03:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3C1A3A6FD6
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 01:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AAC35AD74;
	Mon,  5 May 2025 22:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JviV3VXM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A881F29953E;
	Mon,  5 May 2025 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484991; cv=none; b=IjIauinUuq5s/raQ6zzisM6YFcRMIAvz7fU2YNBZokaoKfbtMX3v9ZipUXSVucMw+mkXLrXH244F0UX4XogEvcEqcAyMOapXes66oUP5eFhHWTFrIRtGfj527NtRRjEK+D3QfCXTnLBbNRLdwpg9HWHXpqNOS2VF+lnhVYZ+5qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484991; c=relaxed/simple;
	bh=VzfuitWmNtwy2lfYXQP3+eZjHCxR1uGp2yuas6XIq0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j5Dj/TjhyhONwb29ahntgdmcJaU9hrksz35cApCBPJzK3T/G++mmbSlocKdYdcwQ8rCzdLdeJssbQrajWuDeaMw6xrK4P2noGcBugksjS48+51+dYrRdvT9sLkNRcWlqc/9JmoAXn1JYNE8F+bXDwHO0xKqzfiCHEH+dCxexUd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JviV3VXM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8877CC4CEEE;
	Mon,  5 May 2025 22:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484990;
	bh=VzfuitWmNtwy2lfYXQP3+eZjHCxR1uGp2yuas6XIq0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JviV3VXMP1cMgf+SZt8UvV3JcNUIoxt6tN19V0yzMz1GKQkfVk5q7lbmz3tNerrDZ
	 xZ6mDYGW0byfizr0HUXKs3fSuFf+ry5GiyctT7E7NWT6NmhU3awC0iSQQHxDZ6I6uo
	 zSULkNQBsRJ3ok2/RTxBcumM0CWgiXyj5UA7GKu///nbMBVp46hVb50EcnnMUyOtUm
	 Vh7FwtnLVLPbl0B1uz2KKuXbLLOXOy0T0XwZ7BXi6D5DgjbsXPMce3TsrLD6WR0PXt
	 5id+Z1QTp2eB4pykuqdpgY3DrZHTxzJKyuovtdws2z/r8K9rv7zG/Mtfu1xStxWMnf
	 bURFm8vS1S9dQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 113/486] kconfig: do not clear SYMBOL_VALID when reading include/config/auto.conf
Date: Mon,  5 May 2025 18:33:09 -0400
Message-Id: <20250505223922.2682012-113-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 226ac19c217f24f0927d0a73cf9ee613971a188d ]

When conf_read_simple() is called with S_DEF_AUTO, it is meant to read
previous symbol values from include/config/auto.conf to determine which
include/config/* files should be touched.

This process should not modify the current symbol status in any way.
However, conf_touch_deps() currently invalidates all symbol values and
recalculates them, which is totally unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/confdata.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 3b55e7a4131d9..ac95661a1c9dd 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -385,7 +385,7 @@ int conf_read_simple(const char *name, int def)
 
 	def_flags = SYMBOL_DEF << def;
 	for_all_symbols(sym) {
-		sym->flags &= ~(def_flags|SYMBOL_VALID);
+		sym->flags &= ~def_flags;
 		switch (sym->type) {
 		case S_INT:
 		case S_HEX:
@@ -398,7 +398,11 @@ int conf_read_simple(const char *name, int def)
 		}
 	}
 
-	expr_invalidate_all();
+	if (def == S_DEF_USER) {
+		for_all_symbols(sym)
+			sym->flags &= ~SYMBOL_VALID;
+		expr_invalidate_all();
+	}
 
 	while (getline_stripped(&line, &line_asize, in) != -1) {
 		struct menu *choice;
@@ -464,6 +468,9 @@ int conf_read_simple(const char *name, int def)
 		if (conf_set_sym_val(sym, def, def_flags, val))
 			continue;
 
+		if (def != S_DEF_USER)
+			continue;
+
 		/*
 		 * If this is a choice member, give it the highest priority.
 		 * If conflicting CONFIG options are given from an input file,
@@ -967,10 +974,8 @@ static int conf_touch_deps(void)
 	depfile_path[depfile_prefix_len] = 0;
 
 	conf_read_simple(name, S_DEF_AUTO);
-	sym_calc_value(modules_sym);
 
 	for_all_symbols(sym) {
-		sym_calc_value(sym);
 		if (sym_is_choice(sym))
 			continue;
 		if (sym->flags & SYMBOL_WRITE) {
@@ -1084,12 +1089,12 @@ int conf_write_autoconf(int overwrite)
 	if (ret)
 		return -1;
 
-	if (conf_touch_deps())
-		return 1;
-
 	for_all_symbols(sym)
 		sym_calc_value(sym);
 
+	if (conf_touch_deps())
+		return 1;
+
 	ret = __conf_write_autoconf(conf_get_autoheader_name(),
 				    print_symbol_for_c,
 				    &comment_style_c);
-- 
2.39.5


