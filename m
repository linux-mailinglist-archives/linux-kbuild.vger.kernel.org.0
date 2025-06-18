Return-Path: <linux-kbuild+bounces-7556-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E428ADF84A
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 23:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BC183B040E
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 20:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E32321D3F3;
	Wed, 18 Jun 2025 21:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnvaEdL6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15021C161;
	Wed, 18 Jun 2025 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280404; cv=none; b=Hi2rLoeCYFxK9rYlInQqvuh9kd/GGtm0TIXxk3Fgmx90fHd+meJz3eZTKB9f3bTPY18MR4QaWkeTuQXJI3NGS79QbmnoF+sQomtvsF7LD3/dksnWOzO6WRIn3NoSS1CRmr3W38DT78w7aAaYOcGM+oWmN0QzlvgC+QC/+BjS8iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280404; c=relaxed/simple;
	bh=yOvlKoSnzKigyD/DVt6KdulZgpulRJtNsiQnSPPPVDs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o4DTWDoa/6T1oYZ5Zrq0ufRTSTBv0AZQYx2lmC1Vz5R7ZYh8UCZChHJH87r8bUaix3xFkJ02TSynSMCL/yBXfoAPMVyiSnB8KHd4c2VpFIcP8ptU1kxx+J0GlcBCe6vIH/VZ1n+SSJpYSbN1R8JtS8S59y7QKQNfbU9/+MrKHjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnvaEdL6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20F9C4CEE7;
	Wed, 18 Jun 2025 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280403;
	bh=yOvlKoSnzKigyD/DVt6KdulZgpulRJtNsiQnSPPPVDs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZnvaEdL6UynucTVD3vOCJ5h2nFTjz8zEn3wc3ceu2GxhiDlfzW9IV+C8pkz3vNHZI
	 nTza8Cw9CUGwrBFnoRPv4wq3N4ktytHLnkafT3B9teh6UDOQT1LAYXEF5S3LOGUo5H
	 enjlwwU/L3nMvn8qvEaEl67Z342/A+R6tB69hQWZdBa9A8b5+zpM6FqBEWp5Y2z1Ll
	 Bxc7sG9oaw3AIwJteAuOR37npCQg2Ve7ETl1EL6BuLHqPLaxPAYYVVmtCTKyEVgnlo
	 rspS6tBd5Y8WU3bVPTgRwNAHlHjxfti/vcbs0q2HzChLgZUJ6pNdzm9C41PVCls8LH
	 XXbp5b2XEIMxA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 22:59:57 +0200
Message-Id: <DAPYMAB44RUZ.7NIWDUWY1UYF@kernel.org>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>

On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
> Add types and traits for interfacing the C moduleparam API.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/lib.rs          |   1 +
>  rust/kernel/module_param.rs | 201 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 202 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c3..2b439ea06185 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -87,6 +87,7 @@
>  pub mod list;
>  pub mod miscdevice;
>  pub mod mm;
> +pub mod module_param;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod of;
> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> new file mode 100644
> index 000000000000..fd167df8e53d
> --- /dev/null
> +++ b/rust/kernel/module_param.rs
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support for module parameters.
> +//!
> +//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/modu=
leparam.h)
> +
> +use crate::prelude::*;
> +use crate::str::BStr;
> +
> +/// Newtype to make `bindings::kernel_param` [`Sync`].
> +#[repr(transparent)]
> +#[doc(hidden)]
> +pub struct RacyKernelParam(pub ::kernel::bindings::kernel_param);

s/::kernel:://

The field shouldn't be public, since then people can access it. Can
just have a `pub fn new` instead?

> +
> +// SAFETY: C kernel handles serializing access to this type. We never ac=
cess it
> +// from Rust module.
> +unsafe impl Sync for RacyKernelParam {}
> +
> +/// Types that can be used for module parameters.
> +pub trait ModuleParam: Sized + Copy {

Why the `Copy` bound?

> +    /// The [`ModuleParam`] will be used by the kernel module through th=
is type.
> +    ///
> +    /// This may differ from `Self` if, for example, `Self` needs to tra=
ck
> +    /// ownership without exposing it or allocate extra space for other =
possible
> +    /// parameter values.
> +    // This is required to support string parameters in the future.
> +    type Value: ?Sized;
> +
> +    /// Parse a parameter argument into the parameter value.
> +    ///
> +    /// `Err(_)` should be returned when parsing of the argument fails.

I don't think we need to explicitly mention this.

> +    ///
> +    /// Parameters passed at boot time will be set before [`kmalloc`] is
> +    /// available (even if the module is loaded at a later time). Howeve=
r, in

I think we should make a section out of this like `# No allocations` (or
something better). Let's also mention it on the trait itself, since
that's where implementers will most likely look.

> +    /// this case, the argument buffer will be valid for the entire life=
time of
> +    /// the kernel. So implementations of this method which need to allo=
cate
> +    /// should first check that the allocator is available (with
> +    /// [`crate::bindings::slab_is_available`]) and when it is not avail=
able

We probably shouldn't recommend directly using `bindings`.

> +    /// provide an alternative implementation which doesn't allocate. In=
 cases
> +    /// where the allocator is not available it is safe to save referenc=
es to
> +    /// `arg` in `Self`, but in other cases a copy should be made.

I don't understand this convention, but it also doesn't seem to
relevant (so feel free to leave it as is, but it would be nice if you
could explain it).

> +    ///
> +    /// [`kmalloc`]: srctree/include/linux/slab.h
> +    fn try_from_param_arg(arg: &'static BStr) -> Result<Self>;
> +}
> +
> +/// Set the module parameter from a string.
> +///
> +/// Used to set the parameter value at kernel initialization, when loadi=
ng
> +/// the module or when set through `sysfs`.
> +///
> +/// See `struct kernel_param_ops.set`.
> +///
> +/// # Safety
> +///
> +/// - If `val` is non-null then it must point to a valid null-terminated=
 string that must be valid
> +///   for reads for the duration of the call.
> +/// - `parm` must be a pointer to a `bindings::kernel_param` that is val=
id for reads for the

s/parm/param/

> +///   duration of the call.
> +/// - `param.arg` must be a pointer to an initialized `T` that is valid =
for writes for the duration
> +///   of the function.
> +///
> +/// # Note
> +///
> +/// - The safety requirements are satisfied by C API contract when this =
function is invoked by the
> +///   module subsystem C code.
> +/// - Currently, we only support read-only parameters that are not reada=
ble from `sysfs`. Thus, this
> +///   function is only called at kernel initialization time, or at modul=
e load time, and we have
> +///   exclusive access to the parameter for the duration of the function=
.
> +///
> +/// [`module!`]: macros::module
> +unsafe extern "C" fn set_param<T>(
> +    val: *const c_char,
> +    param: *const crate::bindings::kernel_param,
> +) -> c_int
> +where
> +    T: ModuleParam,
> +{
> +    // NOTE: If we start supporting arguments without values, val _is_ a=
llowed
> +    // to be null here.
> +    if val.is_null() {
> +        // TODO: Use pr_warn_once available.
> +        crate::pr_warn!("Null pointer passed to `module_param::set_param=
`");
> +        return EINVAL.to_errno();
> +    }
> +
> +    // SAFETY: By function safety requirement, val is non-null, null-ter=
minated
> +    // and valid for reads for the duration of this function.
> +    let arg =3D unsafe { CStr::from_char_ptr(val) };

`arg` has the type `&'static CStr`, which is not justified by the safety
comment :(

Why does `ModuleParam::try_from_param_arg` take a `&'static BStr` and
not a `&BStr`? I guess it is related to the "make copies if allocator is
available" question I had above.

> +
> +    crate::error::from_result(|| {
> +        let new_value =3D T::try_from_param_arg(arg)?;
> +
> +        // SAFETY: By function safety requirements `param` is be valid f=
or reads.
> +        let old_value =3D unsafe { (*param).__bindgen_anon_1.arg as *mut=
 T };
> +
> +        // SAFETY: By function safety requirements, the target of `old_v=
alue` is valid for writes
> +        // and is initialized.
> +        unsafe { *old_value =3D new_value };

So if we keep the `ModuleParam: Copy` bound from above, then we don't
need to drop the type here (as `Copy` implies `!Drop`). So we could also
remove the requirement for initialized memory and use `ptr::write` here
instead. Thoughts?

> +        Ok(0)
> +    })
> +}
> +
> +macro_rules! impl_int_module_param {
> +    ($ty:ident) =3D> {
> +        impl ModuleParam for $ty {
> +            type Value =3D $ty;
> +
> +            fn try_from_param_arg(arg: &'static BStr) -> Result<Self> {
> +                <$ty as crate::str::parse_int::ParseInt>::from_str(arg)
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
> +/// This type is instantiated by the [`module!`] macro when module param=
eters are
> +/// defined. You should never need to instantiate this type directly.
> +///
> +/// Note: This type is `pub` because it is used by module crates to acce=
ss
> +/// parameter values.
> +#[repr(transparent)]
> +pub struct ModuleParamAccess<T> {
> +    data: core::cell::UnsafeCell<T>,
> +}

We should just re-create the `SyncUnsafeCell` [1] from upstream...

Feel free to keep this until we have it though.

[1]: https://doc.rust-lang.org/nightly/std/cell/struct.SyncUnsafeCell.html

> +
> +// SAFETY: We only create shared references to the contents of this cont=
ainer,
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
> +    // Note: When sysfs access to parameters are enabled, we have to pas=
s in a
> +    // held lock guard here.
> +    pub fn get(&self) -> &T {
> +        // SAFETY: As we only support read only parameters with no sysfs
> +        // exposure, the kernel will not touch the parameter data after =
module
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

Why export this?

---
Cheers,
Benno

> +/// Generate a static [`kernel_param_ops`](srctree/include/linux/modulep=
aram.h) struct.
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
> +    ($ops:ident, $ty:ty) =3D> {
> +        #[doc(hidden)]
> +        pub static $ops: $crate::bindings::kernel_param_ops =3D $crate::=
bindings::kernel_param_ops {
> +            flags: 0,
> +            set: Some(set_param::<$ty>),
> +            get: None,
> +            free: None,
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


