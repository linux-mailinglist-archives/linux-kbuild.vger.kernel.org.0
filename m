Return-Path: <linux-kbuild+bounces-6985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CF7AADA96
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 10:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2AE1BA7550
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 08:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E125204097;
	Wed,  7 May 2025 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SMrtRN7W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF003149C64;
	Wed,  7 May 2025 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608296; cv=none; b=pT2w/vociIqmW6mec/bmRdemDn+iGi+brOBXXmZNEZ2ZfJFDJOeTCnWSHOV13mP8ynoPVJvjY6OVwAo/0D2Offh7g+64TpGYQDXlk7GrfzjeycKOblSjurZV5rRxRYYpEgX0FlU0XZ6oEh0/zGo9i4p6d1KBW3jid+ue84qBjxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608296; c=relaxed/simple;
	bh=lpLYWTvwCD9ibFjrHBDefiW1/xmwvteVjOwcFqoHT9Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=sTQeQyMixfuP+TBiTW7U3tOcvNs8KgOY05ZzjrjCP9488j9jJTnRlP3EoJDWU13bfcJ0hD2wVJxs2VIziY7WgecZvGFeq4nztojW0YquKPNmttATs6I7Z/sRvydikEICRCcR8pN9r6kpO7Tww4XsEW4K3pgPKOGB1te4WbOpjzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SMrtRN7W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B329C4CEE7;
	Wed,  7 May 2025 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746608295;
	bh=lpLYWTvwCD9ibFjrHBDefiW1/xmwvteVjOwcFqoHT9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SMrtRN7WHuITA7k8CqvBVY1rQVRkZt4CichuUXA6AxxTIKXgtbscdi+UPROmuiwhd
	 XKxaDqNH/46G52FnAwCofXYsBmZG8TWeB1IJ+fzJ2icLDvWNYz1EMBOVZQRuDVp+Xm
	 wKsCWrCUvSltGBH2sSBp3ZbPuuH6TOoQFHNk341KUdquOffXKIzeVGUivQOhaoiEC/
	 lCauskOTTVozvLQ6dVsjylDOLEhPIbEVoa54To55oaPkC0ZsVE3StaAzB453ir1Wdo
	 +fyLWJ9xx0dFETF6XrrzJNmXu9j5tIVYbO3BqGbmF1+QfsRVuwZzK5sYONvBZs9rcY
	 W/l12eN5WjHag==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 10:58:08 +0200
Message-Id: <D9PSYQMCW74W.39JB3NDCWB2H3@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Alice Ryhl" <aliceryhl@google.com>, "Masahiro
 Yamada" <masahiroy@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Adam Bratschi-Kaye"
 <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v12 1/3] rust: str: add radix prefixed integer parsing
 functions
X-Mailer: aerc 0.20.1
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
 <20250506-module-params-v3-v12-1-c04d80c8a2b1@kernel.org>
In-Reply-To: <20250506-module-params-v3-v12-1-c04d80c8a2b1@kernel.org>

On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 878111cb77bc..174e70397305 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -573,7 +573,6 @@ macro_rules! c_str {
>  }
> =20
>  #[cfg(test)]
> -#[expect(clippy::items_after_test_module)]
>  mod tests {
>      use super::*;
> =20
> @@ -946,3 +945,174 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::R=
esult {
>  macro_rules! fmt {
>      ($($f:tt)*) =3D> ( core::format_args!($($f)*) )
>  }
> +
> +/// Integer parsing functions for parsing signed and unsigned integers
> +/// potentially prefixed with `0x`, `0o`, or `0b`.
> +pub mod parse_int {

Why not make this its own file? It's 172 lines long already.

> +    pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
> +        /// Parse a string according to the description in [`Self`].
> +        fn from_str(src: &BStr) -> Result<Self> {
> +            match src.deref() {
> +                [b'-', rest @ ..] =3D> {
> +                    let (radix, digits) =3D strip_radix(rest.as_ref());
> +                    // 2's complement values range from -2^(b-1) to 2^(b=
-1)-1.
> +                    // So if we want to parse negative numbers as positi=
ve and
> +                    // later multiply by -1, we have to parse into a lar=
ger
> +                    // integer. We choose `u64` as sufficiently large.
> +                    //
> +                    // NOTE: 128 bit integers are not available on all
> +                    // platforms, hence the choice of 64 bits.
> +                    let val =3D u64::from_str_radix(
> +                        core::str::from_utf8(digits).map_err(|_| EINVAL)=
?,
> +                        radix,
> +                    )
> +                    .map_err(|_| EINVAL)?;
> +
> +                    if val > Self::abs_min() {
> +                        return Err(EINVAL);
> +                    }
> +
> +                    if val =3D=3D Self::abs_min() {
> +                        return Ok(Self::MIN);
> +                    }
> +
> +                    // SAFETY: We checked that `val` will fit in `Self` =
above.
> +                    let val: Self =3D unsafe { val.try_into().unwrap_unc=
hecked() };
> +
> +                    Ok(val.complement())

You're allowing to parse `u32` with a leading `-`? I'd expect an error
in that case. Maybe `complement` should be named `negate` and return a
`Result`?

---
Cheers,
Benno

> +                }
> +                _ =3D> {
> +                    let (radix, digits) =3D strip_radix(src);
> +                    Self::from_str_radix(digits, radix).map_err(|_| EINV=
AL)
> +                }
> +            }
> +        }
> +    }

