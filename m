Return-Path: <linux-kbuild+bounces-7283-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC4AC4B2F
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 11:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA68D17C8B4
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 09:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E304254853;
	Tue, 27 May 2025 09:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2NvsH9q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C3A25484A;
	Tue, 27 May 2025 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336906; cv=none; b=UpBqjI6cjOh2bBTq3jGNZM+nr/ftG2idz7y1yf6DErXAmIzFDMREdVmW7OhM90FnV/9rjdRyq/MG8b7yGL7a6l3OL3hdzgnT6grArEe9j2TTWosY98NGAMY6zHYk/2eZndQMZ24JY732ZWyt+d2YQS/WONtgLKwHVEnNpERaun8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336906; c=relaxed/simple;
	bh=VdO5wAhaBHemzC1FBtwJHS2mCJGZ/sVY+nfWpqo8Wew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPT8R0UAb6on9flHWDKMnCKOP0I1ScOXPVKFqSkMeZ/ASDG+tgW++Kd6rp+H8VMZUyq5VTfWXg3NdaHqxaHHClITFr27NMd9hjcLU27g0AyX1dI4lpw0hA+Jjrd9it2R6GXQRi8x/GDRMxXSglHigOhMC4eG7WQXjpOnZtO4Bcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2NvsH9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154A0C4CEEF;
	Tue, 27 May 2025 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748336905;
	bh=VdO5wAhaBHemzC1FBtwJHS2mCJGZ/sVY+nfWpqo8Wew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l2NvsH9qGTZox+nqFTkB8LDxngfyYyc30PfEhu4CRgamM/cxpGUzs+TX30tSlJ0lD
	 VvGjdxHTCvbOhWy/O3rHe5jkXokeV6gsqwAJa2BHxc1EOVzImVRUbhEKpv3tCAq7VE
	 LiYuBBPTNy3ChHdT8peaj4U0OlvaeF+1pVYEZvysyYYtu/u2G17ymCaPTH9bFfX+rF
	 8ortPbjzat2llqBuIBiXboXZqvVO7JTXEC1wQptS63E9KA5so+KIyIOA7Ji794Bc9y
	 tVUGlLjJv4D4qyz5Jil1Zg3bnFlBp1x9spVHxlSm9nRnmdeChHYcweM4XTCdBEQGrE
	 qzJZo8eTIUlZA==
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
Subject: [PATCH v3 5/6] kbuild: Move modules.builtin.modinfo to another makefile
Date: Tue, 27 May 2025 11:07:59 +0200
Message-ID: <1910073cfee59df4a3edb7f724214eeb4b8a3faa.1748335606.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748335606.git.legion@kernel.org>
References: <cover.1748335606.git.legion@kernel.org>
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
 scripts/Makefile.vmlinux   | 24 ++++++++++++++++++++++++
 scripts/Makefile.vmlinux_o | 26 +-------------------------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b64862dc6f08..250c0492b7e0 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -97,6 +97,30 @@ ifdef CONFIG_BUILDTIME_TABLE_SORT
 $(vmlinux-final): scripts/sorttable
 endif
 
+# modules.builtin.modinfo
+# ---------------------------------------------------------------------------
+
+OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+
+targets += modules.builtin.modinfo
+modules.builtin.modinfo: vmlinux.o FORCE
+	$(call if_changed,objcopy)
+
+# modules.builtin
+# ---------------------------------------------------------------------------
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


