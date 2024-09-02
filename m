Return-Path: <linux-kbuild+bounces-3326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD3968C86
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 703A91F22FF4
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C271C62AE;
	Mon,  2 Sep 2024 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W99fTCkD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A321C16C;
	Mon,  2 Sep 2024 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296182; cv=none; b=tqAZAydTQv/kCHL+fsuIO0qJIG2rMTJhbnI+Qlt4BwskgpNJTs8/eLx2HRrIEOSdmQxe7FyliVqBcvHmPZN9Zw54uRSe2iC9s5hsN56gt574aJdLpW3LtO2yGwUjlXRTUHZjY5wGhQO/CZRCPftN/GvWmVEAzjfcDkKK+OVNzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296182; c=relaxed/simple;
	bh=RzgZlfDyLil5uBN/RYf7XolTsi7y3Begl7ZXdDPw9L8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NglJYN+PEX/CLiLRdxFlg21iI7mEPDDgiKhG9bkeH6Mlmnyfxmams2tx8JA0grkllSSMgBOklEHHY4DdtwyQSjbyNgKiWX97zr6EY9TpWnX6XO6jVfPKMWJHbU6lJjkfQhh06aBYerVCjMSl/dhf92OgrHIC8ODm9O6LcKmLUFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W99fTCkD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4209CC4CEC2;
	Mon,  2 Sep 2024 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725296181;
	bh=RzgZlfDyLil5uBN/RYf7XolTsi7y3Begl7ZXdDPw9L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W99fTCkD2FCF+aKv8y2iAJhZVEcRNTxJzBpCFpswxHC3a7Uw3UjdWZtS6IXtsCBxd
	 6yas9AJoTiRFY75kOV3P0+piEJez/qVWBqlgs/F47Y637ktrf9bB0bAiE5NxXZfyga
	 p+EKPM8gPucv1BmMXv20L6dkj7tLaQQmnDBcwA6rwqafJu0nkehDY5fTokJu3rInW0
	 jvLCimNRR/iI8ziVOqUUfJV7vStm0Mu9zp5uPBzYtdz5Fq8hsd+Cb8r5S6ZZnFazYJ
	 ctsKYWIHy+C+wHMmrGaLDFmbGERllojQdyrNF6fSiU2ybapH7cPck/pvKdYHkB1ZIb
	 5SIxSf4fgzkwg==
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
Subject: [PATCH v2 5/6] kbuild: rust: warn if the out-of-tree compiler differs from the kernel one
Date: Mon,  2 Sep 2024 18:55:32 +0200
Message-ID: <20240902165535.1101978-6-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>
References: <20240902165535.1101978-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For out-of-tree modules, in the C side, Kbuild warns if the C compiler
differs from the one used to build the kernel.

Do the same for Rust, except that we add the extra condition that Rust
support was enabled in the kernel.

For instance, the output will look like:

    warning: the Rust compiler differs from the one used to build the kernel
      The kernel was built by: rustc 1.78.0 (9b00956e5 2024-04-29)
      You are using:           rustc 1.79.0 (129f3b996 2024-06-10)

Note that the build will fail later anyway in such a case, since the
Rust compiler checks for incompatible Rust versions, e.g.:

      RUSTC [M] rust-out-of-tree-module/rust_out_of_tree.o
    error[E0514]: found crate `core` compiled by an incompatible version of rustc
      |
      = note: the following crate versions were found:
              crate `core` compiled by rustc 1.78.0 (9b00956e5 2024-04-29): rust/libcore.rmeta
      = help: please recompile that crate using this compiler (rustc 1.79.0 (129f3b996 2024-06-10)) (consider running `cargo clean` first)

Nevertheless, the added warning at the top should hopefully make the
situation clearer.

The extra condition on `CONFIG_RUST=y` is added since otherwise users
would get warnings when a Rust compiler is reachable, e.g. the most
likely case today is that they are building a C module for a kernel that
does not have Rust enabled.

However, if Rust was indeed enabled, then we do print the warning in
all cases, e.g. even if they are building a C module. While it may not
matter in some cases, it may still be a sign that something unexpectedly
changed in the environment they may want to be aware of:

    warning: the Rust compiler differs from the one used to build the kernel
      The kernel was built by: rustc 1.78.0 (9b00956e5 2024-04-29)
      You are using:           rustc 1.79.0 (129f3b996 2024-06-10)
      CC [M]  c-out-of-tree-module/c_out_of_tree.o

Note that the check will also trigger for cases where the user does not
have the Rust compiler installed, including when building a C module:

    warning: the Rust compiler differs from the one used to build the kernel
      The kernel was built by: rustc 1.78.0 (9b00956e5 2024-04-29)
      You are using:
      CC [M]  c-out-of-tree-module/c_out_of_tree.o

Suggested-by: Nicolas Schier <nicolas@fjasle.eu>
Link: https://lore.kernel.org/rust-for-linux/20240817-heavy-dancing-whale-6ae13d@lindesnes/
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1883aeb919a4..e3fcc7028c5f 100644
--- a/Makefile
+++ b/Makefile
@@ -1794,14 +1794,20 @@ clean: private rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modu
 	$(KBUILD_EXTMOD)/compile_commands.json
 
 PHONY += prepare
-# now expand this into a simple variable to reduce the cost of shell evaluations
+# now expand these into simple variables to reduce the cost of shell evaluations
 prepare: CC_VERSION_TEXT := $(CC_VERSION_TEXT)
+prepare: RUSTC_VERSION_TEXT := $(RUSTC_VERSION_TEXT)
 prepare:
 	@if [ "$(CC_VERSION_TEXT)" != "$(CONFIG_CC_VERSION_TEXT)" ]; then \
-		echo >&2 "warning: the compiler differs from the one used to build the kernel"; \
+		echo >&2 "warning: the C compiler differs from the one used to build the kernel"; \
 		echo >&2 "  The kernel was built by: $(CONFIG_CC_VERSION_TEXT)"; \
 		echo >&2 "  You are using:           $(CC_VERSION_TEXT)"; \
 	fi
+	@if [ "$(CONFIG_RUST)" = "y" -a "$(RUSTC_VERSION_TEXT)" != "$(CONFIG_RUSTC_VERSION_TEXT)" ]; then \
+		echo >&2 "warning: the Rust compiler differs from the one used to build the kernel"; \
+		echo >&2 "  The kernel was built by: $(CONFIG_RUSTC_VERSION_TEXT)"; \
+		echo >&2 "  You are using:           $(RUSTC_VERSION_TEXT)"; \
+	fi
 
 PHONY += help
 help:
-- 
2.46.0


