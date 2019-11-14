Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9218CFC834
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 14:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfKNN4n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 08:56:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:38928 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726254AbfKNN4n (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 08:56:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 165D1AD17;
        Thu, 14 Nov 2019 13:56:42 +0000 (UTC)
Date:   Thu, 14 Nov 2019 14:56:41 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Joerg Roedel <jroedel@suse.de>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-ID: <20191114135641.GA1356@dhcp22.suse.cz>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed 13-11-19 17:55:30, Shile Zhang wrote:
> vmalloc_sync_all() was put in the common path in
> __purge_vmap_area_lazy(), for one sync issue only happened on X86_32
> with PTI enabled. It is needless for X86_64, which caused a big regression
> in UnixBench Shell8 testing on X86_64.
> Similar regression also reported by 0-day kernel test robot in reaim
> benchmarking:
> https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/4D3JPPHBNOSPFK2KEPC6KGKS6J25AIDB/
> 
> Fix it by adding more conditions.

This doesn't really explain a lot. Could you explain why the syncing
should be limited only to PAE and !SHARED_KERNEL_PMD? 

> Fixes: 3f8fd02b1bf1 ("mm/vmalloc: Sync unmappings in __purge_vmap_area_lazy()")
> 
> Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
> ---
>  mm/vmalloc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a3c70e275f4e..7b9fc7966da6 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1255,11 +1255,17 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end)
>  	if (unlikely(valist == NULL))
>  		return false;
>  
> +#if defined(CONFIG_X86_32) && defined(CONFIG_X86_PAE)
>  	/*
>  	 * First make sure the mappings are removed from all page-tables
>  	 * before they are freed.
> +	 *
> +	 * This is only needed on x86-32 with !SHARED_KERNEL_PMD, which is
> +	 * the case on a PAE kernel with PTI enabled.
>  	 */
> -	vmalloc_sync_all();
> +	if (!SHARED_KERNEL_PMD && boot_cpu_has(X86_FEATURE_PTI))
> +		vmalloc_sync_all();
> +#endif
>  
>  	/*
>  	 * TODO: to calculate a flush range without looping.
> -- 
> 2.24.0.rc2
> 

-- 
Michal Hocko
SUSE Labs
