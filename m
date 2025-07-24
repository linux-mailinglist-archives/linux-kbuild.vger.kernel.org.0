Return-Path: <linux-kbuild+bounces-8129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8CB10C06
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B62B4E43BC
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59292E173B;
	Thu, 24 Jul 2025 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0NkHpsQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2732DC347;
	Thu, 24 Jul 2025 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365020; cv=none; b=DFU+uyLU2uE1lrkyPnK+REQ8Vx11D58/0hrpvRt+GjvAa5URbgtJZobMrqCoBdpXb74vVhaXFkC/4ZLuGgbocBUBnHNrfWqvAIUkZ/lDBHkx2vUQ+jH/lgex7naAm5/BluJB2L3NSOTCjnNc4uxlPMPHl7orMKVwEOk0h7Oq/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365020; c=relaxed/simple;
	bh=CQahKUZNepr3ndoD9y9Pqz4UQWbQPmtI3It1pqtZh4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ohiz7rTf28/cbZhe5dGkkzaS65MBXEQvB7nUDxCJX517xZ+F+3CSo0sWzsh5KBdsvnlQZC8s61BK2cdng5ZMM/LjY0at8EUteMckc0cJAUvWta/yTALRm73BHtAqVuezMv30JVNU6LD3mOOlpgQqc4MULIbP7I4UxpK6xxZcNRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0NkHpsQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85030C4CEF6;
	Thu, 24 Jul 2025 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365018;
	bh=CQahKUZNepr3ndoD9y9Pqz4UQWbQPmtI3It1pqtZh4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g0NkHpsQ6hH9+WTPzDtFQjpRxexs48vt9YpnHBan71A4ep0DK+Jp/GKAIv8PYcZPJ
	 zNmu5ItQIkWwnQTSq3UEkzpdRYAEfLyIkIQlGiW2AUTfkKP40nCh7NOPQ6F1NpER6p
	 PNuVIFak2MrgUP/B4ittkOyCJaRahhHLiH0RF6IFcvBB9HKJQZN90E1b9vvxkoBZZ4
	 I9pJ6Zn6Azl937ExoPbKF3/hfYibSakd9V8aTCdk7QNlyMIEZbTvQpyI8El6uSouXj
	 gYKuIgbmXJ3etnEmFU+vJCwcwLOQ2WNGbBA56/C8A6XEAn/hVL3xG6SUoc6eyDIVdG
	 DDoa96C2b6F+A==
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
	Alexey Gladkov <legion@kernel.org>
Subject: [PATCH v5 04/10] kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
Date: Thu, 24 Jul 2025 15:49:41 +0200
Message-ID: <7b5d40bf880bed2281590a55e94771ad2b56763b.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
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
2.50.1


