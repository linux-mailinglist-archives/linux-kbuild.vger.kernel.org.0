Return-Path: <linux-kbuild+bounces-1-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B77E7E97
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 18:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A4692811FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 17:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FFF22328;
	Fri, 10 Nov 2023 17:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010C420B14;
	Fri, 10 Nov 2023 17:46:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CD6A28106;
	Fri, 10 Nov 2023 02:17:12 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7229C1691;
	Fri, 10 Nov 2023 02:17:56 -0800 (PST)
Received: from [192.168.4.21] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EC783F6C4;
	Fri, 10 Nov 2023 02:16:58 -0800 (PST)
Message-ID: <8288a2e5-afa3-462a-9470-0b010e4bc5bc@arm.com>
Date: Fri, 10 Nov 2023 10:16:46 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Guo Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geoff Levand <geoff@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 x86@kernel.org, Helge Deller <deller@gmx.de>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Timur Tabi <timur@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>,
 David Woodhouse <dwmw2@infradead.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Kees Cook <keescook@chromium.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, netdev@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20231108125843.3806765-16-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 11/8/23 12:58, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The VDSO functions are defined as globals in the kernel sources but intended
> to be called from userspace, so there is no need to declare them in a kernel
> side header.
> 
> Without a prototype, this now causes warnings such as
> 
> arch/mips/vdso/vgettimeofday.c:14:5: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]
> arch/mips/vdso/vgettimeofday.c:28:5: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]
> arch/mips/vdso/vgettimeofday.c:36:5: error: no previous prototype for '__vdso_clock_getres' [-Werror=missing-prototypes]
> arch/mips/vdso/vgettimeofday.c:42:5: error: no previous prototype for '__vdso_clock_gettime64' [-Werror=missing-prototypes]
> arch/sparc/vdso/vclock_gettime.c:254:1: error: no previous prototype for '__vdso_clock_gettime' [-Werror=missing-prototypes]
> arch/sparc/vdso/vclock_gettime.c:282:1: error: no previous prototype for '__vdso_clock_gettime_stick' [-Werror=missing-prototypes]
> arch/sparc/vdso/vclock_gettime.c:307:1: error: no previous prototype for '__vdso_gettimeofday' [-Werror=missing-prototypes]
> arch/sparc/vdso/vclock_gettime.c:343:1: error: no previous prototype for '__vdso_gettimeofday_stick' [-Werror=missing-prototypes]
> 
> Most architectures have already added workarounds for these by adding
> declarations somewhere, but since these are all compatible, we should
> really just have one copy, with an #ifdef check for the 32-bit vs
> 64-bit variant and use that everywhere.
> 

I agree, it is a good idea to have a single header for this purpose.

> Unfortunately, the sparc version is currently incompatible since
> that never added support for __vdso_clock_gettime64() in 32-bit
> userland. For the moment, I'm leaving this one out, as I can't
> easily test it and it requires a larger rework.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  arch/arm/include/asm/vdso.h              |  5 -----
>  arch/arm/vdso/vgettimeofday.c            |  1 +
>  arch/arm64/kernel/vdso32/vgettimeofday.c |  1 +
>  arch/csky/kernel/vdso/vgettimeofday.c    | 11 +----------
>  arch/loongarch/vdso/vgettimeofday.c      |  7 +------
>  arch/mips/vdso/vgettimeofday.c           |  1 +
>  arch/riscv/kernel/vdso/vgettimeofday.c   |  7 +------
>  arch/x86/entry/vdso/vclock_gettime.c     | 10 +---------
>  arch/x86/include/asm/vdso/gettimeofday.h |  2 --
>  arch/x86/um/vdso/um_vdso.c               |  1 +
>  include/vdso/gettime.h                   | 23 +++++++++++++++++++++++
>  11 files changed, 31 insertions(+), 38 deletions(-)
>  create mode 100644 include/vdso/gettime.h
> 
> diff --git a/arch/arm/include/asm/vdso.h b/arch/arm/include/asm/vdso.h
> index 422c3afa806a..5b85889f82ee 100644
> --- a/arch/arm/include/asm/vdso.h
> +++ b/arch/arm/include/asm/vdso.h
> @@ -24,11 +24,6 @@ static inline void arm_install_vdso(struct mm_struct *mm, unsigned long addr)
>  
>  #endif /* CONFIG_VDSO */
>  
> -int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
> -int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
> -int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
> -int __vdso_clock_getres(clockid_t clock_id, struct old_timespec32 *res);
> -
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* __KERNEL__ */
> diff --git a/arch/arm/vdso/vgettimeofday.c b/arch/arm/vdso/vgettimeofday.c
> index a003beacac76..3554aa35f1ba 100644
> --- a/arch/arm/vdso/vgettimeofday.c
> +++ b/arch/arm/vdso/vgettimeofday.c
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>  #include <asm/vdso.h>
>  #include <asm/unwind.h>
> +#include <vdso/gettime.h>
>  
>  int __vdso_clock_gettime(clockid_t clock,
>  			 struct old_timespec32 *ts)
> diff --git a/arch/arm64/kernel/vdso32/vgettimeofday.c b/arch/arm64/kernel/vdso32/vgettimeofday.c
> index 5acff29c5991..e23c7f4ef26b 100644
> --- a/arch/arm64/kernel/vdso32/vgettimeofday.c
> +++ b/arch/arm64/kernel/vdso32/vgettimeofday.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2018 ARM Limited
>   *
>   */
> +#include <vdso/gettime.h>
>  
>  int __vdso_clock_gettime(clockid_t clock,
>  			 struct old_timespec32 *ts)
> diff --git a/arch/csky/kernel/vdso/vgettimeofday.c b/arch/csky/kernel/vdso/vgettimeofday.c
> index c4831145eed5..55af30e83752 100644
> --- a/arch/csky/kernel/vdso/vgettimeofday.c
> +++ b/arch/csky/kernel/vdso/vgettimeofday.c
> @@ -2,36 +2,27 @@
>  
>  #include <linux/time.h>
>  #include <linux/types.h>
> +#include <vdso/gettime.h>
>  
>  extern
> -int __vdso_clock_gettime(clockid_t clock,
> -			 struct old_timespec32 *ts);
>  int __vdso_clock_gettime(clockid_t clock,
>  			 struct old_timespec32 *ts)
>  {
>  	return __cvdso_clock_gettime32(clock, ts);
>  }
>  
> -int __vdso_clock_gettime64(clockid_t clock,
> -			   struct __kernel_timespec *ts);
>  int __vdso_clock_gettime64(clockid_t clock,
>  			   struct __kernel_timespec *ts)
>  {
>  	return __cvdso_clock_gettime(clock, ts);
>  }
>  
> -extern
> -int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
> -			struct timezone *tz);
>  int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
>  			struct timezone *tz)
>  {
>  	return __cvdso_gettimeofday(tv, tz);
>  }
>  
> -extern
> -int __vdso_clock_getres(clockid_t clock_id,
> -			struct old_timespec32 *res);
>  int __vdso_clock_getres(clockid_t clock_id,
>  			struct old_timespec32 *res)
>  {
> diff --git a/arch/loongarch/vdso/vgettimeofday.c b/arch/loongarch/vdso/vgettimeofday.c
> index 8f22863bd7ea..0885c1f3a89d 100644
> --- a/arch/loongarch/vdso/vgettimeofday.c
> +++ b/arch/loongarch/vdso/vgettimeofday.c
> @@ -5,23 +5,18 @@
>   * Copyright (C) 2020-2022 Loongson Technology Corporation Limited
>   */
>  #include <linux/types.h>
> +#include <vdso/gettime.h>
>  
> -extern
> -int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
>  int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
>  {
>  	return __cvdso_clock_gettime(clock, ts);
>  }
>  
> -extern
> -int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
>  int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
>  {
>  	return __cvdso_gettimeofday(tv, tz);
>  }
>  
> -extern
> -int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res);
>  int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res)
>  {
>  	return __cvdso_clock_getres(clock_id, res);
> diff --git a/arch/mips/vdso/vgettimeofday.c b/arch/mips/vdso/vgettimeofday.c
> index 6b83b6376a4b..604afea3f336 100644
> --- a/arch/mips/vdso/vgettimeofday.c
> +++ b/arch/mips/vdso/vgettimeofday.c
> @@ -9,6 +9,7 @@
>   */
>  #include <linux/time.h>
>  #include <linux/types.h>
> +#include <vdso/gettime.h>
>  
>  #if _MIPS_SIM != _MIPS_SIM_ABI64
>  int __vdso_clock_gettime(clockid_t clock,
> diff --git a/arch/riscv/kernel/vdso/vgettimeofday.c b/arch/riscv/kernel/vdso/vgettimeofday.c
> index cc0d80699c31..b35057802584 100644
> --- a/arch/riscv/kernel/vdso/vgettimeofday.c
> +++ b/arch/riscv/kernel/vdso/vgettimeofday.c
> @@ -8,23 +8,18 @@
>  
>  #include <linux/time.h>
>  #include <linux/types.h>
> +#include <vdso/gettime.h>
>  
> -extern
> -int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
>  int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
>  {
>  	return __cvdso_clock_gettime(clock, ts);
>  }
>  
> -extern
> -int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
>  int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
>  {
>  	return __cvdso_gettimeofday(tv, tz);
>  }
>  
> -extern
> -int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res);
>  int __vdso_clock_getres(clockid_t clock_id, struct __kernel_timespec *res)
>  {
>  	return __cvdso_clock_getres(clock_id, res);
> diff --git a/arch/x86/entry/vdso/vclock_gettime.c b/arch/x86/entry/vdso/vclock_gettime.c
> index 7d70935b6758..0debc194bd78 100644
> --- a/arch/x86/entry/vdso/vclock_gettime.c
> +++ b/arch/x86/entry/vdso/vclock_gettime.c
> @@ -11,12 +11,10 @@
>  #include <linux/time.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
> +#include <vdso/gettime.h>
>  
>  #include "../../../../lib/vdso/gettimeofday.c"
>  
> -extern int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
> -extern __kernel_old_time_t __vdso_time(__kernel_old_time_t *t);
> -
>  int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
>  {
>  	return __cvdso_gettimeofday(tv, tz);
> @@ -35,9 +33,6 @@ __kernel_old_time_t time(__kernel_old_time_t *t)	__attribute__((weak, alias("__v
>  
>  #if defined(CONFIG_X86_64) && !defined(BUILD_VDSO32_64)
>  /* both 64-bit and x32 use these */
> -extern int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
> -extern int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
> -
>  int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
>  {
>  	return __cvdso_clock_gettime(clock, ts);
> @@ -56,9 +51,6 @@ int clock_getres(clockid_t, struct __kernel_timespec *)
>  
>  #else
>  /* i386 only */
> -extern int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
> -extern int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res);
> -
>  int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
>  {
>  	return __cvdso_clock_gettime32(clock, ts);
> diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
> index c81858d903dc..a46edb0e0cf7 100644
> --- a/arch/x86/include/asm/vdso/gettimeofday.h
> +++ b/arch/x86/include/asm/vdso/gettimeofday.h
> @@ -337,8 +337,6 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
>  }
>  #define vdso_calc_delta vdso_calc_delta
>  
> -int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
> -
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
> diff --git a/arch/x86/um/vdso/um_vdso.c b/arch/x86/um/vdso/um_vdso.c
> index ff0f3b4b6c45..63768dd347ce 100644
> --- a/arch/x86/um/vdso/um_vdso.c
> +++ b/arch/x86/um/vdso/um_vdso.c
> @@ -12,6 +12,7 @@
>  #include <linux/time.h>
>  #include <linux/getcpu.h>
>  #include <asm/unistd.h>
> +#include <vdso/gettime.h>
>  
>  int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
>  {
> diff --git a/include/vdso/gettime.h b/include/vdso/gettime.h
> new file mode 100644
> index 000000000000..c50d152e7b3e
> --- /dev/null
> +++ b/include/vdso/gettime.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _VDSO_GETTIME_H
> +#define _VDSO_GETTIME_H
> +
> +#include <linux/types.h>
> +
> +struct __kernel_timespec;
> +struct timezone;
> +
> +#if !defined(CONFIG_64BIT) || defined(BUILD_VDSO32_64)
> +struct old_timespec32;
> +int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res);
> +int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts);
> +#else
> +int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *res);
> +int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts);
> +#endif
> +
> +__kernel_old_time_t __vdso_time(__kernel_old_time_t *t);
> +int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz);
> +int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts);
> +
> +#endif

-- 
Regards,
Vincenzo

