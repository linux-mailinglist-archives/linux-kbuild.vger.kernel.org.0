Return-Path: <linux-kbuild+bounces-7995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D288B02BCB
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 18:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 138824A823D
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 16:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA4028A1C9;
	Sat, 12 Jul 2025 16:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tK7cRlTp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31E1EA7CE;
	Sat, 12 Jul 2025 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752336091; cv=none; b=k4VEdItjDxO1EI78lk8p+zIbRH5M64nA6wB2Q0+Z61jrkvZMT+LXUb6zfm3fJpt2BUCkK9pRUV9mwuoIK8Sodx0ueFq1gCmDwqC67CnCqwexkA2nWUA5ryZUtHUJ9BLpnt3b5iGDhi4HbZL76Isw952JI+UrH3wqOrWXjmf2rUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752336091; c=relaxed/simple;
	bh=PMTOVbr1r7rTX0XGvBrv0Qgp90NaoreRhPBMkP7o4+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVfbSCxSKzpY4gNGmCSKZ9GpFudXx1Awv6Z0zCXUGuhT3NgJ+9O1TARhX5NaLqcuLh1qmZklG9NG8CbFzTD13vvVm4NZjPCHqONkl2NlQhAEeWuc6aGuJOymjrHgsSw+5Y5Q4/dh+u0o0h3jQtdNEUM7q39YyVCd1N/yXEEnKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tK7cRlTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD18DC4CEF4;
	Sat, 12 Jul 2025 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752336090;
	bh=PMTOVbr1r7rTX0XGvBrv0Qgp90NaoreRhPBMkP7o4+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tK7cRlTpc7X4Y9hYblmchRviWE1ReSfSoMBm/bOS6ZkXn7vbOOYu0Baf6IEXplKmj
	 cesrJdybF2NgoX5HPQAuOFM1gi5d86FqU3VTzMoeYRiaILfezlA4AffXPFbfAZjbQN
	 y95Ma5XsyYgD8bwBmuxyBi0HyFK8uhTbDqIfpeXan523+ma2N++YFMhh3YImJSKAWl
	 7/O/WTzFbpIGLtj+wYIFWeszMM6cmkXt12oanXkRbEkhjGjeWUR1grch5bkgzoGJYj
	 qLN1coj3Bjfef6HaZt4LZ9NvGH+QbazZSC38FT6fS1w35aT+AuXVl9bSGHeLIt0Vfw
	 v5ror+h94+HoQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	David Wood <david@davidtw.co>,
	Wesley Wiser <wwiser@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] rust: use `#[used(compiler)]` to fix build and `modpost` with Rust >= 1.89.0
Date: Sat, 12 Jul 2025 18:01:03 +0200
Message-ID: <20250712160103.1244945-3-ojeda@kernel.org>
In-Reply-To: <20250712160103.1244945-1-ojeda@kernel.org>
References: <20250712160103.1244945-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Starting with Rust 1.89.0 (expected 2025-08-07), the Rust compiler fails
to build the `rusttest` target due to undefined references such as:

    kernel...-cgu.0:(.text....+0x116): undefined reference to
    `rust_helper_kunit_get_current_test'

Moreover, tooling like `modpost` gets confused:

    WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/nova/nova.o
    ERROR: modpost: missing MODULE_LICENSE() in drivers/gpu/nova-core/nova_core.o

The reason behind both issues is that the Rust compiler will now [1]
treat `#[used]` as `#[used(linker)]` instead of `#[used(compiler)]`
for our targets. This means that the retain section flag (`R`,
`SHF_GNU_RETAIN`) will be used and that they will be marked as `unique`
too, with different IDs. In turn, that means we end up with undefined
references that did not get discarded in `rusttest` and that multiple
`.modinfo` sections are generated, which confuse tooling like `modpost`
because they only expect one.

Thus start using `#[used(compiler)]` to keep the previous behavior
and to be explicit about what we want. Sadly, it is an unstable feature
(`used_with_arg`) [2] -- we will talk to upstream Rust about it. The good
news is that it has been available for a long time (Rust >= 1.60) [3].

The changes should also be fine for previous Rust versions, since they
behave the same way as before [4].

Alternatively, we could use `#[no_mangle]` or `#[export_name = ...]`
since those still behave like `#[used(compiler)]`, but of course it is
not really what we want to express, and it requires other changes to
avoid symbol conflicts.

Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc: David Wood <david@davidtw.co>
Cc: Wesley Wiser <wwiser@gmail.com>
Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Link: https://github.com/rust-lang/rust/pull/140872 [1]
Link: https://github.com/rust-lang/rust/issues/93798 [2]
Link: https://github.com/rust-lang/rust/pull/91504 [3]
Link: https://godbolt.org/z/sxzWTMfzW [4]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile           |  1 +
 rust/kernel/firmware.rs |  2 +-
 rust/kernel/kunit.rs    |  2 +-
 rust/kernel/lib.rs      |  3 +++
 rust/macros/module.rs   | 10 +++++-----
 scripts/Makefile.build  |  3 ++-
 6 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 27dec7904c3a..115b63b7d1e3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -194,6 +194,7 @@ quiet_cmd_rustdoc_test = RUSTDOC T $<
 	RUST_MODFILE=test.rs \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) --test $(rust_common_flags) \
+		-Zcrate-attr='feature(used_with_arg)' \
 		@$(objtree)/include/generated/rustc_cfg \
 		$(rustc_target_flags) $(rustdoc_test_target_flags) \
 		$(rustdoc_test_quiet) \
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 2494c96e105f..4fe621f35716 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -202,7 +202,7 @@ macro_rules! module_firmware {
             };
 
             #[link_section = ".modinfo"]
-            #[used]
+            #[used(compiler)]
             static __MODULE_FIRMWARE: [u8; $($builder)*::create(__MODULE_FIRMWARE_PREFIX)
                 .build_length()] = $($builder)*::create(__MODULE_FIRMWARE_PREFIX).build();
         };
diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 4b8cdcb21e77..b9e65905e121 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -302,7 +302,7 @@ macro_rules! kunit_unsafe_test_suite {
                     is_init: false,
                 };
 
-            #[used]
+            #[used(compiler)]
             #[allow(unused_unsafe)]
             #[cfg_attr(not(target_os = "macos"), link_section = ".kunit_test_suites")]
             static mut KUNIT_TEST_SUITE_ENTRY: *const ::kernel::bindings::kunit_suite =
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..e13d6ed88fa6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -34,6 +34,9 @@
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
+// To be determined.
+#![feature(used_with_arg)]
+//
 // `feature(derive_coerce_pointee)` is expected to become stable. Before Rust
 // 1.84.0, it did not exist, so enable the predecessor features.
 #![cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, feature(derive_coerce_pointee))]
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 2ddd2eeb2852..75efc6eeeafc 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -57,7 +57,7 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
                 {cfg}
                 #[doc(hidden)]
                 #[cfg_attr(not(target_os = \"macos\"), link_section = \".modinfo\")]
-                #[used]
+                #[used(compiler)]
                 pub static __{module}_{counter}: [u8; {length}] = *{string};
             ",
             cfg = if builtin {
@@ -249,7 +249,7 @@ mod __module_init {{
                     // key or a new section. For the moment, keep it simple.
                     #[cfg(MODULE)]
                     #[doc(hidden)]
-                    #[used]
+                    #[used(compiler)]
                     static __IS_RUST_MODULE: () = ();
 
                     static mut __MOD: ::core::mem::MaybeUninit<{type_}> =
@@ -273,7 +273,7 @@ mod __module_init {{
 
                     #[cfg(MODULE)]
                     #[doc(hidden)]
-                    #[used]
+                    #[used(compiler)]
                     #[link_section = \".init.data\"]
                     static __UNIQUE_ID___addressable_init_module: unsafe extern \"C\" fn() -> i32 = init_module;
 
@@ -293,7 +293,7 @@ mod __module_init {{
 
                     #[cfg(MODULE)]
                     #[doc(hidden)]
-                    #[used]
+                    #[used(compiler)]
                     #[link_section = \".exit.data\"]
                     static __UNIQUE_ID___addressable_cleanup_module: extern \"C\" fn() = cleanup_module;
 
@@ -303,7 +303,7 @@ mod __module_init {{
                     #[cfg(not(CONFIG_HAVE_ARCH_PREL32_RELOCATIONS))]
                     #[doc(hidden)]
                     #[link_section = \"{initcall_section}\"]
-                    #[used]
+                    #[used(compiler)]
                     pub static __{ident}_initcall: extern \"C\" fn() ->
                         ::kernel::ffi::c_int = __{ident}_init;
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a6461ea411f7..ba71b27aa363 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -312,10 +312,11 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
+#   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.50.1


