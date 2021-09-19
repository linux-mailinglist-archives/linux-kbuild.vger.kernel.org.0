Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA25141091B
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Sep 2021 04:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240931AbhISCEU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 Sep 2021 22:04:20 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43165 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240861AbhISCEF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Sep 2021 22:04:05 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 18J22RRX028484;
        Sun, 19 Sep 2021 11:02:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 18J22RRX028484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632016948;
        bh=IeRqbMvP0VMKoofeV7jzNf72c4TwrPCoerRwTS9X3mk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=owDY/Lk5Mfi0jGsYwuAZneWCwZjYeoUTMwOCCaJMcH1KQG9uBDeXCNQ1hCOZ0K1pu
         Vw1IWYjfytbeJ/1PJ6G7LOgbRBF0Go9y0zPbrCU5NwiUx3qOnvWv7wuqkoP57uKM6u
         fxqE9mpf4i4hKYt8xRB+pzGxCRIWSvV4X7yJAzeZDemBzslZb3q79EL3HYtOBzs/Tt
         xXNMjI/WuAkiDZCCI90VakyQyy8XiSNEs1YYX56SJ3OdQZAjcs3ihtWoLjHuEdqCv5
         wLWCOStxIxvKYx8n83WgbmhzrIh5/2pRFHXKXA3LSrvbBaVB+4IPtw/xfhyANwgELa
         gmBMNuZ7gkhMA==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id k23so9591026pji.0;
        Sat, 18 Sep 2021 19:02:27 -0700 (PDT)
X-Gm-Message-State: AOAM530s8mep3QbfdLyU/XonMLvZCTh6f57B8yfwJEhVjGlHJu/vVmv6
        P7+ip8Br5eOh6+pbBr17iG9YGnbSMNa8VK4ZlpU=
X-Google-Smtp-Source: ABdhPJzvq4KrpyJbKQpq6RNH/kBkU2R1w1VAyWxsnb3PAl7gr2l60rQ5zzuxK68Rim9etMHNFvuvw2z50sY6nlIlo+g=
X-Received: by 2002:a17:90a:192:: with SMTP id 18mr30092740pjc.119.1632016947055;
 Sat, 18 Sep 2021 19:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210916092122.2374583-1-ramjiyani@google.com>
In-Reply-To: <20210916092122.2374583-1-ramjiyani@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 19 Sep 2021 11:01:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQE_pEWaHP1GgJ57VJ1FCStDjf+mS5uvpGP=SxpNG0DOA@mail.gmail.com>
Message-ID: <CAK7LNAQE_pEWaHP1GgJ57VJ1FCStDjf+mS5uvpGP=SxpNG0DOA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix comment typo in scripts/Makefile.modpost
To:     Ramji Jiyani <ramjiyani@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 16, 2021 at 6:21 PM Ramji Jiyani <ramjiyani@google.com> wrote:
>
> Change comment "create one <module>.mod.c file pr. module"
> to "create one <module>.mod.c file per module"
>
> Signed-off-by: Ramji Jiyani <ramjiyani@google.com>
> ---
>  scripts/Makefile.modpost | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to linux-kbuild. Thanks.


> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index eef56d629799..48585c4d04ad 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -13,7 +13,7 @@
>  # Stage 2 is handled by this file and does the following
>  # 1) Find all modules listed in modules.order
>  # 2) modpost is then used to
> -# 3)  create one <module>.mod.c file pr. module
> +# 3)  create one <module>.mod.c file per module
>  # 4)  create one Module.symvers file with CRC for all exported symbols
>
>  # Step 3 is used to place certain information in the module's ELF
> --
> 2.33.0.309.g3052b89438-goog
>


-- 
Best Regards
Masahiro Yamada
