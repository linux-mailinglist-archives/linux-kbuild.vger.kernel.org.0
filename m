Return-Path: <linux-kbuild+bounces-5964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992DA4FE48
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 13:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B563170E14
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 12:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B067D24394F;
	Wed,  5 Mar 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="nIwtr9Kx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4909C21420F
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Mar 2025 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176632; cv=none; b=PUhOCdYITREyD/mrtCtMdtd0YQYepCFeKNQ1cdXblyK9Pxk/TVn8fRWFQqSzhc8Lm351hDiXg59KV/tueYmQ2ZUAVAzvuQscYswyM0Ruy4FYOE11yyMv3XCettWMKlHDwVKJI9dZFdIt0hleX6whw2rbZALJwaD7j11UpTpNGdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176632; c=relaxed/simple;
	bh=kUSurVMVnAPvE/KshwwEUxfjvmNUPNSd5SRUldxaJ1E=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VYwmnpT4GcxN/+hq4s7gwx5F25UlNgpbv+5mm0Uxt+J8kEfFDG0Kz/e3R8GZe4k8gagCOP4RQtivjWP+OV5Z9vip+gOSnSpxjXEmrCgCDBNAc0AC2utdBFC484G3t/H0aheNgzmKIvlkRhmcOKDfb2ufzXfn/70EzXjOztjXUsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=nIwtr9Kx; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741176627; x=1741435827;
	bh=Ck4lBjZxB9KVixGHfs5/+fTFHKFn0s5CSjOrvlAaxYM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=nIwtr9KxzKoDX7usrC2IvY3MacB1zPjYKePDwvR0paTj4XIfsKFb1PFRiZU/IcxvP
	 eRAxTVr8x+NZqlZHnREMdPMqEK3vbCpRhPX8aLtE3odGk8cDZqZVej/SVCQnzPiPC+
	 4WDWoCDpNEy8LmrOIq0rXZHZZNFUbVh98PDO09jicSceyPSVecoj3iKpxKrRz2mZcQ
	 SX/eEu/wO8nI3vyLXOERfxXSQmhmcqW4ylzp5WvgFhm/LVHClhFVzEwjtb6wQzMLlj
	 j9ILa/Kj5cIWIiflSBT9JzDfD8ZCQTaKdKKVRBypnIpVypFxXxW3tLExt75zc+oAvd
	 78faI9cWvijhQ==
Date: Wed, 05 Mar 2025 12:10:20 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
Message-ID: <D88BLHENDH8Y.HQUKEXN1XB7C@proton.me>
In-Reply-To: <87h647d6xg.fsf@kernel.org>
References: <20250304225245.2033120-1-benno.lossin@proton.me> <jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid> <20250304225245.2033120-15-benno.lossin@proton.me> <87h647d6xg.fsf@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4ce2da989afae251f50e67a0e93c3995720d515d
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 5, 2025 at 12:59 PM CET, Andreas Hindborg wrote:
> "Benno Lossin" <benno.lossin@proton.me> writes:
>
>> From: Miguel Ojeda <ojeda@kernel.org>
>>
>> Add infrastructure for moving the initialization API to its own crate.
>> Covers all make targets such as `rust-analyzer` and `rustdoc`. The tests
>> of pin-init are not added to `rusttest`, as they are already tested in
>> the user-space repository [1].
>
> If it's not too much hassle, why not add them in the kernel as well? I
> would rather not have to go fetch the user space repo from github, in
> the event that I ever need to patch pin-init.

I tried to add them, but encountered a lot of problems. Maybe the new
build system can help with that. But if you insist, I can try to get
them to work again in a different series now.

The tests run every day in the GitHub CI and any changes that go through
the pin-init-next tree will also be tested there before I submit any
PRs.

>> Link: https://github.com/Rust-for-Linux/pin-init [1]
>> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>> Co-developed-by: Benno Lossin <benno.lossin@proton.me>
>> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>> ---
>>  rust/Makefile                      | 75 +++++++++++++++++++++++-------
>>  rust/pin-init/internal/src/_lib.rs |  3 ++
>>  rust/pin-init/internal/src/lib.rs  |  4 ++
>>  rust/pin-init/src/_lib.rs          |  5 ++
>>  scripts/Makefile.build             |  2 +-
>>  scripts/generate_rust_analyzer.py  | 17 ++++++-
>>  6 files changed, 86 insertions(+), 20 deletions(-)
>>  create mode 100644 rust/pin-init/internal/src/_lib.rs
>>  create mode 100644 rust/pin-init/src/_lib.rs
>>
>> diff --git a/rust/Makefile b/rust/Makefile
>> index ea3849eb78f6..90310f0620eb 100644
>> --- a/rust/Makefile
>> +++ b/rust/Makefile
>
> [...]
>
>> @@ -110,11 +113,24 @@ rustdoc-compiler_builtins: $(src)/compiler_builtin=
s.rs rustdoc-core FORCE
>>  rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
>>  =09+$(call if_changed,rustdoc)
>>
>> -rustdoc-kernel: private rustc_target_flags =3D --extern ffi \
>> +rustdoc-pin_init_internal: private rustdoc_host =3D yes
>> +rustdoc-pin_init_internal: private rustc_target_flags =3D --cfg kernel =
\
>> +    --extern proc_macro --crate-type proc-macro
>> +rustdoc-pin_init_internal: $(src)/pin-init/internal/src/_lib.rs FORCE
>> +=09+$(call if_changed,rustdoc)
>> +
>> +rustdoc-pin_init: private rustdoc_host =3D yes
>> +rustdoc-pin_init: private rustc_target_flags =3D --extern pin_init_inte=
rnal \
>> +    --extern macros --extern alloc --cfg kernel --cfg feature=3D\"alloc=
\"
>> +rustdoc-pin_init: $(src)/pin-init/src/_lib.rs rustdoc-pin_init_internal=
 \
>> +    rustdoc-macros FORCE
>> +=09+$(call if_changed,rustdoc)
>
> Is it possible to do some code sharing here, such that when we add a
> crate, it's just a matter of putting the path/name on a list somewhere?

Miguel informed me that this Makefile won't exist in the new build
system, so I'd rather not do that.

---
Cheers,
Benno


