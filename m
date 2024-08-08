Return-Path: <linux-kbuild+bounces-2913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C494C6D6
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 00:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C17F7287783
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 22:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6D31662F2;
	Thu,  8 Aug 2024 22:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gj9h9Gix"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF1815DBB6;
	Thu,  8 Aug 2024 22:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155130; cv=none; b=a7zH+Dq1OoQyJmCXwLdf9Up3Tt5XuF3n9iB3fR+BVZ+wksbwoFx82dFPbXUHOzXhDvF5YYyvINt18pxrLKhNm43bOvhW4QrwOccwpO1Uap0Ndmllykzrk68x6ck2insDE0MLx0RYlEnKFcP8LzcmJZLMHNBQIwx85FlFPryX1CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155130; c=relaxed/simple;
	bh=eMcrbKMzXg14IvqJEdwphrNH5oXng/0pxQDFBFqyhJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgSSFj6CSIL8bRqoDwKlBAWMIWjqFRhrudOEV5SqwiQzIWrRn9J0c5j+EJr7zKqHBDscsOdM19wIXExKbxHJVQuBp7U2pYtrWyV3dpM/94o3aK+K57bqEOne4sVUH/pZU4dlMbgstcaDFLrRPzP0CEEW4+9NIo+6B66SszgF7wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gj9h9Gix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362B7C32782;
	Thu,  8 Aug 2024 22:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723155130;
	bh=eMcrbKMzXg14IvqJEdwphrNH5oXng/0pxQDFBFqyhJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gj9h9GixbdlI1aJLW7/1WfMWb21t9bIecPEeihj2PiGhjid3YWsqSHkowuheQhRFj
	 pvcVf96hI2zX8kBiYkQl6m00pnrOGqn7/MFiZUfnpoUfEhH7lIt73l5zmMBQ+P+0SV
	 bc1PheUkxIoe9Bkevym33o7uKi0ZPCAr8CQpktzYwT1EUfZO8tCON3fzQKolMQfVu5
	 fxR/xnIv4yLSj+n8dA1phDlkFnLJV7v3X3uhJ8QE1ZRaEdnZ5vcVpK7Tw5jtccPdvo
	 aUH4JEWsVWGeE8r3fliPG6Sp/spc2pYNMXQKLB44BZBo0ZPUxG2OVpn3+CRuLPZgNz
	 1wHFeyVImGRwQ==
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
Subject: [PATCH 3/6] kbuild: rust: re-run Kconfig if the version text changes
Date: Fri,  9 Aug 2024 00:11:35 +0200
Message-ID: <20240808221138.873750-4-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-1-ojeda@kernel.org>
References: <20240808221138.873750-1-ojeda@kernel.org>
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
Masahiro: I think leaving the `depends on RUST` in `RUSTC_VERSION` is
OK, but since this is different from the C side, please let me know if
you prefer otherwise. Thanks!

 Makefile     | 5 +++--
 init/Kconfig | 4 +++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 8ad55d6e7b60..2b5f9f098b6f 100644
--- a/Makefile
+++ b/Makefile
@@ -648,9 +648,10 @@ endif

 # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
-# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
+# CC_VERSION_TEXT and RUSTC_VERSION_TEXT are referenced from Kconfig (so they need export),
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
+RUSTC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(RUSTC) --version 2>/dev/null | head -n 1))

 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
@@ -671,7 +672,7 @@ ifdef config-build
 # KBUILD_DEFCONFIG may point out an alternative default configuration
 # used for 'make defconfig'
 include $(srctree)/arch/$(SRCARCH)/Makefile
-export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
+export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT RUSTC_VERSION_TEXT

 config: outputmakefile scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
diff --git a/init/Kconfig b/init/Kconfig
index 2f974f412374..b0238c4b6e79 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1926,7 +1926,9 @@ config RUST
 config RUSTC_VERSION_TEXT
 	string
 	depends on RUST
-	default "$(shell,LC_ALL=C $(RUSTC) --version 2>/dev/null | head -n 1)"
+	default "$(RUSTC_VERSION_TEXT)"
+	help
+	  See `CC_VERSION_TEXT`.

 config BINDGEN_VERSION_TEXT
 	string
--
2.46.0

