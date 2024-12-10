Return-Path: <linux-kbuild+bounces-5059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 575899EADF1
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 11:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518D01888D46
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 10:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 626641DC9BE;
	Tue, 10 Dec 2024 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVgQP069"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D39578F40;
	Tue, 10 Dec 2024 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733826288; cv=none; b=fl766ADi540Pn6wvf2IjAuP0GvYw3Nhn4SqX2p4BHtN+HOhEwWz2QvX5Okdc8vIHdX6ZgOIcA94zK8CLa7RuaOZTC1jODIeqblsupLMuEAZ2c+OueYJjHkZ8ZZmDR2bBTecK5iZG6i6Adt9SQ5c8yqq46+tEG6cANGRtD0chVRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733826288; c=relaxed/simple;
	bh=nnrUpE9sFrCkqY4+Ciod2ViinqGnUMmjiXJBjBqznnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe3yqdDeNjWgtvamgI5lSsVBk0x604ssmg5IF/A2dfHbTF9yakm16Ctas+ESSE7bHUqcE/YthrDVKBzgSIlDxWaXI8ktgTqhEf8Of3KhWvQijCnyEqVYMDg1xcf4As52tV+n76Z/tUlGslKvPCnNbh/jAXs6z/wnV+OIz4S/p7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVgQP069; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB1FC4CED6;
	Tue, 10 Dec 2024 10:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733826287;
	bh=nnrUpE9sFrCkqY4+Ciod2ViinqGnUMmjiXJBjBqznnc=;
	h=From:To:Cc:Subject:Date:From;
	b=cVgQP069u6ajHn9LWdJeisCooqwRwlg6t1ZcQLRZ/k4LFoqzRexUEjE0kD64llX+J
	 rqESDF1SMkZH1zCuiUrVucajjCFg1QDDgziCGOgwkHdoZKS5DTq8JKrSQMPagzFnfb
	 /wrm7Gh1mVHJ68LBUTMFerB7JtL/YKbt9zHnaZHHzzQ5gvpnWTCMEJ9Hsjsb4iBbwc
	 hmCPdqjIdxki1AC3EaRUvJUC7E8D57dAszogH6mfIWgULHPebUUWvINZlGFBxIma9R
	 1vo5ipK57Qbacf1Wr2rwMmN5+Y//0xrlB5np5saO/NAXNschCvkQd2Rfdn4AYWm7d5
	 w7c/COuZCEvag==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2] kbuild: suppress stdout from merge_config for silent builds
Date: Tue, 10 Dec 2024 19:24:41 +0900
Message-ID: <20241210102442.3390267-1-masahiroy@kernel.org>
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
Tested-by: Leon Romanovsky <leon@kernel.org>
---

Changes in v2:
  - Remove CONFIG_SHELL from Makefile.defconf

 scripts/Makefile.defconf | 13 +++++++------
 scripts/kconfig/Makefile |  4 +++-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
index 226ea3df3b4b..a44307f08e9d 100644
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


