Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05EBB34E76
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 19:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfFDRKq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 13:10:46 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65097 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbfFDRKp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 13:10:45 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x54HAYxP020362;
        Wed, 5 Jun 2019 02:10:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x54HAYxP020362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559668235;
        bh=Slc2+gHJC0ncTFXH2S6Mwj/lCFnEVr0lILMPCaAZeVU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dMM7dIuCDTtFuJYIcBXPrAo2ayPwD/SeTz8zIdx6XoJFP0nkzZRaxcAEwFCSw+Hdg
         ytMwqSC9ql8swH2IzRcrr+Z+IuiR0GYXP+ROfkxx9tesIeV+aUk7h4ngXM4c//uZyl
         l98Bs9QO1DQHpGiw3ETwnoLU42/Pr+CbTcT+VTAjca41Rr5EyD08OuLluWfYbVG9Z8
         5WvQGLTU+nc4kAyAd1NEc9AkD1gNn7Yn0CC/esdboGyImfWVRIrxLSD21yT2SbYD9B
         QjSacYi20r+DZg9GtGsBrZqK/Q78cR48YWICbPjwRGihlzun7JrFcjevXkDsAEyjFr
         kewch354dLjkA==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id v18so2077486uad.12;
        Tue, 04 Jun 2019 10:10:35 -0700 (PDT)
X-Gm-Message-State: APjAAAU+y1Wv871PCkcxj6d0Rb8c26JqeWgb0xNW/KjPpbv084sR5dyH
        6LjmpS7+1ZL9sDJ+jrPcuO4w5fcokBrQwxd7ivw=
X-Google-Smtp-Source: APXvYqzuL8SXnYQrdgrAutUkMcCFO90NLosfUu2gibEtX3OXVNh6UM5LCCazY92IJ91iFAITTHzqRNMUrKeix3/xVuU=
X-Received: by 2002:ab0:4a11:: with SMTP id q17mr15111205uae.25.1559668233986;
 Tue, 04 Jun 2019 10:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190529080434.1409-1-malat@debian.org>
In-Reply-To: <20190529080434.1409-1-malat@debian.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 5 Jun 2019 02:09:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT7tdqVzbo0Un6mZfKoVGMpVtXAh=UakjOLOqY-pr8V0g@mail.gmail.com>
Message-ID: <CAK7LNAT7tdqVzbo0Un6mZfKoVGMpVtXAh=UakjOLOqY-pr8V0g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove -Waggregate-return from scripts/Makefile.extrawarn
To:     Mathieu Malaterre <malat@debian.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 29, 2019 at 5:16 PM Mathieu Malaterre <malat@debian.org> wrote:
>
> It makes little sense to pass -Waggregate-return these days since large
> part of the linux kernel rely on returning struct(s). For instance:
>
>   ../include/linux/timekeeping.h: In function 'show_uptime':
>   ../include/linux/ktime.h:91:34: error: function call has aggregate value [-Werror=aggregate-return]
>    #define ktime_to_timespec64(kt)  ns_to_timespec64((kt))
>                                     ^~~~~~~~~~~~~~~~~~~~~~
>   ../include/linux/timekeeping.h:166:8: note: in expansion of macro 'ktime_to_timespec64'
>     *ts = ktime_to_timespec64(ktime_get_coarse_boottime());
>
> Remove this warning from W=2 completely.
>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---

Applied to linux-kbuild. Thanks.



>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 3ab8d1a303cd..98081ab300e5 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -34,7 +34,6 @@ warning-1 += $(call cc-option, -Wstringop-truncation)
>  warning-1 += -Wno-missing-field-initializers
>  warning-1 += -Wno-sign-compare
>
> -warning-2 := -Waggregate-return
>  warning-2 += -Wcast-align
>  warning-2 += -Wdisabled-optimization
>  warning-2 += -Wnested-externs
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
