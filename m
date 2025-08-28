Return-Path: <linux-kbuild+bounces-8638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89755B398C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 11:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA5F560960
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 09:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237652ED15F;
	Thu, 28 Aug 2025 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtsLfDMM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D725E44D;
	Thu, 28 Aug 2025 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756374647; cv=none; b=TcZ5ZLuVdLO4eRM1DDr3ONnJOB71mdw0F6PM4F/FV038kuKx+KbaLnMGY7xsbXkjXrt0YJN8PwnthL1Utt2YPVRipH89hqNpAVETxcFQ3AGs0+WSDMlQ+UoNUpXMy1L9yXC2T2SJ2rt3uXVqCOzfXkAD6QQ+0zEN3ARih7AWUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756374647; c=relaxed/simple;
	bh=nsd/srhjb2GA1BGIBjZu6MLWkDZmOCy2pcy5zHmDL74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVKgl0PvZuXD4tAhn7tkkYDKi00pQkeXJx9S2jVFzf2T/7CqFuvQJB9DsJAdHJxCrkr7xMKup4nsJjHi5zZPuksJggTeWuSA84+PdfqNfM4bs8LfVvSxuw72HFflfmucOaceB52SrLwp9fCzDg7K7SKP5nze5YteENkie5skcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtsLfDMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2032C4CEEB;
	Thu, 28 Aug 2025 09:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756374646;
	bh=nsd/srhjb2GA1BGIBjZu6MLWkDZmOCy2pcy5zHmDL74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VtsLfDMMLPSn8X7FB1qyNCklBXX9jl5VJY1SBRcbhOVICoFXA67QPx/qy7W6dd3vD
	 yfVYCeZ9qxnPjnysPEtIFtXsq9TpqQ7ht02VkXWKJSH5mhi7sLsK8f6czjwjLvDknI
	 EM7JLLbBT14GmJfNk3pIinT5sdlwUfUTxOOuJcXPVeVRMUQIKLsvsdrWX0j4LVT7gq
	 SCz62qpwpxFqTRTlUURPRhZQBzchubGPagz85CseSPu0lif/72BG8k0aV+YX0q1VLD
	 e4NAgp3YEZ2oeqsVUxXVdVb/8ObVWHiurodKtnBRh0zfOBY24G5vDUPm3Vou9eV7r2
	 4uhT7unkY+MBg==
Date: Thu, 28 Aug 2025 12:50:19 +0300
From: Mike Rapoport <rppt@kernel.org>
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
	catalin.marinas@arm.com, alexander.shishkin@linux.intel.com,
	samuel.holland@sifive.com, dave.hansen@linux.intel.com,
	corbet@lwn.net, xin@zytor.com, dvyukov@google.com,
	tglx@linutronix.de, scott@os.amperecomputing.com,
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org,
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com,
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org,
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com,
	mhocko@suse.com, ada.coupriediaz@arm.com, hpa@zytor.com,
	leitao@debian.org, peterz@infradead.org, wangkefeng.wang@huawei.com,
	surenb@google.com, ziy@nvidia.com, smostafa@google.com,
	ryabinin.a.a@gmail.com, ubizjak@gmail.com, jbohac@suse.cz,
	broonie@kernel.org, akpm@linux-foundation.org,
	guoweikang.kernel@gmail.com, pcc@google.com, jan.kiszka@siemens.com,
	nicolas.schier@linux.dev, will@kernel.org, andreyknvl@gmail.com,
	jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 07/19] mm: x86: Untag addresses in EXECMEM_ROX related
 pointer arithmetic
Message-ID: <aLAmW-UV6hv9k1LT@kernel.org>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c773559ea60801f3a5ca01171ea2ac0f9b0da56a.1756151769.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c773559ea60801f3a5ca01171ea2ac0f9b0da56a.1756151769.git.maciej.wieczor-retman@intel.com>

On Mon, Aug 25, 2025 at 10:24:32PM +0200, Maciej Wieczor-Retman wrote:
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
> within().
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
> Changelog v5:
> - Remove the within_range() change.
> - arch_kasan_reset_tag -> kasan_reset_tag.
> 
> Changelog v4:
> - Add patch to the series.
> 
>  mm/execmem.c | 2 +-
>  mm/vmalloc.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/execmem.c b/mm/execmem.c
> index 0822305413ec..f7b7bdacaec5 100644
> --- a/mm/execmem.c
> +++ b/mm/execmem.c
> @@ -186,7 +186,7 @@ static DECLARE_WORK(execmem_cache_clean_work, execmem_cache_clean);
>  static int execmem_cache_add_locked(void *ptr, size_t size, gfp_t gfp_mask)
>  {
>  	struct maple_tree *free_areas = &execmem_cache.free_areas;
> -	unsigned long addr = (unsigned long)ptr;
> +	unsigned long addr = (unsigned long)kasan_reset_tag(ptr);

Thinking more about it, we anyway reset tag in execmem_alloc() and return
untagged pointer to the caller. Let's just move kasan_reset_tag() to
execmem_vmalloc() so that we always use untagged pointers. Seems more
robust to me.

>  	MA_STATE(mas, free_areas, addr - 1, addr + 1);
>  	unsigned long lower, upper;
>  	void *area = NULL;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6dbcdceecae1..c93893fb8dd4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3322,7 +3322,7 @@ static void vm_reset_perms(struct vm_struct *area)
>  	 * the vm_unmap_aliases() flush includes the direct map.
>  	 */
>  	for (i = 0; i < area->nr_pages; i += 1U << page_order) {
> -		unsigned long addr = (unsigned long)page_address(area->pages[i]);
> +		unsigned long addr = (unsigned long)kasan_reset_tag(page_address(area->pages[i]));

This is not strictly related to execemem, there may other users of
VM_FLUSH_RESET_PERMS.

Regardless, I wonder how this works on arm64 with tags enabled?

Also, it's not the only place in the kernel that does (unsigned
long)page_address(page). Do other sites need to reset the tag as well?

>  
>  		if (addr) {
>  			unsigned long page_size;
> -- 
> 2.50.1
> 

-- 
Sincerely yours,
Mike.

