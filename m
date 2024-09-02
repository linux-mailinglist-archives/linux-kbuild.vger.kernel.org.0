Return-Path: <linux-kbuild+bounces-3323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C69968C7B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB06E1F23028
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E351AB6ED;
	Mon,  2 Sep 2024 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpMpWZ3a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A868E1AB6E8;
	Mon,  2 Sep 2024 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296167; cv=none; b=Wz+eo7g/1rLgWJ6XyL3z33oRPHjWR5xueSFpjY7Q5Jz4iTdq6wBS9x9deXeVD8prh7mwnepPPmZMz6b71KhXXmNVf6Xd8mX+r5U1yCS6umLZolcY8al0VYEXRGY/eLpSJYKHLPKNpBRtpKWuyje3k1MkcgMcWAe+U25oJeyFKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296167; c=relaxed/simple;
	bh=6+P3G2uD3pU9h/ana8iXMMrjSzmZVYjkyTEYm9ga1t8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IVPMkktFzz0MIYNmSV3Lei25eVtFYzesM1ehDZVqWswSJ7L8tGiLh1CPbfGZWe2Ethdm/HWlScLZnLDdW5ig//LUgrkdhk/mq5qenuSyVO+1jrSN+M5hclJ1zqs4P6GsEqGZfq0/t1JN6VWKHPpJChSzTpDCzbo4md/srUdxWfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpMpWZ3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092E3C4CEC2;
	Mon,  2 Sep 2024 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725296167;
	bh=6+P3G2uD3pU9h/ana8iXMMrjSzmZVYjkyTEYm9ga1t8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fpMpWZ3amZnsYF+/Hq6C7vvIZQcT6puXcP8Z4IH6bOZg+GfiQM0RI/NyhIbaZ0TVm
	 BXP44wKSXyHA02RSHnbkBY8qxHtpK1s9LxkFERwZZXejzv6cY17ZGlqDJYH5xWe5Ly
	 fQMr1rVU349JahUPvZIbUbS7HgyEWysYKtk2Vr7Jf6Pt9FallMDQQD3IN5f4jxuS9L
	 lEdb2eHS5L/mOQyJObzjJtbBwEKEDinc1xAb5Ks8i5scDCTha3j7O/rDkyzXBCsME9
	 O0mGaEBT1s9f149N0ktdfGv+2gJh4Yr9bbLl6ijHBVTRT4QKw6c9sdUSquNyxzvd+Z
	 XaRVP8nifz6zQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 2/6] kbuild: rust: re-run Kconfig if the version text changes
Date: Mon,  2 Sep 2024 18:55:29 +0200
Message-ID: <20240902165535.1101978-3-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>
References: <20240902165535.1101978-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-run Kconfig if we detect the Rust compiler has changed via the version
text, like it is done for C.

Unlike C, and unlike `RUSTC_VERSION`, the `RUSTC_VERSION_TEXT` is kept
under `depends on RUST`, since it should not be needed unless `RUST`
is enabled.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile     | 8 +++++---
 init/Kconfig | 4 +++-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 68ebd6d6b444..1883aeb919a4 100644
--- a/Makefile
+++ b/Makefile
@@ -648,9 +648,11 @@ endif
 
 # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
-# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
-# and from include/config/auto.conf.cmd to detect the compiler upgrade.
+# CC_VERSION_TEXT and RUSTC_VERSION_TEXT are referenced from Kconfig (so they
+# need export), and from include/config/auto.conf.cmd to detect the compiler
+# upgrade.
 CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
+RUSTC_VERSION_TEXT = $(subst $(pound),,$(shell $(RUSTC) --version 2>/dev/null))
 
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
@@ -671,7 +673,7 @@ ifdef config-build
 # KBUILD_DEFCONFIG may point out an alternative default configuration
 # used for 'make defconfig'
 include $(srctree)/arch/$(SRCARCH)/Makefile
-export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
+export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT RUSTC_VERSION_TEXT
 
 config: outputmakefile scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
diff --git a/init/Kconfig b/init/Kconfig
index 38c1cfcce821..c6b744a48dcc 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1927,7 +1927,9 @@ config RUST
 config RUSTC_VERSION_TEXT
 	string
 	depends on RUST
-	default "$(shell,$(RUSTC) --version 2>/dev/null)"
+	default "$(RUSTC_VERSION_TEXT)"
+	help
+	  See `CC_VERSION_TEXT`.
 
 config BINDGEN_VERSION_TEXT
 	string
-- 
2.46.0


