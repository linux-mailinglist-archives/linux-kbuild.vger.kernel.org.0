Return-Path: <linux-kbuild+bounces-5035-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AB89E85A1
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 15:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B47F1884CBA
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 14:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DEF143C40;
	Sun,  8 Dec 2024 14:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssPM35nh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8842A1E489;
	Sun,  8 Dec 2024 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733669189; cv=none; b=R3WXrBktZAyzRLveANtDUqdC2a6umtQsfQKVhtcbhCf2VX1qI0Yx1U6DlInHfD6i2wwn7K2Uu8dKYMs53MmPiJ1fLYvllPs0CnDmpJUZOh9MVIJaZX+lSCBelIyUMFKGuohTtjIEDAZOA0Hw0mAM7DyTNIlHA+NjWW24JFzkjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733669189; c=relaxed/simple;
	bh=XGnXVoi6vJ19BMQcQWDR8m7tZFaDn+ql39q0dN/MIrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAdJfp66b7vV2Vl/S9OpM28kixcujYgtMyJEivPn+Z/zN5DuvknMizOzvpdqMvvDOiZ1w5LJMLK6b3yqcDqQI98/5HFmXr4C8oUFCPSCszXncChjqKIBUDKATA5AFDWl6Eu2eQ8qIHSPZVDSEFPRCBLVMuX+TLRc6XdfX9pk+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssPM35nh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A99C4CED2;
	Sun,  8 Dec 2024 14:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733669187;
	bh=XGnXVoi6vJ19BMQcQWDR8m7tZFaDn+ql39q0dN/MIrA=;
	h=From:To:Cc:Subject:Date:From;
	b=ssPM35nhxJoICm2EXJEbm4/dfOZUvLdrjSeqYC9i8sKTjyNCbCReQzsttVBy/91dz
	 kvN2yib7HZPMSROQOi84zkqbSSgA4IBhh5xYeJ28L0DSN788+PJJcxmMikm2a6UVE5
	 4PqHRVadHCRpvrjJ2MSpJ1oENv0jbPELzyx/i6JdbVpGNnuXGb7ZqVXLhBNGhzZw8K
	 ry1BSG6/xnoYkhGwSjdY/CAPRdAk0pSzkE4gsSUApu/CNYF1mOW7am/UmpDMZnYJ7H
	 awpugmTWNvio9LVUZH9qGCpS70VkGUK6HRoAR4Dv31PNREtZWiw2DTfWCBPbF5KnSt
	 IAq4SY42lKO0g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: suppress stdout from merge_config for silent builds
Date: Sun,  8 Dec 2024 23:46:14 +0900
Message-ID: <20241208144622.605523-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

merge_config does not respect the Make's -s (--silent) option.

Let's sink the stdout from merge_config for silent builds.

This commit does not cater to the direct invocation of merge_config.sh
(e.g. arch/mips/Makefile).

Reported-by: Leon Romanovsky <leon@kernel.org>
Closes: https://lore.kernel.org/all/e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.defconf | 13 +++++++------
 scripts/kconfig/Makefile |  4 +++-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
index 226ea3df3b4b..97bc5161d6bf 100644
--- a/scripts/Makefile.defconf
+++ b/scripts/Makefile.defconf
@@ -1,6 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 # Configuration heplers
 
+cmd_merge_fragments = \
+	$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
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
index a0a0be38cbdc..fb50bd4f4103 100644
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
2.43.0


