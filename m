Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6D7FCB8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 18:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfKNRMf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 12:12:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:53190 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726482AbfKNRMf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 12:12:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D07CEAC68;
        Thu, 14 Nov 2019 17:12:33 +0000 (UTC)
Date:   Thu, 14 Nov 2019 18:12:31 +0100
From:   Joerg Roedel <jroedel@suse.de>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-ID: <20191114171231.GA21753@suse.de>
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

On Wed, Nov 13, 2019 at 05:55:30PM +0800, Shile Zhang wrote:
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

I already submitted another fix for this quite some time ago:

	https://lore.kernel.org/lkml/20191009124418.8286-1-joro@8bytes.org/

Regards,

	Joerg

