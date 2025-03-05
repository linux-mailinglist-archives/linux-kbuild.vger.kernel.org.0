Return-Path: <linux-kbuild+bounces-5965-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B6A4FEAB
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 13:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AF6A16A971
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 12:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F187C2459E4;
	Wed,  5 Mar 2025 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mzp9nCoQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C8B2459D7;
	Wed,  5 Mar 2025 12:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178049; cv=none; b=GrK/4rr9gtPPXS1lOtar5XMk0lii+U8HOI7ukGsdBq6PxvdPBCGHA82pf7y0UJBNugFA+qvQFAU5naVPau/NyFtq8cq8GubFhmcZbERV2fCqthDDfg1qN++zyIQkd8S3KLvLIk9Gf/5wKqguS/H/O0/p6P2RIbanBqBfdgLl24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178049; c=relaxed/simple;
	bh=OcU4+ln57Mx3+12+GqCg48APIqwdDXzWbUa+3kLqSa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m6HHN7Vnh4BK6Hf1oxRC082dr23jGh8SFdBIovqH8K48aHa4w91fofxE8RCqFDW0xW8SxdvGYPC+mw18yHBU0S73XE+8K/SdRA0rwS8qn1l79T7usObLmXSgGMd8MJKhS3PA1v2p/xz/iiVEfPlGawm6VukpiXV5sk1pvYUWlN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mzp9nCoQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744DCC4CEE2;
	Wed,  5 Mar 2025 12:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741178049;
	bh=OcU4+ln57Mx3+12+GqCg48APIqwdDXzWbUa+3kLqSa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mzp9nCoQHpaIQCSSg9ZH6omx0gzE5YeGEDCdT7cJwgvP3vSoab53xqfkdkoU9E9Q/
	 4lYlIupjCTRQW9P/jnJA4cuXBllqYJjyiihf8wC1dkPZfzcja4BdrVR9U0IzEEZhwH
	 Ce2+oYxZfsbAbfgdqAXWC5byAbrySsVT+ynPAk8E5/S8gJaGPQJioHwTdtfBDWHa+L
	 yfjrZL4jCCRavF7RrTUY/q0QIEU65T0Mj7QcDEHKrzguN/puQKKjAcSZC6IDhx+64S
	 PKBJpGQ0/FdbSyaJaMRvqCqRpMwI0H+z2lzuzXp9UxQfiBzqNsTWsq+xq5yUP3X3CN
	 WhXy5HVOrvJNQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Benno Lossin" <benno.lossin@proton.me>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Alice
 Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Masahiro Yamada"
 <masahiroy@kernel.org>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nicolas Schier" <nicolas@fjasle.eu>,  <linux-kernel@vger.kernel.org>,
  <rust-for-linux@vger.kernel.org>,  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
In-Reply-To: <D88BLHENDH8Y.HQUKEXN1XB7C@proton.me> (Benno Lossin's message of
	"Wed, 05 Mar 2025 12:10:20 +0000")
References: <20250304225245.2033120-1-benno.lossin@proton.me>
	<jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid>
	<20250304225245.2033120-15-benno.lossin@proton.me>
	<87h647d6xg.fsf@kernel.org>
	<cdfBMmuIl8Wl-KpI-koNDQJOCGBr9z9dOi5fxQvFbgNWQHHw6JtMizaMMbMniNlE841-9b7TdLuZ9Xh_hFsf7w==@protonmail.internalid>
	<D88BLHENDH8Y.HQUKEXN1XB7C@proton.me>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 13:31:25 +0100
Message-ID: <87ldtjbqw2.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Benno Lossin" <benno.lossin@proton.me> writes:

> On Wed Mar 5, 2025 at 12:59 PM CET, Andreas Hindborg wrote:
>> "Benno Lossin" <benno.lossin@proton.me> writes:
>>
>>> From: Miguel Ojeda <ojeda@kernel.org>
>>>
>>> Add infrastructure for moving the initialization API to its own crate.
>>> Covers all make targets such as `rust-analyzer` and `rustdoc`. The tests
>>> of pin-init are not added to `rusttest`, as they are already tested in
>>> the user-space repository [1].
>>
>> If it's not too much hassle, why not add them in the kernel as well? I
>> would rather not have to go fetch the user space repo from github, in
>> the event that I ever need to patch pin-init.
>
> I tried to add them, but encountered a lot of problems. Maybe the new
> build system can help with that. But if you insist, I can try to get
> them to work again in a different series now.
>
> The tests run every day in the GitHub CI and any changes that go through
> the pin-init-next tree will also be tested there before I submit any
> PRs.

I _really_ think that the ability to run the tests should be present in
the kernel repository. But I also do not want to block this series on it,
if it is something that will be easier to achieve with the build system
overhaul that is in the pipeline.

>
>>> Link: https://github.com/Rust-for-Linux/pin-init [1]
>>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>>> Co-developed-by: Benno Lossin <benno.lossin@proton.me>
>>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>>> ---
>>>  rust/Makefile                      | 75 +++++++++++++++++++++++-------
>>>  rust/pin-init/internal/src/_lib.rs |  3 ++
>>>  rust/pin-init/internal/src/lib.rs  |  4 ++
>>>  rust/pin-init/src/_lib.rs          |  5 ++
>>>  scripts/Makefile.build             |  2 +-
>>>  scripts/generate_rust_analyzer.py  | 17 ++++++-
>>>  6 files changed, 86 insertions(+), 20 deletions(-)
>>>  create mode 100644 rust/pin-init/internal/src/_lib.rs
>>>  create mode 100644 rust/pin-init/src/_lib.rs
>>>
>>> diff --git a/rust/Makefile b/rust/Makefile
>>> index ea3849eb78f6..90310f0620eb 100644
>>> --- a/rust/Makefile
>>> +++ b/rust/Makefile
>>
>> [...]
>>
>>> @@ -110,11 +113,24 @@ rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
>>>  rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
>>>  	+$(call if_changed,rustdoc)
>>>
>>> -rustdoc-kernel: private rustc_target_flags = --extern ffi \
>>> +rustdoc-pin_init_internal: private rustdoc_host = yes
>>> +rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
>>> +    --extern proc_macro --crate-type proc-macro
>>> +rustdoc-pin_init_internal: $(src)/pin-init/internal/src/_lib.rs FORCE
>>> +	+$(call if_changed,rustdoc)
>>> +
>>> +rustdoc-pin_init: private rustdoc_host = yes
>>> +rustdoc-pin_init: private rustc_target_flags = --extern pin_init_internal \
>>> +    --extern macros --extern alloc --cfg kernel --cfg feature=\"alloc\"
>>> +rustdoc-pin_init: $(src)/pin-init/src/_lib.rs rustdoc-pin_init_internal \
>>> +    rustdoc-macros FORCE
>>> +	+$(call if_changed,rustdoc)
>>
>> Is it possible to do some code sharing here, such that when we add a
>> crate, it's just a matter of putting the path/name on a list somewhere?
>
> Miguel informed me that this Makefile won't exist in the new build
> system, so I'd rather not do that.

OK, cool.


Best regards,
Andreas Hindborg




