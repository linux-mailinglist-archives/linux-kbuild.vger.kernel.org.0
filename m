Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8876B4D290
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2019 17:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFTP4e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Jun 2019 11:56:34 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17720 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfFTP4e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jun 2019 11:56:34 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x5KFu6Bj010469;
        Fri, 21 Jun 2019 00:56:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x5KFu6Bj010469
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561046167;
        bh=/SBC/ErF1nFpyiXBhAuy1Wqj2LZ/8UBCgJRAboZq6yo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WvbjEEN92L6uK8imEB3/Clr22Cbq85rfco9bP3QdhNn8AubOy9F6QVl4akFnyur9Q
         reFZ+2//wELmrE644LhkUg4SnV4kZW94Fu/qHTtzZtZI8nZvQsWlXAzITvqfyxtroX
         acSWofBt40MoJG98hvQoJI+xhqD9wBgIEJRvQJNhxBQBufBbdMuVakY+v1JAzOPK83
         AxNnR1TEfIMqGJkdBGgdyaPRE27P/uIdCQLCvM9O9cnuSoFHh3zAAIb/7JYeG4hKDN
         /uz5kUG1o9NBkyrMLW+m+jl02SmnLgLQqP0PMGtG+cj7/Hh9Ux4Rdwx9H6OTQIeC8r
         NM/Z3FN+CxY0g==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id j2so1843103uaq.5;
        Thu, 20 Jun 2019 08:56:07 -0700 (PDT)
X-Gm-Message-State: APjAAAVwrLe7xEYIeUkTe2pEwBh0Op6g9RwlUnQIU3XsYMFofO/9AqZx
        HS/Ehpgc124bv9Hmle+ZEKKjWRknsJZuXO4rxL8=
X-Google-Smtp-Source: APXvYqw9io0OhojFdnLCIqaFQ/XxRfL6y/h1TwOKeVujgIuINeOVwXWREdRUnplje5m3wVqCTA0lZ3ynTfgzt/cn1uU=
X-Received: by 2002:ab0:2b0a:: with SMTP id e10mr39878064uar.109.1561046166280;
 Thu, 20 Jun 2019 08:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190616174805.3069-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190616174805.3069-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 21 Jun 2019 00:55:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ9qmDu3NxM+unF4=EBy1Dt3gvYRGM3hLUAF3wGBqy8cA@mail.gmail.com>
Message-ID: <CAK7LNAQ9qmDu3NxM+unF4=EBy1Dt3gvYRGM3hLUAF3wGBqy8cA@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/raid6: remove duplicated CFLAGS_REMOVE_altivec8.o
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Stefan Agner <stefan@agner.ch>, Joel Stanley <joel@jms.id.au>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 17, 2019 at 2:50 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> No intended change in behavior.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  lib/raid6/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> index e723eacf7868..74004037033f 100644
> --- a/lib/raid6/Makefile
> +++ b/lib/raid6/Makefile
> @@ -26,7 +26,6 @@ CFLAGS_REMOVE_altivec1.o  += -msoft-float
>  CFLAGS_REMOVE_altivec2.o  += -msoft-float
>  CFLAGS_REMOVE_altivec4.o  += -msoft-float
>  CFLAGS_REMOVE_altivec8.o  += -msoft-float
> -CFLAGS_REMOVE_altivec8.o  += -msoft-float
>  CFLAGS_REMOVE_vpermxor1.o += -msoft-float
>  CFLAGS_REMOVE_vpermxor2.o += -msoft-float
>  CFLAGS_REMOVE_vpermxor4.o += -msoft-float
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
