Return-Path: <linux-kbuild+bounces-7946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A27EAFE5D9
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 12:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C49E55416D6
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 10:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BBA2853E9;
	Wed,  9 Jul 2025 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilMihSIc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A77F2580F2;
	Wed,  9 Jul 2025 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752057283; cv=none; b=Jil/jENeoztEObk0Bd02gD0GL57oT8al6HuefZjHf/IGoM8Df4p0ZEwoR8OcR4n9lCSd0UVV6G/DsMlyYPpbK/8aor3SO5Blelt0MtMs3sE02GU/Zh2GaF5S4w9HFYuXKfzALCNPpXDX4AOxGvoFkcF1S5hizL5boaMq3aZ3snk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752057283; c=relaxed/simple;
	bh=kiasbQlkUMVYMuc++fP1ijtrR3D41MICitEQNficfYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hTFxiUElAel0oEcTD38JTD/u7Eg5sdqHKucRxScJW+bXpZ6gMhSuxBmiqERy1JnOuCSo676WqeeSEccu63BGk93iSnV4nk+HS+U4hEpAjJN2aPBUSbf8LdDpObakx1E94m/3DPUTIWbqGTJpODgNswvPnE408d+pULc4i+jv37k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilMihSIc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A326C4CEEF;
	Wed,  9 Jul 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752057283;
	bh=kiasbQlkUMVYMuc++fP1ijtrR3D41MICitEQNficfYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ilMihSIcYkU4Cv4P11ai3g+j5nc1UofGFcPqXvK8tI6zmAc0ckzIg9tvriwCf3IsP
	 WgjzC8z0RXXdqbpoMeso7jsg2Omr0RaxLUda+ZePVjDPsuGaL5CKOi20QRlnfDVhhj
	 8sqNwxavMBQJ8E0vvn64C1g4qUbI9AqGJCHoaCL8DfHzqcmZvAgBlbNhkYuvggyVG5
	 xaaZFAA4fbDvjKrb1KvXgzchqyMJHV3b/nXe4LScDzEI4mwLeAxcHNsZXTIJK9dv50
	 uYIUe5O9k7lanuZ+rnNaTvLhBKfJiMY7fR/LKYBj6ThjsH57w1hP4CByU29bc8XH+e
	 yVNdq9a5Wlkmg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>,  "Alice Ryhl"
 <aliceryhl@google.com>,  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
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
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
In-Reply-To: <DB6JZBUSWGKX.3M3M5TSWPLLFN@kernel.org> (Benno Lossin's message
	of "Tue, 08 Jul 2025 11:07:02 +0200")
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
	<20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
	<CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
	<KNYMPkLfLvLb8ocrLqSmk-5hRGhRaaPQ2sDHN5JoPAUxYJWlHNiOW4HRmtDDGkoMRfNwpziT8mkRzlPkdxDVaQ==@protonmail.internalid>
	<aGvkFbs5caxLSQxa@Mac.home> <877c0joyfo.fsf@kernel.org>
	<lsO9eeoR7qtPcjbhow9WfkrujYbxWh9JwZCHDO9K4VU6gtpl4pNYJisLImSI7OrRxW7qu-soEy9zjF_3snXZGQ==@protonmail.internalid>
	<DB6JZBUSWGKX.3M3M5TSWPLLFN@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 09 Jul 2025 12:34:32 +0200
Message-ID: <87ple9lkjr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue Jul 8, 2025 at 10:54 AM CEST, Andreas Hindborg wrote:
>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>
>>> On Mon, Jul 07, 2025 at 03:38:58PM +0200, Alice Ryhl wrote:
>>>> On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>>>> >
>>>> > Introduce the `SetOnce` type, a container that can only be written o=
nce.
>>>> > The container uses an internal atomic to synchronize writes to the i=
nternal
>>>> > value.
>>>> >
>>>> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>>
>>>> LGTM:
>>>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>>>>
>>>> > +impl<T> Drop for SetOnce<T> {
>>>> > +    fn drop(&mut self) {
>>>> > +        if self.init.load(Acquire) =3D=3D 2 {
>>>> > +            // SAFETY: By the type invariants of `Self`, `self.init=
 =3D=3D 2` means that `self.value`
>>>> > +            // contains a valid value. We have exclusive access, as=
 we hold a `mut` reference to
>>>> > +            // `self`.
>>>> > +            unsafe { drop_in_place(self.value.get()) };
>>>>
>>>> This load does not need to be Acquire. It can be a Relaxed load or
>>>> even an unsynchronized one since the access is exclusive.
>>>
>>> Right, I think we can do the similar as Revocable here:
>>>
>>>         if *self.init.get_mut() =3D=3D 2 { }

Ok, now I got it. You are saying I don't need to use the atomic load
method, because I have mutable access. Sounds good.

But I guess a relaxed load and access through a mutable reference should
result in the same code generation on most (all?) platforms?

>>>
>>> Further, with my following Benno's suggestion and making `Atomic<T>` an
>>> `UnsafeCell<T>:
>>>
>>> 	https://lore.kernel.org/rust-for-linux/aGhh-TvNOWhkt0JG@Mac.home/
>>>
>>> compiler can generate a noalias reference here, which allows further
>>> optimization.
>>>
>>
>> You would like to remove `PhantomPinned` to enable noalias? I guess that
>> makes sense in this case. I'll fix that for next spin.
>
> I think you two are talking about different things. Boqun is saying that
> the `Atomic<T>` will use `UnsafeCell` rather than `Opaque`, which will
> potentially allow more optimizations.
>
> But you are talking about `SetOnce`, right? I think it makes more sense
> for `SetOnce` to use `UnsafeCell<MaybeUninit<T>>` rather than `Opaque`
> too. So feel free to change it in the next version.

Exactly. We don't need `UnsafePinned` mechanics here.


Best regards,
Andreas Hindborg




