Return-Path: <linux-kbuild+bounces-7958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E7AFF0CC
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 20:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DCBD188F0DE
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 18:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4112239E7D;
	Wed,  9 Jul 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pfS/aFI9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FEE23770D;
	Wed,  9 Jul 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752085343; cv=none; b=c/Cmg77+rbBd7Hs78sC26ZSky3vop0KTXLxKc52wxw6ZRmK49t6zBHxPMP6SAT6ApxnAy69kL5lbxh3x/HsH2kmVGf+9im0/bfcAlUAM0U+btpiT0oizPm9FcPki9NuA+WPrHB7SWQ4Yx5nz4Hsto4xhP5QwDY9w2nOvoAH6qVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752085343; c=relaxed/simple;
	bh=5CLAa7B3mPRRniciO0gLisy8WVRITPjA7SLk6e8ROHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Jkq2xjiC/q7w8GogUe46XOFIuvIN47Q9Ijknsf5n7ljC5GfFlLRsUm1MK6c/WP2o18QRVrLNrpSsUR+m/UzEWXjG+B1Lt3QN4WiOq0Lq0JhTIaBjg1eIMfCzDnErhEaEk9e27ka/+fMizHTx6+txARA0eEerFioYs8Iku333xsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pfS/aFI9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892DDC4CEEF;
	Wed,  9 Jul 2025 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752085343;
	bh=5CLAa7B3mPRRniciO0gLisy8WVRITPjA7SLk6e8ROHk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=pfS/aFI9iB0IO4L8LVGX6W06JqphTp4Lxw79qYY49GgGIB38Oy0WZcMin9enqTSBT
	 emzKnZjXoCjbZAh7x3/2UmFbFZSdU7jTJLoHx8ydf0OwO/mA5MwQJKl5fXvi03ztA8
	 Pa4emYLgCs7oFecZgD0imV2R0eXbigzLpyBKfQQ/oaZReheIQDhbePnbaegs5ODSOV
	 7pZoKyglDVwZelrKKJTYz+bpzzoN2VGPaQAbneiM0SpXeMKOvI0DDG7u1Mm5ogFlj/
	 pO2BFBjGWWscoHwHn/v66QhcSMef/FPZjfShVzSnAdG80V0XPCz/bjYmpQz88w59ac
	 1dCRiuCXP0m3w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 20:22:16 +0200
Message-Id: <DB7QEZNTH2SB.SSRG5H7TXZZT@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Alice Ryhl"
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
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org>
 <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com>
 <KNYMPkLfLvLb8ocrLqSmk-5hRGhRaaPQ2sDHN5JoPAUxYJWlHNiOW4HRmtDDGkoMRfNwpziT8mkRzlPkdxDVaQ==@protonmail.internalid> <aGvkFbs5caxLSQxa@Mac.home> <877c0joyfo.fsf@kernel.org> <lsO9eeoR7qtPcjbhow9WfkrujYbxWh9JwZCHDO9K4VU6gtpl4pNYJisLImSI7OrRxW7qu-soEy9zjF_3snXZGQ==@protonmail.internalid> <DB6JZBUSWGKX.3M3M5TSWPLLFN@kernel.org> <87ple9lkjr.fsf@kernel.org>
In-Reply-To: <87ple9lkjr.fsf@kernel.org>

On Wed Jul 9, 2025 at 12:34 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Tue Jul 8, 2025 at 10:54 AM CEST, Andreas Hindborg wrote:
>>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>>> On Mon, Jul 07, 2025 at 03:38:58PM +0200, Alice Ryhl wrote:
>>>>> On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>>>>> >
>>>>> > Introduce the `SetOnce` type, a container that can only be written =
once.
>>>>> > The container uses an internal atomic to synchronize writes to the =
internal
>>>>> > value.
>>>>> >
>>>>> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>>>
>>>>> LGTM:
>>>>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>>>>>
>>>>> > +impl<T> Drop for SetOnce<T> {
>>>>> > +    fn drop(&mut self) {
>>>>> > +        if self.init.load(Acquire) =3D=3D 2 {
>>>>> > +            // SAFETY: By the type invariants of `Self`, `self.ini=
t =3D=3D 2` means that `self.value`
>>>>> > +            // contains a valid value. We have exclusive access, a=
s we hold a `mut` reference to
>>>>> > +            // `self`.
>>>>> > +            unsafe { drop_in_place(self.value.get()) };
>>>>>
>>>>> This load does not need to be Acquire. It can be a Relaxed load or
>>>>> even an unsynchronized one since the access is exclusive.
>>>>
>>>> Right, I think we can do the similar as Revocable here:
>>>>
>>>>         if *self.init.get_mut() =3D=3D 2 { }
>
> Ok, now I got it. You are saying I don't need to use the atomic load
> method, because I have mutable access. Sounds good.
>
> But I guess a relaxed load and access through a mutable reference should
> result in the same code generation on most (all?) platforms?

AFAIK it is not the same on arm.

---
Cheers,
Benno

