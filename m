Return-Path: <linux-kbuild+bounces-3199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E195DE10
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 15:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA6A1C20F0F
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 13:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2346A4A07;
	Sat, 24 Aug 2024 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WTHWipLw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5081714B2
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Aug 2024 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724506037; cv=none; b=YhriITo7q+DVCVOY2F1lxmYIBwkWiI6hM5u6/eADQLBFPz71XbKT+nnu9t6+gntXUX8xqmuBBEg1e+DlaAJgz6HDkxOo0UbE3Zd9lQ6aSzRQznFOrXLj5+kkEw23YjonES/lYoWOyOzQQwM9uAtWo45IBwv+SPTOIZIPVQuQfHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724506037; c=relaxed/simple;
	bh=kMO69p16kqJrjrEcKmdv3cBmB0rk3eV+MoscgcvZdac=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjdH9j3cFKD1jBqFWKwnYsTnxw6maUmx8pLhEq43UBslk4wOd2S6a14J4ybIibUpdMczW7EFzEihEdc6WzoY7UDIEzzkDZQpLJo4WLZtdsLD/hLyivbB44SGfvX/pYFCQ1rs9CyQUCzNSkt6VdhBrcYezoD6ZtHogpoFouFwBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WTHWipLw; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724506032; x=1724765232;
	bh=RqdsCkI6mejjg55TgKGNTjgt+43oDMZ//60n7i61RCM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WTHWipLwGdY4IB2mU3lKtW8IJb2/uw5U6Q5kU8dPRTITq9ZFhWheiGrd9IqPHTs6N
	 3e18ZwRwK1qCU/fMnKFhtsseUf8rxpjRgE8ptT1ouTKn/IABmx0csU5fOun6zlhns4
	 vUBKKbKYI08SPkdYgn4TZXAUPId9YOyi8Xf3X1H5c2kvVPYFEdt0RlOAnpI54T8918
	 k4p6Kfd1VJQz7A4t1RgLrHhtoB1UZvgxGhbQjMCPr6F0DLsVTc8GCE32STykcYWkSH
	 vw2B3tTdKIX38DQfn2BMPrSCVZ1ZryW26939SSz7wIHC5TOwMnk2fzAODUvL1dsJ2S
	 /7aZAwmkitdNw==
Date: Sat, 24 Aug 2024 13:27:07 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <ec80d964-2062-4556-a11b-ba764e1f58f7@proton.me>
In-Reply-To: <2024082356-stowing-endowment-555b@gregkh>
References: <20240815173903.4172139-37-samitolvanen@google.com> <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com> <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com> <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me> <2024082229-elevation-emporium-8118@gregkh> <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me> <2024082257-refrain-subsector-b6c4@gregkh> <77e8e20c-8ca1-4df7-a4d7-ed77454f1754@proton.me> <2024082356-stowing-endowment-555b@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 9e377948a7d048ed45f8d84a815c87b14110d385
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23.08.24 01:53, Greg Kroah-Hartman wrote:
> On Thu, Aug 22, 2024 at 12:00:15PM +0000, Benno Lossin wrote:
>>> Here's one example in the android tree where 4 64bit fields are reserve=
d
>>> for future abi changes:
>>> =09https://android.googlesource.com/kernel/common/+/refs/heads/android1=
2-5.10/include/linux/fs.h#421
>>>
>>> And here's a different place where a field is being used with many
>>> remaining for future use:
>>> =09https://android.googlesource.com/kernel/common/+/refs/heads/android1=
2-5.10/include/linux/sched.h#1379
>>>
>>> And also, we want/need lots of other space reservation at times, look a=
t
>>> how "Others" can get access to reserved areas in structures that need t=
o
>>> be done in an abi-safe way:
>>> =09https://android.googlesource.com/kernel/common/+/refs/heads/android1=
2-5.10/include/linux/sched.h#1375
>>
>> Let me correct myself, it's only possible to replace one `KAbiReserved`
>> by one new field. You can have as many fields of type `KAbiReserved` as
>> you want. The thing that you can't do is replace a single `KAbiReserved`
>> field by multiple (well you can, but then you have to change the sites
>> that use it).
>=20
> That's odd/foolish, why would that be the case?  Isn't that exactly what
> a union is for?  How are you going to know ahead of time what size types
> to save space for?

That's what I interpreted from the links you provided above, there are
multiple invocations of `ANDROID_KABI_RESERVE` and I figured they each
can be used to insert a new field. Or can you replace each one by as
many fields as you want, as long as the size is still fine?

> All we really want to do here is "pad out this structure by X bytes" and
> then later "take X bytes to represent this variable" at a later point in
> time.
>=20
> Surely rust can do that, right?  :)

Not with all the other things that you need. I feel like this discussion
is dragging a bit on, so we will just ask the Rust folks if they have
any suggestions and if they don't we will ask for a solution. We can
then get back to this when that's done.
It's not like we need this immediately.

>>> All of this also needs to be possible in any structures that are
>>> exported by rust code if vendors want to have a way to track and ensure
>>> that abis do not change over time, just like they can today in C code.
>>
>> All of those structs need to be `repr(C)`, otherwise they don't
>> have a stable layout to begin with.
>=20
> Do we have any way to enforce at build time that exports from rust code
> are in this format to ensure that this will work properly going forward?
> I guess someone is going to have to write the first api in rust that
> actually gets used before we worry about this...

I don't know if we already have a way, but we will need one if people
start writing kabi in Rust.

---
Cheers,
Benno


