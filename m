Return-Path: <linux-kbuild+bounces-9473-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44CC45BC8
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1B693A90A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81087301037;
	Mon, 10 Nov 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf4f3vsr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51257156F20;
	Mon, 10 Nov 2025 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768269; cv=none; b=uGlUi0ClZEZcEkJzIrBuYMxb7LWboOm8ZD6jmNVsJwXfeEO5waZPASdrnaFd6Fa+6R8RCap926YoG3DrFWfO4vg/GnxwN491yGtY8BX4c6EVkV0L9wYXUzvtx3azHPqY1SEabNUjU6nfpFnoTOpp7c8foW+4FMhK/nKPR6n+mzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768269; c=relaxed/simple;
	bh=58H+JMh4CFDH/RbW1pyKcBhlkFR++xl6dlt9vwOJ8LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdYJ4qVDU7PVasEUGxZ1D6fRFJjiwU23xZ7+YVK/D4b9Z6vMixZkQ59IlQU0wUl3xUNix6rZ+NVS1fOiLIy5Ajc5htEvY7iI4FNLeqOqHoziEx/azwm5812XC+G1Ogpzhv4aQ9bZFjsHL1T8Dl8O0uQWIFnj83usfYDpo61UawE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf4f3vsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A55C19423;
	Mon, 10 Nov 2025 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768267;
	bh=58H+JMh4CFDH/RbW1pyKcBhlkFR++xl6dlt9vwOJ8LM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cf4f3vsr+wHEqZRWJAr7YHbXJ+ur7hWLMURvgbYpdjcgCXynO9xNFZwckS+SX995U
	 DR7MHW/MBjNEbvHNYeJIV4FnJf8IHGlhZ6MpgGi8WCMCyRE0I5PqjSYYRQNhMGSbRb
	 99hXeg2onvslGR/Bz0rhVWoU/cqqNeTexEJgkQsRxs4azkI5KiEWmmGkEyyO2e+J/m
	 BlgubEdf7ePpCBOev6TclNcWzOW100zMcG9NbSsFFyFpW5IsIgXFeOQG4MNIcT3DTX
	 FKtcm+JjkhS0c8JHNGwSuBSq3Ab/arTlIZ1lSQCN6MpCleQKa5EXDXWtUWqAj1FsFZ
	 adb06rn5Zduiw==
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
	patches@lists.linux.dev
Subject: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
Date: Mon, 10 Nov 2025 10:50:07 +0100
Message-ID: <20251110095025.1475896-3-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the next commits we are introducing `*-{cfgs,skip_flags,flags}`
variables for other crates.

Thus do so here for `core`, which simplifies a bit the `Makefile`
(including the next commit) and makes it more consistent.

This means we stop passing `-Wrustdoc::unescaped_backticks` to `rustc`
and `-Wunreachable_pub` to `rustdoc`, i.e. we skip more, which is fine
since it shouldn't have an effect.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 3e545c1a0ff4..a001aae0da9d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -60,11 +60,20 @@ rustdoc_test_quiet=--test-args -q
 rustdoc_test_kernel_quiet=>/dev/null
 endif
 
-core-cfgs = \
+core-cfgs := \
     --cfg no_fp_fmt_parse
 
 core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
+core-skip_flags := \
+    --edition=2021 \
+    -Wunreachable_pub \
+    -Wrustdoc::unescaped_backticks
+
+core-flags := \
+    --edition=$(core-edition) \
+    $(core-cfgs)
+
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
 rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
@@ -125,8 +134,8 @@ rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean FORCE
 
 # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
 # not be needed -- see https://github.com/rust-lang/rust/pull/128307.
-rustdoc-core: private skip_flags = --edition=2021 -Wrustdoc::unescaped_backticks
-rustdoc-core: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs)
+rustdoc-core: private skip_flags = $(core-skip_flags)
+rustdoc-core: private rustc_target_flags = $(core-flags)
 rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
@@ -508,9 +517,9 @@ $(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
 $(obj)/exports.o: private skip_gendwarfksyms = 1
 
 $(obj)/core.o: private skip_clippy = 1
-$(obj)/core.o: private skip_flags = --edition=2021 -Wunreachable_pub
+$(obj)/core.o: private skip_flags = $(core-skip_flags)
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
-$(obj)/core.o: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs)
+$(obj)/core.o: private rustc_target_flags = $(core-flags)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
     $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
 	+$(call if_changed_rule,rustc_library)
-- 
2.51.2


