Return-Path: <linux-kbuild+bounces-3532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E59773F4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 23:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A385D1C23F19
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2024 21:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB951C244F;
	Thu, 12 Sep 2024 21:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="DRWp8050"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D09A1C230A
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Sep 2024 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726178319; cv=none; b=I1/QfYjHG+lqxWxs1KWKIwtPFiqpkJOuJtgnK4VwqUHhP0XwwHH493GtNTlSgszaWJCEXBcSBHPhg/nGSvhOsVDadLEpBL32ijIJikbS+VorqEMDVOrVsmar+vKXYKISUAnBcR7NB5sHxtfbaTb0G8QySukFjS7Me345G4xnoWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726178319; c=relaxed/simple;
	bh=TKrdddSHsDc+hJWgeJCAxSQR5SCnDc2jAhqv28N5ZNk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mytWx76yRjP4YylK9kBtcBeR/ZTR8+0fAQ1EXAX1t5uLJyIwp5kYEghPjy+d0V/1dlZaPom6iOjSG92/jC4whICITtpp3O8m3wLbmXk8AkDe+5nbA2zaH+kZeKYCX1q17LSPy0V+/yY1RgI/a2e4nvmDWhFzFdZK8T6SU+3X4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=DRWp8050; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726178315; x=1726437515;
	bh=ZT/DNSiZiH/pUY8BeYwawsjtoX0m/WJiFqPtKpryqJw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DRWp80506OiC+ls4cSoJjTXldfiOkxpD/dyt6NXh71SGHhrrltowi+C4n44NeuRIa
	 ujzg9uP2do16dAoXCo1DDTukZmscFKdRWMgxVXoZ1SZndwNUC6MxVOw7W5wCDVqkXz
	 nQ89EkGREykdsYE/XcMQPiXMt/usn0utDz3YTU2fydLz8mk1EGuYnjjSWoiE/pyeNo
	 YvDiBzI23uVjYmCBMCASCphBvcga1oR6nu5GGemU4OsxD+HQfll5baPrE7rPQN9fgb
	 N+X6sGE8suc0XDn7ltMnsvy7rDLVgelQGc+T11PxiH6D+2AE46f7/pErmNdB6jPMQB
	 wUOr7k+OFC/og==
Date: Thu, 12 Sep 2024 21:58:29 +0000
To: Sami Tolvanen <samitolvanen@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Miroslav Benes <mbenes@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <66694e9a-16d1-4d4e-b825-b90707f2b42e@proton.me>
In-Reply-To: <CABCJKue-YtCQWinad2GW7uJuVN-ZSUmRYttK_PUurJOR51Urgg@mail.gmail.com>
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz> <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com> <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com> <CABCJKuer=O3FnLJNGMg2+-HxFJFUrccTuuHt5OiMpRsAJBvBsg@mail.gmail.com> <2b2d4953-d2a3-4ea2-98a4-078901cfbda3@proton.me> <CABCJKue-YtCQWinad2GW7uJuVN-ZSUmRYttK_PUurJOR51Urgg@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 958756f581d8c8da07f682c7378aed3930ec7842
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.09.24 22:58, Sami Tolvanen wrote:
> Hi Benno,
>=20
> On Thu, Sep 12, 2024 at 11:08=E2=80=AFAM Benno Lossin <benno.lossin@proto=
n.me> wrote:
>>
>> On 12.09.24 18:06, Sami Tolvanen wrote:
>>>
>>> I thought about this a bit and I wonder if we need a separate
>>> mechanism for that, or is it sufficient to just #define any additional
>>> hidden values you want to add instead of including them in the enum?
>>>
>>>   enum e {
>>>       A,
>>>       B,
>>>   #define C (B + 1)
>>>   #define D (C + 1)
>>>   };
>>>
>>>
>>> Do you see any issues with this approach? I think Clang would complain
>>> about this with -Wassign-enum, but I'm not sure if we even enable that
>>> in the kernel, and as long as you don't overflow the underlying type,
>>> which is a requirement for not breaking the ABI anyway, it should be
>>> fine.
>>
>> Rust has problems with `#define`-style enums, because bindgen (the tool
>> that generates definitions for Rust to be able to call C code) isn't
>> able to convert them to Rust enums.
>>
>> So if you can come up with an approach that allows you to continue to
>> use C enums instead of `#define`, we would appreciate that, since it
>> would make our lives a lot easier.
>=20
> That's an interesting point. Is the problem that you cannot assign
> arbitrary values to the Rust enum that bindgen generates, or is using
> a #define the problem? We could probably just make the hidden enum
> values visible to bindgen only if needed.

So if I take your example from above add it to our bindgen input, then I
get the following output:

    pub const e_A: my_own_test_enum =3D 0;
    pub const e_B: my_own_test_enum =3D 1;
    pub type e_enum =3D core::ffi::c_uint;

So it doesn't pick up the other constants at all. That is probably
because we haven't enabled the bindgen flag that adds support for
function-like macros. If I enable that flag (`--clang-macro-fallback`,
then the output becomes:

    pub const C: u32 =3D 2;
    pub const D: u32 =3D 3;
    pub const e_A: e =3D 0;
    pub const e_B: e =3D 1;
    pub type e =3D ::std::os::raw::c_uint;

So it doesn't really work as we would like it to (ie missing e_ prefix).

But even if bindgen were to start supporting `#define` inside of the
enum. It might still have a problem with the `#define`: there is the
`--rustified-enum <REGEX>` option for bindgen that would change the
output to this:

    #[repr(u32)]
    #[derive(Debug, Copy, Clone, Hash, PartialEq, Eq)]
    pub enum e {
        A =3D 0,
        B =3D 1,
    }

Which makes using the values on the Rust side a lot easier, since you
get exhaustiveness checks when using `match`. Adding the
`--clang-macro-fallback` flag, I get:

    pub const C: u32 =3D 2;
    pub const D: u32 =3D 3;
    #[repr(u32)]
    #[derive(Debug, Copy, Clone, Hash, PartialEq, Eq)]
    pub enum e {
        A =3D 0,
        B =3D 1,
    }

Which is a big problem, because the enum `e` won't have 2 or 3 as valid
values (it will be UB to write them to a variable of type `e`).


Would you add conditions to the `#define`? For example checking for the
version of kABI? (or how would it work?)

Because we might want to have something similar on the Rust side then:

    #[repr(u32)]
    #[derive(Debug, Copy, Clone, Hash, PartialEq, Eq)]
    pub enum e {
        A =3D 0,
        B =3D 1,
        #[cfg(kabi >=3D "some-version")]
        C =3D 2,
        #[cfg(kabi >=3D "some-version")]
        B =3D 3,
    }

(still generated by bindgen though)

---
Cheers,
Benno


