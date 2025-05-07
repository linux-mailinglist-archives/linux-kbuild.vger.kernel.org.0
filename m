Return-Path: <linux-kbuild+bounces-6987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95941AADB45
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 11:20:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1B1E4A2FC4
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 09:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C812405F5;
	Wed,  7 May 2025 09:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tyrPsxfX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C2F23F40F;
	Wed,  7 May 2025 09:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609338; cv=none; b=TwdH3lTySK1uzjENcwP32Z23JvuIi1D3vVh3gKTAoy3SWSlBUj5NZCGba/sEBM59uglF0HTGpQLfEzow8CGGDC2yZkjOWZdVUCZpe6ambgHaOGFrkJicU3/rvtzBDBoo9Njlya4KZfbQSMpCM7PzuKDHLNYpU7zE/7LzVi8XKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609338; c=relaxed/simple;
	bh=9z++eVUjo5Nt6P9zv3aLaT+qA0f6xjadJ4gnXukQoHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BrTNSL29qXUO0tnyIi0adq5yWIbjQqlNAlKb3wcaYxMIaxrrz4ziuYPt8GhJG2HzSO0rcPWh8jU2PYhbzFIR72/rauKNIwfYJfR/n7uy9bbS2buCQ/umPM59ZVgV3WlRlRr2jd1Mrwzw3f82FLlMZZ5tMr6L7rvwqVfWCYkPg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tyrPsxfX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FF4C4CEEE;
	Wed,  7 May 2025 09:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746609337;
	bh=9z++eVUjo5Nt6P9zv3aLaT+qA0f6xjadJ4gnXukQoHQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tyrPsxfXjyHj3ItkcRhJIoeIeE8vRiwZxU+LKjOJf4zVEECLepFyq91CH867FCzVw
	 NGLgRR6eAlMBpH2nOp21RUrBUuCsW0V0oh95BWZT6TnqSaE9qFBTCvjGefvaBT6SZK
	 WSbV5tj1gJwhj9NZtFI34Pegg70mtePnLWD1rwctfzmns4V6LgcFVY33OqLNC20a3R
	 6nMJaEyEw2ftHtx+A/JfuVO9yXjNEA1QEFr9e9L3RwxqFn5mX2yJTZN5vuWIJ3Aa8S
	 UZkafOw8f6DD+QRNVH8GqEZR0O2eNAzxo6rzN0n4EJcCqlnVumDxj5rykWzRi8c4gk
	 llS6pFyj/eyZg==
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
Subject: Re: [PATCH v12 1/3] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <D9PSYQMCW74W.39JB3NDCWB2H3@kernel.org> (Benno Lossin's message
	of "Wed, 07 May 2025 10:58:08 +0200")
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
	<20250506-module-params-v3-v12-1-c04d80c8a2b1@kernel.org>
	<UfD3pllWu8O_qAKsi04IMH1WGszkDe31KpLs7oMvDsUC-tryEbrYKmtDAPj5w-BO2CyZ8_S_G5lWBE2Ud72n8w==@protonmail.internalid>
	<D9PSYQMCW74W.39JB3NDCWB2H3@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 07 May 2025 11:15:19 +0200
Message-ID: <87ldr8pys8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Tue May 6, 2025 at 3:02 PM CEST, Andreas Hindborg wrote:
>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> index 878111cb77bc..174e70397305 100644
>> --- a/rust/kernel/str.rs
>> +++ b/rust/kernel/str.rs
>> @@ -573,7 +573,6 @@ macro_rules! c_str {
>>  }
>>
>>  #[cfg(test)]
>> -#[expect(clippy::items_after_test_module)]
>>  mod tests {
>>      use super::*;
>>
>> @@ -946,3 +945,174 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>  macro_rules! fmt {
>>      ($($f:tt)*) => ( core::format_args!($($f)*) )
>>  }
>> +
>> +/// Integer parsing functions for parsing signed and unsigned integers
>> +/// potentially prefixed with `0x`, `0o`, or `0b`.
>> +pub mod parse_int {
>
> Why not make this its own file? It's 172 lines long already.

Sure. I'm really hoping to land this series for this cycle though, so if
it's OK I would move the code next cycle.

>
>> +    pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
>> +        /// Parse a string according to the description in [`Self`].
>> +        fn from_str(src: &BStr) -> Result<Self> {
>> +            match src.deref() {
>> +                [b'-', rest @ ..] => {
>> +                    let (radix, digits) = strip_radix(rest.as_ref());
>> +                    // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
>> +                    // So if we want to parse negative numbers as positive and
>> +                    // later multiply by -1, we have to parse into a larger
>> +                    // integer. We choose `u64` as sufficiently large.
>> +                    //
>> +                    // NOTE: 128 bit integers are not available on all
>> +                    // platforms, hence the choice of 64 bits.
>> +                    let val = u64::from_str_radix(
>> +                        core::str::from_utf8(digits).map_err(|_| EINVAL)?,
>> +                        radix,
>> +                    )
>> +                    .map_err(|_| EINVAL)?;
>> +
>> +                    if val > Self::abs_min() {
>> +                        return Err(EINVAL);
>> +                    }
>> +
>> +                    if val == Self::abs_min() {
>> +                        return Ok(Self::MIN);
>> +                    }
>> +
>> +                    // SAFETY: We checked that `val` will fit in `Self` above.
>> +                    let val: Self = unsafe { val.try_into().unwrap_unchecked() };
>> +
>> +                    Ok(val.complement())
>
> You're allowing to parse `u32` with a leading `-`? I'd expect an error
> in that case. Maybe `complement` should be named `negate` and return a
> `Result`?

You would get `Err(EINVAL)` in that case, hitting this:

  if val > Self::abs_min() {
      return Err(EINVAL);
  }


Best regards,
Andreas Hindborg


