Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78133CC9A5
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jul 2021 16:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbhGROr1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Jul 2021 10:47:27 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:18778 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbhGROr1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Jul 2021 10:47:27 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 16IEhwBr020081;
        Sun, 18 Jul 2021 23:43:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 16IEhwBr020081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626619438;
        bh=Ca0tUUOo3zqHqqT5TxNA6woBdlp9NIaRb6HDjdsKCV0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tLbildqA5Y3itQ1lrFxDc0N+0kFXqmIO2qYlu2sVAp/QvrF4bV0fiLhlBYsAhuV8X
         2Lrv4+Veytm3racarFjSKqPUiZGa/KZ+f4K86/z5f3Kc2JMD2CWMdnfBI78Sbfv/AQ
         LHErrsrFLsI4iVjih6OU8WTH+oKlf49RTbnYERKt2JW3qjDScg0Bcxgt62NEpbA2wK
         shGAzaOtZwqvpFpThv8kZLhec44hKJhR2VJbskpSqfKDuYvRHGPQm7mhWSm0voIT3+
         OavkywqwZVULvXT5EOOTBmw1Fgoibf8ndV8uYISMmFVz0bDH/KEAtnKj3ri3IvgWnn
         +pQ7XRwj/xFFw==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id g24so9698890pji.4;
        Sun, 18 Jul 2021 07:43:58 -0700 (PDT)
X-Gm-Message-State: AOAM533JA1QvlcTq6cxmB+zvhpppI1rfAdybwz5+ruWvD8+ICqEFTi1c
        ltOLu7Da/cCqpt9GuDphLUNae8kVFO3MtkOR4VY=
X-Google-Smtp-Source: ABdhPJx720EcjpqMRa6w9S/gbiexM0ZhbBucxgbyQvE3eyyZ2OwUOzdhxhH/VKm2SjJryYAslL+OnTZR4LmK7yeZhFE=
X-Received: by 2002:a17:902:e8ce:b029:12b:3d80:a028 with SMTP id
 v14-20020a170902e8ceb029012b3d80a028mr15678239plg.47.1626619437827; Sun, 18
 Jul 2021 07:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210715073716.17477-1-lecopzer.chen@mediatek.com>
In-Reply-To: <20210715073716.17477-1-lecopzer.chen@mediatek.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 18 Jul 2021 23:43:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAToKcvCLSrAbjb9RJn3mmwt_fzGTq+3ejNb034PVNeG2g@mail.gmail.com>
Message-ID: <CAK7LNAToKcvCLSrAbjb9RJn3mmwt_fzGTq+3ejNb034PVNeG2g@mail.gmail.com>
Subject: Re: [PATCH v4] Kbuild: lto: fix module versionings mismatch in GNU
 make 3.X
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>, yj.chiang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 15, 2021 at 4:37 PM Lecopzer Chen
<lecopzer.chen@mediatek.com> wrote:
>
> When building modules(CONFIG_...=m), I found some of module versions
> are incorrect and set to 0.
> This can be found in build log for first clean build which shows
>
> WARNING: EXPORT symbol "XXXX" [drivers/XXX/XXX.ko] version generation failed,
> symbol will not be versioned.
>
> But in second build(incremental build), the WARNING disappeared and the
> module version becomes valid CRC and make someone who want to change
> modules without updating kernel image can't insert their modules.
>
> The problematic code is
> +       $(foreach n, $(filter-out FORCE,$^),                            \
> +               $(if $(wildcard $(n).symversions),                      \
> +                       ; cat $(n).symversions >> $@.symversions))
>
> For example:
>   rm -f fs/notify/built-in.a.symversions    ; rm -f fs/notify/built-in.a; \
> llvm-ar cDPrST fs/notify/built-in.a fs/notify/fsnotify.o \
> fs/notify/notification.o fs/notify/group.o ...
>
> `foreach n` shows nothing to `cat` into $(n).symversions because
> `if $(wildcard $(n).symversions)` return nothing, but actually
> they do exist during this line was executed.
>
> -rw-r--r-- 1 root root 168580 Jun 13 19:10 fs/notify/fsnotify.o
> -rw-r--r-- 1 root root    111 Jun 13 19:10 fs/notify/fsnotify.o.symversions
>
> The reason is the $(n).symversions are generated at runtime, but
> Makefile wildcard function expends and checks the file exist or not
> during parsing the Makefile.
>
> Thus fix this by use `test` shell command to check the file
> existence in runtime.
>
> Rebase from both:
> 1. [https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/]
> 2. [https://lore.kernel.org/lkml/20210702032943.7865-1-lecopzer.chen@mediatek.com/]
>
> Fixes: 38e89184900385 ("kbuild: lto: fix module versioning")
> Sign-off-byed: Sami Tolvanen <samitolvanen@google.com>


This Signed-off-by is not correct usage, I think.

I replaced it with Co-developed-by.

I usually use 'for ... do ... done' instead of $(foreach ...),
and 'if ... then ... fi' instead of $(if ...).

But, this is the minimal change without causing
too long command line.

Applied to linux-kbuild. Thanks.





> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 10b2f2380d6f..02197cb8e3a7 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -386,7 +386,7 @@ ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
>        cmd_update_lto_symversions =                                     \
>         rm -f $@.symversions                                            \
>         $(foreach n, $(filter-out FORCE,$^),                            \
> -               $(if $(wildcard $(n).symversions),                      \
> +               $(if $(shell test -s $(n).symversions && echo y),       \
>                         ; cat $(n).symversions >> $@.symversions))
>  else
>        cmd_update_lto_symversions = echo >/dev/null
> --
> 2.18.0
>


-- 
Best Regards
Masahiro Yamada
