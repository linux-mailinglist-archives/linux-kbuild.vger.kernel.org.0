Return-Path: <linux-kbuild+bounces-7567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C704AE058D
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 14:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 314C2189C9ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 12:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BB024466E;
	Thu, 19 Jun 2025 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6nCO/Y5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6413423E358;
	Thu, 19 Jun 2025 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335653; cv=none; b=HerBdt2A+9oOiZE8KHn6zbUkEynvjp/zB0sja0XUrEB79TrpiaL5OGpUsAe0qCiAdFbBjcjDadc88wuKtQ9ipTF7YPLMKroQbi8/Q30+Up58C/ywcfcbWco1Zdh096PUdOlzhG/UAVlZ/qD1jgEFLZ/ndd5wr1xGBCE2T4BGpTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335653; c=relaxed/simple;
	bh=jkzqeMKIBGjU8Ii97etZU/DjufKhqttlQSlZ1CLvyXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SsyhObhHCZycltO91OTvqafJhxSzjYqzDyUHKZK8UwwyjhLxzuAdZhb6xwhTjljiqMBQE6gz8n4JWg1dX8tMl2q7rVByShtNUfOaWPJ4h69g2yIxn7D80dLGcOqPyLQUK5r9Cai0/OBDnNEUwxyRL0sjKTSP2DPDbGsslg6IgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6nCO/Y5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376EEC4CEEA;
	Thu, 19 Jun 2025 12:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750335653;
	bh=jkzqeMKIBGjU8Ii97etZU/DjufKhqttlQSlZ1CLvyXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B6nCO/Y5h2AOpwGwBS7+JPD1HqSk/+4K6bY3n9JgaiFkeRCEhFRX8CsXsJ2ZPwQWm
	 Eqivsu60zUrLM0oPWYTQIxHaYP1anbbaGsuQiFlHdRKvdZ7TGhHUQSdLuBxoD2iz+6
	 804BjcfvSrY5TPA9DU8xP3wRGOXUFEL6zyaV3EtvUcscbljVsaOJnmPVasrKqc3vnK
	 uum21K/8iSYVlQeAdWB8Cue3yPnlBMoESvIEHgT6UhArRr8YI4q1lX3zFwR4wNF/5L
	 ffVsq8BlHMXbgIcvF553TzdH55Q7gL8xbZTQB6tHW9jzA7LtG/B55L/qEsHFTz937q
	 4HGRCESf3nWYw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
In-Reply-To: <DAPYMAB44RUZ.7NIWDUWY1UYF@kernel.org> (Benno Lossin's message of
	"Wed, 18 Jun 2025 22:59:57 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-2-bc219cd1a3f8@kernel.org>
	<aa9d7lhjQuDhyNw8zShbtfPFK19W5awx7cPJgC-2X4fGv2yUTnn0jqyIHfMN4wyuaYoS3fU6Fqe_wFteVUGtUg==@protonmail.internalid>
	<DAPYMAB44RUZ.7NIWDUWY1UYF@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 14:20:40 +0200
Message-ID: <87v7or7wiv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>> Add types and traits for interfacing the C moduleparam API.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/lib.rs          |   1 +
>>  rust/kernel/module_param.rs | 201 ++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 202 insertions(+)
>>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 6b4774b2b1c3..2b439ea06185 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -87,6 +87,7 @@
>>  pub mod list;
>>  pub mod miscdevice;
>>  pub mod mm;
>> +pub mod module_param;
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>>  pub mod of;
>> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
>> new file mode 100644
>> index 000000000000..fd167df8e53d
>> --- /dev/null
>> +++ b/rust/kernel/module_param.rs
>> @@ -0,0 +1,201 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Support for module parameters.
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
>
> s/::kernel:://
>
> The field shouldn't be public, since then people can access it. Can
> just have a `pub fn new` instead?

OK.

>
>> +
>> +// SAFETY: C kernel handles serializing access to this type. We never access it
>> +// from Rust module.
>> +unsafe impl Sync for RacyKernelParam {}
>> +
>> +/// Types that can be used for module parameters.
>> +pub trait ModuleParam: Sized + Copy {
>
> Why the `Copy` bound?

Because of potential unsoundness due to drop [1]. I should document
this. It is noted in the change log for the series under the obscure
entry "Assign through pointer rather than using `core::ptr::replace`."

[1] https://lore.kernel.org/all/878qnbxtyi.fsf@kernel.org

>
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
>
> I don't think we need to explicitly mention this.

I'll remove the line.

>
>> +    ///
>> +    /// Parameters passed at boot time will be set before [`kmalloc`] is
>> +    /// available (even if the module is loaded at a later time). However, in
>
> I think we should make a section out of this like `# No allocations` (or
> something better). Let's also mention it on the trait itself, since
> that's where implementers will most likely look.

Since this series only support `Copy` types that are passed by value, I
think we can remove this comment for now. I will also restrict the
lifetime of the string to he duration of the call. Putting static here
would be lying.

>
>> +    /// this case, the argument buffer will be valid for the entire lifetime of
>> +    /// the kernel. So implementations of this method which need to allocate
>> +    /// should first check that the allocator is available (with
>> +    /// [`crate::bindings::slab_is_available`]) and when it is not available
>
> We probably shouldn't recommend directly using `bindings`.
>
>> +    /// provide an alternative implementation which doesn't allocate. In cases
>> +    /// where the allocator is not available it is safe to save references to
>> +    /// `arg` in `Self`, but in other cases a copy should be made.
>
> I don't understand this convention, but it also doesn't seem to
> relevant (so feel free to leave it as is, but it would be nice if you
> could explain it).

It has become irrelevant as the series evolved. When we supported
`!Copy` types we would use the reference if we knew it would be valid
for the lifetime of the kernel, otherwise we would allocate [1].

However, when the reference is passed at module load time, it is still
guaranteed to be live for the lifetime of the module, and hence it can
still be considered `'static`. But, if the reference were to find it's
way across the module boundary, it can cause UAF issues as the reference
is not truely `'static`, it is actually `'module`. This ties into the
difficulty we have around safety of unloading modules. Module unload
should be marked unsafe.

At any rate, I will remove the `'static` lifetime from the reference and
we are all good for now.

[1] https://github.com/Rust-for-Linux/linux/blob/18b7491480025420896e0c8b73c98475c3806c6f/rust/kernel/module_param.rs#L476

>
>> +    ///
>> +    /// [`kmalloc`]: srctree/include/linux/slab.h
>> +    fn try_from_param_arg(arg: &'static BStr) -> Result<Self>;
>> +}
>> +
>> +/// Set the module parameter from a string.
>> +///
>> +/// Used to set the parameter value at kernel initialization, when loading
>> +/// the module or when set through `sysfs`.
>> +///
>> +/// See `struct kernel_param_ops.set`.
>> +///
>> +/// # Safety
>> +///
>> +/// - If `val` is non-null then it must point to a valid null-terminated string that must be valid
>> +///   for reads for the duration of the call.
>> +/// - `parm` must be a pointer to a `bindings::kernel_param` that is valid for reads for the
>
> s/parm/param/

Yea, I get contaminated with spellings used elsewhere in the kernel.

>
>> +///   duration of the call.
>> +/// - `param.arg` must be a pointer to an initialized `T` that is valid for writes for the duration
>> +///   of the function.
>> +///
>> +/// # Note
>> +///
>> +/// - The safety requirements are satisfied by C API contract when this function is invoked by the
>> +///   module subsystem C code.
>> +/// - Currently, we only support read-only parameters that are not readable from `sysfs`. Thus, this
>> +///   function is only called at kernel initialization time, or at module load time, and we have
>> +///   exclusive access to the parameter for the duration of the function.
>> +///
>> +/// [`module!`]: macros::module
>> +unsafe extern "C" fn set_param<T>(
>> +    val: *const c_char,
>> +    param: *const crate::bindings::kernel_param,
>> +) -> c_int
>> +where
>> +    T: ModuleParam,
>> +{
>> +    // NOTE: If we start supporting arguments without values, val _is_ allowed
>> +    // to be null here.
>> +    if val.is_null() {
>> +        // TODO: Use pr_warn_once available.
>> +        crate::pr_warn!("Null pointer passed to `module_param::set_param`");
>> +        return EINVAL.to_errno();
>> +    }
>> +
>> +    // SAFETY: By function safety requirement, val is non-null, null-terminated
>> +    // and valid for reads for the duration of this function.
>> +    let arg = unsafe { CStr::from_char_ptr(val) };
>
> `arg` has the type `&'static CStr`, which is not justified by the safety
> comment :(

Not any longer, as outlined above. Thanks for catching this.

> Why does `ModuleParam::try_from_param_arg` take a `&'static BStr` and
> not a `&BStr`? I guess it is related to the "make copies if allocator is
> available" question I had above.

Yep.

>
>> +
>> +    crate::error::from_result(|| {
>> +        let new_value = T::try_from_param_arg(arg)?;
>> +
>> +        // SAFETY: By function safety requirements `param` is be valid for reads.
>> +        let old_value = unsafe { (*param).__bindgen_anon_1.arg as *mut T };
>> +
>> +        // SAFETY: By function safety requirements, the target of `old_value` is valid for writes
>> +        // and is initialized.
>> +        unsafe { *old_value = new_value };
>
> So if we keep the `ModuleParam: Copy` bound from above, then we don't
> need to drop the type here (as `Copy` implies `!Drop`). So we could also
> remove the requirement for initialized memory and use `ptr::write` here
> instead. Thoughts?

Yes, that is the rationale for the `Copy` bound. What would be the
benefit of using `ptr::write`? They should be equivalent for `Copy`
types, right.

I was using `ptr::replace`, but Alice suggested the pace expression
assignment instead, since I was not using the old value.

>
>> +        Ok(0)
>> +    })
>> +}
>> +
>> +macro_rules! impl_int_module_param {
>> +    ($ty:ident) => {
>> +        impl ModuleParam for $ty {
>> +            type Value = $ty;
>> +
>> +            fn try_from_param_arg(arg: &'static BStr) -> Result<Self> {
>> +                <$ty as crate::str::parse_int::ParseInt>::from_str(arg)
>> +            }
>> +        }
>> +    };
>> +}
>> +
>> +impl_int_module_param!(i8);
>> +impl_int_module_param!(u8);
>> +impl_int_module_param!(i16);
>> +impl_int_module_param!(u16);
>> +impl_int_module_param!(i32);
>> +impl_int_module_param!(u32);
>> +impl_int_module_param!(i64);
>> +impl_int_module_param!(u64);
>> +impl_int_module_param!(isize);
>> +impl_int_module_param!(usize);
>> +
>> +/// A wrapper for kernel parameters.
>> +///
>> +/// This type is instantiated by the [`module!`] macro when module parameters are
>> +/// defined. You should never need to instantiate this type directly.
>> +///
>> +/// Note: This type is `pub` because it is used by module crates to access
>> +/// parameter values.
>> +#[repr(transparent)]
>> +pub struct ModuleParamAccess<T> {
>> +    data: core::cell::UnsafeCell<T>,
>> +}
>
> We should just re-create the `SyncUnsafeCell` [1] from upstream...

I will add a // TODO: Use `SyncUnsafeCell` when available.

>
> Feel free to keep this until we have it though.
>
> [1]: https://doc.rust-lang.org/nightly/std/cell/struct.SyncUnsafeCell.html
>
>> +
>> +// SAFETY: We only create shared references to the contents of this container,
>> +// so if `T` is `Sync`, so is `ModuleParamAccess`.
>> +unsafe impl<T: Sync> Sync for ModuleParamAccess<T> {}
>> +
>> +impl<T> ModuleParamAccess<T> {
>> +    #[doc(hidden)]
>> +    pub const fn new(value: T) -> Self {
>> +        Self {
>> +            data: core::cell::UnsafeCell::new(value),
>> +        }
>> +    }
>> +
>> +    /// Get a shared reference to the parameter value.
>> +    // Note: When sysfs access to parameters are enabled, we have to pass in a
>> +    // held lock guard here.
>> +    pub fn get(&self) -> &T {
>> +        // SAFETY: As we only support read only parameters with no sysfs
>> +        // exposure, the kernel will not touch the parameter data after module
>> +        // initialization.
>> +        unsafe { &*self.data.get() }
>> +    }
>> +
>> +    /// Get a mutable pointer to the parameter value.
>> +    pub const fn as_mut_ptr(&self) -> *mut T {
>> +        self.data.get()
>> +    }
>> +}
>> +
>> +#[doc(hidden)]
>> +#[macro_export]
>
> Why export this?

Legacy debt. I'll remove it.


Best regards,
Andreas Hindborg



