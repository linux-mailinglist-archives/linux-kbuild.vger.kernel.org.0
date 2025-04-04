Return-Path: <linux-kbuild+bounces-6437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F38CBA7C29D
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 19:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27EE17DFEC
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 17:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BE2215045;
	Fri,  4 Apr 2025 17:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoGWg2zc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D222080D2;
	Fri,  4 Apr 2025 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788315; cv=none; b=DRyCff0rptZlAKB45+JGCIsz5MLgH867/QoRGLrmCy507WnBx7BFh6a2vd42m51Hpj3P7IoYnHrMCud4VYQPGBle5FOG3sMDmMQ1IidOE9pbFWmKFNhlC0KMKTqasbMiM0nnOELHgrINbBN5/flI2o31IbgZRO8/X29Aq44vb+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788315; c=relaxed/simple;
	bh=g+uO3D1xVb3e3yklJX3PTIFd83TRp4sbPtUUCMweR8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K12wAyx80Ek88GvxArTox9v58Ru0UVp2VxfxVwfcrV7mpE9HEyElwGEiF0cIxvnOr3C6h2oQf8rLriEa5tOYL9gIRCFNsJPH/Cs2kJhrA0/tdbcrmo4NJh66JVn5HZpRYSmRrjANU8wD1km3Vxe9rdaMPk9DV1IWtTl/9NEX5wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoGWg2zc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743788313; x=1775324313;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=g+uO3D1xVb3e3yklJX3PTIFd83TRp4sbPtUUCMweR8c=;
  b=LoGWg2zc85L3MtCW9M0RnRjYeUjfCfc0SbdjTpMnIE4ilWbDbrYdn4SJ
   f8d7yHR8nIsgdvhl0i6ulaL/+I3ihAi9p9eyzeJ0/o+q843oefIrWKMGa
   ycv8sGLfCjxiNKRfQtUNRCB58bqRSoxsM/oguUrwOfYjtBxDFx/tGCQCa
   4eDfXKoIjJLmr7Set3KB8NnuJfrs8HZ2jnzcJ8Usnmq95ky1EQvkfgH8e
   OWeOmxuGU54NHhP4fgu2sYtW5o9g/mkDdKDJUnrm18j5N8/w1EUmLfPnG
   4qxesSKnpj/h9eDurB6pil5DZTAdt37Py8ixB8XqIGPuyKAPn+Sd10wKV
   g==;
X-CSE-ConnectionGUID: Fxrpikc1Rh+WP1ouzgzrGw==
X-CSE-MsgGUID: FOd7TFfBRd6acvYzub51Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="62773792"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="62773792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:38:32 -0700
X-CSE-ConnectionGUID: 3jueK+bYQvGsWn/SgG7b1Q==
X-CSE-MsgGUID: vVkKM15nSt2oK2nSl/uuYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128215225"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.124.223.29]) ([10.124.223.29])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:37:54 -0700
Message-ID: <8416848c-700a-4ff0-8a22-aa62579d60cd@intel.com>
Date: Fri, 4 Apr 2025 10:37:53 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] x86: Update the KASAN non-canonical hook
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, hpa@zytor.com,
 hch@infradead.org, nick.desaulniers+lkml@gmail.com,
 kuan-ying.lee@canonical.com, masahiroy@kernel.org,
 samuel.holland@sifive.com, mingo@redhat.com, corbet@lwn.net,
 ryabinin.a.a@gmail.com, guoweikang.kernel@gmail.com, jpoimboe@kernel.org,
 ardb@kernel.org, vincenzo.frascino@arm.com, glider@google.com,
 kirill.shutemov@linux.intel.com, apopple@nvidia.com,
 samitolvanen@google.com, kaleshsingh@google.com, jgross@suse.com,
 andreyknvl@gmail.com, scott@os.amperecomputing.com, tony.luck@intel.com,
 dvyukov@google.com, pasha.tatashin@soleen.com, ziy@nvidia.com,
 broonie@kernel.org, gatlin.newhouse@gmail.com, jackmanb@google.com,
 wangkefeng.wang@huawei.com, thiago.bauermann@linaro.org, tglx@linutronix.de,
 kees@kernel.org, akpm@linux-foundation.org, jason.andryuk@amd.com,
 snovitoll@gmail.com, xin@zytor.com, jan.kiszka@siemens.com, bp@alien8.de,
 rppt@kernel.org, peterz@infradead.org, pankaj.gupta@amd.com,
 thuth@redhat.com, andriy.shevchenko@linux.intel.com,
 joel.granados@kernel.org, kbingham@kernel.org, nicolas@fjasle.eu,
 mark.rutland@arm.com, surenb@google.com, catalin.marinas@arm.com,
 morbo@google.com, justinstitt@google.com, ubizjak@gmail.com,
 jhubbard@nvidia.com, urezki@gmail.com, dave.hansen@linux.intel.com,
 bhe@redhat.com, luto@kernel.org, baohua@kernel.org, nathan@kernel.org,
 will@kernel.org, brgerst@gmail.com
Cc: llvm@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, x86@kernel.org
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <c37c89e71ed5a8e404b24b31e23457af12f872f2.1743772053.git.maciej.wieczor-retman@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <c37c89e71ed5a8e404b24b31e23457af12f872f2.1743772053.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
> The kasan_non_canonical_hook() is useful in pointing out that an address
> which caused some kind of error could be the result of
> kasan_mem_to_shadow() mapping. Currently it's called only in the general
> protection handler code path but can give helpful information also in
> page fault oops reports.
> 
> For example consider a page fault for address 0xffdefc0000000000 on a
> 5-level paging system. It could have been accessed from KASAN's
> kasan_mem_to_shadow() called on 0xfef0000000000000 address. Without the
> kasan_non_canonical_hook() in the page fault case it might be hard to
> figure out why an error occurred.
> 
> Add kasan_non_canonical_hook() to the beginning of show_fault_oops().
> 
> Update kasan_non_canonical_hook() to take into account the possible
> memory to shadow mappings in the software tag-based mode of x86.
> 
> Patch was tested with positive results by accessing the following
> addresses, causing #GPs and #PFs.
> 
> Valid mappings (showing kasan_non_canonical_hook() message):
> 	0xFFFFFFFF8FFFFFFF
> 	0xFEF0000000000000
> 	0x7FFFFF4FFFFFFFFF
> 	0x7EF0000000000000
> Invalid mappings (not showing kasan_non_canonical_hook() message):
> 	0xFFFFFFFFF8FFFFFF
> 	0xFFBFFC0000000000
> 	0x07EFFC0000000000
> 	0x000E000000000000
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v3:
> - Move the report.c part from first patch in the series to this new
>   patch to have x86 changes in one place.
> - Add the call in fault oops.
> - Extend the comment in report.c with a graphical representation of what
>   addresses are valid and invalid in memory to shadow mapping.
> 
>  arch/x86/mm/fault.c |  2 ++
>  mm/kasan/report.c   | 36 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index 697432f63c59..16366af60ae5 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -511,6 +511,8 @@ show_fault_oops(struct pt_regs *regs, unsigned long error_code, unsigned long ad
>  	if (!oops_may_print())
>  		return;
>  
> +	kasan_non_canonical_hook(address);
> +
>  	if (error_code & X86_PF_INSTR) {
>  		unsigned int level;
>  		bool nx, rw;
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index f24f11cc644a..135307c93c2c 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -700,7 +700,7 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	 * operation would overflow only for some memory addresses. However, due
>  	 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
>  	 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
> -	 * the overflow always happens.
> +	 * the overflow always happens (for both x86 and arm64).
>  	 *
>  	 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
>  	 * possible shadow addresses belong to a region that is the result of
> @@ -715,6 +715,40 @@ void kasan_non_canonical_hook(unsigned long addr)
>  			return;
>  	}
>  
> +	 /*
> +	  * For x86-64, only the pointer bits [62:57] get reset, and bits #63
> +	  * and #56 can be 0 or 1. Thus, kasan_mem_to_shadow() can be possibly
> +	  * applied to two regions of memory:
> +	  * [0x7E00000000000000, 0x7FFFFFFFFFFFFFFF] and
> +	  * [0xFE00000000000000, 0xFFFFFFFFFFFFFFFF]. As the overflow happens
> +	  * for both ends of both memory ranges, both possible shadow regions
> +	  * are contiguous.
> +	  *
> +	  * Given the KASAN_SHADOW_OFFSET equal to 0xffeffc0000000000, the
> +	  * following ranges are valid mem-to-shadow mappings:
> +	  *
> +	  * 0xFFFFFFFFFFFFFFFF
> +	  *         INVALID
> +	  * 0xFFEFFBFFFFFFFFFF - kasan_mem_to_shadow(~0UL)
> +	  *         VALID   - kasan shadow mem
> +	  *         VALID   - non-canonical kernel virtual address
> +	  * 0xFFCFFC0000000000 - kasan_mem_to_shadow(0xFEUL << 56)
> +	  *         INVALID
> +	  * 0x07EFFBFFFFFFFFFF - kasan_mem_to_shadow(~0UL >> 1)
> +	  *         VALID   - non-canonical user virtual addresses
> +	  *         VALID   - user addresses
> +	  * 0x07CFFC0000000000 - kasan_mem_to_shadow(0x7EUL << 56)
> +	  *         INVALID
> +	  * 0x0000000000000000
> +	  */
> +	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_X86_64)) {

One overall comment on this series: there's a lot of unnecessary
complexity. Case in point:

	config ADDRESS_MASKING
	        depends on X86_64

and

	select HAVE_ARCH_KASAN_SW_TAGS		if ADDRESS_MASKING

and

	config KASAN_SW_TAGS
        	depends on HAVE_ARCH_KASAN_SW_TAGS ...


So you can't have CONFIG_KASAN_SW_TAGS set without CONFIG_X86_64.

> +		if ((addr < (u64)kasan_mem_to_shadow((void *)(0x7E UL << 56)) ||
> +		     addr > (u64)kasan_mem_to_shadow((void *)(~0UL >> 1))) &&
> +		    (addr < (u64)kasan_mem_to_shadow((void *)(0xFE UL << 56)) ||
> +		     addr > (u64)kasan_mem_to_shadow((void *)(~0UL))))
> +			return;
> +	}
This isn't looking great.

I'd much rather have those kasan_mem_to_shadow() arguments be built up
programmatically.

I'm also not following the description of where these ranges come from:

	[0x7E00000000000000, 0x7FFFFFFFFFFFFFFF]
	[0xFE00000000000000, 0xFFFFFFFFFFFFFFFF]

I obviously recognize the top kernel and top userspace addresses, but
there do 0x7E... and 0xFE... come from? Is that because both of them
only have 56 actual bits of address space?

Wouldn't we be better off writing that as, say:

#define HIGHEST_KER_ADDR (void *)0xFFFFFFFFFFFFFFFF
// ^ we probably have some macro for that already
#define LOWEST_KERN_ADDR (void *)(HIGHEST_KERNEL_ADDRESS - \
					(1<<56) + 1)
// ^ or can this be calculated by tag manipulation?

which yields:

   void *_addr = (u64)addr;
   ...

   in_kern_shadow = (_addr >= kasan_mem_to_shadow(LOWEST_KERN_ADDR) ||
		    (_addr <= kasan_mem_to_shadow(HIGHEST_KERN_ADDR);
   in_user_shadow = (_addr >= kasan_mem_to_shadow(LOWEST_USER_ADDR) ||
		    (_addr <= kasan_mem_to_shadow(HIGHEST_USER_ADDR);

   if (!in_kern_shadow &&
       !in_user_shadow)
	return;

I _think_ that's the same logic you have. Isn't it slightly more readable?

