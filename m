Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 466851C0DDE
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 07:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgEAFpA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 01:45:00 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61217 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFpA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:45:00 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0415igrs002835;
        Fri, 1 May 2020 14:44:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0415igrs002835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588311883;
        bh=qfzL0paOa0xcAfnxB0duAvkGtJs8i6sMQdMbhTy6L1E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tGdfOpm84vZIVVXFKw+09PgUAKGrYX2WJmG9HuxOWdPysRD8jUmP3deVWXFTN5swV
         3Hrx7CdoLi5xwlZ3IHrMCw9vsy3DmchXGvLedpCe3Q0QGW0RF2r63Jv+eM5CZxyo9H
         LTLFu7d/AzieOR9v00F15Z5ZsCt3nbcXscHpAT7U/F9h4Mx07a+QuVgEtbQ8PmwQev
         uW3dsLz51WCZdKO/sF/TIt5X4MX91arEDqS7xgC1YRFRq/Kf+2DDPFjzh2se9abfV4
         emkzKetMuJNWSbf4p5H97Oqlci+eabwymqiSzSZ59rMrLyEoohqQU2NaXLfsekiQXG
         UnAwOF4r602Aw==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id y185so5760650vsy.8;
        Thu, 30 Apr 2020 22:44:43 -0700 (PDT)
X-Gm-Message-State: AGi0PuY4dnVZQAKT1PfGgXfb48h//nEy8wnXk1y56+xWKPA3gAZM4N3A
        SyqSXZYqugF7Zf2R3CoZ2ke6RpSf4fxbX13lnQQ=
X-Google-Smtp-Source: APiQypICSQsHjOgrB5HvgYBUa1hOiGuyrfu4TBLWjt6h9s22CPEZ6zD/HNLA61XgUUFrv8BY+cPNxy95N3kJPPeTAJU=
X-Received: by 2002:a05:6102:3c7:: with SMTP id n7mr2106127vsq.179.1588311882097;
 Thu, 30 Apr 2020 22:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200417180455.1174340-1-masahiroy@kernel.org>
In-Reply-To: <20200417180455.1174340-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 14:44:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNwHW8=UQPCs7D=bEx2qKwfoNxVVMmHiOwmPy3j4aaGQ@mail.gmail.com>
Message-ID: <CAK7LNAQNwHW8=UQPCs7D=bEx2qKwfoNxVVMmHiOwmPy3j4aaGQ@mail.gmail.com>
Subject: Re: [PATCH] um: do not evaluate compiler's library path when cleaning
To:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Alex Dewar <alex.dewar@gmx.co.uk>,
        Erel Geron <erelx.geron@intel.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 18, 2020 at 3:06 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
> -Wframe-larger-than="), 'make ARCH=um clean' emits an error message
> as follows:
>
>   $ make ARCH=um clean
>   gcc: error: missing argument to '-Wframe-larger-than='
>
> We do not care compiler flags when cleaning.
>
> Use the '=' operator for lazy expansion because we do not use
> LDFLAGS_pcap.o or LDFLAGS_vde.o when cleaning.
>
> While I was here, I removed the redundant -r option because it
> already exists in the recipe.
>
> Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/um/drivers/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/um/drivers/Makefile b/arch/um/drivers/Makefile
> index a290821e355c..2a249f619467 100644
> --- a/arch/um/drivers/Makefile
> +++ b/arch/um/drivers/Makefile
> @@ -18,9 +18,9 @@ ubd-objs := ubd_kern.o ubd_user.o
>  port-objs := port_kern.o port_user.o
>  harddog-objs := harddog_kern.o harddog_user.o
>
> -LDFLAGS_pcap.o := -r $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
> +LDFLAGS_pcap.o = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libpcap.a)
>
> -LDFLAGS_vde.o := -r $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
> +LDFLAGS_vde.o = $(shell $(CC) $(CFLAGS) -print-file-name=libvdeplug.a)
>
>  targets := pcap_kern.o pcap_user.o vde_kern.o vde_user.o
>
> --
> 2.25.1
>


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
