Return-Path: <linux-kbuild+bounces-5726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD5A3168E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 21:25:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DF99166DA3
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 20:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7DE261597;
	Tue, 11 Feb 2025 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dR2ICPPj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8552326562D;
	Tue, 11 Feb 2025 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739305505; cv=none; b=BwyJAUa75LfPWFYX2pxTMsk9fw4DY3+ImGCDFgMelXyDxy4nTOloa874xQpjlCpj1/xibWCiPIslSCW8Lc0+kjP8Ex/MCpmirqcOToLDewEWYmUUNsMAC3zBMwIwVfWQqW0ZFpyp16aWHCERLvnjuyqQJ+vGWm/SDB9bqMt3VYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739305505; c=relaxed/simple;
	bh=xAVeZqKW+FokUgv189TRcGVblshI1nQpSSQvUsmGHtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FlHl0LduIrbUq00jAPBFgakwKY7wzcxJ1NK2K5Pws8HtoxB0TxjtAvZZvBUWsfiUhf0iLM53XD1zlmgm3rcVc1kO0n299IQSL3PyQbjQb+PzS4HoV/wDUAA63jIbSMRgpEFZESSAHjXTYU/IHivioHH9OGSzSYgoetsD6mJkTwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dR2ICPPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1E4C4CEDD;
	Tue, 11 Feb 2025 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739305505;
	bh=xAVeZqKW+FokUgv189TRcGVblshI1nQpSSQvUsmGHtk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dR2ICPPj5Wo8ynyCZvtZ3gUPj7T3i6SV8KmVHyYMHiYbLOifImpGIVwDgkYUhuIKo
	 Z2vG84vV1Nrp+PcUMHsBcbks3XeS542e2DBALXxRhxLuPOqYvUm69JDbc4NCwPvRCS
	 Lvj9RC2pHIddwl6nXStLKuI+02q5o09W398iWCczbuoTvyCTucCk/4IfofVJ0ZLW70
	 lwd+OgzxBX1P3dhW2Zl9wQDbFRs1EAjQfJfRqjNvA3lo396v9IUHSLSYRoctm5OUyG
	 WmerGAV5o7ppwTNH8IlCyAZx9SLGt1kgDYJjFF9IyqUWOTn44KWZMdDf7eAgfnYUwj
	 lNT5XLGtDO6cg==
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
Subject: Re: [PATCH v6 2/6] rust: str: implement `Index` for `BStr`
In-Reply-To: <20250211164004.6de768c3@eugeo> (Gary Guo's message of "Tue, 11
	Feb 2025 16:40:04 +0000")
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
	<20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org>
	<kW0CDyK5M8DuLPr_1HwIXcnVP4x8evlFoq0BOjldchTZqkGiqzNJ-dtpV7s5QHLbbmm6cW529GeDTo_GoDKfdQ==@protonmail.internalid>
	<20250211164004.6de768c3@eugeo>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 21:24:44 +0100
Message-ID: <87lduc44c3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue, 11 Feb 2025 16:57:36 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> The `Index` implementation on `BStr` was lost when we switched `BStr` from
>> a type alias of `[u8]` to a newtype. This patch adds back `Index` by
>> implementing `Index` for `BStr` when `Index` would be implemented for
>> `[u8]`.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/str.rs | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> index 002dcddf7c768..1eb945bed77d6 100644
>> --- a/rust/kernel/str.rs
>> +++ b/rust/kernel/str.rs
>> @@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
>>      }
>>  }
>>
>> +impl<Idx> Index<Idx> for BStr
>> +where
>> +    Idx: core::slice::SliceIndex<[u8], Output = [u8]>,
>
> I think I'd prefer
>
> 	[T]: Index<Idx>,

Is that equivalent?


Best regards,
Andreas Hindborg



