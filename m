Return-Path: <linux-kbuild+bounces-5611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E76A2699F
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 02:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBF3C7A1FC0
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 01:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A279214212;
	Tue,  4 Feb 2025 01:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suEa6m8p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E93421420C;
	Tue,  4 Feb 2025 01:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738631886; cv=none; b=GC9C+kAFGllvobjA+pSZMrSxY17fzTiE21cbE/Kp52SENhhHBsDG8FcNUgp1OJn7QcthT5Cc+puFsOKR103cFLpr8fO+kV0DCzYKTvo860HXrtKWGxbwisamDISc+F6XrAUMQsHKVjacAEhOaJ63Dzl7IG66B5F9j/DDxGxF6aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738631886; c=relaxed/simple;
	bh=rE3MGdpZlRGV8bgwGo6eyO42glJQFq9ze2CSY9FcHSA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=opRP4J5jhF9n63Pb0VHhT6RHZP4klKqMKWCYpBltqJX6BBQffEqJaPPnXDfZoqtXLd8wmGjM7iRGFqQ+i13iXHM5sUcydFqxp/69dW+IG6mpYXW1UvfwewJ/MVRkb/7ivjpqOTWIulk+mGGUD/YGlmq7blAaUkX4O8+2/f2Fge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suEa6m8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1311BC4CEE4;
	Tue,  4 Feb 2025 01:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738631885;
	bh=rE3MGdpZlRGV8bgwGo6eyO42glJQFq9ze2CSY9FcHSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=suEa6m8pDCqg0lHDDhfIBwzMNRYNDJ33YqR/wpDtoi9UezYae54Gug1XmR7SKIsLt
	 spHvnDlWLUe9L9mlWVmwNlcGj0KoHGjKBgcIdPYhFaD1jfxy91DCbG5gbjM2StgQok
	 ELjOxw3q9SzXv9DzMy7Nazx4BGQTsKdXgkCOjPxHbCALsI2EUsMhXzYqaJ0lukAnhx
	 62uWpZqvNZbTJ/IOaQgGBawwSI/1tu6FRHe3dVM76rT2y1KoH/g7p1aexlgzDNKZ8g
	 ogjMgUWfRuJ2bLEswaTDraGf5VHgwnQD9j2uCCQ7nHHcH72zewuB552f7fPL0JWbq4
	 VgDQFAvB7AdXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 3/5] kbuild: suppress stdout from merge_config for silent builds
Date: Mon,  3 Feb 2025 20:17:51 -0500
Message-Id: <20250204011757.2206869-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250204011757.2206869-1-sashal@kernel.org>
References: <20250204011757.2206869-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.12
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 1f937a4bcb0472015818f30f4d3c5546d3f09933 ]

merge_config does not respect the Make's -s (--silent) option.

Let's sink the stdout from merge_config for silent builds.

This commit does not cater to the direct invocation of merge_config.sh
(e.g. arch/mips/Makefile).

Reported-by: Leon Romanovsky <leon@kernel.org>
Closes: https://lore.kernel.org/all/e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: Leon Romanovsky <leon@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/Makefile.defconf | 13 +++++++------
 scripts/kconfig/Makefile |  4 +++-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
index 226ea3df3b4b4..a44307f08e9d6 100644
--- a/scripts/Makefile.defconf
+++ b/scripts/Makefile.defconf
@@ -1,6 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 # Configuration heplers
 
+cmd_merge_fragments = \
+	$(srctree)/scripts/kconfig/merge_config.sh \
+	$4 -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$2 \
+	$(foreach config,$3,$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
+
 # Creates 'merged defconfigs'
 # ---------------------------------------------------------------------------
 # Usage:
@@ -8,9 +13,7 @@
 #
 # Input config fragments without '.config' suffix
 define merge_into_defconfig
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
+	$(call cmd,merge_fragments,$1,$2)
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 endef
 
@@ -22,8 +25,6 @@ endef
 #
 # Input config fragments without '.config' suffix
 define merge_into_defconfig_override
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-Q -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) \
-		$(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
+	$(call cmd,merge_fragments,$1,$2,-Q)
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 endef
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index a0a0be38cbdc1..fb50bd4f4103f 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -105,9 +105,11 @@ configfiles = $(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARC
 all-config-fragments = $(call configfiles,*.config)
 config-fragments = $(call configfiles,$@)
 
+cmd_merge_fragments = $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)
+
 %.config: $(obj)/conf
 	$(if $(config-fragments),, $(error $@ fragment does not exists on this architecture))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)
+	$(call cmd,merge_fragments)
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 PHONY += tinyconfig
-- 
2.39.5


