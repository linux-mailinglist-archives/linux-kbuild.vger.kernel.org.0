Return-Path: <linux-kbuild+bounces-9630-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECFEC5D6D1
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D56334F0B45
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 13:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1E931B817;
	Fri, 14 Nov 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Nih1bq1L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F8VjkUBJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CC4318149;
	Fri, 14 Nov 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127847; cv=none; b=EjIbBff7BwASnXBKIvSUOvEnb6+pN3nC3E7fH9WtnckMcLIijuTptoEr6D6CT9UAKsh0wqOidocYEBgeZizccEh8xU39WPZNpnfB2fWsTmOTtKwYqQWGP9XVar7/q6BSxti/bSmlW0h/HYVQE72e+dHSK6XOJxO70RY3c4A9SP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127847; c=relaxed/simple;
	bh=F9+bT7WGGhOu7vvM1k3Uh67zlzwYn46SB/5xKsPbNtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gj1VGig5wMWHZUScu59XW8iLLPUtIbcC8HLHNkGUsGC0FI/fsqZZ7RVgNjRZc0p4dajl1TH2Eyz9jx4lV1gTHgu15ZvtlGNFaJXNXJttkk4wQSQ9yqkIEHxqfQEFASUA9KJndN/ZbWEyIs+bkwsAEkw6dZfTvSYyjqr3yV1ssI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Nih1bq1L; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F8VjkUBJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCUSR2noC5KFG4M2iA9U8Wbo/VK0eLEL0lAZQ5ZJtFc=;
	b=Nih1bq1LZ5MdTqkaav7UJq/SEYfw9/7kSjLc7hyp5hqP0rb3K89IubjyINizFvKP1mhUKQ
	z7H1TE4jcdg6YPvVSJqgYgiLNZ48/mw2P/6iGTDhdEhGre6GJlfGXOUDstij7BDTJswuSL
	9eF7mCX86sHTZMEKb+KZwLb8tviAzJBRDeNn6PKQdWEzNvwaQXd6N/MhtkodZIOB3uv2HB
	q/uBJiH4sU4s9pT7rtOIB0hU6lDLH4ZDyD1fWNdnASqhLv6ZW15w/c3DDz13scXY9m7wqe
	3SKkSaL38HbvUQs2KwGG+2FWitHin+Zn6BxvAQ5csAxZYpId3gBBRjBEfTOBQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCUSR2noC5KFG4M2iA9U8Wbo/VK0eLEL0lAZQ5ZJtFc=;
	b=F8VjkUBJqepH3TR1KNI0JgNdy1fOunHkFLZRfcBdp+MceW6wL2qAu4fv3re38QlQTxrsyL
	d4/RvHDhXQo/qSAA==
Date: Fri, 14 Nov 2025 14:43:57 +0100
Subject: [PATCH v3 2/3] init: deduplicate cc-can-link.sh invocations
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-kbuild-userprogs-bits-v3-2-4dee0d74d439@linutronix.de>
References: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
In-Reply-To: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763127841; l=1918;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=F9+bT7WGGhOu7vvM1k3Uh67zlzwYn46SB/5xKsPbNtA=;
 b=blM0JHxbLMB+1l7XXODqi0bopk3bmXGtJha1HKFTUSjNl/aYla6NlS1MAcVxhMOnBZLINOtHC
 gkhIHmpsPOLC6ek67asb04yGbYjJpjnscHsTAxixtdsn0V0pTfra/FW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The command to invoke scripts/cc-can-link.sh is very long and new usages
are about to be added.

Add a helper variable to make the code easier to read and maintain.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 init/Kconfig            | 4 ++--
 scripts/Kconfig.include | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49e7ac930207c9cde8d431d55dc7af..7b722e714d5c5a0580467914b226dc0700ec0797 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -84,8 +84,8 @@ config RUSTC_LLVM_VERSION
 
 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
+	default $(cc_can_link_user,$(m64-flag)) if 64BIT
+	default $(cc_can_link_user,$(m32-flag))
 
 # Fixed in GCC 14, 13.3, 12.4 and 11.5
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e8030e659d6b321acaea1acd42c387a4..d42042b6c9e243b46d1626d892c0c986621ce462 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -65,6 +65,9 @@ cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
 
+# Test whether the compiler can link userspace applications
+cc_can_link_user = $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(1))
+
 rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
 rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 

-- 
2.51.0


