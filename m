Return-Path: <linux-kbuild+bounces-5617-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C31AA26ECF
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 10:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B786D166B44
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 09:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5A9209F48;
	Tue,  4 Feb 2025 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnL6N78f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870A413A258;
	Tue,  4 Feb 2025 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662738; cv=none; b=M8TFOTP2KXV+6j8qRlqwyQryJoBqTD19PP8KYOdPnBA7bSORhfiKt4fzaDc4sTBqywML80g1bySnxnTeHRaSxusFSCDH74Cwc0/0uFWgua+xIzkX1ro3Y0UVQ+LokHrsU1IzzLD9fq7gp6UCzmYdCjxghW46farhJSVvdWTp5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662738; c=relaxed/simple;
	bh=7YjY5Y/y9g8pANkXmwohE9fjChn9L6CLgPLOeAGWmGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rDGh6okLf7GdDUHfeSL9zZcoL3jWneCWgNWdm+DuNNPNdpRtLLO+wJg+wQiW/CzfVfQDbu8yP6g6ZL2QVnCdQi8MGasA1+PvNZIak1UhOSESl+YrfU1HUK1jNSGx8NbQ+7DqAlIv19R6X5FHXWOKEoCvKBypI0hkImXiixVwOoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnL6N78f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A977C4CEE4;
	Tue,  4 Feb 2025 09:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738662735;
	bh=7YjY5Y/y9g8pANkXmwohE9fjChn9L6CLgPLOeAGWmGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SnL6N78f5qQaSmTKzfELbe+l5OSA4107TP6sJNUDhNxcS/SL7xl/C4e8rPOvcxoHI
	 Ajnk88R7b2D7g7K20dN6+05oAt5tYYia43zexOVIBEpzqzT6hVW6JgOGfntKOgTIQ/
	 YqFdEuE0UxkA8ZpFHEkNaoj5yVopiQz1a6T4224yIlW0AWt/J6cmKRpkSQsRBs2VrR
	 wIes/vTYFfjrcMNmQQ2LPT2+hdgG8L/Z3d8xUAT/dk/nJafWs6OEkR57qBPgXzb9uD
	 +aj1NYlcBKHS/Mlfo9H0DOfIfsBFtVBgkRQRhFIaoBfLwielrGkcy7WYEAJ8zMopAs
	 dhPjJVRidk9dA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Masahiro
 Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,  "Adam
 Bratschi-Kaye" <ark.email@gmail.com>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>,  "Petr
 Pavlu" <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <20250115194229.04cd1068.gary@garyguo.net> (Gary Guo's message of
	"Wed, 15 Jan 2025 19:42:29 +0000")
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
	<20250109-module-params-v3-v4-3-c208bcfbe11f@kernel.org>
	<2dAu_rNb_lYG0bzL-SV9gQteXT63njXIGZ2X9FhQqA0R9C79piRw2S_xCZZeKKLekNEZQwc086H_mdNd7_9kSQ==@protonmail.internalid>
	<20250115194229.04cd1068.gary@garyguo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 10:51:58 +0100
Message-ID: <87wme6jav5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Gary,

Sorry, I missed this email when sending v5. Thanks for the comments!

"Gary Guo" <gary@garyguo.net> writes:

> On Thu, 09 Jan 2025 11:54:58 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> Add the trait `ParseInt` for parsing string representations of integers
>> where the string representations are optionally prefixed by a radix
>> specifier. Implement the trait for the primitive integer types.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/str.rs | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> index 9c446ff1ad7adba7ca09a5ae9df00fd369a32899..14da40213f9eafa07a104eba3129efe07c8343f3 100644
>> --- a/rust/kernel/str.rs
>> +++ b/rust/kernel/str.rs
>> @@ -914,3 +914,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>  macro_rules! fmt {
>>      ($($f:tt)*) => ( core::format_args!($($f)*) )
>>  }
>> +
>> +pub mod parse_int {
>> +    //! Integer parsing functions for parsing signed and unsigned integers
>> +    //! potentially prefixed with `0x`, `0o`, or `0b`.
>> +
>> +    use crate::alloc::flags;
>> +    use crate::prelude::*;
>> +    use crate::str::BStr;
>> +
>> +    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
>> +    ///
>> +    /// [`&BStr`]: kernel::str::BStr
>> +    // This is required because the `from_str_radix` function on the primitive
>> +    // integer types is not part of any trait.
>> +    pub trait FromStrRadix: Sized {
>> +        /// Parse `src` to `Self` using radix `radix`.
>> +        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
>> +    }
>> +
>> +    /// Extract the radix from an integer literal optionally prefixed with
>> +    /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
>> +    fn strip_radix(src: &BStr) -> (u32, &BStr) {
>> +        if let Some(n) = src.strip_prefix(b_str!("0x")) {
>> +            (16, n)
>> +        } else if let Some(n) = src.strip_prefix(b_str!("0X")) {
>> +            (16, n)
>> +        } else if let Some(n) = src.strip_prefix(b_str!("0o")) {
>> +            (8, n)
>> +        } else if let Some(n) = src.strip_prefix(b_str!("0O")) {
>> +            (8, n)
>> +        } else if let Some(n) = src.strip_prefix(b_str!("0b")) {
>> +            (2, n)
>> +        } else if let Some(n) = src.strip_prefix(b_str!("0B")) {
>> +            (2, n)
>> +        } else if let Some(n) = src.strip_prefix(b_str!("0")) {
>> +            (8, n)
>> +        } else {
>> +            (10, src)
>> +        }
>
> This can be done better with a match:
>
> match src.deref() {
>     [b'0', b'x' | b'X', ..] => (16, &src[2..]),
>     [b'0', b'o' | b'O', ..] => (8, &src[2..]),
>     [b'0', b'b' | b'B', ..] => (2, &src[2..]),
>     [b'0', ..] => (8, &src[1..]),
>     _ => (10, src),
> }

Thanks, will add. I was not aware that matching syntax was this powerful.

>
>> +    }
>> +
>> +    /// Trait for parsing string representations of integers.
>> +    ///
>> +    /// Strings beginning with `0x`, `0o`, or `0b` are parsed as hex, octal, or
>> +    /// binary respectively. Strings beginning with `0` otherwise are parsed as
>> +    /// octal. Anything else is parsed as decimal. A leading `+` or `-` is also
>> +    /// permitted. Any string parsed by [`kstrtol()`] or [`kstrtoul()`] will be
>> +    /// successfully parsed.
>> +    ///
>> +    /// [`kstrtol()`]: https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtol
>> +    /// [`kstrtoul()`]: https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.kstrtoul
>> +    ///
>> +    /// # Example
>> +    /// ```
>> +    /// use kernel::str::parse_int::ParseInt;
>> +    /// use kernel::b_str;
>> +    ///
>> +    /// assert_eq!(Ok(0xa2u8), u8::from_str(b_str!("0xa2")));
>> +    /// assert_eq!(Ok(-0xa2i32), i32::from_str(b_str!("-0xa2")));
>> +    ///
>> +    /// assert_eq!(Ok(-0o57i8), i8::from_str(b_str!("-0o57")));
>> +    /// assert_eq!(Ok(0o57i8), i8::from_str(b_str!("057")));
>> +    ///
>> +    /// assert_eq!(Ok(0b1001i16), i16::from_str(b_str!("0b1001")));
>> +    /// assert_eq!(Ok(-0b1001i16), i16::from_str(b_str!("-0b1001")));
>> +    ///
>> +    /// assert_eq!(Ok(127), i8::from_str(b_str!("127")));
>> +    /// assert!(i8::from_str(b_str!("128")).is_err());
>> +    /// assert_eq!(Ok(-128), i8::from_str(b_str!("-128")));
>> +    /// assert!(i8::from_str(b_str!("-129")).is_err());
>> +    /// assert_eq!(Ok(255), u8::from_str(b_str!("255")));
>> +    /// assert!(u8::from_str(b_str!("256")).is_err());
>> +    /// ```
>> +    pub trait ParseInt: FromStrRadix {
>> +        /// Parse a string according to the description in [`Self`].
>> +        fn from_str(src: &BStr) -> Result<Self> {
>> +            match src.iter().next() {
>> +                None => Err(EINVAL),
>> +                Some(sign @ b'-') | Some(sign @ b'+') => {
>> +                    let (radix, digits) = strip_radix(BStr::from_bytes(&src[1..]));
>> +                    let mut n_digits: KVec<u8> =
>> +                        KVec::with_capacity(digits.len() + 1, flags::GFP_KERNEL)?;
>
> I don't think we should allocate for parsing. This can trivially be a
> non-allocating. Just check that the next byte is an ASCII digit (reject
> if so, in case people give multiple signs), and then from_str_radix and
> return as is or use `checked_neg`.

The issue with that approach is that 2s complement signed integer types
of width `b` can assume values from -2^(b-1) to (2^(b-1))-1. We would
reject the value -2^(b-1) when trying to parse as 2^(b-1).

We could parse into an unsigned type, but it gets kind of clunky.

Another option is to stop relying on `from_str_radix` from core and roll
our own that takes sign as a separate function argument.


Best regards,
Andreas Hindborg



