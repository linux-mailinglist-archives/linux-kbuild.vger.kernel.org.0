Return-Path: <linux-kbuild+bounces-5125-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B69F0D2B
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 14:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1CD91683EB
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 13:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C94D1E049C;
	Fri, 13 Dec 2024 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCYKX/MI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC01DFE2C;
	Fri, 13 Dec 2024 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734095852; cv=none; b=brtiuB++8kPL3IpNoxmZ5Hja41bNYaCDs2NB4Gbh4tWzxszOXIGxWgUQyyPWgoezSa7tK3pW/emYtxOdV8yyKT0FlB0FAddWfc45YJVr3qC2+Ob+VYYuBWYsb2KizXGbLvL1XCAwSw4dmRcPPDldFBsauSEd5x8Rmlvw8XzUnRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734095852; c=relaxed/simple;
	bh=tMXE95FfkjhkdFZo7cyuYKKGbHS/ZBxnfSxNp0VgYiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tAyR6rsg/+AbD0VYUJA5pi5tkR8o+RAvGjeyWx2iAIZiyROVVihvaEmJVUMDoNAZemRQDip019aJrkbLHSV81Es5WssG9pPzbMzmZLVqUUfzSmUuEx0ZyLmk3lYfrkgB/vYbCEv9kxZqOdDCBfSvpb+N/2XZwSGJ3RJaVpwoGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCYKX/MI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993E2C4CED7;
	Fri, 13 Dec 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734095852;
	bh=tMXE95FfkjhkdFZo7cyuYKKGbHS/ZBxnfSxNp0VgYiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CCYKX/MIgky9byQK2GGKBUqrXedQcPRVdNhargwyBMeHFzUYdgB21qQtUqIblJpcH
	 E9AtC7MMji5y7iia648qfhnNAX4pFRB1vWiJaa0kPcBkt/v4/3H8ufGKKNYrT0rUu3
	 ZwnYSJyYlS04s0lQzGHQ6paXpFinQiHsF4qWtM/xdj8KMd/2E+caNRX5LI4MLVqMbB
	 4km1suW1AgZq8hAL6vePKSYbP7uN/Tk97t0EHg75I0ttm6/NCcHjX62+1ltQQI9NRJ
	 i24K+fLC5dul7ZWRDSPmwQKbUkDA127dGrvz9Z44YSuwRxA59d5ZYA6EhB+1tYJMBc
	 5tFjklHYM8tcA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
In-Reply-To: <CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com>
 (Miguel
	Ojeda's message of "Fri, 13 Dec 2024 13:54:14 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
	<pw5PzA4YGsu7j6ET_-OYE2oq9l7ixtTTGhHtxMxmMP5ggHxLrjzMkNMvcMVjGPhu7FpBb2duDD3bRbtMJZZHIw==@protonmail.internalid>
	<CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com>
Date: Fri, 13 Dec 2024 14:17:19 +0100
Message-ID: <87y10jd8o0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Dec 13, 2024 at 12:33=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> +#![feature(sync_unsafe_cell)]
>
> Please mention this in the commit message, the status of the feature
> and justify the addition.

I forgot, thanks for pointing that out. Following the discussion of v2
of this series I can understand that `mut static` is discouraged and
scheduled for removal. Interior mutability via `SyncUnsafeCell` provides
the same functionality and it is my understanding that this feature is
on track to be stabilized.

>
>> +//! C header: [`include/linux/moduleparam.h`](../../../include/linux/mo=
duleparam.h)
>
> Please use `srctree`.

Ok.

>
>> +/// Newtype to make `bindings::kernel_param` `Sync`.
>
> Please add intra-doc links where applicable, e.g. `Sync` here.

Will do.

>
>> +unsafe extern "C" fn set_param<T>(
>> +    val: *const core::ffi::c_char,
>> +    param: *const crate::bindings::kernel_param,
>> +) -> core::ffi::c_int
>> +where
>> +    T: ModuleParam,
>> +{
>> +    // NOTE: If we start supporting arguments without values, val _is_ =
allowed
>> +    // to be null here.
>> +    assert!(!val.is_null());
>
> Should this return an error instead?

Not sure. `val` being null not supposed to happen in the current
configuration. It should be an unreachable state. So BUG is the right thing?

>
>> +/// Write a string representation of the current parameter value to `bu=
f`.
>> +///
>> +/// # Safety
>> +///
>> +/// Must not be called.
>> +///
>> +/// # Note
>> +///
>> +/// This should not be called as we declare all parameters as read only.
>> +#[allow(clippy::extra_unused_type_parameters)]
>> +unsafe extern "C" fn get_param<T>(
>> +    _buf: *mut core::ffi::c_char,
>> +    _param: *const crate::bindings::kernel_param,
>> +) -> core::ffi::c_int
>> +where
>> +    T: ModuleParam,
>> +{
>> +    unreachable!("Parameters are not readable");
>> +}
>
> Do we need this? Can't the `ops` callback be `null`?

Not in the current configuration. The parameters can only be declared
"read only". It should be impossible for anyone to call this function.

>
>> +/// The `arg` field of `param` must be an initialized instance of `Self=
`.
>
> `Self`?

That whole line is wrong, thanks for spotting. It should read "`arg` must
be an initialized instance of `T`. This function takes ownership of
the `T` pointed to by `arg`.".

>
>> +/// Generate a static [`kernel_param_ops`](../../../include/linux/modul=
eparam.h) struct.
>
> `srctree`.

=F0=9F=91=8D

>
>> +/// Parse a token stream of the form `expected_name: "value",` and retu=
rn the
>> +/// string in the position of "value". Panics on parse error.
>
> `# Panics` section.

Ok.

>
>> +/// `type` may be one of
>> +///
>> +/// - `i8`
>> +/// - `u8`
>> +/// - `i8`
>> +/// - `u8`
>> +/// - `i16`
>> +/// - `u16`
>> +/// - `i32`
>> +/// - `u32`
>> +/// - `i64`
>> +/// - `u64`
>> +/// - `isize`
>> +/// - `usize`
>
> Can these be intra-doc links?

Yes!


Thanks for the comments!



Best regards,
Andreas Hindborg




