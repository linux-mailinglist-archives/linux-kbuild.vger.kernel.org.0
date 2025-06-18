Return-Path: <linux-kbuild+bounces-7555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E13ADF7D0
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 22:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A815717A99A
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Jun 2025 20:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBAD21B9F0;
	Wed, 18 Jun 2025 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GeI1mB3U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68709212FBE;
	Wed, 18 Jun 2025 20:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279087; cv=none; b=awAi4GpVHyPSKgAUSNARXv0wSM3XAHzBPfs3rtRogj3VcB9tmucIJlKz1mzKT4KT2zaq7LkepNPmkSQbWi9WttcET4+AzoioWtUvlPsNfNzYiezLo1HdNWUbV9lH0arNoB/znGHiDfWkBklF+m0oevmoDu26UffNKPc1oPQjFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279087; c=relaxed/simple;
	bh=pKUkHadBq2GOHWoFc3UCNIk7hiTpzfRtUTfl17mqQvk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dpK0JoaHvx81kQlwXnXARs6pOcW6qH2CEO5DY5/kRiiI0vOoX0XNcGn3wIqZPD+WD8yWnHSLqCjZxG9vJS5pjSfAemrKA+sesF0i0Igw+NAj4V5/sGBJvnCbBmvI4Apc1Xb9wHd8TljBA5fmsBaR82QYkbM+C3sx/xv5cXaEC0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeI1mB3U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE90C4CEEF;
	Wed, 18 Jun 2025 20:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750279086;
	bh=pKUkHadBq2GOHWoFc3UCNIk7hiTpzfRtUTfl17mqQvk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=GeI1mB3UxgkQibtMZ3fLSYot4ww/OlooSxYPE5xVw2U8ZCKDQAD2qGvr0lW9BGJYJ
	 mQBAWoj0ux9BaLj3GRGSPS98N1mmGDxvc9vNXrSyXLMQOFNBugMEu7py6+0qnPti3G
	 yrVJLpwdn+sYyb+jnoHwSWwrTVnTMd9AH205IpE+pOCONJtd7ae8mFGbTt+hAF8Jzi
	 Io5UWTFqSD8mefaRiAzOF52nthmpBPD/UDDxGrXzPYrXWEhRZjZPcCdBED9+Yct8tv
	 Y3cC+9FhR55cJMx/okfaQ+0iooy9fBUPMda/PUQNl5kzf1JnogEuvA6ewDRgrrqaG4
	 Qd8jYvVJ2Jajw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 22:38:00 +0200
Message-Id: <DAPY5HF9HGXC.FCEKAMLPFY1H@kernel.org>
Subject: Re: [PATCH v13 1/6] rust: str: add radix prefixed integer parsing
 functions
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <20250612-module-params-v3-v13-1-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-1-bc219cd1a3f8@kernel.org>

On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
> +pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
> +    /// Parse a string according to the description in [`Self`].
> +    fn from_str(src: &BStr) -> Result<Self> {
> +        match src.deref() {
> +            [b'-', rest @ ..] =3D> {
> +                let (radix, digits) =3D strip_radix(rest.as_ref());
> +                // 2's complement values range from -2^(b-1) to 2^(b-1)-=
1.
> +                // So if we want to parse negative numbers as positive a=
nd
> +                // later multiply by -1, we have to parse into a larger
> +                // integer. We choose `u64` as sufficiently large.
> +                //
> +                // NOTE: 128 bit integers are not available on all
> +                // platforms, hence the choice of 64 bits.
> +                let val =3D
> +                    u64::from_str_radix(core::str::from_utf8(digits).map=
_err(|_| EINVAL)?, radix)
> +                        .map_err(|_| EINVAL)?;
> +
> +                if val > Self::abs_min() {
> +                    return Err(EINVAL);
> +                }
> +
> +                if val =3D=3D Self::abs_min() {
> +                    return Ok(Self::MIN);
> +                }
> +
> +                // SAFETY: We checked that `val` will fit in `Self` abov=
e.

Sorry that it took me this long to realize, but this seems pretty weird.
I guess this is why the `FromStrRadix` is `unsafe`.

Can we just move this part of the code to `FromStrRadix` and make that
trait safe?

So essentially have:

    fn from_u64(value: u64) -> Result<Self>;

in `FromStrRadix` and remove `MIN`, `abs_min` and `complement`. Then
implement it like this in the macro below:

    const ABS_MIN =3D /* existing abs_min impl */;
    if value > ABS_MIN {
        return Err(EINVAL);
    }
    if val =3D=3D ABS_MIN {
        return Ok(<$ty>::MIN);
    }
    // SAFETY: We checked that `val` will fit in `Self` above.
    let val: $ty =3D unsafe { val.try_into().unwrap_unchecked() };
    (!val).wrapping_add(1)

The reason that this is fine and the above is "weird" is the following:
The current version only has `Self: FromStrRadix` which gives it access
to the following guarantee from the `unsafe` trait:

    /// The member functions of this trait must be implemented according to
    /// their documentation.
    ///
    /// [`&BStr`]: kernel::str::BStr

This doesn't mention `TryFrom<u64>` and thus the comment "We checked
that `val` will fit in `Self` above" doesn't really apply: how does
checking with the bounds given in `FromStrRadix` make `TryFrom` return
`Ok`?

If we move this code into the implementation of `FromStrRadix`, then we
are locally in a context where we *know* the concrete type of `Self` and
can thus rely on "checking" being the correct thing for `TryFrom`.

With this adjustment, I can give my RB, but please let me take a look
before you send it again :)

---
Cheers,
Benno

> +                let val: Self =3D unsafe { val.try_into().unwrap_uncheck=
ed() };
> +
> +                Ok(val.complement())
> +            }
> +            _ =3D> {
> +                let (radix, digits) =3D strip_radix(src);
> +                Self::from_str_radix(digits, radix).map_err(|_| EINVAL)
> +            }
> +        }
> +    }
> +}

