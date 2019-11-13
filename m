Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7760FFB38B
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2019 16:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbfKMPRn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Nov 2019 10:17:43 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33346 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfKMPRn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Nov 2019 10:17:43 -0500
Received: by mail-qk1-f196.google.com with SMTP id 71so2049111qkl.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Nov 2019 07:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4ypCCbJzD7lt3VfkoActitGcSwU/YTUe9BYJaFohtA=;
        b=m0pT5dPEiESris5ICXgwBqe1oWqRZmmiMgaQrqmEN/yOqb6iZLuUR4z0FfcKNucQne
         eflpoonxmAk0xOgxcTeQ+IUwt0az7aUGsElMBCx+ciNW9k/LIcWzGn6NMk9OLqvryapx
         rU4YiD+Rx7v8L2xzr6RCuhNb9i9zSHjv8AtxBFGnPy2lAiWMGb2KoCYd8G7R+tO1dv4h
         emnk/XQBHXw6rGTPsxOAJfvQJscN/k4/6bKkU/9VWIYwqSg7cnmiRyzPSq2Qfh29UoQj
         HAzQHZarBPf48AT5DD90Q86AiifTDLFMXKAd7x447dlEb5+yBSZj0UtiQGR+KWzT8Nqd
         vB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4ypCCbJzD7lt3VfkoActitGcSwU/YTUe9BYJaFohtA=;
        b=AC1aLheVTdHh27uqWlp2MmZVExsvwp+Q/cbsmGSNDihFRjKwgaMe13Vtp5Oofmxd1r
         EhqixGdQWJ1yVwU5uHmRKPUKbpZ7QqcrIxMOR36xUlowXnnU2+PGknlDW49sPsFdesyb
         xaDYgP79J+AS+z+oQiI4cdGeW3JvPgRYlY8EE7yDoY1fu+yMUOPfAqi2eVKfuqI2+DTb
         Vhm7KUaz2MODI4j6pQvEoFQfnAXqFkpD03BDCS/KAbc9C/dT8ZwdR1sd6iBtLJgi5NgN
         wiP+U3I5yWN1gkhGktj8FWzEiyxsoZ/GJWGRCwBsRMH58G93jA5GC83U+g5W0STsxMpO
         nzqA==
X-Gm-Message-State: APjAAAXGwTWyQtVj5u5X2yueGPpD/QUWmGqBVj9iruJhYOXy+GWEOttU
        Lnoel+1Cq9ZQVLjiwLF940yEeaPu5Zw=
X-Google-Smtp-Source: APXvYqyrU62E3gOo/VAIRtzUzQu9IBORQPktpO60EU8u/ZtHUlnA7UaQanHtwIQ3+MQbwBV2/fkRBA==
X-Received: by 2002:a05:620a:20c8:: with SMTP id f8mr2865537qka.282.1573658261612;
        Wed, 13 Nov 2019 07:17:41 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id r4sm459800qkd.9.2019.11.13.07.17.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Nov 2019 07:17:40 -0800 (PST)
Message-ID: <1573658259.5937.120.camel@lca.pw>
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
From:   Qian Cai <cai@lca.pw>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Joerg Roedel <jroedel@suse.de>
Cc:     linux-mm@kvack.org, linux-kbuild@vger.kernel.org
Date:   Wed, 13 Nov 2019 10:17:39 -0500
In-Reply-To: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2019-11-13 at 17:55 +0800, Shile Zhang wrote:
> vmalloc_sync_all() was put in the common path in
> __purge_vmap_area_lazy(), for one sync issue only happened on X86_32
> with PTI enabled. It is needless for X86_64, which caused a big regression
> in UnixBench Shell8 testing on X86_64.
> Similar regression also reported by 0-day kernel test robot in reaim
> benchmarking:
> https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/4D3JPPHBNOSPFK2KEPC6KGKS6J25AIDB/
> 
> Fix it by adding more conditions.
> 
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

Is it cleaner to use if (IS_ENABLED()...) ?

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
