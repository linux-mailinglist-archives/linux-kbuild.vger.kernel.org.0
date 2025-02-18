Return-Path: <linux-kbuild+bounces-5815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F11DA39C62
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 796283A2D43
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 12:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E3CC248178;
	Tue, 18 Feb 2025 12:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZNx5BYbL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E57F2475F2;
	Tue, 18 Feb 2025 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739882617; cv=none; b=Tq2nCe8wY0Zwh0ObyGFGYXxV5+Y7EMyTMwwP+73py7hZW1u5BOgsJS9V8BFxQOSTb9Gh3ytRaPqB4m5CHbFAwYYGncdhpnzerDmRXdNMMW3YrvH059Oo/dxtIGgaXS12J5Fz1Wily9+N6gI2VLQMjnVijfU91zmbgZUa45Jj4OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739882617; c=relaxed/simple;
	bh=PPfx+qN+r3fsPzBvaolV7hOKBn7l6DYQD6YgdMuZ/SI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=as0wjBgkdgwtiyq7Z+pE+F/+nbmp4MIKCWFZsx68XrS8cFp8kkkcs38afGqxKPgLeVyRBgqBYv1B1/hmm9/6XJmO/NAZACR7/j5VlIQMSqy0tO2FHj85c5mDoOUL7Bj5LaG11Jkt9WznCNI60TMdK9lZwNotOi3mglzAofilXss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZNx5BYbL; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=q3sgjaww3zf6jjt5pzlzd6ux3u.protonmail; t=1739882607; x=1740141807;
	bh=8nsvnyARfLGt6tPfX961veuIV9VExo8yct+FDPP2mDI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZNx5BYbL9RA91zzUIBpyXgcwhSHUGEJJ62FPKJ/ni2mbVu4fDzxJ+3N608wx+Z4VV
	 wyhDLZXIS5LPCGmcQDzVA3kHiRJBukQ5IZFZUjQEttI9uXG69wnHBAVW+5yiAFoXU/
	 j7Hsm3yjfJpTSA2bECMDKUMWh1IAD1Hg364bn2XnQ+1+t01Bw99HBnRirfBVh+0KHE
	 921f5TtLBtG6vv5RRw+jhBuqsnOoG/r4C7j8hSlIOe9I2oSPBb+esjkXgPubAPeCtk
	 W7uLhY/SrY5HMUq+K4zK/fXV2D6DtT7KGDY59IXXohyoBmZwBiYrzw6Ap7YT8FvxGg
	 7vk6JAU8w7NYA==
Date: Tue, 18 Feb 2025 12:43:21 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>, Gary Guo <gary@garyguo.net>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v6 2/6] rust: str: implement `Index` for `BStr`
Message-ID: <86474714-24a5-49ff-9767-23e25afee7d3@proton.me>
In-Reply-To: <87wmdnfqt0.fsf@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org> <20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org> <kW0CDyK5M8DuLPr_1HwIXcnVP4x8evlFoq0BOjldchTZqkGiqzNJ-dtpV7s5QHLbbmm6cW529GeDTo_GoDKfdQ==@protonmail.internalid> <20250211164004.6de768c3@eugeo> <87lduc44c3.fsf@kernel.org> <2m_bB1GvgxV0DoM1PIggnkJD83g9AA6EeW5bgH1JmfZBG1P8D_DE966KAg53gCK8KmWgjpdCUPU6T-5xuZ-FYg==@protonmail.internalid> <20250212090914.6ef7e83b@eugeo> <87wmdnfqt0.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7deb9b54b3c5e867e75199ddc60dac1ad16802d2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.02.25 12:14, Andreas Hindborg wrote:
> "Gary Guo" <gary@garyguo.net> writes:
>=20
>> On Tue, 11 Feb 2025 21:24:44 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "Gary Guo" <gary@garyguo.net> writes:
>>>
>>>> On Tue, 11 Feb 2025 16:57:36 +0100
>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>
>>>>> The `Index` implementation on `BStr` was lost when we switched `BStr`=
 from
>>>>> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
>>>>> implementing `Index` for `BStr` when `Index` would be implemented for
>>>>> `[u8]`.
>>>>>
>>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>>> ---
>>>>>  rust/kernel/str.rs | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>>>>> index 002dcddf7c768..1eb945bed77d6 100644
>>>>> --- a/rust/kernel/str.rs
>>>>> +++ b/rust/kernel/str.rs
>>>>> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
>>>>>      }
>>>>>  }
>>>>>
>>>>> +impl<Idx> Index<Idx> for BStr
>>>>> +where
>>>>> +    Idx: core::slice::SliceIndex<[u8], Output =3D [u8]>,
>>>>
>>>> I think I'd prefer
>>>>
>>>> =09[T]: Index<Idx>,
>>>
>>> Is that equivalent?
>>
>> Sorry, I meant `[u8]: Index<Idx>`. This makes more semantic sense that
>> "what ever can index a byte slice, it can also index BStr". This is
>> also how our CStr and the array primitive type implements its Index
>> operation.
>>
>> They should be equivalent as libcore does
>>
>> =09impl<T, I> Index<I> for [T] where I: SliceIndex<[T]> { ... }
>>
>=20
> What I originally wrote is `Idx` must be usable as an index for `[u8]`,
> yielding `[u8]` when indexing.
>=20
> The new one you suggest, I parse as `[u8]` should be indexable by `Idx`.
> This is less info. The compiler will also complain about the missing info=
:
>=20
> error[E0308]: mismatched types
>    --> /home/aeh/src/linux-rust/module-params/rust/kernel/str.rs:141:26
>     |
> 141 |         BStr::from_bytes(&self.0[index])
>     |         ---------------- ^^^^^^^^^^^^^^ expected `&[u8]`, found `&<=
[u8] as Index<Idx>>::Output`
>     |         |
>     |         arguments to this function are incorrect
>     |
>     =3D note: expected reference `&[u8]`
>                found reference `&<[u8] as Index<Idx>>::Output`
>     =3D help: consider constraining the associated type `<[u8] as Index<I=
dx>>::Output` to `[u8]`
>=20
> If I constrain the output it's all fine again:
>=20
>     [u8]: Index<Idx, Output =3D [u8]>,
>=20
>=20
> But as I said, I don't think it matters which direction we put this?

I think it's better to depend on `Index` compared to `SliceIndex`.

---
Cheers,
Benno


