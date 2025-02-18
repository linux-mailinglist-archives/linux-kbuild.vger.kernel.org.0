Return-Path: <linux-kbuild+bounces-5813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE9CA399D0
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 12:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C9C16B954
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 11:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B76232368;
	Tue, 18 Feb 2025 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1ARIBYX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4692B1B982C;
	Tue, 18 Feb 2025 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739876425; cv=none; b=VH9NxAOozWfiDO/aLaCvEUdN/R6ESMcG+NmQ+Fv22vXvYZLFMsduaE6rPKW4x1rtKiF3H0F8BiyuG3asPutiBGGrfFrHA+I5DCl/dJd1neIP79Tz1Zfhks0W5qYCDvaOJwq91eAjd4e89txgI6ylGWBcT/BV/+rL7eW2BJ/GBHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739876425; c=relaxed/simple;
	bh=zUUqAk/vMjdUFs5MPSbgoOxJ6g2ypdwpwldXNRrIcDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dT9RGB+Jy+T0B8wXEcaVeQeARLi5giDFq5R6uRBNcwqADUSNPbm/0jNtSoUYsUeBL6g9wZ6T22E06Reg+pfvxLPOntDe0BF91lBnLQ742TvYEQPS75+t+bZbN67AblPT6Q/onSWhBnVQmOR9Gz2++EL9T4Ml6KDvysYiosCZED8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1ARIBYX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C7FC4CEEB;
	Tue, 18 Feb 2025 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739876424;
	bh=zUUqAk/vMjdUFs5MPSbgoOxJ6g2ypdwpwldXNRrIcDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=N1ARIBYXCm2M3cg6hIB+SxHoFHhMFZG68G8aQ6If45VRt4ZoepqmwUTX0m/lzQ4c6
	 v+3aTrsEKNaT6f8I6h0Ho+BGBcntrx9O0DMi1E1KWUYE8OalFLReJC2/i/vzn5Nrlz
	 X8xz7T1WEX4msg27NFtwHwaYOA8GvVbCapqEBIErs7Vt/ZcEWStL6Sb+CEi4xxm3eC
	 WA2pyIZPuIXi1tXF1AdU69rd8o94ahaxGKFPQMupPL5TdW5k4PDGCn7ODJ7arPPkug
	 aokJDolbi+KgkO06g/ZIYEWIRar3ErvKTyDzniyKL/GgdS7sdVm4gJ23mdBIMU6ZdR
	 gF7Mi0hq+FUMw==
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
Subject: Re: [PATCH v6 5/6] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <20250212090422.6de4ebf5@eugeo> (Gary Guo's message of "Wed, 12
	Feb 2025 09:04:22 +0000")
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-5-24b297ddc43d@kernel.org>
	<vf__dkyg05tUau0dIoKDIkuUlwyYrMe5z2AJGWdFLOM5GpCYJkB0F5-GkzkIC_cG9LjC_YPrdeVc8884CA7rhQ==@protonmail.internalid>
	<20250211164301.47f8d414@eugeo> <87r04444vd.fsf@kernel.org>
	<O5pKZBbnM7-npfKkWY9MOCBaYYGzCHeRRYPEtl2i8VyUrpEqYg4G-HRezx_UAtX6UBJJ85lw1RoTydv1nDhx0g==@protonmail.internalid>
	<20250212090422.6de4ebf5@eugeo>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 18 Feb 2025 12:00:09 +0100
Message-ID: <8734gbh612.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue, 11 Feb 2025 21:13:10 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>> > On Tue, 11 Feb 2025 16:57:39 +0100
>> > Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> >
>> >> Add the trait `ParseInt` for parsing string representations of integers
>> >> where the string representations are optionally prefixed by a radix
>> >> specifier. Implement the trait for the primitive integer types.
>> >>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> ---
>> >>  rust/kernel/str.rs | 111 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >>  1 file changed, 111 insertions(+)
>> >>
>> >> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> >> index c102adac32757..192cd0ff5974f 100644
>> >> --- a/rust/kernel/str.rs
>> >> +++ b/rust/kernel/str.rs
>> >> @@ -945,3 +945,114 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> >>  macro_rules! fmt {
>> >>      ($($f:tt)*) => ( core::format_args!($($f)*) )
>> >>  }
>> >> +
>> >> +pub mod parse_int {
>> >> +    //! Integer parsing functions for parsing signed and unsigned integers
>> >> +    //! potentially prefixed with `0x`, `0o`, or `0b`.
>> >> +
>> >> +    use crate::alloc::flags;
>> >> +    use crate::prelude::*;
>> >> +    use crate::str::BStr;
>> >> +    use core::ops::Deref;
>> >> +
>> >> +    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
>> >> +    ///
>> >> +    /// [`&BStr`]: kernel::str::BStr
>> >> +    // This is required because the `from_str_radix` function on the primitive
>> >> +    // integer types is not part of any trait.
>> >> +    pub trait FromStrRadix: Sized {
>> >> +        /// Parse `src` to `Self` using radix `radix`.
>> >> +        fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
>> >> +    }
>> >> +
>> >> +    /// Extract the radix from an integer literal optionally prefixed with
>> >> +    /// one of `0x`, `0X`, `0o`, `0O`, `0b`, `0B`, `0`.
>> >> +    fn strip_radix(src: &BStr) -> (u32, &BStr) {
>> >> +        match src.deref() {
>> >> +            [b'0', b'x' | b'X', ..] => (16, &src[2..]),
>> >
>> > This can be written as
>> >
>> > 	[b'0', b'x' | b'X', rest @ ..] => (16, rest),
>> >
>> > to avoid manual indexing. Same for o and b below.
>>
>> error[E0308]: mismatched types
>>    --> /home/aeh/src/linux-rust/module-params/rust/kernel/str.rs:972:52
>>     |
>> 972 |             [b'0', b'x' | b'X', rest @ ..] => (16, rest),
>>     |                                                    ^^^^ expected `&BStr`, found `&[u8]`
>>     |
>>     = note: expected reference `&BStr`
>>                found reference `&[u8]`
>>
>> But I guess I could use the new AsRef impl. Or is it more idiomatic to
>> implement `From<&[u8]> for &BStr` and go with `rest.into()`?
>
> Ah, alright, I missed that this function is operating on BStr instead
> of slice. Keeping the current form is fine then.
>
>>
>> >
>> >> +            [b'0', b'o' | b'O', ..] => (8, &src[2..]),
>> >> +            [b'0', b'b' | b'B', ..] => (2, &src[2..]),
>> >> +            [b'0', ..] => (8, src),
>> >
>> > Perhaps add a comment saying that this isn't using `src[1..]` so `0`
>> > can be parsed.
>>
>> Good idea.
>>
>> >
>> >> +            _ => (10, src),
>> >> +        }
>> >> +    }
>
>> >> +    pub trait ParseInt: FromStrRadix {
>> >> +        /// Parse a string according to the description in [`Self`].
>> >> +        fn from_str(src: &BStr) -> Result<Self> {
>> >> +            match src.iter().next() {
>> >> +                None => Err(EINVAL),
>> >> +                Some(sign @ b'-') | Some(sign @ b'+') => {
>> >> +                    let (radix, digits) = strip_radix(BStr::from_bytes(&src[1..]));
>> >> +                    let mut n_digits: KVec<u8> =
>> >> +                        KVec::with_capacity(digits.len() + 1, flags::GFP_KERNEL)?;
>> >> +                    n_digits.push(*sign, flags::GFP_KERNEL)?;
>> >> +                    n_digits.extend_from_slice(digits, flags::GFP_KERNEL)?;
>> >
>> > I think my comment from a previous series saying that this shouldn't
>> > need allocation is not addressed.
>>
>> Thanks for noticing. This is the discussion from v4:
>>
>> >> I don't think we should allocate for parsing. This can trivially be a
>> >> non-allocating. Just check that the next byte is an ASCII digit (reject
>> >> if so, in case people give multiple signs), and then from_str_radix and
>> >> return as is or use `checked_neg`.
>> >
>> >The issue with that approach is that 2s complement signed integer types
>> >of width `b` can assume values from -2^(b-1) to (2^(b-1))-1. We would
>> >reject the value -2^(b-1) when trying to parse as 2^(b-1).
>> >
>> >We could parse into an unsigned type, but it gets kind of clunky.
>
> I would say either that or just call into kstrto* family.

Right. I'll rather parse into i128 than call into that.


Best regards,
Andreas Hindborg




