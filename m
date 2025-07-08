Return-Path: <linux-kbuild+bounces-7925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA2CAFC63B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 10:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40E057A4E24
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 08:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2844D2BE04B;
	Tue,  8 Jul 2025 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4foV4xP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC6221F26;
	Tue,  8 Jul 2025 08:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751964858; cv=none; b=fIBRGYMhyLpsYefJwHFxo4vqviWLZe/1f6UbLlmoNXBdOnEtpuWFbbkm8lddcrtjBs9+euq/CzYFRyADZNd0zsTrPYWze6kkgxUXF1/+dAr0TExddr1WkNVi5gothWY83D1i4moWpfKjrH3XL7Ld4KvKiR4w99nNox1lLxKx1GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751964858; c=relaxed/simple;
	bh=jUr1j2MoFMdCmHk62lJDW07c4GkMj87N3P6JUtOTzH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cROZ/ozQk18slbALx6JVbkWTmA6C0dMbTKqp2i02/O6wKGK9NpoI3hIw97aBVmgkOgymEwWstJNmA24ESCIPaUWRfMwHraG2aRAaoxe9JYpnes/x7oPfEDNR6wPRZRaUY4K6GDkeTq+Ao+pAbHWSGGENjGWv+QM850PQiRKyDe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4foV4xP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF52C4CEED;
	Tue,  8 Jul 2025 08:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751964856;
	bh=jUr1j2MoFMdCmHk62lJDW07c4GkMj87N3P6JUtOTzH0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a4foV4xPmD+5SN0dQSDTiYVwxxGLk+opkfK2zJnJYYMRwvTGOFwaxjeIMLFVpMgLt
	 wnpkiD6GzrkPFdXap/DgJmbcb5/RBuJOgfv0ieEoZdbUO0CR/pv61W9V+DCQvXn28G
	 C4vhGyNcSWh/mEoetMAYI7b31Jby7upl94JWikt2mDf4blJC+eWOHWUafMsj3157Os
	 0MSvU2Ft5y93FIJEeO5B6lteajzuO/WOceGkKaE10qG+YV3bthZX7BOUd+XFOgl0rS
	 eeF3cKh6ZsnzvheMUSXYAfgbXabODnNF4KUjARlt1Ng63YI2FcGlaaYZLUWjzSFI4h
	 nMLB3XYJ9FcEg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,  "Masahiro
 Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Benno Lossin" <lossin@kernel.org>,  "Nicolas Schier"
 <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
In-Reply-To: <aGvkFbs5caxLSQxa@Mac.home> (Boqun Feng's message of "Mon, 07 Jul
	2025 08:13:25 -0700")
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
	<20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
	<CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
	<KNYMPkLfLvLb8ocrLqSmk-5hRGhRaaPQ2sDHN5JoPAUxYJWlHNiOW4HRmtDDGkoMRfNwpziT8mkRzlPkdxDVaQ==@protonmail.internalid>
	<aGvkFbs5caxLSQxa@Mac.home>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 08 Jul 2025 10:54:03 +0200
Message-ID: <877c0joyfo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Boqun Feng" <boqun.feng@gmail.com> writes:

> On Mon, Jul 07, 2025 at 03:38:58PM +0200, Alice Ryhl wrote:
>> On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>> >
>> > Introduce the `SetOnce` type, a container that can only be written onc=
e.
>> > The container uses an internal atomic to synchronize writes to the int=
ernal
>> > value.
>> >
>> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> LGTM:
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>>
>> > +impl<T> Drop for SetOnce<T> {
>> > +    fn drop(&mut self) {
>> > +        if self.init.load(Acquire) =3D=3D 2 {
>> > +            // SAFETY: By the type invariants of `Self`, `self.init =
=3D=3D 2` means that `self.value`
>> > +            // contains a valid value. We have exclusive access, as w=
e hold a `mut` reference to
>> > +            // `self`.
>> > +            unsafe { drop_in_place(self.value.get()) };
>>
>> This load does not need to be Acquire. It can be a Relaxed load or
>> even an unsynchronized one since the access is exclusive.
>
> Right, I think we can do the similar as Revocable here:
>
>         if *self.init.get_mut() =3D=3D 2 { }
>
> Further, with my following Benno's suggestion and making `Atomic<T>` an
> `UnsafeCell<T>:
>
> 	https://lore.kernel.org/rust-for-linux/aGhh-TvNOWhkt0JG@Mac.home/
>
> compiler can generate a noalias reference here, which allows further
> optimization.
>

You would like to remove `PhantomPinned` to enable noalias? I guess that
makes sense in this case. I'll fix that for next spin.


Best regards,
Andreas Hindborg



