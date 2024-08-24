Return-Path: <linux-kbuild+bounces-3200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E05D195DE13
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 15:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E585283296
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 13:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E860C177992;
	Sat, 24 Aug 2024 13:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="cy6Zw7Jq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A6F1714D9;
	Sat, 24 Aug 2024 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724506170; cv=none; b=uun7g/KiG6RLWudOmOdddMq0p9OxUxLajNq1qmcpUTcx9l8y7g/98b34RQGKoykdWOih8gQVatMQ8ZJLErc2IMqv5ejCVTLENljnEijaLPYx4WvGbmB2kAZIcandphKQ2b/jyyy53K4tmLAWqvXlgbjyH61jBGifFqjW76GrlHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724506170; c=relaxed/simple;
	bh=hr1XOQZ9U343cnTrd1bJhdSY7hzd+T1SWciojjT1rhU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jwOnQPxrqx66irU2H58QZDr6gtLr2jTNWRsBRTWdg4ANuEomKcTaLKXZ4ly7F0K8JyQLwVcX6iuFrMwLGpgITyOrCzkHyzIdi8jKKtPdK+w4K7APxIShQAmnFD0QWQfVsy+m7q3ggMJtOsOgSYpaRj8r0RG1s//xg12biqwqxOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=cy6Zw7Jq; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724506166; x=1724765366;
	bh=4WZEdxtP20MxpWbuNX42Iofz/oj03EQ9p6kzoS8qGsI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cy6Zw7Jqym9i1pP8Siju0RjfDNBh6OVPs+ns6S1v+gyCPxQTjgDjxFjt0bk19Jw5i
	 r9B+8FxKTzQ4neq2UKJGZ8Wm6Ug0taqQsF3QHQMLr1LyQKyXxMpTSmnmNU695OTVz+
	 x+PhoESPwW+cjF7YciFcJVjq/psJop3Mn6TPzWyXoTjGlMa6gDFrhn08JBcIq2THW5
	 C7kyNIyBRbtDoDTOSO7Et/m7csDzBGcQB46u4782IFPfynigqAXH3NpZNUmlE7Qom4
	 090h/CJZkg5YN9z3sDqXlXlsQvAVuc8Ms1gZSga+thybJyVyBQQZPgW74cDRH6SCIh
	 sfSOpOXfapsjA==
Date: Sat, 24 Aug 2024 13:29:21 +0000
To: Sami Tolvanen <samitolvanen@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Matthew Maurer <mmaurer@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <b1271470-3d96-4e59-9daa-59ebd7182077@proton.me>
In-Reply-To: <CABCJKud--imREq8E6uuk4XwatLsKC7ikmyoLKJStqr3Azz0Hdw@mail.gmail.com>
References: <20240815173903.4172139-37-samitolvanen@google.com> <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com> <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me> <2024082229-elevation-emporium-8118@gregkh> <bc2e02d7-d4a7-4f0f-852c-e26ad6a8688f@proton.me> <2024082257-refrain-subsector-b6c4@gregkh> <77e8e20c-8ca1-4df7-a4d7-ed77454f1754@proton.me> <2024082356-stowing-endowment-555b@gregkh> <CABCJKud--imREq8E6uuk4XwatLsKC7ikmyoLKJStqr3Azz0Hdw@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 6785fcfab27dbd28be2583ccd0b0e44a12322f31
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 23.08.24 21:17, Sami Tolvanen wrote:
> On Thu, Aug 22, 2024 at 11:53=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Thu, Aug 22, 2024 at 12:00:15PM +0000, Benno Lossin wrote:
>>>> Here's one example in the android tree where 4 64bit fields are reserv=
ed
>>>> for future abi changes:
>>>>     https://android.googlesource.com/kernel/common/+/refs/heads/androi=
d12-5.10/include/linux/fs.h#421
>>>>
>>>> And here's a different place where a field is being used with many
>>>> remaining for future use:
>>>>     https://android.googlesource.com/kernel/common/+/refs/heads/androi=
d12-5.10/include/linux/sched.h#1379
>>>>
>>>> And also, we want/need lots of other space reservation at times, look =
at
>>>> how "Others" can get access to reserved areas in structures that need =
to
>>>> be done in an abi-safe way:
>>>>     https://android.googlesource.com/kernel/common/+/refs/heads/androi=
d12-5.10/include/linux/sched.h#1375
>>>
>>> Let me correct myself, it's only possible to replace one `KAbiReserved`
>>> by one new field. You can have as many fields of type `KAbiReserved` as
>>> you want. The thing that you can't do is replace a single `KAbiReserved=
`
>>> field by multiple (well you can, but then you have to change the sites
>>> that use it).
>>
>> That's odd/foolish, why would that be the case?  Isn't that exactly what
>> a union is for?  How are you going to know ahead of time what size types
>> to save space for?
>=20
> I believe Benno is referring to the lack of anonymous structures in
> Rust. While you can replace a reserved field with a struct that
> contains multiple smaller fields, you can't access the fields
> transparently from the parent struct like you can in C:
>=20
>     struct s { struct { u32 a; u32 b; }; };
>     struct s s;
>     s.a =3D 0;
>     ...
>=20
> It looks like nightly Rust does have some level of support for unnamed
> fields in unions, but the implementation is not yet complete:
>=20
> https://play.rust-lang.org/?version=3Dnightly&mode=3Ddebug&edition=3D2021=
&gist=3D4f268d308fe6aa7a47566c7080c6e604
>=20
> Benno, Matt, are you familiar with this feature?

No, thanks for pointing that out!

But this will run into the issue that field access for unions is
`unsafe`. So we can't really use it. I also tried to use our current
`KAbiReserved<T, R>` approach and using this as `T`:

    struct Foo {
        _: struct { a: u32, b: u32 }
    }

But that doesn't work.

---
Cheers,
Benno


