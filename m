Return-Path: <linux-kbuild+bounces-5577-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ED0A23EF0
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 15:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9390518846FC
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 14:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E031C5F2F;
	Fri, 31 Jan 2025 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLntDxYQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999221B6D14;
	Fri, 31 Jan 2025 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332256; cv=none; b=r3FoSyIJdZAsXGkVE/esyP1iOGVbGIG9B7trY5/KYwkxKuSnD7VXCO7Z3zAdYJIFt7i7jV72R0P2X/OY9GlmLiLF5+0J2yEHwmxrgd5dGxu4GR9uZeF6W3JeDnR/1//3bhZAfqv60Yng2Y2nmsic1kHx6mwd5+KmDFAzEuPfBng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332256; c=relaxed/simple;
	bh=Zw7ma0FyaNq+jAL6401nPwzRi2TJBETzUTskswEzp0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j18EZmjGBLE9tWTPG26+Gwn37hEyuriqdTl6jlLxAkY7+KRFk/rNiXyuxN8sTRhpYsZu//9vpflV13CnF2lyTzCsMm3FCIwpBGJw10LYamjXpSamw435hUwRdEtVQO35ZUI/+nOPkM/xayyDqeeDM02xNPpqGQhFboWX8JIelvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLntDxYQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7B4C4CED1;
	Fri, 31 Jan 2025 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738332255;
	bh=Zw7ma0FyaNq+jAL6401nPwzRi2TJBETzUTskswEzp0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=gLntDxYQIgKOTPsCEb70KilwvnTF/KQof4kkVU2JvVEwRICK/LKMkxT78FhTobS2z
	 HxKvXLBKKVGPXydMMhuH/YbFQ1Gqh57NaGS++dr2wDCNmEC7iCBVnLJASQig3rMP0h
	 i4u3wdzz+XV+12nrfovNs1ita+t8h/xa0H0Kxy5vNfGPBrdwdx4pAsjDvZYF5Uodqy
	 18++TLPrKwHZV5ozEqxNd2Sz3/wwfkoTBPi1J3gIczL3rsNCa3glctjgCsPZh7fxur
	 PUi3ABpkLP15ULsH6k8oD8kMimPjA/Y2z1W5dCRidslnchB7vCK6983cCmv1eWyMXp
	 L+WF7dSmfEDYA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	llvm@lists.linux.dev
Subject: [PATCH] kbuild: fix Clang LTO with CONFIG_OBJTOOL=n
Date: Fri, 31 Jan 2025 23:04:01 +0900
Message-ID: <20250131140407.1392008-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit bede169618c6 ("kbuild: enable objtool for *.mod.o and
additional kernel objects"), Clang LTO builds do not perform any
optimizations when CONFIG_OBJTOOL is disable (e.g., for ARCH=arm64).
This is because every LLVM bitcode file is immediately converted to
ELF format before the object files are linked together.

This commit fixes the breakage.

Fixes: bede169618c6 ("kbuild: enable objtool for *.mod.o and additional kernel objects")
Reported-by: Yonghong Song <yonghong.song@linux.dev>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build |  2 ++
 scripts/Makefile.lib   | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 81d9dacad03c..993708d11874 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -194,7 +194,9 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
 
 is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
 
+ifdef CONFIG_OBJTOOL
 $(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
+endif
 
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 cmd_warn_shared_object = $(if $(word 2, $(modname-multi)),$(warning $(kbuild-file): $*.o is added to multiple modules: $(modname-multi)))
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da..2e280a02e9e6 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -287,6 +287,8 @@ delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT))
 cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
 cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
 
+objtool-enabled := y
+
 endif # CONFIG_OBJTOOL
 
 # Useful for describing the dependency of composite objects
@@ -302,11 +304,11 @@ endef
 # ===========================================================================
 # These are shared by some Makefile.* files.
 
-objtool-enabled := y
-
 ifdef CONFIG_LTO_CLANG
-# objtool cannot process LLVM IR. Make $(LD) covert LLVM IR to ELF here.
-cmd_ld_single = $(if $(objtool-enabled), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
+# Run $(LD) here to covert LLVM IR to ELF in the following cases:
+#  - when this object needs objtool processing, as objtool cannot process LLVM IR
+#  - when this is a single-object module, as modpost cannot process LLVM IR
+cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
 endif
 
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
-- 
2.43.0


