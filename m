Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34013FC088
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 03:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239228AbhHaBmv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Aug 2021 21:42:51 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:39043 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235217AbhHaBmv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Aug 2021 21:42:51 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17V1fhhv027108;
        Tue, 31 Aug 2021 10:41:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17V1fhhv027108
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630374104;
        bh=JZ5DbtYVq6OfrcpKxS1/TXxCPjjOZa0Aol+PAjCfB68=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=isitGJhlVDBzcVDdkeOmD6yT/IMcyOAIW7Wbc6TDLvTnt27wUT8u1DaQo67d7DtZx
         xs+asyP5UovIi5RwHl47C5P8BvuBN0BrgfLvUcbycRNe5qA0gxjKA+C960ZbQm3rgW
         pfFkU6Uwcq4TqdpPm3HABFmVhiqD2QHVxy2YEIXQ9IoNSDaOPHO12obfIjItQokeem
         lIDAbtvv2TOPHsf7qqqXgTBPDtwgusLu5moxBtknqV7UXdLafgd724Qcxw3mRo/n8f
         Uj1njZhsG0cEkOLNZ3RIeoFgZURcrDFYxGACkZhT4FtjLlEsgWOn4SHKS7qBN0XLVz
         n3/4LiWaoODFQ==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso793896pjh.5;
        Mon, 30 Aug 2021 18:41:44 -0700 (PDT)
X-Gm-Message-State: AOAM53197NXeNvDd/UKLY8L59lKXGbc1kW2cLKYV0PoSqZfy5KkXdL2I
        AVfvWoplNYGJ/ZXLBW0J52+7kmCRiGbR4j9scOE=
X-Google-Smtp-Source: ABdhPJyK7AuWtyZmf//uYM/wNknkH5DeCvUjwvli5RqfCq1Vd1NXmLrD4ma6hPD8Fpp/2fA3VJImVrx7O5QyLWn11rg=
X-Received: by 2002:a17:90a:19da:: with SMTP id 26mr2248735pjj.198.1630374103503;
 Mon, 30 Aug 2021 18:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210828095103.2617393-1-masahiroy@kernel.org>
In-Reply-To: <20210828095103.2617393-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 31 Aug 2021 10:41:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUL4G5N8h1c9GmNcrPeYzuF2Pon4nxB2V32S_2NCXoYA@mail.gmail.com>
Message-ID: <CAK7LNATUL4G5N8h1c9GmNcrPeYzuF2Pon4nxB2V32S_2NCXoYA@mail.gmail.com>
Subject: Re: [PATCH 1/5] modpost: get the *.mod file path more simply
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
> get_src_version() strips 'o' or 'lto.o' from the end of the object file
> path (so, postfixlen is 1 or 5), then adds 'mod'.
>
> If you look at the code closely, mod->name already holds the base path
> with the extension stripped.
>
> Most of the code changes made by commit 7ac204b545f2 ("modpost: lto:
> strip .lto from module names") was actually unneeded.
>
> sumversion.c does not need strends(), so it can get back local in
> modpost.c again.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied this to linux-kbuild.
(only 1/5 and 3/5)






>  scripts/mod/modpost.c    | 11 ++++++++++-
>  scripts/mod/modpost.h    |  9 ---------
>  scripts/mod/sumversion.c |  7 +------
>  3 files changed, 11 insertions(+), 16 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 270a7df898e2..a26139aa57fd 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -17,6 +17,7 @@
>  #include <ctype.h>
>  #include <string.h>
>  #include <limits.h>
> +#include <stdbool.h>
>  #include <errno.h>
>  #include "modpost.h"
>  #include "../../include/linux/license.h"
> @@ -89,6 +90,14 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...)
>                 error_occurred = true;
>  }
>
> +static inline bool strends(const char *str, const char *postfix)
> +{
> +       if (strlen(str) < strlen(postfix))
> +               return false;
> +
> +       return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
> +}
> +
>  void *do_nofail(void *ptr, const char *expr)
>  {
>         if (!ptr)
> @@ -2060,7 +2069,7 @@ static void read_symbols(const char *modname)
>         if (!mod->is_vmlinux) {
>                 version = get_modinfo(&info, "version");
>                 if (version || all_versions)
> -                       get_src_version(modname, mod->srcversion,
> +                       get_src_version(mod->name, mod->srcversion,
>                                         sizeof(mod->srcversion) - 1);
>         }
>
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index c1a895c0d682..0c47ff95c0e2 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -2,7 +2,6 @@
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <stdarg.h>
> -#include <stdbool.h>
>  #include <string.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> @@ -178,14 +177,6 @@ static inline unsigned int get_secindex(const struct elf_info *info,
>         return info->symtab_shndx_start[sym - info->symtab_start];
>  }
>
> -static inline bool strends(const char *str, const char *postfix)
> -{
> -       if (strlen(str) < strlen(postfix))
> -               return false;
> -
> -       return strcmp(str + strlen(str) - strlen(postfix), postfix) == 0;
> -}
> -
>  /* file2alias.c */
>  extern unsigned int cross_build;
>  void handle_moddevtable(struct module *mod, struct elf_info *info,
> diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> index 760e6baa7eda..905c0ec291e1 100644
> --- a/scripts/mod/sumversion.c
> +++ b/scripts/mod/sumversion.c
> @@ -391,14 +391,9 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
>         struct md4_ctx md;
>         char *fname;
>         char filelist[PATH_MAX + 1];
> -       int postfix_len = 1;
> -
> -       if (strends(modname, ".lto.o"))
> -               postfix_len = 5;
>
>         /* objects for a module are listed in the first line of *.mod file. */
> -       snprintf(filelist, sizeof(filelist), "%.*smod",
> -                (int)strlen(modname) - postfix_len, modname);
> +       snprintf(filelist, sizeof(filelist), "%s.mod", modname);
>
>         buf = read_text_file(filelist);
>
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
