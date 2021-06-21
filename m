Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190243AF9BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhFUXsI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:48:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:41562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231569AbhFUXsI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:48:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25BEA60FE9;
        Mon, 21 Jun 2021 23:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624319153;
        bh=diaiwAvN8QgNQIX3GIs2NJUIKQAsbDwsiFGinAjrQ34=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=V8BryDAVDTIMQPVGpUUTubRgwnW5TfmAmKm3zBdQE9xtGWlmtoj8t13tnrxDfXa6Z
         8jroe7JygyrNu37Xk8xoL+EKymmY5AT82BlAbjgQgBXhQLriY3B6Izjg8MTtWdSu0t
         xp6+pnROcXocKlZ4iPuR5E4jbn0YW3Eyd7E9xLf0gIR1QZ5R7JZ9RBkSGdU2gJR2uq
         mi0qkzj1dXm/YQwg01ayz8v3Q0H8NM1MBFFykmQOu0cZDOISFo4RWoYXScg4uKY/2D
         4FKdQQqyvQXUysv1iGlKffT83j7FZeMpla13bkNphZzVzCE+IadL6vPjDhDooiU96/
         W0sKl8M2qY3ig==
Subject: Re: [PATCH v2 3/3] Kconfig: add
 ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
 <20210621231822.2848305-4-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <fbf46793-c3fc-8d59-fbb0-1a45d183c981@kernel.org>
Date:   Mon, 21 Jun 2021 16:45:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621231822.2848305-4-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 6/21/2021 4:18 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> We don't want compiler instrumentation to touch noinstr functions, which
> are annotated with the no_profile_instrument_function function
> attribute. Add a Kconfig test for this and make PGO and GCOV depend on
> it.
> 
> If an architecture is using noinstr, it should denote that via this
> Kconfig value. That makes Kconfigs that depend on noinstr able to
> express dependencies in an architecturally agnostic way.
> 
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
> Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Small nit below.

> ---
> Changes V1 -> V2:
> * Add ARCH_WANTS_NO_INSTR
> * Change depdendencies to be !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
>    rather than list architectures explicitly, as per Nathan.
> * s/no_profile/no_profile_instrument_function/
> 
>   arch/Kconfig        | 7 +++++++
>   arch/arm64/Kconfig  | 1 +
>   arch/s390/Kconfig   | 1 +
>   arch/x86/Kconfig    | 1 +
>   init/Kconfig        | 3 +++
>   kernel/gcov/Kconfig | 1 +
>   kernel/pgo/Kconfig  | 3 ++-
>   7 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 2b4109b0edee..2113c6b3b801 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -285,6 +285,13 @@ config ARCH_THREAD_STACK_ALLOCATOR
>   config ARCH_WANTS_DYNAMIC_TASK_STRUCT
>   	bool
>   
> +config ARCH_WANTS_NO_INSTR
> +	bool
> +	help
> +	  An architecure should select this if the noinstr macro is being used on

Architecture

> +	  functions to denote that the toolchain should avoid instrumenting such
> +	  functions and is required for correctness.
> +
>   config ARCH_32BIT_OFF_T
>   	bool
>   	depends on !64BIT
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 9f1d8566bbf9..39bf982b06f8 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -93,6 +93,7 @@ config ARM64
>   	select ARCH_WANT_FRAME_POINTERS
>   	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>   	select ARCH_WANT_LD_ORPHAN_WARN
> +	select ARCH_WANTS_NO_INSTR
>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>   	select ARM_AMBA
>   	select ARM_ARCH_TIMER
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index b4c7c34069f8..bd60310f33b9 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -117,6 +117,7 @@ config S390
>   	select ARCH_USE_BUILTIN_BSWAP
>   	select ARCH_USE_CMPXCHG_LOCKREF
>   	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> +	select ARCH_WANTS_NO_INSTR
>   	select ARCH_WANT_DEFAULT_BPF_JIT
>   	select ARCH_WANT_IPC_PARSE_VERSION
>   	select BUILDTIME_TABLE_SORT
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index da43fd046149..7d6a44bb9b0e 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -114,6 +114,7 @@ config X86
>   	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>   	select ARCH_WANT_DEFAULT_BPF_JIT	if X86_64
>   	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> +	select ARCH_WANTS_NO_INSTR
>   	select ARCH_WANT_HUGE_PMD_SHARE
>   	select ARCH_WANT_LD_ORPHAN_WARN
>   	select ARCH_WANTS_THP_SWAP		if X86_64
> diff --git a/init/Kconfig b/init/Kconfig
> index 1ea12c64e4c9..31397a7a45fb 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -83,6 +83,9 @@ config TOOLS_SUPPORT_RELR
>   config CC_HAS_ASM_INLINE
>   	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
>   
> +config CC_HAS_NO_PROFILE_FN_ATTR
> +	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> +
>   config CONSTRUCTORS
>   	bool
>   
> diff --git a/kernel/gcov/Kconfig b/kernel/gcov/Kconfig
> index 58f87a3092f3..053447183ac5 100644
> --- a/kernel/gcov/Kconfig
> +++ b/kernel/gcov/Kconfig
> @@ -5,6 +5,7 @@ config GCOV_KERNEL
>   	bool "Enable gcov-based kernel profiling"
>   	depends on DEBUG_FS
>   	depends on !CC_IS_CLANG || CLANG_VERSION >= 110000
> +	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
>   	select CONSTRUCTORS
>   	default n
>   	help
> diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
> index d2053df1111c..ce7fe04f303d 100644
> --- a/kernel/pgo/Kconfig
> +++ b/kernel/pgo/Kconfig
> @@ -8,7 +8,8 @@ config PGO_CLANG
>   	bool "Enable clang's PGO-based kernel profiling"
>   	depends on DEBUG_FS
>   	depends on ARCH_SUPPORTS_PGO_CLANG
> -	depends on CC_IS_CLANG && CLANG_VERSION >= 120000
> +	depends on CC_IS_CLANG
> +	depends on !ARCH_WANTS_NO_INSTR || CC_HAS_NO_PROFILE_FN_ATTR
>   	help
>   	  This option enables clang's PGO (Profile Guided Optimization) based
>   	  code profiling to better optimize the kernel.
> 
