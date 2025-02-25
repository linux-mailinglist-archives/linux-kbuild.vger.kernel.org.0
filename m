Return-Path: <linux-kbuild+bounces-5899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DD3A436E1
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 09:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0042188507A
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 08:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F606215F45;
	Tue, 25 Feb 2025 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx/7M07h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D1D3F9D2;
	Tue, 25 Feb 2025 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470585; cv=none; b=RDggA4sYvDybkSOAhnuszywKMMaXhJ1GWBNI03bIlbZ2uuX6CNE2zYP7G5osjCw3sC2SsBZMFScIauLvfOI1jeHLXsYkJZTNela8EM3jd9SD2usaCnGc/tPuwsEC7jILkL0xJVNlwJqTgjbKRUn+YLI2Oj6qQA5cEeuJJzTsLvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470585; c=relaxed/simple;
	bh=2eHIphndq2uDMmUAi5YKrcovaUYO7tN2516cB/KGSJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QuSNn4PUlcpWcprZnIs8FdltXI/tDrMVEpmSUs9jFnKpXwf887FkgP+BJhRTwl8cC+KzYzyDz4H+wF3jWp1lkaUnfUVnYoP5ePODDto1I6XI+rS4w00s7ARYJ/bw1i8y1y10PEqXptUKuknz/ac3MKQoKbiR7mUu+ziIeeQ7O7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx/7M07h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFC5C4CEDD;
	Tue, 25 Feb 2025 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740470584;
	bh=2eHIphndq2uDMmUAi5YKrcovaUYO7tN2516cB/KGSJE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Nx/7M07hAEBi0dLlOognbXKP6zq06Mb+JLcy+hbp6Hw3vWiiOFg/cm80dQ6uNtGHV
	 +/03BHv396IAmmIoHUMtxlb8bVJfKk4Qii+Bg7WDbDbeSO5Nf3d4K8PDgsO1uznoEg
	 eWsClj93xEpdFNIQOlWQNv0nsZI7Y31QGKvBZDpK/So0Av3ctaVqwA9NAjZFS+YFo9
	 THHdDUh+4ThoEQ7Fujacm4SdarEdXljz98nU5gRSBQ+u78no0N7hhNpG+M3B0BykSr
	 2J7UO/So99wxDo3Ug4vK0reQDkh3ldYSXakmo3Z1TbziV3nvjMBP8I2xcmXj6XjwG+
	 JFF2ctpbpF5tg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu"
 <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v7 6/6] rust: add parameter support to the `module!` macro
In-Reply-To: <8AF85A37-76AC-4937-BD59-115BB432B738@collabora.com> (Daniel
	Almeida's message of "Mon, 24 Feb 2025 12:28:56 -0300")
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-6-5e1afabcac1b@kernel.org>
	<oUH3AFSXY_kfA4fHRG_JpLCzAsZp4wujRwtOGwjKUuaB0-xVhRPPIQZ41nWZaJGFqTkbqBNKHTg3OskxIN7g5g==@protonmail.internalid>
	<8AF85A37-76AC-4937-BD59-115BB432B738@collabora.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 25 Feb 2025 09:02:52 +0100
Message-ID: <87o6yqxxhv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

> Hi Andreas, thanks for working on this, I can see that this patch took a =
lot
> of effort.

Thanks! It's not all me though, it's based on old code from the
pre-merge days.

[...]

>> index 0000000000000..0047126c917f4
>> --- /dev/null
>> +++ b/rust/kernel/module_param.rs
>> @@ -0,0 +1,226 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Types for module parameters.
>
> nit: maybe =E2=80=9CSupport for module parameters=E2=80=9D?
>
> Or anything else other than =E2=80=9Ctypes=E2=80=9D, really :)

I agree. I think originally the naming came from this being types
backing the macro implementation.

>
>> +//!
>> +//! C header: [`include/linux/moduleparam.h`](srctree/include/linux/mod=
uleparam.h)
>> +
>> +use crate::prelude::*;
>> +use crate::str::BStr;
>> +
>> +/// Newtype to make `bindings::kernel_param` [`Sync`].
>> +#[repr(transparent)]
>> +#[doc(hidden)]
>> +pub struct RacyKernelParam(pub ::kernel::bindings::kernel_param);
>> +
>> +// SAFETY: C kernel handles serializing access to this type. We never a=
ccess
>
> nit: perhaps: =E2=80=9Cwe never access *it* from *a* Rust module=E2=80=9D=
 ?

Right =F0=9F=91=8D

>
>> +// from Rust module.
>> +unsafe impl Sync for RacyKernelParam {}
>> +
>> +/// Types that can be used for module parameters.
>> +///
>> +/// Note that displaying the type in `sysfs` will fail if
>> +/// [`Display`](core::fmt::Display) implementation would write more than
>
> nit: perhaps `implementation writes more than`? Although it=E2=80=99d be =
great if a
> native speaker could chime in on this one.

Actually, we removed the support for displaying in sysfs from the
series, so I will just yank that note.

>
>> +/// [`PAGE_SIZE`] - 1 bytes.
>> +///
>> +/// [`PAGE_SIZE`]: `bindings::PAGE_SIZE`
>> +pub trait ModuleParam: Sized {
>> +    /// The [`ModuleParam`] will be used by the kernel module through t=
his type.
>> +    ///
>> +    /// This may differ from `Self` if, for example, `Self` needs to tr=
ack
>> +    /// ownership without exposing it or allocate extra space for other=
 possible
>> +    /// parameter values.
>
> I don=E2=80=99t understand what=E2=80=99s being said here. e.g.: what doe=
s =E2=80=9CSelf needs to track
> ownership without exposing it=E2=80=9D mean? Can you expand on this?

For some parameter types, such as string values, the parameter may
assume a reference value or an owned value. The reference value would be
used as default (as a reference to a static string), while an owned
value would be passed in when the value is set. For that, `Value` can be
an enum.

We yanked support for anything but integer parameters from this series,
but I would like to keep this around to make adding string parameters
less churn in the near future.

If you follow link [1] in the cover letter, you can see the original
code from the pre-merge branch that this patch is based on.

>
> Also this is pub. It should perhaps also be sealed?

We might in the future allow users to implement their own parsers.

>
>
>> +    // This is required to support string parameters in the future.
>> +    type Value: ?Sized;
>
> Why? Can you also expand on this a tad further?

As explained above.

>
>> +
>> +    /// Parse a parameter argument into the parameter value.
>> +    ///
>> +    /// `Err(_)` should be returned when parsing of the argument fails.
>> +    ///
>> +    /// Parameters passed at boot time will be set before [`kmalloc`] is
>> +    /// available (even if the module is loaded at a later time). Howev=
er, in
>> +    /// this case, the argument buffer will be valid for the entire lif=
etime of
>> +    /// the kernel. So implementations of this method which need to all=
ocate
>> +    /// should first check that the allocator is available (with
>> +    /// [`crate::bindings::slab_is_available`]) and when it is not avai=
lable
>> +    /// provide an alternative implementation which doesn't allocate. I=
n cases
>> +    /// where the allocator is not available it is safe to save referen=
ces to
>> +    /// `arg` in `Self`, but in other cases a copy should be made.
>> +    ///
>> +    /// [`kmalloc`]: srctree/include/linux/slab.h
>> +    fn try_from_param_arg(arg: &'static [u8]) -> Result<Self>;
>> +}
>> +
>> +/// Set the module parameter from a string.
>> +///
>> +/// Used to set the parameter value at kernel initialization, when load=
ing
>> +/// the module or when set through `sysfs`.
>> +///
>> +/// `param.arg` is a pointer to `*mut T` as set up by the [`module!`]
>> +/// macro.
>
> Perhaps the above should also be an invariant?

Actually, I think it should be part of the safety requirements.

[...]

>> +
>> +impl<T> ModuleParamAccess<T> {
>> +    #[doc(hidden)]
>> +    pub const fn new(value: T) -> Self {
>
> I assume that this is pub so that the macro can find it? If so, can you l=
eave a note
> outlining this?

Yes, it must be accessible from other crates (modules). Will add a note.

>
>> +        Self {
>> +            data: core::cell::UnsafeCell::new(value),
>> +        }
>> +    }
>> +
>> +    /// Get a shared reference to the parameter value.
>> +    // Note: When sysfs access to parameters are enabled, we have to pa=
ss in a
>> +    // held lock guard here.
>
> What lock guard, guarding what exactly?

That is yet to be determined. When we enable sysfs, we will have async
access to the parameter value when user space interacts with sysfs.
Thus, we need to apply synchronization on parameter value access. I
envision a lock being taken before this method is called and a lock
guard passed in to access the data.

The code has deviated quite a bit from the original, but you can see a
possible implementation here [1].

[1] https://github.com/Rust-for-Linux/linux/blob/bc22545f38d74473cfef3e9fd6=
5432733435b79f/rust/macros/module.rs#L410


[...]

>> +    fn emit_params(&mut self, info: &ModuleInfo) {
>> +        let Some(params) =3D &info.params else {
>> +            return;
>> +        };
>
> Shouldn=E2=80=99t this panic? A call to emit_params() where there=E2=80=
=99s nothing to emit doesn=E2=80=99t
> look right at a first glance.

No, having no parameters is a valid configuration. If the "params" key
is left out in the module macro call, the option will be `None`. The
call to this function when generating code is unconditional.

[...]

>> -    if let Some(firmware) =3D info.firmware {
>> +    if let Some(firmware) =3D &info.firmware {
>>         for fw in firmware {
>> -            modinfo.emit("firmware", &fw);
>> +            modinfo.emit("firmware", fw);
>>         }
>>     }
>
> These seem a bit unrelated?

They could be split in a precursor patch, but they are required for this
change set. If you insist I will split them out, but I am also happy to
keep them as one big change.

>
>>
>>     // Built-in modules also export the `file` modinfo string.
>>     let file =3D
>>         std::env::var("RUST_MODFILE").expect("Unable to fetch RUST_MODFI=
LE environmental variable");
>> -    modinfo.emit_only_builtin("file", &file);
>> +    modinfo.emit_only_builtin("file", &file, false);
>> +
>> +    modinfo.emit_params(&info);
>>
>>     format!(
>>         "
>> @@ -362,14 +514,17 @@ unsafe fn __exit() {{
>>                             __MOD.assume_init_drop();
>>                         }}
>>                     }}
>> -
>>                     {modinfo}
>>                 }}
>>             }}
>> +            mod module_parameters {{
>> +                {params}
>> +            }}
>>         ",
>>         type_ =3D info.type_,
>>         name =3D info.name,
>>         modinfo =3D modinfo.buffer,
>> +        params =3D modinfo.param_buffer,
>>         initcall_section =3D ".initcall6.init"
>>     )
>>     .parse()
>> diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
>> index 4aaf117bf8e3c..d999a77c6eb9a 100644
>
> I wonder if the changes to rust_minimal.rs should be a separate patch.

Either way works for me.


Thanks for the comments!


Best regards,
Andreas Hindborg



