Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606AB3106F1
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 09:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbhBEIm4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 03:42:56 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:28329 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhBEImz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 03:42:55 -0500
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1158fhaO006429;
        Fri, 5 Feb 2021 17:41:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1158fhaO006429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612514504;
        bh=O+knfJBgd1kFltu2qxXwExSQ6sWP2dTg9luCidFpFSE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0csqwxeSB6vhz3dW9LIOAT/SWTFTgbKlEi7S9fD+gtQaXiCr1B9JK1j21IZJnmbvt
         Hm4/2M9p0i8ILde/j3ztWMZ1lbc0olhLN9O2TYTVH8IWI69evIaJvZ8qt249PBBaos
         FxmXbNN5OXN3RBqMOJBXwEgEMkfVzwiG7iSuUg1sZrv3K1x5MJ24hsmkrpX9M1LFsr
         BJ+i5ga83mvWHEMN6TPSd25/wed63UwbnmCPcZR5IxrxFj0fNEd4FKw1xMHQBmhAg/
         M71i81pY6STlgfz2gxj8JUdvdmB2+PlF0MqoQgPwFVUm2moVBalGnAl8J6FvVJ9vbO
         iR7gznKul7Acg==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id g3so3221433plp.2;
        Fri, 05 Feb 2021 00:41:43 -0800 (PST)
X-Gm-Message-State: AOAM532euyPhCA8wgil51Ipde74dr9f05sS+uIyFNVNc3xfYkYEYd143
        3eoWVS1V7VDMvE21Txa6Bh5NyuA6H0fLuhN4rfM=
X-Google-Smtp-Source: ABdhPJzElyxMjq6loLU5tbHtRwh3p0mzm0/BbY0DQZZuxZRz9piHxUHXtL/xtgyUZX9ZRBUje71rqZ1IRFIDU7VvdWg=
X-Received: by 2002:a17:90a:5403:: with SMTP id z3mr3234461pjh.198.1612514503170;
 Fri, 05 Feb 2021 00:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20210204152957.1288448-1-arnd@kernel.org>
In-Reply-To: <20210204152957.1288448-1-arnd@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Feb 2021 17:41:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPKaL1xbFfdWYSPZ8S4cfyZ2N2BriVPa-OE5A6c5d_9A@mail.gmail.com>
Message-ID: <CAK7LNAQPKaL1xbFfdWYSPZ8S4cfyZ2N2BriVPa-OE5A6c5d_9A@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 5, 2021 at 12:30 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> ARM randconfig builds with lld sometimes show a build failure
> from kallsyms:
>
>   Inconsistent kallsyms data
>   Try make KALLSYMS_EXTRA_PASS=1 as a workaround
>
> The problem is the veneers/thunks getting added by the linker extend
> the symbol table, which in turn leads to more veneers being needed,
> so it may take a few extra iterations to converge.
>
> This bug has been fixed multiple times before, but comes back every time
> a new symbol name is used. lld uses a different set of idenitifiers from
> ld.bfd, so the additional ones need to be added as well.

Yes, this is a whack-a-mole.

I fixed the typo "idenitifiers" -> "identifiers"
and applied to linux-kbuild.

Thanks.




> I looked through the sources and found that arm64 and mips define similar
> prefixes, so I'm adding those as well, aside from the ones I observed. I'm
> not sure about powerpc64, which seems to already be handled through a
> section match, but if it comes back, the "__long_branch_" and "__plt_"
> prefixes would have to get added as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  scripts/kallsyms.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 7ecd2ccba531..54ad86d13784 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -112,6 +112,12 @@ static bool is_ignored_symbol(const char *name, char type)
>                 "__crc_",               /* modversions */
>                 "__efistub_",           /* arm64 EFI stub namespace */
>                 "__kvm_nvhe_",          /* arm64 non-VHE KVM namespace */
> +               "__AArch64ADRPThunk_",  /* arm64 lld */
> +               "__ARMV5PILongThunk_",  /* arm lld */
> +               "__ARMV7PILongThunk_",
> +               "__ThumbV7PILongThunk_",
> +               "__LA25Thunk_",         /* mips lld */
> +               "__microLA25Thunk_",
>                 NULL
>         };
>
> --
> 2.29.2
>


-- 
Best Regards
Masahiro Yamada
