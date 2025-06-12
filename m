Return-Path: <linux-kbuild+bounces-7476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2CAD72A3
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DB2E188BC52
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE49257AF8;
	Thu, 12 Jun 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9LMk6It"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95B24337C;
	Thu, 12 Jun 2025 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735709; cv=none; b=O0Qlpt4rMugzCYMlrJJOPdM1xnU9aPIGCI3kqMFPqGzmiwMVEfwQPGvcwylrqSZT225jB0tq4nMOa5s+Ip4X/mwmvfv0CuyFMke6mM2MOtkUvk3dnr8BGkcEVKcYzaw+upqhUOCCNVSoTsbOolJGXUZkXSaJG0Mgp9KASqGajYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735709; c=relaxed/simple;
	bh=8wvcbq9+DnI/RWLQdNcGsjq/+GisGIanDf6U3XseGIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l3/ua51Dca2nCg4e4a821H0LgfNrE02X9gCbxefY8WBd/OBlN7B3hm63Q2A6/rq1kl+ZqKDAnI6TWpUoLwtyDKT0M3x6+ad16eRKfZG0g0S08cNghpZUzYmxzfl8hyWgwjU/yTvERSEa06QXEzCiLhBxRjQ4dRhcVHKQeAsDV/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9LMk6It; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6547BC116B1;
	Thu, 12 Jun 2025 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749735709;
	bh=8wvcbq9+DnI/RWLQdNcGsjq/+GisGIanDf6U3XseGIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T9LMk6Itp33K9CMrNq08fcThcyfgk4jkE5/GmZzIFJJBIIgZYLsR3AjnEN4v9zvz9
	 xEkHquR/PV2IchPDGebok8ZkOW4gv2xXUr7sTdGIGuvnUy787UezlMof4AYBxwi80g
	 1vP+GNWn6bXOhqJscwQjGSwEb4znGoN3pmMUo+2lqlHIxk0f3ySzBdlV6b0kHyphXi
	 eDohr9DD/NfauNqVram++4hIDHohCcjrgE9PTWIk/pyEr1uX58GsmRkVW+4IHxote/
	 qQmLO97EDi9ICeyeXj5PEIBImrqE4tRlSiVDe2yINTuW1rvhL9zBpInPKzGh7YRDPs
	 9sDdKFq7LfsLA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Jun 2025 15:40:03 +0200
Subject: [PATCH v13 2/6] rust: introduce module_param module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8174; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=8wvcbq9+DnI/RWLQdNcGsjq/+GisGIanDf6U3XseGIs=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoSti3zN6H0ZNtg4erMbXF67x6t+OCVyAIgQLmR
 sxj6QFDHamJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaErYtwAKCRDhuBo+eShj
 d+9yD/42ZhzXzby4Vkxe4Lkhx3KTkVkiveq7I/cvjYhZXDPCnZGAKc2dtXPC9vd+MjKMyTqTRRJ
 Qkn/LLqFhA6Rm+8pFaat1J45XNwnVa/5d7e10SHdlXfQj1jpXzvmdmnL6LsIW9fo7Bf0WWcR5Bb
 fzDP98LxHNPNliR0Qi5VyCXhTXUbt5UXikDhYutE0XpqTR3AgcTexwG7OqXyu8zbuXvzgsaN6Y9
 0nuTy9UzYZUGnuO7z5MRzD9tDtjlyGjA6JEeBPcllxzvaUwvWJnVf8qmWVH+VBWtFmLnrQ1is61
 o0e2Jb7pLmldPXznlQQ4duMjhr8ZUYBwt159vaEcIdemrYzxum3CZbgQBoQg+J3pZe3PaRH/OaE
 30iqspzIXb+up8hDP4keRtYljgmXomSAF+KzK+caqA/Wxwhcf9fwzy5mat+5sVJKf87dLM2kFgZ
 3um9wVWRFgrtv+pmCkCyvBdqyJrgu8nnFfXnpmyuatdPi16b/l28QEOyx/fPrCf4aO7t3w6e7x1
 pjAEaGDVlQQnXUXd65oXpppUv+NnqSixlAqKwVPMxAdZXn96cgHMEypK5l0vIU1nj6szMQjVScD
 tGhnXSSFOiSkDPPAK28/93s/FfxW2hso/5DU9bKi6/87jH2foVmaXfE9Xl5ObBhG2tmeQo+hw3K
 x1j3ilKotq0iIuw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add types and traits for interfacing the C moduleparam API.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs          |   1 +
 rust/kernel/module_param.rs | 201 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 202 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c3..2b439ea06185 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -87,6 +87,7 @@
 pub mod list;
 pub mod miscdevice;
 pub mod mm;
+pub mod module_param;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
new file mode 100644
index 000000000000..fd167df8e53d
--- /dev/null
+++ b/rust/kernel/module_param.rs
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for module parameters.
+//!
+//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
+
+use crate::prelude::*;
+use crate::str::BStr;
+
+/// Newtype to make `bindings::kernel_param` [`Sync`].
+#[repr(transparent)]
+#[doc(hidden)]
+pub struct RacyKernelParam(pub ::kernel::bindings::kernel_param);
+
+// SAFETY: C kernel handles serializing access to this type. We never access it
+// from Rust module.
+unsafe impl Sync for RacyKernelParam {}
+
+/// Types that can be used for module parameters.
+pub trait ModuleParam: Sized + Copy {
+    /// The [`ModuleParam`] will be used by the kernel module through this type.
+    ///
+    /// This may differ from `Self` if, for example, `Self` needs to track
+    /// ownership without exposing it or allocate extra space for other possible
+    /// parameter values.
+    // This is required to support string parameters in the future.
+    type Value: ?Sized;
+
+    /// Parse a parameter argument into the parameter value.
+    ///
+    /// `Err(_)` should be returned when parsing of the argument fails.
+    ///
+    /// Parameters passed at boot time will be set before [`kmalloc`] is
+    /// available (even if the module is loaded at a later time). However, in
+    /// this case, the argument buffer will be valid for the entire lifetime of
+    /// the kernel. So implementations of this method which need to allocate
+    /// should first check that the allocator is available (with
+    /// [`crate::bindings::slab_is_available`]) and when it is not available
+    /// provide an alternative implementation which doesn't allocate. In cases
+    /// where the allocator is not available it is safe to save references to
+    /// `arg` in `Self`, but in other cases a copy should be made.
+    ///
+    /// [`kmalloc`]: srctree/include/linux/slab.h
+    fn try_from_param_arg(arg: &'static BStr) -> Result<Self>;
+}
+
+/// Set the module parameter from a string.
+///
+/// Used to set the parameter value at kernel initialization, when loading
+/// the module or when set through `sysfs`.
+///
+/// See `struct kernel_param_ops.set`.
+///
+/// # Safety
+///
+/// - If `val` is non-null then it must point to a valid null-terminated string that must be valid
+///   for reads for the duration of the call.
+/// - `parm` must be a pointer to a `bindings::kernel_param` that is valid for reads for the
+///   duration of the call.
+/// - `param.arg` must be a pointer to an initialized `T` that is valid for writes for the duration
+///   of the function.
+///
+/// # Note
+///
+/// - The safety requirements are satisfied by C API contract when this function is invoked by the
+///   module subsystem C code.
+/// - Currently, we only support read-only parameters that are not readable from `sysfs`. Thus, this
+///   function is only called at kernel initialization time, or at module load time, and we have
+///   exclusive access to the parameter for the duration of the function.
+///
+/// [`module!`]: macros::module
+unsafe extern "C" fn set_param<T>(
+    val: *const c_char,
+    param: *const crate::bindings::kernel_param,
+) -> c_int
+where
+    T: ModuleParam,
+{
+    // NOTE: If we start supporting arguments without values, val _is_ allowed
+    // to be null here.
+    if val.is_null() {
+        // TODO: Use pr_warn_once available.
+        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
+        return EINVAL.to_errno();
+    }
+
+    // SAFETY: By function safety requirement, val is non-null, null-terminated
+    // and valid for reads for the duration of this function.
+    let arg = unsafe { CStr::from_char_ptr(val) };
+
+    crate::error::from_result(|| {
+        let new_value = T::try_from_param_arg(arg)?;
+
+        // SAFETY: By function safety requirements `param` is be valid for reads.
+        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
+
+        // SAFETY: By function safety requirements, the target of `old_value` is valid for writes
+        // and is initialized.
+        unsafe { *old_value = new_value };
+        Ok(0)
+    })
+}
+
+macro_rules! impl_int_module_param {
+    ($ty:ident) => {
+        impl ModuleParam for $ty {
+            type Value = $ty;
+
+            fn try_from_param_arg(arg: &'static BStr) -> Result<Self> {
+                <$ty as crate::str::parse_int::ParseInt>::from_str(arg)
+            }
+        }
+    };
+}
+
+impl_int_module_param!(i8);
+impl_int_module_param!(u8);
+impl_int_module_param!(i16);
+impl_int_module_param!(u16);
+impl_int_module_param!(i32);
+impl_int_module_param!(u32);
+impl_int_module_param!(i64);
+impl_int_module_param!(u64);
+impl_int_module_param!(isize);
+impl_int_module_param!(usize);
+
+/// A wrapper for kernel parameters.
+///
+/// This type is instantiated by the [`module!`] macro when module parameters are
+/// defined. You should never need to instantiate this type directly.
+///
+/// Note: This type is `pub` because it is used by module crates to access
+/// parameter values.
+#[repr(transparent)]
+pub struct ModuleParamAccess<T> {
+    data: core::cell::UnsafeCell<T>,
+}
+
+// SAFETY: We only create shared references to the contents of this container,
+// so if `T` is `Sync`, so is `ModuleParamAccess`.
+unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
+
+impl<T> ModuleParamAccess<T> {
+    #[doc(hidden)]
+    pub const fn new(value: T) -> Self {
+        Self {
+            data: core::cell::UnsafeCell::new(value),
+        }
+    }
+
+    /// Get a shared reference to the parameter value.
+    // Note: When sysfs access to parameters are enabled, we have to pass in a
+    // held lock guard here.
+    pub fn get(&self) -> &T {
+        // SAFETY: As we only support read only parameters with no sysfs
+        // exposure, the kernel will not touch the parameter data after module
+        // initialization.
+        unsafe { &*self.data.get() }
+    }
+
+    /// Get a mutable pointer to the parameter value.
+    pub const fn as_mut_ptr(&self) -> *mut T {
+        self.data.get()
+    }
+}
+
+#[doc(hidden)]
+#[macro_export]
+/// Generate a static [`kernel_param_ops`](srctree/include/linux/moduleparam.h) struct.
+///
+/// # Examples
+///
+/// ```ignore
+/// make_param_ops!(
+///     /// Documentation for new param ops.
+///     PARAM_OPS_MYTYPE, // Name for the static.
+///     MyType // A type which implements [`ModuleParam`].
+/// );
+/// ```
+macro_rules! make_param_ops {
+    ($ops:ident, $ty:ty) => {
+        #[doc(hidden)]
+        pub static $ops: $crate::bindings::kernel_param_ops = $crate::bindings::kernel_param_ops {
+            flags: 0,
+            set: Some(set_param::<$ty>),
+            get: None,
+            free: None,
+        };
+    };
+}
+
+make_param_ops!(PARAM_OPS_I8, i8);
+make_param_ops!(PARAM_OPS_U8, u8);
+make_param_ops!(PARAM_OPS_I16, i16);
+make_param_ops!(PARAM_OPS_U16, u16);
+make_param_ops!(PARAM_OPS_I32, i32);
+make_param_ops!(PARAM_OPS_U32, u32);
+make_param_ops!(PARAM_OPS_I64, i64);
+make_param_ops!(PARAM_OPS_U64, u64);
+make_param_ops!(PARAM_OPS_ISIZE, isize);
+make_param_ops!(PARAM_OPS_USIZE, usize);

-- 
2.47.2



