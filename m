Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8053FC08A
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 03:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239293AbhHaBnO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Aug 2021 21:43:14 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63919 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239288AbhHaBnN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Aug 2021 21:43:13 -0400
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17V1fx5U016524;
        Tue, 31 Aug 2021 10:41:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17V1fx5U016524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630374119;
        bh=wIebck+1d0nOlapsfUIbcPUs2lpB7f97XRL87rnSo64=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=miamAzTIgyeh1yYKN8E4LDz6DXy+1/JIfrOTAQCnSbmAc2M5p5TzrZ/UYQhwnBNuB
         YW69PsAzy6hQK+Nulh6FMb9c9zXxN1ZUvgDQ+KSlWm733P9GN3vOjimm2xskgm9NYb
         iOujfPnThmRDR3Lg+oDBb3ytk5aVUd8br0ELb81IpAxDz6xX3xkvfk5YnR3BsEAftA
         LWenX1q3pSDVN/DrDrtZRlePnq1Ghg0ExMdLzHq+7hoyscDeUz42fA0ExuYhMm5G4p
         JBmtumdT2Ve01K4DDtyCmFhwFIcOJxC3h+0oNy2PHHrBVONC5yQt/cZTrTMousdcfb
         8nwSV+imTPKoQ==
X-Nifty-SrcIP: [209.85.215.180]
Received: by mail-pg1-f180.google.com with SMTP id w7so14073680pgk.13;
        Mon, 30 Aug 2021 18:41:59 -0700 (PDT)
X-Gm-Message-State: AOAM533zW5s+OOwxUjnxiVMrq1BgOs5l2Blp0EjNpv73Cg2KcXxpBwaS
        Cyuj9JUOaEeodMltJJMlR6HN6+bc6eBwYy+7euo=
X-Google-Smtp-Source: ABdhPJzQgUWJQKfdWaNwSd/FoafaTxXCsBpTu1yDCAHv7N09gw3cDOlwdx/GzVqBjoysChIGoBzvEABJ9U5rAJbRNGo=
X-Received: by 2002:a62:1c96:0:b0:3f5:e01a:e47 with SMTP id
 c144-20020a621c96000000b003f5e01a0e47mr17845858pfc.76.1630374118822; Mon, 30
 Aug 2021 18:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210828095103.2617393-1-masahiroy@kernel.org> <20210828095103.2617393-3-masahiroy@kernel.org>
In-Reply-To: <20210828095103.2617393-3-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 31 Aug 2021 10:41:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNASJZkKVHtFyPDT_aZsZPDwrgU7iaVV6LRg+x2e_bJs2PA@mail.gmail.com>
Message-ID: <CAK7LNASJZkKVHtFyPDT_aZsZPDwrgU7iaVV6LRg+x2e_bJs2PA@mail.gmail.com>
Subject: Re: [PATCH 3/5] kbuild: clean up objtool_args slightly
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 28, 2021 at 6:51 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The code:
>
>   $(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)), ...)
>
> ... can be simpled to:
>
>   $(if $(CONFIG_GCOV_KERNEL)$(CONFIG_LTO_CLANG), ...)
>
> Also, remove meaningless commas at the end of $(if ...).
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied this to linux-kbuild.
(only 1/5 and 3/5)



>  scripts/Makefile.lib | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index af1c920a585c..cd011f3f6f78 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -236,13 +236,12 @@ endif
>  # then here to avoid duplication.
>  objtool_args =                                                         \
>         $(if $(CONFIG_UNWINDER_ORC),orc generate,check)                 \
> -       $(if $(part-of-module), --module,)                              \
> +       $(if $(part-of-module), --module)                               \
>         $(if $(CONFIG_FRAME_POINTER),, --no-fp)                         \
> -       $(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)),           \
> -               --no-unreachable,)                                      \
> -       $(if $(CONFIG_RETPOLINE), --retpoline,)                         \
> -       $(if $(CONFIG_X86_SMAP), --uaccess,)                            \
> -       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount,)
> +       $(if $(CONFIG_GCOV_KERNEL)$(CONFIG_LTO_CLANG), --no-unreachable)\
> +       $(if $(CONFIG_RETPOLINE), --retpoline)                          \
> +       $(if $(CONFIG_X86_SMAP), --uaccess)                             \
> +       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
>
>  # Useful for describing the dependency of composite objects
>  # Usage:
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
