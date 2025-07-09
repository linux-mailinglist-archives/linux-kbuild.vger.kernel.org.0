Return-Path: <linux-kbuild+bounces-7952-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC10AFF030
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 19:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C6F1C84442
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 17:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0FC23A9AE;
	Wed,  9 Jul 2025 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfU/XrOE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7FA23A578;
	Wed,  9 Jul 2025 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752083592; cv=none; b=vCoJta3jXMfhtu4USLutQxlB95b/inZBzxKi4w4HB/F9i5bUD1yN6KMcvTzrmpFPGJaxtsJBgQlKnWb3p9fs9IDn9It6qFTNrkye5LEPHDDmuKIL61eofHJvC9jpcBekiY1lKYVwsyUM7tj5L3eEw3OIWoBpp9oyNIYf+2zM7O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752083592; c=relaxed/simple;
	bh=IaejDxR65nfkpFtQKTy5h1EB3F8o0R9aHHtFm2+Kn0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suB8j3HhtQthseSSd30ESD3vdwiPNzeua3vAAjayr+LxeWKk69VampkPyVh2ygHLg4iDCb6acVabMPy0ypEMOK/FTTmeXgdpGLAsRGs70NWCGafQCy7zcz55MWYHAwAF7JA+lGexrUAPaIAE9qRJRT49q1XiiUDLlMAnieZ05vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfU/XrOE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF237C4CEEF;
	Wed,  9 Jul 2025 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752083591;
	bh=IaejDxR65nfkpFtQKTy5h1EB3F8o0R9aHHtFm2+Kn0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jfU/XrOEWKyrCb7wBo6eyS4OYFSnVO7enlwcWGDpyt5BYeiS86sCkY+3ujUjVpJeV
	 om6LkmVnSscxB05kN+kEo4h6FFpmeZD0I/FXBfPgI9ytaQTDXc5kQTEwgkXEN0qHAx
	 nkEh397d/J+lHCi6oweoEhlpkBTW6HV3fx7YXoZIkuqBtSyfQ/a/zXh3bghRn8dWtl
	 i19K1hSSLN+AGpUirLDWmU/IvE0veQ7rfYGAk8mwFp0ceMYbdYQb7giId0N05zCtfR
	 OC0ozQSWCpthDLJt6paMWTZgITeb3HNT+m2DIaV65udavTh/WGakh+lH24KyT8WHth
	 C+qe1VyCIAErQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 09 Jul 2025 19:52:17 +0200
Subject: [PATCH v16 3/7] rust: introduce module_param module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-module-params-v3-v16-3-4f926bcccb50@kernel.org>
References: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
In-Reply-To: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6945; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=IaejDxR65nfkpFtQKTy5h1EB3F8o0R9aHHtFm2+Kn0U=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBobqxbxvtD6Y5BRYT77LvuDMdsqharPbLo77r6s
 sAlXqP4yeKJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaG6sWwAKCRDhuBo+eShj
 d8DwD/oCecyk5hJidsgMMfDxKiUr2WwOdSPYXiuwS1tBI2zCp2x7gqayH3of7UBqwaQfESbRmh0
 tjbO1TUBgoNiHdxdVA+swcWm4BSg1iFN1R1+M87iq8b1wGBrcH6BzBBd9kMnJIDPW7mguw3CBW4
 nsZTh76L0t7tZifiRaPAeTSKywApD2oLWO2Ay7uHx37ixb5I3Uev23nPo+zIaM++LuEP8G2E+MV
 7KCIpJ2QYP0Mv22Cu5gQw7nNk4IaNjK1FSzDYz9DeRoXsz9csKiTE2VRy0DgCEx5oWzOztF4c5A
 T2U2KUMZxYK8hqN1qHwJzIYHBoleXUK+EJLgs4OhmGSSpYL5CwU+AHvT/fJtB+YlNZNwpjRl6Sd
 v1yjccrIFQLI/hcGV/e+C9eC6ZEC9rqnwSKM5QfxdUkjWdkH1ug7eN0S1LwkOzicEzOnrMiYa2M
 f9clWDOVSu+pTYZfovfQy449KEUNLECAVVGENnzjz9yf/rGGkyhYQo+JpKhjL0u09vdmdSEbjUm
 ZMVnZtr984erJHNFSRqYq8JLTb3e9yfw9HyWtk+eitvaziQKNOV+YeJqRyXOMxhVPVMTjbXtLRR
 649ppCZLgHj1cgYaHdotUsb2YjMT6bz1h3xVK07TkTe21TGpyAj6Xva1qPOmI0qdW0rMDRyeSbw
 MeflsNfvAyCzw/g==
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
index 6b4774b2b1c37..2b439ea061850 100644
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
index 0000000000000..9b187ed1d3513
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
+        let container = unsafe { &*((*param).__bindgen_anon_1.arg as *mut SetOnce<T>) };
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



