Return-Path: <linux-kbuild+bounces-10432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A75CFDACA
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 13:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4857D30057E3
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 12:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D72032939C;
	Wed,  7 Jan 2026 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlxGzu6R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EC329392;
	Wed,  7 Jan 2026 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788642; cv=none; b=pWtK9zMedbEU0OTMo1BY8Q6UEPgWZ/SwJqGv+QgevIXp6jrsJ7ZvybF115ZJXMU6VnbNmHEAAfRiYiJvP1HoseBrNZwoNSaao7e3FLG2gQZ+Q+Qe3aF9h9p/0S+yM1PVUExEQ6mK5nyhUafUoGX5wiTBnrMHHlU8IijYtUn5J24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788642; c=relaxed/simple;
	bh=Bvupu5pKUncAhUJLwMsrNMafTyDGF9I/qKF4dtQzIQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Izgd9oltrUwOOZlQKlNHtnPhUFy/kT4HoOZX6Wyce+Skd5Jc36DhEIX9VB9MQZTmG0dTNHYb+6/qY9LXQyvsfOYe13f8gNgB6R4bJA1zZYOGFIsp/XPQtOSGs+oq40jCSQpRk0n14w0SXNdWVyD8+hnJzcDJKtARc62dnaMfwgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlxGzu6R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A924DC4CEF7;
	Wed,  7 Jan 2026 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788642;
	bh=Bvupu5pKUncAhUJLwMsrNMafTyDGF9I/qKF4dtQzIQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BlxGzu6RX/AW2lkS5MSu6xZbB2eEgdcN+jse48bS4whRSSv2gXFzrGqnwOdjnT+HF
	 lNJoKD1g8jKBEA2Ba5fUCq1PURT3ARECFeQH7UH+I2hSuHX+xuHbMJucbYvK8jAiD5
	 vvlA/RaA+em7AaVAdk11OllE9r8e6oAEQ9Ya/kFTUda5jKRkaHNufwgwbuBBcSRASL
	 QtfYFxiHK4610hJBt39SFuFQcEd4LrhtviMsDshaFDyKbN07U51gDpOk1X84POnO6k
	 UJvR8c1yqoaEWmS3SotJ9ymLG76mFHUtkEvALM9tt2q9jXsUpzg1rBn4cpkF1fdKJL
	 tiAr5va5WK6og==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon
 <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin
 Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki
 <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
In-Reply-To: <20251203180955.20b41904.gary@garyguo.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251203180955.20b41904.gary@garyguo.net>
Date: Wed, 07 Jan 2026 13:10:07 +0100
Message-ID: <87344hipy8.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Gary Guo <gary@garyguo.net> writes:

> On Tue, 02 Dec 2025 20:27:59 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
>> From: Gary Guo <gary@garyguo.net>
>> 
>> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
>> allow C helpers (which were created to allow Rust to call into
>> inline/macro C functions without having to re-implement the logic in
>> Rust) to be inlined into Rust crates without performing global LTO.
>> 
>> If the option is enabled, the following is performed:
>> * For helpers, instead of compiling them to an object file to be linked
>>   into vmlinux, they're compiled to LLVM IR.
>> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>>   is a performance optimisation to prevent LLVM from always have to
>>   reparse the same IR).
>> * When a Rust crate is compiled, instead of generating an object file, we
>>   ask LLVM bitcode to be generated.
>> * llvm-link is invoked with --internalize to combine the helper bitcode
>>   with the crate bitcode. This step is similar to LTO, but this is much
>>   faster since it only needs to inline the helpers.
>> * clang is invoked to turn the combined bitcode into a final object file.
>> 
>> The --internalize flag tells llvm-link to treat all symbols in
>> helpers.bc using `internal` linkage. This matches the behavior of
>> `clang` on `static inline` functions, and avoids exporting the symbol
>> from the object file.
>
> Huge shout-out to Matthew for discovering this option, this makes thing
> so much nicer and it feels way less hacky and more reliable now.
>
>> 
>> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
>> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
>> Disallow BTF generation with Rust + LTO") for details.
>
> Again this is a much nicer way to workaround the issue than changing
> the language name in the DWARF info using text replacement that I come
> up with :)
>
>> 
>> We have an intended triple mismatch of `aarch64-unknown-none` vs
>> `aarch64-unknown-linux-gnu`, so we suppress the warning.
>> 
>> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
>> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
>> Co-developed-by: Matthew Maurer <mmaurer@google.com>
>> Signed-off-by: Matthew Maurer <mmaurer@google.com>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>>  Makefile               |  4 +++-
>>  lib/Kconfig.debug      | 15 +++++++++++++++
>>  rust/Makefile          | 26 ++++++++++++++++++++++----
>>  rust/exports.c         |  5 ++++-
>>  scripts/Makefile.build |  5 ++++-
>>  5 files changed, 48 insertions(+), 7 deletions(-)
>> 
>> diff --git a/Makefile b/Makefile
>> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>>  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>>  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>>  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
>> +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
>> +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>
> I think this is no longer needed as we only use LLVM BC now without
> having to round-trip between LLVM IR.
>

We should update the commit message to reflect this as well.


Best regards,
Andreas Hindborg




