Return-Path: <linux-kbuild+bounces-3065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064B95580E
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 15:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DD37B21B25
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 13:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D95914F9EB;
	Sat, 17 Aug 2024 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="g2XMO8Kr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5704814D28A;
	Sat, 17 Aug 2024 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723900808; cv=none; b=sIhTU67hqRsKxEtQ1RJ3Tk9PFVWTBw/VhhE9vZerIb7kwVlsXOA72Sn8PRwPhKqcpWWHp0HussAMzSA+CDVYR+6aXtpLJMt0lGDCKuQ+zJQ7XydkEmp/GbQ5JuqsnxoHh6RWvgnB8dkOSyI9P9eGxG+oPjXdkmyFOgbtcGaByi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723900808; c=relaxed/simple;
	bh=mPLPgPLHO6Ixud7oOpd/z/JGbxH2aQkAFVO52+GRYik=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fiKMGQbel2ABvyqZqOM0AZlD10TccrfaBz21dwSRYaijpqfGTn98zSeJS9NMIuix/rNQqbjC1xE0kcyRrS/BScfHxqXcytIIUkbeJt+4Q74/ri9Pf2yXp7ZoIHvMxGgwRSyW1ZIW/Ti5+Z5KHNsV43sHUMBm+kNX6FhjmiSAPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=g2XMO8Kr; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1723900799; x=1724159999;
	bh=j/PPS3EYuNHFT3+6UMf12p/CM7ltsg2HQQvZIYDDvrY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g2XMO8KrGCemhep3mXA0XstRJkQG4mViRXVMJOTlbUtQX520QNQqN9r6JMwMna8Xq
	 XbnVwnVDh6YM0IVFsqguVYgnAKYuEz2GLxRS4xfWNFH4Lv5YCE/HXjWT4OF5cI20Dq
	 LvnQam9XXddIi7DxFZWLboTBeWE+OGzwzxU6vMgtFD9vRSolPErnt7LksY1hkAKgIy
	 uLffKcoXtUMQjV8w6YoajX4pQD7IF9pPgW6k/5UMMbGezMywFyOon+GTUHkv8O0ZcG
	 rSjI8ehM4dAxKOXHvIcBhoqMvIpbb3pSLNPGUe/aJ0TjGH5OGW8+z201JfskKhj8qN
	 P9qearbDqczDA==
Date: Sat, 17 Aug 2024 13:19:55 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sami Tolvanen <samitolvanen@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
In-Reply-To: <2024081705-overarch-deceptive-6689@gregkh>
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-37-samitolvanen@google.com> <2024081600-grub-deskwork-4bae@gregkh> <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com> <2024081705-overarch-deceptive-6689@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 985bccfc1600ca44c1aa5ffd0d6fb059413f58a3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.08.24 09:41, Greg Kroah-Hartman wrote:
> On Fri, Aug 16, 2024 at 08:50:53AM -0700, Sami Tolvanen wrote:
>> On Fri, Aug 16, 2024 at 12:20=E2=80=AFAM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>> On Thu, Aug 15, 2024 at 05:39:20PM +0000, Sami Tolvanen wrote:
>>> Especially as I have no idea how you are going to do
>>> this with the rust side of things, this all will work for any structure=
s
>>> defined in .rs code, right?
>>
>> Yes, Rust structures can use the same scheme. Accessing union members
>> might be less convenient than in C, but can presumably be wrapped in
>> helper macros if needed.
>=20
> That feels ripe for problems for any rust code as forcing a helper macro
> for a "normal" access to a structure field is going to be a lot of churn
> over time.  Is the need for a macro due to the fact that accessing a
> union is always considered "unsafe" in rust?  If that's the case, ick,
> this is going to get even messier even faster as the need for sprinkling
> unsafe accesses everywhere for what used to be a normal/safe one will
> cause people to get nervous...

The reason for union field access being unsafe in Rust is that you can
easily shoot yourself in the foot. For example:

    union Foo {
        a: bool,
        b: i32,
    }

    let foo =3D Foo { b: 3 };
    println!("{}", unsafe { foo.a });

This is UB, since `3` is of course not a valid value for `bool`. With
unions the compiler doesn't know which variant is active.

Since unions are unsafe in Rust, we don't really use them directly (in
the `kernel` crate, we have 0 union definitions). Instead we use certain
unions from the stdlib such as `MaybeUninit`. But the fields of that
union are private and never accessed.

In general, unions in Rust are very important primitive types, but they
are seldomly used directly. Instead enums are used a lot more, since you
don't need to roll your own tagged unions.

For this use-case (the one in the patch), I don't really know if we want
to copy the approach from C. Do we even support exporting kABI from
Rust? If yes, then we I would recommend we tag it in the source code
instead of using a union. Here the example from the patch adapted:

    #[repr(C)] // needed for layout stability
    pub struct Struct1 {
        a: u64,
        #[kabi_reserved(u64)] // this marker is new
        _reserved: u64,
    }

And then to use the reserved field, you would do this:
   =20
    #[repr(C)]
    pub struct Struct1 {
        a: u64,
        #[kabi_reserved(u64)]
        b: Struct2,
    }

    #[repr(C)]
    pub struct Struct2 {
        b: i32,
        v: i32,
    }

The attribute would check that the size of the two types match and
gendwarfksyms would use the type given in "()" instead of the actual
type.

---
Cheers,
Benno


