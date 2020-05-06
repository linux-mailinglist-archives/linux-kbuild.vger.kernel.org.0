Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771AD1C7987
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 20:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbgEFSg6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 14:36:58 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54822 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729757AbgEFSg6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 14:36:58 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 046Iai4k018523;
        Thu, 7 May 2020 03:36:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 046Iai4k018523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588790205;
        bh=wbaIwcHbiAi9QFigRcq0m039Les723waOhEs26jAtfw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QGLf0HjL5TBDfB6xTHLb4X/nifP3TPUngISgC+amRyt5/ML+RJQ3n2vOpFueN7eQ5
         xcfxiFnHD7wrASBMBcs9WRkNQ/Q5OMJgmgjzQiStTM/7cZlxRoIg/zVG19A7iRU+Jg
         iRPHLFP1GIQxcks1i59Ldp30WkRO5roRHgqSUgIN3I/k1dM//Zw5Y1eP09fsEHfh6I
         zy7v9mIhSw1lg7AsHjsZJfSHDbuORy8DYMnNI2BSz3Vex75VSHCQkgSFXg7ONFmQvF
         Q8Eu40aEW5JoIR/v1IvjRuxZ0uq4K9sUEw0giZ1sU1N9ECbRwJWn9AEBN/UF5nwNpx
         tpOIIKAGfBylw==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id x136so1686052vsx.2;
        Wed, 06 May 2020 11:36:45 -0700 (PDT)
X-Gm-Message-State: AGi0PubDa/EIqUvR4+CU8ct6JrWWpF99awDP8OawI68nuvXXexu/k5k/
        Jkmq77WsTfAcKW1XoyyRQtlBMKMU67M0FzYpkVI=
X-Google-Smtp-Source: APiQypL5iC44zxMIBFb6/RIX6MwxQnnJIKgmBH9DgwLYEb77CykdC9frv1rVNu/5ZxNOx7Zti4t4uypODXIceNkBfo4=
X-Received: by 2002:a05:6102:3c7:: with SMTP id n7mr8677259vsq.179.1588790204256;
 Wed, 06 May 2020 11:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200505115420.18765-1-anders.roxell@linaro.org>
In-Reply-To: <20200505115420.18765-1-anders.roxell@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 7 May 2020 03:36:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6MeBRhP1A3oc-UVATNN4r2Ru1LUp2=DqiLSKDL9gwOQ@mail.gmail.com>
Message-ID: <CAK7LNAR6MeBRhP1A3oc-UVATNN4r2Ru1LUp2=DqiLSKDL9gwOQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: fix deprecated always and hostprogs-y
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 5, 2020 at 8:54 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When I did an allmodconfig build the following warning showed up:
>
> scripts/Makefile.lib:8: 'always' is deprecated. Please use 'always-y' instead
> scripts/Makefile.lib:12: 'hostprogs-y' and 'hostprogs-m' are deprecated. Please use 'hostprogs' instead
>
> Rework to use the new 'always-y' and 'hostprogs'.
>
> Fixes: ee066c3ddf7b ("kbuild: warn if always, hostprogs-y, or hostprogs-m is used")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>


As Stephen Rothwell reported
(https://lkml.org/lkml/2020/5/3/392),
this warning appears by merging the
two different trees.


You sent this patch to the kbuild maintainers,
but samples/watch_queue/Makefile does not exist
in the kbuild tree.


Also, please drop the fixes tag.
The commit hash might change.


> ---
>  samples/watch_queue/Makefile | 4 ++--
>  scripts/Makefile.build       | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/samples/watch_queue/Makefile b/samples/watch_queue/Makefile
> index eec00dd0a8df..8511fb6c53d2 100644
> --- a/samples/watch_queue/Makefile
> +++ b/samples/watch_queue/Makefile
> @@ -1,7 +1,7 @@
>  # List of programs to build
> -hostprogs-y := watch_test
> +hostprogs := watch_test
>
>  # Tell kbuild to always build the programs
> -always := $(hostprogs-y)
> +always-y := $(hostprogs)
>
>  HOSTCFLAGS_watch_test.o += -I$(objtree)/usr/include
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3665b1a0bc8e..abdba70f33a1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -15,7 +15,6 @@ obj-y :=
>  obj-m :=
>  lib-y :=
>  lib-m :=
> -always :=
>  always-y :=
>  always-m :=
>  targets :=


Why are you deleting 'always'?
It would immediately break
the downstream Makefiles immediately.



--
Best Regards
Masahiro Yamada
