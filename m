Return-Path: <linux-kbuild+bounces-5538-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A108CA195FD
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 17:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E4A03A789F
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 16:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE51214213;
	Wed, 22 Jan 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RgKgYm0a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6A42144C2
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737561704; cv=none; b=cpsWy91n2i1UzYkQ+ic4FDlvg43Ld3di/2wt5asRivD0vSxpuR6urosmFQvqRQUE19eBssfeJ01SklOjxjnRLq3dDYHYGmWVLJxNCNIlnhDHJ1ViFhHPpRq96X9lGrnPL1DIJBWTuI0cvhL9pkd7oNl670ARVtseokfJdUuKXfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737561704; c=relaxed/simple;
	bh=XzSFjmD86Sa0qPhMQsfSVd/Oep0edh0U7KfzHVbvBvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4KSW7L7E0Ss1dpiq8LI4CZNGjuxCmVbjogx75h65mIJJPISK9NgGX2DBQZkLafts+Z7MrMjYMUCvzkCMmfvjZxKdcQ3hRK3KHhw3QgwVDR9StpT+7vLGGqP7BhFH9Z15aGy3SoVcRKSpWU6DdG4L9wGDA/nf/EnlNW9gru6SxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RgKgYm0a; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e0e224cbso3768666f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737561699; x=1738166499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RfvVuhcBqHRzGD9FL0p9rhOYQmzMeY9GF5SEo3KCKn4=;
        b=RgKgYm0aFDZVKOKVte16NXFwTyPLDscbT+fuRAHctJodPgtb6G1GKnWP0AuzJfXWCh
         Ti6rYKzsXqh756vP/9gvyJPjJZjjzUusdJrR+u3DRGuXk6sHlG4ANFJAFQsl87J7B8lM
         Kka+EFryaFHSNAm1HhvEikSr9GDpn+KH3B65EVuLK2g7eAzklLGPkyvm2aY99CmtjHPl
         QQqqRflghKKNlqFz2YQ/v0fugbchncfR0D/c0oQbOrL49UnEUMo9CvCwbW8sVGB5C1eO
         G9JuOgdjLVZkLalB7ZBB/jhV4t6on7yIk+tKG3AX5jzzx3ioXL7xpTgCfiBz7SU+kRQG
         uEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737561699; x=1738166499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfvVuhcBqHRzGD9FL0p9rhOYQmzMeY9GF5SEo3KCKn4=;
        b=A53PxAl/n08y3Ouae4t33Zz/7PekC13OJR1mnKj0VH+0ZlPkNuHl5oH9Ngw/9al64F
         3IHouYnzhEu9Axbyshl7uoVGDZC02JPToxMJNQk9l5ztAgMOcK03nMpb+lUtpvm0QH6P
         ne7rw/Bbg7ukCizBETiIgnm4B9umLO629ej2ygLRc9lsw7LI5DVXFNGB64sMmQL0rDWv
         8JJUgBzeFmuribF1JABqWhg0xHNW3tdsHepgufLvG7oehJSfhAB3JkIPpOU3bsTay5vB
         9wIttFpNFIMCBqXcNFu6K4O6TDbxixmHXbMViXqqxqAxA8gE3vjcBTSK6GiPmxuU1UEi
         eBiw==
X-Forwarded-Encrypted: i=1; AJvYcCVHeBS117hy97kooL+dLvKY+LqaLuEJ7FgQ72lZrbqu3T8sX//9dys8SiZbnjX3DBqzF4ty1swsNeImiOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0wKLOjH+iMLGRHmHriTR6Uz+upoXSLm8a0DfR2hXxHD86Qzi2
	6GhNtaWQ7OIQ/F0gxJYMWt5K1fq7r9O/S05oxSGOJ291qledWLtdcP8bbPapRMU=
X-Gm-Gg: ASbGncteEXBDkvyi7zY3oLkaG0lrlgfUfK5puxjThuldaecl/nF0afTY3oG/F6mMkua
	qGXQw6OydtRb+ApPj4MOZhLpekKeU/uh6ok6I5FlEZiGXgguUXYPNf2I6FgQP04428BOKOw3IVN
	CK8jLH8diC1R3wM0dWXPnWcKDViYLc+CMJZm9Ij65FtqTVCu9XeUG//oGN+oEg5YjHxCOVN4Fn1
	ZFuWZxTfPcofmJu4q2oLs5MEqbvwMNZxEKkgMdO4w9/xJMPdKqs9M3OAYUStcTmvTY5nkObiQ==
X-Google-Smtp-Source: AGHT+IHZ0lQ7oiXH1Doak7hByIDH6uTWViUgFrSOcxKNrr+sYeMZAJh0GiK+40krEIkCpuILsebrqA==
X-Received: by 2002:a05:6000:1f81:b0:385:eb8b:3ec6 with SMTP id ffacd0b85a97d-38bf5674369mr21967415f8f.29.1737561696496;
        Wed, 22 Jan 2025 08:01:36 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ad81sm16808454f8f.52.2025.01.22.08.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:01:35 -0800 (PST)
Message-ID: <04419f26-1411-4e47-a0f0-f774064bc2f0@suse.com>
Date: Wed, 22 Jan 2025 17:01:32 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] rust: add parameter support to the `module!` macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
 <20250109-module-params-v3-v4-4-c208bcfbe11f@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250109-module-params-v3-v4-4-c208bcfbe11f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/9/25 11:54, Andreas Hindborg wrote:
> This patch includes changes required for Rust kernel modules to utilize
> module parameters. This code implements read only support for integer
> types without `sysfs` support.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/lib.rs           |   1 +
>  rust/kernel/module_param.rs  | 225 +++++++++++++++++++++++++++++++++++++++++++
>  rust/macros/helpers.rs       |  14 +++
>  rust/macros/lib.rs           |  31 ++++++
>  rust/macros/module.rs        | 188 ++++++++++++++++++++++++++++++++----
>  samples/rust/rust_minimal.rs |  10 ++
>  6 files changed, 451 insertions(+), 18 deletions(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4253c9a7fe7df935dc714bc3036d299bd80054a0..707ec81411c7aecccdd14e02cbf011642bc02e07 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -46,6 +46,7 @@
>  pub mod kunit;
>  pub mod list;
>  pub mod miscdevice;
> +pub mod module_param;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod once_lite;
> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..6cb64096090a37c4f9c4ce73e23b7ac049e32d20
> --- /dev/null
> +++ b/rust/kernel/module_param.rs
> @@ -0,0 +1,225 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Types for module parameters.
> +//!
> +//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
> +
> +use crate::prelude::*;
> +use crate::str::BStr;
> +
> +/// Newtype to make `bindings::kernel_param` [`Sync`].
> +#[repr(transparent)]
> +#[doc(hidden)]
> +pub struct RacyKernelParam(pub ::kernel::bindings::kernel_param);
> +
> +// SAFETY: C kernel handles serializing access to this type. We never access
> +// from Rust module.
> +unsafe impl Sync for RacyKernelParam {}
> +
> +/// Types that can be used for module parameters.
> +///
> +/// Note that displaying the type in `sysfs` will fail if
> +/// [`Display`](core::fmt::Display) implementation would write more than
> +/// [`PAGE_SIZE`] - 1 bytes.
> +///
> +/// [`PAGE_SIZE`]: `bindings::PAGE_SIZE`
> +pub trait ModuleParam: Sized {
> +    /// The [`ModuleParam`] will be used by the kernel module through this type.
> +    ///
> +    /// This may differ from `Self` if, for example, `Self` needs to track
> +    /// ownership without exposing it or allocate extra space for other possible
> +    /// parameter values.
> +    // This is required to support string parameters in the future.
> +    type Value: ?Sized;
> +
> +    /// Parse a parameter argument into the parameter value.
> +    ///
> +    /// `Err(_)` should be returned when parsing of the argument fails.
> +    ///
> +    /// Parameters passed at boot time will be set before [`kmalloc`] is
> +    /// available (even if the module is loaded at a later time). However, in
> +    /// this case, the argument buffer will be valid for the entire lifetime of
> +    /// the kernel. So implementations of this method which need to allocate
> +    /// should first check that the allocator is available (with
> +    /// [`crate::bindings::slab_is_available`]) and when it is not available
> +    /// provide an alternative implementation which doesn't allocate. In cases
> +    /// where the allocator is not available it is safe to save references to
> +    /// `arg` in `Self`, but in other cases a copy should be made.
> +    ///
> +    /// [`kmalloc`]: srctree/include/linux/slab.h
> +    fn try_from_param_arg(arg: &'static [u8]) -> Result<Self>;
> +}
> +
> +/// Set the module parameter from a string.
> +///
> +/// Used to set the parameter value at kernel initialization, when loading
> +/// the module or when set through `sysfs`.
> +///
> +/// `param.arg` is a pointer to `*mut T` as set up by the [`module!`]
> +/// macro.
> +///
> +/// See `struct kernel_param_ops.set`.
> +///
> +/// # Safety
> +///
> +/// If `val` is non-null then it must point to a valid null-terminated
> +/// string. The `arg` field of `param` must be an instance of `T`.
> +///
> +/// # Invariants
> +///
> +/// Currently, we only support read-only parameters that are not readable
> +/// from `sysfs`. Thus, this function is only called at kernel
> +/// initialization time, or at module load time, and we have exclusive
> +/// access to the parameter for the duration of the function.
> +///
> +/// [`module!`]: macros::module
> +unsafe extern "C" fn set_param<T>(
> +    val: *const core::ffi::c_char,
> +    param: *const crate::bindings::kernel_param,
> +) -> core::ffi::c_int
> +where
> +    T: ModuleParam,
> +{
> +    // NOTE: If we start supporting arguments without values, val _is_ allowed
> +    // to be null here.
> +    if val.is_null() {
> +        crate::pr_warn_once!("Null pointer passed to `module_param::set_param`");
> +        return crate::error::code::EINVAL.to_errno();
> +    }
> +
> +    // SAFETY: By function safety requirement, val is non-null and
> +    // null-terminated. By C API contract, `val` is live and valid for reads
> +    // for the duration of this function.
> +    let arg = unsafe { CStr::from_char_ptr(val).as_bytes() };
> +
> +    crate::error::from_result(|| {
> +        let new_value = T::try_from_param_arg(arg)?;
> +
> +        // SAFETY: `param` is guaranteed to be valid by C API contract
> +        // and `arg` is guaranteed to point to an instance of `T`.
> +        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
> +
> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
> +        // access. `old_value` is pointing to an initialized static, an

Typo: an -> and

> +        // so it is properly initialized.
> +        unsafe { core::ptr::replace(old_value, new_value) };
> +        Ok(0)
> +    })
> +}
> +
> +/// Drop the parameter.
> +///
> +/// Called when unloading a module.
> +///
> +/// # Safety
> +///
> +/// The `arg` field of `param` must be an initialized instance of `T`.
> +unsafe extern "C" fn free<T>(arg: *mut core::ffi::c_void)
> +where
> +    T: ModuleParam,
> +{
> +    // SAFETY: By function safety requirement, `arg` is an initialized
> +    // instance of `T`. By C API contract, `arg` will not be used after
> +    // this function returns.
> +    unsafe { core::ptr::drop_in_place(arg as *mut T) };
> +}
> +
> +macro_rules! impl_int_module_param {
> +    ($ty:ident) => {
> +        impl ModuleParam for $ty {
> +            type Value = $ty;
> +
> +            fn try_from_param_arg(arg: &'static [u8]) -> Result<Self> {
> +                let bstr = BStr::from_bytes(arg);
> +                <$ty as crate::str::parse_int::ParseInt>::from_str(bstr)
> +            }
> +        }
> +    };
> +}
> +
> +impl_int_module_param!(i8);
> +impl_int_module_param!(u8);
> +impl_int_module_param!(i16);
> +impl_int_module_param!(u16);
> +impl_int_module_param!(i32);
> +impl_int_module_param!(u32);
> +impl_int_module_param!(i64);
> +impl_int_module_param!(u64);
> +impl_int_module_param!(isize);
> +impl_int_module_param!(usize);
> +
> +/// A wrapper for kernel parameters.
> +///
> +/// This type is instantiated by the [`module!`] macro when module parameters are
> +/// defined. You should never need to instantiate this type directly.
> +#[repr(transparent)]
> +pub struct ModuleParamAccess<T> {
> +    data: core::cell::UnsafeCell<T>,
> +}
> +
> +// SAFETY: We only create shared references to the contents of this container,
> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
> +
> +impl<T> ModuleParamAccess<T> {
> +    #[doc(hidden)]
> +    pub const fn new(value: T) -> Self {
> +        Self {
> +            data: core::cell::UnsafeCell::new(value),
> +        }
> +    }
> +
> +    /// Get a shared reference to the parameter value.
> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
> +    // held lock guard here.
> +    pub fn get(&self) -> &T {
> +        // SAFETY: As we only support read only parameters with no sysfs
> +        // exposure, the kernel will not touch the parameter data after module
> +        // initialization.
> +        unsafe { &*self.data.get() }
> +    }
> +
> +    /// Get a mutable pointer to the parameter value.
> +    pub const fn as_mut_ptr(&self) -> *mut T {
> +        self.data.get()
> +    }
> +}
> +
> +#[doc(hidden)]
> +#[macro_export]
> +/// Generate a static [`kernel_param_ops`](srctree/include/linux/moduleparam.h) struct.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// make_param_ops!(
> +///     /// Documentation for new param ops.
> +///     PARAM_OPS_MYTYPE, // Name for the static.
> +///     MyType // A type which implements [`ModuleParam`].
> +/// );
> +/// ```
> +macro_rules! make_param_ops {
> +    ($ops:ident, $ty:ty) => {
> +        ///
> +        /// Static [`kernel_param_ops`](srctree/include/linux/moduleparam.h)
> +        /// struct generated by `make_param_ops`
> +        #[doc = concat!("for [`", stringify!($ty), "`].")]
> +        pub static $ops: $crate::bindings::kernel_param_ops = $crate::bindings::kernel_param_ops {
> +            flags: 0,
> +            set: Some(set_param::<$ty>),
> +            get: None,
> +            free: Some(free::<$ty>),
> +        };
> +    };
> +}
> +
> +make_param_ops!(PARAM_OPS_I8, i8);
> +make_param_ops!(PARAM_OPS_U8, u8);
> +make_param_ops!(PARAM_OPS_I16, i16);
> +make_param_ops!(PARAM_OPS_U16, u16);
> +make_param_ops!(PARAM_OPS_I32, i32);
> +make_param_ops!(PARAM_OPS_U32, u32);
> +make_param_ops!(PARAM_OPS_I64, i64);
> +make_param_ops!(PARAM_OPS_U64, u64);
> +make_param_ops!(PARAM_OPS_ISIZE, isize);
> +make_param_ops!(PARAM_OPS_USIZE, usize);
> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> index 563dcd2b7ace5e8322d0fddb409571cca2dd31ea..5efed578e3d5d851b460f83b29a4a95e2f106e64 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -107,6 +107,20 @@ pub(crate) struct Generics {
>      pub(crate) ty_generics: Vec<TokenTree>,
>  }
>  
> +/// Parse a token stream of the form `expected_name: "value",` and return the
> +/// string in the position of "value".
> +///
> +/// # Panics
> +///
> +/// - On parse error.
> +pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, expected_name: &str) -> String {
> +    assert_eq!(expect_ident(it), expected_name);
> +    assert_eq!(expect_punct(it), ':');
> +    let string = expect_string(it);
> +    assert_eq!(expect_punct(it), ',');
> +    string
> +}
> +
>  /// Parses the given `TokenStream` into `Generics` and the rest.
>  ///
>  /// The generics are not present in the rest, but a where clause might remain.
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index 4ab94e44adfe3206faad159e81417ea41a35815b..0fe581fbc53266bf22fe07f5c35495affbe0d67d 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -24,6 +24,30 @@
>  /// The `type` argument should be a type which implements the [`Module`]
>  /// trait. Also accepts various forms of kernel metadata.
>  ///
> +/// The `params` field describe module parameters. Each entry has the form
> +///
> +/// ```ignore
> +/// parameter_name: type {
> +///     default: default_value,
> +///     description: "Description",
> +/// }
> +/// ```
> +///
> +/// `type` may be one of
> +///
> +/// - [`i8`]
> +/// - [`u8`]
> +/// - [`i8`]
> +/// - [`u8`]
> +/// - [`i16`]
> +/// - [`u16`]
> +/// - [`i32`]
> +/// - [`u32`]
> +/// - [`i64`]
> +/// - [`u64`]
> +/// - [`isize`]
> +/// - [`usize`]
> +///
>  /// C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
>  ///
>  /// [`Module`]: ../kernel/trait.Module.html
> @@ -40,6 +64,12 @@
>  ///     description: "My very own kernel module!",
>  ///     license: "GPL",
>  ///     alias: ["alternate_module_name"],
> +///     params: {
> +///         my_parameter: i64 {
> +///             default: 1,
> +///             description: "This parameter has a default of 1",
> +///         },
> +///     },
>  /// }
>  ///
>  /// struct MyModule(i32);
> @@ -48,6 +78,7 @@
>  ///     fn init(_module: &'static ThisModule) -> Result<Self> {
>  ///         let foo: i32 = 42;
>  ///         pr_info!("I contain:  {}\n", foo);
> +///         pr_info!("i32 param is:  {}\n", module_parameters::my_parameter.read());
>  ///         Ok(Self(foo))
>  ///     }
>  /// }
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 2587f41b0d3929af7ceac5f42b4711f70b4f8749..627279cf318b14b50128045bce980f9d60b9c6d0 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -26,6 +26,7 @@ struct ModInfoBuilder<'a> {
>      module: &'a str,
>      counter: usize,
>      buffer: String,
> +    param_buffer: String,
>  }
>  
>  impl<'a> ModInfoBuilder<'a> {
> @@ -34,10 +35,11 @@ fn new(module: &'a str) -> Self {
>              module,
>              counter: 0,
>              buffer: String::new(),
> +            param_buffer: String::new(),
>          }
>      }
>  
> -    fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
> +    fn emit_base(&mut self, field: &str, content: &str, builtin: bool, param: bool) {
>          let string = if builtin {
>              // Built-in modules prefix their modinfo strings by `module.`.
>              format!(
> @@ -51,8 +53,14 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
>              format!("{field}={content}\0", field = field, content = content)
>          };
>  
> +        let buffer = if param {
> +            &mut self.param_buffer
> +        } else {
> +            &mut self.buffer
> +        };
> +
>          write!(
> -            &mut self.buffer,
> +            buffer,
>              "
>                  {cfg}
>                  #[doc(hidden)]
> @@ -75,20 +83,113 @@ fn emit_base(&mut self, field: &str, content: &str, builtin: bool) {
>          self.counter += 1;
>      }
>  
> -    fn emit_only_builtin(&mut self, field: &str, content: &str) {
> -        self.emit_base(field, content, true)
> +    fn emit_only_builtin(&mut self, field: &str, content: &str, param: bool) {
> +        self.emit_base(field, content, true, param)
>      }
>  
> -    fn emit_only_loadable(&mut self, field: &str, content: &str) {
> -        self.emit_base(field, content, false)
> +    fn emit_only_loadable(&mut self, field: &str, content: &str, param: bool) {
> +        self.emit_base(field, content, false, param)
>      }
>  
>      fn emit(&mut self, field: &str, content: &str) {
> -        self.emit_only_builtin(field, content);
> -        self.emit_only_loadable(field, content);
> +        self.emit_internal(field, content, false);
> +    }
> +
> +    fn emit_internal(&mut self, field: &str, content: &str, param: bool) {
> +        self.emit_only_builtin(field, content, param);
> +        self.emit_only_loadable(field, content, param);
> +    }
> +
> +    fn emit_param(&mut self, field: &str, param: &str, content: &str) {
> +        let content = format!("{param}:{content}", param = param, content = content);
> +        self.emit_internal(field, &content, true);
> +    }
> +
> +    fn emit_params(&mut self, info: &ModuleInfo) {
> +        let Some(params) = &info.params else {
> +            return;
> +        };
> +
> +        for param in params {
> +            let ops = param_ops_path(&param.ptype);
> +
> +            // Note: The spelling of these fields is dictated by the user space
> +            // tool `modinfo`.
> +            self.emit_param("parmtype", &param.name, &param.ptype);
> +            self.emit_param("parm", &param.name, &param.description);
> +
> +            write!(
> +                self.param_buffer,
> +                "
> +                    pub(crate) static {param_name}:
> +                        ::kernel::module_param::ModuleParamAccess<{param_type}> =
> +                            ::kernel::module_param::ModuleParamAccess::new({param_default});
> +
> +                    #[link_section = \"__param\"]
> +                    #[used]
> +                    static __{module_name}_{param_name}_struct:
> +                        ::kernel::module_param::RacyKernelParam =
> +                        ::kernel::module_param::RacyKernelParam(::kernel::bindings::kernel_param {{
> +                            name: if cfg!(MODULE) {{
> +                                c\"{module_name}.{param_name}\"
> +                            }} else {{
> +                                c\"{param_name}\"
> +                            }}.as_ptr(),

This should be the other way around? Running
'insmod rust_minimal.ko test_parameter=2' reports for me that the
parameter is unknown while specifying 'rust_minimal.test_parameter=2'
works. The prefix should be used only if the module is built-in so the
parameter can be distinguished on the kernel command line.

> +                            // SAFETY: `__this_module` is constructed by the kernel at load time
> +                            // and will not be freed until the module is unloaded.
> +                            #[cfg(MODULE)]
> +                            mod_: unsafe {{
> +                                (&::kernel::bindings::__this_module
> +                                    as *const ::kernel::bindings::module)
> +                                    .cast_mut()
> +                            }},
> +                            #[cfg(not(MODULE))]
> +                            mod_: ::core::ptr::null_mut(),
> +                            ops: &{ops} as *const ::kernel::bindings::kernel_param_ops,
> +                            perm: 0, // Will not appear in sysfs
> +                            level: -1,
> +                            flags: 0,
> +                            __bindgen_anon_1:
> +                                ::kernel::bindings::kernel_param__bindgen_ty_1 {{
> +                                    arg: {param_name}.as_mut_ptr().cast()
> +                                }},
> +                        }});
> +                ",
> +                module_name = info.name,
> +                param_type = param.ptype,
> +                param_default = param.default,
> +                param_name = param.name,
> +                ops = ops,
> +            )
> +            .unwrap();
> +        }
> +    }
> +}
> +
> +fn param_ops_path(param_type: &str) -> &'static str {
> +    match param_type {
> +        "i8" => "::kernel::module_param::PARAM_OPS_I8",
> +        "u8" => "::kernel::module_param::PARAM_OPS_U8",
> +        "i16" => "::kernel::module_param::PARAM_OPS_I16",
> +        "u16" => "::kernel::module_param::PARAM_OPS_U16",
> +        "i32" => "::kernel::module_param::PARAM_OPS_I32",
> +        "u32" => "::kernel::module_param::PARAM_OPS_U32",
> +        "i64" => "::kernel::module_param::PARAM_OPS_I64",
> +        "u64" => "::kernel::module_param::PARAM_OPS_U64",
> +        "isize" => "::kernel::module_param::PARAM_OPS_ISIZE",
> +        "usize" => "::kernel::module_param::PARAM_OPS_USIZE",
> +        t => panic!("Unsupported parameter type {}", t),
>      }
>  }
>  
> +fn expect_param_default(param_it: &mut token_stream::IntoIter) -> String {
> +    assert_eq!(expect_ident(param_it), "default");
> +    assert_eq!(expect_punct(param_it), ':');
> +    let default = try_literal(param_it).expect("Expected default param value");
> +    assert_eq!(expect_punct(param_it), ',');
> +    default
> +}
> +
>  #[derive(Debug, Default)]
>  struct ModuleInfo {
>      type_: String,
> @@ -98,6 +199,50 @@ struct ModuleInfo {
>      description: Option<String>,
>      alias: Option<Vec<String>>,
>      firmware: Option<Vec<String>>,
> +    params: Option<Vec<Parameter>>,
> +}
> +
> +#[derive(Debug)]
> +struct Parameter {
> +    name: String,
> +    ptype: String,
> +    default: String,
> +    description: String,
> +}
> +
> +fn expect_params(it: &mut token_stream::IntoIter) -> Vec<Parameter> {
> +    let params = expect_group(it);
> +    assert_eq!(params.delimiter(), Delimiter::Brace);
> +    let mut it = params.stream().into_iter();
> +    let mut parsed = Vec::new();
> +
> +    loop {
> +        let param_name = match it.next() {
> +            Some(TokenTree::Ident(ident)) => ident.to_string(),
> +            Some(_) => panic!("Expected Ident or end"),
> +            None => break,
> +        };
> +
> +        assert_eq!(expect_punct(&mut it), ':');
> +        let param_type = expect_ident(&mut it);
> +        let group = expect_group(&mut it);
> +        assert_eq!(group.delimiter(), Delimiter::Brace);
> +        assert_eq!(expect_punct(&mut it), ',');
> +
> +        let mut param_it = group.stream().into_iter();
> +        let param_default = expect_param_default(&mut param_it);
> +        let param_description = expect_string_field(&mut param_it, "description");
> +        expect_end(&mut param_it);
> +
> +        parsed.push(Parameter {
> +            name: param_name,
> +            ptype: param_type,
> +            default: param_default,
> +            description: param_description,
> +        })
> +    }
> +
> +    parsed
>  }
>  
>  impl ModuleInfo {
> @@ -112,6 +257,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
>              "license",
>              "alias",
>              "firmware",
> +            "params",
>          ];
>          const REQUIRED_KEYS: &[&str] = &["type", "name", "license"];
>          let mut seen_keys = Vec::new();
> @@ -140,6 +286,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
>                  "license" => info.license = expect_string_ascii(it),
>                  "alias" => info.alias = Some(expect_string_array(it)),
>                  "firmware" => info.firmware = Some(expect_string_array(it)),
> +                "params" => info.params = Some(expect_params(it)),
>                  _ => panic!(
>                      "Unknown key \"{}\". Valid keys are: {:?}.",
>                      key, EXPECTED_KEYS
> @@ -183,28 +330,30 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
>      let info = ModuleInfo::parse(&mut it);
>  
>      let mut modinfo = ModInfoBuilder::new(info.name.as_ref());
> -    if let Some(author) = info.author {
> -        modinfo.emit("author", &author);
> +    if let Some(author) = &info.author {
> +        modinfo.emit("author", author);
>      }
> -    if let Some(description) = info.description {
> -        modinfo.emit("description", &description);
> +    if let Some(description) = &info.description {
> +        modinfo.emit("description", description);
>      }
>      modinfo.emit("license", &info.license);
> -    if let Some(aliases) = info.alias {
> +    if let Some(aliases) = &info.alias {
>          for alias in aliases {
> -            modinfo.emit("alias", &alias);
> +            modinfo.emit("alias", alias);
>          }
>      }
> -    if let Some(firmware) = info.firmware {
> +    if let Some(firmware) = &info.firmware {
>          for fw in firmware {
> -            modinfo.emit("firmware", &fw);
> +            modinfo.emit("firmware", fw);
>          }
>      }
>  
>      // Built-in modules also export the `file` modinfo string.
>      let file =
>          std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFILE environmental variable");
> -    modinfo.emit_only_builtin("file", &file);
> +    modinfo.emit_only_builtin("file", &file, false);
> +
> +    modinfo.emit_params(&info);
>  
>      format!(
>          "
> @@ -358,14 +507,17 @@ unsafe fn __exit() {{
>                              __MOD.assume_init_drop();
>                          }}
>                      }}
> -
>                      {modinfo}
>                  }}
>              }}
> +            mod module_parameters {{
> +                {params}
> +            }}
>          ",
>          type_ = info.type_,
>          name = info.name,
>          modinfo = modinfo.buffer,
> +        params = modinfo.param_buffer,
>          initcall_section = ".initcall6.init"
>      )
>      .parse()
> diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
> index 4aaf117bf8e3c0cc77e188b1ad0708e3650a6654..d999a77c6eb9a0db9acf5fa03d4feca5e6525fc8 100644
> --- a/samples/rust/rust_minimal.rs
> +++ b/samples/rust/rust_minimal.rs
> @@ -10,6 +10,12 @@
>      author: "Rust for Linux Contributors",
>      description: "Rust minimal sample",
>      license: "GPL",
> +    params: {
> +        test_parameter: i64 {
> +            default: 1,
> +            description: "This parameter has a default of 1",
> +        },
> +    },
>  }
>  
>  struct RustMinimal {
> @@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
>      fn init(_module: &'static ThisModule) -> Result<Self> {
>          pr_info!("Rust minimal sample (init)\n");
>          pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
> +        pr_info!(
> +            "My parameter: {}\n",
> +            *module_parameters::test_parameter.get()
> +        );
>  
>          let mut numbers = KVec::new();
>          numbers.push(72, GFP_KERNEL)?;
> 

-- 
Thanks,
Petr

