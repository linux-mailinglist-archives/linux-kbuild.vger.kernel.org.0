Return-Path: <linux-kbuild+bounces-5814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B946A39A40
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 12:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20E1F7A452E
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 11:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA6D23C392;
	Tue, 18 Feb 2025 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grWEqFl9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7925F1AF0B7;
	Tue, 18 Feb 2025 11:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739877275; cv=none; b=UO1EKNTW90FMtWN5TfTKSi4kvC9PJKJo2u/OG94GrtPy4rsWmaB9zgWW++RG3rHlIqlm+Buj0AHRZkeHbg+BKl/4lHhJQ3Jgj+qhA1d0SUXNICj+Ml/PvFYbWjy9RA9Nd6ha7UDvyE2NKkcOAClbxeHuGfR5ivcmiJXTwUkVIb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739877275; c=relaxed/simple;
	bh=IJ6yk/QMp2lwd5JD3ubjRFeF4Y21dutz524dIqj2VQE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=emUWag3dAxMUdvD/Ds02h9Hvw8f9xMEksqgTHNpqRYd1y6XmTNUzP3W9b3cPJKT3qd9DGAKnFVn//sofpzqcBGdfBWi8xSz7zGZpgnGkuPu76ZCvPgXQTSXQFP/KlaP4DlfLHUkTdVbHvnrzJLzqSkdfg+JWEsBzsmwCVwR+f9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grWEqFl9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD101C4CEE6;
	Tue, 18 Feb 2025 11:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739877274;
	bh=IJ6yk/QMp2lwd5JD3ubjRFeF4Y21dutz524dIqj2VQE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=grWEqFl98XyZ8ZR+hqyfQRWZ646Tq/KbuB+Hmhi+CTz0FUCKnOrfNogIFyP5F1d0n
	 TroMNyM3n8C3sIrSI3prYmbaNb4tVH0ygXh8S0b0JD2p/KxP7xcfMde7DoJ8pHBRCi
	 duC4B+ovd5dGF1KWfwL8if/sgaujwTqf6kH+b4igLWMpfjiJp3EG0BnC8glDN/v0eV
	 4B5W71T9y17M97hUFe10mSl2THUrtaMenIENiQ0vUvynEzE8lqh1lletL5EiXJR0mz
	 tnPl6aa2H7mZFYDJa33rTQkKze0etK+i632YUwT9w3bipjV0wUtobf6zLgNADhdz4C
	 Kzi/NwYaT0rIw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Masahiro
 Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v6 2/6] rust: str: implement `Index` for `BStr`
In-Reply-To: <20250212090914.6ef7e83b@eugeo> (Gary Guo's message of "Wed, 12
	Feb 2025 09:09:14 +0000")
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org>
	<kW0CDyK5M8DuLPr_1HwIXcnVP4x8evlFoq0BOjldchTZqkGiqzNJ-dtpV7s5QHLbbmm6cW529GeDTo_GoDKfdQ==@protonmail.internalid>
	<20250211164004.6de768c3@eugeo> <87lduc44c3.fsf@kernel.org>
	<2m_bB1GvgxV0DoM1PIggnkJD83g9AA6EeW5bgH1JmfZBG1P8D_DE966KAg53gCK8KmWgjpdCUPU6T-5xuZ-FYg==@protonmail.internalid>
	<20250212090914.6ef7e83b@eugeo>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Feb 2025 12:14:19 +0100
Message-ID: <87wmdnfqt0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue, 11 Feb 2025 21:24:44 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>> > On Tue, 11 Feb 2025 16:57:36 +0100
>> > Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> >
>> >> The `Index` implementation on `BStr` was lost when we switched `BStr` from
>> >> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
>> >> implementing `Index` for `BStr` when `Index` would be implemented for
>> >> `[u8]`.
>> >>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> ---
>> >>  rust/kernel/str.rs | 11 +++++++++++
>> >>  1 file changed, 11 insertions(+)
>> >>
>> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> >> index 002dcddf7c768..1eb945bed77d6 100644
>> >> --- a/rust/kernel/str.rs
>> >> +++ b/rust/kernel/str.rs
>> >> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
>> >>      }
>> >>  }
>> >>
>> >> +impl<Idx> Index<Idx> for BStr
>> >> +where
>> >> +    Idx: core::slice::SliceIndex<[u8], Output = [u8]>,
>> >
>> > I think I'd prefer
>> >
>> > 	[T]: Index<Idx>,
>>
>> Is that equivalent?
>
> Sorry, I meant `[u8]: Index<Idx>`. This makes more semantic sense that
> "what ever can index a byte slice, it can also index BStr". This is
> also how our CStr and the array primitive type implements its Index
> operation.
>
> They should be equivalent as libcore does
>
> 	impl<T, I> Index<I> for [T] where I: SliceIndex<[T]> { ... }
>

What I originally wrote is `Idx` must be usable as an index for `[u8]`,
yielding `[u8]` when indexing.

The new one you suggest, I parse as `[u8]` should be indexable by `Idx`.
This is less info. The compiler will also complain about the missing info:

error[E0308]: mismatched types
   --> /home/aeh/src/linux-rust/module-params/rust/kernel/str.rs:141:26
    |
141 |         BStr::from_bytes(&self.0[index])
    |         ---------------- ^^^^^^^^^^^^^^ expected `&[u8]`, found `&<[u8] as Index<Idx>>::Output`
    |         |
    |         arguments to this function are incorrect
    |
    = note: expected reference `&[u8]`
               found reference `&<[u8] as Index<Idx>>::Output`
    = help: consider constraining the associated type `<[u8] as Index<Idx>>::Output` to `[u8]`

If I constrain the output it's all fine again:

    [u8]: Index<Idx, Output = [u8]>,


But as I said, I don't think it matters which direction we put this?


Best regards,
Andreas Hindborg



