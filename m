Return-Path: <linux-kbuild+bounces-5898-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A66A434D7
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 06:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA9601897CD3
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 05:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7502561A8;
	Tue, 25 Feb 2025 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kWmwkQhl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198E36124;
	Tue, 25 Feb 2025 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740462919; cv=none; b=jnOx7XE4L96e3ByXsrkArxXSUwJF1lbOkKtOjv5Xb58XawyOiBIFjVcGd3OnmiD7zxKrks6tbZtnVFZypo3ZiPtTOgxKQNwhVt9LFXZxCNtvscrtIIb05qfeKpJenM9FCvy9KyreVf7bS/h7CqEhjDXU7qDdf+Z2sjnUCc4exOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740462919; c=relaxed/simple;
	bh=z/n0ecmeuHsI6oH5v9VDQSdSll/BCv4bxwUSARxaT8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nz8UNXbFYq7RLjv4InfpiL7oaPcSXqu2US2OhX63FF9ROvjsg1ccLD79MmV1HQSZ3+dTDot6zGMbkjSHF4lZuQxTA3NI6phuI6NZXndVznh3mDlXU7ls8aRwS8iek/xPfBOtOCvL5dSo6IDOq7LE0QIKO7PaopTRPchYexrYE5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kWmwkQhl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F6CC4CEDD;
	Tue, 25 Feb 2025 05:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740462918;
	bh=z/n0ecmeuHsI6oH5v9VDQSdSll/BCv4bxwUSARxaT8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kWmwkQhljPmntmcEC/IzNKPb7DCR31kahxvqoAOp4hqCBP6A7AZ+nIEvysYxYblE+
	 yHCa6Hp1qVKCIlQT/sdP3cMtGDrdX9Nf1zwPLJ1hWosxwYzNUlhjmiKZCMQY3JGNib
	 XIKkJvt997eagCvwY7jV8OP4ZROf6FaR30dZW0Un657xBvOeGsk1n/jZEQ6Gc8N3li
	 aJqTBNiCkldsbQdjoM4rYjYGq+5ZfFKjIQcJFMWdgtKMvPRScxJFyUH1W5bwssKfw7
	 PKsemGTkOXu/0P5fpUq34kCM3uh4uErwnF7MxlBWo1Qu+vWkCHsCPYKIGejD+oBvSB
	 eVshhZ+lsyQIA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Janne Grunau" <j@jannau.net>
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
In-Reply-To: <20250224223032.GA615664@robin.jannau.net> (Janne Grunau's
	message of "Mon, 24 Feb 2025 23:30:32 +0100")
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
	<20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org>
	<pxb9YSTFjQxi7OFAjJ0RYOrJ8AmteN_UzJU-aeQA1wbQMquZLi99UDcDWHMw5ImXYDLj9ADxJ33K7huT1nq7Vw==@protonmail.internalid>
	<20250224223032.GA615664@robin.jannau.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 25 Feb 2025 06:54:45 +0100
Message-ID: <87tt8iy3fe.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Janne Grunau" <j@jannau.net> writes:

> On Tue, Feb 18, 2025 at 02:00:47PM +0100, Andreas Hindborg wrote:
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
>> index db272d2198fcc..8b0d814b47f52 100644
>> --- a/rust/kernel/str.rs
>> +++ b/rust/kernel/str.rs
>> @@ -945,3 +945,121 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>
> [...]
>
>> +    pub trait ParseInt: FromStrRadix + TryFrom<i128> {
>> +        /// Parse a string according to the description in [`Self`].
>> +        fn from_str(src: &BStr) -> Result<Self> {
>> +            match src.deref() {
>> +                [b'-', rest @ ..] => {
>> +                    let (radix, digits) = strip_radix(rest.as_ref());
>> +                    // 2's complement values range from -2^(b-1) to 2^(b-1)-1.
>> +                    // So if we want to parse negative numbers as positive and
>> +                    // later multiply by -1, we have to parse into a larger
>> +                    // integer. We choose i128 as sufficiently large.
>> +                    let val = i128::from_str_radix(
>
> The usage of i128 causes here following link errors on arm64 with
> "rustc 1.84.1 (e71f9a9a9 2025-01-27) (Fedora 1.84.1-1.fc41)"
>
> | ld: rust/kernel.o: in function `<i128>::from_str_radix':
> | /usr/lib/rustlib/src/rust/library/core/src/num/mod.rs:1563:(.text+0x3bc): undefined reference to `__muloti4'
> | ld: /usr/lib/rustlib/src/rust/library/core/src/num/mod.rs:1563:(.text+0x440): undefined reference to `__muloti4'
> | ld: rust/kernel.o: in function `<i128>::overflowing_mul':
> | /usr/lib/rustlib/src/rust/library/core/src/num/int_macros.rs:2517:(.text+0x4b4): undefined reference to `__muloti4'
> | ld: /usr/lib/rustlib/src/rust/library/core/src/num/int_macros.rs:2517:(.text+0x534): undefined reference to `__muloti4'
>
> The errors go away after exchanging i128 with i64 (while breaking the
> parsing for large values).

Thanks for reporting! I will have to find a better way to fix this issue
then.


Best regards,
Andreas Hindborg




