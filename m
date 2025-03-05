Return-Path: <linux-kbuild+bounces-5971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1B4A50249
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 15:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4CA93B45B5
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 14:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E7224DFFA;
	Wed,  5 Mar 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="X+nq+VyV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE0C242911;
	Wed,  5 Mar 2025 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185284; cv=none; b=cRCSBZ9KDA8lnTeFQalUdmuvmnL0aFpzqvG9mHkCNJ10bXrogzkxV3IeQyv2zt1ZJIImuQSu5hP3OnKYz8nnsyXKxsoxqIBoPyj95DtC0kjOQ7W4ukPiDVz0WJrR/58hn7ypDLHMJq5piB1CfMJOW+ClI4jJz2P27tTpcbmNvAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185284; c=relaxed/simple;
	bh=+3KZycyRQWg6AONdj6MUvhWQ0yttj5flpyUcA4hxWz8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dme+TpIWB3Vzx6n9Z+2DVuoqG74oQOoaVV1VS2wc3CwPhrU7tW//Z7RhnunWJWhEBkuWQ75sHBhpD5WLilobeBJ4nbCHO8ZWQne/nvVfK4Z2467jvWUv2NCWUPOnHv2voHP+JEJeQ9jMjR+32HgHTqCp8yTxyUtHXJbCmq8keGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=X+nq+VyV; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=cogdqg55erhcjfmdfg247whv2y.protonmail; t=1741185280; x=1741444480;
	bh=+3KZycyRQWg6AONdj6MUvhWQ0yttj5flpyUcA4hxWz8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=X+nq+VyVUTJl6QdqXVEonz5IDPa9VbvjAvmcPlCsjHps5CeP/6HaxVKnCJ7Y4SC9M
	 zLC/D5VHdBgK1qo/Ne32jj7FjEkYxYJ3cfxWfU3Jz7HwXPzBTG5oOP0x4TtSe4sFA2
	 vrwSUItLtT0Pxp6RSWiBB1hA8O8cwAYx/+jMVduu8Mv2T09ooDQm7Km3c4lGM5zhSb
	 Kai3cw9sdqjjbQcEbEL2sQPjCgd3GiT+k5+pRNL+fauHYqiDjuCeoIhOeIoiVFrxZj
	 /iMYgsKhbmY5ex+74sl2YhcrROOs60341LtJHZ2yLO9/UUV+8IkYhtpe5iZ01TXZ6J
	 AhusOW/Rp4qFw==
Date: Wed, 05 Mar 2025 14:34:35 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
Message-ID: <D88ENUE2B49N.FGSNLEB107E1@proton.me>
In-Reply-To: <878qpja7b5.fsf@kernel.org>
References: <20250304225245.2033120-1-benno.lossin@proton.me> <jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid> <20250304225245.2033120-15-benno.lossin@proton.me> <87h647d6xg.fsf@kernel.org> <cdfBMmuIl8Wl-KpI-koNDQJOCGBr9z9dOi5fxQvFbgNWQHHw6JtMizaMMbMniNlE841-9b7TdLuZ9Xh_hFsf7w==@protonmail.internalid> <D88BLHENDH8Y.HQUKEXN1XB7C@proton.me> <87ldtjbqw2.fsf@kernel.org> <okP1iZelIm5t6CfgoFyh0m8LiVEQW3ULUroZHdSQ97ul_BmPr47HBpB3RgHDMtm_2jzF4sTJszuUACsCGBEXcQ==@protonmail.internalid> <CANiq72k=KiYhKr9XHU38==Rx0df4rERyOL1abRG_cDo+4NNa0g@mail.gmail.com> <878qpja7b5.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: eb7d669969bb2d542e365fcae0c70997690124b9
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 5, 2025 at 3:19 PM CET, Andreas Hindborg wrote:
> "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:
>
>> On Wed, Mar 5, 2025 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>>
>>> I _really_ think that the ability to run the tests should be present in
>>> the kernel repository. But I also do not want to block this series on i=
t,
>>> if it is something that will be easier to achieve with the build system
>>> overhaul that is in the pipeline.
>>
>> No, that is not the plan. Even with the new build system, this is
>> supposed to be developed upstream as far as I understand, so you will
>> need to run them there anyway.
>>
>> Unless there is a reason we could catch more bugs here, that is.
>
> I guess it would be no different than `syn`. But I think it is a shame
> that we move something that people could contribute to via the kernel
> development flow - out of the kernel development flow.

You *can* send patches via the list, I will pick them up and run them
through the GitHub CI.

Patches that arrive via GitHub will also go through the list and people
can add their tags there.

Also I don't think that pin-init will receive a lot of contributions in
the first place. I do have a lot of changes planned for when we get
`syn`, but other than that, I don't think it will change a lot in the
future.

---
Cheers,
Benno


