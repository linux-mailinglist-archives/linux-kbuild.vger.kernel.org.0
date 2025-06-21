Return-Path: <linux-kbuild+bounces-7603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA52AE2951
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 15:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 769567A2EA3
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 13:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE5221B9F6;
	Sat, 21 Jun 2025 13:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHgATPsr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C420D4E1;
	Sat, 21 Jun 2025 13:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514267; cv=none; b=R7pPQxzy2XxP1t0hpmBh70AKHyJ/E6627RIuXUuKNFpfq87wsKBvDMkGDOA3sdZDUg83KDcVtrMrqiGP6er/rAu0M/MXtlZTjVDvWTCp8Z93HaJeqDYXYqm5qyuzrrWWlDh0KuT3QTdaU53mmZ4T3PEWYRH2F2bU0lJhtHqKDtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514267; c=relaxed/simple;
	bh=QcOgqocEZGX7M/SEIk2LBmtO7Cxt9ewPmhV9uu+zKeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JhSmfs/QGC+EUaBAkQJRzsyJQhhYHSaP14z9fAmi/pPLxXXgVHja13muW1ErU93yueJ1etBAxSbrkxuUIl0PQ9bUU2bkR4hH7OV2e6txjlLsEwclGdoR7MLZpRgD/IIYDAKJwlRy8v9B6gybCawXNINlwVNbTLWSEQS5WfcwFNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHgATPsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657D7C4CEED;
	Sat, 21 Jun 2025 13:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750514267;
	bh=QcOgqocEZGX7M/SEIk2LBmtO7Cxt9ewPmhV9uu+zKeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PHgATPsrwCG/JM5poSek8+RUoOLPPenjrnN6sw9ZEThNHG53reF0KHz35aRYLb32P
	 S+m/GkNMaXoM8xT0nSfSajjVLgmHkyzIZpfJ6a2+ZwuccLUixyYxduiFlYJyjaEaHq
	 irzP2OHP0/+SRtuSW/YY//LI2dgA0pTN6T9hQSbma7qAn0uy7h1QOj8kX3yJgZuJE3
	 74gZGkq0jVvzRXCO45KRhF2ZMwVjrEY7x0fZcjBVA8MrdDGsZLjTNC11aBjFVFSD8s
	 Lc86Npa/wAsANJ57XvGd7lqA8ey4NX9EW38By5mf3+gLndeSKX/rsukHo5HZzbL04H
	 BPsaXrwEAc58w==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v4 4/7] kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
Date: Sat, 21 Jun 2025 15:57:16 +0200
Message-ID: <38c1e5cd57158ff433c00e71a437dbab4c0285a8.1750511018.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750511018.git.legion@kernel.org>
References: <cover.1750511018.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

Currently, we assume all the data for modules.builtin.modinfo are
available in vmlinux.o.

This makes it impossible for modpost, which is invoked after vmlinux.o,
to add additional module info.

This commit moves the modules.builtin.modinfo rule after modpost.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 scripts/Makefile.vmlinux   | 26 ++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_o | 26 +-------------------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index e2ceeb9e168d..fdab5aa90215 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
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
2.49.0


