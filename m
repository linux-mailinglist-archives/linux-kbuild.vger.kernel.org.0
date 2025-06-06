Return-Path: <linux-kbuild+bounces-7380-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8449FACFBDA
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 06:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BC41176CC8
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 04:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520431EB182;
	Fri,  6 Jun 2025 04:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fl3A9eDS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735E1E98E3;
	Fri,  6 Jun 2025 04:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183069; cv=none; b=t1K7SRK+7w59fIDWzSChm8vL9Bq/3EQJySKdZ5rIlomTsUydhfSYPA5ZO5i+2z9JYo2LdlNdC8Bg5upkOe4vmQhQYW0cYFy5pVFtzgnwHTnZmGNJVE1DuA9HAztbeCHxRhkuJRrAfRWsvT5TW3eZs50BC5D2mwdQCXBKegWV0L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183069; c=relaxed/simple;
	bh=UJ3B2wGZA1eu/Vs9p/nH/qeqQ3tcNsCm21mmvFo5xrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOGpKgcyOYkxxRYyvKxtD1vyNmHS6Ak4nlFBOPD9VQrOXxC91RB10cHPufVGvh688xK7cLHMHNugk34sKqRIObM1owS66xJxbn1z6pplFhawJsgP1b2Wugu/dJoqHGgc+gSccsxwBr8ojDXx7FpU975ASbYz14GL33B3A0G9g6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fl3A9eDS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92689C4CEEF;
	Fri,  6 Jun 2025 04:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749183069;
	bh=UJ3B2wGZA1eu/Vs9p/nH/qeqQ3tcNsCm21mmvFo5xrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fl3A9eDSvxErtEYU5DD6xiFELSbvVuf40GV0RQPquknJCOSoWaIQjjsWKuR6C8B7w
	 L3c1krItHKDkS/mLN4wIHk0MHGFIJ+fEHHthE4V7u47o5dK8gR2jKX06nUt3F111DM
	 gZ0MPZwgRyDCxBC+XygLCZufMmPFEkoQprCJP1vdB4UEuk/LrqfRBQh6VzjCfuR99+
	 QzeH/DxAjqq3C46ew3CmmNWb9XXLZVCrq+g2J/7fueoL1aruI8EtC298VkfWN8921R
	 TaWMTLZflvIKBsdvv/jfWO1bDgGcpDttLLQ1yFdlanCoY56/eroTGf5uwKLWMJefwu
	 B/o+tvPKDa9eA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 4/4] kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
Date: Fri,  6 Jun 2025 13:10:26 +0900
Message-ID: <20250606041029.614348-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606041029.614348-1-masahiroy@kernel.org>
References: <20250606041029.614348-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, we assume all the data for modules.builtin.modinfo are
available in vmlinux.o.

This makes it impossible for modpost, which is invoked after vmlinux.o,
to add additional module info.

This commit moves the modules.builtin.modinfo rule after modpost.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.vmlinux   | 28 +++++++++++++++++++++++++++-
 scripts/Makefile.vmlinux_o | 26 +-------------------------
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index e2ceeb9e168d..45597068f11f 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 PHONY := __default
-__default: vmlinux
+__default:
 
 include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
@@ -96,6 +96,32 @@ targets += vmlinux
 vmlinux: vmlinux.unstripped FORCE
 	$(call if_changed,strip_relocs)
 
+# modules.builtin.modinfo
+# ---------------------------------------------------------------------------
+
+OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+
+targets += modules.builtin.modinfo
+modules.builtin.modinfo: vmlinux.unstripped FORCE
+	$(call if_changed,objcopy)
+
+# modules.builtin
+# ---------------------------------------------------------------------------
+
+__default: modules.builtin
+
+# The second line aids cases where multiple modules share the same object.
+
+quiet_cmd_modules_builtin = GEN     $@
+      cmd_modules_builtin = \
+	tr '\0' '\n' < $< | \
+	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
+	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
+
+targets += modules.builtin
+modules.builtin: modules.builtin.modinfo FORCE
+	$(call if_changed,modules_builtin)
+
 # modules.builtin.ranges
 # ---------------------------------------------------------------------------
 ifdef CONFIG_BUILTIN_MODULE_RANGES
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index b024ffb3e201..23c8751285d7 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 PHONY := __default
-__default: vmlinux.o modules.builtin.modinfo modules.builtin
+__default: vmlinux.o
 
 include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
@@ -73,30 +73,6 @@ vmlinux.o: $(initcalls-lds) vmlinux.a $(KBUILD_VMLINUX_LIBS) FORCE
 
 targets += vmlinux.o
 
-# modules.builtin.modinfo
-# ---------------------------------------------------------------------------
-
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
-
-targets += modules.builtin.modinfo
-modules.builtin.modinfo: vmlinux.o FORCE
-	$(call if_changed,objcopy)
-
-# modules.builtin
-# ---------------------------------------------------------------------------
-
-# The second line aids cases where multiple modules share the same object.
-
-quiet_cmd_modules_builtin = GEN     $@
-      cmd_modules_builtin = \
-	tr '\0' '\n' < $< | \
-	sed -n 's/^[[:alnum:]:_]*\.file=//p' | \
-	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$$/.ko/' > $@
-
-targets += modules.builtin
-modules.builtin: modules.builtin.modinfo FORCE
-	$(call if_changed,modules_builtin)
-
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
-- 
2.43.0


