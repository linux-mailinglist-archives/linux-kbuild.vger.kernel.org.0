Return-Path: <linux-kbuild+bounces-5907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF54A44489
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 16:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FBAD17C08F
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 15:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AC1140E3C;
	Tue, 25 Feb 2025 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCArztDA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ACC21ABAF;
	Tue, 25 Feb 2025 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497719; cv=none; b=DaWeuVNQ/qb33709QbZSEjnIQ2opv/yFkfxXQ2PCMtLJk7vr3B6MGBG2057mCuAPW2icjfJSQMVjpKATXky8/Zf7rofdhWZG+8gDYtpqxLvytAuVTmrh0k+Bx9DqdMimN7UAvJjwyPCcdrOZHz30MISQZBsAur5tUb4XsRjFBNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497719; c=relaxed/simple;
	bh=bp9oZvL4RjxCwLE4GDLSsOKNBAf+jW4nFVxebzeOHuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FQgHRDlNIrO5LDxa6fOe2Tg8hr4lUbAivRik/WYASE6XNXVgO6+tOVOZCTyOBCzzKQBMoTAvy6b2sUgdknPNEJVunkv6Jxet9oPivTd3SBjteTsj8JdkedOnyp/1qzUKL1DPI+xUkbxpQCZKkFQdLRYSRbvneRlq2H242GJFFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCArztDA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA567C4CEDD;
	Tue, 25 Feb 2025 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740497718;
	bh=bp9oZvL4RjxCwLE4GDLSsOKNBAf+jW4nFVxebzeOHuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SCArztDAOEC0cjov2xuTkVWMG4aYNAhdWgJAvIGBrkFaMIb/0kyyRAaVpNURLy2iN
	 xQgRiMORgEImRMCI7UuBDoyeVrdS3VNYdsSbyY19r/8BGnGNhc75JnB8oEtqvk/cQm
	 eURDT1BXsrw8xUcBnkAZZRwclKPYB4Azzpc8rFCGbBqSxZtON5eex2PKayQflDnzZp
	 O6FS0zGZo2OY/JRqncv/2e2ZqakfX0NeBxzztehgv/QsOW5I4eC12ibLxK5z87NnFN
	 1zY59dGEAZA0RjFzw/5dd/5XZcGO1Q0G6dh1YQ2Qfo3JwBjobTEttncOLP+6xDbSQp
	 ahPTiI40dzdCQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Nicolas Schier"
 <nicolas@fjasle.eu>,  "Luis Chamberlain" <mcgrof@kernel.org>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <linux-kbuild@vger.kernel.org>,
  "Petr Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen"
 <samitolvanen@google.com>,  "Daniel Gomez" <da.gomez@samsung.com>,
  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg KH"
 <gregkh@linuxfoundation.org>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v7 6/6] rust: add parameter support to the `module!` macro
In-Reply-To: <20250225151417.7805b697@eugeo> (Gary Guo's message of "Tue, 25
	Feb 2025 15:14:17 +0000")
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-6-5e1afabcac1b@kernel.org>
	<F8_61WnicMEefukOwS9IyBGAd4t351bIHekvrbaiiIsdBU_lHw2fefp1Ru4bMIBgJRwAzN2mWJdPDQUCOaEm-g==@protonmail.internalid>
	<20250225151417.7805b697@eugeo>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 25 Feb 2025 16:35:02 +0100
Message-ID: <87wmdeujfd.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue, 18 Feb 2025 14:00:48 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> This patch includes changes required for Rust kernel modules to utilize
>> module parameters. This code implements read only support for integer
>> types without `sysfs` support.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective
>> ---
>>  rust/kernel/lib.rs           |   1 +
>>  rust/kernel/module_param.rs  | 226 +++++++++++++++++++++++++++++++++++++++++++
>>  rust/macros/helpers.rs       |  25 +++++
>>  rust/macros/lib.rs           |  31 ++++++
>>  rust/macros/module.rs        | 191 ++++++++++++++++++++++++++++++++----
>>  samples/rust/rust_minimal.rs |  10 ++
>>  6 files changed, 466 insertions(+), 18 deletions(-)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 496ed32b0911a..aec04df2bac9f 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -57,6 +57,7 @@
>>  pub mod kunit;
>>  pub mod list;
>>  pub mod miscdevice;
>> +pub mod module_param;
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>>  pub mod of;
>> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
>> new file mode 100644
>> index 0000000000000..0047126c917f4
>> --- /dev/null
>> +++ b/rust/kernel/module_param.rs
>> @@ -0,0 +1,226 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Types for module parameters.
>> +//!
>> +//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/moduleparam.h)
>> +
>> +use crate::prelude::*;
>> +use crate::str::BStr;
>> +
>> +/// Newtype to make `bindings::kernel_param` [`Sync`].
>> +#[repr(transparent)]
>> +#[doc(hidden)]
>> +pub struct RacyKernelParam(pub ::kernel::bindings::kernel_param);
>> +
>> +// SAFETY: C kernel handles serializing access to this type. We never access
>> +// from Rust module.
>> +unsafe impl Sync for RacyKernelParam {}
>
> I wonder if we should have a custom impl of `SyncUnsafeCell` for this
> kind of usage (so that when it is stabilized by Rust, we can just switc
> over).

We discussed this before, I don't recall what we decided. At any rate,
it's orthogonal. We can patch this if we add `SyncUnsafeCell`.

>
>> +
>> +/// Types that can be used for module parameters.
>> +///
>> +/// Note that displaying the type in `sysfs` will fail if
>> +/// [`Display`](core::fmt::Display) implementation would write more than
>> +/// [`PAGE_SIZE`] - 1 bytes.
>> +///
>> +/// [`PAGE_SIZE`]: `bindings::PAGE_SIZE`
>> +pub trait ModuleParam: Sized {
>> +    /// The [`ModuleParam`] will be used by the kernel module through this type.
>> +    ///
>> +    /// This may differ from `Self` if, for example, `Self` needs to track
>> +    /// ownership without exposing it or allocate extra space for other possible
>> +    /// parameter values.
>> +    // This is required to support string parameters in the future.
>> +    type Value: ?Sized;
>> +
>> +    /// Parse a parameter argument into the parameter value.
>> +    ///
>> +    /// `Err(_)` should be returned when parsing of the argument fails.
>> +    ///
>> +    /// Parameters passed at boot time will be set before [`kmalloc`] is
>> +    /// available (even if the module is loaded at a later time). However, in
>> +    /// this case, the argument buffer will be valid for the entire lifetime of
>> +    /// the kernel. So implementations of this method which need to allocate
>> +    /// should first check that the allocator is available (with
>> +    /// [`crate::bindings::slab_is_available`]) and when it is not available
>> +    /// provide an alternative implementation which doesn't allocate. In cases
>> +    /// where the allocator is not available it is safe to save references to
>> +    /// `arg` in `Self`, but in other cases a copy should be made.
>> +    ///
>> +    /// [`kmalloc`]: srctree/include/linux/slab.h
>> +    fn try_from_param_arg(arg: &'static [u8]) -> Result<Self>;
>> +}
>> +
>> +/// Set the module parameter from a string.
>> +///
>> +/// Used to set the parameter value at kernel initialization, when loading
>> +/// the module or when set through `sysfs`.
>> +///
>> +/// `param.arg` is a pointer to `*mut T` as set up by the [`module!`]
>> +/// macro.
>> +///
>> +/// See `struct kernel_param_ops.set`.
>> +///
>> +/// # Safety
>> +///
>> +/// If `val` is non-null then it must point to a valid null-terminated
>> +/// string. The `arg` field of `param` must be an instance of `T`.
>> +///
>> +/// # Invariants
>> +///
>> +/// Currently, we only support read-only parameters that are not readable
>> +/// from `sysfs`. Thus, this function is only called at kernel
>> +/// initialization time, or at module load time, and we have exclusive
>> +/// access to the parameter for the duration of the function.
>> +///
>> +/// [`module!`]: macros::module
>> +unsafe extern "C" fn set_param<T>(
>> +    val: *const kernel::ffi::c_char,
>> +    param: *const crate::bindings::kernel_param,
>> +) -> core::ffi::c_int
>> +where
>> +    T: ModuleParam,
>> +{
>> +    // NOTE: If we start supporting arguments without values, val _is_ allowed
>> +    // to be null here.
>> +    if val.is_null() {
>> +        // TODO: Use pr_warn_once available.
>> +        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
>> +        return crate::error::code::EINVAL.to_errno();
>
> This is already in prelude, so you can just use `EINVAL` directly.

Thanks.

>
>> +    }
>> +
>> +    // SAFETY: By function safety requirement, val is non-null and
>> +    // null-terminated. By C API contract, `val` is live and valid for reads
>> +    // for the duration of this function.
>> +    let arg = unsafe { CStr::from_char_ptr(val).as_bytes() };
>> +
>> +    crate::error::from_result(|| {
>> +        let new_value = T::try_from_param_arg(arg)?;
>> +
>> +        // SAFETY: `param` is guaranteed to be valid by C API contract
>> +        // and `arg` is guaranteed to point to an instance of `T`.
>> +        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
>> +
>> +        // SAFETY: `old_value` is valid for writes, as we have exclusive
>> +        // access. `old_value` is pointing to an initialized static, and
>> +        // so it is properly initialized.
>> +        unsafe { core::ptr::replace(old_value, new_value) };
>> +        Ok(0)
>> +    })
>> +}
>> +
>> +/// Drop the parameter.
>> +///
>> +/// Called when unloading a module.
>> +///
>> +/// # Safety
>> +///
>> +/// The `arg` field of `param` must be an initialized instance of `T`.
>> +unsafe extern "C" fn free<T>(arg: *mut core::ffi::c_void)
>> +where
>> +    T: ModuleParam,
>> +{
>> +    // SAFETY: By function safety requirement, `arg` is an initialized
>> +    // instance of `T`. By C API contract, `arg` will not be used after
>> +    // this function returns.
>> +    unsafe { core::ptr::drop_in_place(arg as *mut T) };
>> +}
>> +
>> +macro_rules! impl_int_module_param {
>> +    ($ty:ident) => {
>> +        impl ModuleParam for $ty {
>> +            type Value = $ty;
>> +
>> +            fn try_from_param_arg(arg: &'static [u8]) -> Result<Self> {
>> +                let bstr = BStr::from_bytes(arg);
>
> Why isn't `arg` BStr in the first place?

I'll change it.


Best regards,
Andreas Hindborg



