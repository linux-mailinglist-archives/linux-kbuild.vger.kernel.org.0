Return-Path: <linux-kbuild+bounces-5874-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BF1A420CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D12918895AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55FC24888F;
	Mon, 24 Feb 2025 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="WuvLQuQs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C012571B8;
	Mon, 24 Feb 2025 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404108; cv=pass; b=BvbIuBovx/WnzUan2LAdHz7eeRZx0KTfwCKh/77N8OfJwWyMcmOhGd93cjlmEiia1hjNqtYpI5iQNtHJVP3Zu/wYWX1Z3WetHk0eSJ+TYuleFOswCvPh+GGr5plDFyQrPFxWNpZ+hIUllhITWkAioecZWZpjTLtQkpHwpPUBSIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404108; c=relaxed/simple;
	bh=G1jGWJA4NrjXlJ+hxhzJ6xPeJRpNzWz5urbgWiq8t3Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=V3x/K74OyqC6PhVlJqJkWAZ/0GOZibacWSjnosKtAChYpRnLv86OClC37RuEby4ZdMzbZxc/oiASZVxUV4agUzZHqtu7oiRK1l+oYjFnGpG2Uu7W5p5NfkgXTbQClw+NOCJJGTs5vmHWxeTCetAFPxtvxrCtUaVFWLqPIFAXvXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=WuvLQuQs; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740404072; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z3cI6qQjzheVeMhhAsDqNTIMwwxD89/v88yYnU2BXvR6z8SDOb2veHvqdsgmrh8sXefJeeR12GL34IAJ57ea5KvwRCEDyz07qw+cZejBLIfge9u4gOCyVDA0QZatqWs/g+X5LYHAwn5Xk6JVmzVQAPSyO/E10C4ZSDdQpNsVPVo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740404072; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I4H0hqtSmFScFdRXR8s/J4Ov5Du5gEU3Mi8+eG/7XO0=; 
	b=AckAe3gUEC95yv8WcbWU8ky210IH2duXPUkPcz4IL13Y8WZTyccvne/pGpchBccsFF2Bxvb0WrLbSOaNEWTzoDcBngtJIz7yLYai1fKuGJ3XPiEBmjw7phAPd8DD+w7cfUVJZST/Gm2ZRurx5efyhQHNlotP4GM48vGN9Wcav0E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740404072;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=I4H0hqtSmFScFdRXR8s/J4Ov5Du5gEU3Mi8+eG/7XO0=;
	b=WuvLQuQsuDImxNyUg778odbihvyH68oDIVWoDMHnXMjPBrSFpwlQ7i0PUoQpv/vz
	Mcj+FwoKde2etvvRNJ9wupRJBFbxZrF6w1WaXNXiGV0ZwsKiBY0+IrgEjnxZOSdKyOH
	1tsHFqeX1mRxw40Fwt5JxArOEYHtjIKmtvvzLInw=
Received: by mx.zohomail.com with SMTPS id 1740404070516248.56290516055526;
	Mon, 24 Feb 2025 05:34:30 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v7 5/6] rust: str: add radix prefixed integer parsing
 functions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>
Date: Mon, 24 Feb 2025 10:34:11 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Adam Bratschi-Kaye <ark.email@gmail.com>,
 linux-kbuild@vger.kernel.org,
 Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>,
 linux-modules@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <24221C62-2470-4B03-B39B-58BCDC500D68@collabora.com>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Andreas,

> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> =
wrote:
>=20
> Add the trait `ParseInt` for parsing string representations of =
integers
> where the string representations are optionally prefixed by a radix
> specifier. Implement the trait for the primitive integer types.
>=20
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> rust/kernel/str.rs | 118 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 118 insertions(+)
>=20
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index db272d2198fcc..8b0d814b47f52 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -945,3 +945,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> =
fmt::Result {
> macro_rules! fmt {
>     ($($f:tt)*) =3D> ( core::format_args!($($f)*) )
> }
> +
> +pub mod parse_int {
> +    //! Integer parsing functions for parsing signed and unsigned =
integers
> +    //! potentially prefixed with `0x`, `0o`, or `0b`.
> +
> +    use crate::prelude::*;
> +    use crate::str::BStr;
> +    use core::ops::Deref;
> +
> +    /// Trait that allows parsing a [`&BStr`] to an integer with a =
radix.
> +    ///
> +    /// [`&BStr`]: kernel::str::BStr
> +    // This is required because the `from_str_radix` function on the =
primitive
> +    // integer types is not part of any trait.
> +    pub trait FromStrRadix: Sized {

Is this supposed to be implemented by somebody else? Otherwise we should =
seal it,
perhaps?


> +        /// Parse `src` to `Self` using radix `radix`.
> +        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, =
crate::error::Error>;
> +    }
> +
> +    /// Extract the radix from an integer literal optionally prefixed =
with
> +    /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
> +    fn strip_radix(src: &BStr) -> (u32, &BStr) {
> +        match src.deref() {
> +            [b'0', b'x' | b'X', rest @ ..] =3D> (16, rest.as_ref()),
> +            [b'0', b'o' | b'O', rest @ ..] =3D> (8, rest.as_ref()),
> +            [b'0', b'b' | b'B', rest @ ..] =3D> (2, rest.as_ref()),
> +            // NOTE: We are including the leading zero to be able to =
parse
> +            // literal 0 here. If we removed it as a radix prefix, we =
would not
> +            // be able to parse `0`.
> +            [b'0', ..] =3D> (8, src),
> +            _ =3D> (10, src),
> +        }
> +    }
> +
> +    /// Trait for parsing string representations of integers.
> +    ///
> +    /// Strings beginning with `0x`, `0o`, or `0b` are parsed as hex, =
octal, or
> +    /// binary respectively. Strings beginning with `0` otherwise are =
parsed as
> +    /// octal. Anything else is parsed as decimal. A leading `+` or =
`-` is also
> +    /// permitted. Any string parsed by [`kstrtol()`] or =
[`kstrtoul()`] will be
> +    /// successfully parsed.
> +    ///
> +    /// [`kstrtol()`]: =
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtol
> +    /// [`kstrtoul()`]: =
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtoul=

> +    ///
> +    /// # Example
> +    /// ```
> +    /// use kernel::str::parse_int::ParseInt;
> +    /// use kernel::b_str;
> +    ///
> +    /// assert_eq!(Ok(0), u8::from_str(b_str!("0")));
> +    ///
> +    /// assert_eq!(Ok(0xa2u8), u8::from_str(b_str!("0xa2")));
> +    /// assert_eq!(Ok(-0xa2i32), i32::from_str(b_str!("-0xa2")));
> +    ///
> +    /// assert_eq!(Ok(-0o57i8), i8::from_str(b_str!("-0o57")));
> +    /// assert_eq!(Ok(0o57i8), i8::from_str(b_str!("057")));
> +    ///
> +    /// assert_eq!(Ok(0b1001i16), i16::from_str(b_str!("0b1001")));
> +    /// assert_eq!(Ok(-0b1001i16), i16::from_str(b_str!("-0b1001")));
> +    ///
> +    /// assert_eq!(Ok(127), i8::from_str(b_str!("127")));
> +    /// assert!(i8::from_str(b_str!("128")).is_err());
> +    /// assert_eq!(Ok(-128), i8::from_str(b_str!("-128")));
> +    /// assert!(i8::from_str(b_str!("-129")).is_err());
> +    /// assert_eq!(Ok(255), u8::from_str(b_str!("255")));
> +    /// assert!(u8::from_str(b_str!("256")).is_err());
> +    /// ```

^ These are passing

> +    pub trait ParseInt: FromStrRadix + TryFrom<i128> {

Should this be sealed too?

> +        /// Parse a string according to the description in [`Self`].
> +        fn from_str(src: &BStr) -> Result<Self> {
> +            match src.deref() {
> +                [b'-', rest @ ..] =3D> {
> +                    let (radix, digits) =3D =
strip_radix(rest.as_ref());
> +                    // 2's complement values range from -2^(b-1) to =
2^(b-1)-1.
> +                    // So if we want to parse negative numbers as =
positive and
> +                    // later multiply by -1, we have to parse into a =
larger
> +                    // integer. We choose i128 as sufficiently large.
> +                    let val =3D i128::from_str_radix(
> +                        core::str::from_utf8(digits).map_err(|_| =
EINVAL)?,
> +                        radix,
> +                    )
> +                    .map_err(|_| EINVAL)?;
> +                    let val =3D -val;
> +                    val.try_into().map_err(|_| EINVAL)
> +                }
> +                _ =3D> {
> +                    let (radix, digits) =3D strip_radix(src);
> +                    Self::from_str_radix(digits, radix).map_err(|_| =
EINVAL)
> +                }
> +            }
> +        }
> +    }
> +
> +    macro_rules! impl_parse_int {
> +        ($ty:ty) =3D> {
> +            impl FromStrRadix for $ty {
> +                fn from_str_radix(src: &BStr, radix: u32) -> =
Result<Self, crate::error::Error> {
> +                    =
<$ty>::from_str_radix(core::str::from_utf8(src).map_err(|_| EINVAL)?, =
radix)
> +                        .map_err(|_| EINVAL)
> +                }
> +            }
> +
> +            impl ParseInt for $ty {}
> +        };
> +    }
> +
> +    impl_parse_int!(i8);
> +    impl_parse_int!(u8);
> +    impl_parse_int!(i16);
> +    impl_parse_int!(u16);
> +    impl_parse_int!(i32);
> +    impl_parse_int!(u32);
> +    impl_parse_int!(i64);
> +    impl_parse_int!(u64);
> +    impl_parse_int!(isize);
> +    impl_parse_int!(usize);
> +}
>=20
> --=20
> 2.47.0
>=20
>=20
>=20

This overall LGTM. See my comment on whether we should seal the traits.



