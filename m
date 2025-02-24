Return-Path: <linux-kbuild+bounces-5875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBD4A421AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D06951622A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76170243369;
	Mon, 24 Feb 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTwl10BO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F0D59B71;
	Mon, 24 Feb 2025 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404646; cv=none; b=Fp11Hm9cvzudiqLoRdkfDUZJzn+9TGgAx+mVvLIlnOmJjKLf3LTMaYeJKZJBpZ4gCjkwQtzDDdTsKAubEI+3ezKyzj7QY422w4Txno9reLVsTPghTRi9GgyzvC+fTI+XKA7Ph7jwU+y2f1yGR24/3PdFznvaJerTQfLnS51LEU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404646; c=relaxed/simple;
	bh=rVfs2/wZfKjg6Qg51IMEySr29bgkBwjvvO/H4L2lWLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iYQq+FCMyHZ/syecalD+0d3fTWlxiOnv+ZmjFFbc4f9X7WOtxEBhFqnFIHBZvGyk74j8wIcZgeuU+dN8HmSNWilpZdvmdZIbeaBm9Jqze3bgjLEb0fSxgbMSdgcuojwEovM3LsbdA4G+yL2ZQUx9AIckndafg5HxETl+JgTrbBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTwl10BO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDBBC4CEE6;
	Mon, 24 Feb 2025 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740404645;
	bh=rVfs2/wZfKjg6Qg51IMEySr29bgkBwjvvO/H4L2lWLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eTwl10BOYV2LyLCJDOL6XfdY/rQRILjH31zUnnBRelTxxx3123Ei0+gCO8I6UfcOV
	 AwEzMvhWNlrueLXqK3rSw+e5J8lDZvoBWc/K834x/gZ32wkBhh+zbtNtaAuwKLlxsJ
	 x8wR4aiJ8gfQuJWmg20j0Zr7yYamoBKMOVgRTKu4HCsbBTfinhN0sROr1TZ8olq43A
	 J1hTcBGoENWn4IiqeOdasg+3aYPG9aouiRyGCWW6UFJH90bnrJGC1pVDjCvEbgXYqS
	 ujQDyM/rztTHRMdy/XKMkISh2de9HcasWMecS1OVkJCFRrt06719tp9MYFItNcNTQJ
	 XGG/diXrDyrIQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis Chamberlain"
 <mcgrof@kernel.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  "Adam Bratschi-Kaye"
 <ark.email@gmail.com>,  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu"
 <petr.pavlu@suse.com>,  "Sami Tolvanen" <samitolvanen@google.com>,
  "Daniel Gomez" <da.gomez@samsung.com>,  "Simona Vetter"
 <simona.vetter@ffwll.ch>,  "Greg KH" <gregkh@linuxfoundation.org>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v7 5/6] rust: str: add radix prefixed integer parsing
 functions
In-Reply-To: <24221C62-2470-4B03-B39B-58BCDC500D68@collabora.com> (Daniel
	Almeida's message of "Mon, 24 Feb 2025 10:34:11 -0300")
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>
	<VZotdu1M69nw0dml87uPIIA1DETDQf9U-jnVNtPyHO5xOGkqqNvLcZPUnt2lcHCcQJ9KjdPYyHtc31taMMIuAA==@protonmail.internalid>
	<24221C62-2470-4B03-B39B-58BCDC500D68@collabora.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 24 Feb 2025 14:43:53 +0100
Message-ID: <87y0xvzcdi.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Daniel Almeida" <daniel.almeida@collabora.com> writes:

> Hi Andreas,
>
>> On 18 Feb 2025, at 10:00, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>> Add the trait `ParseInt` for parsing string representations of integers
>> where the string representations are optionally prefixed by a radix
>> specifier. Implement the trait for the primitive integer types.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> rust/kernel/str.rs | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 118 insertions(+)
>>
>> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
>> index db272d2198fcc..8b0d814b47f52 100644
>> --- a/rust/kernel/str.rs
>> +++ b/rust/kernel/str.rs
>> @@ -945,3 +945,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> macro_rules! fmt {
>>     ($($f:tt)*) => ( core::format_args!($($f)*) )
>> }
>> +
>> +pub mod parse_int {
>> +    //! Integer parsing functions for parsing signed and unsigned integers
>> +    //! potentially prefixed with `0x`, `0o`, or `0b`.
>> +
>> +    use crate::prelude::*;
>> +    use crate::str::BStr;
>> +    use core::ops::Deref;
>> +
>> +    /// Trait that allows parsing a [`&BStr`] to an integer with a radix.
>> +    ///
>> +    /// [`&BStr`]: kernel::str::BStr
>> +    // This is required because the `from_str_radix` function on the primitive
>> +    // integer types is not part of any trait.
>> +    pub trait FromStrRadix: Sized {
>
> Is this supposed to be implemented by somebody else? Otherwise we should seal it,
> perhaps?

That is a good point. I did not intend for the user to implement this,
same for `ParseInt`. I will look into sealing them.


Best regards,
Andreas Hindborg



