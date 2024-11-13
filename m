Return-Path: <linux-kbuild+bounces-4671-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6C9C7EE8
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2024 00:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8E57B24F74
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 23:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330BB18FDB0;
	Wed, 13 Nov 2024 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuJW5uEO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0953618F2F6;
	Wed, 13 Nov 2024 23:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731541533; cv=none; b=lPKzKVNw+wMjQkptc3TuLyA2dnnEN30D1NUVKUs8CSiPQE7WsEwFT/jZup3l8czXg/Qw6H8xuBm/hO9RVQtrXJIk58MYftX1/UAciP1/6Gc/hQ8uSkLGq6U7wGlbeFLai1AJHgHS6awbjKEnK8PNTrl0yAPaHpy5pscZf5o5qz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731541533; c=relaxed/simple;
	bh=vPSWjBuFWVQznjZaqIObNUB0TUhuFS1m7kM/on2+uGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHDmd5d1QJWCsh8subep3UWr4weL/yWsnSfGhQfORATRufuZislL5rZwgDLWougrCQ5K+Az7xttOPenY9dK7lXAR3EU98XiZSGdvhpgMT9jxyBD8rsIEBD+irT8dlts/tbzxnxfOCWPsWrSuVdlyrFVhNIq3dUAwhGDIP5HUbmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuJW5uEO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0C2C4CED7;
	Wed, 13 Nov 2024 23:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731541532;
	bh=vPSWjBuFWVQznjZaqIObNUB0TUhuFS1m7kM/on2+uGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fuJW5uEOYa4ULZSQ4d0T5dC5eBfulC8SSSnTskRb8hU4G2Bf8bFCNFTC9M1sy4E7T
	 BubypoRnfktz3sLajPRjUiNAG1B27BZtO8WdxgGooLLFiDzqlKB/BovNMYFRQ1MZcP
	 T/DjyyUv9f7S8o5M6DdDAcmKr6xsmI3psS3O9SGAvEkOmOaO0a2WneNkOLq34bbjXb
	 5QRTmMrDjhHYjdMb/omNWFRgjpF9o848bgamKCI+CvMSdZxl7ux4cQbhcYWdVkk9B0
	 OomDImTb6TEeFu4N9B87oC+eFeoiicvB3ke6SnAvrwhuAAEWwqSn4hkmt6QCVuBvVw
	 gixl1yXPnGOAg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Borislav Petkov <bp@alien8.de>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Marco Elver <elver@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: move cmd_cc_o_c and cmd_as_o_S to scripts/Malefile.lib
Date: Thu, 14 Nov 2024 08:45:21 +0900
Message-ID: <20241113234526.402738-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241113234526.402738-1-masahiroy@kernel.org>
References: <20241113234526.402738-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmd_cc_o_c and cmd_as_o_S macros are duplicated in
scripts/Makefile.{build,modfinal,vmlinux}.

This commit factors them out to scripts/Makefile.lib.

No functional changes are intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build    |  8 --------
 scripts/Makefile.lib      | 12 ++++++++++++
 scripts/Makefile.modfinal |  6 ++----
 scripts/Makefile.vmlinux  |  8 +-------
 4 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1aa928a6fb4f..24e10c821461 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -141,11 +141,6 @@ ifdef CONFIG_LTO_CLANG
 cmd_ld_single_m = $(if $(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
 endif
 
-quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
-      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
-		$(cmd_ld_single_m) \
-		$(cmd_objtool)
-
 ifdef CONFIG_MODVERSIONS
 # When module versioning is enabled the following steps are executed:
 # o compile a <file>.o from <file>.c
@@ -336,9 +331,6 @@ cmd_cpp_s_S       = $(CPP) $(a_flags) -o $@ $<
 $(obj)/%.s: $(obj)/%.S FORCE
 	$(call if_changed_dep,cpp_s_S)
 
-quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
-      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
-
 ifdef CONFIG_ASM_MODVERSIONS
 
 # versioning matches the C process described above, with difference that
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5660dfc9ed36..73e385946855 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -298,6 +298,18 @@ $(foreach m, $1, \
 	$(addprefix $(obj)/, $(call suffix-search, $(patsubst $(obj)/%,%,$m), $2, $3))))
 endef
 
+# Build commads
+# ===========================================================================
+# These are shared by some Makefile.* files.
+
+quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
+      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
+		$(cmd_ld_single_m) \
+		$(cmd_objtool)
+
+quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
+
 # Copy a file
 # ===========================================================================
 # 'cp' preserves permissions. If you use it to copy a file in read-only srctree,
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index bab53884f7e3..d0153d033bbb 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -9,7 +9,7 @@ __modfinal:
 include $(objtree)/include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
-# for c_flags
+# include some build commands
 include $(srctree)/scripts/Makefile.lib
 
 # find all modules listed in modules.order
@@ -23,9 +23,7 @@ modname = $(notdir $(@:.mod.o=))
 part-of-module = y
 GCOV_PROFILE := n
 KCSAN_SANITIZE := n
-
-quiet_cmd_cc_o_c = CC [M]  $@
-      cmd_cc_o_c = $(CC) $(filter-out $(CC_FLAGS_CFI), $(c_flags)) -c -o $@ $<
+ccflags-remove-y := $(CC_FLAGS_CFI)
 
 %.mod.o: %.mod.c FORCE
 	$(call if_changed_dep,cc_o_c)
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 9ef0480ed755..1652561896eb 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -6,20 +6,14 @@ __default: vmlinux
 include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
 
-# for c_flags
+# include some build commands
 include $(srctree)/scripts/Makefile.lib
 
 targets :=
 
-quiet_cmd_cc_o_c = CC      $@
-      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
-
 %.o: %.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
-quiet_cmd_as_o_S = AS      $@
-      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
-
 %.o: %.S FORCE
 	$(call if_changed_dep,as_o_S)
 
-- 
2.43.0


