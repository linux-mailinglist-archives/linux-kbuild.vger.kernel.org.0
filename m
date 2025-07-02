Return-Path: <linux-kbuild+bounces-7834-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 350AAAF587C
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5883B4A0E5E
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8D128507A;
	Wed,  2 Jul 2025 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHKJeoJn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4051D27A13A;
	Wed,  2 Jul 2025 13:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462364; cv=none; b=sJswNbQSNx8yBZ9GgzN2eC2t59X/H1Hl2pFDtxlY4jQD6bV+E6Op8jHvutjPoUCENw80dBrdGcZTsFmCEEuLgfGTZO3pzXhD8hStXcCPuuDBTNow2r3tgLPfj09OF3rn+iAb5BRVciNehbPibYwfQtLT6AwJSr1mNdM7IAku8xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462364; c=relaxed/simple;
	bh=GINSHYwROTV6WI3RSAoMCRmq0RKzfKvRWX79JeAlh8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m6WdQXb++fluejyTDoL07WeWReisxQrSDxiRW/D+TGOiN743qnl5KM4Ra2QktQrEyssWX/TuFLG1jPfHvaat1pq2apkXyeYErbfLbhouYRLlOjkhWbOeUWqL0fVQWebjJmB4JZsdyXVDFSAbH0x7tr3d5fzf53hHtTj3ZExcRc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHKJeoJn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD0EC4CEEF;
	Wed,  2 Jul 2025 13:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462363;
	bh=GINSHYwROTV6WI3RSAoMCRmq0RKzfKvRWX79JeAlh8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bHKJeoJnTEzbknH914OXRflq+RbJpZ+iW7v7bTgSHZf9jqekqYFRQ8SpsUnTyZvxq
	 ev/PyaqvGGT8tWMuX5k7BH28fMN9t/lRZKW3CkP+7A1pGKukkpodGldhGHi9FAibrx
	 bpcWeYd4Nv5yEpjHrkCN6Ox5qwG139W3DF3qV355r43SBNHM2NF7eYoei1uW5gS0Gg
	 no2HJXh86mcvN2Yty6UyYW6ZqsonzAPV3Luk2hOEu5d5p/eXAGMcZzCcZzdPIdwgdz
	 j4kKFBvWm36bTzMLLvV1cdTXtakBZ3kmJAo7nrYaiwliLcrsDh5J1YN7gYY23VvfYs
	 kth86SZ80CO0w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 02 Jul 2025 15:18:35 +0200
Subject: [PATCH v14 3/7] rust: introduce module_param module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7330; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=GINSHYwROTV6WI3RSAoMCRmq0RKzfKvRWX79JeAlh8Y=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoZTG0VAFw3SWRtVJIdAn1HRC955GhaE4foFVRg
 DGl8dp6xYWJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGUxtAAKCRDhuBo+eShj
 d2OfEAC2Ns/toQDjzh0HLTj3WAAEGJcR+4EOHmUNJuw6Wr8ri1cHPmsBccPgKw9vq73OPpdlfbd
 F9gwfrBVy7XcwB2ernkxz0wBgkab2WkaZNeWwki/XqCNsPYVQJ84C+i/XfHG2fCt0Mg17FihPnV
 IL8yQSA9FLf61mdERtJ6HwC560GNckvGb0v5QysxfAc+aH7omhUkFFgbIFsM/XNuFGOdyg0bPVQ
 u86pMsFJMxuTjrrms1MADrnnQV7xKttbtshRR6hNumA4P8SMEEytg6n++EFG/WKLkQ/kvetO7oT
 K1jBrtLgoqpt4mqIEjBfALiPix6ZaFivCjzf8VQsLdDuBLXgFc4ijV/TTGUOvg7VOvFtqxu6mfB
 3Tc7j/reD8phAA04uF9iPESSnnFc4QcXNY8BwA+ziUCL9ul5ERuXJtoQNe0ZFsKtT5AN0N+PTHV
 3u6glZ25s1adrSCIHHt8fBFEZuLJEPi//kdhm4ScHzDE2M43mOTEqS1Df84IeThxYdZAXJI6g44
 3Rgfb1GcG5MtgRKOrzCU14elE323EEMtaj3Y1H87LlmY5h+gKPFJ87sh7CHi9D62e3hQsY1fmFD
 kZqo/gMSTKBOqAjH5rLLTZTrfCxCJTuH1zIPskQwxfYL5yhyLlfKyx10x4CVdLYkkIVG0nb3lYv
 K/hg2B8W7tRsuTg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add types and traits for interfacing the C moduleparam API.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/lib.rs          |   1 +
 rust/kernel/module_param.rs | 191 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 192 insertions(+)

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
index 000000000000..ca4be7e45ff7
--- /dev/null
+++ b/rust/kernel/module_param.rs
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for module parameters.
+//!
+//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
+
+use crate::prelude::*;
+use crate::str::BStr;
+use bindings;
+use kernel::sync::once_lock::OnceLock;
+
+/// Newtype to make `bindings::kernel_param` [`Sync`].
+#[repr(transparent)]
+#[doc(hidden)]
+pub struct RacyKernelParam(bindings::kernel_param);
+
+impl RacyKernelParam {
+    #[doc(hidden)]
+    pub const fn new(val: bindings::kernel_param) -> Self {
+        Self(val)
+    }
+}
+
+// SAFETY: C kernel handles serializing access to this type. We never access it
+// from Rust module.
+unsafe impl Sync for RacyKernelParam {}
+
+/// Types that can be used for module parameters.
+// NOTE: This trait is `Copy` because drop could produce unsoundness during teardown.
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
+        let container = unsafe { &*((*param).__bindgen_anon_1.arg as *mut OnceLock<T>) };
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
+            type Value = $ty;
+
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
+    value: OnceLock<T>,
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
+            value: OnceLock::new(),
+            default,
+        }
+    }
+
+    /// Get a shared reference to the parameter value.
+    // Note: When sysfs access to parameters are enabled, we have to pass in a
+    // held lock guard here.
+    pub fn get(&self) -> &T {
+        self.value.as_ref().unwrap_or(&self.default)
+    }
+
+    /// Get a mutable pointer to `self`.
+    ///
+    /// NOTE: In most cases it is not safe deref the returned pointer.
+    pub const fn as_void_ptr(&self) -> *mut c_void {
+        (self as *const Self).cast_mut().cast()
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



