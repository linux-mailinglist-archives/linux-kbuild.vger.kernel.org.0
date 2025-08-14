Return-Path: <linux-kbuild+bounces-8448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11476B25D63
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 09:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1556916362B
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 07:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E75268C40;
	Thu, 14 Aug 2025 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6qffIlo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924192594B4;
	Thu, 14 Aug 2025 07:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156409; cv=none; b=i1/6cLkkjtKSNyEcJ4Tyft8sjBZ+GVMQheVKsOwG64uercgBQirTMZPxZFvNjZuNnQjbUSE7KwSLwvRUN6xfviaWAeZu7RHHcxJz2R/dbnOPYZoh8lnSQheikYQcNPlJsWR+5rHeipKlAhIkPxS0dlX8GkqcPoRYqay7iYBfbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156409; c=relaxed/simple;
	bh=fNi6Y02rVH9GqePGaiKxiM3IrThq2pypq4fbfTCXcIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+0P3LpDzf0mAYXyCMYQ2/j/o2bCxcYjEOhhZyneNPI3HLNdsQM75Qv1YlSyuPhEW5wdw8Yz4sfsg7qdCE5S+MyZBSUr0vyP2gGzHPs35+OffDAnb9UbP+5iSWvBtl6Ke+q9fWFeIYtGqjA7IDV0TdQkpL79xHcbpV9ya3g8gVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6qffIlo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D17C4CEEF;
	Thu, 14 Aug 2025 07:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755156409;
	bh=fNi6Y02rVH9GqePGaiKxiM3IrThq2pypq4fbfTCXcIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R6qffIloCujxWq1ip65cWS3DUXGF0vDFCOVAKKUf8dUEKnZHbCtDzDN6Fh/Qzl1+q
	 7OGbYD93LFNJPFpntW5RFnE8JywzXL5Ckz4lVfMZU6MxSPh05+YSdtNjDQm7glR+ok
	 JOr0rMid4vgaJMdUkGNCQ8142UcJgMi28wZ3Os/ODI7B6GePUisO/y5I9E6foeXnv8
	 p6oBgT5M3QILhEaKo3iPanGLegAZn2HLZ0xykFdtRNaWiKUGgoCwssM0F1jm2hGjQW
	 N9zX0NHCwgVshW3h0rsCcOzl6kK17FwQ/KHlj2mQlzZGb5QfCHShBisy9DevjRWiwo
	 I26/phH7ruVXQ==
Date: Thu, 14 Aug 2025 10:26:19 +0300
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
Subject: Re: [PATCH v4 07/18] mm: x86: Untag addresses in EXECMEM_ROX related
 pointer arithmetic
Message-ID: <aJ2Pm2XzcM3H4aTN@kernel.org>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <aa501a8133ee0f336dc9f905fdc3453d964109ed.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa501a8133ee0f336dc9f905fdc3453d964109ed.1755004923.git.maciej.wieczor-retman@intel.com>

On Tue, Aug 12, 2025 at 03:23:43PM +0200, Maciej Wieczor-Retman wrote:
> ARCH_HAS_EXECMEM_ROX was re-enabled in x86 at Linux 6.14 release.
> Related code has multiple spots where page virtual addresses end up used
> as arguments in arithmetic operations. Combined with enabled tag-based
> KASAN it can result in pointers that don't point where they should or
> logical operations not giving expected results.
> 
> vm_reset_perms() calculates range's start and end addresses using min()
> and max() functions. To do that it compares pointers but some are not
> tagged - addr variable is, start and end variables aren't.
> 
> within() and within_range() can receive tagged addresses which get
> compared to untagged start and end variables.
> 
> Reset tags in addresses used as function arguments in min(), max(),
> within() and within_range().
> 
> execmem_cache_add() adds tagged pointers to a maple tree structure,
> which then are incorrectly compared when walking the tree. That results
> in different pointers being returned later and page permission violation
> errors panicking the kernel.
> 
> Reset tag of the address range inserted into the maple tree inside
> execmem_cache_add().
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add patch to the series.
> 
>  arch/x86/mm/pat/set_memory.c | 1 +
>  mm/execmem.c                 | 4 +++-
>  mm/vmalloc.c                 | 4 ++--
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 8834c76f91c9..1f14a1297db0 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -222,6 +222,7 @@ static inline void cpa_inc_lp_preserved(int level) { }
>  static inline int
>  within(unsigned long addr, unsigned long start, unsigned long end)
>  {
> +	addr = (unsigned long)kasan_reset_tag((void *)addr);
>  	return addr >= start && addr < end;
>  }
>  
> diff --git a/mm/execmem.c b/mm/execmem.c
> index 0822305413ec..743fa4a8c069 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -191,6 +191,8 @@ static int execmem_cache_add_locked(void *ptr, size_t size, gfp_t gfp_mask)
>  	unsigned long lower, upper;
>  	void *area = NULL;
>  
> +	addr = arch_kasan_reset_tag(addr);

Shouldn't this use kasan_reset_tag()?
And the calls below as well?

Also this can be done when addr is initialized 

> +
>  	lower = addr;
>  	upper = addr + size - 1;
>  
> @@ -216,7 +218,7 @@ static int execmem_cache_add(void *ptr, size_t size, gfp_t gfp_mask)
>  static bool within_range(struct execmem_range *range, struct ma_state *mas,
>  			 size_t size)
>  {
> -	unsigned long addr = mas->index;
> +	unsigned long addr = arch_kasan_reset_tag(mas->index);

AFAIU, we use plain address without the tag as an index in
execmem_cache_add(), so here mas->index will be a plain address as well
  
>  	if (addr >= range->start && addr + size < range->end)
>  		return true;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6dbcdceecae1..83d666e4837a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3328,8 +3328,8 @@ static void vm_reset_perms(struct vm_struct *area)
>  			unsigned long page_size;
>  
>  			page_size = PAGE_SIZE << page_order;
> -			start = min(addr, start);
> -			end = max(addr + page_size, end);
> +			start = min((unsigned long)arch_kasan_reset_tag(addr), start);
> +			end = max((unsigned long)arch_kasan_reset_tag(addr) + page_size, end);
>  			flush_dmap = 1;
>  		}
>  	}
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.

