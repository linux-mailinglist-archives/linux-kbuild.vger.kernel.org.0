Return-Path: <linux-kbuild+bounces-8447-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43ADB25CDA
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 09:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C6483A81F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 07:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42712494FF;
	Thu, 14 Aug 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1IKT2zw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382C24468A;
	Thu, 14 Aug 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155740; cv=none; b=avRkJlLsM/1S3HCTomVXqEfA9nREKFWdPJGqtsY82rN5BTAoWG0v/W5SwNw9iVnySc65QEx3khJbq4dGGIgWoLhK5X5+T3i0mv72l5HseXtu0nlbmLDQakIlGnT7acR7tay0K2ojuvgxDhJscKAbXQ2q6A5iS4yQIYOjFJ0UFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155740; c=relaxed/simple;
	bh=SaB56iFHq9R1lIIJgY1jOBN/SbTeOE8emRCvNnsEoq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3RQy2Pmj9Fl8lc55CB5FJPsWZJj1lygVl9wXLl0XaGug4U3ii0ZnFgCMQhgsRb3/ufadoafhX/U9I8HrNiXeZJ9OLCifUwialYdnyT4r481mjIDvAuTn+kYhb65vRvbSLMAR21+Z/+oPsol+Uc4+EMjc/TJLMPeSdOD6JNibcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1IKT2zw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A94C4CEEF;
	Thu, 14 Aug 2025 07:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755155740;
	bh=SaB56iFHq9R1lIIJgY1jOBN/SbTeOE8emRCvNnsEoq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1IKT2zwhssHQnjqKIWtvjwXerI6qQ1PNJ4VSL+eAdBxYbqVIjTYRDr4HQdDI2lyQ
	 u6nsFBnRLyaqgFWWbzOeyOQEECfpnB7HFRoM6E3hO6sGlgss41eOmCgTCj8UDbGGiV
	 kcOFxGN3h7q6PRJ0LFnpAK1twBP/I25c5bcY/wvp+piLO9bOEem5o1u/IyOlnGVqs5
	 L90FI8Llj1gEjlrSGyhD/ENLft+kX+3j3yL1mUP3JUHnDXG1H78KF3wqJLtE+umkB6
	 9qj4v3Wff5u7Gq6G5C3vOrkknrJVOKySTv9AXEbB2AQ2VTkv5un2lOKqSHyQjbbKCj
	 5qil2ya53k7Hw==
Date: Thu, 14 Aug 2025 10:15:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: nathan@kernel.org, arnd@arndb.de, broonie@kernel.org,
	Liam.Howlett@oracle.com, urezki@gmail.com, will@kernel.org,
	kaleshsingh@google.com, leitao@debian.org, coxu@redhat.com,
	surenb@google.com, akpm@linux-foundation.org, luto@kernel.org,
	jpoimboe@kernel.org, changyuanl@google.com, hpa@zytor.com,
	dvyukov@google.com, kas@kernel.org, corbet@lwn.net,
	vincenzo.frascino@arm.com, smostafa@google.com,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	andreyknvl@gmail.com, alexander.shishkin@linux.intel.com,
	thiago.bauermann@linaro.org, catalin.marinas@arm.com,
	ryabinin.a.a@gmail.com, jan.kiszka@siemens.com, jbohac@suse.cz,
	dan.j.williams@intel.com, joel.granados@kernel.org,
	baohua@kernel.org, kevin.brodsky@arm.com, nicolas.schier@linux.dev,
	pcc@google.com, andriy.shevchenko@linux.intel.com,
	wei.liu@kernel.org, bp@alien8.de, ada.coupriediaz@arm.com,
	xin@zytor.com, pankaj.gupta@amd.com, vbabka@suse.cz,
	glider@google.com, jgross@suse.com, kees@kernel.org,
	jhubbard@nvidia.com, joey.gouly@arm.com, ardb@kernel.org,
	thuth@redhat.com, pasha.tatashin@soleen.com,
	kristina.martsenko@arm.com, bigeasy@linutronix.de,
	lorenzo.stoakes@oracle.com, jason.andryuk@amd.com, david@redhat.com,
	graf@amazon.com, wangkefeng.wang@huawei.com, ziy@nvidia.com,
	mark.rutland@arm.com, dave.hansen@linux.intel.com,
	samuel.holland@sifive.com, kbingham@kernel.org,
	trintaeoitogc@gmail.com, scott@os.amperecomputing.com,
	justinstitt@google.com, kuan-ying.lee@canonical.com, maz@kernel.org,
	tglx@linutronix.de, samitolvanen@google.com, mhocko@suse.com,
	nunodasneves@linux.microsoft.com, brgerst@gmail.com,
	willy@infradead.org, ubizjak@gmail.com, peterz@infradead.org,
	mingo@redhat.com, sohil.mehta@intel.com, linux-mm@kvack.org,
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, llvm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/18] x86: Reset tag for virtual to physical address
 conversions
Message-ID: <aJ2M_eKPvBluyLKJ@kernel.org>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <01e62233dcc39aeb8d640eb3ee794f5da533f2a3.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01e62233dcc39aeb8d640eb3ee794f5da533f2a3.1755004923.git.maciej.wieczor-retman@intel.com>

On Tue, Aug 12, 2025 at 03:23:42PM +0200, Maciej Wieczor-Retman wrote:
> Any place where pointer arithmetic is used to convert a virtual address
> into a physical one can raise errors if the virtual address is tagged.
> 
> Reset the pointer's tag by sign extending the tag bits in macros that do
> pointer arithmetic in address conversions. There will be no change in
> compiled code with KASAN disabled since the compiler will optimize the
> __tag_reset() out.
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Simplify page_to_virt() by removing pointless casts.
> - Remove change in __is_canonical_address() because it's taken care of
>   in a later patch due to a LAM compatible definition of canonical.
> 
>  arch/x86/include/asm/page.h    | 14 +++++++++++---
>  arch/x86/include/asm/page_64.h |  2 +-
>  arch/x86/mm/physaddr.c         |  1 +
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
> index 9265f2fca99a..15c95e96fd15 100644
> --- a/arch/x86/include/asm/page.h
> +++ b/arch/x86/include/asm/page.h
> @@ -7,6 +7,7 @@
>  #ifdef __KERNEL__
>  
>  #include <asm/page_types.h>
> +#include <asm/kasan.h>
>  
>  #ifdef CONFIG_X86_64
>  #include <asm/page_64.h>
> @@ -41,7 +42,7 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
>  #define __pa(x)		__phys_addr((unsigned long)(x))
>  #endif
>  
> -#define __pa_nodebug(x)	__phys_addr_nodebug((unsigned long)(x))
> +#define __pa_nodebug(x)	__phys_addr_nodebug((unsigned long)(__tag_reset(x)))

Why not reset the tag inside __phys_addr_nodebug() and __phys_addr()?

>  /* __pa_symbol should be used for C visible symbols.
>     This seems to be the official gcc blessed way to do such arithmetic. */
>  /*
> @@ -65,9 +66,16 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
>   * virt_to_page(kaddr) returns a valid pointer if and only if
>   * virt_addr_valid(kaddr) returns true.
>   */
> -#define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
> +
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define page_to_virt(x) ({							\
> +	void *__addr = __va(page_to_pfn((struct page *)x) << PAGE_SHIFT);	\
> +	__tag_set(__addr, page_kasan_tag(x));					\
> +})
> +#endif
> +#define virt_to_page(kaddr)	pfn_to_page(__pa((void *)__tag_reset(kaddr)) >> PAGE_SHIFT)

then virt_to_page() will remain the same, no?

>  extern bool __virt_addr_valid(unsigned long kaddr);
> -#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
> +#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long)(__tag_reset(kaddr)))

The same here, I think tag_reset() should be inside __virt_addr_valid()
  
>  static __always_inline void *pfn_to_kaddr(unsigned long pfn)
>  {
> diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
> index 015d23f3e01f..de68ac40dba2 100644
> --- a/arch/x86/include/asm/page_64.h
> +++ b/arch/x86/include/asm/page_64.h
> @@ -33,7 +33,7 @@ static __always_inline unsigned long __phys_addr_nodebug(unsigned long x)
>  extern unsigned long __phys_addr(unsigned long);
>  extern unsigned long __phys_addr_symbol(unsigned long);
>  #else
> -#define __phys_addr(x)		__phys_addr_nodebug(x)
> +#define __phys_addr(x)		__phys_addr_nodebug(__tag_reset(x))
>  #define __phys_addr_symbol(x) \
>  	((unsigned long)(x) - __START_KERNEL_map + phys_base)
>  #endif
> diff --git a/arch/x86/mm/physaddr.c b/arch/x86/mm/physaddr.c
> index fc3f3d3e2ef2..7f2b11308245 100644
> --- a/arch/x86/mm/physaddr.c
> +++ b/arch/x86/mm/physaddr.c
> @@ -14,6 +14,7 @@
>  #ifdef CONFIG_DEBUG_VIRTUAL
>  unsigned long __phys_addr(unsigned long x)
>  {
> +	x = __tag_reset(x);
>  	unsigned long y = x - __START_KERNEL_map;
>  
>  	/* use the carry flag to determine if x was < __START_KERNEL_map */
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.

