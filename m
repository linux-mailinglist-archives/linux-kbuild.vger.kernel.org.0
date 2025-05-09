Return-Path: <linux-kbuild+bounces-7066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64AAB1ACC
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 18:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F39361C24C40
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 16:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1C723BD05;
	Fri,  9 May 2025 16:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sa0otFOD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413FB23BCFA;
	Fri,  9 May 2025 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809030; cv=none; b=qKGgl3b2eJfI2f8IpcAM/yvokKcIY56pgE6/selh6mNaUJTs+YwUZE2sk8asCNAGtJXdkAFsI1tF9Hc+R2DmjU0PCSd9k/C4gEDlV1a0BXns3OFWPw2Qcw0BpdUFRuI5C4EAUD7tergGC41/L1Lk01aCpstWtvDgO1vzGNtWCv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809030; c=relaxed/simple;
	bh=VB+M5vAwIzWGp+MpkOLUXHL28PE4kRrexHY6v8U4zLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6fWBLUnsD20AFKMoOE3lEvRugPz+i6nbHqD01bsI+3ydYNVka9KzcSkszZgz8GTBgk0lHijXJtrYIToiirTDefkAwaynWyA1kKUHXRawMz7mL7PHH+13guyFtCz4Xje+Ky00Menqsw/W0oYUkDKyDkhVqF70CSTxFpKE+YPk4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sa0otFOD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7BDC4CEEE;
	Fri,  9 May 2025 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746809029;
	bh=VB+M5vAwIzWGp+MpkOLUXHL28PE4kRrexHY6v8U4zLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sa0otFODOt8Nvv6jJ84Qe0YxJP12vjMXMFZUKA9YT8I7iHFkTaOL9aXouljzZNVvl
	 xxsjJZoVivQkoNluoqS03wdvm6YSR4lMMbZ0l1VBRQzB6BEDoN6UtRdej/A35CaL9V
	 T8ZuThaYGbcNovwENBDut1YreYFPoW0NtmC2WpsfraLhAPBBS//vaZSH9gbwwyIGl5
	 Lxu3pKDkbn/sIiL97sH0c2j9WoAhX+c7z8dLXnpSVdX+hkI6J4YjrJ394L20Kizc17
	 qB6QeXneJl9+5ID8246xvCfpyYMk8OEnPaIDPtYlALp0Wj90484pE8uLzYp15CPox/
	 IH98TZTDtTf4g==
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
Subject: [PATCH v2 6/6] kbuild: Create modules.builtin.modinfo for modpost results
Date: Fri,  9 May 2025 18:42:37 +0200
Message-ID: <20250509164237.2886508-7-legion@kernel.org>
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

Create modules.builtin.modinfo as a combination of modinfo from vmlinux
and the result of generating modalias by modpost.

Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 scripts/Makefile.vmlinux | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 033c22c807b5..7a3a21040c4c 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -70,6 +70,18 @@ endif
 ifdef CONFIG_MODULES
 targets += .vmlinux.export.o
 $(vmlinux-final): .vmlinux.export.o
+
+# .module.builtin.modinfo.modpost
+# ---------------------------------------------------------------------------
+__default: .modules.builtin.modinfo.modpost
+
+OBJCOPYFLAGS_.modules.builtin.modinfo.modpost := -j .modinfo -O binary
+
+targets += .modules.builtin.modinfo.modpost
+.modules.builtin.modinfo.modpost: .vmlinux.export.o FORCE
+	$(call if_changed,objcopy)
+
+modules.builtin.modinfo: .modules.builtin.modinfo.modpost
 endif
 
 ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
@@ -97,15 +109,27 @@ ifdef CONFIG_BUILDTIME_TABLE_SORT
 vmlinux: scripts/sorttable
 endif
 
+# .module.builtin.modinfo.vmlinux
+# ---------------------------------------------------------------------------
+__default: .modules.builtin.modinfo.vmlinux
+
+OBJCOPYFLAGS_.modules.builtin.modinfo.vmlinux := -j .modinfo -O binary
+
+targets += .modules.builtin.modinfo.vmlinux
+.modules.builtin.modinfo.vmlinux: vmlinux.o FORCE
+	$(call if_changed,objcopy)
+
 # module.builtin.modinfo
 # ---------------------------------------------------------------------------
 __default: modules.builtin.modinfo
 
-OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
+quiet_cmd_modules_builtin_modinfo = GEN     $@
+      cmd_modules_builtin_modinfo = \
+	cat $< $(wildcard .modules.builtin.modinfo.modpost) > $@
 
 targets += modules.builtin.modinfo
-modules.builtin.modinfo: vmlinux.o FORCE
-	$(call if_changed,objcopy)
+modules.builtin.modinfo: .modules.builtin.modinfo.vmlinux FORCE
+	$(call if_changed,modules_builtin_modinfo)
 
 # module.builtin
 # ---------------------------------------------------------------------------
-- 
2.49.0


