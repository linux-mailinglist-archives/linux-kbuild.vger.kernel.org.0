Return-Path: <linux-kbuild+bounces-1885-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B68C9435
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 11:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486BE1F2126E
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 09:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399B7249ED;
	Sun, 19 May 2024 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ru+XCSY1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1713D60;
	Sun, 19 May 2024 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716110555; cv=none; b=ofqzCxBIC7/yZh1QLIuHMy4J6OqXalSVXD0yEMtou0J8rRYO4ISvH3mfxS5jV2KwSAvStWeZHJgZCk6rxsmYk+u0153v6/7FKFRQHdpRmBEbDh1tdx9OV9k++eB71keQDX5GQafsaDMKvi68uMMYaLi7BxwsiFUf2qF+MNrdtBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716110555; c=relaxed/simple;
	bh=4vP51LV2fsWJzxCi5xWMJ6NrpAV+H9bEyZ6ICl1ZBcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s3TJPO3M36bfAK0u4B9gIEErAD1a6nw+tMMVSpDlgXH2bO8zGSEuBzVy8zOQJ8WPE2IvuVsbx1N60miVjhtnoCsJX2Eic3eD/g2e/cW2UWWyq4ZN4kZLj+LCC+01Vd/RfCLOJhxdNgeJT498B/Kwux2O9OiB//b2AKsm5El1Pnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ru+XCSY1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1254C32781;
	Sun, 19 May 2024 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716110554;
	bh=4vP51LV2fsWJzxCi5xWMJ6NrpAV+H9bEyZ6ICl1ZBcQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ru+XCSY1jgvuvu5UWERN5e+zcG5ECUjhzlirHuHiG/IwbQzBPvO+8E161lFMP3kBG
	 JE5A8JyHiupwpXBQmZHMRyj1tgZWhGinKaW6isZ9TnT518RMvnV6DBzwvYAT5wB/Bu
	 VJeRuzlKHvBMHk2JJbznIjhIqB9sUfy0ooeRxRnmTfpCY55V492ryzN4RLagFdZR7n
	 zb3DZUHv2ncJ7NrR+o8MjD97ge0z2EKNEp/mIohB+yVfBfRtoJJbvtu3DQRgjg8eF6
	 FZp2gCc5J4GNTGkK2zAe8Uy2SyJ3UxfSsgQuHmnNGcW8YYLNEtNUDsPBQxsAfrGfNB
	 JtwGFb3Snv7Eg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: fix comparison to constant symbols, 'm', 'n'
Date: Sun, 19 May 2024 18:22:27 +0900
Message-Id: <20240519092227.2101109-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, comparisons to 'm' or 'n' result in incorrect output.

[Test Code]

    config MODULES
            def_bool y
            modules

    config A
            def_tristate m

    config B
            def_bool A > n

CONFIG_B is actually unset, while the expectation is CONFIG_B=y.

The reason for the issue is because Kconfig compares the tristate values
as strings.

Currently, the .type fields of the constant symbols, 'y', 'm', and 'n'
are unspecified, i.e., S_UNKNOWN.

When expr_calc_value() evaluates 'A > n', it checks the types of 'A' and
'n' to determine how to compare them.

The left-hand side, 'A', is a tristate symbol with a value of 'm', which
corresponds to a numeric value of 1. (Internally, 'y', 'm', and 'n' are
represented as 2, 1, and 0, respectively.)

The right-hand side, 'n', has an unknown type, so it is treated as the
string "n" during the comparison.

expr_calc_value() compares two values numerically only when both can
have numeric values. Otherwise, they are compared as strings.

    symbol    numeric value    ASCII code
    -------------------------------------
      y           2             0x79
      m           1             0x6d
      n           0             0x6e

'm' is greater than 'n' if compared numerically (since 1 is greater
than 0), but small than 'n' if compared as strings (since the ASCII
code 0x6d is smaller than 0x6e).

Specifying .type=S_TRISTATE for symbol_{yes,mod,no} fixes the above
test code.

However, this would cause a regression to the following test code.

[Test Code 2]

    config MODULES
            def_bool n
            modules

    config A
            def_tristate n

    config B
            def_bool A = m

You would get CONFIG_B=y, while CONFIG_B should not be set.

The reason is because sym_get_string_value() turns 'm' into 'n' when
the module feature is disabled. Consequently, expr_calc_value() returns
the result of 'A = n' instead of 'A = m'. This oddity has been hidden
because the type of 'm' was previously S_UNKNOWN instead of S_TRISTATE.

sym_get_string_value() should not tweak the string because the tristate
value has already been correctly calculated. There is no reason to
return the string "n" where its tristate value is mod.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/symbol.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index aa0e25ee5119..0e439d3d48d1 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -14,6 +14,7 @@
 
 struct symbol symbol_yes = {
 	.name = "y",
+	.type = S_TRISTATE,
 	.curr = { "y", yes },
 	.menus = LIST_HEAD_INIT(symbol_yes.menus),
 	.flags = SYMBOL_CONST|SYMBOL_VALID,
@@ -21,6 +22,7 @@ struct symbol symbol_yes = {
 
 struct symbol symbol_mod = {
 	.name = "m",
+	.type = S_TRISTATE,
 	.curr = { "m", mod },
 	.menus = LIST_HEAD_INIT(symbol_mod.menus),
 	.flags = SYMBOL_CONST|SYMBOL_VALID,
@@ -28,6 +30,7 @@ struct symbol symbol_mod = {
 
 struct symbol symbol_no = {
 	.name = "n",
+	.type = S_TRISTATE,
 	.curr = { "n", no },
 	.menus = LIST_HEAD_INIT(symbol_no.menus),
 	.flags = SYMBOL_CONST|SYMBOL_VALID,
@@ -820,8 +823,7 @@ const char *sym_get_string_value(struct symbol *sym)
 		case no:
 			return "n";
 		case mod:
-			sym_calc_value(modules_sym);
-			return (modules_sym->curr.tri == no) ? "n" : "m";
+			return "m";
 		case yes:
 			return "y";
 		}
-- 
2.40.1


