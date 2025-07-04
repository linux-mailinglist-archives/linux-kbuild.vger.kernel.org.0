Return-Path: <linux-kbuild+bounces-7876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26276AF91C0
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 13:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78AF21BC82C8
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Jul 2025 11:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2212D5400;
	Fri,  4 Jul 2025 11:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0MeI5gh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A012BEC2E;
	Fri,  4 Jul 2025 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629519; cv=none; b=BGD7E+iW2C3Egi070+jqXCq/UiN9a6NzxnOXf6spKy0wZiOhlez28GTy0vgjqnMDL5OSxbUuXNKNIxuT4NQibAxPSR2eSZ4S+8fGb2L25YBsfxaV8k+xAZS8xQmMCXabZeNBKTRPt2UzJ4k66V/dFYjzVqhucGJTZqhqzYSqJt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629519; c=relaxed/simple;
	bh=z68hIx6N0LmzAsvuKPuFBdHA0hWmmGwcGwMSRF8yrb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U5ZfmtEt2KtOPgvQoiTP/klPjF26QxfPzeTeL6XABSAipUmucASxu6EHVCBPU/EmTqrXBWUPP9/kBW35xrL+k6zMnElUCDdCb++Ah5s+EEEjMf/EyGlfcUE8Au/h5azbXzyqEwWvn0a3h1hggNMrLBs66KJBH6l4K1VH/pq9pYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0MeI5gh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09449C4CEE3;
	Fri,  4 Jul 2025 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751629517;
	bh=z68hIx6N0LmzAsvuKPuFBdHA0hWmmGwcGwMSRF8yrb0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F0MeI5gheTCH4SLUA6Gisiy9QboJeevD4jtxZZsLNfLuc2Z4R44obTQvEunniAReN
	 k/UKeTALsE+PMpJnfgmnpjJfSxZlpEZvHuf2S68RwoWIb47ChvAVk7LCgnytqdqRCD
	 ewkIuIHioMilQdhXQaQvz256+sLVsrUu6jeSYiH3a4m0IoyQZiR8bAOybwW2gPw7q+
	 MF36TrXrHTxQwhqAlrSIae18ia6RWki+QJEQU8eM/6YN/m+yc+z42k0L73Y4+/i2+3
	 7NLXceD4ca7Z/zaxZiFL4f5LsCt/B34ByaM+Yv93G5C4ZonQzzXW9/Tj+yqJpR3isj
	 5KWbSvoCo64hw==
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
Subject: Re: [PATCH v14 3/7] rust: introduce module_param module
In-Reply-To: <DB1O6I32IYI4.OFHKKMD9JV40@kernel.org> (Benno Lossin's message of
	"Wed, 02 Jul 2025 17:21:08 +0200")
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
	<20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
	<dR1azql_mfbkqYH2GgSR3NoChU-VhgRMnWzZg_hWmpVx6P3-fLsrU8M06AwCzQPdrTSyCw0gzxG1bbGr7Wc_Dg==@protonmail.internalid>
	<DB1O6I32IYI4.OFHKKMD9JV40@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 13:45:06 +0200
Message-ID: <87jz4orxh9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Benno Lossin" <lossin@kernel.org> writes:

> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
>> Add types and traits for interfacing the C moduleparam API.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> I have some nits below, but overall
>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
>
>> ---
>>  rust/kernel/lib.rs          |   1 +
>>  rust/kernel/module_param.rs | 191 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 192 insertions(+)
>
> I really like how the `OnceLock` usage turned out here! Thanks for the
> quick impl!
>
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
>> index 000000000000..ca4be7e45ff7
>> --- /dev/null
>> +++ b/rust/kernel/module_param.rs
>> @@ -0,0 +1,191 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Support for module parameters.
>> +//!
>> +//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/mod=
uleparam.h)
>> +
>> +use crate::prelude::*;
>> +use crate::str::BStr;
>> +use bindings;
>> +use kernel::sync::once_lock::OnceLock;
>> +
>> +/// Newtype to make `bindings::kernel_param` [`Sync`].
>> +#[repr(transparent)]
>> +#[doc(hidden)]
>> +pub struct RacyKernelParam(bindings::kernel_param);
>
> Can you remind me why this is called `Racy`? Maybe add the explainer in
> a comment? (and if it's named racy, why is it okay?)
>
> If it doesn't have a real reason, maybe it should be called
> `KernelParam`?

It is an inherited name from way back. The type exists to allow a static
`bindings::kernel_param`, as this C type is not `Sync`.

I agree, it should just be `KernelParam`.

>
>> +
>> +impl RacyKernelParam {
>> +    #[doc(hidden)]
>> +    pub const fn new(val: bindings::kernel_param) -> Self {
>> +        Self(val)
>> +    }
>> +}
>> +
>> +// SAFETY: C kernel handles serializing access to this type. We never a=
ccess it
>> +// from Rust module.
>> +unsafe impl Sync for RacyKernelParam {}
>> +
>> +/// Types that can be used for module parameters.
>> +// NOTE: This trait is `Copy` because drop could produce unsoundness du=
ring teardown.
>> +pub trait ModuleParam: Sized + Copy {
>> +    /// The [`ModuleParam`] will be used by the kernel module through t=
his type.
>> +    ///
>> +    /// This may differ from `Self` if, for example, `Self` needs to tr=
ack
>> +    /// ownership without exposing it or allocate extra space for other=
 possible
>> +    /// parameter values.
>> +    // This is required to support string parameters in the future.
>> +    type Value: ?Sized;
>
> This isn't used anywhere in the patchset and AFAIK the kernel is moving
> away from module params, so I'm not so sure if we're going to have
> strings as params.

The kernel dropping module parameters depends on who you ask. But
regardless, we should probably remove it for now.

>
> Or do you already have those patches ready/plan to use strings? If not,
> then I think we should just remove this type and when we actually need
> them add it.

They are in the old rust branch and they need some work. I do not have a
user for them, which is why I am not including them in this series.

>
>> +
>> +    /// Parse a parameter argument into the parameter value.
>> +    fn try_from_param_arg(arg: &BStr) -> Result<Self>;
>> +}
>> +
>
>> +impl<T> ModuleParamAccess<T> {
>> +    #[doc(hidden)]
>> +    pub const fn new(default: T) -> Self {
>> +        Self {
>> +            value: OnceLock::new(),
>> +            default,
>> +        }
>> +    }
>> +
>> +    /// Get a shared reference to the parameter value.
>> +    // Note: When sysfs access to parameters are enabled, we have to pa=
ss in a
>> +    // held lock guard here.
>> +    pub fn get(&self) -> &T {
>> +        self.value.as_ref().unwrap_or(&self.default)
>> +    }
>> +
>> +    /// Get a mutable pointer to `self`.
>> +    ///
>> +    /// NOTE: In most cases it is not safe deref the returned pointer.
>> +    pub const fn as_void_ptr(&self) -> *mut c_void {
>> +        (self as *const Self).cast_mut().cast()
>
> There is `core::ptr::from_ref` that we should use instead of the `as`
> cast.

Cool =F0=9F=91=8D


Best regards,
Andreas Hindborg




