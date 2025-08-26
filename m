Return-Path: <linux-kbuild+bounces-8621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C99FB37342
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 21:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3057C83CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 19:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFD130CDA6;
	Tue, 26 Aug 2025 19:36:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7B30CD9C;
	Tue, 26 Aug 2025 19:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756236963; cv=none; b=cd4N/MBvKhB5DwIlZjzyknwN22NLWmsiLigvbWvhWa+TMCY9a+/TRG1xCFWBk8Rsushpcu7yFGJ710aH5/rKqvx2DBC3CXp+6+KpiEshcX06cqyAWK3kW8FThizNOVx07MUoTy0Tvsnk8zQ17YXcUkIoz02dTzxFVxptNE4TSiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756236963; c=relaxed/simple;
	bh=ImPCF0h9qhB4CNXF/XQ28X9QdZ/208iR72qSvUoVI78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC/6bPGaQYzXFzHCwI6rAO1NG7AIeVQNlwplT3uC3a4gfnCaeHL88UcY3Ee1l6DOujgrhKI1g7iaFQxPGiqHe0+L5TYszSYb9mypdmCC4QZnoDMkd4ubHEtZanXikEp3NbYTwtTzZquATb+olnhrznTn3Ai6FO/OLRvhMLLzg3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEA5C4CEF1;
	Tue, 26 Aug 2025 19:35:47 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:35:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com,
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com,
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com,
	trintaeoitogc@gmail.com, axelrasmussen@google.com,
	yuanchu@google.com, joey.gouly@arm.com, samitolvanen@google.com,
	joel.granados@kernel.org, graf@amazon.com,
	vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org,
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com,
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz,
	kaleshsingh@google.com, justinstitt@google.com,
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com,
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com,
	dvyukov@google.com, tglx@linutronix.de,
	scott@os.amperecomputing.com, jason.andryuk@amd.com,
	morbo@google.com, nathan@kernel.org, lorenzo.stoakes@oracle.com,
	mingo@redhat.com, brgerst@gmail.com, kristina.martsenko@arm.com,
	bigeasy@linutronix.de, luto@kernel.org, jgross@suse.com,
	jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com,
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org,
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com,
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com,
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org,
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com,
	rppt@kernel.org, pcc@google.com, jan.kiszka@siemens.com,
	nicolas.schier@linux.dev, will@kernel.org, andreyknvl@gmail.com,
	jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 01/19] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <aK4MlVgsaUv-u7mS@arm.com>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <7e314394fc5643def4cd4c6f34ebe09c85c43852.1756151769.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e314394fc5643def4cd4c6f34ebe09c85c43852.1756151769.git.maciej.wieczor-retman@intel.com>

On Mon, Aug 25, 2025 at 10:24:26PM +0200, Maciej Wieczor-Retman wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..82cbfc7d1233 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -431,11 +431,11 @@ config KASAN_SHADOW_OFFSET
>  	default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
>  	default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
>  	default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
> -	default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
> -	default 0xefffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && KASAN_SW_TAGS
> -	default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
> -	default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
> -	default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
> +	default 0xffff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
> +	default 0xffffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && KASAN_SW_TAGS
> +	default 0xfffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
> +	default 0xffffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
> +	default 0xfffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
>  	default 0xffffffffffffffff
>  
>  config UNWIND_TABLES
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index 5213248e081b..277d56ceeb01 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -89,7 +89,15 @@
>   *
>   * KASAN_SHADOW_END is defined first as the shadow address that corresponds to
>   * the upper bound of possible virtual kernel memory addresses UL(1) << 64
> - * according to the mapping formula.
> + * according to the mapping formula. For Generic KASAN, the address in the
> + * mapping formula is treated as unsigned (part of the compiler's ABI), so the
> + * end of the shadow memory region is at a large positive offset from
> + * KASAN_SHADOW_OFFSET. For Software Tag-Based KASAN, the address in the
> + * formula is treated as signed. Since all kernel addresses are negative, they
> + * map to shadow memory below KASAN_SHADOW_OFFSET, making KASAN_SHADOW_OFFSET
> + * itself the end of the shadow memory region. (User pointers are positive and
> + * would map to shadow memory above KASAN_SHADOW_OFFSET, but shadow memory is
> + * not allocated for them.)
>   *
>   * KASAN_SHADOW_START is defined second based on KASAN_SHADOW_END. The shadow
>   * memory start must map to the lowest possible kernel virtual memory address
> @@ -100,7 +108,11 @@
>   */
>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>  #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> +#ifdef CONFIG_KASAN_GENERIC
>  #define KASAN_SHADOW_END	((UL(1) << (64 - KASAN_SHADOW_SCALE_SHIFT)) + KASAN_SHADOW_OFFSET)
> +#else
> +#define KASAN_SHADOW_END	KASAN_SHADOW_OFFSET
> +#endif
>  #define _KASAN_SHADOW_START(va)	(KASAN_SHADOW_END - (UL(1) << ((va) - KASAN_SHADOW_SCALE_SHIFT)))
>  #define KASAN_SHADOW_START	_KASAN_SHADOW_START(vabits_actual)
>  #define PAGE_END		KASAN_SHADOW_START
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index d541ce45daeb..dc2de12c4f26 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -198,8 +198,11 @@ static bool __init root_level_aligned(u64 addr)
>  /* The early shadow maps everything to a single page of zeroes */
>  asmlinkage void __init kasan_early_init(void)
>  {
> -	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
> -		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +		BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
> +			KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
> +	else
> +		BUILD_BUG_ON(KASAN_SHADOW_OFFSET != KASAN_SHADOW_END);
>  	BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS), SHADOW_ALIGN));
>  	BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS_MIN), SHADOW_ALIGN));
>  	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, SHADOW_ALIGN));

For the arm64 parts:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

I wonder whether it's worth keeping the generic KASAN mode for arm64.
We've had the hardware TBI from the start, so the architecture version
is not an issue. The compiler support may differ though.

Anyway, that would be more suitable for a separate cleanup patch.

-- 
Catalin

