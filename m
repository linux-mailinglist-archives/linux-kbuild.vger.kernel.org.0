Return-Path: <linux-kbuild+bounces-6971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C13AAC318
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 13:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C3187BC0EB
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 11:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF37E27BF8A;
	Tue,  6 May 2025 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuJXK8f3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F13027B51F;
	Tue,  6 May 2025 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532400; cv=none; b=C1OFGjZ8sjc+3MTTsNXDpSikVrP1TCK7H2M7CQNfOIL1MSr2/DAFx2x7Vz93Bow590jAtaHcj2dpso+hO1p44LIONICVeYSddqokBEUTHRY1sHY8G8gypK98SR7zaXLo4UaWu6GfHwy7344arqbuLJJX2uM6XAM6TDiYHOgyn70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532400; c=relaxed/simple;
	bh=phKhwzwBBsKUNTwTuCqGqFtLytQEhltV8oTOiryixAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=spO8ud7BgRaz+TqwYfaJQEcFJYJqE0VPagyIXXMTDmgaNb7KGEeEImMlAXihT8UXEKIiLFMZlFu8j+xXtpPWvYos4+QylvRfCGEV/PxHiUk0cdLhOZR34eU0UVGaXQdAeDd/2d8YKNZzq8PaRJrXOa4UXp2vdHBh8MASSwfxMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuJXK8f3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C16C4CEED;
	Tue,  6 May 2025 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746532400;
	bh=phKhwzwBBsKUNTwTuCqGqFtLytQEhltV8oTOiryixAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BuJXK8f3+6nrBJZh0HBI891bC/OR1WxkU+iQAKcDASsi4/nJdYeI8vLjcVaxGe3P6
	 Se26eRn0cDqIVbUqfi8A9cDyUQEufUYPOY0owQw2r34LWmHOIEKWB+LSU/c6CP8bCD
	 8FSeySu6MCjlBKrBvqLn4W3CqWBjZa7XPaZQVKwve5nreGsK6XnCO4JUHhc5x7TuqQ
	 0j3EyF29AKQ0L+EakP0hIJndY4mE28l9on11E71DV5Sw5uksmXAG6wsXDfdcwRqCHo
	 Kkb6s3yDACNb47S7Kil81NA+VKaSnium/RdsC4jAlcYgOVyOf0mYP8hHFWdS0ocXGh
	 AkcKqAtSE0FHQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Danilo Krummrich" <dakr@kernel.org>,
  "Nicolas Schier" <nicolas.schier@linux.dev>,  "Trevor Gross"
 <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,  "Greg
 KH" <gregkh@linuxfoundation.org>,  "Fiona Behrens" <me@kloenk.dev>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v11 2/3] rust: add parameter support to the `module!` macro
In-Reply-To: <aBnQpWJeiRKIMJ5D@google.com> (Alice Ryhl's message of "Tue, 06
	May 2025 09:04:37 +0000")
References: <20250502-module-params-v3-v11-0-6096875a2b78@kernel.org>
	<20250502-module-params-v3-v11-2-6096875a2b78@kernel.org>
	<WroEJHY8a-y8vbSQkUvGJJs7yTQGKMsHJqmWFYGkz5bZ_PsiE8GAozjSaNpWjWina1XanjVNpV0Av3woiaUtJg==@protonmail.internalid>
	<aBTMMHWNXS7wK7zS@google.com> <878qnbxtyi.fsf@kernel.org>
	<I9aVTs-nIPqYQrXB9KHd84xis2sWTBG-c8R8JQfCa23WzZopwS4vt4mA07cO3byOUNYf9sYUxrFi-O_kWdQGxQ==@protonmail.internalid>
	<aBnQpWJeiRKIMJ5D@google.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 06 May 2025 13:53:08 +0200
Message-ID: <87wmauot0b.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Mon, May 05, 2025 at 11:55:33AM +0200, Andreas Hindborg wrote:
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > On Fri, May 02, 2025 at 02:16:35PM +0200, Andreas Hindborg wrote:
>> > It would be a use-after-free to
>> > access it during module teardown. For example, what if I access this
>> > static during its own destructor? Or during the destructor of another
>> > module parameter?
>>
>> Yes, that is a problem.
>>
>> We can get around it for now by just not calling `free` for now. We only
>> support simple types that do not need drop. I think we would have to
>> seal the `ModuleParam` trait for this.
>>
>> For a proper solution, we could
>>  - Require a token to read the parameter.
>>  - Synchronize on a module private field and return an option from the
>>    parameter getter. This would require module exit to run before param
>>    free. I think this is the case, but I did not check.
>>  - Use a `Revocable` and revoke the parameter in `free`.
>>
>> Any other ideas or comments on the outlined solutions?
>
> I think the simplest you can do right now is
>
> trait ModuleParam: Copy

Cool =F0=9F=91=8D

>
> so that it can't contain any non-trivial values. That way you don't need
> Drop either.
>
> Long term, I think we need a way to detect whether it's safe to access
> module globals. The exact same problem applies to the existing global
> for the module itself - except it's worse there because we can't access
> that one during init either.

Yep.



Best regards,
Andreas Hindborg




