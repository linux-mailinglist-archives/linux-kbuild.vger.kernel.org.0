Return-Path: <linux-kbuild+bounces-3077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F514955BBB
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 09:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53C4E1F218B7
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 07:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2FE13FEE;
	Sun, 18 Aug 2024 07:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osKIekGk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6732C10A1E;
	Sun, 18 Aug 2024 07:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723964862; cv=none; b=j24eF8uxqVuTfz4VO1PAGmDiZIf94IUfz/ghoaZJ0bgW5F3JOh33nNOuz2KHxxLwc14oG4RFVWnqISwh1iyzoEf85o1HhGdYfMYjc0z6+ANw9MzxhnTSqJxyxq2mpGciJj7eHu9XTODYV2fxY/I6KgCBRHGo4eqwcTnyaZJ8Z3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723964862; c=relaxed/simple;
	bh=OBq8rvJ/pK36nECNISPUBj2TcZ/Fc5LcMSchnCS7Wh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X6P8CWsp7Mr3UpCdlXZq/ThAPbkOk4DmyxGLdL9RbO6aw1Be5kPWjDhuK7RhH/LmCkkPIWQkjyUZ50cU0ZRJpPbbjUtYOg1XH/pg7bjEhZEmBhyN8bP5mRgDGPrv039Xugtwww8mNaap+7yLzXuT0J97nSb/viz5yzI3/dh13uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osKIekGk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBBFC32786;
	Sun, 18 Aug 2024 07:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723964861;
	bh=OBq8rvJ/pK36nECNISPUBj2TcZ/Fc5LcMSchnCS7Wh0=;
	h=From:To:Cc:Subject:Date:From;
	b=osKIekGkH75RgI2RAYt9FFZyVf5ZsJm9qqMu5KfkctPbb61GnSJt2fW4CXytFYxsK
	 WyQ2Zqxk0K4eH4OXG5nJpj47GMYvzRZ+VxjjVT7/Dpc9WrYU/HVdwDzINK5+YupoQj
	 1tVJpjkP62wUC2lVLCtmpfNW2O1W14dTsVvFWQTDhrMItig6lucjTd20zn900BP/+a
	 oyvH1DHiBFcNdcT1VvPBzkf7pB4Xe4FC2BzW1ILGFOQAelbTGqNjFdWeKNzXBrchtG
	 O3YQSCwjvnYUYMcRdk8KoWuoINYPfMeJPHIZqwUrP4nnQY94RYt7uSFeMqEz9PnZ69
	 SLJDyVi6pUhmA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: fix typos "prequisites" to "prerequisites"
Date: Sun, 18 Aug 2024 16:07:11 +0900
Message-ID: <20240818070736.80286-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This typo in scripts/Makefile.build has been present for more than 20
years. It was accidentally copy-pasted to other scripts/Makefile.* files.
Fix them all.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build     | 2 +-
 scripts/Makefile.modfinal  | 2 +-
 scripts/Makefile.vmlinux   | 2 +-
 scripts/Makefile.vmlinux_o | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index efacca63c897..a5ac8ed1936f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -487,7 +487,7 @@ $(subdir-ym):
 	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
 	$(filter $@/%, $(single-subdir-goals))
 
-# Add FORCE to the prequisites of a target to force it to be always rebuilt.
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
 PHONY += FORCE
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 1fa98b5e952b..306a6bb86e4d 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -62,7 +62,7 @@ endif
 
 targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
 
-# Add FORCE to the prequisites of a target to force it to be always rebuilt.
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
 PHONY += FORCE
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 49946cb96844..5ceecbed31eb 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -33,7 +33,7 @@ targets += vmlinux
 vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 
-# Add FORCE to the prequisites of a target to force it to be always rebuilt.
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
 PHONY += FORCE
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 6de297916ce6..d64070b6b4bc 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -87,7 +87,7 @@ targets += modules.builtin
 modules.builtin: modules.builtin.modinfo FORCE
 	$(call if_changed,modules_builtin)
 
-# Add FORCE to the prequisites of a target to force it to be always rebuilt.
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
 PHONY += FORCE
-- 
2.43.0


