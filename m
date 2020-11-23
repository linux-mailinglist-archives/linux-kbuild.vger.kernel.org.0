Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 329F12C0565
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 13:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgKWMUT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 07:20:19 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19109 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbgKWMUT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 07:20:19 -0500
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0ANCJs2O014207
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 21:19:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0ANCJs2O014207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606133995;
        bh=NSg+dbbYBqbuF1D+K/qLFM3M+KqmOmkY9pziyLttJjE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WogWeBiEjLMEv+OSVbRBZ7CIng5mmfb3Lf9aOtz0orbEge6T0ckf2cq10k6eu1YCw
         lI0PxPXZziBF6qdx1sl5s6X6ovNHovYpXEBhIo8TT8vL2IuDTKC601GEqfLSVWJWRg
         +YRxZMDbOSLZfVA/nCmUu1zfT7GDLjBEcTddPdmMpXCKxsjXxXei/kXqZN2bpe2D30
         R09GAHoQN53eSVBnS8yFT+zdtUn5C1vxhwHWx4xIjG1pChHajzycBTe4gVscBVhJUf
         J2ilOVLDlNw7dmXKUH1LzFEhFKY0O6rDEF/MQvZO4Qc3jp1Ub2ZsVlazCqCuuzShqL
         UlGeYCO6zvxFg==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id n137so4704831pfd.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 04:19:54 -0800 (PST)
X-Gm-Message-State: AOAM5316YiYlK9HVOxS1BIjATsd6FnuSdRnNyO4Nhosdk0X4/G6gfKfF
        Yf4FGgQg4aEtINvas5btRe7k4HLIwqwMLJWHrf8=
X-Google-Smtp-Source: ABdhPJzhOqUDrRXbCTy8s1ObvC+OFVcucynD5KxbS2jZpRTgCls0KcnLDZcNrlMaW7BFk/mNtNTRbaSSmnKd4obBgPQ=
X-Received: by 2002:a17:90a:5404:: with SMTP id z4mr10471601pjh.198.1606133993995;
 Mon, 23 Nov 2020 04:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20201029155152.2467-1-boris@codesynthesis.com>
 <20201029155152.2467-3-boris@codesynthesis.com> <CAK7LNARRfK7LFrmJdMj4n77rb6pBYY=gXNLkfoSjk=pBJkg79w@mail.gmail.com>
 <boris.20201102162336@codesynthesis.com> <CAK7LNAR4jxyOpGYspNUK==-pcdpMLkwv7_ejOO500RwfqAqL=w@mail.gmail.com>
 <boris.20201123113332@codesynthesis.com>
In-Reply-To: <boris.20201123113332@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 21:19:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrK4mKj5ouu0AYNWZT1Fi6v31jUNfs3CZU0GUCU5OT0A@mail.gmail.com>
Message-ID: <CAK7LNARrK4mKj5ouu0AYNWZT1Fi6v31jUNfs3CZU0GUCU5OT0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kconfig: clean up header inclusion
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 23, 2020 at 6:45 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> - Add missing includes.
> - Remove no longer necessary includes.
> ---


Applied to linux-kbuild. Thanks.



> v2: Don't re-arrange includes.
>
>  scripts/kconfig/conf.c     | 1 -
>  scripts/kconfig/confdata.c | 1 +
>  scripts/kconfig/lexer.l    | 1 -
>  scripts/kconfig/symbol.c   | 2 +-
>  4 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index f6e548b..db03e2f 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -11,7 +11,6 @@
>  #include <time.h>
>  #include <unistd.h>
>  #include <getopt.h>
> -#include <sys/stat.h>
>  #include <sys/time.h>
>  #include <errno.h>
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index a39d93e..2568dbe 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -5,6 +5,7 @@
>
>  #include <sys/mman.h>
>  #include <sys/stat.h>
> +#include <sys/types.h>
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
> index 240109f..9c22cb5 100644
> --- a/scripts/kconfig/lexer.l
> +++ b/scripts/kconfig/lexer.l
> @@ -12,7 +12,6 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> -#include <unistd.h>
>
>  #include "lkc.h"
>  #include "parser.tab.h"
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index ffa3ec6..fe38e6f 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -3,11 +3,11 @@
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
>
> +#include <sys/types.h>
>  #include <ctype.h>
>  #include <stdlib.h>
>  #include <string.h>
>  #include <regex.h>
> -#include <sys/utsname.h>
>
>  #include "lkc.h"
>
> --
> 2.29.0
>


-- 
Best Regards
Masahiro Yamada
