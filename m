Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A850BFF465
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2019 18:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbfKPRi1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Nov 2019 12:38:27 -0500
Received: from mail.skyhub.de ([5.9.137.197]:39236 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727532AbfKPRi0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Nov 2019 12:38:26 -0500
Received: from zn.tnic (p200300EC2F1E69004D402704569CB5C2.dip0.t-ipconnect.de [IPv6:2003:ec:2f1e:6900:4d40:2704:569c:b5c2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8E19B1EC0C5C;
        Sat, 16 Nov 2019 18:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1573925905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=YfjgNcXzrwa9FczNGoC3Ua0nKx+rjkktYHqZA/58SbI=;
        b=qk54/MLnu+jWK90BzXd2Xb4kThbk+kqZ22YmHfkH4nfiFLBCRjaGao8nK07n/nNZXp+Y1r
        rIig5w/0NneAhQDICAznzyTZ72UKkUhS8chjnQY5RHvnymQT5sEcGP8hb/pIXRMvEafu59
        FQJr5H7qtTekvl29M08IPY1gyuOZ/1M=
Date:   Sat, 16 Nov 2019 18:38:20 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Joerg Roedel <jroedel@suse.de>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hpa@zytor.com
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-ID: <20191116173820.GB23231@zn.tnic>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
 <20191114171231.GA21753@suse.de>
 <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
 <20191115083847.GB18929@zn.tnic>
 <20191115153721.c869afe6e7564877b848c69d@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191115153721.c869afe6e7564877b848c69d@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 03:37:21PM -0800, Andrew Morton wrote:
> OK, thanks, here's what I queued.  Reviews, acks and testing, please??
> 
> From: Joerg Roedel <jroedel@suse.de>
> Subject: x86/mm: Split vmalloc_sync_all()
> 
> Commit 3f8fd02b1bf1 ("mm/vmalloc: Sync unmappings in
> __purge_vmap_area_lazy()") introduced a call to vmalloc_sync_all() in the
> vunmap() code-path.  While this change was necessary to maintain
> correctness on x86-32-pae kernels, it also adds additional cycles for
> architectures that don't need it.

...

>  arch/x86/mm/fault.c      |   26 ++++++++++++++++++++++++--
>  drivers/acpi/apei/ghes.c |    2 +-
>  include/linux/vmalloc.h  |    5 +++--
>  kernel/notifier.c        |    2 +-
>  mm/nommu.c               |   10 +++++++---
>  mm/vmalloc.c             |   11 +++++++----
>  6 files changed, 43 insertions(+), 13 deletions(-)

Booting it looks ok here:

Tested-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
