Return-Path: <linux-kbuild+bounces-5879-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9796DA4267E
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 16:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288C83BA188
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 15:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2AE24887A;
	Mon, 24 Feb 2025 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="AQ3ZW2LD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813213BC26;
	Mon, 24 Feb 2025 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740410998; cv=pass; b=fDTS0q4v4gLthCBmHajdZrIliBLRzFAbpm/IUDexVHPo2yRu86a5VsCrOd/6tU74vcrv/FV12THMKNnyihK1yagPCRPE8iMhkokgNzmvjVvWzTpp7UrDWVUh4zkpTK88VTCdp/VF2wwV97YSEXhuzxIuAgeFlOMmkYHzjbERepg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740410998; c=relaxed/simple;
	bh=FkWUIt+35xSjlXOxZo9/bK2FIakJ34YEyAzubuiCs5U=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=V0UeQRbFEDjgGz3S+Zh5TNN/oJaaZOzuJ+RLxpp3dxhr/kzB1Jq+kyMGjktPd5v+DX2xaSMLM38saFTAQ6qBZQKBmOd3gFG2NY8vapHLNOoCMDuBTVd0rJJKE+MnkT1dTepd7YmKsgEQHNlqyIYT9GUTRnPH0Za27PgMEMkHcIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=AQ3ZW2LD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740410960; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pf9XCbphTiM+rEuEzy39oTvCeqGZu8jXaShnC/fxqIQVKSiB3p9YyMYokkfRWYl5VXaDe7uOo8puNnMcP/WxpsS0MOV2sgU0BhnGr/FlGUtfFjlUPk14pYivI6Ai8iHSgwSYRoN1LGJ5v2yqjr/G492AsFC7gH8ZZ0mipVs52CA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740410960; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dEfgjLenwrka3ImjA5eliWOtAuABZDRYEUSQbkPE5RQ=; 
	b=ZGza1ojHRER7i8NUKZVG+RbQVe7DzW9BdvDtw6YvIKWJh74GHinVDMVvRHdRMT1ilYwoH8Gyf2m26BGz45CdUQY0IsfqPW7jH0teFnXmaM8VEoB65svLd0lkMsmN8zGaikcbEddpe4ryKm2WI8iorTahZ8kfZyeRC+DEknwJGr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740410960;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=dEfgjLenwrka3ImjA5eliWOtAuABZDRYEUSQbkPE5RQ=;
	b=AQ3ZW2LDbHx9LfD8YzeFLnovO7IXmRJS0dfGYJt+iHrJxLjgjSF2ADXGTTZfydcU
	gNPZ4FhkwmDWiBGlo7hIE1cf+w6xppwhifs/PmOM6HampSAfDk1QYyp3SznWmuBtT3Q
	CpwGIK4m46ilqBz8/OseIFwnHFI+IGUot9WbGP+Q=
Received: by mx.zohomail.com with SMTPS id 1740410957728502.61084319948463;
	Mon, 24 Feb 2025 07:29:17 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 6/6] rust: add parameter support to the `module!` macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250218-module-params-v3-v7-6-5e1afabcac1b@kernel.org>
Date: Mon, 24 Feb 2025 12:28:56 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Adam Bratschi-Kaye <ark.email@gmail.com>,
 linux-kbuild@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-modules@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8AF85A37-76AC-4937-BD59-115BB432B738@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-6-5e1afabcac1b@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Andreas, thanks for working on this, I can see that this patch took a =
lot
of effort.

> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> This patch includes changes required for Rust kernel modules to =
utilize
> module parameters. This code implements read only support for integer
> types without `sysfs` support.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
> ---
> rust/kernel/lib.rs           |   1 +
> rust/kernel/module_param.rs  | 226 =
+++++++++++++++++++++++++++++++++++++++++++
> rust/macros/helpers.rs       |  25 +++++
> rust/macros/lib.rs           |  31 ++++++
> rust/macros/module.rs        | 191 =
++++++++++++++++++++++++++++++++----
> samples/rust/rust_minimal.rs |  10 ++
> 6 files changed, 466 insertions(+), 18 deletions(-)
>=20
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911a..aec04df2bac9f 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -57,6 +57,7 @@
> pub mod kunit;
> pub mod list;
> pub mod miscdevice;
> +pub mod module_param;
> #[cfg(CONFIG_NET)]
> pub mod net;
> pub mod of;
> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> new file mode 100644
> index 0000000000000..0047126c917f4
> --- /dev/null
> +++ b/rust/kernel/module_param.rs
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Types for module parameters.

nit: maybe =E2=80=9CSupport for module parameters=E2=80=9D?

Or anything else other than =E2=80=9Ctypes=E2=80=9D, really :)

> +//!
> +//! C header: =
[`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
> +
> +use crate::prelude::*;
> +use crate::str::BStr;
> +
> +/// Newtype to make `bindings::kernel_param` [`Sync`].
> +#[repr(transparent)]
> +#[doc(hidden)]
> +pub struct RacyKernelParam(pub ::kernel::bindings::kernel_param);
> +
> +// SAFETY: C kernel handles serializing access to this type. We never =
access

nit: perhaps: =E2=80=9Cwe never access *it* from *a* Rust module=E2=80=9D =
?

> +// from Rust module.
> +unsafe impl Sync for RacyKernelParam {}
> +
> +/// Types that can be used for module parameters.
> +///
> +/// Note that displaying the type in `sysfs` will fail if
> +/// [`Display`](core::fmt::Display) implementation would write more =
than

nit: perhaps `implementation writes more than`? Although it=E2=80=99d be =
great if a
native speaker could chime in on this one.

> +/// [`PAGE_SIZE`] - 1 bytes.
> +///
> +/// [`PAGE_SIZE`]: `bindings::PAGE_SIZE`
> +pub trait ModuleParam: Sized {
> +    /// The [`ModuleParam`] will be used by the kernel module through =
this type.
> +    ///
> +    /// This may differ from `Self` if, for example, `Self` needs to =
track
> +    /// ownership without exposing it or allocate extra space for =
other possible
> +    /// parameter values.

I don=E2=80=99t understand what=E2=80=99s being said here. e.g.: what =
does =E2=80=9CSelf needs to track
ownership without exposing it=E2=80=9D mean? Can you expand on this?

Also this is pub. It should perhaps also be sealed?


> +    // This is required to support string parameters in the future.
> +    type Value: ?Sized;

Why? Can you also expand on this a tad further?

> +
> +    /// Parse a parameter argument into the parameter value.
> +    ///
> +    /// `Err(_)` should be returned when parsing of the argument =
fails.
> +    ///
> +    /// Parameters passed at boot time will be set before [`kmalloc`] =
is
> +    /// available (even if the module is loaded at a later time). =
However, in
> +    /// this case, the argument buffer will be valid for the entire =
lifetime of
> +    /// the kernel. So implementations of this method which need to =
allocate
> +    /// should first check that the allocator is available (with
> +    /// [`crate::bindings::slab_is_available`]) and when it is not =
available
> +    /// provide an alternative implementation which doesn't allocate. =
In cases
> +    /// where the allocator is not available it is safe to save =
references to
> +    /// `arg` in `Self`, but in other cases a copy should be made.
> +    ///
> +    /// [`kmalloc`]: srctree/include/linux/slab.h
> +    fn try_from_param_arg(arg: &'static [u8]) -> Result<Self>;
> +}
> +
> +/// Set the module parameter from a string.
> +///
> +/// Used to set the parameter value at kernel initialization, when =
loading
> +/// the module or when set through `sysfs`.
> +///
> +/// `param.arg` is a pointer to `*mut T` as set up by the [`module!`]
> +/// macro.

Perhaps the above should also be an invariant?

> +///
> +/// See `struct kernel_param_ops.set`.
> +///
> +/// # Safety
> +///
> +/// If `val` is non-null then it must point to a valid =
null-terminated
> +/// string. The `arg` field of `param` must be an instance of `T`.
> +///
> +/// # Invariants
> +///
> +/// Currently, we only support read-only parameters that are not =
readable
> +/// from `sysfs`. Thus, this function is only called at kernel
> +/// initialization time, or at module load time, and we have =
exclusive
> +/// access to the parameter for the duration of the function.
> +///
> +/// [`module!`]: macros::module
> +unsafe extern "C" fn set_param<T>(
> +    val: *const kernel::ffi::c_char,
> +    param: *const crate::bindings::kernel_param,
> +) -> core::ffi::c_int
> +where
> +    T: ModuleParam,
> +{
> +    // NOTE: If we start supporting arguments without values, val =
_is_ allowed
> +    // to be null here.
> +    if val.is_null() {
> +        // TODO: Use pr_warn_once available.
> +        crate::pr_warn!("Null pointer passed to =
`module_param::set_param`");
> +        return crate::error::code::EINVAL.to_errno();
> +    }
> +
> +    // SAFETY: By function safety requirement, val is non-null and
> +    // null-terminated. By C API contract, `val` is live and valid =
for reads
> +    // for the duration of this function.
> +    let arg =3D unsafe { CStr::from_char_ptr(val).as_bytes() };
> +
> +    crate::error::from_result(|| {
> +        let new_value =3D T::try_from_param_arg(arg)?;
> +
> +        // SAFETY: `param` is guaranteed to be valid by C API =
contract
> +        // and `arg` is guaranteed to point to an instance of `T`.
> +        let old_value =3D unsafe { (*param).__bindgen_anon_1.arg as =
*mut T };
> +
> +        // SAFETY: `old_value` is valid for writes, as we have =
exclusive
> +        // access. `old_value` is pointing to an initialized static, =
and
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
> +/// The `arg` field of `param` must be an initialized instance of =
`T`.
> +unsafe extern "C" fn free<T>(arg: *mut core::ffi::c_void)
> +where
> +    T: ModuleParam,
> +{
> +    // SAFETY: By function safety requirement, `arg` is an =
initialized
> +    // instance of `T`. By C API contract, `arg` will not be used =
after
> +    // this function returns.
> +    unsafe { core::ptr::drop_in_place(arg as *mut T) };
> +}
> +
> +macro_rules! impl_int_module_param {
> +    ($ty:ident) =3D> {
> +        impl ModuleParam for $ty {
> +            type Value =3D $ty;
> +
> +            fn try_from_param_arg(arg: &'static [u8]) -> Result<Self> =
{
> +                let bstr =3D BStr::from_bytes(arg);
> +                <$ty as =
crate::str::parse_int::ParseInt>::from_str(bstr)
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
> +/// This type is instantiated by the [`module!`] macro when module =
parameters are
> +/// defined. You should never need to instantiate this type directly.
> +#[repr(transparent)]
> +pub struct ModuleParamAccess<T> {
> +    data: core::cell::UnsafeCell<T>,
> +}
> +
> +// SAFETY: We only create shared references to the contents of this =
container,
> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
> +
> +impl<T> ModuleParamAccess<T> {
> +    #[doc(hidden)]
> +    pub const fn new(value: T) -> Self {

I assume that this is pub so that the macro can find it? If so, can you =
leave a note
outlining this?

> +        Self {
> +            data: core::cell::UnsafeCell::new(value),
> +        }
> +    }
> +
> +    /// Get a shared reference to the parameter value.
> +    // Note: When sysfs access to parameters are enabled, we have to =
pass in a
> +    // held lock guard here.

What lock guard, guarding what exactly?

> +    pub fn get(&self) -> &T {
> +        // SAFETY: As we only support read only parameters with no =
sysfs
> +        // exposure, the kernel will not touch the parameter data =
after module
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
> +/// Generate a static =
[`kernel_param_ops`](srctree/include/linux/moduleparam.h) struct.
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
> +        ///
> +        /// Static =
[`kernel_param_ops`](srctree/include/linux/moduleparam.h)
> +        /// struct generated by `make_param_ops`
> +        #[doc =3D concat!("for [`", stringify!($ty), "`].")]
> +        pub static $ops: $crate::bindings::kernel_param_ops =3D =
$crate::bindings::kernel_param_ops {
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
> index 563dcd2b7ace5..ffc9f0cccddc8 100644
> --- a/rust/macros/helpers.rs
> +++ b/rust/macros/helpers.rs
> @@ -10,6 +10,17 @@ pub(crate) fn try_ident(it: &mut =
token_stream::IntoIter) -> Option<String> {
>     }
> }
>=20
> +pub(crate) fn try_sign(it: &mut token_stream::IntoIter) -> =
Option<char> {
> +    let peek =3D it.clone().next();
> +    match peek {
> +        Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D '-' =
=3D> {
> +            let _ =3D it.next();
> +            Some(punct.as_char())
> +        }
> +        _ =3D> None,
> +    }
> +}
> +
> pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> =
Option<String> {
>     if let Some(TokenTree::Literal(literal)) =3D it.next() {
>         Some(literal.to_string())
> @@ -107,6 +118,20 @@ pub(crate) struct Generics {
>     pub(crate) ty_generics: Vec<TokenTree>,
> }
>=20
> +/// Parse a token stream of the form `expected_name: "value",` and =
return the
> +/// string in the position of "value".
> +///
> +/// # Panics
> +///
> +/// - On parse error.
> +pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, =
expected_name: &str) -> String {
> +    assert_eq!(expect_ident(it), expected_name);
> +    assert_eq!(expect_punct(it), ':');
> +    let string =3D expect_string(it);
> +    assert_eq!(expect_punct(it), ',');
> +    string
> +}
> +
> /// Parses the given `TokenStream` into `Generics` and the rest.
> ///
> /// The generics are not present in the rest, but a where clause might =
remain.
> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index d61bc6a56425e..2778292f8cee1 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -24,6 +24,30 @@
> /// The `type` argument should be a type which implements the =
[`Module`]
> /// trait. Also accepts various forms of kernel metadata.
> ///
> +/// The `params` field describe module parameters. Each entry has the =
form
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
> /// C header: =
[`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
> ///
> /// [`Module`]: ../kernel/trait.Module.html
> @@ -40,6 +64,12 @@
> ///     description: "My very own kernel module!",
> ///     license: "GPL",
> ///     alias: ["alternate_module_name"],
> +///     params: {
> +///         my_parameter: i64 {
> +///             default: 1,
> +///             description: "This parameter has a default of 1",
> +///         },
> +///     },
> /// }
> ///
> /// struct MyModule(i32);
> @@ -48,6 +78,7 @@
> ///     fn init(_module: &'static ThisModule) -> Result<Self> {
> ///         let foo: i32 =3D 42;
> ///         pr_info!("I contain:  {}\n", foo);
> +///         pr_info!("i32 param is:  {}\n", =
module_parameters::my_parameter.read());
> ///         Ok(Self(foo))
> ///     }
> /// }
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index cdf94f4982dfc..e6af3ae5fe80e 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -26,6 +26,7 @@ struct ModInfoBuilder<'a> {
>     module: &'a str,
>     counter: usize,
>     buffer: String,
> +    param_buffer: String,
> }
>=20
> impl<'a> ModInfoBuilder<'a> {
> @@ -34,10 +35,11 @@ fn new(module: &'a str) -> Self {
>             module,
>             counter: 0,
>             buffer: String::new(),
> +            param_buffer: String::new(),
>         }
>     }
>=20
> -    fn emit_base(&mut self, field: &str, content: &str, builtin: =
bool) {
> +    fn emit_base(&mut self, field: &str, content: &str, builtin: =
bool, param: bool) {
>         let string =3D if builtin {
>             // Built-in modules prefix their modinfo strings by =
`module.`.
>             format!(
> @@ -51,8 +53,14 @@ fn emit_base(&mut self, field: &str, content: &str, =
builtin: bool) {
>             format!("{field}=3D{content}\0", field =3D field, content =
=3D content)
>         };
>=20
> +        let buffer =3D if param {
> +            &mut self.param_buffer
> +        } else {
> +            &mut self.buffer
> +        };
> +
>         write!(
> -            &mut self.buffer,
> +            buffer,
>             "
>                 {cfg}
>                 #[doc(hidden)]
> @@ -75,20 +83,116 @@ fn emit_base(&mut self, field: &str, content: =
&str, builtin: bool) {
>         self.counter +=3D 1;
>     }
>=20
> -    fn emit_only_builtin(&mut self, field: &str, content: &str) {
> -        self.emit_base(field, content, true)
> +    fn emit_only_builtin(&mut self, field: &str, content: &str, =
param: bool) {
> +        self.emit_base(field, content, true, param)
>     }
>=20
> -    fn emit_only_loadable(&mut self, field: &str, content: &str) {
> -        self.emit_base(field, content, false)
> +    fn emit_only_loadable(&mut self, field: &str, content: &str, =
param: bool) {
> +        self.emit_base(field, content, false, param)
>     }
>=20
>     fn emit(&mut self, field: &str, content: &str) {
> -        self.emit_only_builtin(field, content);
> -        self.emit_only_loadable(field, content);
> +        self.emit_internal(field, content, false);
> +    }
> +
> +    fn emit_internal(&mut self, field: &str, content: &str, param: =
bool) {
> +        self.emit_only_builtin(field, content, param);
> +        self.emit_only_loadable(field, content, param);
> +    }
> +
> +    fn emit_param(&mut self, field: &str, param: &str, content: &str) =
{
> +        let content =3D format!("{param}:{content}", param =3D param, =
content =3D content);
> +        self.emit_internal(field, &content, true);
> +    }
> +
> +    fn emit_params(&mut self, info: &ModuleInfo) {
> +        let Some(params) =3D &info.params else {
> +            return;
> +        };

Shouldn=E2=80=99t this panic? A call to emit_params() where there=E2=80=99=
s nothing to emit doesn=E2=80=99t
look right at a first glance.

> +
> +        for param in params {
> +            let ops =3D param_ops_path(&param.ptype);
> +
> +            // Note: The spelling of these fields is dictated by the =
user space
> +            // tool `modinfo`.
> +            self.emit_param("parmtype", &param.name, &param.ptype);
> +            self.emit_param("parm", &param.name, &param.description);
> +
> +            write!(
> +                self.param_buffer,
> +                "
> +                    pub(crate) static {param_name}:
> +                        =
::kernel::module_param::ModuleParamAccess<{param_type}> =3D
> +                            =
::kernel::module_param::ModuleParamAccess::new({param_default});
> +
> +                    #[link_section =3D \"__param\"]
> +                    #[used]
> +                    static __{module_name}_{param_name}_struct:
> +                        ::kernel::module_param::RacyKernelParam =3D
> +                        =
::kernel::module_param::RacyKernelParam(::kernel::bindings::kernel_param =
{{
> +                            name: if cfg!(MODULE) {{
> +                                =
::kernel::c_str!(\"{param_name}\").as_bytes_with_nul()
> +                            }} else {{
> +                                =
::kernel::c_str!(\"{module_name}.{param_name}\").as_bytes_with_nul()
> +                            }}.as_ptr(),
> +                            // SAFETY: `__this_module` is constructed =
by the kernel at load time
> +                            // and will not be freed until the module =
is unloaded.
> +                            #[cfg(MODULE)]
> +                            mod_: unsafe {{
> +                                (&::kernel::bindings::__this_module
> +                                    as *const =
::kernel::bindings::module)
> +                                    .cast_mut()
> +                            }},
> +                            #[cfg(not(MODULE))]
> +                            mod_: ::core::ptr::null_mut(),
> +                            ops: &{ops} as *const =
::kernel::bindings::kernel_param_ops,
> +                            perm: 0, // Will not appear in sysfs
> +                            level: -1,
> +                            flags: 0,
> +                            __bindgen_anon_1:
> +                                =
::kernel::bindings::kernel_param__bindgen_ty_1 {{
> +                                    arg: =
{param_name}.as_mut_ptr().cast()
> +                                }},
> +                        }});
> +                ",
> +                module_name =3D info.name,
> +                param_type =3D param.ptype,
> +                param_default =3D param.default,
> +                param_name =3D param.name,
> +                ops =3D ops,
> +            )
> +            .unwrap();
> +        }
> +    }
> +}
> +
> +fn param_ops_path(param_type: &str) -> &'static str {
> +    match param_type {
> +        "i8" =3D> "::kernel::module_param::PARAM_OPS_I8",
> +        "u8" =3D> "::kernel::module_param::PARAM_OPS_U8",
> +        "i16" =3D> "::kernel::module_param::PARAM_OPS_I16",
> +        "u16" =3D> "::kernel::module_param::PARAM_OPS_U16",
> +        "i32" =3D> "::kernel::module_param::PARAM_OPS_I32",
> +        "u32" =3D> "::kernel::module_param::PARAM_OPS_U32",
> +        "i64" =3D> "::kernel::module_param::PARAM_OPS_I64",
> +        "u64" =3D> "::kernel::module_param::PARAM_OPS_U64",
> +        "isize" =3D> "::kernel::module_param::PARAM_OPS_ISIZE",
> +        "usize" =3D> "::kernel::module_param::PARAM_OPS_USIZE",
> +        t =3D> panic!("Unsupported parameter type {}", t),
>     }
> }
>=20
> +fn expect_param_default(param_it: &mut token_stream::IntoIter) -> =
String {
> +    assert_eq!(expect_ident(param_it), "default");
> +    assert_eq!(expect_punct(param_it), ':');
> +    let sign =3D try_sign(param_it);
> +    let default =3D try_literal(param_it).expect("Expected default =
param value");
> +    assert_eq!(expect_punct(param_it), ',');
> +    let mut value =3D sign.map(String::from).unwrap_or_default();
> +    value.push_str(&default);
> +    value
> +}
> +
> #[derive(Debug, Default)]
> struct ModuleInfo {
>     type_: String,
> @@ -98,6 +202,50 @@ struct ModuleInfo {
>     description: Option<String>,
>     alias: Option<Vec<String>>,
>     firmware: Option<Vec<String>>,
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
> +    let params =3D expect_group(it);
> +    assert_eq!(params.delimiter(), Delimiter::Brace);
> +    let mut it =3D params.stream().into_iter();
> +    let mut parsed =3D Vec::new();
> +
> +    loop {
> +        let param_name =3D match it.next() {
> +            Some(TokenTree::Ident(ident)) =3D> ident.to_string(),
> +            Some(_) =3D> panic!("Expected Ident or end"),
> +            None =3D> break,
> +        };
> +
> +        assert_eq!(expect_punct(&mut it), ':');
> +        let param_type =3D expect_ident(&mut it);
> +        let group =3D expect_group(&mut it);
> +        assert_eq!(group.delimiter(), Delimiter::Brace);
> +        assert_eq!(expect_punct(&mut it), ',');
> +
> +        let mut param_it =3D group.stream().into_iter();
> +        let param_default =3D expect_param_default(&mut param_it);
> +        let param_description =3D expect_string_field(&mut param_it, =
"description");
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
> }
>=20
> impl ModuleInfo {
> @@ -112,6 +260,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self =
{
>             "license",
>             "alias",
>             "firmware",
> +            "params",
>         ];
>         const REQUIRED_KEYS: &[&str] =3D &["type", "name", "license"];
>         let mut seen_keys =3D Vec::new();
> @@ -140,6 +289,7 @@ fn parse(it: &mut token_stream::IntoIter) -> Self =
{
>                 "license" =3D> info.license =3D =
expect_string_ascii(it),
>                 "alias" =3D> info.alias =3D =
Some(expect_string_array(it)),
>                 "firmware" =3D> info.firmware =3D =
Some(expect_string_array(it)),
> +                "params" =3D> info.params =3D =
Some(expect_params(it)),
>                 _ =3D> panic!(
>                     "Unknown key \"{}\". Valid keys are: {:?}.",
>                     key, EXPECTED_KEYS
> @@ -183,28 +333,30 @@ pub(crate) fn module(ts: TokenStream) -> =
TokenStream {
>     let info =3D ModuleInfo::parse(&mut it);
>=20
>     let mut modinfo =3D ModInfoBuilder::new(info.name.as_ref());
> -    if let Some(author) =3D info.author {
> -        modinfo.emit("author", &author);
> +    if let Some(author) =3D &info.author {
> +        modinfo.emit("author", author);
>     }
> -    if let Some(description) =3D info.description {
> -        modinfo.emit("description", &description);
> +    if let Some(description) =3D &info.description {
> +        modinfo.emit("description", description);
>     }
>     modinfo.emit("license", &info.license);
> -    if let Some(aliases) =3D info.alias {
> +    if let Some(aliases) =3D &info.alias {
>         for alias in aliases {
> -            modinfo.emit("alias", &alias);
> +            modinfo.emit("alias", alias);
>         }
>     }
> -    if let Some(firmware) =3D info.firmware {
> +    if let Some(firmware) =3D &info.firmware {
>         for fw in firmware {
> -            modinfo.emit("firmware", &fw);
> +            modinfo.emit("firmware", fw);
>         }
>     }

These seem a bit unrelated?

>=20
>     // Built-in modules also export the `file` modinfo string.
>     let file =3D
>         std::env::var("RUST_MODFILE").expect("Unable to fetch =
RUST_MODFILE environmental variable");
> -    modinfo.emit_only_builtin("file", &file);
> +    modinfo.emit_only_builtin("file", &file, false);
> +
> +    modinfo.emit_params(&info);
>=20
>     format!(
>         "
> @@ -362,14 +514,17 @@ unsafe fn __exit() {{
>                             __MOD.assume_init_drop();
>                         }}
>                     }}
> -
>                     {modinfo}
>                 }}
>             }}
> +            mod module_parameters {{
> +                {params}
> +            }}
>         ",
>         type_ =3D info.type_,
>         name =3D info.name,
>         modinfo =3D modinfo.buffer,
> +        params =3D modinfo.param_buffer,
>         initcall_section =3D ".initcall6.init"
>     )
>     .parse()
> diff --git a/samples/rust/rust_minimal.rs =
b/samples/rust/rust_minimal.rs
> index 4aaf117bf8e3c..d999a77c6eb9a 100644

I wonder if the changes to rust_minimal.rs should be a separate patch.

> --- a/samples/rust/rust_minimal.rs
> +++ b/samples/rust/rust_minimal.rs
> @@ -10,6 +10,12 @@
>     author: "Rust for Linux Contributors",
>     description: "Rust minimal sample",
>     license: "GPL",
> +    params: {
> +        test_parameter: i64 {
> +            default: 1,
> +            description: "This parameter has a default of 1",
> +        },
> +    },
> }
>=20
> struct RustMinimal {
> @@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
>     fn init(_module: &'static ThisModule) -> Result<Self> {
>         pr_info!("Rust minimal sample (init)\n");
>         pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
> +        pr_info!(
> +            "My parameter: {}\n",
> +            *module_parameters::test_parameter.get()
> +        );
>=20
>         let mut numbers =3D KVec::new();
>         numbers.push(72, GFP_KERNEL)?;
>=20
> --=20
> 2.47.0
>=20
>=20
>=20

=E2=80=94 Daniel=

