Return-Path: <linux-kbuild+bounces-117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 824AA7F4ACB
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 16:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B50BD1C20CF6
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 15:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC415646A;
	Wed, 22 Nov 2023 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKcQ8J2J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F8656454
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 15:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCA3C433CC;
	Wed, 22 Nov 2023 15:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700667385;
	bh=5UwPPHos8RLKKjQlMu0D/jpNSrVlherf6n7Rw+QfY3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BKcQ8J2Jgwoy2PgcpCWJgNKYF7imZKKHpkbUd50gpmiQoHxQGQYBJtdMkFe7tGZJL
	 kPBmPjK4eg6JO3zp5RIm8TSHlE1Ms/N/wXb+aV12KBJgpaWL7ex0BsEnt67f8KxWzf
	 dcVFp8eJ/8R5mmRvDTCKRZoEVJ9cicunElmLFDYdvDdNvBNJdF0jyks/9B0KgsRpAb
	 gzIAWfEF6LM0xYjND7T6NxoSzCtnlrrvk+ORBDVz61nLA0gANREOmNWsq0+JlgEcba
	 0vdawYfqjoNIhxCwaFrQ7em0u0REhA3UDaMRqTFChOr5jGA91QUHwOgpKU3hF5Af5I
	 OmfWxZB969h5Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 5/6] kconfig: fix memory leak from range properties
Date: Wed, 22 Nov 2023 10:36:04 -0500
Message-ID: <20231122153610.853350-5-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153610.853350-1-sashal@kernel.org>
References: <20231122153610.853350-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.261
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
index f56eec5ea4c7f..342fefe5dba40 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -117,9 +117,9 @@ static long long sym_get_range_val(struct symbol *sym, int base)
 static void sym_validate_range(struct symbol *sym)
 {
 	struct property *prop;
+	struct symbol *range_sym;
 	int base;
 	long long val, val2;
-	char str[64];
 
 	switch (sym->type) {
 	case S_INT:
@@ -135,17 +135,15 @@ static void sym_validate_range(struct symbol *sym)
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


