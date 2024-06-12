Return-Path: <linux-kbuild+bounces-2092-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CD904A8B
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 07:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C85E284937
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 05:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A958E2F50A;
	Wed, 12 Jun 2024 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLfV0A3Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822AF2D057;
	Wed, 12 Jun 2024 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718168584; cv=none; b=SkURDJkqOmWrquvaC3L401zM7vt4h+0UjEafbukGh+1BOdBA1OptCw4Np/+PCSqPgm17xn4iPnGm0CdcbFFoSkK0qlm+gXRcUZGNpFPvzpbCQGMJ3g9oWmj37B0KKrDAO427sI0CJ4+K3KlxeOgSAll5c1mAvuZkxmwUqOQEBT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718168584; c=relaxed/simple;
	bh=Hdj1hfWIwNnT4QKFFbAGuif/SUHOpPIdfT5rD392TDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dlhxpjc3LDEH5BWC4Q54o0E3hRP1lwDtQzLCWvH0JXp5G5FTaYep+iRbZedBvg3OXIzmSynaDi5nl9tfHuvXdEGWHjehShAWMOt1cTkou4ZK7PZWndDfJFZ8eUnLja8n+OKjUToJ4QmzkfGPg6DM6pl2ywMRU873fE69+JP/oxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLfV0A3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 703F4C32786;
	Wed, 12 Jun 2024 05:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718168584;
	bh=Hdj1hfWIwNnT4QKFFbAGuif/SUHOpPIdfT5rD392TDo=;
	h=From:To:Cc:Subject:Date:From;
	b=vLfV0A3Zr0eO3WSn0K5XshaIpl7E/RxZN9sgOucOteWyLYJ7RkWwiJsHznJufS2bg
	 U7PQd1z7cec74N0AmbxmvYY1ubQGZ4qGdUFzcUQrLJm73NuExeXZcecRMMOKeLEH/l
	 hVXBNJgcryIQ/ZUQomeN08XMVMwsvkVVxRbqzEp3TgWRUyUsQzEmYm6bibZyr1w1K6
	 PLLTbLTT+6bM7KJGpWcw2aMOE0Dg4WSutOWsi1ISUYbbMJ+G9nb9tS3G6bj2LUfX4y
	 kF6ouVSS13azcymjOujfpsv3YMfxCO6m0Mq98NJau6R5d2xMrVenmC8a5+FU5/xJaD
	 kk3Burl6eARaw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: [PATCH] x86/kconfig: add as-instr64 macro to properly evaluate AS_WRUSS
Date: Wed, 12 Jun 2024 14:02:55 +0900
Message-ID: <20240612050257.3670768-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some instructions are only available on the 64-bit architecture.

Bi-arch compilers that default to -m32 need the explicit -m64 option
to evaluate them properly.

Fixes: 18e66b695e78 ("x86/shstk: Add Kconfig option for shadow stack")
Reported-by: Dmitry Safonov <0x7f454c46@gmail.com>
Closes: https://lore.kernel.org/all/20240612-as-instr-opt-wrussq-v2-1-bd950f7eead7@gmail.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/Kconfig.assembler | 2 +-
 scripts/Kconfig.include    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
index 59aedf32c4ea..6d20a6ce0507 100644
--- a/arch/x86/Kconfig.assembler
+++ b/arch/x86/Kconfig.assembler
@@ -36,6 +36,6 @@ config AS_VPCLMULQDQ
 	  Supported by binutils >= 2.30 and LLVM integrated assembler
 
 config AS_WRUSS
-	def_bool $(as-instr,wrussq %rax$(comma)(%rbx))
+	def_bool $(as-instr64,wrussq %rax$(comma)(%rbx))
 	help
 	  Supported by binutils >= 2.31 and LLVM integrated assembler
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3ee8ecfb8c04..3500a3d62f0d 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -33,7 +33,8 @@ ld-option = $(success,$(LD) -v $(1))
 
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) $(2) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o /dev/null -)
+as-instr64 = $(as-instr,$(1),$(m64-flag))
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)
-- 
2.43.0


