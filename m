Return-Path: <linux-kbuild+bounces-8945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBBB99E1D
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 14:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3701B1890456
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 12:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB5B303CB2;
	Wed, 24 Sep 2025 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LO329IXf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA892417C2;
	Wed, 24 Sep 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717630; cv=none; b=mBv1vaGUwAuPbiDpbCp56WwvY4wBKukHPr1ht0zQYGupT503rw/317QjpI52nHrKGGRu1Tw7fhaF+f4QjjsfSoQwxPT3tecfG+ZWySkMQPebpoTlo3oAnrTtY7gpvXQCKSGF479RTuZnUS7Wu6iR7Tn8cKdO74EeaU1LFwtoq+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717630; c=relaxed/simple;
	bh=/z6qk8wppG3LqmQtwIDcJIctq6LUeuvVFHKI96Laa8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJwa4KOr0rUT3Er2qvda9QZvsgUXKeaERRvlfW46sXDWrts+/Vgm/upDl5/4Y50V0RomFiorMeSOHRMpXpBU52SdIz6hEsHpVLzVRu1W0FOMFbFzXKcyOiAt7ZVdLpVkgA7wgRfTddXxgG5lfc8Mdpw/PRLzz0jI9gMOGrKM1kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LO329IXf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C4A1C116B1;
	Wed, 24 Sep 2025 12:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717629;
	bh=/z6qk8wppG3LqmQtwIDcJIctq6LUeuvVFHKI96Laa8M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LO329IXfHcUh5Vmz/im9h/Uz4lHE3OssTeuG1N6o3gDpEHpSznfEIVUWSj/T8gXe2
	 QIeN6niqlQNK7Cad6o0CNKlkgbDCwajXsV/EhjEVdYdsBhWx1foA1o43LAqJmlczYb
	 +Dxl1mQRv1dfIJF2Mmu1aNcFOVKNqPe/hEoNcecintTfleGhO5QS1u5g3kr7aUlABF
	 BON2bBJKTUEpOcw2hspK7qTrML566r8FIrBwsQAzBrA/Dv++F6pTNgXyGxcRjYJrD7
	 TFDGJ1uORe9myz87BLUKpjhbbYAuJ0bTPJzjuvt362mlouE5ZcD5rzrU2e8AvYz7v1
	 /8yejxsdp04rA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 24 Sep 2025 14:39:26 +0200
Subject: [PATCH v18 3/7] rust: introduce module_param module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-module-params-v3-v18-3-bf512c35d910@kernel.org>
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
In-Reply-To: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6947; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=/z6qk8wppG3LqmQtwIDcJIctq6LUeuvVFHKI96Laa8M=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBo0+aiACwI+EPgFWp40UARvh6ZjpPWgNPpjWm2z
 DOpX+ox73WJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaNPmogAKCRDhuBo+eShj
 d39GD/9obLV5ujuL+Cs35TYYlrxvlm/F/mY/4KxLUaEBcqhx3La1jMfq67qHi8N2jcS/00/65Ba
 h00DICLCrhzPFOaR0jz9k0hHtvuhFCRTnzlKhXE465FzS4JlA5SLP3LkTYL1zseP/RghrujEehD
 Q/bZTppWF7VsUAKLle9TT/TJfF4KS5WA6m6mPpR4QL325PxmtmHDUS5QT9LpfrlTbZrSwjOi7fS
 T2e5Lyn+ACOvFbT8vTlckuvwpfBSfb7eiU/D3UuyVFePKFJ/iM1JWVPp4dcoxtmrpgc8tgSXyGy
 ENEXTIIVSnuax+kgcozue+Y7c/6nn5/irescl10ZoAZezjx3gaJzQ1ZuOvw47FWofyF+Lcsc6yk
 tkmGe+lkzSeqdqPiNQUviw3zpiirVo8TtT0SqrVNhVSGI+U7BZKVbVHPqjsHVE+vSlDi8j5FuCE
 wDGgx6Dj8xgrFfCNZ+zAP827egEHRQi0wZKKDNt2gl1zVsY9V3WN3QuLPnQJrskrBw7l/FO9lhp
 KICA0MAkwpV2vRmckjTg+Yr9Fu9FHkUAqQRAZG7hoQeAxXh77VY5irpIuhZ82/itVB3/qWEkK1h
 bxJ9ATncdCZ1AQhd6aDD/1jZlMrnpfO04KEZLJRdBJDMGQCF+OyMIrBL7YUZj1iIVEvS5oNHgTd
 ANsNKIQEiTptWOQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add types and traits for interfacing the C moduleparam API.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs          |   1 +
 rust/kernel/module_param.rs | 181 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fef97f2a50984..e34b377d93b2e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,7 @@
 pub mod list;
 pub mod miscdevice;
 pub mod mm;
+pub mod module_param;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
new file mode 100644
index 0000000000000..e7d5c930a467d
--- /dev/null
+++ b/rust/kernel/module_param.rs
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for module parameters.
+//!
+//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
+
+use crate::prelude::*;
+use crate::str::BStr;
+use bindings;
+use kernel::sync::SetOnce;
+
+/// Newtype to make `bindings::kernel_param` [`Sync`].
+#[repr(transparent)]
+#[doc(hidden)]
+pub struct KernelParam(bindings::kernel_param);
+
+impl KernelParam {
+    #[doc(hidden)]
+    pub const fn new(val: bindings::kernel_param) -> Self {
+        Self(val)
+    }
+}
+
+// SAFETY: C kernel handles serializing access to this type. We never access it
+// from Rust module.
+unsafe impl Sync for KernelParam {}
+
+/// Types that can be used for module parameters.
+// NOTE: This trait is `Copy` because drop could produce unsoundness during teardown.
+pub trait ModuleParam: Sized + Copy {
+    /// Parse a parameter argument into the parameter value.
+    fn try_from_param_arg(arg: &BStr) -> Result<Self>;
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
+/// - `param` must be a pointer to a `bindings::kernel_param` initialized by the rust module macro.
+///   The pointee must be valid for reads for the duration of the call.
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
+unsafe extern "C" fn set_param<T>(val: *const c_char, param: *const bindings::kernel_param) -> c_int
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
+        // SAFETY: By function safety requirements, this access is safe.
+        let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
+
+        container
+            .populate(new_value)
+            .then_some(0)
+            .ok_or(kernel::error::code::EEXIST)
+    })
+}
+
+macro_rules! impl_int_module_param {
+    ($ty:ident) => {
+        impl ModuleParam for $ty {
+            fn try_from_param_arg(arg: &BStr) -> Result<Self> {
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
+pub struct ModuleParamAccess<T> {
+    value: SetOnce<T>,
+    default: T,
+}
+
+// SAFETY: We only create shared references to the contents of this container,
+// so if `T` is `Sync`, so is `ModuleParamAccess`.
+unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
+
+impl<T> ModuleParamAccess<T> {
+    #[doc(hidden)]
+    pub const fn new(default: T) -> Self {
+        Self {
+            value: SetOnce::new(),
+            default,
+        }
+    }
+
+    /// Get a shared reference to the parameter value.
+    // Note: When sysfs access to parameters are enabled, we have to pass in a
+    // held lock guard here.
+    pub fn value(&self) -> &T {
+        self.value.as_ref().unwrap_or(&self.default)
+    }
+
+    /// Get a mutable pointer to `self`.
+    ///
+    /// NOTE: In most cases it is not safe deref the returned pointer.
+    pub const fn as_void_ptr(&self) -> *mut c_void {
+        core::ptr::from_ref(self).cast_mut().cast()
+    }
+}
+
+#[doc(hidden)]
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



