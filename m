Return-Path: <linux-kbuild+bounces-3147-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42295AD18
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 07:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76DB828268F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 05:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526CF69DFF;
	Thu, 22 Aug 2024 05:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="iaJQv0Kq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887614F98;
	Thu, 22 Aug 2024 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724306150; cv=none; b=QHXuysyasXvIY0nX7PWa8e6wiM6OORsCeBcpMd4mGOg6YqU9wdWj9W2GWhw1MwjUnSfrtnU+QACkhX3qbqtb5S3jZii4pq3Xrk/DiPu8g2rCWSE97UnL7T3NQjjUIZQYweCJrvqqfC8qibcBdkn1m4olRKYOaaKVBfO60NwRcRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724306150; c=relaxed/simple;
	bh=m/sO5FPgcCf9G3nqnkG+KKrMuIS3HQHWKVpYTi+rluM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZbVgoFdX4WlOavrcWLw+vMhYbV2SxxvUk1aWS68bN8jlTO8ZY7eijthmq9i7YKwQVpM+QPPYYC8ab3CxN1uvypzGRqhqzrgFOw8+m4QDL2GUWoXVuROfout36mVEEvaXnmQBI6jmIJkp9iQHGYDvM9BEkj7ZXV23m6VkSYwj0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=iaJQv0Kq; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=2ii4ater2fgzrn6kgtbqfxyb3u.protonmail; t=1724306138; x=1724565338;
	bh=sJAoDFrW8OINZyvtQYnpCwQ6z339HrEgCnaAsc27+J4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iaJQv0KqfPxemqkFKJRbQFh6nmZ2gvxxaQd6xFGcNwZY8DTmcU8ETuWUYx6Asrz7m
	 4e5hxSjmTTtW4QriHhS/GwU9j5Kib5xw5WIox9NLeXK7wvdNn3HKDNABTnZmmClnlk
	 b+xfEBCNZMaqmV2/cOJUdcBly4vZg8T2q5JkWOw2EOmjD2WpN/sIJSMhSNak/NznCW
	 iCzpDzyx3rOkTWNzqCccT7xcqEa4br4LcEzd7ibYZ8aSJpxMMsmoGhX0aj0blq8QZE
	 hLtFsS5Pn6hLf3DHDBnhzYxyna0WGAYHjxYd6FHYS7A+a4jsr4ZpzixF7X9NymydUJ
	 mn4eQ3ckovJeA==
Date: Thu, 22 Aug 2024 05:55:32 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me>
In-Reply-To: <2024082229-elevation-emporium-8118@gregkh>
References: <20240815173903.4172139-37-samitolvanen@google.com> <2024081705-overarch-deceptive-6689@gregkh> <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me> <20240819193851.GA4809@google.com> <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me> <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com> <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com> <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me> <2024082229-elevation-emporium-8118@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: ecef86a32da28f909a9c19f91fbf2ed95b01f8b1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22.08.24 01:29, Greg Kroah-Hartman wrote:
> On Wed, Aug 21, 2024 at 11:31:25AM +0000, Benno Lossin wrote:
>> On 20.08.24 22:03, Matthew Maurer wrote:
>>>>> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
>>>>> ironic, considering what I said in my other replies, but in this case=
,
>>>>> we would provide a safe abstraction over this `union`, thus avoiding
>>>>> exposing users of this type to `unsafe`):
>>>>>
>>>>>     #[repr(C)]
>>>>>     pub union KAbiReserved<T, R> {
>>>>>         value: T,
>>>>>         _reserved: R,
>>>>>     }
>>>>
>>>> I like this approach even better, assuming any remaining issues with
>>>> ownership etc. can be sorted out. This would also look identical to
>>>> the C version in DWARF if you rename _reserved in the union to
>>>> __kabi_reserved. Of course, we can always change gendwarfksyms to
>>>> support a different scheme for Rust code if a better solution comes
>>>> along later.
>>
>> Yeah sure, that should also then work directly with this patch, right?
>>
>>>> Sami
>>>
>>> Agreement here - this seems like a good approach to representing
>>> reserved in Rust code. A few minor adjustments we discussed off-list
>>> which aren't required for gendwarfksyms to know about:
>>> 1. Types being added to reserved fields have to be `Copy`, e.g. they
>>> must be `!Drop`.
>>> 2. Types being added to reserved fields must be legal to be
>>> represented by all zeroes.
>>> 3. Reserved fields need to be initialized to zero before having their
>>> union set to the provided value when constructing them.
>>> 4. It may be helpful to have delegating trait implementations to avoid
>>> the couple places where autoderef won't handle the conversion.
>>>
>>> While I think this is the right solution, esp. since it can share a
>>> representation with C, I wanted to call out one minor shortfall - a
>>> reserved field can only be replaced by one type. We could still
>>> indicate a replacement by two fields the same as in C, by using a
>>> tuple which will look like an anonymous struct. The limitation will be
>>> that if two or more new fields were introduced, we'd need to edit the
>>> patches accessing them to do foo.x.y and foo.x.z for their accesses
>>> instead of simply foo.y and foo.z - the autoref trick only works for a
>>> single type.
>>
>> We will have to see how often multiple fields are added to a struct. If
>> they are infrequent and it's fine for those patches to then touch the
>> field accesses, then I think we can just stick with this approach.
>> If there are problems with that, we can also try the following:
>> all fields of kABI structs must be private and must only be accessed
>> through setters/getters. We can then modify the body the setters/getters
>> to handle the additional indirection.
>=20
> That's just not going to work, sorry.  Remember, the goal here is to
> keep the code that comes from kernel.org identical to what you have in
> your "enterprise" kernel tree, with the exception of the few extra
> "padding" fields you have added to allow for changes in the future in
> the kernel.org versions.

Yeah, that's what I thought.

> Requiring all kernel.org changes that add a new field to a structure to
> only do so with a settter/getter is going to just not fly at all as they
> will not care one bit.
>=20
> Or, we can just forget about "abi stability" for rust code entirely,
> which I am totally fine with.  It's something that managers seem to like
> for a "check box" but in reality, no one really needs it (hint, vendors
> rebuild their code anyway.)

The approach already works for a adding a single field and I got from
the discussions with Matthew and Sami that that is the most common case.
We will reach out to the Rust folks and see what we can do about the
multiple field case.

---
Cheers,
Benno


