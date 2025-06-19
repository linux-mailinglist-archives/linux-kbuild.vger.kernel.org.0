Return-Path: <linux-kbuild+bounces-7565-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168D0AE0322
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 13:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CFDD160DB2
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 11:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731D6225762;
	Thu, 19 Jun 2025 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+JJHpce"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C5D221F30;
	Thu, 19 Jun 2025 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331564; cv=none; b=aL0SHeNn5lHpNTaF8/Z0DkdBFLzNfW03vLurHGkjE5lWkbkne9vIALe3LYJcOuM2L5uF4xNnB0MrPAYJIO/crXSdqbpaAdj/lwGaFc+vgiN9uCrQFBz+nJOAn7TDA8s9biPVJ40Sm9plMOvVloh2OVBjBtRM04GaQga+fOqzcss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331564; c=relaxed/simple;
	bh=0u88sDT/q65KVfR5hIDnrWSdvSt9Ru54yMvadeBOFqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q0d8DracoIYXQT4O47SvvmjnamiAvcizjffX3kLu0u0r69tcDjlMJ0qFX1XBZfGCIkVBt4XiXRrpNskZ7rQdi/vArBJdzG3j0eBuHcfZHLHBUC9cNRjQLFuTx5w6WDSlwSI8eFp+CZ9JpX16lCZIhJAn+HRafzmBxW8C5FPHl4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+JJHpce; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0066FC4CEEA;
	Thu, 19 Jun 2025 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750331563;
	bh=0u88sDT/q65KVfR5hIDnrWSdvSt9Ru54yMvadeBOFqc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f+JJHpcebDoGLAiQoKVcSV4vvPEeM7EYIN5xxv6fEWkCF+mVHQMwzBhghOpZKCghQ
	 7/Td7l838WQdl5744jAdc8yVM7VI4Jncb+XKdHTGVGaJzz0YyLV37Vz6rxmolow8Uu
	 JRTK+6hqUG+5XmnL3kjsYAE4NO34MW/XGNu7uw4VKAGlq1scb2Pp9u1Osxry71PAss
	 LJc2oRs8NUFbDeSm3zI7FQ9D3rReyBIXXszKJ0bTkSQKD//b1Uy8bjqWNOEkStyTCS
	 x1syDEa9r2lrlCbKbjL3wBvHTinnPdRlnCGZbJDABkMYsoJbeMdLlw7GYx6i9qzCCK
	 0Vxys58LqCw9w==
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
In-Reply-To: <DAPY5HF9HGXC.FCEKAMLPFY1H@kernel.org> (Benno Lossin's message of
	"Wed, 18 Jun 2025 22:38:00 +0200")
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
	<20250612-module-params-v3-v13-1-bc219cd1a3f8@kernel.org>
	<bbRxeBHCiFQl9UTC1hFQYdzkdAIV5HcRTuFf9ucPUEZZ-uJmaHAZXfd8Tk-k9vzROgFsCyNhGBBCn5J_HnbUSA==@protonmail.internalid>
	<DAPY5HF9HGXC.FCEKAMLPFY1H@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 13:12:30 +0200
Message-ID: <871prg7zoh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <lossin@kernel.org> writes:

> On Thu Jun 12, 2025 at 3:40 PM CEST, Andreas Hindborg wrote:
>> +pub trait ParseInt: private::FromStrRadix + TryFrom<u64> {
>> +    /// Parse a string according to the description in [`Self`].
>> +    fn from_str(src: &BStr) -> Result<Self> {
>> +        match src.deref() {
>> +            [b'-', rest @ ..] => {
>> +                let (radix, digits) = strip_radix(rest.as_ref());
>> +                // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
>> +                // So if we want to parse negative numbers as positive and
>> +                // later multiply by -1, we have to parse into a larger
>> +                // integer. We choose `u64` as sufficiently large.
>> +                //
>> +                // NOTE: 128 bit integers are not available on all
>> +                // platforms, hence the choice of 64 bits.
>> +                let val =
>> +                    u64::from_str_radix(core::str::from_utf8(digits).map_err(|_| EINVAL)?, radix)
>> +                        .map_err(|_| EINVAL)?;
>> +
>> +                if val > Self::abs_min() {
>> +                    return Err(EINVAL);
>> +                }
>> +
>> +                if val == Self::abs_min() {
>> +                    return Ok(Self::MIN);
>> +                }
>> +
>> +                // SAFETY: We checked that `val` will fit in `Self` above.
>
> Sorry that it took me this long to realize, but this seems pretty weird.
> I guess this is why the `FromStrRadix` is `unsafe`.
>
> Can we just move this part of the code to `FromStrRadix` and make that
> trait safe?
>
> So essentially have:
>
>     fn from_u64(value: u64) -> Result<Self>;
>
> in `FromStrRadix` and remove `MIN`, `abs_min` and `complement`. Then
> implement it like this in the macro below:
>
>     const ABS_MIN = /* existing abs_min impl */;
>     if value > ABS_MIN {
>         return Err(EINVAL);
>     }
>     if val == ABS_MIN {
>         return Ok(<$ty>::MIN);
>     }
>     // SAFETY: We checked that `val` will fit in `Self` above.
>     let val: $ty = unsafe { val.try_into().unwrap_unchecked() };
>     (!val).wrapping_add(1)
>
> The reason that this is fine and the above is "weird" is the following:
> The current version only has `Self: FromStrRadix` which gives it access
> to the following guarantee from the `unsafe` trait:
>
>     /// The member functions of this trait must be implemented according to
>     /// their documentation.
>     ///
>     /// [`&BStr`]: kernel::str::BStr
>
> This doesn't mention `TryFrom<u64>` and thus the comment "We checked
> that `val` will fit in `Self` above" doesn't really apply: how does
> checking with the bounds given in `FromStrRadix` make `TryFrom` return
> `Ok`?

I'm having a difficult time parsing. Are you suggesting that we guard
against implementations of `TryInto<u64>` that misbehave?


Best regards,
Andreas Hindborg



