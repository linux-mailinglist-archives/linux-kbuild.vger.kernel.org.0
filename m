Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6877E3BB514
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 04:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhGECIg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 22:08:36 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49705 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhGECIg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 22:08:36 -0400
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 16525Vwk011894;
        Mon, 5 Jul 2021 11:05:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 16525Vwk011894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625450731;
        bh=451ugBOIOf/0IdhMd6fN3sH6gq6e2woUEJhYewTR8bc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L7NQs2NBOwDOkOm1yM/SkUg2FvQPQiA3A140gin/TB0wihJz7bW9m2tMyoGG03qrZ
         qSLHEYIl2CCl+QGyKaSxhtMyxbiVj+9gCvDX1lqy2kIuDk24vEFSnEo/bo1ydalNS3
         bFLQdsL83ZXvMPfDAbur+R1zSPaLbRwH8rto5Kgb8EWN3xzthKd+yhKwbPI//HvENi
         ZX/XJSdJR2V5AcwfW+HXJOQMTY3Tzt4hPzOlxLpYoNunrFTGFRIbAdOQ6worWkV1Qd
         vdOwVx6pC2og1V2ca96rnD9cGWrETuFWUHRNBesCT3RrTLDyRl0U/WAwf6wHj7TDAC
         ccgmWgQfrymHw==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id y4so15386892pfi.9;
        Sun, 04 Jul 2021 19:05:31 -0700 (PDT)
X-Gm-Message-State: AOAM531+udDyJGPKrJGAJ6z8C3uteMOlD3fxJvkiuZ0+PwY0Dj6SecjS
        xR2FszKOUWuwpWJmx/cFZ5kFt04LQugcTaLS/N0=
X-Google-Smtp-Source: ABdhPJwty6U0IgXKKxWP7JoqFTjL49QA5+KDaDFGZ+AZip93R6uhKc7gh0wBkbZFvJa9i7MHY8MDstXh8qclvb6q4II=
X-Received: by 2002:a62:8309:0:b029:312:d19:ac8b with SMTP id
 h9-20020a6283090000b02903120d19ac8bmr12594417pfe.63.1625450730678; Sun, 04
 Jul 2021 19:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210702032943.7865-1-lecopzer.chen@mediatek.com> <20210702032943.7865-3-lecopzer.chen@mediatek.com>
In-Reply-To: <20210702032943.7865-3-lecopzer.chen@mediatek.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 5 Jul 2021 11:04:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR2vSaaCyY9UgjrC10HdbnK7NrtfR5mf1AUf5neEzPhZw@mail.gmail.com>
Message-ID: <CAK7LNAR2vSaaCyY9UgjrC10HdbnK7NrtfR5mf1AUf5neEzPhZw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Kbuild: lto: add make version checking
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yj.chiang@mediatek.com, Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 2, 2021 at 12:29 PM Lecopzer Chen
<lecopzer.chen@mediatek.com> wrote:
>
> LTO with MODVERSIONS will fail in generating correct CRC because
> the makefile rule doesn't work for make with version 3.8X.[1]
>
> Thus we need to check make version during selecting on LTO Kconfig.
> and the suitable version should be 4.2(40200) which released in 2016[2].
>
> [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> [2] https://ftp.gnu.org/gnu/make/
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---

NACK for the same reason as 1/2.

We need to write correct code.
If we cannot, we need to add 'depends on BROKEN'.




>  arch/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 129df498a8e1..beee68149da8 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -639,6 +639,7 @@ config HAS_LTO_CLANG
>         def_bool y
>         # Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
>         depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
> +       depends on !MODVERSIONS || MAKE_VERSION >= 40200
>         depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>         depends on ARCH_SUPPORTS_LTO_CLANG
> --
> 2.18.0
>


-- 
Best Regards
Masahiro Yamada
