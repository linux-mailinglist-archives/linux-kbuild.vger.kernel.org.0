Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E00C2A23C9
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 05:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgKBE2p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 1 Nov 2020 23:28:45 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:57836 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727620AbgKBE2p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Nov 2020 23:28:45 -0500
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0A24SKwN013665
        for <linux-kbuild@vger.kernel.org>; Mon, 2 Nov 2020 13:28:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0A24SKwN013665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604291301;
        bh=HMrwmvH6e3pTXfFcgUqHckrcPn4ArqSSVM+egN9JRZI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=euXTxtfTtUV+01HrkFLtBxf85bvf2381HLTd0trXG3ggjNSlNMR+pWxRGgxiv2fgn
         fkCcfmkf1y1kue6uanINUPeBZYOTugRPxu0lXTP5Nv2N/0sIGjgbNSYdKtgR0hbd5E
         gf5AOCiEDXGvGCGIBkt59C+jAFGy5/WUaQoffYw6QVoWF3LVpa8WwOydDI8ha4pe+I
         188FMe1jJm00VJCoeIGCjdurMGrQv5Jcur+yKLrlldZus9o2yjpDzXCkyg7Gem8aB3
         0IzIwaf+i6L6esfTnrbnuTLxGr4t+uZ5UxTI46wf43axQo0u9IEIU7Oc/Out57N9Rx
         vQNB1LLbqbgtw==
X-Nifty-SrcIP: [209.85.215.180]
Received: by mail-pg1-f180.google.com with SMTP id r10so9677499pgb.10
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2020 20:28:20 -0800 (PST)
X-Gm-Message-State: AOAM530uVdOLoureQxEqNansQga8aaCqovg1H4F+oDIMcPIQnM4Ht6uP
        hNDOQQ2CuMDUi/edszYn2tDo9eb4vqLsSEz4u7U=
X-Google-Smtp-Source: ABdhPJw/4R7x3ZxKMHkCXhRH2CuLKDPCEnL1jTk5sosPdLS+r6L1TCoWbjIaF1+TtiqRA0FC8wWK7PaYDM7MsyY3deI=
X-Received: by 2002:a63:6647:: with SMTP id a68mr11699841pgc.7.1604291300043;
 Sun, 01 Nov 2020 20:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20201029155152.2467-1-boris@codesynthesis.com> <20201029155152.2467-3-boris@codesynthesis.com>
In-Reply-To: <20201029155152.2467-3-boris@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 2 Nov 2020 13:27:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRfK7LFrmJdMj4n77rb6pBYY=gXNLkfoSjk=pBJkg79w@mail.gmail.com>
Message-ID: <CAK7LNARRfK7LFrmJdMj4n77rb6pBYY=gXNLkfoSjk=pBJkg79w@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: clean up header inclusion
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 30, 2020 at 12:52 AM Boris Kolpackov
<boris@codesynthesis.com> wrote:
>
> - Add missing includes.
> - Remove no longer necessary includes.
> - Separate non-portable header includes for easier porting.

I think the definition of "non-portable"
depends on how far we expand the supported system.

I guess you want to segregate <unistd.h> and <sys/mmap.h>
because you do not have them on Windows, correct?


>
> Signed-off-by: Boris Kolpackov <boris@codesynthesis.com>
> ---
>  scripts/kconfig/conf.c     | 6 +++---
>  scripts/kconfig/confdata.c | 4 +++-
>  scripts/kconfig/lexer.l    | 1 -
>  scripts/kconfig/symbol.c   | 3 ++-
>  4 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index f6e548b..74974df 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -9,12 +9,12 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <time.h>
> -#include <unistd.h>
>  #include <getopt.h>
> -#include <sys/stat.h>
> -#include <sys/time.h>
>  #include <errno.h>
>
> +#include <unistd.h>
> +#include <sys/time.h>
> +
>  #include "lkc.h"
>
>  static void conf(struct menu *menu);
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index a39d93e..64344b9 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -3,7 +3,7 @@
>   * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
>   */
>
> -#include <sys/mman.h>
> +#include <sys/types.h>
>  #include <sys/stat.h>
>  #include <ctype.h>
>  #include <errno.h>
> @@ -14,7 +14,9 @@
>  #include <stdlib.h>
>  #include <string.h>
>  #include <time.h>
> +
>  #include <unistd.h>
> +#include <sys/mman.h>
>
>  #include "lkc.h"
>
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
> index ffa3ec6..0e0f1cc 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -6,8 +6,9 @@
>  #include <ctype.h>
>  #include <stdlib.h>
>  #include <string.h>
> +#include <sys/types.h> // off_t
> +
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
