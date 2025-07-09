Return-Path: <linux-kbuild+bounces-7961-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933ECAFF2E3
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 22:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE3F3B9CFF
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 20:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6872C242D73;
	Wed,  9 Jul 2025 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOXlium6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E31E5B6A;
	Wed,  9 Jul 2025 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092530; cv=none; b=p5W2FTIT6VQBxfMN3o1Z+JPd3Xk0F7qLDnlgCVvBV/l3ZYc82Jzx9lczlnEDBltLzVw5QClK5VohRoillOMPbn+ArGjxLkJkzCrYOYw8OEWrg1J7TxM5xRER3+9YlnB55+E+6mOpHfve/PqdmR+butvmP0YlkjYN+ttVcoOJlPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092530; c=relaxed/simple;
	bh=r4ykqC1BMysn26mbzqOJLBLUnrVxJa0A43xHGpGB23s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=k/r/oAXIdLc9z358zA1bznpImpYB525kU4DNaBdIJkL/KMuo2qnNWRicM0enwxSUH0QDCCzLY3kwt9BrYdCxdc7sMuRNkFAUTEYlsCBoJomkn9nVjJP7v3jul0kEw3cwqUEbpy1rd8moccTZ5Q///WvQgi32+rdHY63EfCcsJKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOXlium6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3226C4CEEF;
	Wed,  9 Jul 2025 20:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752092530;
	bh=r4ykqC1BMysn26mbzqOJLBLUnrVxJa0A43xHGpGB23s=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=nOXlium6yxzsnqoZeyAjnDBVr/+4EAnUE+lmZvPg5Z+OM32PXPh/cRQ+GaGFder7y
	 y8n9ZPKr0LOMuYcKxURkwr57y50XEx6hDVrmZ96SyOxk44EBOcJt82SYetvZDSCFmD
	 7WiYT/+YnKR2UQ7a6GOD9WBibY3MoKQnHmPOnqG13O2NX/7lxZ2ocRLBqyLez2iFUd
	 3rBDMJ3Ws0xLrcckEEwddXVJpz/zYcNINhNAAaXPGWhYjGxJRIy0oa85+FkGWB5WIk
	 lKEeh13grD6hLkoemvRumEeWOMS0fc+q9BxUNcDFXMyhSIGtp5ii9DO7ciJVVvwwjz
	 YEv3+Ne4s9Cdw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 22:22:04 +0200
Message-Id: <DB7SYPUAUBUS.30DITWX21NJ96@kernel.org>
To: "Boqun Feng" <boqun.feng@gmail.com>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
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
X-Mailer: aerc 0.20.1
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
 <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
 <KNYMPkLfLvLb8ocrLqSmk-5hRGhRaaPQ2sDHN5JoPAUxYJWlHNiOW4HRmtDDGkoMRfNwpziT8mkRzlPkdxDVaQ==@protonmail.internalid> <aGvkFbs5caxLSQxa@Mac.home> <877c0joyfo.fsf@kernel.org> <lsO9eeoR7qtPcjbhow9WfkrujYbxWh9JwZCHDO9K4VU6gtpl4pNYJisLImSI7OrRxW7qu-soEy9zjF_3snXZGQ==@protonmail.internalid> <DB6JZBUSWGKX.3M3M5TSWPLLFN@kernel.org> <87ple9lkjr.fsf@kernel.org> <DB7QEZNTH2SB.SSRG5H7TXZZT@kernel.org> <aG7NFizFGeFBSXY-@tardis.local>
In-Reply-To: <aG7NFizFGeFBSXY-@tardis.local>

On Wed Jul 9, 2025 at 10:12 PM CEST, Boqun Feng wrote:
> On Wed, Jul 09, 2025 at 08:22:16PM +0200, Benno Lossin wrote:
>> On Wed Jul 9, 2025 at 12:34 PM CEST, Andreas Hindborg wrote:
>> > "Benno Lossin" <lossin@kernel.org> writes:
>> >> On Tue Jul 8, 2025 at 10:54 AM CEST, Andreas Hindborg wrote:
>> >>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>> >>>> On Mon, Jul 07, 2025 at 03:38:58PM +0200, Alice Ryhl wrote:
>> >>>>> On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindbor=
g@kernel.org> wrote:
>> >>>>> >
>> >>>>> > Introduce the `SetOnce` type, a container that can only be writt=
en once.
>> >>>>> > The container uses an internal atomic to synchronize writes to t=
he internal
>> >>>>> > value.
>> >>>>> >
>> >>>>> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >>>>>
>> >>>>> LGTM:
>> >>>>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> >>>>>
>> >>>>> > +impl<T> Drop for SetOnce<T> {
>> >>>>> > +    fn drop(&mut self) {
>> >>>>> > +        if self.init.load(Acquire) =3D=3D 2 {
>> >>>>> > +            // SAFETY: By the type invariants of `Self`, `self.=
init =3D=3D 2` means that `self.value`
>> >>>>> > +            // contains a valid value. We have exclusive access=
, as we hold a `mut` reference to
>> >>>>> > +            // `self`.
>> >>>>> > +            unsafe { drop_in_place(self.value.get()) };
>> >>>>>
>> >>>>> This load does not need to be Acquire. It can be a Relaxed load or
>> >>>>> even an unsynchronized one since the access is exclusive.
>> >>>>
>> >>>> Right, I think we can do the similar as Revocable here:
>> >>>>
>> >>>>         if *self.init.get_mut() =3D=3D 2 { }
>> >
>> > Ok, now I got it. You are saying I don't need to use the atomic load
>> > method, because I have mutable access. Sounds good.
>> >
>> > But I guess a relaxed load and access through a mutable reference shou=
ld
>> > result in the same code generation on most (all?) platforms?
>>=20
>> AFAIK it is not the same on arm.
>>=20
>
> Right, when LTO=3Dy, arm64 use acquire load to implement
> READ_ONCE()/atomic_read().

But Andreas was talking about relaxed load vs mutable reference (=3D
normal unsynchronized write)?

---
Cheers,
Benno

