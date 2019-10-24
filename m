Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6172EE39B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2019 19:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440012AbfJXRVH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Oct 2019 13:21:07 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33047 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbfJXRVH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 13:21:07 -0400
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x9OHKsN3002150;
        Fri, 25 Oct 2019 02:20:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x9OHKsN3002150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571937655;
        bh=kUY/hERLTu/U3FtGdeL2N2bj0Nk4CzZvjOEYVh7raWM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=y7XhBL7yHCCy1CXKRy9en8lBOB9Sfa5UDLFSy4sDTH3nURMnzBJZ7JjwVBlicOMex
         9jXtpJRaMB710ikKXsEcLOGh7pIP/RZULTi7UIYx0cqbAo6qV6IDBt6PkFA2eJyOwl
         mOP4UfpwX/b0Q3OdE+LiDfkArMywNfcbDzhLqjKrfi+xOhzA+R9xhJtnRwrKijtp9X
         Wc6Ya3XeMxasS5M7tyOFul4EDgp0ikwxpKWrTcHpc/O8/7CZUDTreSBC6hyr5BTVWQ
         lS3H0TdJB69OhURgGpMbJL2TLyv8fblWUQ0uHkV923X8+pEN+VJZC5BFrDpmr1m7TZ
         xwh/iri8MvtWA==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id r85so1881285vke.3;
        Thu, 24 Oct 2019 10:20:55 -0700 (PDT)
X-Gm-Message-State: APjAAAXpOpDOVaiQRxkBxWHl3BJ5NnBYC18uAuoJ/Qfv3lx274wpyS4+
        tBWpyZzadLIpnDyjOKKYiWGe7HEO8pEy8E6lTL8=
X-Google-Smtp-Source: APXvYqyMVWp8o1q4NYQSXLbT6BYGII56+juYvUv1u9de02v3EFh16jT4T6gV9Yv5L53FIsovHZ2TxJ7OWZFWGd4O1vs=
X-Received: by 2002:a1f:4b05:: with SMTP id y5mr9077091vka.12.1571937653941;
 Thu, 24 Oct 2019 10:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191016051547.11399-1-yamada.masahiro@socionext.com>
In-Reply-To: <20191016051547.11399-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 25 Oct 2019 02:20:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQM9eR5ZJXhUi-YDFAdMm82NFZKXuXFJ3OP7EsdwLnkNQ@mail.gmail.com>
Message-ID: <CAK7LNAQM9eR5ZJXhUi-YDFAdMm82NFZKXuXFJ3OP7EsdwLnkNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: reduce KBUILD_SINGLE_TARGETS as descending
 into subdirectories
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Julia Lawall <julia.lawall@lip6.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 16, 2019 at 2:17 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> KBUILD_SINGLE_TARGETS does not need to contain all the targets.
> Change it to keep track the targets only from the current directory
> and its subdirectories.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>
>  scripts/Makefile.build | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a9e47953ca53..dcbb0124dac4 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -469,15 +469,15 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
>
>  ifdef single-build
>
> +KBUILD_SINGLE_TARGETS := $(filter $(obj)/%, $(KBUILD_SINGLE_TARGETS))
> +
>  curdir-single := $(sort $(foreach x, $(KBUILD_SINGLE_TARGETS), \
>                         $(if $(filter $(x) $(basename $(x)).o, $(targets)), $(x))))
>
>  # Handle single targets without any rule: show "Nothing to be done for ..." or
>  # "No rule to make target ..." depending on whether the target exists.
>  unknown-single := $(filter-out $(addsuffix /%, $(subdir-ym)), \
> -                       $(filter $(obj)/%, \
> -                               $(filter-out $(curdir-single), \
> -                                       $(KBUILD_SINGLE_TARGETS))))
> +                       $(filter-out $(curdir-single), $(KBUILD_SINGLE_TARGETS)))
>
>  __build: $(curdir-single) $(subdir-ym)
>  ifneq ($(unknown-single),)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
