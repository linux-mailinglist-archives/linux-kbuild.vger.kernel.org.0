Return-Path: <linux-kbuild+bounces-2297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055391E7D0
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 20:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AFF0280F25
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 18:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A897172762;
	Mon,  1 Jul 2024 18:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie3BKoZp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7F16F900;
	Mon,  1 Jul 2024 18:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859060; cv=none; b=YfOzSWZ4VIUlYNC3Ns4ih1HVP38hn+e+zdMAYDwhq2HGtGhPkg+oeuVwtycxjB8VpOTwEbsUNFpniU86cKlygdCkpqPVs9w3P1Xlne2pzt2HyNy35I6dtofiBBOMOraYEKHsrT0lcxpg2qPOQ58Ta5DUEaMsetOPHzLzGnnbrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859060; c=relaxed/simple;
	bh=2XqbItBT6W0jpAHdXZZnJ/RMQas8XvOvkK61Z6nFi38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arnQm6ZBMeMRZYBIrc793nrQx9RZZjsCuPn40CrgYmAjGSw1LXy2/VrO9FZnBTmrg73lbG2ZChhGWRai5xL1T7Itx28ndUQ3ICLltTE2nFIBdNayKGMaWNapIECvvhEuv4llEQMAz8aHaWThjIpPby3vxN5ks72yVwC/N9pwes8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie3BKoZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B194C4AF0D;
	Mon,  1 Jul 2024 18:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719859059;
	bh=2XqbItBT6W0jpAHdXZZnJ/RMQas8XvOvkK61Z6nFi38=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ie3BKoZpSSbHPwvXlAwrIkj76dFHILSWUSrvJQjDG5wSUJeaNtdAiWB3o4oxIA744
	 0YANQaccGhL9ybuNh8J0pab4q6wFgljh/vZgfKPjJ1xv2uphVNXtB1586BF3kyoO2T
	 WVXHEkKBlhHR3+eFBBt/I+nPjRPTYpEFLevS53C8zw3ORLKYa9ZUlGAQhSCJFij4wy
	 sWa7c7saZP7EVdDoY7apvC6xsTLiTEJdMw6wS3gQyzCMQP/lGN8BnUfRN8S8IjjW5/
	 /qiUZKSdGBB+RcdiGDOLZFZlxPX+EX7COBYEoaqTnkbQDKudtRvWL8fV0jmceWcMPw
	 A37Wid+wDjVMg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 12/13] rust: support the new `-Zub-checks` flag
Date: Mon,  1 Jul 2024 20:36:22 +0200
Message-ID: <20240701183625.665574-13-ojeda@kernel.org>
In-Reply-To: <20240701183625.665574-1-ojeda@kernel.org>
References: <20240701183625.665574-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust 1.79.0 has introduced a new codegen flag, `-Zub-checks` [1], to
allow to independently configure (from `-Cdebug-assertions`) whether the
extra runtime checks for UB are emitted, in a similar fashion to
`-Coverflow-checks`.

This allows to configure the kernel with only the UB checks enabled,
but not the `debug_assert!`s; or vice versa, e.g. [2].

It also showcases how `RUSTC_VERSION` and the Kbuild macros, introduced
in the previous commit, can be used.

Link: https://github.com/rust-lang/compiler-team/issues/725 [1]
Link: https://godbolt.org/z/jY69ezx5K [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile          |  9 +++++++--
 lib/Kconfig.debug | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3f43f03f855e..c0cb5c237c26 100644
--- a/Makefile
+++ b/Makefile
@@ -820,10 +820,15 @@ KBUILD_CFLAGS += -Os
 KBUILD_RUSTFLAGS += -Copt-level=s
 endif
 
-# Always set `debug-assertions` and `overflow-checks` because their default
-# depends on `opt-level` and `debug-assertions`, respectively.
+# Always set `debug-assertions` because its default depends on `opt-level`.
 KBUILD_RUSTFLAGS += -Cdebug-assertions=$(if $(CONFIG_RUST_DEBUG_ASSERTIONS),y,n)
+
+# Always set `overflow-checks` and `ub-checks` because their default depends on
+# `debug-assertions`.
 KBUILD_RUSTFLAGS += -Coverflow-checks=$(if $(CONFIG_RUST_OVERFLOW_CHECKS),y,n)
+ifeq ($(call rustc-min-version, 107900),y)
+KBUILD_RUSTFLAGS += -Zub-checks=$(if $(CONFIG_RUST_UNDEFINED_BEHAVIOR_CHECKS),y,n)
+endif
 
 # Tell gcc to never replace conditional load with a non-conditional one
 ifdef CONFIG_CC_IS_GCC
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 59b6765d86b8..6b4f512f9e13 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3020,6 +3020,24 @@ config RUST_OVERFLOW_CHECKS
 
 	  If unsure, say Y.
 
+config RUST_UNDEFINED_BEHAVIOR_CHECKS
+	bool "Undefined Behavior checks"
+	depends on RUST && RUSTC_VERSION >= 107900
+	help
+	  Enables rustc's `-Zub-checks` codegen option.
+
+	  This flag allows you to control whether additional runtime checks that
+	  detect some causes of Undefined Behavior at runtime will be emitted.
+	  When enabled, a Rust panic will occur if UB is detected.
+
+	  All checks are generated on a best-effort basis; even if there is a check
+	  implemented for some cause of Undefined Behavior, it may be possible for
+	  the check to not fire.
+
+	  Note that this will apply to all Rust code, including `core`.
+
+	  If unsure, say N.
+
 config RUST_BUILD_ASSERT_ALLOW
 	bool "Allow unoptimized build-time assertions"
 	depends on RUST
-- 
2.45.2


