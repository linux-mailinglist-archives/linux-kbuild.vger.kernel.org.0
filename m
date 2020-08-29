Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F136F2569AC
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 20:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgH2SWW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 14:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbgH2SWU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 14:22:20 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C757C061236;
        Sat, 29 Aug 2020 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=jOWSL7YMNppSparAg77dbZ6fJiWHneGJnmZYvPY6oW0=; b=BcLH4wp5wsdb1A6/+fcAVfpZx3
        BQzmir9XB7NRPzzoGTRZeMbEQJZBCD5JoUKrKoX4ckwoUWmelPR7km55DXMRDZgA5KzcypRgg+Gyi
        cz3otssgJBigGdFtVNa/LxVnVVs6tL0FAKcQcYTmg6zlm/CpplhLs3punUejhv/Leu9677ygpb2Vv
        GKL0lbe+MszCipmGofBLmA7mIYHWJpsblnJgzNiKw0VvTZu0OnY16zYXhsctPsdTsLdlFCgmrb+um
        kjOye1CvKCWiNt1CnjdXgJAcW/qHVZipGIL9DqlIuI465/2wRMqIDUwQtkccdxmt40OHz/vxMjJxj
        KC8alnAQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kC5UL-0007cU-0c; Sat, 29 Aug 2020 18:22:05 +0000
Subject: Re: [PATCH 3/3] ia64: remove generated/nr-irqs.h generation to fix
 build warning
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>, linux-ia64@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200829051524.706585-1-masahiroy@kernel.org>
 <20200829051524.706585-4-masahiroy@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d98592ec-d74b-27c6-f7d2-9d304b1d9eda@infradead.org>
Date:   Sat, 29 Aug 2020 11:22:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200829051524.706585-4-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/28/20 10:15 PM, Masahiro Yamada wrote:
> Randy reports the following warning when building ARCH=ia64 with
> CONFIG_IA64_PALINFO=m:
> 
> ../scripts/Makefile.build:68: 'arch/ia64/kernel/palinfo.ko' will not be built even though obj-m is specified.
> ../scripts/Makefile.build:69: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.
> 
> This message is actually false-positive, and you can get palinfo.ko
> correctly built. It is emitted in the archprepare stage, where Kbuild
> descends into arch/ia64/kernel to generate include/generated/nr-irqs.h
> instead of any kind of kernel objects.
> 
> arch/ia64/kernel/nr-irqs.c was introduced by commit 213060a4d699
> ("[IA64] pvops: paravirtualize NR_IRQS") to pre-calculate:
> 
>    NR_IRQS = max(IA64_NATIVE_NR_IRQS, XEN_NR_IRQS, FOO_NR_IRQS...)
> 
> Since commit d52eefb47d4e ("ia64/xen: Remove Xen support for ia64"), this
> union contains just one field, making NR_IRQS and IA64_NATIVE_NR_IRQS
> always match.
> 
> So, the following hard-coding now works:
> 
>   #define NR_IRQS                IA64_NATIVE_NR_IRQS
> 
> If you need to re-introduce NR_IRQS = max(...) gimmick in the future,
> please try to implement it in asm-offsets.c instead of a separate file.
> It will be possible because the header inclusion has been consolidated
> to make asm-offsets.c independent of <asm/irqs.h>.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  arch/ia64/Makefile          |  6 ------
>  arch/ia64/include/asm/irq.h |  4 +++-
>  arch/ia64/kernel/Makefile   |  5 -----
>  arch/ia64/kernel/nr-irqs.c  | 22 ----------------------
>  4 files changed, 3 insertions(+), 34 deletions(-)
>  delete mode 100644 arch/ia64/kernel/nr-irqs.c
> 


thanks.
-- 
~Randy

