Return-Path: <linux-kbuild+bounces-7570-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8DFAE0619
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 14:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0286F177B9D
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 12:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471A623D2A0;
	Thu, 19 Jun 2025 12:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLHnHJyn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134AF22B598;
	Thu, 19 Jun 2025 12:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336899; cv=none; b=OAMXAVKP2lZYApprf7lgzNDnGsd9w0J09eCtY68MyUXYWiGj/IFFKJjrkmWhzidC1tTNZHbqw9kZ9osiTlywG7PPAQr5GWN6is7AR3s1PSDcoAHuwaPSsLQZNxncmmCLDCXQ1RS74wHGlxiHJoUdbHfco8Mo4NZg92cfh2AMSPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336899; c=relaxed/simple;
	bh=1hCQouYpGPLYCGUMm7RuelDeleW9YnV3vKdJx2C+Kp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OSAMFpjPNB9muQUqHrnIbk+domN3tGat67OiSBd1bUjp/PYqhgqcIIW5YNCG6/kSZmjilpnHNpRpWr2FMa0QdwGNh+aywoo04n2UE6X/tra1NsZUOQoETTdks1jK0DORXLZpfrbUCroBk9zylWWWI4b1QQQZh+eqniq0cjbdJqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLHnHJyn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964CFC4CEEA;
	Thu, 19 Jun 2025 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336898;
	bh=1hCQouYpGPLYCGUMm7RuelDeleW9YnV3vKdJx2C+Kp4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nLHnHJynvcZXruHY3un4m4i2As2KlH6rY6KC8PYMnX1fEcgB+rPqmwnSySo3EvVhz
	 ROlIppyV4loCa/UndXtBvKc8MScOktM7T5F8ZWP3eG5jf2ucATD6xydNPqVlGCi7Jv
	 E/Bxg9lBk9CsYc3gvaENUZFTSgVHq3fyQf9okpht7Ee8BarbzSFTMNRJyuwCbj7Lg/
	 8PWv/erct9iJdRBH/OxI606fGGQR4wbOv/iLAin5528cdfzcWqLyuKvgsdUmkN6IjV
	 e1hOXEq68MNmJOL/sRFRaISAde2pxY5yM4grcBwxFs9eljlWa8d/Exxc3OL8aEaxt1
	 VoB/UC7FHM9lg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Masahiro Yamada" <masahiroy@kernel.org>,
  "Nathan Chancellor" <nathan@kernel.org>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,  "Nicolas
 Schier" <nicolas.schier@linux.dev>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 1/6] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <DAQI4RPK2Y7T.3TQ1G3IMZCNK4@kernel.org> (Benno Lossin's message
	of "Thu, 19 Jun 2025 14:17:26 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-1-bc219cd1a3f8@kernel.org>
	<bbRxeBHCiFQl9UTC1hFQYdzkdAIV5HcRTuFf9ucPUEZZ-uJmaHAZXfd8Tk-k9vzROgFsCyNhGBBCn5J_HnbUSA==@protonmail.internalid>
	<DAPY5HF9HGXC.FCEKAMLPFY1H@kernel.org> <871prg7zoh.fsf@kernel.org>
	<a8_DtAcJxescV_Khg6IkI9hOSEk_ZKpOWfnn_KzuZg9E9COLyO6awlSWnJra20Kvqxcf3Ph7w9VlKUt9dKRrCQ==@protonmail.internalid>
	<DAQI4RPK2Y7T.3TQ1G3IMZCNK4@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 14:41:26 +0200
Message-ID: <87jz577vk9.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Thu Jun 19, 2025 at 1:12 PM CEST, Andreas Hindborg wrote:
>> I'm having a difficult time parsing. Are you suggesting that we guard
>> against implementations of `TryInto<u64>` that misbehave?
>
> Let me try a different explanation:
>
> The safety requirement for implementing the `FromStrRadix`:
>
>     /// The member functions of this trait must be implemented according to
>     /// their documentation.
>
> Together with the functions of the trait:
>
>     /// Parse `src` to [`Self`] using radix `radix`.
>     fn from_str_radix(src: &BStr, radix: u32) -> Result<Self, crate::error::Error>;
>
>     /// Return the absolute value of [`Self::MIN`].
>     fn abs_min() -> u64;
>
>     /// Perform bitwise 2's complement on `self`.
>     ///
>     /// Note: This function does not make sense for unsigned integers.
>     fn complement(self) -> Self;
>
> Doesn't make sense. What does it mean to return the "absolute value of
> [`Self::MIN`]"? We don't have "absolute value" defined for an arbitrary
> type. Similarly for `complement` and `from_str_radix`, what does "Parse
> `src` to [`Self`] using radex `radix`" mean? It's not well-defined.
>
> You use this safety requirement in the parsing branch for negative
> numbers (the `unsafe` call at the bottom):
>
>     [b'-', rest @ ..] => {
>         let (radix, digits) = strip_radix(rest.as_ref());
>         // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
>         // So if we want to parse negative numbers as positive and
>         // later multiply by -1, we have to parse into a larger
>         // integer. We choose `u64` as sufficiently large.
>         //
>         // NOTE: 128 bit integers are not available on all
>         // platforms, hence the choice of 64 bits.
>         let val =
>             u64::from_str_radix(core::str::from_utf8(digits).map_err(|_| EINVAL)?, radix)
>                 .map_err(|_| EINVAL)?;
>
>         if val > Self::abs_min() {
>             return Err(EINVAL);
>         }
>
>         if val == Self::abs_min() {
>             return Ok(Self::MIN);
>         }
>
>         // SAFETY: We checked that `val` will fit in `Self` above.
>         let val: Self = unsafe { val.try_into().unwrap_unchecked() };
>
>         Ok(val.complement())
>     }
>
> But you don't mention that the check is valid due to the safety
> requirements of implementing `FromStrRadix`. But even if you did, that
> wouldn't mean anything as I explained above.
>
> So let's instead move all of this negation & u64 conversion logic into
> the `FromStrRadix` trait. Then it can be safe & the `ParseInt::from_str`
> function doesn't use `unsafe` (there still will be `unsafe` in the
> macro, but that is fine, as it's more local and knows the concrete
> types).
>

Alright. I guess my safety comments are slightly hand-wavy. Thanks for
the suggestion, I'll apply that for next spin.

Best regards,
Andreas Hindborg



