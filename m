Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97DA37B6B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 09:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhELHRD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 03:17:03 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:54627 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbhELHRC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 03:17:02 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 14C7FPOg028464;
        Wed, 12 May 2021 16:15:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 14C7FPOg028464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620803725;
        bh=8pvjgXWjwNn85x800/kxtZEedGc84LtOQn0TCaf3B2Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NZBYZwsxzTPhmdURAAXV13QJGj0NOTeGTb7KOGgNCyPpOQxvbEEeG5zrQthTJKYb0
         wjiLK3ir0+lsiutC72un0M2N2v+/45mvI6zwNUeCIeqaPQ10QK+H4A7K8X0P7x0guM
         AYNOxIHM7F8heyKUAhg0e+tF4gmRsq3LxAxUJRlscCL15eppFmUylAprzhvd++MFS7
         Z5kDG89NZhtviMBPKuK3WlVl3AGAG/xuwBxWWvmXu99RHhQ2G0cl/9tFUOaRDJMBmc
         AA5vyuuJN/ZHfGv67nauIuGj7bb+TNqAbcDlNGThHXa38gix4JKElu2KQ3DCAlDkfz
         iMFhagjGxjf6Q==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id i13so17993977pfu.2;
        Wed, 12 May 2021 00:15:25 -0700 (PDT)
X-Gm-Message-State: AOAM531D3iewXDt00XfA0Zixm5d2zVA//+ych2d06DmkBCeDqzLRXS/y
        HNRDnOm4SnfNTMuD1tH64+kj8WV4UewXPIw1+no=
X-Google-Smtp-Source: ABdhPJwR9OZjGZZlsHyh2GHgKZ/BI5OyOVpAnz19sI6mG+L/SQD+qKQAAe099nMEM5v2u3M94P3mvkthQqyltgSwxrk=
X-Received: by 2002:a63:a547:: with SMTP id r7mr34599360pgu.7.1620803724655;
 Wed, 12 May 2021 00:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <1620286499-40999-1-git-send-email-feng.tang@intel.com>
In-Reply-To: <1620286499-40999-1-git-send-email-feng.tang@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 12 May 2021 16:14:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQoDES7yFmjHzBTMBgJ+Mg_B9t3U3QR2zC0Xs+cn6mEFw@mail.gmail.com>
Message-ID: <CAK7LNAQoDES7yFmjHzBTMBgJ+Mg_B9t3U3QR2zC0Xs+cn6mEFw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: extend 32B aligned debug option to 64B aligned
To:     Feng Tang <feng.tang@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 6, 2021 at 4:35 PM Feng Tang <feng.tang@intel.com> wrote:
>
> commit 09c60546f04f ("./Makefile: add debug option to enable
> function aligned on 32 bytes") was introduced to help debugging
> strange kernel performance changes caused by code alignment
> change.
>
> Recently we found 2 similar cases [1][2] caused by code-alignment
> changes, which can only be identified by forcing 64 bytes aligned
> for all functions.
>
> Originally, 32 bytes was used mainly for not wasting too much
> text space, but this option is only for debug anyway where text
> space is not a big concern. So extend the alignment to 64 bytes
> to cover more similar cases.
>
> [1].https://lore.kernel.org/lkml/20210427090013.GG32408@xsang-OptiPlex-9020/
> [2].https://lore.kernel.org/lkml/20210420030837.GB31773@xsang-OptiPlex-9020/
> Signed-off-by: Feng Tang <feng.tang@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Andi Kleen <ak@linux.intel.com>


Applied to linux-kbuild.
Thanks.



> ---
>  Makefile          | 4 ++--
>  lib/Kconfig.debug | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 72af8e4..a9f6715 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -958,8 +958,8 @@ KBUILD_CFLAGS       += $(CC_FLAGS_CFI)
>  export CC_FLAGS_CFI
>  endif
>
> -ifdef CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_32B
> -KBUILD_CFLAGS += -falign-functions=32
> +ifdef CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B
> +KBUILD_CFLAGS += -falign-functions=64
>  endif
>
>  # arch Makefile may override CC so keep this after arch Makefile is included
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 678c1396..6ce26b8 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -400,8 +400,8 @@ config SECTION_MISMATCH_WARN_ONLY
>
>           If unsure, say Y.
>
> -config DEBUG_FORCE_FUNCTION_ALIGN_32B
> -       bool "Force all function address 32B aligned" if EXPERT
> +config DEBUG_FORCE_FUNCTION_ALIGN_64B
> +       bool "Force all function address 64B aligned" if EXPERT
>         help
>           There are cases that a commit from one domain changes the function
>           address alignment of other domains, and cause magic performance
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
