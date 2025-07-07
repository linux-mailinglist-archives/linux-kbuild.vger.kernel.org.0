Return-Path: <linux-kbuild+bounces-7904-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE3FAFB4A6
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B581AA5391
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 13:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC0E2BE040;
	Mon,  7 Jul 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCRc6Qi5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA92BCF65;
	Mon,  7 Jul 2025 13:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895153; cv=none; b=Iu7DfOOjjWXQZiVLguu02kjcTwuB/4jaXpgPma2ufKEn8MEPIZYj95Qv+IKd3Q+TAQsRP9kmviR2xUgyMbx0sK/9RYpU5UALO9b+sQIbZdSDzI+2X0247X62EqM9ommZni86vXQc+UDBSdXryiup9KVA5eypCyoGzBqCNmqvPmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895153; c=relaxed/simple;
	bh=IaejDxR65nfkpFtQKTy5h1EB3F8o0R9aHHtFm2+Kn0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkrgYo1H9tLSIeAczf6dzTozdoB6TX66VjPzrkNUC7sNfd6KZQJkqjG0/OmyK9byA8PEI2iCNp9O5Z762NYMCkbDaY4dup9hiWxy3qzZK6/kFivb0O1V7Z7T08SDtVFMpPJHMD/Lk9I+jDWaQXqmWEgxkwvajKldcwqT2uXsAAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCRc6Qi5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 255FCC4CEE3;
	Mon,  7 Jul 2025 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895152;
	bh=IaejDxR65nfkpFtQKTy5h1EB3F8o0R9aHHtFm2+Kn0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VCRc6Qi5mCEQW/TK0And5ymZ9U35Mqo/TTcU9pqcRNn2kXfS5v9Wspi6Naz1uVpOz
	 XrakJKJceH2DPwuDi60vb6xhXSfAb2hYrdnWfH8nZ0MRmwp0aMER3FkKnaTuGAUqxA
	 o61ynVPrLl9+Ui27gGVxtb3OWy+QJXF9iz6jMvr2F9KYT9gRTNBL8Y8SSNuoJa5FWf
	 MtfpTk3V2NAC6UltOAUjcXAHIk2MMRo2FnRXPMZIdXX6XEqBhRIG1k0UKio7k0vUGe
	 8b85XRc1F05MoaY6gRDg2A5jhaq2AUghkbT82dSz8ajyYvfgzZjK+cmjcEKewsYXh4
	 0fUHJEY4paYGw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 07 Jul 2025 15:29:07 +0200
Subject: [PATCH v15 3/7] rust: introduce module_param module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-module-params-v3-v15-3-c1f4269a57b9@kernel.org>
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
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
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoa8u1qxbI1VdAOIpBynkexLMcecjIBLkc92Qi2
 fvYhuIlXLmJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGvLtQAKCRDhuBo+eShj
 d6tmEACXL7nxGIxDceWvCjdEzYAxsBso+yiA51ayCAmihXfYTJX7FKPeMU1qJuoUZFSXNESyXrp
 C7sEpG1cA3e034MzuhKizyuUOWeeXjDU2/51/Ba/InZVXXh2tJgJTPAm7jMDceoH4WiB0L4emXo
 FmveXG9VI4aHWtjxwTjfpkP8u+DSLjIaf+ZTwWdic8nu03O3Fra3miAQTzmg6yPKVJC2CRmvO9S
 o23ZWapPb0jwYRGQcfupXDWKVkge7HmloOhQyYEaGEDKoe2aXtCZOLUH+1Ycu5V38tXO+BXsBN9
 qeZqR4OHIlJIme/sBy1SIOPjciXoCAQMKvMaRdMqDZaHISRLbTypLaFtOhGTuyZ8QBFtjU7SKyn
 iYUtxGELB6LTtPeXydRhVyGHEo0MdJSuspJGwbgFegMMgdPtJmNcvA74rH2qk2fjF3WilypE9zH
 19+O+2S76QjZjREQg4tWdNJ4xBFAn3B1iAD+METAkjUAAFIVkKuO0oUGM9oJfgfpBLLBc3wq9vU
 XB8UMSEzuh473vVnfFp4IXbCwEEwRVBN0443WoxK6ZYepj8qvm6h3uYSqrq9sOwjrGCsS5kxoxM
 Ty441xv3l6ytFCIwHTUn+X7ydD3WOSv0Gd5FCvMhq0WLFjgJw/xJ93kpGZwzMQV8PeRZIz1FaWn
 DD75LkmDSwN7xcQ==
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



