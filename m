Return-Path: <linux-kbuild+bounces-3140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E9959AF7
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 13:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0091CB21892
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 11:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE24B1D12F0;
	Wed, 21 Aug 2024 11:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="eypalCqS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335EE1D12E4;
	Wed, 21 Aug 2024 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724239902; cv=none; b=RPENzLZNDx+k/c/SQSbL/sgznDkUuM5O189tCwweRZTrrkAG06KKk3WWMmEbz9r4DiNfDhR0apRPrEuwTpJVvGI18I+MpBEzH7Q9y7g3JzXlxD82JDYRmrhcfTEdDp5lFpT9kUNnSMkA0zRNdzlNKw/BJbgHSfc/HjysQL/ryXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724239902; c=relaxed/simple;
	bh=RzmfVrWUhBr3jHRQaWjPRIQ5gWenH0/n2KaMEw1Uu7I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWmuLsEmbE2bP68cEwZ5yD3gCr5RLgNFV34AhaTRgNUFMWbEFW4KJXlJgFUzhebXRYKX6Mj5FnK6m54ZBjhcqlHDDZCzy2Ph1F8ljyAPxZw3kmf07CQASPrSEanvw3rV4Qkz3kJ/ldE2xBIav0lECg3RrzL8jKHY1R+rRGGKtPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=eypalCqS; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=b5zllgnbznfshfdmc3hqiefzqa.protonmail; t=1724239892; x=1724499092;
	bh=6e+KrV8eK1jYjXKD3gCoNRPU6HnobC3E51PBNfGSs0M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eypalCqS/3lcRKIK7Itf6QjrE8EkvGixvbUpDqFJK6fAlt8FJgW+ITFZMWlthTOz6
	 xSroeFZZ7GsNugNqDWeOQnWPyBkTvZZkl4is5J5KPDeNuqjhCmHVrb0emAlYQgmCfB
	 vWnCUuhW7d507QFUztq5qX4AvzRXLfzn/CQdaAW8L7Bo5r3/tfi3lKGrq6l6S7bLbx
	 5hq6vUKYxBctn+CTihezafbFoo/6L+2gm2CKmTYrLaJ/mhg5U7CXFXecS6UHWBOzLD
	 N19zht4joffrjgFFsNoVvdW/caih+kcyqxj4pxwRnz/h4HZbe38aANWZLFoxmDtreM
	 PrBiEq1ZKPflQ==
Date: Wed, 21 Aug 2024 11:31:25 +0000
To: Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me>
In-Reply-To: <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com>
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-37-samitolvanen@google.com> <2024081600-grub-deskwork-4bae@gregkh> <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com> <2024081705-overarch-deceptive-6689@gregkh> <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me> <20240819193851.GA4809@google.com> <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me> <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com> <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 6a5a4130b8ba58dcb7d4dbdbde33889b843fe919
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 20.08.24 22:03, Matthew Maurer wrote:
>>> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
>>> ironic, considering what I said in my other replies, but in this case,
>>> we would provide a safe abstraction over this `union`, thus avoiding
>>> exposing users of this type to `unsafe`):
>>>
>>>     #[repr(C)]
>>>     pub union KAbiReserved<T, R> {
>>>         value: T,
>>>         _reserved: R,
>>>     }
>>
>> I like this approach even better, assuming any remaining issues with
>> ownership etc. can be sorted out. This would also look identical to
>> the C version in DWARF if you rename _reserved in the union to
>> __kabi_reserved. Of course, we can always change gendwarfksyms to
>> support a different scheme for Rust code if a better solution comes
>> along later.

Yeah sure, that should also then work directly with this patch, right?

>> Sami
>=20
> Agreement here - this seems like a good approach to representing
> reserved in Rust code. A few minor adjustments we discussed off-list
> which aren't required for gendwarfksyms to know about:
> 1. Types being added to reserved fields have to be `Copy`, e.g. they
> must be `!Drop`.
> 2. Types being added to reserved fields must be legal to be
> represented by all zeroes.
> 3. Reserved fields need to be initialized to zero before having their
> union set to the provided value when constructing them.
> 4. It may be helpful to have delegating trait implementations to avoid
> the couple places where autoderef won't handle the conversion.
>=20
> While I think this is the right solution, esp. since it can share a
> representation with C, I wanted to call out one minor shortfall - a
> reserved field can only be replaced by one type. We could still
> indicate a replacement by two fields the same as in C, by using a
> tuple which will look like an anonymous struct. The limitation will be
> that if two or more new fields were introduced, we'd need to edit the
> patches accessing them to do foo.x.y and foo.x.z for their accesses
> instead of simply foo.y and foo.z - the autoref trick only works for a
> single type.

We will have to see how often multiple fields are added to a struct. If
they are infrequent and it's fine for those patches to then touch the
field accesses, then I think we can just stick with this approach.
If there are problems with that, we can also try the following:
all fields of kABI structs must be private and must only be accessed
through setters/getters. We can then modify the body the setters/getters
to handle the additional indirection.

If that also sounds too much work compared to the C side, then we can
get in touch with the Rust language folks and see if they can provide us
with a better solution.

---
Cheers,
Benno


