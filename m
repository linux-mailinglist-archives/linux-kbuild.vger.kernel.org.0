Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 205DB312100
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Feb 2021 03:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhBGCy3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 21:54:29 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27329 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhBGCy3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 21:54:29 -0500
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1172rLsh001245;
        Sun, 7 Feb 2021 11:53:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1172rLsh001245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612666402;
        bh=BoXC8u4n3XsOnNJy5T4YdHexR5Wi4TjPTxHkFdGm1FI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DdIodsUomeejV6lET0maqiWahXC3CUiLmIrreEPXNJ6IoRs9Jh4lSD/s6a1Uwmx0D
         eFoBTytGBO0swKi7BPwdzSZ8s8wCarrinXc58qxHvi069qC5847kiihp7C7XIpe3FP
         d0Vp+/N65K2V0hRu9678SExvAyuCPTRwcnhwWuqqPkKRXjb9q+s4naAr8gmjUAtY7M
         ANjO6dsdEHaJ4Tu00RlBx6VSq0UkBByexeOSiMyJkzhKuIRIObn4HksT8fUuJZO+k+
         KlHfr5n9ApwkMbVvTvS7+5P/qS06uPDt2G8z9WWIkkj0AbfUI+t8omOEJOtDvVYCzs
         qIP89IrvKSviw==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id y10so6015514plk.7;
        Sat, 06 Feb 2021 18:53:21 -0800 (PST)
X-Gm-Message-State: AOAM533jEZLxpqJA2JrmJUqm93vBeL572asfEFYcoDR0+zG9qYDfMIcW
        wPFGtKnVJ/qTmnoGBRl+QfmJ/CVBJ4dNa+udSF8=
X-Google-Smtp-Source: ABdhPJx2zu0y4+GmrMSs7Pyar4+QTkls+xENDAQ0VONSOCtFH2KDyOjhQ0+cdxdBuJqSwqEvnPp5yNLuxsAzmaBd/HE=
X-Received: by 2002:a17:902:8687:b029:e1:601e:bd29 with SMTP id
 g7-20020a1709028687b02900e1601ebd29mr10707736plo.47.1612666401066; Sat, 06
 Feb 2021 18:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20210206035033.2036180-1-sashal@kernel.org> <20210206035033.2036180-2-sashal@kernel.org>
In-Reply-To: <20210206035033.2036180-2-sashal@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 7 Feb 2021 11:52:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ3CUPbmv9KQP=Za0JesFm6AvfntqM=6GKnyF6hBk4QEQ@mail.gmail.com>
Message-ID: <CAK7LNAQ3CUPbmv9KQP=Za0JesFm6AvfntqM=6GKnyF6hBk4QEQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
To:     Sasha Levin <sashal@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 6, 2021 at 12:50 PM Sasha Levin <sashal@kernel.org> wrote:
>
> Right now if SUBLEVEL becomes larger than 255 it will overflow into the
> territory of PATCHLEVEL, causing havoc in userspace that tests for
> specific kernel version.
>
> While userspace code tests for MAJOR and PATCHLEVEL, it doesn't test
> SUBLEVEL at any point as ABI changes don't happen in the context of
> stable tree.
>
> Thus, to avoid overflows, simply clamp SUBLEVEL to it's maximum value in
> the context of LINUX_VERSION_CODE. This does not affect "make
> kernelversion" and such.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>


I applied 2/3 to linux-kbuild.

Please resend only 3/3.

Thanks.



> ---
>  Makefile | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 49ac1b7fe8e99..157be50c691e5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1258,9 +1258,15 @@ define filechk_utsrelease.h
>  endef
>
>  define filechk_version.h
> -       echo \#define LINUX_VERSION_CODE $(shell                         \
> -       expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> -       echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
> +       if [ $(SUBLEVEL) -gt 255 ]; then                                 \
> +               echo \#define LINUX_VERSION_CODE $(shell                 \
> +               expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 255); \
> +       else                                                             \
> +               echo \#define LINUX_VERSION_CODE $(shell                 \
> +               expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
> +       fi;                                                              \
> +       echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
> +       ((c) > 255 ? 255 : (c)))'
>  endef
>
>  $(version_h): FORCE
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
