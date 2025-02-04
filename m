Return-Path: <linux-kbuild+bounces-5620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ADFA270FF
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 13:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA8C518869D6
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 12:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB3220DD71;
	Tue,  4 Feb 2025 12:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyVGurRm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D7020DD6B;
	Tue,  4 Feb 2025 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670697; cv=none; b=g9ecuQCfcAKB5o84+Qq+dJOcMlxnKPmpFV/Tl8XIg5CQRdMXskB1MxypJ1U/B+IGP9P5Lj0schAmq9VAs7iCj2DahYMj8qsL1jwCavBMLKocMcWzDx4vbq6cxmNFAGA+zK8j4V2cAHinBsHz4J1QgNS2YKuARFIbF3wFMY5MMnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670697; c=relaxed/simple;
	bh=ZXid7WqyFVPqqBScRL7NrGpk8FtE3ogwxkxbF/fqDBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScFhenKNI0/fJfnwIh999ROgV1XSHulPtST1cv8hLnfdDhCGaOSvd0hutsECeKPu7AhTtGPsjNBjz/TmFvFRI7aboGxYRA0xapi50WIQUratlFyAv5bw2WsbmwW3VKZ/jGU+Ez8iGlEUwyAtW5ngr7xmq6NqO3Mzyx7ddvF9JNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyVGurRm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540A2C4CEDF;
	Tue,  4 Feb 2025 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670694;
	bh=ZXid7WqyFVPqqBScRL7NrGpk8FtE3ogwxkxbF/fqDBM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NyVGurRmHZIUJJyBGW6O4Q4wG4jSi11UH7fHPTH9Y1ufLQzKt/hzlLRowvpp3q1wR
	 EDjQTbg4QCjaj2HUjguH0Gfwy2ncnmYwpXI4Zcj2hCww/qbD7DJq8lBheWb7/co544
	 T6iQjvxfjY2RRMRk4IfOA4O1diIhEm7/dj26vwUfEWDh6d9gV16WBeaisfDKxx9gE9
	 sjuk7Z73ive/9bB75ZPL3pqEEJzpfQ6RscHosmfHAQOaD7xgjKonWTWIox4hqraatJ
	 QdybGwdrdlwbQdkXIA9z7BtmcutsF/wab9+iHAt8FvST1ZLErjHgqAOcVUH3/qUF02
	 oJ9t2jX17Y3eg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 04 Feb 2025 13:02:12 +0100
Subject: [PATCH v5 5/5] rust: add parameter support to the `module!` macro
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-module-params-v3-v5-5-bf5ec2041625@kernel.org>
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
In-Reply-To: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=23998;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=ZXid7WqyFVPqqBScRL7NrGpk8FtE3ogwxkxbF/fqDBM=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnogHacM7SLgxg3nSN0Q+/YKJOvEyyf65aN6p0D
 NAM6OJROzqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6IB2gAKCRDhuBo+eShj
 dwIJD/wKwR+dCipr92fTx7WwVKIxQ6YMyZ8FEpWD0KBr+jVVIVthksFuT/JyDyRL97ETEEGUNM1
 i7YkXW0iQX1R2+eNFGAB0IXHwT90s2GedvAChSRagi3dIhQGtahaWIEUHvLUC5Mc7aOPMWjGu4R
 XHnMGopQo5XQBkHXMzVnsCSOgo1cUDA2d2l7U0gy0pRRAvTi56+5/QdC8/KUV0E5BIQ88fa3/6O
 4K1cFi8dIRD3EhQcbuFiEojDFUG0IYLv0/JcMnvO4RIKI0rAtV7DxfbydLDiBl8smg7Up0yEGDw
 tHfaAMselVevkSNlpEohfSfP5NC1aWwjIcEAwc8VcyghUIt1k3XbLArZX9Pzs0JE8P66u5YdcZo
 bOt1U798e3kXpFMFG+vrnPeCdDpxlXNSQIiOqj2KdiSWpNwnVyNRr6M+RtCSYoDrl0FR+ufVTN5
 EO/O8+1gIVMw7B8lWdlJdY2O58JSYhEixSEz0nOnS+wWnpKWm3Ps5ShCjxhJgysLM/XQCC84y4F
 vYBqsOeGrUdkUtcglsBwgUkqZMEDVDmd9huhFhdlQwcoGu5cx9P+YXmmcWeCRPr/zzjvXehfeGH
 JpGn8dhSV34atMxUE505rDdh+MOdazyM2Gd2mCTHuxcyhraw+PiGezh5GmOYzdPfs9G6umewj5/
 mZGIpp6MtDqTuLQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch includes changes required for Rust kernel modules to utilize
module parameters. This code implements read only support for integer
types without `sysfs` support.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 225 +++++++++++++++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  14 +++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 188 ++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 6 files changed, 451 insertions(+), 18 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ee48cf68c3111190e5827e8a11592946be5ade70..3d3b0d346b248a8fb30c4c1514fa798a65b3e899 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -57,6 +57,7 @@
 pub mod kunit;
 pub mod list;
 pub mod miscdevice;
+pub mod module_param;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod of;
diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
new file mode 100644
index 0000000000000000000000000000000000000000..6c0f5691f33c00adbdc593a26377f5db2a528697
--- /dev/null
+++ b/rust/kernel/module_param.rs
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types for module parameters.
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
+// SAFETY: C kernel handles serializing access to this type. We never access
+// from Rust module.
+unsafe impl Sync for RacyKernelParam {}
+
+/// Types that can be used for module parameters.
+///
+/// Note that displaying the type in `sysfs` will fail if
+/// [`Display`](core::fmt::Display) implementation would write more than
+/// [`PAGE_SIZE`] - 1 bytes.
+///
+/// [`PAGE_SIZE`]: `bindings::PAGE_SIZE`
+pub trait ModuleParam: Sized {
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
+    fn try_from_param_arg(arg: &'static [u8]) -> Result<Self>;
+}
+
+/// Set the module parameter from a string.
+///
+/// Used to set the parameter value at kernel initialization, when loading
+/// the module or when set through `sysfs`.
+///
+/// `param.arg` is a pointer to `*mut T` as set up by the [`module!`]
+/// macro.
+///
+/// See `struct kernel_param_ops.set`.
+///
+/// # Safety
+///
+/// If `val` is non-null then it must point to a valid null-terminated
+/// string. The `arg` field of `param` must be an instance of `T`.
+///
+/// # Invariants
+///
+/// Currently, we only support read-only parameters that are not readable
+/// from `sysfs`. Thus, this function is only called at kernel
+/// initialization time, or at module load time, and we have exclusive
+/// access to the parameter for the duration of the function.
+///
+/// [`module!`]: macros::module
+unsafe extern "C" fn set_param<T>(
+    val: *const kernel::ffi::c_char,
+    param: *const crate::bindings::kernel_param,
+) -> core::ffi::c_int
+where
+    T: ModuleParam,
+{
+    // NOTE: If we start supporting arguments without values, val _is_ allowed
+    // to be null here.
+    if val.is_null() {
+        crate::pr_warn_once!("Null pointer passed to `module_param::set_param`");
+        return crate::error::code::EINVAL.to_errno();
+    }
+
+    // SAFETY: By function safety requirement, val is non-null and
+    // null-terminated. By C API contract, `val` is live and valid for reads
+    // for the duration of this function.
+    let arg = unsafe { CStr::from_char_ptr(val).as_bytes() };
+
+    crate::error::from_result(|| {
+        let new_value = T::try_from_param_arg(arg)?;
+
+        // SAFETY: `param` is guaranteed to be valid by C API contract
+        // and `arg` is guaranteed to point to an instance of `T`.
+        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
+
+        // SAFETY: `old_value` is valid for writes, as we have exclusive
+        // access. `old_value` is pointing to an initialized static, and
+        // so it is properly initialized.
+        unsafe { core::ptr::replace(old_value, new_value) };
+        Ok(0)
+    })
+}
+
+/// Drop the parameter.
+///
+/// Called when unloading a module.
+///
+/// # Safety
+///
+/// The `arg` field of `param` must be an initialized instance of `T`.
+unsafe extern "C" fn free<T>(arg: *mut core::ffi::c_void)
+where
+    T: ModuleParam,
+{
+    // SAFETY: By function safety requirement, `arg` is an initialized
+    // instance of `T`. By C API contract, `arg` will not be used after
+    // this function returns.
+    unsafe { core::ptr::drop_in_place(arg as *mut T) };
+}
+
+macro_rules! impl_int_module_param {
+    ($ty:ident) => {
+        impl ModuleParam for $ty {
+            type Value = $ty;
+
+            fn try_from_param_arg(arg: &'static [u8]) -> Result<Self> {
+                let bstr = BStr::from_bytes(arg);
+                <$ty as crate::str::parse_int::ParseInt>::from_str(bstr)
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
+        ///
+        /// Static [`kernel_param_ops`](srctree/include/linux/moduleparam.h)
+        /// struct generated by `make_param_ops`
+        #[doc = concat!("for [`", stringify!($ty), "`].")]
+        pub static $ops: $crate::bindings::kernel_param_ops = $crate::bindings::kernel_param_ops {
+            flags: 0,
+            set: Some(set_param::<$ty>),
+            get: None,
+            free: Some(free::<$ty>),
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
diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index 563dcd2b7ace5e8322d0fddb409571cca2dd31ea..5efed578e3d5d851b460f83b29a4a95e2f106e64 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -107,6 +107,20 @@ pub(crate) struct Generics {
     pub(crate) ty_generics: Vec<TokenTree>,
 }
 
+/// Parse a token stream of the form `expected_name: "value",` and return the
+/// string in the position of "value".
+///
+/// # Panics
+///
+/// - On parse error.
+pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, expected_name: &str) -> String {
+    assert_eq!(expect_ident(it), expected_name);
+    assert_eq!(expect_punct(it), ':');
+    let string = expect_string(it);
+    assert_eq!(expect_punct(it), ',');
+    string
+}
+
 /// Parses the given `TokenStream` into `Generics` and the rest.
 ///
 /// The generics are not present in the rest, but a where clause might remain.
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index d61bc6a56425e97718518f727524de73c04e6153..2778292f8cee170f4e2c7d4f451ef9ea1329d18f 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -24,6 +24,30 @@
 /// The `type` argument should be a type which implements the [`Module`]
 /// trait. Also accepts various forms of kernel metadata.
 ///
+/// The `params` field describe module parameters. Each entry has the form
+///
+/// ```ignore
+/// parameter_name: type {
+///     default: default_value,
+///     description: "Description",
+/// }
+/// ```
+///
+/// `type` may be one of
+///
+/// - [`i8`]
+/// - [`u8`]
+/// - [`i8`]
+/// - [`u8`]
+/// - [`i16`]
+/// - [`u16`]
+/// - [`i32`]
+/// - [`u32`]
+/// - [`i64`]
+/// - [`u64`]
+/// - [`isize`]
+/// - [`usize`]
+///
 /// C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
 ///
 /// [`Module`]: ../kernel/trait.Module.html
@@ -40,6 +64,12 @@
 ///     description: "My very own kernel module!",
 ///     license: "GPL",
 ///     alias: ["alternate_module_name"],
+///     params: {
+///         my_parameter: i64 {
+///             default: 1,
+///             description: "This parameter has a default of 1",
+///         },
+///     },
 /// }
 ///
 /// struct MyModule(i32);
@@ -48,6 +78,7 @@
 ///     fn init(_module: &'static ThisModule) -> Result<Self> {
 ///         let foo: i32 = 42;
 ///         pr_info!("I contain:  {}\n", foo);
+///         pr_info!("i32 param is:  {}\n", module_parameters::my_parameter.read());
 ///         Ok(Self(foo))
 ///     }
 /// }
diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index cdf94f4982dfc109ac5c7e9001897555de19d67e..be64f99599ec6dc84c5a845527b1658f6567a6c0 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -26,6 +26,7 @@ struct ModInfoBuilder<'a> {
     module: &'a str,
     counter: usize,
     buffer: String,
+    param_buffer: String,
 }
 
 impl<'a> ModInfoBuilder<'a> {
@@ -34,10 +35,11 @@ fn new(module: &'a str) -> Self {
             module,
             counter: 0,
             buffer: String::new(),
+            param_buffer: String::new(),
         }
     }
 
-    fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
+    fn emit_base(&mut self, field: &str, content: &str, builtin: bool, param: bool) {
         let string = if builtin {
             // Built-in modules prefix their modinfo strings by `module.`.
             format!(
@@ -51,8 +53,14 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
             format!("{field}={content}\0", field = field, content = content)
         };
 
+        let buffer = if param {
+            &mut self.param_buffer
+        } else {
+            &mut self.buffer
+        };
+
         write!(
-            &mut self.buffer,
+            buffer,
             "
                 {cfg}
                 #[doc(hidden)]
@@ -75,20 +83,113 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
         self.counter += 1;
     }
 
-    fn emit_only_builtin(&mut self, field: &str, content: &str) {
-        self.emit_base(field, content, true)
+    fn emit_only_builtin(&mut self, field: &str, content: &str, param: bool) {
+        self.emit_base(field, content, true, param)
     }
 
-    fn emit_only_loadable(&mut self, field: &str, content: &str) {
-        self.emit_base(field, content, false)
+    fn emit_only_loadable(&mut self, field: &str, content: &str, param: bool) {
+        self.emit_base(field, content, false, param)
     }
 
     fn emit(&mut self, field: &str, content: &str) {
-        self.emit_only_builtin(field, content);
-        self.emit_only_loadable(field, content);
+        self.emit_internal(field, content, false);
+    }
+
+    fn emit_internal(&mut self, field: &str, content: &str, param: bool) {
+        self.emit_only_builtin(field, content, param);
+        self.emit_only_loadable(field, content, param);
+    }
+
+    fn emit_param(&mut self, field: &str, param: &str, content: &str) {
+        let content = format!("{param}:{content}", param = param, content = content);
+        self.emit_internal(field, &content, true);
+    }
+
+    fn emit_params(&mut self, info: &ModuleInfo) {
+        let Some(params) = &info.params else {
+            return;
+        };
+
+        for param in params {
+            let ops = param_ops_path(&param.ptype);
+
+            // Note: The spelling of these fields is dictated by the user space
+            // tool `modinfo`.
+            self.emit_param("parmtype", &param.name, &param.ptype);
+            self.emit_param("parm", &param.name, &param.description);
+
+            write!(
+                self.param_buffer,
+                "
+                    pub(crate) static {param_name}:
+                        ::kernel::module_param::ModuleParamAccess<{param_type}> =
+                            ::kernel::module_param::ModuleParamAccess::new({param_default});
+
+                    #[link_section = \"__param\"]
+                    #[used]
+                    static __{module_name}_{param_name}_struct:
+                        ::kernel::module_param::RacyKernelParam =
+                        ::kernel::module_param::RacyKernelParam(::kernel::bindings::kernel_param {{
+                            name: if cfg!(MODULE) {{
+                                ::kernel::c_str!(\"{param_name}\").as_bytes_with_nul()
+                            }} else {{
+                                ::kernel::c_str!(\"{module_name}.{param_name}\").as_bytes_with_nul()
+                            }}.as_ptr(),
+                            // SAFETY: `__this_module` is constructed by the kernel at load time
+                            // and will not be freed until the module is unloaded.
+                            #[cfg(MODULE)]
+                            mod_: unsafe {{
+                                (&::kernel::bindings::__this_module
+                                    as *const ::kernel::bindings::module)
+                                    .cast_mut()
+                            }},
+                            #[cfg(not(MODULE))]
+                            mod_: ::core::ptr::null_mut(),
+                            ops: &{ops} as *const ::kernel::bindings::kernel_param_ops,
+                            perm: 0, // Will not appear in sysfs
+                            level: -1,
+                            flags: 0,
+                            __bindgen_anon_1:
+                                ::kernel::bindings::kernel_param__bindgen_ty_1 {{
+                                    arg: {param_name}.as_mut_ptr().cast()
+                                }},
+                        }});
+                ",
+                module_name = info.name,
+                param_type = param.ptype,
+                param_default = param.default,
+                param_name = param.name,
+                ops = ops,
+            )
+            .unwrap();
+        }
+    }
+}
+
+fn param_ops_path(param_type: &str) -> &'static str {
+    match param_type {
+        "i8" => "::kernel::module_param::PARAM_OPS_I8",
+        "u8" => "::kernel::module_param::PARAM_OPS_U8",
+        "i16" => "::kernel::module_param::PARAM_OPS_I16",
+        "u16" => "::kernel::module_param::PARAM_OPS_U16",
+        "i32" => "::kernel::module_param::PARAM_OPS_I32",
+        "u32" => "::kernel::module_param::PARAM_OPS_U32",
+        "i64" => "::kernel::module_param::PARAM_OPS_I64",
+        "u64" => "::kernel::module_param::PARAM_OPS_U64",
+        "isize" => "::kernel::module_param::PARAM_OPS_ISIZE",
+        "usize" => "::kernel::module_param::PARAM_OPS_USIZE",
+        t => panic!("Unsupported parameter type {}", t),
     }
 }
 
+fn expect_param_default(param_it: &mut token_stream::IntoIter) -> String {
+    assert_eq!(expect_ident(param_it), "default");
+    assert_eq!(expect_punct(param_it), ':');
+    let default = try_literal(param_it).expect("Expected default param value");
+    assert_eq!(expect_punct(param_it), ',');
+    default
+}
+
 #[derive(Debug, Default)]
 struct ModuleInfo {
     type_: String,
@@ -98,6 +199,50 @@ struct ModuleInfo {
     description: Option<String>,
     alias: Option<Vec<String>>,
     firmware: Option<Vec<String>>,
+    params: Option<Vec<Parameter>>,
+}
+
+#[derive(Debug)]
+struct Parameter {
+    name: String,
+    ptype: String,
+    default: String,
+    description: String,
+}
+
+fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
+    let params = expect_group(it);
+    assert_eq!(params.delimiter(), Delimiter::Brace);
+    let mut it = params.stream().into_iter();
+    let mut parsed = Vec::new();
+
+    loop {
+        let param_name = match it.next() {
+            Some(TokenTree::Ident(ident)) => ident.to_string(),
+            Some(_) => panic!("Expected Ident or end"),
+            None => break,
+        };
+
+        assert_eq!(expect_punct(&mut it), ':');
+        let param_type = expect_ident(&mut it);
+        let group = expect_group(&mut it);
+        assert_eq!(group.delimiter(), Delimiter::Brace);
+        assert_eq!(expect_punct(&mut it), ',');
+
+        let mut param_it = group.stream().into_iter();
+        let param_default = expect_param_default(&mut param_it);
+        let param_description = expect_string_field(&mut param_it, "description");
+        expect_end(&mut param_it);
+
+        parsed.push(Parameter {
+            name: param_name,
+            ptype: param_type,
+            default: param_default,
+            description: param_description,
+        })
+    }
+
+    parsed
 }
 
 impl ModuleInfo {
@@ -112,6 +257,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             "license",
             "alias",
             "firmware",
+            "params",
         ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
@@ -140,6 +286,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
                 "firmware" => info.firmware = Some(expect_string_array(it)),
+                "params" => info.params = Some(expect_params(it)),
                 _ => panic!(
                     "Unknown key \"{}\". Valid keys are: {:?}.",
                     key, EXPECTED_KEYS
@@ -183,28 +330,30 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     let info = ModuleInfo::parse(&mut it);
 
     let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
-    if let Some(author) = info.author {
-        modinfo.emit("author", &author);
+    if let Some(author) = &info.author {
+        modinfo.emit("author", author);
     }
-    if let Some(description) = info.description {
-        modinfo.emit("description", &description);
+    if let Some(description) = &info.description {
+        modinfo.emit("description", description);
     }
     modinfo.emit("license", &info.license);
-    if let Some(aliases) = info.alias {
+    if let Some(aliases) = &info.alias {
         for alias in aliases {
-            modinfo.emit("alias", &alias);
+            modinfo.emit("alias", alias);
         }
     }
-    if let Some(firmware) = info.firmware {
+    if let Some(firmware) = &info.firmware {
         for fw in firmware {
-            modinfo.emit("firmware", &fw);
+            modinfo.emit("firmware", fw);
         }
     }
 
     // Built-in modules also export the `file` modinfo string.
     let file =
         std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFILE environmental variable");
-    modinfo.emit_only_builtin("file", &file);
+    modinfo.emit_only_builtin("file", &file, false);
+
+    modinfo.emit_params(&info);
 
     format!(
         "
@@ -362,14 +511,17 @@ unsafe fn __exit() {{
                             __MOD.assume_init_drop();
                         }}
                     }}
-
                     {modinfo}
                 }}
             }}
+            mod module_parameters {{
+                {params}
+            }}
         ",
         type_ = info.type_,
         name = info.name,
         modinfo = modinfo.buffer,
+        params = modinfo.param_buffer,
         initcall_section = ".initcall6.init"
     )
     .parse()
diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 4aaf117bf8e3c0cc77e188b1ad0708e3650a6654..d999a77c6eb9a0db9acf5fa03d4feca5e6525fc8 100644
--- a/samples/rust/rust_minimal.rs
+++ b/samples/rust/rust_minimal.rs
@@ -10,6 +10,12 @@
     author: "Rust for Linux Contributors",
     description: "Rust minimal sample",
     license: "GPL",
+    params: {
+        test_parameter: i64 {
+            default: 1,
+            description: "This parameter has a default of 1",
+        },
+    },
 }
 
 struct RustMinimal {
@@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Rust minimal sample (init)\n");
         pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
+        pr_info!(
+            "My parameter: {}\n",
+            *module_parameters::test_parameter.get()
+        );
 
         let mut numbers = KVec::new();
         numbers.push(72, GFP_KERNEL)?;

-- 
2.47.0



