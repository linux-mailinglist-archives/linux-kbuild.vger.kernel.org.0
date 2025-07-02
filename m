Return-Path: <linux-kbuild+bounces-7845-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63DAF5CB3
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 17:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5779B7B0028
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20162DBF48;
	Wed,  2 Jul 2025 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqth9hbF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C001E30B9B0;
	Wed,  2 Jul 2025 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469675; cv=none; b=V5Ch0TIX3Z00OPWOYgRRtLUCO7tTAJzzd3YN0O0T5k53JF5RdCxwh2cqXTqt2czGsmzapsrSQBX7j8rFqNuKFJacp3FSX5LQOg8b7DI5yPfGGJzlwud7zpycShoNomVu1InCHuRzT9hj1mDSltl4w39ajovwO3BWDfPeYfGO9xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469675; c=relaxed/simple;
	bh=S7xdFAGp0J9apbDWJuzNBuwq3V6FZebfE02WK0aJuzY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=CqQaHQvdJA1SRtrWez1/jiPa75GQJA3RfHMccQgtS/uUNoefO6PByMUMvwLihjFvHOZUL2zQeDdZNNzJbmnoiBjNkEbr8Q/bwurpKXanhoZqw8jdGzCFAu//LO3eqgRqdQBsNYPx/TpAEBYCLWTM7JqxDuIiAsAkham9NwTmwro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqth9hbF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19F5C4CEF3;
	Wed,  2 Jul 2025 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751469675;
	bh=S7xdFAGp0J9apbDWJuzNBuwq3V6FZebfE02WK0aJuzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqth9hbF6T6TmzpRi0fBbFz8VPuVp/hkJxsIuEQVKV0A0AAwFQRN3/7XkBSOoUxCl
	 fD2qjJXXOm57KBbESkL56fAb3enoR0YMGJMEqbvkTV5SPJymeuKO+bZA7MbWmjXLSo
	 beko5NOVo1060Mqwe1+79SFdBaZHK+/d8FX0JPFLhNkQ2Wn01+AqRDcHrlq/241Z62
	 mT4W0jOxr8sdyN4ysfrSAOSaoVh/Y70wqgq8jvpJy6ykatFkFYw+xD3YYwrIZRtJXk
	 Gw1+3oLNvXTyuZw117sXJGnP6rTE5C4kGbjUv2xSu7CVq4qK5Wqy+aHpTNnW5C0GMh
	 evfBsSXQGTxlg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 17:21:08 +0200
Message-Id: <DB1O6I32IYI4.OFHKKMD9JV40@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v14 3/7] rust: introduce module_param module
X-Mailer: aerc 0.20.1
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-3-5b1cc32311af@kernel.org>

On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
> Add types and traits for interfacing the C moduleparam API.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

I have some nits below, but overall

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/lib.rs          |   1 +
>  rust/kernel/module_param.rs | 191 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 192 insertions(+)

I really like how the `OnceLock` usage turned out here! Thanks for the
quick impl!

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
> index 000000000000..ca4be7e45ff7
> --- /dev/null
> +++ b/rust/kernel/module_param.rs
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support for module parameters.
> +//!
> +//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/modu=
leparam.h)
> +
> +use crate::prelude::*;
> +use crate::str::BStr;
> +use bindings;
> +use kernel::sync::once_lock::OnceLock;
> +
> +/// Newtype to make `bindings::kernel_param` [`Sync`].
> +#[repr(transparent)]
> +#[doc(hidden)]
> +pub struct RacyKernelParam(bindings::kernel_param);

Can you remind me why this is called `Racy`? Maybe add the explainer in
a comment? (and if it's named racy, why is it okay?)

If it doesn't have a real reason, maybe it should be called
`KernelParam`?

> +
> +impl RacyKernelParam {
> +    #[doc(hidden)]
> +    pub const fn new(val: bindings::kernel_param) -> Self {
> +        Self(val)
> +    }
> +}
> +
> +// SAFETY: C kernel handles serializing access to this type. We never ac=
cess it
> +// from Rust module.
> +unsafe impl Sync for RacyKernelParam {}
> +
> +/// Types that can be used for module parameters.
> +// NOTE: This trait is `Copy` because drop could produce unsoundness dur=
ing teardown.
> +pub trait ModuleParam: Sized + Copy {
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

This isn't used anywhere in the patchset and AFAIK the kernel is moving
away from module params, so I'm not so sure if we're going to have
strings as params.

Or do you already have those patches ready/plan to use strings? If not,
then I think we should just remove this type and when we actually need
them add it.

> +
> +    /// Parse a parameter argument into the parameter value.
> +    fn try_from_param_arg(arg: &BStr) -> Result<Self>;
> +}
> +

> +impl<T> ModuleParamAccess<T> {
> +    #[doc(hidden)]
> +    pub const fn new(default: T) -> Self {
> +        Self {
> +            value: OnceLock::new(),
> +            default,
> +        }
> +    }
> +
> +    /// Get a shared reference to the parameter value.
> +    // Note: When sysfs access to parameters are enabled, we have to pas=
s in a
> +    // held lock guard here.
> +    pub fn get(&self) -> &T {
> +        self.value.as_ref().unwrap_or(&self.default)
> +    }
> +
> +    /// Get a mutable pointer to `self`.
> +    ///
> +    /// NOTE: In most cases it is not safe deref the returned pointer.
> +    pub const fn as_void_ptr(&self) -> *mut c_void {
> +        (self as *const Self).cast_mut().cast()

There is `core::ptr::from_ref` that we should use instead of the `as`
cast.

---
Cheers,
Benno

> +    }
> +}
> +
> +#[doc(hidden)]
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


