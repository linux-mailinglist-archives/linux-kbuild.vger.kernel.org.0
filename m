Return-Path: <linux-kbuild+bounces-2440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69F92BF2F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 18:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33A2D1F25680
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 16:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571A119E7EF;
	Tue,  9 Jul 2024 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXtQIjKU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A5F19E7EA;
	Tue,  9 Jul 2024 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541239; cv=none; b=g73/zgg9umW9vRX2sJiMwllmFgBWNeslnNBU5tq1o1y4ZPyH2iw7NjG6eNppusBGwVB4Os4f9tvRFzF1pv1IsrFysZ9irj7H1qtqSZYUzEzQx17ynkxw50UQqH9I5/DZJ00u54J0sPuNjLJM8McVzLjeLpMUAkx6rl0Rap0zMas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541239; c=relaxed/simple;
	bh=qwFmGLxVLsc8TBEvebCvtLHS2SudgK+Vr4hd0YC8QJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqD+1ywTUOJR7ZFZPEBcGTj2mOMqGoAcGfptgvYAfG+wd0tpg52Lt5l+Ks9kMJr5gefC4POifG8AqArW9yDbaI+k8XJqEzk7z6hOIi37aJV8klN4Xl4tHRSEc9XIvzZjxN/qgMQTxCLyjv0cfd1yIBlKFJct4oZ0ejnNiiQdPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXtQIjKU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E029C4AF0B;
	Tue,  9 Jul 2024 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541238;
	bh=qwFmGLxVLsc8TBEvebCvtLHS2SudgK+Vr4hd0YC8QJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZXtQIjKUAWzRTRbCnOlFdtNnquVf0BuV/FYLMvs/iwZdua4UOzTt06fh1hQn0kpao
	 A5nMPfq/79g1TI5vOL7yT4Q4lBgtuS5WvbBE+/Sh2lm3Q5FpLg5Lbgn0Nf4WDLAE4l
	 ci7c7WwObCnNUzs/v2bX6tD7w7J5l1l9Wl3kQamQvMTJsfLTKBXFkrHMT/q1WbPe9g
	 KF/IMAHjD50LGDn09zdTEwLFQ3OxdcgApJ6de961qYjVS6POgm+cX8gtdy5JBzLIJr
	 8hGfaytjKWlwhShFZOtRuFKo8w1lImQVFvCDVQq0Si508l7CKsyV5yYp/DhIFN+gni
	 TuH3WPMz8CHvg==
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
	Finn Behrens <me@kloenk.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 12/13] rust: support the new `-Zub-checks` flag
Date: Tue,  9 Jul 2024 18:06:07 +0200
Message-ID: <20240709160615.998336-13-ojeda@kernel.org>
In-Reply-To: <20240709160615.998336-1-ojeda@kernel.org>
References: <20240709160615.998336-1-ojeda@kernel.org>
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
Reviewed-by: Finn Behrens <me@kloenk.dev>
Tested-by: Benno Lossin <benno.lossin@proton.me>
Tested-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile          |  9 +++++++--
 lib/Kconfig.debug | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9044fdb9adb1..4cf3b9799ec9 100644
--- a/Makefile
+++ b/Makefile
@@ -821,10 +821,15 @@ KBUILD_CFLAGS += -Os
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


