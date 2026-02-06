Return-Path: <linux-kbuild+bounces-11062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDlDBjshhmkCKAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11062-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 18:13:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D5100CA2
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 18:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A2763004F3E
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 17:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F8A36C0C7;
	Fri,  6 Feb 2026 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmgqY6VG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8569232A3DA;
	Fri,  6 Feb 2026 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398007; cv=none; b=S81IilJ1ygV28fntG7Lobh8ZGVGAscH3anBEqQr1nQZHns3f5tJdfGx0S4UBWgfeQ/V7SmVJc+S9XQxlhDGDjl2Pp2c79GmCfF0MIaso/IiOysHh1vhRINrVPMaZUplaZc0VueEO+93m9aZ2vnrtH4nCx3xjfQmAsm+VxoqTelU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398007; c=relaxed/simple;
	bh=hO4tBjygwuiiOOuexB7mNw6dGV6JHgqb6JKdmAirzMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbVS2OjDrUAiW+Cgn8OPBA07sSvhb0Qo07v1XI/YH1VZ+cSazUUKOrwrjwieY/j9QQ0IgYVgR8HYIp7QDRgWXT3QRe7JFTXYwrUaGhTjaS8pzP88JXUJCFN0L9/nJrY4qHDA3ZSpBE66Uqdf/2MB9hoOTG6Zbw607H34WkjmNMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmgqY6VG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54097C116C6;
	Fri,  6 Feb 2026 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770398007;
	bh=hO4tBjygwuiiOOuexB7mNw6dGV6JHgqb6JKdmAirzMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=JmgqY6VGMLAAX43tKAyNqzdhzHywAhdnJtnJ6HEbonDQZKJj55tgl6YTY1cM12bXf
	 1Zm4Gcg0JtjauB2um06P5E459fQWSQYpDp8otaAUohQaYCjqLFb3wYu/0UFBNJP/T+
	 llMqZR5Brx5RNVjt7BmTh6KJgmYdZ1sSxNa+ymIthEvhGtKuXZN8v7uD56ZRrVF6Px
	 Pohcfg/NLbyq/L8MpGlfULgA/my1SQYTsk6OaADSdud2m2jW3KjwnxZAmXvcFyTXNp
	 YFzzOj0QSFHoNR7R0sFJV6E7mv0F/EoXA3VvlWPo5tS1ZlFJVbel+3ltgq+MdXiWjA
	 XWVLVsBvPPXZA==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] rust: add `const_assert!` macro
Date: Fri,  6 Feb 2026 17:12:50 +0000
Message-ID: <20260206171253.2704684-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260206171253.2704684-1-gary@kernel.org>
References: <20260206171253.2704684-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11062-lists,linux-kbuild=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[gary@garyguo.net];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B03D5100CA2
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

The macro is a more powerful version of `static_assert!` for use inside
function contexts. This is powered by inline consts, so enable the feature
for old compiler versions that does not have it stably.

The `build_assert!` doc is refined to recommend it where possible.

While it is possible already to write `const { assert!(...) }`, this
provides a short hand that is more uniform with other assertions. It also
formats nicer with rustfmt where it will not be formatted into multiple
lines.

Two users that would route via the Rust tree are converted.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/build_assert.rs | 55 +++++++++++++++++++++++++++++++++----
 rust/kernel/num/bounded.rs  | 24 ++++++----------
 rust/kernel/prelude.rs      |  2 +-
 rust/kernel/ptr.rs          | 18 ++++++------
 scripts/Makefile.build      |  3 +-
 5 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
index d464494d430a..e40f0227e1ef 100644
--- a/rust/kernel/build_assert.rs
+++ b/rust/kernel/build_assert.rs
@@ -41,6 +41,45 @@ macro_rules! static_assert {
     };
 }
 
+/// Assertion during constant evaluation.
+///
+/// This is a more powerful version of `static_assert` that can refer to generics inside functions
+/// or implementation blocks. However, it also have a limitation where it can only appear in places
+/// where statements can appear; for example, you cannot use it as an item in the module.
+///
+/// [`static_assert!`] should be preferred where possible.
+///
+/// # Examples
+///
+/// When the condition refers to generic parameters [`static_assert!`] cannot be used.
+/// Use `const_assert!` in this scenario.
+/// ```
+/// fn foo<const N: usize>() {
+///     // `static_assert!(N > 1);` is not allowed
+///     const_assert!(N > 1); // Compile-time check
+///     build_assert!(N > 1); // Build-time check
+///     assert!(N > 1); // Run-time check
+/// }
+/// ```
+///
+/// Note that `const_assert!` cannot be used when referring to function parameter, then
+/// `const_assert!` cannot be used even if the function is going to be called during const
+/// evaluation. Use `build_assert!` in this case.
+/// ```
+/// const fn foo(n: usize) {
+///     // `const_assert!(n > 1);` is not allowed
+///     build_assert!(n > 1);
+/// }
+///
+/// const _: () = foo(2); // Evaluate during const evaluation
+/// ```
+#[macro_export]
+macro_rules! const_assert {
+    ($condition:expr $(,$arg:literal)?) => {
+        const { ::core::assert!($condition $(,$arg)?) };
+    };
+}
+
 /// Fails the build if the code path calling `build_error!` can possibly be executed.
 ///
 /// If the macro is executed in const context, `build_error!` will panic.
@@ -74,7 +113,8 @@ macro_rules! build_error {
 /// will panic. If the compiler or optimizer cannot guarantee the condition will
 /// be evaluated to `true`, a build error will be triggered.
 ///
-/// [`static_assert!`] should be preferred to `build_assert!` whenever possible.
+/// [`static_assert!`] or [`const_assert!`] should be preferred to `build_assert!` whenever
+/// possible.
 ///
 /// # Examples
 ///
@@ -84,24 +124,27 @@ macro_rules! build_error {
 /// ```ignore
 /// fn foo() {
 ///     static_assert!(1 > 1); // Compile-time error
+///     const_assert!(1 > 1); // Compile-time error
 ///     build_assert!(1 > 1); // Build-time error
 ///     assert!(1 > 1); // Run-time error
 /// }
 /// ```
 ///
-/// When the condition refers to generic parameters or parameters of an inline function,
-/// [`static_assert!`] cannot be used. Use `build_assert!` in this scenario.
+/// When the condition refers to generic parameters [`static_assert!`] cannot be used.
+/// `build_assert!` is usable in this scenario, however you should prefer `const_assert!`.
 /// ```
 /// fn foo<const N: usize>() {
 ///     // `static_assert!(N > 1);` is not allowed
+///     const_assert!(N > 1); // Compile-time check
 ///     build_assert!(N > 1); // Build-time check
 ///     assert!(N > 1); // Run-time check
 /// }
 /// ```
 ///
-/// When a condition depends on a function argument, the function must be annotated with
-/// `#[inline(always)]`. Without this attribute, the compiler may choose to not inline the
-/// function, preventing it from optimizing out the error path.
+/// When the condition refers to parameters of an inline function, neither [`static_assert!`] or
+/// [`const_assert!`] can be used. You may use `build_assert!` in this scenario, however you must
+/// annotate the function `#[inline(always)]`. Without this attribute, the compiler may choose to
+/// not inline the function, preventing it from optimizing out the error path.
 /// ```
 /// #[inline(always)]
 /// fn bar(n: usize) {
diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index fa81acbdc8c2..54d0ce3ba595 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -255,9 +255,7 @@ impl<const N: u32> Bounded<$type, N> {
             /// ```
             pub const fn new<const VALUE: $type>() -> Self {
                 // Statically assert that `VALUE` fits within the set number of bits.
-                const {
-                    assert!(fits_within!(VALUE, $type, N));
-                }
+                const_assert!(fits_within!(VALUE, $type, N));
 
                 // SAFETY: `fits_within` confirmed that `VALUE` can be represented within
                 // `N` bits.
@@ -287,12 +285,10 @@ impl<T, const N: u32> Bounded<T, N>
     /// The caller must ensure that `value` can be represented within `N` bits.
     const unsafe fn __new(value: T) -> Self {
         // Enforce the type invariants.
-        const {
-            // `N` cannot be zero.
-            assert!(N != 0);
-            // The backing type is at least as large as `N` bits.
-            assert!(N <= T::BITS);
-        }
+        // `N` cannot be zero.
+        const_assert!(N != 0);
+        // The backing type is at least as large as `N` bits.
+        const_assert!(N <= T::BITS);
 
         // INVARIANT: The caller ensures `value` fits within `N` bits.
         Self(value)
@@ -406,12 +402,10 @@ pub fn get(self) -> T {
     /// assert_eq!(larger_v, v);
     /// ```
     pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
-        const {
-            assert!(
-                M >= N,
-                "Requested number of bits is less than the current representation."
-            );
-        }
+        const_assert!(
+            M >= N,
+            "Requested number of bits is less than the current representation."
+        );
 
         // SAFETY: The value did fit within `N` bits, so it will all the more fit within
         // the larger `M` bits.
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index c7e91b80d301..75c52b5879e3 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -29,7 +29,7 @@
 
 pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
 
-pub use super::{build_assert, build_error, static_assert};
+pub use super::{build_assert, build_error, const_assert, static_assert};
 
 // `super::std_vendor` is hidden, which makes the macro inline for some reason.
 #[doc(no_inline)]
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fe..0b6acd112c4f 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,8 +2,12 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::mem::align_of;
-use core::num::NonZero;
+use core::{
+    mem::align_of,
+    num::NonZero, //
+};
+
+use crate::const_assert;
 
 /// Type representing an alignment, which is always a power of two.
 ///
@@ -38,12 +42,10 @@ impl Alignment {
     /// ```
     #[inline(always)]
     pub const fn new<const ALIGN: usize>() -> Self {
-        const {
-            assert!(
-                ALIGN.is_power_of_two(),
-                "Provided alignment is not a power of two."
-            );
-        }
+        const_assert!(
+            ALIGN.is_power_of_two(),
+            "Provided alignment is not a power of two."
+        );
 
         // INVARIANT: `align` is a power of two.
         // SAFETY: `align` is a power of two, and thus non-zero.
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0c838c467c76..204e58dd1bb0 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.79.0: `feature(inline_const)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
@@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.51.2


