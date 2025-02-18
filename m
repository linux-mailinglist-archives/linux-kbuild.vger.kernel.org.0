Return-Path: <linux-kbuild+bounces-5823-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14937A39D39
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED95B1647EB
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBFE265CCE;
	Tue, 18 Feb 2025 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRzzl3kE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7332417CF;
	Tue, 18 Feb 2025 13:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739884415; cv=none; b=sgMaXR/JlonueHcALOmoJ2m4jly37R3cECQsbYVPygzpparuqYm5gxnirEcJ1vmG7cz6woMBXIiK7Soh9q9kz0dtFZjJ8BP1A3tZYEVrjFOSQOXHeblqariW5Se95suDB7VuZUl+SiVWMY56up8ZFtRvQuxb3ay3lO0ToxLADxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739884415; c=relaxed/simple;
	bh=kZU7I8U85ZLncBIzpH4PI2BU0NUjvVlzYjJ2wuJBoN0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cjyD75xhGBT5EbckZkQ2qtMgKUFzRrIi9CoHFBQblpRdgwYmzo8ga/nopA2buPeVjOI0/x/CGahp+p0Rj/3x+hoGUA779poZiA/KjkdRf3vgnSlqU0RH6w0NFNHi6H8yIevZbQd4P9JxTlETJTSxgjh+qbzjsPtlKAvpefIcrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRzzl3kE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB986C4CEE2;
	Tue, 18 Feb 2025 13:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739884415;
	bh=kZU7I8U85ZLncBIzpH4PI2BU0NUjvVlzYjJ2wuJBoN0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tRzzl3kEGSEFrgmlXfoGTQGQQuo3S03l9zYb8BQPMBS/f2tIZPG/iSkYlaEUmWRsr
	 xIi5fMJKiMS2bOyZIpHU0HNqfBtPsrYf2FbvB0rn3FmDDHvbKo+TFizKvGrTcdGGbi
	 WfqLaTbgYXC5HMRJgybknEXr4ZpZzi2LgNKTXyp2OTkauNpLzbDl/2rnmL9S630WpT
	 mbnRq8mFNpIWL/JoodqE/mZtnDroJ11S3RkAQdCuHCnHPJNtha6hZ0Xy+kSCw8Zdrk
	 kFRhZZM1Wr51LT7DW0bYaNk3NH2ULe4smAm3Y+b2cnGhf22MPFtiImvR6476eGiXVq
	 VRJOJSTSRChHw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <benno.lossin@proton.me>
Cc: "Gary Guo" <gary@garyguo.net>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v6 2/6] rust: str: implement `Index` for `BStr`
In-Reply-To: <86474714-24a5-49ff-9767-23e25afee7d3@proton.me> (Benno Lossin's
	message of "Tue, 18 Feb 2025 12:43:21 +0000")
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org>
	<kW0CDyK5M8DuLPr_1HwIXcnVP4x8evlFoq0BOjldchTZqkGiqzNJ-dtpV7s5QHLbbmm6cW529GeDTo_GoDKfdQ==@protonmail.internalid>
	<20250211164004.6de768c3@eugeo> <87lduc44c3.fsf@kernel.org>
	<2m_bB1GvgxV0DoM1PIggnkJD83g9AA6EeW5bgH1JmfZBG1P8D_DE966KAg53gCK8KmWgjpdCUPU6T-5xuZ-FYg==@protonmail.internalid>
	<20250212090914.6ef7e83b@eugeo> <87wmdnfqt0.fsf@kernel.org>
	<9Ic8rQpAo1asmHGXvfccr37wO_2uU-jYoe8KdY-vUBgTADZOmfz_A7gOt58K42A12FfWzXdMVXK527DZ1kaBkg==@protonmail.internalid>
	<86474714-24a5-49ff-9767-23e25afee7d3@proton.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Feb 2025 14:13:21 +0100
Message-ID: <87a5ajflam.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <benno.lossin@proton.me> writes:

> On 18.02.25 12:14, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Tue, 11 Feb 2025 21:24:44 +0100
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>> "Gary Guo" <gary@garyguo.net> writes:
>>>>
>>>>> On Tue, 11 Feb 2025 16:57:36 +0100
>>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>>
>>>>>> The `Index` implementation on `BStr` was lost when we switched `BStr` from
>>>>>> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
>>>>>> implementing `Index` for `BStr` when `Index` would be implemented for
>>>>>> `[u8]`.
>>>>>>
>>>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>>>> ---
>>>>>>  rust/kernel/str.rs | 11 +++++++++++
>>>>>>  1 file changed, 11 insertions(+)
>>>>>>
>>>>>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>>>>>> index 002dcddf7c768..1eb945bed77d6 100644
>>>>>> --- a/rust/kernel/str.rs
>>>>>> +++ b/rust/kernel/str.rs
>>>>>> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
>>>>>>      }
>>>>>>  }
>>>>>>
>>>>>> +impl<Idx> Index<Idx> for BStr
>>>>>> +where
>>>>>> +    Idx: core::slice::SliceIndex<[u8], Output = [u8]>,
>>>>>
>>>>> I think I'd prefer
>>>>>
>>>>> 	[T]: Index<Idx>,
>>>>
>>>> Is that equivalent?
>>>
>>> Sorry, I meant `[u8]: Index<Idx>`. This makes more semantic sense that
>>> "what ever can index a byte slice, it can also index BStr". This is
>>> also how our CStr and the array primitive type implements its Index
>>> operation.
>>>
>>> They should be equivalent as libcore does
>>>
>>> 	impl<T, I> Index<I> for [T] where I: SliceIndex<[T]> { ... }
>>>
>>
>> What I originally wrote is `Idx` must be usable as an index for `[u8]`,
>> yielding `[u8]` when indexing.
>>
>> The new one you suggest, I parse as `[u8]` should be indexable by `Idx`.
>> This is less info. The compiler will also complain about the missing info:
>>
>> error[E0308]: mismatched types
>>    --> /home/aeh/src/linux-rust/module-params/rust/kernel/str.rs:141:26
>>     |
>> 141 |         BStr::from_bytes(&self.0[index])
>>     |         ---------------- ^^^^^^^^^^^^^^ expected `&[u8]`, found `&<[u8] as Index<Idx>>::Output`
>>     |         |
>>     |         arguments to this function are incorrect
>>     |
>>     = note: expected reference `&[u8]`
>>                found reference `&<[u8] as Index<Idx>>::Output`
>>     = help: consider constraining the associated type `<[u8] as Index<Idx>>::Output` to `[u8]`
>>
>> If I constrain the output it's all fine again:
>>
>>     [u8]: Index<Idx, Output = [u8]>,
>>
>>
>> But as I said, I don't think it matters which direction we put this?
>
> I think it's better to depend on `Index` compared to `SliceIndex`.

I am curious for what reason?


Best regards,
Andreas Hindborg




