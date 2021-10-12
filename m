Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D4B429BA8
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 04:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhJLCyk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Oct 2021 22:54:40 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:52443 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbhJLCyk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Oct 2021 22:54:40 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 19C2q77p020888;
        Tue, 12 Oct 2021 11:52:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 19C2q77p020888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634007128;
        bh=trZNy2SOmOFqSbX3fgMgW1+O8/BOm+x1o2j/beOb/7I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uhPvL0juPQFB+0g19tLRt9shxybBpUQ47ebM5AUNlOhm6mfiAqrw/Cb5Dd5EJrgcq
         km+g338ZBRRzX6MMvLo/jkVO8dQ0gjEOySA18JyGsFlkrGUEI+fckiq67fgsHN5DMv
         4BVNlBZfy66EEvfZIUIbRqC4MAFlQ2u4YcfVNd8KXVJ1rCCpTieCexsSzPBTWrIami
         fag3aY1R4FDADpGCVmDWJPqi1Img6a4ozi1Lne3M3FMjDimXaYyIRH/VvljdcbePq8
         rKOP0hNDDOzDR0dx42b4P58Bm8ZcCGNIregzi4t1I67Ey4ggkD8VNlzFSMFuMDmmyk
         WDrkpHtA2QXMA==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id g5so9513081plg.1;
        Mon, 11 Oct 2021 19:52:07 -0700 (PDT)
X-Gm-Message-State: AOAM5324k+StPuGUskKe3cpXsT8IASxjraRC6HUtYKM6O92QMaaxCRX1
        gxu0luBrCZJylM/TnbGrz3dC66U3owqQV6S4ZCk=
X-Google-Smtp-Source: ABdhPJxgUSB+eGWq/P7GmhRltLD7uwZ6Www8ovmlHRZU7yZzL0MA6xIWY+izQliR+nQWS3xchfMpxi/OQrDUj+DrrUs=
X-Received: by 2002:a17:90b:1d06:: with SMTP id on6mr3095062pjb.119.1634007127136;
 Mon, 11 Oct 2021 19:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211008112438.GA1243425@localhost.localdomain>
In-Reply-To: <20211008112438.GA1243425@localhost.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 Oct 2021 11:51:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhAXKhRbm6UAJ9q=C17XXAUc5M1CPDS=a7-3-X0B1FzQ@mail.gmail.com>
Message-ID: <CAK7LNARhAXKhRbm6UAJ9q=C17XXAUc5M1CPDS=a7-3-X0B1FzQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: update the comments of kallsyms support
To:     Hui Su <suhui_kernel@163.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 8, 2021 at 8:25 PM Hui Su <suhui_kernel@163.com> wrote:
>
> update the comments of kallsyms support
>
> Signed-off-by: Hui Su <suhui_kernel@163.com>
> ---

I added

Fixes: af73d78bd384 ("kbuild: Remove debug info from kallsyms linking")


Applied to linux-kbuild. Thanks.




>  scripts/link-vmlinux.sh | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index d74cee5c4326..a98c4f045302 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -369,14 +369,14 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
>         # kallsyms support
>         # Generate section listing all symbols and add it into vmlinux
>         # It's a three step process:
> -       # 1)  Link .tmp_vmlinux1 so it has all symbols and sections,
> +       # 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and sections,
>         #     but __kallsyms is empty.
>         #     Running kallsyms on that gives us .tmp_kallsyms1.o with
>         #     the right size
> -       # 2)  Link .tmp_vmlinux2 so it now has a __kallsyms section of
> +       # 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms section of
>         #     the right size, but due to the added section, some
>         #     addresses have shifted.
> -       #     From here, we generate a correct .tmp_kallsyms2.o
> +       #     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
>         # 3)  That link may have expanded the kernel image enough that
>         #     more linker branch stubs / trampolines had to be added, which
>         #     introduces new names, which further expands kallsyms. Do another
> --
> 2.25.1
>
>


-- 
Best Regards
Masahiro Yamada
