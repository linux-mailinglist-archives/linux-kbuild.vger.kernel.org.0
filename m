Return-Path: <linux-kbuild+bounces-3151-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1595B478
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 14:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CF04B23EC9
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 12:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E501C9431;
	Thu, 22 Aug 2024 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AbXlpY6K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1171C93D7;
	Thu, 22 Aug 2024 12:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328024; cv=none; b=DrR0a8XSWVVWHZv2HS6//piFdpFFyYB1x9o3rhF+UW3YA13ijFQEJXCLC1n6gDeMA6m1WavSlJQeEKXM//M4hdDSNN0qRyb8MCOM9HpLtomlRnsyNKUsQFLtow5lFmCuljO/isAkbliDBEQi7z/O6wFMJfjC5NNDfvl7li494EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328024; c=relaxed/simple;
	bh=Frs7AnE6wun6QVrxYzJHiybARafDIPzKWYZS2yfNvU4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jeETstirv/C4zeL1UhVR2NBNp4BCbihEbYAapBHHbeGrpVuH45oOdEQXVS4SGVRBO14wwFa2Muvd9bfqYMg+GTE8lXla+MQkOzjFXadPuUvOUuiE3n2K5n8g5OU5SlFddXpPCyBJMgJ1URNrkyrXVtz4/8SagjIIAp9kVPewifM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AbXlpY6K; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724328020; x=1724587220;
	bh=Eo15Vf0KvOVZFuFUurKSOxZuNxfh+ilduZH8kmrr0LY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AbXlpY6KEBifkw188IiiQaP/sOabCXCfj/ExVcTdKU7eh/6SlO3OqboiDUVWJ5IhF
	 9x2JRX6TNyLMxOEb7+OlsYSn0RpFoW8DcTNl/eHly/z2XMhYMaUt1920m6sYvASBzY
	 4qGDChY0zkDjodnIYKsJj2b8mWH+OOLPjn9Pcje6GnWWVJikR1nL7IFP6WWnHba39g
	 G+bOL4OBCLCZh00/6y48Qd+JAnGB3DVgfuIe37+5HyB6+A2S5AjZKPX2M9ANU1aDqe
	 3tHAUaf64vNCndueMoz+MUTnidjc4HZk13fxw7jrNgnqKqNZxGJ0kAHqYzK4uwOf6Q
	 vtHAq/cGsXN2w==
Date: Thu, 22 Aug 2024 12:00:15 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <77e8e20c-8ca1-4df7-a4d7-ed77454f1754@proton.me>
In-Reply-To: <2024082257-refrain-subsector-b6c4@gregkh>
References: <20240815173903.4172139-37-samitolvanen@google.com> <20240819193851.GA4809@google.com> <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me> <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com> <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com> <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me> <2024082229-elevation-emporium-8118@gregkh> <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me> <2024082257-refrain-subsector-b6c4@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d4880588e8a82bc15d53eb3fbef04fb18dc7073e
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 22.08.24 09:29, Greg Kroah-Hartman wrote:
> On Thu, Aug 22, 2024 at 05:55:32AM +0000, Benno Lossin wrote:
>> On 22.08.24 01:29, Greg Kroah-Hartman wrote:
>>> On Wed, Aug 21, 2024 at 11:31:25AM +0000, Benno Lossin wrote:
>>>> On 20.08.24 22:03, Matthew Maurer wrote:
>>>>>>> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
>>>>>>> ironic, considering what I said in my other replies, but in this ca=
se,
>>>>>>> we would provide a safe abstraction over this `union`, thus avoidin=
g
>>>>>>> exposing users of this type to `unsafe`):
>>>>>>>
>>>>>>>     #[repr(C)]
>>>>>>>     pub union KAbiReserved<T, R> {
>>>>>>>         value: T,
>>>>>>>         _reserved: R,
>>>>>>>     }
>>>>>>
>>>>>> I like this approach even better, assuming any remaining issues with
>>>>>> ownership etc. can be sorted out. This would also look identical to
>>>>>> the C version in DWARF if you rename _reserved in the union to
>>>>>> __kabi_reserved. Of course, we can always change gendwarfksyms to
>>>>>> support a different scheme for Rust code if a better solution comes
>>>>>> along later.
>>>>
>>>> Yeah sure, that should also then work directly with this patch, right?
>>>>
>>>>>> Sami
>>>>>
>>>>> Agreement here - this seems like a good approach to representing
>>>>> reserved in Rust code. A few minor adjustments we discussed off-list
>>>>> which aren't required for gendwarfksyms to know about:
>>>>> 1. Types being added to reserved fields have to be `Copy`, e.g. they
>>>>> must be `!Drop`.
>>>>> 2. Types being added to reserved fields must be legal to be
>>>>> represented by all zeroes.
>>>>> 3. Reserved fields need to be initialized to zero before having their
>>>>> union set to the provided value when constructing them.
>>>>> 4. It may be helpful to have delegating trait implementations to avoi=
d
>>>>> the couple places where autoderef won't handle the conversion.
>>>>>
>>>>> While I think this is the right solution, esp. since it can share a
>>>>> representation with C, I wanted to call out one minor shortfall - a
>>>>> reserved field can only be replaced by one type. We could still
>>>>> indicate a replacement by two fields the same as in C, by using a
>>>>> tuple which will look like an anonymous struct. The limitation will b=
e
>>>>> that if two or more new fields were introduced, we'd need to edit the
>>>>> patches accessing them to do foo.x.y and foo.x.z for their accesses
>>>>> instead of simply foo.y and foo.z - the autoref trick only works for =
a
>>>>> single type.
>>>>
>>>> We will have to see how often multiple fields are added to a struct. I=
f
>>>> they are infrequent and it's fine for those patches to then touch the
>>>> field accesses, then I think we can just stick with this approach.
>>>> If there are problems with that, we can also try the following:
>>>> all fields of kABI structs must be private and must only be accessed
>>>> through setters/getters. We can then modify the body the setters/gette=
rs
>>>> to handle the additional indirection.
>>>
>>> That's just not going to work, sorry.  Remember, the goal here is to
>>> keep the code that comes from kernel.org identical to what you have in
>>> your "enterprise" kernel tree, with the exception of the few extra
>>> "padding" fields you have added to allow for changes in the future in
>>> the kernel.org versions.
>>
>> Yeah, that's what I thought.
>>
>>> Requiring all kernel.org changes that add a new field to a structure to
>>> only do so with a settter/getter is going to just not fly at all as the=
y
>>> will not care one bit.
>>>
>>> Or, we can just forget about "abi stability" for rust code entirely,
>>> which I am totally fine with.  It's something that managers seem to lik=
e
>>> for a "check box" but in reality, no one really needs it (hint, vendors
>>> rebuild their code anyway.)
>>
>> The approach already works for a adding a single field and I got from
>> the discussions with Matthew and Sami that that is the most common case.
>> We will reach out to the Rust folks and see what we can do about the
>> multiple field case.
>=20
> No, single field is NOT the common case, the common case is reserving
> multiple padding variables in a structure as lots of things can change
> of the long lifetimes of some of these kernel trees.  Look at the
> changes in the Android or SLES or RHEL kernels for specifics.

Thanks for letting me know.

> Here's one example in the android tree where 4 64bit fields are reserved
> for future abi changes:
> =09https://android.googlesource.com/kernel/common/+/refs/heads/android12-=
5.10/include/linux/fs.h#421
>=20
> And here's a different place where a field is being used with many
> remaining for future use:
> =09https://android.googlesource.com/kernel/common/+/refs/heads/android12-=
5.10/include/linux/sched.h#1379
>=20
> And also, we want/need lots of other space reservation at times, look at
> how "Others" can get access to reserved areas in structures that need to
> be done in an abi-safe way:
> =09https://android.googlesource.com/kernel/common/+/refs/heads/android12-=
5.10/include/linux/sched.h#1375

Let me correct myself, it's only possible to replace one `KAbiReserved`
by one new field. You can have as many fields of type `KAbiReserved` as
you want. The thing that you can't do is replace a single `KAbiReserved`
field by multiple (well you can, but then you have to change the sites
that use it).

> All of this also needs to be possible in any structures that are
> exported by rust code if vendors want to have a way to track and ensure
> that abis do not change over time, just like they can today in C code.

All of those structs need to be `repr(C)`, otherwise they don't
have a stable layout to begin with. Other than that, only autoderef
might be missing. But we would have to see if that even comes up.

> Or if not possible, just don't export any rust structures at all :)

I think that we should try to get this working.

---
Cheers,
Benno


