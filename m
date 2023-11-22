Return-Path: <linux-kbuild+bounces-116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DB7F4AC5
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 16:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9241B21025
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 15:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C804F1F1;
	Wed, 22 Nov 2023 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQRB8xFf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAEC4E1C7
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 15:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C00FC433AD;
	Wed, 22 Nov 2023 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700667360;
	bh=Lq00onOaGhMQrQm6KMEWgcF+DMXr0QemXLunGniudF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQRB8xFfRd/9S+tpfoBdeXtJpgUz1ftEFNxtRdr3PWJ+/nnFE7oPFg4ttOvMEI1lF
	 mVHYzSsgQcnuKPpZ59w3gn/qD2/p8TE9wKtHtp6hgjZuyFj/H/XRJUYnF7PhRuO5MU
	 i+lrLC/USM7BnUxvj28FuxTZgrUvSg2iVDbSdjbhso4c8nQg6p8pEer7T90puUB8Ic
	 QO6koqJP1JakK8eBNRJRzHx9ZLTJh+Kf2P0md4hLBCFvQza6gZgRAOVObN7yxYbEQT
	 FW4ixiUfhx08AHfRPHN0Xod8qtcc+pdqpV91miujuOBa2I3bPqEzcR3pf2J6q5Kcw3
	 f57FunZeTluQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 6/7] kconfig: fix memory leak from range properties
Date: Wed, 22 Nov 2023 10:35:34 -0500
Message-ID: <20231122153541.853179-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153541.853179-1-sashal@kernel.org>
References: <20231122153541.853179-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.201
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit ae1eff0349f2e908fc083630e8441ea6dc434dc0 ]

Currently, sym_validate_range() duplicates the range string using
xstrdup(), which is overwritten by a subsequent sym_calc_value() call.
It results in a memory leak.

Instead, only the pointer should be copied.

Below is a test case, with a summary from Valgrind.

[Test Kconfig]

  config FOO
          int "foo"
          range 10 20

[Test .config]

  CONFIG_FOO=0

[Before]

  LEAK SUMMARY:
     definitely lost: 3 bytes in 1 blocks
     indirectly lost: 0 bytes in 0 blocks
       possibly lost: 0 bytes in 0 blocks
     still reachable: 17,465 bytes in 21 blocks
          suppressed: 0 bytes in 0 blocks

[After]

  LEAK SUMMARY:
     definitely lost: 0 bytes in 0 blocks
     indirectly lost: 0 bytes in 0 blocks
       possibly lost: 0 bytes in 0 blocks
     still reachable: 17,462 bytes in 20 blocks
          suppressed: 0 bytes in 0 blocks

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/symbol.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index ffa3ec65cc907..a2056fa80de2b 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -123,9 +123,9 @@ static long long sym_get_range_val(struct symbol *sym, int base)
 static void sym_validate_range(struct symbol *sym)
 {
 	struct property *prop;
+	struct symbol *range_sym;
 	int base;
 	long long val, val2;
-	char str[64];
 
 	switch (sym->type) {
 	case S_INT:
@@ -141,17 +141,15 @@ static void sym_validate_range(struct symbol *sym)
 	if (!prop)
 		return;
 	val = strtoll(sym->curr.val, NULL, base);
-	val2 = sym_get_range_val(prop->expr->left.sym, base);
+	range_sym = prop->expr->left.sym;
+	val2 = sym_get_range_val(range_sym, base);
 	if (val >= val2) {
-		val2 = sym_get_range_val(prop->expr->right.sym, base);
+		range_sym = prop->expr->right.sym;
+		val2 = sym_get_range_val(range_sym, base);
 		if (val <= val2)
 			return;
 	}
-	if (sym->type == S_INT)
-		sprintf(str, "%lld", val2);
-	else
-		sprintf(str, "0x%llx", val2);
-	sym->curr.val = xstrdup(str);
+	sym->curr.val = range_sym->curr.val;
 }
 
 static void sym_set_changed(struct symbol *sym)
-- 
2.42.0


