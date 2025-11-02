Return-Path: <linux-kbuild+bounces-9365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A65C29730
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 22:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7993E4E9566
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 21:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263001DB375;
	Sun,  2 Nov 2025 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNK58TLC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B1E1F37D4;
	Sun,  2 Nov 2025 21:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762119008; cv=none; b=n81yNzALCJC1bnHz1BvW7TGPD8KJvLsHPzUNfk+7s21VauvAg2ozuMxs2cbrnskEP3/UMskG2r4vYLKGy5sLyH0x0HnwPEcocH/2DojBhaizdrEtAg5QWZP4Pqv3D7OPD5w1woCPUm/Fd04muqdOyuADmTmbVOvbMnyjS3cvmEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762119008; c=relaxed/simple;
	bh=CMt3hSc6+1N7XcmiQfEo1ARISxV/1YKl1tb5rGl5dzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhCKr2pZ5N/iknJNHcboHf48fj6NcmtCzk4wiNwSq3cxTn2eRmRcZCXdcAELM3QoAB2o0GhMsGnwWPIVowJRAY7nu5+lPwQGqsfka803lbP/QBfs/BFhYqIzpztPXlVvGgaLitMfaRwOSanOLPLQUrTYh4G0lElmyix2mWr2A8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNK58TLC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6F8C4CEF7;
	Sun,  2 Nov 2025 21:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762119005;
	bh=CMt3hSc6+1N7XcmiQfEo1ARISxV/1YKl1tb5rGl5dzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WNK58TLCLVVgs2Y6/dXmejeCtwjSc7J6bYXdG09ehTGfHxrJQNLUVtNRX3KdWIUy7
	 pJFK5FU3sj8csv2FFPJwRav1Vw+mYjqZbHHJciQpjLLJKuvCP26DyQWeraZ8CHk88A
	 NUgsZjrRb+HY3X521YN5LxsveUu1IFO1AOcSmleKf68dhyw2gw8uEb5PKAGvd1KJ05
	 EPmNYOTf0CntKpp6v2UGPhAf1Msl1UMhavd3g2msCWXQVBydI/M9v5uVzkKJT69JWj
	 gxWqYCRpK4Fpw+cdk4BjH2GhXr8cYkdN0oTnf2ERF7pRRcw6LZ6lNKqur3ESwg0Qgj
	 xvpq4aRRcCvcw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 2/2] rust: kbuild: workaround `rustdoc` doctests modifier bug
Date: Sun,  2 Nov 2025 22:28:53 +0100
Message-ID: <20251102212853.1505384-2-ojeda@kernel.org>
In-Reply-To: <20251102212853.1505384-1-ojeda@kernel.org>
References: <20251102212853.1505384-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `rustdoc` modifiers bug [1] was fixed in Rust 1.90.0 [2], for which
we added a workaround in commit abbf9a449441 ("rust: workaround `rustdoc`
target modifiers bug").

However, `rustdoc`'s doctest generation still has a similar issue [3],
being fixed at [4], which does not affect us because we apply the
workaround to both, and now, starting with Rust 1.91.0 (released
2025-10-30), `-Zsanitizer` is a target modifier too [5], which means we
fail with:

      RUSTDOC TK rust/kernel/lib.rs
    error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `kernel`
     --> rust/kernel/lib.rs:3:1
      |
    3 | //! The `kernel` crate.
      | ^
      |
      = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
      = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-address` in dependency `core`
      = help: set `-Zsanitizer=kernel-address` in this crate or unset `-Zsanitizer` in `core`
      = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error

A simple way around is to add the sanitizer to the list in the existing
workaround (especially if we had not started to pass the sanitizer
flags in the previous commit, since in that case that would not be
necessary). However, that still applies the workaround in more cases
than necessary.

Instead, only modify the doctests flags to ignore the check for
sanitizers, so that it is more local (and thus the compiler keeps checking
it for us in the normal `rustdoc` calls). Since the previous commit
already treated the `rustdoc` calls as kernel objects, this should allow
us in the future to easily remove this workaround when the time comes.

By the way, the `-Cunsafe-allow-abi-mismatch` flag overwrites previous
ones rather than appending, so it needs to be all done in the same flag.
Moreover, unknown modifiers are rejected, and thus we have to gate based
on the version too.

Finally, `-Zsanitizer-cfi-normalize-integers` is not affected, so it is
not needed in the workaround.

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Link: https://github.com/rust-lang/rust/issues/144521 [1]
Link: https://github.com/rust-lang/rust/pull/144523 [2]
Link: https://github.com/rust-lang/rust/issues/146465 [3]
Link: https://github.com/rust-lang/rust/pull/148068 [4]
Link: https://github.com/rust-lang/rust/pull/138736 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5de103e20841..ce6d9c9d9727 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -69,6 +69,9 @@ core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 # the time being (https://github.com/rust-lang/rust/issues/144521).
 rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
 
+# Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
+doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
+
 # `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
 # since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
 # 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaround both
@@ -236,7 +239,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 		--extern bindings --extern uapi \
 		--no-run --crate-name kernel -Zunstable-options \
 		--sysroot=/dev/null \
-		$(rustdoc_modifiers_workaround) \
+		$(doctests_modifiers_workaround) \
 		--test-builder $(objtree)/scripts/rustdoc_test_builder \
 		$< $(rustdoc_test_kernel_quiet); \
 	$(objtree)/scripts/rustdoc_test_gen
-- 
2.51.2


