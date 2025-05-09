Return-Path: <linux-kbuild+bounces-7065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE636AB1AD2
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 18:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99E9C4C22C0
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 16:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB1023A9B4;
	Fri,  9 May 2025 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+lxr3nn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1723A9AD;
	Fri,  9 May 2025 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809027; cv=none; b=UbvWnsmn3uGbve8INTy3wAuKICjMFf5A6RlsZOBUmMxTDhkQeaC42JEj34zOZ1EVMyiVz2bAKOTb1pJ+MFdumsz05bqXCzbGHybdsX7FXHRdbbC1C6z+hiekxvweZo/AHf3oFo2zk6m1870v37Fs5lTQhdeTr+rTFaJjpqUgg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809027; c=relaxed/simple;
	bh=VpdxUksVEEWXN7gV5SmhieXumztwaT1Jbewjkh76gSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KjuuzXFulVCBK4UpttVbpQFe2JhbJ9QflfGU9gqZxN2dMDwWossCsuloIKiuL2s0J/vOgucFlh4Fy8QSySfOuL8gvUMKAPy5GL+Uxf7ZZEXk/zXGtY1jr7zA6Q1tR6Z0gqa4uiuRF+7kcNsxvR36LnVL475ndAvkpMv66BYw2xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+lxr3nn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D79C4CEE4;
	Fri,  9 May 2025 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746809026;
	bh=VpdxUksVEEWXN7gV5SmhieXumztwaT1Jbewjkh76gSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h+lxr3nnoLE9W3DP0165VUm5DF6kc43/iS1aJ/JTf8oOkR+U9UXEEpuZHrNkAk7SL
	 jweuTW5STCk+ZuHdyCzZ9HRYYR4q0kbGZXSZ7t3uy1eJzZF9Zy9tyV1eT/BY3kVICG
	 UTkmBqFlqfpp62Axlx+79OxmRL0RB5plBfKSE1mkp/VNS1+MNh5oOdx99A7WOK7LR2
	 JGlQfx2bBScQfWHwIG3dJT4JdAIiFb0nDj3SAwR01AiDZr7M3lIyqnuPQYgWZoGWh2
	 /vfqNjSnpU3WISvEQ1Yj/ty9TgRt7EvcuOpx9fkDkbeAJmlgkKIiWgadN7WAgaZZVu
	 /Z6nsZdrFHIrA==
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v2 5/6] kbuild: Move modules.builtin.modinfo to another makefile
Date: Fri,  9 May 2025 18:42:36 +0200
Message-ID: <20250509164237.2886508-6-legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745591072.git.legion@kernel.org>
References: <cover.1745591072.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The creation of modules.builtin.modinfo is going to depend on
.vmlinux.export.o so it is worth moving its creation closer to it.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 scripts/Makefile.vmlinux   | 26 ++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_o | 26 +-------------------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b0a6cd5b818c..033c22c807b5 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -97,6 +97,32 @@ ifdef CONFIG_BUILDTIME_TABLE_SORT
 vmlinux: scripts/sorttable
 endif
 
+# module.builtin.modinfo
+# ---------------------------------------------------------------------------
+__default: modules.builtin.modinfo
+
+OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+
+targets += modules.builtin.modinfo
+modules.builtin.modinfo: vmlinux.o FORCE
+	$(call if_changed,objcopy)
+
+# module.builtin
+# ---------------------------------------------------------------------------
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
 # module.builtin.ranges
 # ---------------------------------------------------------------------------
 ifdef CONFIG_BUILTIN_MODULE_RANGES
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 938c7457717e..23c8751285d7 100644
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
 
-# module.builtin.modinfo
-# ---------------------------------------------------------------------------
-
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
-
-targets += modules.builtin.modinfo
-modules.builtin.modinfo: vmlinux.o FORCE
-	$(call if_changed,objcopy)
-
-# module.builtin
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


