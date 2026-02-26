Return-Path: <linux-kbuild+bounces-11449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB71BIxvoGkHjwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11449-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 17:06:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA061A99D3
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 17:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6912631B8931
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 15:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804E5426EDA;
	Thu, 26 Feb 2026 15:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZtBzCpi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADE7426ECD;
	Thu, 26 Feb 2026 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120869; cv=none; b=jryiwsfR6kT8CzVinsTMWg2Mn0doN7LRVCGS0uOTtvkQXDLNkjJMaBmCzm6x66MJEt9Xe5lDdnJIfX99bZfdifFnwdD1MpE9ZRP1+n5gfARK1gZDeyoioh09BNhSB3YNXYenPKZ+XALlKXovpbPcHTWRFALzCYAF9VgY01AxPCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120869; c=relaxed/simple;
	bh=YuceOjX9Tg6LcTSRNcQsRatGW7WHLSoknGPACi/Sf7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sw92ph9jVolspz+YlnW8TsSvua6ldm1weH1wZl5RibkOeuKvtt1CNQIrFoZBEZOYgMb5GKYlHF2KMfpCcI7/beWnLm6DmbOCAa2m8AaX04ZK1ky1uIhHa1k2LizhvJC8aLatLHrGsw4t/PQCuFOZJsZtWhyRvn28f+CSuRyzf40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZtBzCpi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BECC19423;
	Thu, 26 Feb 2026 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772120868;
	bh=YuceOjX9Tg6LcTSRNcQsRatGW7WHLSoknGPACi/Sf7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=BZtBzCpiZBYBqVO+SvIuYIQkCZNGFSx3tHZ4EVWMTSXrPUx7kww/h4ms+5aYyvBHE
	 pccAfRiJ9X0lyGSnGHT6GtJ+zuoNMcNOSLo3r6ZUCH1FpqZVW5/YOpn6kGjjxJgrxF
	 XJY1LLJW39k9aQWagioKxCGMRjiYN1oSgSMh5/sfMP0EHzY1q+yAUj8OcRY8i1+5Is
	 yJW9N+vRLacZ2E7P0qUvXVdFOy0+9Uy2vR6kI6SFZhiNKKziIl/VbZHQVoPH5F8QgV
	 tPrnim9QDYWfMgFfFnVop2WfD5mrYFjvk3lxEtpf9B/R6Hv6VmpTRpesqmy2Hkrdg6
	 u4zti1Ui/fE5Q==
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
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 1/2] rust: add projection infrastructure
Date: Thu, 26 Feb 2026 15:46:53 +0000
Message-ID: <20260226154656.3241736-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260226154656.3241736-1-gary@kernel.org>
References: <20260226154656.3241736-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11449-lists,linux-kbuild=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[gary@garyguo.net];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:replyto,garyguo.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CA061A99D3
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

Add a generic infrastructure for performing field and index projections on
raw pointers. This will form the basis of performing I/O projections.

Pointers manipulations are intentionally using the safe wrapping variants
instead of the unsafe variants, as the latter requires pointers to be
inside an allocation which is not necessarily true for I/O pointers.

This projection macro protects against rogue `Deref` implementation, which
can causes the projected pointer to be outside the bounds of starting
pointer. This is extremely unlikely and Rust has a lint to catch this, but
is unsoundness regardless. The protection works by inducing type inference
ambiguity when `Deref` is implemented.

This projection macro also stops projecting into unaligned fields (i.e.
fields of `#[repr(packed)]` structs), as misaligned pointers require
special handling. This is implemented by attempting to create reference to
projected field inside a `if false` block. Despite being unreachable, Rust
still checks that they're not unaligned fields.

The projection macro supports both fallible and infallible index
projections. These are described in detail inside the documentation.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/lib.rs        |   5 +
 rust/kernel/projection.rs | 284 ++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build    |   4 +-
 3 files changed, 292 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/projection.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..50866b481bdb 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -20,6 +20,7 @@
 #![feature(generic_nonzero)]
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
+#![feature(slice_ptr_len)]
 //
 // Stable since Rust 1.80.0.
 #![feature(slice_flatten)]
@@ -37,6 +38,9 @@
 #![feature(const_ptr_write)]
 #![feature(const_refs_to_cell)]
 //
+// Stable since Rust 1.84.0.
+#![feature(strict_provenance)]
+//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 //
@@ -130,6 +134,7 @@
 pub mod prelude;
 pub mod print;
 pub mod processor;
+pub mod projection;
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
diff --git a/rust/kernel/projection.rs b/rust/kernel/projection.rs
new file mode 100644
index 000000000000..186ec194f2b8
--- /dev/null
+++ b/rust/kernel/projection.rs
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Infrastructure for handling projections.
+
+use core::{
+    mem::MaybeUninit,
+    ops::Deref, //
+};
+
+use crate::prelude::*;
+
+/// Error raised when a projection is attempted on array or slices out of bounds.
+pub struct OutOfBound;
+
+impl From<OutOfBound> for Error {
+    #[inline(always)]
+    fn from(_: OutOfBound) -> Self {
+        ERANGE
+    }
+}
+
+/// A helper trait to perform index projection.
+///
+/// This is similar to `core::slice::SliceIndex`, but operate on raw pointers safely and fallibly.
+///
+/// # Safety
+///
+/// `get` must return a pointer in bounds of the provided pointer.
+#[diagnostic::on_unimplemented(message = "`{Self}` cannot be used to index `{T}`")]
+#[doc(hidden)]
+pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
+    type Output: ?Sized;
+
+    /// Returns an index-projected pointer, if in bounds.
+    fn get(self, slice: *mut T) -> Option<*mut Self::Output>;
+
+    /// Returns an index-projected pointer; fail the build if it cannot be proved to be in bounds.
+    #[inline(always)]
+    fn index(self, slice: *mut T) -> *mut Self::Output {
+        Self::get(self, slice).unwrap_or_else(|| build_error!())
+    }
+}
+
+// Forward array impl to slice impl.
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T, I, const N: usize> ProjectIndex<[T; N]> for I
+where
+    I: ProjectIndex<[T]>,
+{
+    type Output = <I as ProjectIndex<[T]>>::Output;
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T; N]) -> Option<*mut Self::Output> {
+        <I as ProjectIndex<[T]>>::get(self, slice)
+    }
+
+    #[inline(always)]
+    fn index(self, slice: *mut [T; N]) -> *mut Self::Output {
+        <I as ProjectIndex<[T]>>::index(self, slice)
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for usize {
+    type Output = T;
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut T> {
+        if self > slice.len() {
+            None
+        } else {
+            Some(slice.cast::<T>().wrapping_add(self))
+        }
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::Range<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        let new_len = self.end.checked_sub(self.start)?;
+        if self.end > slice.len() {
+            return None;
+        }
+        Some(core::ptr::slice_from_raw_parts_mut(
+            slice.cast::<T>().wrapping_add(self.start),
+            new_len,
+        ))
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeTo<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        (0..self.end).get(slice)
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeFrom<usize> {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        (self.start..slice.len()).get(slice)
+    }
+}
+
+// SAFETY: `get` returned pointers are in bounds.
+unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeFull {
+    type Output = [T];
+
+    #[inline(always)]
+    fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
+        Some(slice)
+    }
+}
+
+/// A helper trait to perform field projection.
+///
+/// This trait has a `DEREF` generic parameter so it can be implemented twice for types that
+/// implement `Deref`. This will cause an ambiguity error and thus block `Deref` types being used
+/// as base of projection, as they can inject unsoundness.
+///
+/// # Safety
+///
+/// `proj` should invoke `f` with valid allocation, as documentation described.
+#[doc(hidden)]
+pub unsafe trait ProjectField<const DEREF: bool> {
+    /// Project a pointer to a type to a pointer of a field.
+    ///
+    /// `f` is always invoked with valid allocation so it can safely obtain raw pointers to fields
+    /// using `&raw mut`.
+    ///
+    /// This is needed because `base` might not point to a valid allocation, while `&raw mut`
+    /// requires pointers to be in bounds of a valid allocation.
+    ///
+    /// # Safety
+    ///
+    /// `f` must returns a pointer in bounds of the provided pointer.
+    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut F) -> *mut F;
+}
+
+// NOTE: in theory, this API should work for `T: ?Sized` and `F: ?Sized`, too. However we cannot
+// currently support that as we need to obtain a valid allocation that `&raw const` can operate on.
+// SAFETY: `proj` invokes `f` with valid allocation.
+unsafe impl<T> ProjectField<false> for T {
+    #[inline(always)]
+    unsafe fn proj<F>(base: *mut Self, f: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
+        // Create a valid allocation to start projection, as `base` is not necessarily so. The
+        // memory is never actually used so it will be optimized out, so it should work even for
+        // very large `T` (`memoffset` crate also relies on this). To be extra certain, we also
+        // annotate `f` closure with `#[inline(always)]` in the macro.
+        let mut place = MaybeUninit::uninit();
+        let place_base = place.as_mut_ptr();
+        let field = f(place_base);
+        // SAFETY: `field` is in bounds from `base` per safety requirement.
+        let offset = unsafe { field.byte_offset_from(place_base) };
+        // Use `wrapping_byte_offset` as `base` does not need to be of valid allocation.
+        base.wrapping_byte_offset(offset).cast()
+    }
+}
+
+// SAFETY: vacuously satisfied.
+unsafe impl<T: Deref> ProjectField<true> for T {
+    #[inline(always)]
+    unsafe fn proj<F>(_: *mut Self, _: impl FnOnce(*mut Self) -> *mut F) -> *mut F {
+        build_error!("this function is a guard against `Deref` impl and is never invoked");
+    }
+}
+
+/// Create a projection from a raw pointer.
+///
+/// The projected pointer is within the memory region marked by the input pointer. There is no
+/// requirement that the input raw pointer needs to be valid, so this macro may be used for
+/// projecting pointers outside normal address space, e.g. I/O pointers. However, if the input
+/// pointer is valid, the projected pointer is also valid.
+///
+/// Supported projections include field projections and index projections.
+/// It is not allowed to project into types that implement custom `Deref` or `Index`.
+///
+/// The macro has basic syntax of `kernel::project_pointer!(ptr, projection)`, where `ptr` is an
+/// expression that evaluates to a raw pointer which serves as the base of projection. `projection`
+/// can be a projection expression of form `.field` (normally identifer, or numeral in case of
+/// tuple structs) or of form `[index]`.
+///
+/// If mutable pointer is needed, the macro input can be prefixed with `mut` keyword, i.e.
+/// `kernel::project_pointer!(mut ptr, projection)`. By default, a const pointer is created.
+///
+/// `project_pointer!` macro can perform both fallible indexing and build-time checked indexing.
+/// `[index]` form performs build-time bounds checking; if compiler fails to prove `[index]` is in
+/// bounds, compilation will fail. `[index]?` can be used to perform runtime bounds checking;
+/// `OutOfBound` error is raised via `?` if the index is out of bounds.
+///
+/// # Examples
+///
+/// Field projections are performed with `.field_name`:
+/// ```
+/// struct MyStruct { field: u32, }
+/// let ptr: *const MyStruct = core::ptr::dangling();
+/// let field_ptr: *const u32 = kernel::project_pointer!(ptr, .field);
+///
+/// struct MyTupleStruct(u32, u32);
+///
+/// fn proj(ptr: *const MyTupleStruct) {
+///     let field_ptr: *const u32 = kernel::project_pointer!(ptr, .1);
+/// }
+/// ```
+///
+/// Index projections are performed with `[index]`:
+/// ```
+/// fn proj(ptr: *const [u8; 32]) -> Result {
+///     let field_ptr: *const u8 = kernel::project_pointer!(ptr, [1]);
+///     // This will fail the build.
+///     // kernel::project_pointer!(ptr, [128]);
+///     // This will raise an `OutOfBound` error (which is convertable to `ERANGE`).
+///     kernel::project_pointer!(ptr, [128]?);
+///     Ok(())
+/// }
+/// ```
+///
+/// If you need to match on the error instead of propagate, put the invocation inside a closure:
+/// ```
+/// let ptr: *const [u8; 32] = core::ptr::dangling();
+/// let field_ptr: Result<*const u8> = (|| -> Result<_> {
+///     Ok(kernel::project_pointer!(ptr, [128]?))
+/// })();
+/// assert!(field_ptr.is_err());
+/// ```
+///
+/// For mutable pointers, put `mut` as the first token in macro invocation.
+/// ```
+/// let ptr: *mut [(u8, u16); 32] = core::ptr::dangling_mut();
+/// let field_ptr: *mut u16 = kernel::project_pointer!(mut ptr, [1].1);
+/// ```
+#[macro_export]
+macro_rules! project_pointer {
+    (@gen $ptr:ident, ) => {};
+    // Field projection. `$field` needs to be `tt` to support tuple index like `.0`.
+    (@gen $ptr:ident, .$field:tt $($rest:tt)*) => {
+        // SAFETY: the provided closure always return in bounds pointer.
+        let $ptr = unsafe {
+            $crate::projection::ProjectField::proj($ptr, #[inline(always)] |ptr| {
+                // Check unaligned field. Not all users (e.g. DMA) can handle unaligned
+                // projections. (e.g. DMA).
+                if false {
+                    let _ = &(*ptr).$field;
+                }
+                // SAFETY: `$field` is in bounds, and no implicit `Deref` is possible (if the
+                // type implements `Deref`, Rust cannot infer the generic parameter `DEREF`).
+                &raw mut (*ptr).$field
+            })
+        };
+        $crate::project_pointer!(@gen $ptr, $($rest)*)
+    };
+    // Fallible index projection.
+    (@gen $ptr:ident, [$index:expr]? $($rest:tt)*) => {
+        let $ptr = $crate::projection::ProjectIndex::get($index, $ptr)
+            .ok_or($crate::projection::OutOfBound)?;
+        $crate::project_pointer!(@gen $ptr, $($rest)*)
+    };
+    // Build-time checked index projection.
+    (@gen $ptr:ident, [$index:expr] $($rest:tt)*) => {
+        let $ptr = $crate::projection::ProjectIndex::index($index, $ptr);
+        $crate::project_pointer!(@gen $ptr, $($rest)*)
+    };
+    (mut $ptr:expr, $($proj:tt)*) => {{
+        let ptr: *mut _ = $ptr;
+        $crate::project_pointer!(@gen ptr, $($proj)*);
+        ptr
+    }};
+    ($ptr:expr, $($proj:tt)*) => {{
+        let ptr = <*const _>::cast_mut($ptr);
+        // We currently always project using mutable pointer, as it is not decided whether `&raw
+        // const` allows the resulting pointer to be mutated (see documentation of `addr_of!`).
+        $crate::project_pointer!(@gen ptr, $($proj)*);
+        ptr.cast_const()
+    }};
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..3652b85be545 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -310,16 +310,18 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.79.0: `feature(slice_ptr_len)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
+#   - Stable since Rust 1.84.0: `feature(strict_provenance)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.51.2


