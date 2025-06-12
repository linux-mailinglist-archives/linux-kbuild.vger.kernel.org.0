Return-Path: <linux-kbuild+bounces-7466-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59249AD6993
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 09:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24735169263
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 07:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E85221D3F8;
	Thu, 12 Jun 2025 07:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvsXXCC7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2701A2C27;
	Thu, 12 Jun 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714757; cv=none; b=foKKwFZ4/8AQYFLS60UDWq19gwrZJbesLVScs4sPlg+yzicHipzMUv7FLxcpzTCVlMiA1wHIovsBBEq5txkFxuR/KIITaATzczSWzssBziO05vsIugInQLlNPHibvdcilMBk6yMBT1Xk+FJBXepx5fdjZ0iN3fv166HsFG64uuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714757; c=relaxed/simple;
	bh=XDYpiXL0YgJGP5OYcuDOmZzd3y95TyZawtDgvIGv3Gs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XhfzyyeVer++Nf8DgBkBtdaw9BDE6gFRe4wBEEStkTF0mGfYZRmvVEhGtw+orFCAgFEZCZfsVS2YD2tBYnnzt+58xtfXdAjmVbzRdzy8MlZq6GjSrf7OOJnw+vvepCkHv5yhPHV94DwxUB9I+O2r1M7ThLV2D1gtthmtUQJDjYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvsXXCC7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46155C4CEEA;
	Thu, 12 Jun 2025 07:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749714756;
	bh=XDYpiXL0YgJGP5OYcuDOmZzd3y95TyZawtDgvIGv3Gs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nvsXXCC7wOvekjkL2fqe1+gNHcZZJhVlIQxY9H25drq6mmIufm+EmSvAWgj1BfViE
	 DTS8nrp86IfrxVCimYwZKtpefyALf6a8m66g62CNdZ7fYxryw9kJFVPIpeIPOzDwxm
	 ffa6Nu8+pM/YNuFiIm9oyAr5yJECdktEpbgRi/B84Bk/Dno6C/5BQiT4Q4jKIsm+On
	 rty18bxoRCafn3iXIuUjGDpboVfiHmoVzaSDc0zCAA5g6Itrhy+qeS81ijraDDmr0n
	 p3x3Wrjcynk3X1mL9qV2v7vSmi6QLEYqLp7tHdcKmbGEfzgNHjUUGNk6D6a0cF7ET5
	 gZXZVUvyJWRug==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 09:52:30 +0200
Message-Id: <DAKE43J2GFVF.18KWPFWPZKDM@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>, "Alice
 Ryhl" <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Trevor Gross" <tmgross@umich.edu>, "Adam
 Bratschi-Kaye" <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v12 2/3] rust: add parameter support to the `module!`
 macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
 <20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org>
 <D9PW1NI2S6FV.8LA53J87VCML@kernel.org> <87plfazi13.fsf@kernel.org>
In-Reply-To: <87plfazi13.fsf@kernel.org>

On Wed Jun 11, 2025 at 12:31 PM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
>>> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
>>> index a3ee27e29a6f..16d300ad3d3b 100644
>>> --- a/rust/macros/helpers.rs
>>> +++ b/rust/macros/helpers.rs
>>> @@ -10,6 +10,17 @@ pub(crate) fn try_ident(it: &mut token_stream::IntoI=
ter) -> Option<String> {
>>>      }
>>>  }
>>> =20
>>> +pub(crate) fn try_sign(it: &mut token_stream::IntoIter) -> Option<char=
> {
>>> +    let peek =3D it.clone().next();
>>> +    match peek {
>>> +        Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D '-' =
=3D> {
>>
>> Should we also allow a leading `+`?
>
> I would argue no, because rust literals cannot start with `+`.

Makes sense.

>>> +            let _ =3D it.next();
>>> +            Some(punct.as_char())
>>> +        }
>>> +        _ =3D> None,
>>> +    }
>>> +}
>>> +
>>>  pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> Option<S=
tring> {
>>>      if let Some(TokenTree::Literal(literal)) =3D it.next() {
>>>          Some(literal.to_string())
>>> @@ -86,3 +97,17 @@ pub(crate) fn function_name(input: TokenStream) -> O=
ption<Ident> {
>>>      }
>>>      None
>>>  }
>>> +
>>> +/// Parse a token stream of the form `expected_name: "value",` and ret=
urn the
>>> +/// string in the position of "value".
>>> +///
>>> +/// # Panics
>>> +///
>>> +/// - On parse error.
>>> +pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, exp=
ected_name: &str) -> String {
>>> +    assert_eq!(expect_ident(it), expected_name);
>>> +    assert_eq!(expect_punct(it), ':');
>>> +    let string =3D expect_string(it);
>>> +    assert_eq!(expect_punct(it), ',');
>>
>> This won't allow omitting the trailing comma.
>
> This is in line with the rest of the module macro.

Then we should change that:

    https://github.com/Rust-for-Linux/linux/issues/1172

>>> +    string
>>> +}
>>
>> [...]
>>
>>> @@ -186,33 +336,35 @@ pub(crate) fn module(ts: TokenStream) -> TokenStr=
eam {
>>>      let info =3D ModuleInfo::parse(&mut it);
>>> =20
>>>      let mut modinfo =3D ModInfoBuilder::new(info.name.as_ref());
>>> -    if let Some(author) =3D info.author {
>>> -        modinfo.emit("author", &author);
>>> +    if let Some(author) =3D &info.author {
>>> +        modinfo.emit("author", author);
>>>      }
>>> -    if let Some(authors) =3D info.authors {
>>> +    if let Some(authors) =3D &info.authors {
>>>          for author in authors {
>>> -            modinfo.emit("author", &author);
>>> +            modinfo.emit("author", author);
>>>          }
>>>      }
>>> -    if let Some(description) =3D info.description {
>>> -        modinfo.emit("description", &description);
>>> +    if let Some(description) =3D &info.description {
>>> +        modinfo.emit("description", description);
>>>      }
>>>      modinfo.emit("license", &info.license);
>>> -    if let Some(aliases) =3D info.alias {
>>> +    if let Some(aliases) =3D &info.alias {
>>>          for alias in aliases {
>>> -            modinfo.emit("alias", &alias);
>>> +            modinfo.emit("alias", alias);
>>>          }
>>>      }
>>> -    if let Some(firmware) =3D info.firmware {
>>> +    if let Some(firmware) =3D &info.firmware {
>>>          for fw in firmware {
>>> -            modinfo.emit("firmware", &fw);
>>> +            modinfo.emit("firmware", fw);
>>
>> I don't like that you have to change all of these.
>
> Why not? If I was to write this code in the first place, I would have
> used a reference rather than pass by value.

That's fine, but do it in a separate commit then.

>> Can't you just take a
>> `&[Parameter]` argument in `emit_params` instead of the whole
>> `ModuleInfo` struct?
>
> I don't think that is a nice solution. I would have to pass the name
> field as well, increasing the number of parameters to the function.

Ah right makes sense.

---
Cheers,
Benno

