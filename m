Return-Path: <linux-kbuild+bounces-5921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC4A481FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65A8F19C3731
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0C6235C11;
	Thu, 27 Feb 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaI2wxXh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DA0270032;
	Thu, 27 Feb 2025 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667150; cv=none; b=ZIR5SvqcqM2SWJ7yYypqElmMfIaV2PopQisHs/otG+WgzkNd/yr/+1ku1c011ir/2gIRvpabzJh9wXWgkDF9Jadcl3W5g51DOwRiHXWEe+mnS2VX56yb8JGEEZgkI459bpjSeb2btO2Nlz5xMJCD+3Zm4MwDoabmzF8+dFq9x/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667150; c=relaxed/simple;
	bh=ttgs/YpJ0rHLb7Cc1B0bfNPNLpHlHwxbwzwKM5Hx0Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQbqhWZdHoMllF/plCjkg8605u9xmQAJ94ojuDF3BPITGLxlozE3aS9yFIdcvo0t+IgSrmUIkQrRuQYbKGwGIEJ32wx+rbQulFFwxvomz91a95iKKC7Jon7oc5RyNDiGNQY/avRueAYMv4fzfK8Ui9ri8sT2T94OSe7exQ6fMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaI2wxXh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217ACC4CEDD;
	Thu, 27 Feb 2025 14:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667149;
	bh=ttgs/YpJ0rHLb7Cc1B0bfNPNLpHlHwxbwzwKM5Hx0Gk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IaI2wxXhBqMwTEmQokfHmVQlbUagtOmaZ3Urs3yc0atk0mJC1I5cK/PkNSflosaOy
	 bi55Dj901cV48E8gSgYa5dkcssO46McYTODJzDnDRt+HeYAhvrwuk2uPfLoXXghuxK
	 6T1HFCDktZOd3wlSHNnojWQ5oDfipgbQ/8MTA7rcQNoOyAJblNcc43lSQ1Yzl6Djmm
	 h3uhI0M5K7ZP/bqeKWD01B1Z4JgnlowCqwua7Mm9igRbz0VYc2sbfPjvOEKvtQb6/M
	 kEVtDifIaMwgqESjhLVGGAlP16QyMCmV3uQuJJXab5eDY3+pPQjSSTngqESYjuubjb
	 bB9mgdpElFyvw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 27 Feb 2025 15:38:12 +0100
Subject: [PATCH v8 6/7] rust: add parameter support to the `module!` macro
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-module-params-v3-v8-6-ceeee85d9347@kernel.org>
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
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
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=24297;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=ttgs/YpJ0rHLb7Cc1B0bfNPNLpHlHwxbwzwKM5Hx0Gk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjVL3ddBanVpueQP+bgDqpNys4AChwOhHpBZ
 DpckFodptqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B41QAKCRDhuBo+eShj
 d/aiEACMvPxfn6shD/wmclbN+XQl8nbh2YnhP3/Unev1DgNmUoC4epKcHQkJKRrZR7AApDGjR1O
 t9rlVptvvsEH3ir2//UexAelKviXPS9w8erw7tD6S7Gku0XTwt5uyJHQ3g1yJgAxM7Wkinp03GW
 P/vFznVh1xW8ZWJFsTu9Rxfr1+FLAWWtR4G8HRLJP7E7NbOvmAOoCwiXzaAV0IaYOxDQffjkwRS
 HdfLeq2nhayN3Y+g81Oc+IBanQBz8dckPhlUItdF+dS2jZymSbjc/KBZDFTtFX5g5Q+CRfWHzxC
 XYZ9eyUn/W4o03mKRFVgHZJg1tqzEvZNxBWmbWkF0OMTI6IsyejQhjF3aDtVY9IzwvUT2ovIxoL
 DYhhRKIrEIq9vJlwMnbSFOJ9JipkK9FrjrxdB05GIiGFMRWWIiyfPuCOhZKoegwjaFZf4TVF1Rm
 t+K0jW3HpGctnsoPG/owRMZCQ6MrtTRn9HkQ2TX9lNtCjGASew1MedbfhvEg8QmnJ5dliuqF9sD
 11WmVKRzXRWK04GBKNY+4RnpxPIvAg3tPBOgVtWXFL0nTD25pV8GdUTJicOwTKevV/9r0TvC8Et
 LV9q72cue9esSJYsbmhMRKAfhNpEXHRL/ofivimHPzcACeMS+LsAU03rHQ/2yM+4jinnFtBmRxF
 4FYLvTYm/ODHIFQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add support for module parameters to the `module!` macro. Implement read
only support for integer types without `sysfs` support.

Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 221 +++++++++++++++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 +++++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 191 +++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 6 files changed, 461 insertions(+), 18 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 496ed32b0911..aec04df2bac9 100644
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
index 000000000000..0f153aa64dae
--- /dev/null
+++ b/rust/kernel/module_param.rs
@@ -0,0 +1,221 @@
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
+/// - If `val` is non-null then it must point to a valid null-terminated string.
+///   The `arg` field of `param` must be an instance of `T`.
+/// - `param.arg` must be a pointer to valid `*mut T` as set up by the
+///   [`module!`] macro.
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
+        // TODO: Use pr_warn_once available.
+        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
+        return EINVAL.to_errno();
+    }
+
+    // SAFETY: By function safety requirement, val is non-null and
+    // null-terminated. By C API contract, `val` is live and valid for reads
+    // for the duration of this function.
+    let arg = unsafe { CStr::from_char_ptr(val) };
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
index 563dcd2b7ace..ffc9f0cccddc 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -10,6 +10,17 @@ pub(crate) fn try_ident(it: &mut token_stream::IntoIter) -> Option<String> {
     }
 }
 
+pub(crate) fn try_sign(it: &mut token_stream::IntoIter) -> Option<char> {
+    let peek = it.clone().next();
+    match peek {
+        Some(TokenTree::Punct(punct)) if punct.as_char() == '-' => {
+            let _ = it.next();
+            Some(punct.as_char())
+        }
+        _ => None,
+    }
+}
+
 pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> Option<String> {
     if let Some(TokenTree::Literal(literal)) = it.next() {
         Some(literal.to_string())
@@ -107,6 +118,20 @@ pub(crate) struct Generics {
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
index d61bc6a56425..2778292f8cee 100644
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
index cdf94f4982df..e6af3ae5fe80 100644
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
@@ -75,20 +83,116 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
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
+    let sign = try_sign(param_it);
+    let default = try_literal(param_it).expect("Expected default param value");
+    assert_eq!(expect_punct(param_it), ',');
+    let mut value = sign.map(String::from).unwrap_or_default();
+    value.push_str(&default);
+    value
+}
+
 #[derive(Debug, Default)]
 struct ModuleInfo {
     type_: String,
@@ -98,6 +202,50 @@ struct ModuleInfo {
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
@@ -112,6 +260,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
             "license",
             "alias",
             "firmware",
+            "params",
         ];
         const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
         let mut seen_keys = Vec::new();
@@ -140,6 +289,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
                 "license" => info.license = expect_string_ascii(it),
                 "alias" => info.alias = Some(expect_string_array(it)),
                 "firmware" => info.firmware = Some(expect_string_array(it)),
+                "params" => info.params = Some(expect_params(it)),
                 _ => panic!(
                     "Unknown key \"{}\". Valid keys are: {:?}.",
                     key, EXPECTED_KEYS
@@ -183,28 +333,30 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
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
@@ -362,14 +514,17 @@ unsafe fn __exit() {{
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
index 4aaf117bf8e3..cbe8c6346648 100644
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
+            "test_parameter: {}\n",
+            *module_parameters::test_parameter.get()
+        );
 
         let mut numbers = KVec::new();
         numbers.push(72, GFP_KERNEL)?;

-- 
2.47.0



