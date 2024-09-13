Return-Path: <linux-kbuild+bounces-3535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C29977A6E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 10:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F331C25540
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 08:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8727F1BC065;
	Fri, 13 Sep 2024 08:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="GtmDrGgo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4547E33C8;
	Fri, 13 Sep 2024 08:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726214465; cv=none; b=EzAsvmLRaMOfG343JJP+uF1JYyBIv5VZsK5a/BvV0SY+UxMoQfIIQvUbB00LaZcd97hDgRv7CLOOsh5xSnkw9S93QBWUX0zswYylkcEcLoRRy5Yzh+tyUUgVUYZgXFOVv3dOgxbm9F5JXE08CjKHppcrQhhe9yTea3ydPUappKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726214465; c=relaxed/simple;
	bh=WQF04KEZMGaX+rXC+csKFxpNeaJOVChWnA4IHqeeHMc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJ00IuCcYSn7yG8DBv1J6UCf0+IChwuVxO/neVSh1dDV75YsJDTJkm33d/BhZpkupADuvOiG4aAZgl7ig1pPY0nZXp66l6mUJntI0FbQFKgDXnZ3wQpHxXTYkc8gEzw2Mx7Zp9SK9FmZ2OiwKJrOmc1H/2jBHr54n5tjrlrNvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=GtmDrGgo; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726214461; x=1726473661;
	bh=iyDJEHYIHv3zMkFgFswy2GwRhPDuLo3wwMT62mkDyZc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GtmDrGgoXHAiOQ97YVpac10Iz2v8QIJ6Zih0NUedjqUBFy+M4SDPcN4t7bUSe0OE9
	 YgDJwvr+hSrPhGV1Pvs87ye5HB/dv3VrYweO+XNca1Ox1E84/EJXJXi5FB69UaaLSx
	 VeuXFTmUDEpcYfrS3hOebb3f1/vC7JnIgkhumMNh710KkCYUG/xm6qEkly3+7f0Ezm
	 ItgBSzv1rPT5e0N2JxapWBEp6HBdy4FwV9CIg9reMw3aXlbmkO1WzqvhrRqM/Pj4cS
	 oL1hkeqA9dohCG5WmmhRX7tuVtTSgJ8mRdesA7F9wVdOO7aFJzo9c6R+OmGCdZVtO2
	 sWFL1G9wD6wqw==
Date: Fri, 13 Sep 2024 08:00:57 +0000
To: Sami Tolvanen <samitolvanen@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Miroslav Benes <mbenes@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <79860bab-4a48-4b6d-ab63-71dd57d6c590@proton.me>
In-Reply-To: <CABCJKufJD6Zea7P_aPHNQQgCMgqkw98-XcvW8hRaTx6kcg4vUw@mail.gmail.com>
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz> <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com> <599892ec-3cf5-4349-984b-7c94f2ba5687@suse.com> <CABCJKuer=O3FnLJNGMg2+-HxFJFUrccTuuHt5OiMpRsAJBvBsg@mail.gmail.com> <2b2d4953-d2a3-4ea2-98a4-078901cfbda3@proton.me> <CABCJKue-YtCQWinad2GW7uJuVN-ZSUmRYttK_PUurJOR51Urgg@mail.gmail.com> <66694e9a-16d1-4d4e-b825-b90707f2b42e@proton.me> <CABCJKufJD6Zea7P_aPHNQQgCMgqkw98-XcvW8hRaTx6kcg4vUw@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 775dd34bad8d236b607b12e5776ebef360e0bc12
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.09.24 00:37, Sami Tolvanen wrote:
> Hi,
>=20
> On Thu, Sep 12, 2024 at 2:58=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> On 12.09.24 22:58, Sami Tolvanen wrote:
>>> That's an interesting point. Is the problem that you cannot assign
>>> arbitrary values to the Rust enum that bindgen generates, or is using
>>> a #define the problem? We could probably just make the hidden enum
>>> values visible to bindgen only if needed.
>>
>> So if I take your example from above add it to our bindgen input, then I
>> get the following output:
>>
>>     pub const e_A: my_own_test_enum =3D 0;
>>     pub const e_B: my_own_test_enum =3D 1;
>>     pub type e_enum =3D core::ffi::c_uint;
>>
>> So it doesn't pick up the other constants at all. That is probably
>> because we haven't enabled the bindgen flag that adds support for
>> function-like macros. If I enable that flag (`--clang-macro-fallback`,
>> then the output becomes:
>>
>>     pub const C: u32 =3D 2;
>>     pub const D: u32 =3D 3;
>>     pub const e_A: e =3D 0;
>>     pub const e_B: e =3D 1;
>>     pub type e =3D ::std::os::raw::c_uint;
>>
>> So it doesn't really work as we would like it to (ie missing e_ prefix).
>=20
> If defines are a problem, we can always use a const int instead. It
> doesn't have to be defined inside the enum either, and probably we can
> add a prefix too.

They might also be a problem, though I haven't checked. It would be best
if they can just stay in the `enum`.

>> But even if bindgen were to start supporting `#define` inside of the
>> enum. It might still have a problem with the `#define`: there is the
>> `--rustified-enum <REGEX>` option for bindgen that would change the
>> output to this:
>>
>>     #[repr(u32)]
>>     #[derive(Debug, Copy, Clone, Hash, PartialEq, Eq)]
>>     pub enum e {
>>         A =3D 0,
>>         B =3D 1,
>>     }
>>
>> Which makes using the values on the Rust side a lot easier, since you
>> get exhaustiveness checks when using `match`. Adding the
>> `--clang-macro-fallback` flag, I get:
>>
>>     pub const C: u32 =3D 2;
>>     pub const D: u32 =3D 3;
>>     #[repr(u32)]
>>     #[derive(Debug, Copy, Clone, Hash, PartialEq, Eq)]
>>     pub enum e {
>>         A =3D 0,
>>         B =3D 1,
>>     }
>>
>> Which is a big problem, because the enum `e` won't have 2 or 3 as valid
>> values (it will be UB to write them to a variable of type `e`).
>=20
> Yes, I sort of thought that this might be an issue. I don't see this
> in bindgen flags right now, are you planning on switching the kernel
> bindgen to use --rustified-enum?

You mean you don't see the `--clang-macro-fallback` option? I think it
was added in version 0.70.0.

> If you do plan to use --rustified-enum, we could just use #ifdef
> __BINDGEN__ to hide the fields from everyone else, but I think we
> might actually need a more generic solution after all. I'll think
> about it a bit more.

Well we don't exactly plan to use `--rustified-enum`, the problem is
that transmuting the integer that C gives us to that enum is UB, when
the integer is not a valid bit pattern for that enum. Instead we would
like to have an option to generate both the Rust-style enum and a
newtype enum that can hold any integer value. We then check at runtime
that the value is in range and error otherwise. This is being worked on
at [1].=20
I would say that it has the same issue that `--rustified-enum` currently
has.

[1]: https://github.com/rust-lang/rust-bindgen/pull/2908

---
Cheers,
Benno


