Return-Path: <linux-kbuild+bounces-5115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 620229F0B58
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 140BD1886F39
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF451E0B7F;
	Fri, 13 Dec 2024 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ko1RCqCm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1EE1DF759;
	Fri, 13 Dec 2024 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089637; cv=none; b=Zx51EuHvgM8rFkzt2EvP/wvElh6NSNLuAi7E/C1J9Fm5cAvWqtkiUdtFMBjXRJFDWsjI0yYC2o9ZcEG4ichVK4js77Y2h0hHo4NZucIsV+Izcm3flPvflDfa21cSch0oIAvfqlYbMrpsJDrf3t4V9wwDti/72YnI0JH3DueebZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089637; c=relaxed/simple;
	bh=ktGoI5KcC/svCt0+oyxoVWuisRCH4jrzYeg6g6BG3aU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZSkQE5gf0+fQ1SRz4g0Ej7pz4KJQ9AoolZhECf66fJDWDuLUWFpFUPHrZ+WPfDofGTTp3DDPBqDi1bGkjHS+rtXXB+3Cz1JvUf+q/55wGcVv5C4+0DY0i70vYHj+hFi+wgOSJoGMcSkHnIX5oL36TpcmxaoPniiJopGuctuwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ko1RCqCm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCA0C4CED0;
	Fri, 13 Dec 2024 11:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734089637;
	bh=ktGoI5KcC/svCt0+oyxoVWuisRCH4jrzYeg6g6BG3aU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ko1RCqCmnTzNOiWlH3pFE0eDjV7B0xZrMJx7r/r6a+iW/JnAqC9xqjTvJVXVF6Osm
	 tweyj2FlxfVMHEbUgyyObsnC+IhY9S37TnUvKmmIt1Zel8KYt1EF+8iO4Yo8ew8JSG
	 Lfr7hkUCMF+EUhnxEi85EMlV5im/HzSuRzTV0cKm77tmbuUkKLb55yTUm0QWcurFl+
	 0QoVhdVCV8B1gxjyd5w0A9Pbk8eurBSm5oVWbDLSfzAp9lOhRdxFvhd7rpUDhbfEFd
	 dbcrKpBRVh0O2wVVjXn7fwIhrBUCCLYh7COfkn7w821Jsft44hKu4j1hoW6Bi9ApSw
	 kz0wfWvRNj2ug==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 13 Dec 2024 12:30:49 +0100
Subject: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
In-Reply-To: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=25123;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=ktGoI5KcC/svCt0+oyxoVWuisRCH4jrzYeg6g6BG3aU=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnXBr5HsOTe9PRdAw4uhSYDUCNoYLsCvAKpxIVg
 K8Ztz0a6LyJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ1wa+QAKCRDhuBo+eShj
 d13iD/wKw75zpmGSQ4pYx8B6GkA4QZAHfqTfmuTNAZTyq8AXIrvux9zZLm8et5XXVHxuLvbDP1C
 fId/v9NbkYAvb9S0WOV5BODelh6VAkvczVBuUQvRzdNCaZO6Xei2gI79vvOEKpouczMKjRml+tK
 WvVG/KDAyNlX0TpKDoDiZmjKyae5eQYh0E1C7zCu8pXqCaMGfw7xZDKxwHT9elaghmSN9tjFIea
 +Oy1mBQirSSxMmqkwOgY+UgeQt1k8ipVDLW5OU9oXQhWpW0tyQ79W/gcbPz6XvZ9I3cR0Sdijx8
 pHPphSLBlYDWT8zgsxljyPhAlL/IN2RmmXOcs17KsNuomz/rjI7iYy6Jfmd/u1RFE8+nTBf60lY
 0Aqt54+MbwJ+dE84eDJe9MRpeDAhWCQ7vbG+hbl/JpADqOlAYKLmeTaa4OCDOqDi8nHhxx2RhUI
 GC19BgkT4d9/4+t3z5z54LJMYi6f4eYAzRQ+gze6Yi/wDmnsHUfbtw1quI+OiZUdiYjYvyZXX+4
 tNHvxpp4rau5ysPUrXY5pqhnorI7ST7MQVE/2az5b9K7RrPq5SAtQ6XNpYBAAr1Ey2SQ7rdiL5w
 sOPFZbm6LKNToTjjhfDPAUHRdAywQVMJf+mOzfgQOQ9MESx9QmLyCH5gZ7nuniojwd7w/E4RLTu
 iZ3zyvHK8XQKr4Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch includes changes required for Rust kernel modules to utilize
module parameters. This code implements read only support for integer
types without `sysfs` support.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs           |   2 +
 rust/kernel/module_param.rs  | 238 +++++++++++++++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  10 ++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 188 ++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 scripts/Makefile.build       |   2 +-
 7 files changed, 462 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a39e68d6379031d80d4be336e652a3..7670c47a967cdd7e4f63e00b8338c6042e391fee 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -18,6 +18,7 @@
 #![feature(inline_const)]
 #![feature(lint_reasons)]
 #![feature(unsize)]
+#![feature(sync_unsafe_cell)]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
@@ -46,6 +47,7 @@
 pub mod kunit;
 pub mod list;
 pub mod miscdevice;
+pub mod module_param;
 #[cfg(CONFIG_NET)]
 pub mod net;
 pub mod page;
diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f63e50a6f02ff3f3fd1117717faf8fd37377c3f1
--- /dev/null
+++ b/rust/kernel/module_param.rs
@@ -0,0 +1,238 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types for module parameters.
+//!
+//! C header: [`include/linux/moduleparam.h`](../../../include/linux/moduleparam.h)
+
+use crate::prelude::*;
+use crate::str::BStr;
+
+/// Newtype to make `bindings::kernel_param` `Sync`.
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
+    /// The `ModuleParam` will be used by the kernel module through this type.
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
+    /// [`kmalloc`]: ../../../include/linux/slab.h
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
+    val: *const core::ffi::c_char,
+    param: *const crate::bindings::kernel_param,
+) -> core::ffi::c_int
+where
+    T: ModuleParam,
+{
+    // NOTE: If we start supporting arguments without values, val _is_ allowed
+    // to be null here.
+    assert!(!val.is_null());
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
+        // access. `old_value` is pointing to an initialized static, an
+        // so it is properly initialized.
+        unsafe { core::ptr::replace(old_value, new_value) };
+        Ok(0)
+    })
+}
+
+/// Write a string representation of the current parameter value to `buf`.
+///
+/// # Safety
+///
+/// Must not be called.
+///
+/// # Note
+///
+/// This should not be called as we declare all parameters as read only.
+#[allow(clippy::extra_unused_type_parameters)]
+unsafe extern "C" fn get_param<T>(
+    _buf: *mut core::ffi::c_char,
+    _param: *const crate::bindings::kernel_param,
+) -> core::ffi::c_int
+where
+    T: ModuleParam,
+{
+    unreachable!("Parameters are not readable");
+}
+
+/// Drop the parameter.
+///
+/// Called when unloading a module.
+///
+/// # Safety
+///
+/// The `arg` field of `param` must be an initialized instance of `Self`.
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
+    data: core::cell::SyncUnsafeCell<T>,
+}
+
+impl<T> ModuleParamAccess<T> {
+    #[doc(hidden)]
+    pub const fn new(value: T) -> Self {
+        Self {
+            data: core::cell::SyncUnsafeCell::new(value),
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
+/// Generate a static [`kernel_param_ops`](../../../include/linux/moduleparam.h) struct.
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
+        /// Static [`kernel_param_ops`](../../../include/linux/moduleparam.h)
+        /// struct generated by `make_param_ops`
+        #[doc = concat!("for [`", stringify!($ty), "`].")]
+        pub static $ops: $crate::bindings::kernel_param_ops = $crate::bindings::kernel_param_ops {
+            flags: 0,
+            set: Some(set_param::<$ty>),
+            get: Some(get_param::<$ty>),
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
index 563dcd2b7ace5e8322d0fddb409571cca2dd31ea..e4f2751e0f6bbd6a980ba57d630480f05682f59f 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -107,6 +107,16 @@ pub(crate) struct Generics {
     pub(crate) ty_generics: Vec<TokenTree>,
 }
 
+/// Parse a token stream of the form `expected_name: "value",` and return the
+/// string in the position of "value". Panics on parse error.
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
index 4ab94e44adfe3206faad159e81417ea41a35815b..a75d354e3eec49fd4066ac3dd96c4afda2606d50 100644
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
+/// - `i8`
+/// - `u8`
+/// - `i8`
+/// - `u8`
+/// - `i16`
+/// - `u16`
+/// - `i32`
+/// - `u32`
+/// - `i64`
+/// - `u64`
+/// - `isize`
+/// - `usize`
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
index 2587f41b0d3929af7ceac5f42b4711f70b4f8749..627279cf318b14b50128045bce980f9d60b9c6d0 100644
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
+                                c\"{module_name}.{param_name}\"
+                            }} else {{
+                                c\"{param_name}\"
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
@@ -358,14 +507,17 @@ unsafe fn __exit() {{
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
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index c16e4cf54d770fd2cf585a65dc4ad9b6a6bd6e42..dabae1007afcb376218e65b022df72c494c8ab51 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -213,7 +213,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,sync_unsafe_cell
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

-- 
2.47.0



