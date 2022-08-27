Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561DC5A380B
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Aug 2022 16:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiH0ODF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Aug 2022 10:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbiH0ODE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Aug 2022 10:03:04 -0400
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 272F121E3C
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Aug 2022 07:03:02 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 27RE2aT6014537
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Aug 2022 23:02:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 27RE2aT6014537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1661608956;
        bh=10J3NpnQLdREqw8bwzrye4tkzwFE5t0C+fmfh8CITbM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ewQxYNEgLo4fR2jXQVH0DAD46hoQbwXCwse0pBwKl62v++aNrkNvZGNZ1EjS4bAeo
         4vN41Q01ZvTqkTpKxg31FrIUvcQhWgubFlXyOBQu5q+xml78A4DJzdh4+PV1hzV5Hv
         0MeHHTyvxMO3Z8HGAixxETgLJchTPOiByy9WRB9N71Vejazch5U4HP6DvzDrBGBzTc
         C7uHwphbDDzm3Pkl0QD6+Gn7W1Jy4ezmhBd8LBvmN70o4zXteMJYPURxXbNf6GJh9M
         ojcvCjkwFeaXkR+bJXTWm8LcYksqko87/0IwaRnYgBr4QPcH6wAd1dI+T0JaruMm+t
         n9wn+YfAI2usQ==
X-Nifty-SrcIP: [209.85.160.54]
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-11eb8b133fbso1089450fac.0
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Aug 2022 07:02:36 -0700 (PDT)
X-Gm-Message-State: ACgBeo0Om5pW4i/fVe1L4pXpn9ceY28a5sBahJ4+AEyDtog5uUDbnd1R
        fmSHih4Ya8x4lAGV3ZTE4nlVxqetbGYSMIbz6bQ=
X-Google-Smtp-Source: AA6agR5Sgs/x2b4Zi0Q+IgtGrDURf9KpaMO86dfYwmJ0nodUhbRiGYElqg3TgaQNQATEW7IBOPntlYL5sBF+CU3Tp0o=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr3947391oab.287.1661608955691; Sat, 27
 Aug 2022 07:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com>
In-Reply-To: <a2ccf1338513f3a2250cd0a9fe5894f83ce3e4a7.1660314650.git.owen@owenrafferty.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 27 Aug 2022 23:01:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+Lp2g1kzGNALoge7_51_PKcOd37ebZTV=X-QJEwCn5w@mail.gmail.com>
Message-ID: <CAK7LNAR+Lp2g1kzGNALoge7_51_PKcOd37ebZTV=X-QJEwCn5w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rewrite check-local-export in sh/awk
To:     Owen Rafferty <owen@owenrafferty.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 12, 2022 at 11:36 PM Owen Rafferty <owen@owenrafferty.com> wrote:
>
> Remove the bash build dependency for those who otherwise do not
> have it installed. This also provides a significant speedup:
>
> $ make defconfig
> $ make yes2modconfig
>
> ...
>
> $ find  .  -name "*.o" | grep -v vmlinux | wc
>      3169      3169     89615
> $ export NM=nm
> $ time sh -c 'find . -name "*.o" | grep -v vmlinux | xargs -n1
> ./scripts/check-local-export'
>
> Without patch:
>     0m15.90s real     0m12.17s user     0m05.28s system
>
> With patch:
> dash + nawk
>     0m02.16s real     0m02.92s user     0m00.34s system
>
> dash + busybox awk
>     0m02.36s real     0m03.36s user     0m00.34s system
>
> dash + gawk
>     0m02.07s real     0m03.26s user     0m00.32s system
>
> bash + gawk
>     0m03.55s real     0m05.00s user     0m00.54s system
>
> Signed-off-by: Owen Rafferty <owen@owenrafferty.com>
> ---
>
> Notes:
>     [v2] commit message updated


Anyway, awk seems to be faster than bash.

Can you send v3 with the following nits fixed?
Then, I will pick it up.




>
>  scripts/check-local-export | 95 ++++++++++++++++++--------------------
>  1 file changed, 46 insertions(+), 49 deletions(-)
>
> diff --git a/scripts/check-local-export b/scripts/check-local-export
> index 6ccc2f467416..67eaa7cf08c0 100755
> --- a/scripts/check-local-export
> +++ b/scripts/check-local-export
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env bash
> +#!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0-only
>  #
>  # Copyright (C) 2022 Masahiro Yamada <masahiroy@kernel.org>


Now that you rewrote many parts of the code,
can you add your Copyright below mine?




> @@ -29,43 +16,53 @@ exit_code=0
>  # TODO:
>  # Use --quiet instead of 2>/dev/null when we upgrade the minimum version of
>  # binutils to 2.37, llvm to 13.0.0.
> -# Then, the following line will be really simple:
> -#   ${NM} --quiet ${1} |
> +# Then, the following line will be simpler:
> +#   { ${NM} --quiet ${1} || kill 0; } |


I am not a big fan of 'kill 0', but
I do not have a better idea to achieve pipefail in POSIX shell.
So, we can live with it.


> +
> +{ ${NM} ${1} 2>/dev/null || { echo "${0}: ${NM} failed" >&2; kill 0; } } |
> +awk -v "file=${1}" '


Can you use ${AWK} instead of 'awk' for consistency?

AWK is defined in the top Makefile.





> +BEGIN {
> +       exit_code = 0


'exit_code' is only used in END,
so I think this initialization can go there.







-- 
Best Regards
Masahiro Yamada
