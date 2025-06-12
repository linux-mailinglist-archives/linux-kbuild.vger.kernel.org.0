Return-Path: <linux-kbuild+bounces-7471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A4AD6E92
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48DF71894DAB
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 11:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24143239E92;
	Thu, 12 Jun 2025 11:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDdWQQHx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6A234971;
	Thu, 12 Jun 2025 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726343; cv=none; b=ELiBgyTCT7bgNHpI01z7nILYPPKc/YKVeMLsXbj9c222DqLzvaUsukKJvrK5VlEGwpuBfuYIj9CF/u6MB08jjDJSvg8Sq2xu4iCdM610oqo3o8V+u2NJg1MI3rFSvZRupgV26teE8ApJaH4wuS5OCV5fVoyDmN0f4yGbdScFI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726343; c=relaxed/simple;
	bh=nLSFvNhhkH/i0AW4xZZyeVQQGE39E68tSVlCKIweu8U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qecp6fc5ByBtxrjn44cgLbaxqJj9dK2td29uwJYb8QxJMBys4JsNVc/md1AxIQ7hAi4yPMzrbSZv4jLKtgW20wi9qIflLb3POXlDinLbtu9l5sdP3WMVcsTHfpUMs/o4Dj/n9omeE9+UiH6nLS0w5r0D4e7Im/WzrDWSUxCrOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDdWQQHx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DCAC4CEEA;
	Thu, 12 Jun 2025 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749726342;
	bh=nLSFvNhhkH/i0AW4xZZyeVQQGE39E68tSVlCKIweu8U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qDdWQQHxflEwGgvLGrA7yFYTJaUyXMY2fWh33EJgxUQf54sqNCRzWvq76JLo+wqKI
	 wi3//16+vXlwMPBe+pMBxdCoW1pvfstM/90sFC6bYA4GKXJ/DLO/RZxmYHp9Lno0w+
	 2R937/rFXe/6yomj5pTMk1Gf1JtK2KJ4KfIspUApGy4+FMb0U0+QsZ1bRhrt14Bc3h
	 fBgKSF5Qnm0sXp8MqYuolV1Z1evNWPWq5k7aTJd+f3igWa3/8h9n/DO2UJvUXfWCap
	 d/WkhRasnbpjeKRrIuV4W1x2gm694q5S79rMhRutgVESoT516W6GsN0lhDFbFaINY/
	 uS4LAnQAnBqOA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Luis Chamberlain" <mcgrof@kernel.org>,  "Danilo
 Krummrich" <dakr@kernel.org>,  "Nicolas Schier"
 <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,  "Fiona
 Behrens" <me@kloenk.dev>,  "Daniel Almeida"
 <daniel.almeida@collabora.com>,  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v12 2/3] rust: add parameter support to the `module!` macro
In-Reply-To: <DAKE43J2GFVF.18KWPFWPZKDM@kernel.org> (Benno Lossin's message of
	"Thu, 12 Jun 2025 09:52:30 +0200")
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
	<20250506-module-params-v3-v12-2-c04d80c8a2b1@kernel.org>
	<D9PW1NI2S6FV.8LA53J87VCML@kernel.org> <87plfazi13.fsf@kernel.org>
	<V29kiTfRcPU-AK3Dk6vAhU4ERR2auWVQO6PRp1TJrOmq3AgagkEMmShjxYAQSx9IkfVtHEVwhYM93UQQhiElJA==@protonmail.internalid>
	<DAKE43J2GFVF.18KWPFWPZKDM@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 12 Jun 2025 13:05:31 +0200
Message-ID: <87ikl1xls4.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Benno Lossin" <lossin@kernel.org> writes:

> On Wed Jun 11, 2025 at 12:31 PM CEST, Andreas Hindborg wrote:
>> "Benno Lossin" <lossin@kernel.org> writes:
>>> On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
>>>> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
>>>> index a3ee27e29a6f..16d300ad3d3b 100644
>>>> --- a/rust/macros/helpers.rs
>>>> +++ b/rust/macros/helpers.rs
>>>> @@ -10,6 +10,17 @@ pub(crate) fn try_ident(it: &mut token_stream::Into=
Iter) -> Option<String> {
>>>>      }
>>>>  }
>>>>
>>>> +pub(crate) fn try_sign(it: &mut token_stream::IntoIter) -> Option<cha=
r> {
>>>> +    let peek =3D it.clone().next();
>>>> +    match peek {
>>>> +        Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D '-' =
=3D> {
>>>
>>> Should we also allow a leading `+`?
>>
>> I would argue no, because rust literals cannot start with `+`.
>
> Makes sense.
>
>>>> +            let _ =3D it.next();
>>>> +            Some(punct.as_char())
>>>> +        }
>>>> +        _ =3D> None,
>>>> +    }
>>>> +}
>>>> +
>>>>  pub(crate) fn try_literal(it: &mut token_stream::IntoIter) -> Option<=
String> {
>>>>      if let Some(TokenTree::Literal(literal)) =3D it.next() {
>>>>          Some(literal.to_string())
>>>> @@ -86,3 +97,17 @@ pub(crate) fn function_name(input: TokenStream) -> =
Option<Ident> {
>>>>      }
>>>>      None
>>>>  }
>>>> +
>>>> +/// Parse a token stream of the form `expected_name: "value",` and re=
turn the
>>>> +/// string in the position of "value".
>>>> +///
>>>> +/// # Panics
>>>> +///
>>>> +/// - On parse error.
>>>> +pub(crate) fn expect_string_field(it: &mut token_stream::IntoIter, ex=
pected_name: &str) -> String {
>>>> +    assert_eq!(expect_ident(it), expected_name);
>>>> +    assert_eq!(expect_punct(it), ':');
>>>> +    let string =3D expect_string(it);
>>>> +    assert_eq!(expect_punct(it), ',');
>>>
>>> This won't allow omitting the trailing comma.
>>
>> This is in line with the rest of the module macro.
>
> Then we should change that:
>
>     https://github.com/Rust-for-Linux/linux/issues/1172
>
>>>> +    string
>>>> +}
>>>
>>> [...]
>>>
>>>> @@ -186,33 +336,35 @@ pub(crate) fn module(ts: TokenStream) -> TokenSt=
ream {
>>>>      let info =3D ModuleInfo::parse(&mut it);
>>>>
>>>>      let mut modinfo =3D ModInfoBuilder::new(info.name.as_ref());
>>>> -    if let Some(author) =3D info.author {
>>>> -        modinfo.emit("author", &author);
>>>> +    if let Some(author) =3D &info.author {
>>>> +        modinfo.emit("author", author);
>>>>      }
>>>> -    if let Some(authors) =3D info.authors {
>>>> +    if let Some(authors) =3D &info.authors {
>>>>          for author in authors {
>>>> -            modinfo.emit("author", &author);
>>>> +            modinfo.emit("author", author);
>>>>          }
>>>>      }
>>>> -    if let Some(description) =3D info.description {
>>>> -        modinfo.emit("description", &description);
>>>> +    if let Some(description) =3D &info.description {
>>>> +        modinfo.emit("description", description);
>>>>      }
>>>>      modinfo.emit("license", &info.license);
>>>> -    if let Some(aliases) =3D info.alias {
>>>> +    if let Some(aliases) =3D &info.alias {
>>>>          for alias in aliases {
>>>> -            modinfo.emit("alias", &alias);
>>>> +            modinfo.emit("alias", alias);
>>>>          }
>>>>      }
>>>> -    if let Some(firmware) =3D info.firmware {
>>>> +    if let Some(firmware) =3D &info.firmware {
>>>>          for fw in firmware {
>>>> -            modinfo.emit("firmware", &fw);
>>>> +            modinfo.emit("firmware", fw);
>>>
>>> I don't like that you have to change all of these.
>>
>> Why not? If I was to write this code in the first place, I would have
>> used a reference rather than pass by value.
>
> That's fine, but do it in a separate commit then.

OK, I can do that =F0=9F=91=8D


Best regards,
Andreas Hindborg




