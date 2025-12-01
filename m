Return-Path: <linux-kbuild+bounces-9921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D49C96583
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 10:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 91713341039
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 09:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C572BE04B;
	Mon,  1 Dec 2025 09:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="kqGB9bm3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9A71C5D72;
	Mon,  1 Dec 2025 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764580546; cv=none; b=uGIT982yzGjUqZ6fyyVeXtwqM6NXteQp3UMBxCPHpOik1Y8kOHMVNhmuDJweFFDnlPEFMm41QVPSv0ysXJSa9dsrcwpGNjDl4+WuVlyB4OnJs7/lNMYDRR8JfHFIxBJIcFSIQq1+fobtlm/N4IpxbSoXo4+GhugVxcRjPlKqxFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764580546; c=relaxed/simple;
	bh=czIpE4+9+FfQLZx0FfytxxzcMS23ZMMCFTyej9A76rw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C1DpNY84ilxbQbcTUZFiVCcsGLKuEw3Qh7LqdaGbZjLo965EN7xcg9l32Qwrixe7iQftk6N/b9J+8ETo+ek962o8qgM8AcsyFh/ZiS5e2+Wd6hkWiiJtsjU4qNwILsDu86ngzUSEfHNX8wlWTIxtKtjS3M1DjpfgajjAEKlPo9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=kqGB9bm3; arc=none smtp.client-ip=185.226.149.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runbox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight@runbox.com>)
	id 1vQ00I-007RTg-FN; Mon, 01 Dec 2025 10:15:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
	bh=A1aE9FNL9Wa0FF02Gl4fjI6YVQrv4fhCdVpT1ZzQa6M=; b=kqGB9bm3lAJJlrRo0w0reOO6d1
	iXZioVyDL2Q1yxRxK+PCasHZDrdYLApbdZRyYWoEBMBdcGk0TCn5ke7wzg7YrVt4Eqlcx8a1fl8MD
	0HXEa8WAGckaUHgG5oR9PNo+fAb+SbMBXO3ZsfY/6Aq97yuHVP4EAkjw6LJrc+BJt/Kdh47r/YOJw
	ScpjSyoGnf7HShPnBxDhC02aesV2WYkSCR09sU8QDjxN1o3YdVqKaTsX+D2jLkX23ZFb4JLVl9dZT
	4dfiZKNA6warGMS7CHSR3sjcU3R4GM5YpaZnvxXR64JdBDJujGNZ2N0vMzCTjm9IZ8xLL395slAY4
	ysGHfUZQ==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight@runbox.com>)
	id 1vQ00H-0003uU-Gc; Mon, 01 Dec 2025 10:15:29 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vQ007-007Kn9-RK; Mon, 01 Dec 2025 10:15:19 +0100
Date: Mon, 1 Dec 2025 09:15:14 +0000
From: david laight <david.laight@runbox.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Sergio =?UTF-8?B?R29uesOhbGV6?= Collado
 <sergio.collado@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: `KSYM_NAME_LEN` strikes again
Message-ID: <20251201091514.0bea544b@pumpkin>
In-Reply-To: <20251201021659.1729308-1-ojeda@kernel.org>
References: <20251201021659.1729308-1-ojeda@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  1 Dec 2025 03:16:59 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> Hi all,
> 
> In some Rust configs with -Os and doctests enabled, we are hitting
> KSYM_NAME_LEN again:
> 
>     Symbol _RINvMs3_NvNtNtCs1ewLyjEZ7Le_6kernel4sync4lock1__INtB6_12___ThePinData
>     NtNvNvNvCs1RN9EnoqSlC_25doctests_kernel_generated43rust_doctest_kernel_sync_lock_spinlock_rs_0
>     4main52__doctest_main_rust_kernel_sync_lock_spinlock_rs_34_05InnerNtNtB8_8spinlock
>     15SpinLockBackendE5stateNtNtCsb7ts3l0a5c3_4core7convert10InfallibleINtNtCs5hDniGXnib3_
>     8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB61_6OpaqueNtNtCse4H1uDrGHP9_
>     8bindings12bindings_raw8spinlockE8ffi_initNCNCNvMs0_B8_INtB8_4LockB15_B3F_E3new0s_0E0B6c_B4j_EEB1d_
>     too long for kallsyms (518 >= 512).
>     Please increase KSYM_NAME_LEN both in kernel and kallsyms.c
> 
> Which expands to e.g.
> 
>     <kernel::sync::lock::_::__ThePinData<doctests_kernel_generated::rust_doctest_kernel_sync_lock_spinlock_rs_0::main::_doctest_main_rust_kernel_sync_lock_spinlock_rs_34_0::Inner,
>     kernel::sync::lock::spinlock::SpinLockBackend>>::state::<core::convert::Infallible,  
>     pin_init::__internal::InitClosure<<kernel::types::Opaque<bindings::bindings_raw::spinlock>>::ffi_init
>     <<kernel::sync::lock::Lock<doctests_kernel_generated::rust_doctest_kernel_sync_lock_spinlock_rs_0::main::_doctest_main_rust_kernel_sync_lock_spinlock_rs_34_0::Inner,
>     kernel::sync::lock::spinlock::SpinLockBackend>>::new::{closure#0}::{closure#1}>::{closure#0},  
>     kernel::types::Opaque<bindings::bindings_raw::spinlock>, core::convert::Infallible>>

Given that is even more unreadable than a typical C++ name is it actually worth printing?
Looking at it, perhaps some of the inner <...> could be replaced with a hash
(possibly with the last real name added) with the ability to look up the hash
in a separate table if needed.
I think that is equivalent to using a short name for a type?

If rust is using the same ELF symbol resolution as C uses in shared libraries
you really don't want long symbols at all.
Clearly no one thought about the performance of dynamic linking.

	David


> 
> If we decide to increase KSYM_NAME_LEN again, we need to use a number
> that is a multiple of 64:
> 
>     BUILD_BUG_ON(KSYM_NAME_LEN % sizeof(u64));
> 
> I first tried with 512+128, but I still saw things symbols slightly over
> that:
> 
>     too long for kallsyms (645 >= 640).
> 
> So I picked 512+256 and it builds clean with a patch like the one below.
> Hopefully nobody relies on it being a power of 2.
> 
> Other options:
> 
>   - Conditionally doing it only for those builds that need it, to avoid
>     penalizing other builds (including normal Rust builds).
> 
>   - Building the Rust side with -O2 for now, or at least tweaking some
>     of the inlining behavior under -Os.
> 
>   - Not supporting Rust for `CC_OPTIMIZE_FOR_SIZE` for now (e.g. under
>     `BROKEN`).
> 
>   - Stop all this and go with a hashing approach like Willy/Linus
>     discussed back then:
> 
>         https://lore.kernel.org/rust-for-linux/CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com/
> 
> Cheers,
> Miguel
> 
> From: Miguel Ojeda <ojeda@kernel.org>
> Date: Sun, 30 Nov 2025 17:46:29 +0100
> Subject: [PATCH] kallsyms: increase KSYM_NAME_LEN to 768 (512+256)
> 
> Untested!
> ---
>  include/linux/kallsyms.h            | 2 +-
>  kernel/livepatch/core.c             | 4 ++--
>  lib/tests/longest_symbol_kunit.c    | 7 +++++--
>  scripts/kallsyms.c                  | 2 +-
>  tools/include/linux/kallsyms.h      | 2 +-
>  tools/lib/perf/include/perf/event.h | 2 +-
>  tools/lib/symbol/kallsyms.h         | 2 +-
>  7 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index d5dd54c53ace..f17d335f36b2 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -15,7 +15,7 @@
> 
>  #include <asm/sections.h>
> 
> -#define KSYM_NAME_LEN 512
> +#define KSYM_NAME_LEN 768
>  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
>  			(KSYM_NAME_LEN - 1) + \
>  			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index 0e73fac55f8e..cf7f2d561386 100644
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -210,7 +210,7 @@ static int klp_resolve_symbols(Elf_Shdr *sechdrs, const char *strtab,
>  	 * we use the smallest/strictest upper bound possible (56, based on
>  	 * the current definition of MODULE_NAME_LEN) to prevent overflows.
>  	 */
> -	BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 512);
> +	BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 768);
> 
>  	relas = (Elf_Rela *) relasec->sh_addr;
>  	/* For each rela in this klp relocation section */
> @@ -224,7 +224,7 @@ static int klp_resolve_symbols(Elf_Shdr *sechdrs, const char *strtab,
> 
>  		/* Format: .klp.sym.sym_objname.sym_name,sympos */
>  		cnt = sscanf(strtab + sym->st_name,
> -			     ".klp.sym.%55[^.].%511[^,],%lu",
> +			     ".klp.sym.%55[^.].%767[^,],%lu",
>  			     sym_objname, sym_name, &sympos);
>  		if (cnt != 3) {
>  			pr_err("symbol %s has an incorrectly formatted name\n",
> diff --git a/lib/tests/longest_symbol_kunit.c b/lib/tests/longest_symbol_kunit.c
> index 9b4de3050ba7..ff8eed2cb4bd 100644
> --- a/lib/tests/longest_symbol_kunit.c
> +++ b/lib/tests/longest_symbol_kunit.c
> @@ -19,8 +19,11 @@
>  #define DDDDI(name) DDDI(n##name##name)
>  #define DDDDDI(name) DDDDI(n##name##name)
> 
> -/*Generate a symbol whose name length is 511 */
> -#define LONGEST_SYM_NAME  DDDDDI(g1h2i3j4k5l6m7n)
> +#define __SUM(A, B) s##A##B
> +#define SUM(A, B) __SUM(A, B)
> +
> +/* Generate a symbol whose name length is KSYM_NAME_LEN (including null) */
> +#define LONGEST_SYM_NAME SUM(DDDDDI(g1h2i3j4k5l6m7n),DDDDI(g1h2i3j4k5l6m7n))
> 
>  #define RETURN_LONGEST_SYM 0xAAAAA
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 4b0234e4b12f..c90bb90c874e 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -31,7 +31,7 @@
> 
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
> 
> -#define KSYM_NAME_LEN		512
> +#define KSYM_NAME_LEN		768
> 
>  struct sym_entry {
>  	unsigned long long addr;
> diff --git a/tools/include/linux/kallsyms.h b/tools/include/linux/kallsyms.h
> index f61a01dd7eb7..089b59906641 100644
> --- a/tools/include/linux/kallsyms.h
> +++ b/tools/include/linux/kallsyms.h
> @@ -6,7 +6,7 @@
>  #include <stdio.h>
>  #include <unistd.h>
> 
> -#define KSYM_NAME_LEN 512
> +#define KSYM_NAME_LEN 768
> 
>  struct module;
> 
> diff --git a/tools/lib/perf/include/perf/event.h b/tools/lib/perf/include/perf/event.h
> index aa1e91c97a22..ea3debf97db9 100644
> --- a/tools/lib/perf/include/perf/event.h
> +++ b/tools/lib/perf/include/perf/event.h
> @@ -104,7 +104,7 @@ struct perf_record_throttle {
>  };
> 
>  #ifndef KSYM_NAME_LEN
> -#define KSYM_NAME_LEN 512
> +#define KSYM_NAME_LEN 768
>  #endif
> 
>  struct perf_record_ksymbol {
> diff --git a/tools/lib/symbol/kallsyms.h b/tools/lib/symbol/kallsyms.h
> index 542f9b059c3b..435f626c92d1 100644
> --- a/tools/lib/symbol/kallsyms.h
> +++ b/tools/lib/symbol/kallsyms.h
> @@ -7,7 +7,7 @@
>  #include <linux/types.h>
> 
>  #ifndef KSYM_NAME_LEN
> -#define KSYM_NAME_LEN 512
> +#define KSYM_NAME_LEN 768
>  #endif
> 
>  static inline u8 kallsyms2elf_binding(char type)
> 
> base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
> --
> 2.52.0
> 


