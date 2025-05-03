Return-Path: <linux-kbuild+bounces-6906-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F5AA7F78
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 10:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E604650EE
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 08:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7261AF0CE;
	Sat,  3 May 2025 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icAiLkvx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110717A2FC;
	Sat,  3 May 2025 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746261716; cv=none; b=BjgfkHCd6Tgq01bjqRAjaUxORccdUD0kw6N6rPybWcwlOTKgQOnIYvoOhBLfsog+5rUdF4PFtMUaZZX6YuJ5sGnO4qUn7hJ2KtELn/bHwyWAvXIh3pX+kBkajvv6VP9KC5n30VUIVpCjW5gGhRUfchExCNIzHPmE4fGmtCOLrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746261716; c=relaxed/simple;
	bh=+PcCraay1DizFcXkGnQrr4jLbEi5SeYlgRLvxR87H1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8Nt2kfZrmO4XU+HRj5EmJZHy4GOU7jvfGUUB4kCY16pTY/eWv/pyLIcIiJKcDaIz30ZIp4DMhkrpxuXnM4R+hq6KAEeq8NfMyORGa/8v8cHWPDj9JCQTXpjh6adz+iKMC96HCVq3XnkCb2D/Ns6mIQo6JIzUQawJKHUS0ikGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icAiLkvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABD6C4CEE9;
	Sat,  3 May 2025 08:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746261716;
	bh=+PcCraay1DizFcXkGnQrr4jLbEi5SeYlgRLvxR87H1w=;
	h=From:To:Cc:Subject:Date:From;
	b=icAiLkvxWq3doiPO+t5E/kfc2c/7ZDNGG4rWvNXdbSKcmAxQsX3Yylbo/wVxa4HQL
	 Ld/txHQM0xF3Hue7oRrEiwvy+OB8cA3xyG+QPqBQGoCWWy+KXP7KXSoMa6n6S9V2fK
	 JKVSuN4CHm9rpF0D/SEghlW2o8o5ayOvKy++D0rP3YCIxr4kox+L2tVJaAVlgoYIgp
	 al1/rA1hZGr5QwLfniQIvAYf8U9coCjZpxhQ/BeUCFNItMlCeh5JQPQgQ7fr2Py8qc
	 FKLZ33ZsB7I8ENpp7IaqN7ZkB1C8SzWfniK/PAdfFWqetqYlAudr/dKhLYo5+5kVGY
	 ZXr2leGqB6yrw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Richard Weinberger <richard@nod.at>,
	linux-um@lists.infradead.org
Subject: [PATCH] kbuild: introduce include/generated/global-rebuild.h
Date: Sat,  3 May 2025 17:41:43 +0900
Message-ID: <20250503084145.1994176-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sometimes we need to trigger a global rebuild of the kernel tree -
for instance, when any of the GCC plugins changes. [1]

This commit provides a simple mechanism to force a global rebuild
using a single header file.

The top-level Makefile creates include/generated/global-rebuild.h if
it does not exist, and this file is included by all kernel sources.

You can touch it in a build rule when a global rebuild is required.

The following is an example change to the GCC plugin build rule.

  quiet_cmd_plugin_cxx_so_c = HOSTCXX $@
 -      cmd_plugin_cxx_so_c = $(HOSTCXX) $(plugin_cxxflags) $(plugin_ldflags) -o $@ $<
 +      cmd_plugin_cxx_so_c = $(HOSTCXX) $(plugin_cxxflags) $(plugin_ldflags) -o $@ $<; touch include/generated/global-rebuild.h

Link: https://lore.kernel.org/linux-kbuild/CAK7LNATDbxc+3HQ6zoSk9t-Lkf4MSNmEUN6S5EqoVWnBQw_K6g@mail.gmail.com/T/#me069145443a17f0b464c13814424dbba0d970863 [1]
Cc: Kees Cook <kees@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile         | 9 ++++++++-
 arch/um/Makefile | 3 ++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5aa9ee52a765..64811eebd549 100644
--- a/Makefile
+++ b/Makefile
@@ -558,7 +558,8 @@ USERINCLUDE    := \
 		-I$(srctree)/include/uapi \
 		-I$(objtree)/include/generated/uapi \
                 -include $(srctree)/include/linux/compiler-version.h \
-                -include $(srctree)/include/linux/kconfig.h
+                -include $(srctree)/include/linux/kconfig.h \
+                -include $(objtree)/include/generated/global-rebuild.h
 
 # Use LINUXINCLUDE when you must reference the include/ directory.
 # Needed to be compatible with the O= option
@@ -1257,6 +1258,11 @@ endif
 include/config/kernel.release: FORCE
 	$(call filechk,kernel.release)
 
+filechk_empty = printf ''
+
+include/generated/global-rebuild.h: FORCE
+	$(call filechk,empty)
+
 # Additional helpers built in scripts/
 # Carefully list dependencies so we do not try to build scripts twice
 # in parallel
@@ -1273,6 +1279,7 @@ scripts: scripts_basic scripts_dtc
 PHONY += prepare archprepare
 
 archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
+	include/generated/global-rebuild.h \
 	asm-generic $(version_h) include/generated/utsrelease.h \
 	include/generated/compile.h include/generated/autoconf.h \
 	include/generated/rustc_cfg remove-stale-files
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 1d36a613aad8..f564a26c1364 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -73,7 +73,8 @@ USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)/include \
 		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__ \
 		-include $(srctree)/include/linux/compiler-version.h \
-		-include $(srctree)/include/linux/kconfig.h
+		-include $(srctree)/include/linux/kconfig.h \
+		-include $(objtree)/include/generated/global-rebuild.h
 
 #This will adjust *FLAGS accordingly to the platform.
 include $(srctree)/$(ARCH_DIR)/Makefile-os-Linux
-- 
2.43.0


