Return-Path: <linux-kbuild+bounces-6991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4DAADD59
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 13:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 796E31BC2314
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26DF023312D;
	Wed,  7 May 2025 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MP6Qgwtg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C221B9F1;
	Wed,  7 May 2025 11:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617350; cv=none; b=QuKdOlQNpBxzokehgIOBPOEs/9q1MlLgtBpxK1+hBoFQhudswRAxj6N5dx9eZ3u1H3ouKTxKGFeO7o8oSAjjUmq1JZvXD1Z6ZFNFTD4YUmPpI+nmIzVHCHIg+OhfFE6CqPA4qGdhxLb+BLJOJ6lO57Kd6hvp5tVaMs5DoZDeKfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617350; c=relaxed/simple;
	bh=Nj51xk3On+TtmHT8qaq83NkgnSPFnqdrPPmzZbTtP/4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XoEKW0Q212oPinaX8th/+ffmggMp1g4PYAupC+VWqsS78uXTyqAXlWnFPZJ+DXlHIwcRYaknHC2Rp1+W6YCjcQbOcPa22HGin2HBE51912paVTpJ8EDFztEcBFc2x1z2ndWXZrC95kq8rIlcwqI+1gcfhvJr3G9WDjYrUeyRgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MP6Qgwtg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F3FC4CEE7;
	Wed,  7 May 2025 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746617349;
	bh=Nj51xk3On+TtmHT8qaq83NkgnSPFnqdrPPmzZbTtP/4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=MP6QgwtgiwX43sT7HLeQtFhX4UvOm3pfA5NjzhEmHrtcG1WpDWnR9FsK44Cw6Mwbc
	 IrbkWyqM2EdUXMyT1YfzSSIR65I9aWdkds5pEYnyO7ft2hS6VrXb8IT7KQVBhoia18
	 Li1EnuAptFTtN7q0RUTMBFKKtzg7aNeLSLESS3YgmCaVDKnWPj51Ivr3X1jOc6ZRYN
	 xuymiZQ815+y/q+Hm4Gr1/zOHnIxI0yA7J3OHoxXSf2Z+AlvCiHsU9p5by5ZMGECVT
	 sFlhOICs4r8Xaj+SHSsJ9SP3W5MuqTXMBI2n8vB5ImcClRrgJypm6Q/yxf2LfZJYsl
	 0hhxurz8WW7+A==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 13:29:03 +0200
Message-Id: <D9PW6AGXCWM8.31IPHEJLS9SNZ@kernel.org>
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
Subject: Re: [PATCH v12 1/3] rust: str: add radix prefixed integer parsing
 functions
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
 <20250506-module-params-v3-v12-1-c04d80c8a2b1@kernel.org>
 <UfD3pllWu8O_qAKsi04IMH1WGszkDe31KpLs7oMvDsUC-tryEbrYKmtDAPj5w-BO2CyZ8_S_G5lWBE2Ud72n8w==@protonmail.internalid> <D9PSYQMCW74W.39JB3NDCWB2H3@kernel.org> <87ldr8pys8.fsf@kernel.org>
In-Reply-To: <87ldr8pys8.fsf@kernel.org>

On Wed May 7, 2025 at 11:15 AM CEST, Andreas Hindborg wrote:
> "Benno Lossin" <lossin@kernel.org> writes:
>> On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
>>> +    pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
>>> +        /// Parse a string according to the description in [`Self`].
>>> +        fn from_str(src: &BStr) -> Result<Self> {
>>> +            match src.deref() {
>>> +                [b'-', rest @ ..] =3D> {
>>> +                    let (radix, digits) =3D strip_radix(rest.as_ref())=
;
>>> +                    // 2's complement values range from -2^(b-1) to 2^=
(b-1)-1.
>>> +                    // So if we want to parse negative numbers as posi=
tive and
>>> +                    // later multiply by -1, we have to parse into a l=
arger
>>> +                    // integer. We choose `u64` as sufficiently large.
>>> +                    //
>>> +                    // NOTE: 128 bit integers are not available on all
>>> +                    // platforms, hence the choice of 64 bits.
>>> +                    let val =3D u64::from_str_radix(
>>> +                        core::str::from_utf8(digits).map_err(|_| EINVA=
L)?,
>>> +                        radix,
>>> +                    )
>>> +                    .map_err(|_| EINVAL)?;
>>> +
>>> +                    if val > Self::abs_min() {
>>> +                        return Err(EINVAL);
>>> +                    }
>>> +
>>> +                    if val =3D=3D Self::abs_min() {
>>> +                        return Ok(Self::MIN);
>>> +                    }
>>> +
>>> +                    // SAFETY: We checked that `val` will fit in `Self=
` above.
>>> +                    let val: Self =3D unsafe { val.try_into().unwrap_u=
nchecked() };
>>> +
>>> +                    Ok(val.complement())
>>
>> You're allowing to parse `u32` with a leading `-`? I'd expect an error
>> in that case. Maybe `complement` should be named `negate` and return a
>> `Result`?
>
> You would get `Err(EINVAL)` in that case, hitting this:
>
>   if val > Self::abs_min() {
>       return Err(EINVAL);
>   }

Ah, I think I asked this in a previous version already... Thanks.

---
Cheers,
Benno

