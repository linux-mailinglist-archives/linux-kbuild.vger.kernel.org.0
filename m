Return-Path: <linux-kbuild+bounces-3101-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE59576CA
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 23:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6C691F23B4F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 21:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB10D15C14B;
	Mon, 19 Aug 2024 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fVsVX64h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BBC159596;
	Mon, 19 Aug 2024 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724104028; cv=none; b=KSTgHkExWZhN4bmJoXxPp7GsVJHDudvQ48aBDFL549IGWfspPAazvt1AicsglVJqjXJHNlzza1MkDN0JMXUbue0X06Kkrs7Ixqq/gl5M0iZTBt6MvwCiIQGrR0HZCMoHD7WKA/jBBo7cPGgiuo6laZkhs40cjOIM6v+1x1VtukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724104028; c=relaxed/simple;
	bh=AqBGAszCSVup5cRsbpUK+shfas2i3V74A+XqrfqZbYE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etOWXBcqjjHoIiBhekoyGcSWcIflr9LYILMuhq2W1607ROusz+UP84tG7RdPg+HeJhFrFMUGLcPA72f8a0o0IlEBI4Wa6OdRPLH6hmanl5+AFQBZGL4wnON3BTTAgiNecmvdEYlXFMDCytt/aqOsbFdqM6KCkg/r25DzT/8m4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fVsVX64h; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ef44djauundynimsjiha2kgace.protonmail; t=1724104024; x=1724363224;
	bh=WRbQ2Vxut3xD1rDT5Yul21lEXIN5vTcl/BdFvsvRIkY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fVsVX64hH1Bwngp7AwdSOd9PkcHVyR5JDcVLcRM0xmpPQ/BJ7Ltwz6elBbbZvBw6K
	 zfZ4Mq5b6Nfc9sCrMo6/r7UiT5Jf2WjHB+hLJdgsSw7tYib9q4qfFjVQ5Fz9lbV2ju
	 QtOfoNbQa2/uzvndCYXjOj2I2gmVeBVT8LsDa9nwd1nJII4c9FE+79wmESnd0hmQD8
	 WeXa9X25hS/2iOUGpgF/1eFjVR+i0jTmj/WbJJdu1x/76viYL0j4HJlmaKQwoqEGy9
	 cDWaTU5L5ZKIUChJapo4yXD0CSWbSk0XyZSetgu//oDAiVAFL3waXDUSZDWFu2Z3QL
	 HkHGhK+X232jg==
Date: Mon, 19 Aug 2024 21:46:59 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <386fae1c-befc-4ce6-bddb-b560f0c36f02@proton.me>
In-Reply-To: <2024081938-lyricist-estimator-c4eb@gregkh>
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-37-samitolvanen@google.com> <2024081600-grub-deskwork-4bae@gregkh> <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com> <2024081705-overarch-deceptive-6689@gregkh> <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me> <2024081938-lyricist-estimator-c4eb@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 649a7d8f05cde4683cae948f94f9ce7634db556b
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.08.24 20:25, Greg Kroah-Hartman wrote:
> On Sat, Aug 17, 2024 at 01:19:55PM +0000, Benno Lossin wrote:
>> On 17.08.24 09:41, Greg Kroah-Hartman wrote:
>>> On Fri, Aug 16, 2024 at 08:50:53AM -0700, Sami Tolvanen wrote:
>>>> On Fri, Aug 16, 2024 at 12:20=E2=80=AFAM Greg Kroah-Hartman
>>>> <gregkh@linuxfoundation.org> wrote:
>>>>> On Thu, Aug 15, 2024 at 05:39:20PM +0000, Sami Tolvanen wrote:
>>>>> Especially as I have no idea how you are going to do
>>>>> this with the rust side of things, this all will work for any structu=
res
>>>>> defined in .rs code, right?
>>>>
>>>> Yes, Rust structures can use the same scheme. Accessing union members
>>>> might be less convenient than in C, but can presumably be wrapped in
>>>> helper macros if needed.
>>>
>>> That feels ripe for problems for any rust code as forcing a helper macr=
o
>>> for a "normal" access to a structure field is going to be a lot of chur=
n
>>> over time.  Is the need for a macro due to the fact that accessing a
>>> union is always considered "unsafe" in rust?  If that's the case, ick,
>>> this is going to get even messier even faster as the need for sprinklin=
g
>>> unsafe accesses everywhere for what used to be a normal/safe one will
>>> cause people to get nervous...
>>
>> The reason for union field access being unsafe in Rust is that you can
>> easily shoot yourself in the foot. For example:
>>
>>     union Foo {
>>         a: bool,
>>         b: i32,
>>     }
>>
>>     let foo =3D Foo { b: 3 };
>>     println!("{}", unsafe { foo.a });
>>
>> This is UB, since `3` is of course not a valid value for `bool`. With
>> unions the compiler doesn't know which variant is active.
>=20
> Understood, then why attempt to use a union for this type of "abi safe
> padding"?

I don't follow, I thought this was the idea from the thread above. (ie
just do what C does)

>> Since unions are unsafe in Rust, we don't really use them directly (in
>> the `kernel` crate, we have 0 union definitions). Instead we use certain
>> unions from the stdlib such as `MaybeUninit`. But the fields of that
>> union are private and never accessed.
>>
>> In general, unions in Rust are very important primitive types, but they
>> are seldomly used directly. Instead enums are used a lot more, since you
>> don't need to roll your own tagged unions.
>>
>> For this use-case (the one in the patch), I don't really know if we want
>> to copy the approach from C. Do we even support exporting kABI from
>> Rust?
>=20
> That's the goal here, you want to create an abi that can change over
> time without "breaking" the abi.  Usually this is just adding additional
> padding in structures to have room for new additions.
>=20
>> If yes, then we I would recommend we tag it in the source code
>> instead of using a union. Here the example from the patch adapted:
>>
>>     #[repr(C)] // needed for layout stability
>>     pub struct Struct1 {
>>         a: u64,
>>         #[kabi_reserved(u64)] // this marker is new
>>         _reserved: u64,
>>     }
>>
>> And then to use the reserved field, you would do this:
>>
>>     #[repr(C)]
>>     pub struct Struct1 {
>>         a: u64,
>>         #[kabi_reserved(u64)]
>>         b: Struct2,
>>     }
>>
>>     #[repr(C)]
>>     pub struct Struct2 {
>>         b: i32,
>>         v: i32,
>>     }
>>
>> The attribute would check that the size of the two types match and
>> gendwarfksyms would use the type given in "()" instead of the actual
>> type.
>=20
> Remember the "goal" here is to NOT have to modify the places in the
> kernel that use the new field in the structure, but for that to "just
> work".  Your change here wouldn't allow that as any use of the new "b"
> field would have to be through something in "Struct2", not directly in
> Struct1, right?

This confuses me, since I thought that in C you would need to use the
new fields. So for example we have

    void increment(struct struct1 *x)
    {
        x->a +=3D 1;
    }

and then we do the extension and also want to increment `b`, then we
have to do this:

    void increment(struct struct1 *x)
    {
        x->a +=3D 1;
        x->b +=3D 1;
    }

I am not 100% sure if you meant the following problem: if a user uses
the `increment` function like this:

    struct struct1 x =3D { .a =3D 0, .__kabi_reserved_0 =3D 0 };
    increment(&x);

Then in the C example they don't need to change their usage. In Rust,
they would, but we shouldn't make the struct fields public, then they
can't create the struct using the initializer syntax, but instead we
would provide stable initialization functions. Translating the entire
example to Rust:

    impl Struct1 {
        pub fn new(a: u64) -> Self {
            Self { a, _reserved: 0 }
        }

        pub fn increment(&mut self) {
            self.a +=3D 1;
        }
    }

Then after adding the new field, this becomes:

    impl Struct1 {
        pub fn new(a: u64) -> Self {
            Self { a, b: Struct2 { b: 0, v: 0 } }
        }

        pub fn increment(&mut self) {
            self.a +=3D 1;
            self.b.b +=3D 1;
        }
    }

So the following user would also not have to change the code:

    let mut x =3D Struct1::new(0);
    x.increment();

> We can mess with the structure definitions but we should not have to
> touch the places where the structure fields are used at all.  If that's
> going to be a requirement (as it sounds like it would with the use of
> unsafe in the union), then this is not going to be a solution at all.

So the union approach *could* work and the users of the API would not
have to use `unsafe`. But doing it the way I suggest above is going to
be cleaner, as the people who use the API won't ever need to know of the
internals.

---
Cheers,
Benno


