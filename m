Return-Path: <linux-kbuild+bounces-7929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97BBAFC6B3
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 11:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078411BC3F8D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 09:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF542BEC57;
	Tue,  8 Jul 2025 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pbwyDWmg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD57F1D5150;
	Tue,  8 Jul 2025 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965628; cv=none; b=q8epYmUO641nprnnvkqX/XxttNF/iraJH0CkF7tYTT1YqGdRnRXHxG9BdHh4FtCxDxYxPmK1ZpQKpKA+0XkZQk9pOg2GW85NRb+EkzyAZunlOqD5jcDA+AuC3nT+V/H0RNQLA1W9zcAu/arIVzff6I0TdxoD0QYcYXUkzf9EyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965628; c=relaxed/simple;
	bh=al45WhcYx+cfhiLoHHzrSgYvrkI1MfO5KGvm49P1sUE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oT9JyYOgxB2h8VKbfbCCGtXU9XJXbdsuAHAQgMI8ZFlAe83zjMzjvH1wfUeRABcok0ccGjQwv1a+6PRc1tRT6XyNFN/QPczI/fQvj4+GsUpzLYOMBVFxVb+VVHhQMzx+2wHZRv1QZ2CXhZijB///TPFMNgtfay6hOmanKbKRKWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pbwyDWmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD44C4CEED;
	Tue,  8 Jul 2025 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751965628;
	bh=al45WhcYx+cfhiLoHHzrSgYvrkI1MfO5KGvm49P1sUE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pbwyDWmgKqTSNdqYbXxUOy9WkKykYt/5jWR1HUlyYlk0oJwyak86Ui/RB6B8WWrzl
	 qDSSy0XSL+t/91MzhAN9K/rfoSFs/urQh3Q5I43r7EwlNaQpvAunkODmnzcDw996I3
	 CbwCJzPMXEgmQMC0UaKcGZ+HCyjPU7qPLoSujaf9mJutIaLWF5lGNSOp4ubhonhZSY
	 k1frEetBV/HfVmhBtoEo13AENUWORSqUpl4V0PMHnOlvV1nWEMioqZ4aQpAcWgOHDz
	 bcagQ3QFJooQVFkI4ERB/MY91taVQvEzBmypNcGkren7jngOj09nDEAmbBynVerws2
	 Hxf5wpJ/HpBrQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Jul 2025 11:07:02 +0200
Message-Id: <DB6JZBUSWGKX.3M3M5TSWPLLFN@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>, "Trevor
 Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye" <ark.email@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, "Greg KH"
 <gregkh@linuxfoundation.org>, "Fiona Behrens" <me@kloenk.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
 <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
 <KNYMPkLfLvLb8ocrLqSmk-5hRGhRaaPQ2sDHN5JoPAUxYJWlHNiOW4HRmtDDGkoMRfNwpziT8mkRzlPkdxDVaQ==@protonmail.internalid> <aGvkFbs5caxLSQxa@Mac.home> <877c0joyfo.fsf@kernel.org>
In-Reply-To: <877c0joyfo.fsf@kernel.org>

On Tue Jul 8, 2025 at 10:54 AM CEST, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
>
>> On Mon, Jul 07, 2025 at 03:38:58PM +0200, Alice Ryhl wrote:
>>> On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>> >
>>> > Introduce the `SetOnce` type, a container that can only be written on=
ce.
>>> > The container uses an internal atomic to synchronize writes to the in=
ternal
>>> > value.
>>> >
>>> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>
>>> LGTM:
>>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>>>
>>> > +impl<T> Drop for SetOnce<T> {
>>> > +    fn drop(&mut self) {
>>> > +        if self.init.load(Acquire) =3D=3D 2 {
>>> > +            // SAFETY: By the type invariants of `Self`, `self.init =
=3D=3D 2` means that `self.value`
>>> > +            // contains a valid value. We have exclusive access, as =
we hold a `mut` reference to
>>> > +            // `self`.
>>> > +            unsafe { drop_in_place(self.value.get()) };
>>>
>>> This load does not need to be Acquire. It can be a Relaxed load or
>>> even an unsynchronized one since the access is exclusive.
>>
>> Right, I think we can do the similar as Revocable here:
>>
>>         if *self.init.get_mut() =3D=3D 2 { }
>>
>> Further, with my following Benno's suggestion and making `Atomic<T>` an
>> `UnsafeCell<T>:
>>
>> 	https://lore.kernel.org/rust-for-linux/aGhh-TvNOWhkt0JG@Mac.home/
>>
>> compiler can generate a noalias reference here, which allows further
>> optimization.
>>
>
> You would like to remove `PhantomPinned` to enable noalias? I guess that
> makes sense in this case. I'll fix that for next spin.

I think you two are talking about different things. Boqun is saying that
the `Atomic<T>` will use `UnsafeCell` rather than `Opaque`, which will
potentially allow more optimizations.

But you are talking about `SetOnce`, right? I think it makes more sense
for `SetOnce` to use `UnsafeCell<MaybeUninit<T>>` rather than `Opaque`
too. So feel free to change it in the next version.

---
Cheers,
Benno

