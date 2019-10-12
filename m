Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3434D4C68
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2019 05:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfJLDXX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 23:23:23 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:53551 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbfJLDXX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 23:23:23 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x9C3Mvbg032318;
        Sat, 12 Oct 2019 12:22:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x9C3Mvbg032318
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570850578;
        bh=AzVFdYtQgZNSjO2R+li0ag0FvODB9DQNFkD9W0UZhWc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J0pgg8ccnM+XYJ+pD8J6RLtLn1VsDZijOg7QVA9iGfoNRgVElYcw5cEwRDsWoq3Uc
         mVTnVDu2l6S73/QYImKlEhLqF4mOb7nrcpWZBVleF0Zu/lUjEEbe2NdtuXP7GMVZPM
         G+R+j57GRojdpkS1nuOyUCRvozJMaJegmxmb19Kdm6UTm1H3NnAKLFKYpY0fttDZHr
         wfta9gWPqJTTnBmToYTSw0JzbaQnv5h4v9DqmBcqbESSjsiyDhQWeGxzq/Tbfh/liT
         NGHU2K9Exa92blbjsoheFV+P9L78T2hL5qRWh6ATDGZhs0eJrkQaeTM9cdcxHm4Mib
         0B48zknkOk+Ag==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id 107so3631707uau.5;
        Fri, 11 Oct 2019 20:22:57 -0700 (PDT)
X-Gm-Message-State: APjAAAUh6t2keBJtTuYNw5MT/UbA6BPYuw403ok+OUTJ1u+ItdDE4nKJ
        49p0LUb4mgMV1nE+6a//h8J949hSNwQAAXafEhw=
X-Google-Smtp-Source: APXvYqwxa0+cZ3+BwYhqg+6/lVQXvwK7zHJQu1iLJsgbN6veEmooghiHDltRaMfDtn/qoUlXh02XVKETuUHcT7Yf+00=
X-Received: by 2002:ab0:59ed:: with SMTP id k42mr10261534uad.25.1570850576823;
 Fri, 11 Oct 2019 20:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191010151443.7399-3-maennich@google.com>
In-Reply-To: <20191010151443.7399-3-maennich@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 12 Oct 2019 12:22:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ85JzqvMKmuqCsnL7KqtH_wosia=8XF6QVSf6sCanXnQ@mail.gmail.com>
Message-ID: <CAK7LNAQ85JzqvMKmuqCsnL7KqtH_wosia=8XF6QVSf6sCanXnQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] modpost: make updating the symbol namespace explict
To:     Matthias Maennich <maennich@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 11, 2019 at 12:16 AM Matthias Maennich <maennich@google.com> wrote:
>
> Setting the symbol namespace of a symbol within sym_add_exported feels
> displaced and lead to issues in the current implementation of symbol
> namespaces. This patch makes updating the namespace an explicit call to
> decouple it from adding a symbol to the export list.
>
> Signed-off-by: Matthias Maennich <maennich@google.com>
> ---


Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>



>  scripts/mod/modpost.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 9f5dcdff4d2f..46137b730447 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -382,8 +382,8 @@ static void sym_update_namespace(const char *symname, const char *namespace)
>   * Add an exported symbol - it may have already been added without a
>   * CRC, in this case just update the CRC
>   **/
> -static struct symbol *sym_add_exported(const char *name, const char *namespace,
> -                                      struct module *mod, enum export export)
> +static struct symbol *sym_add_exported(const char *name, struct module *mod,
> +                                      enum export export)
>  {
>         struct symbol *s = find_symbol(name);
>
> @@ -399,7 +399,6 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>                         s->module = mod;
>                 }
>         }
> -       sym_update_namespace(name, namespace);
>         s->preloaded = 0;
>         s->vmlinux   = is_vmlinux(mod->name);
>         s->kernel    = 0;
> @@ -761,7 +760,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>                 if (strstarts(symname, "__ksymtab_")) {
>                         name = symname + strlen("__ksymtab_");
>                         namespace = sym_extract_namespace(&name);
> -                       sym_add_exported(name, namespace, mod, export);
> +                       sym_add_exported(name, mod, export);
> +                       sym_update_namespace(name, namespace);
>                         free(namespace);
>                 }
>                 if (strcmp(symname, "init_module") == 0)
> @@ -2469,12 +2469,12 @@ static void read_dump(const char *fname, unsigned int kernel)
>                         mod = new_module(modname);
>                         mod->skip = 1;
>                 }
> -               s = sym_add_exported(symname, namespace, mod,
> -                                    export_no(export));
> +               s = sym_add_exported(symname, mod, export_no(export));
>                 s->kernel    = kernel;
>                 s->preloaded = 1;
>                 s->is_static = 0;
>                 sym_update_crc(symname, mod, crc, export_no(export));
> +               sym_update_namespace(symname, namespace);
>         }
>         release_file(file, size);
>         return;
> --
> 2.23.0.581.g78d2f28ef7-goog
>


-- 
Best Regards
Masahiro Yamada
