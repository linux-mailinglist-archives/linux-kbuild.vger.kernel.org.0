Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C10419462
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Sep 2021 14:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234285AbhI0MjN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Sep 2021 08:39:13 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36499 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234360AbhI0MjN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Sep 2021 08:39:13 -0400
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 18RCbLlG002098;
        Mon, 27 Sep 2021 21:37:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 18RCbLlG002098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632746241;
        bh=pUcFzAXF6oNhcxf1TXoNZ5kQfrqJ0iU8E26dvDH6FbY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=No1XCXTr2PBzWAv4xi/l515uNjLHFYnCeThcz7cX2BhCjrxxweC5+PZP0c/PJgg3/
         eGFyDNwqEBzSnBDohe7/EFPPrFaQzFD9mhD8qOkxqRVyRnpmfzwY+EYxTlLZnGsjXp
         LymFoq0xffjFYEEZBX2EqQ+M9WOGnJ+F+Cg5g0vSC52npQlbLpLqeu+RXFPcfacCRJ
         EKWou7aKo780ROJIuZ9D/hvdbXRh/a2Pl9vlQXtgnF5FbN/UudiHywtSpZMOqbo8/T
         NU7XZkpeif19ixuM9kQl83zuWXYQjs9NYGovV7zrEM44fh05v0/NtHS5RwPGc0eRQM
         Qrw9qzAm/MX9A==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id x191so10752119pgd.9;
        Mon, 27 Sep 2021 05:37:21 -0700 (PDT)
X-Gm-Message-State: AOAM530hb87k09D1VTb+bDZ5b4TFVzUYseIITDYK25r6uVZJhrODWHa2
        y+2+z9F6MoKwprwc9zwV+lEAbss6lJzecisk/jc=
X-Google-Smtp-Source: ABdhPJxb+V+zS+YBP1GzBmfeAG9K0qPi2xYWSFnfeG8ly7Sj9b3G6eC9LkMVocjFe9h04X/x/kRG6PRFa2PVNqJkTJo=
X-Received: by 2002:a05:6a00:78d:b0:447:3496:a301 with SMTP id
 g13-20020a056a00078d00b004473496a301mr23407613pfu.68.1632746240373; Mon, 27
 Sep 2021 05:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210920213957.1064-1-richard@nod.at>
In-Reply-To: <20210920213957.1064-1-richard@nod.at>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 27 Sep 2021 21:36:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQd1d89J8GjLExgeirQ3cR+tnP6GMgekeBcrGJ-=ArrCQ@mail.gmail.com>
Message-ID: <CAK7LNAQd1d89J8GjLExgeirQ3cR+tnP6GMgekeBcrGJ-=ArrCQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Refactor sym_escape_string_value
To:     Richard Weinberger <richard@nod.at>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 21, 2021 at 6:42 AM Richard Weinberger <richard@nod.at> wrote:
>
> sym_escape_string_value() can take a struct symbol directly
> and use sym_get_string_value() itself to obtain the string value.
> We will need struct symbol later for error reporting.
>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---

I think this is a nice clean-up regardless of 2/2.
Applied to linux-kbuild. Thanks.



>  scripts/kconfig/conf.c      | 3 +--
>  scripts/kconfig/confdata.c  | 3 +--
>  scripts/kconfig/lkc_proto.h | 2 +-
>  scripts/kconfig/symbol.c    | 6 ++++--
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 5d84b44a2a2a..a6dad4a2e7a2 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -650,8 +650,7 @@ static void check_conf(struct menu *menu)
>                                 const char *str;
>
>                                 if (sym->type == S_STRING) {
> -                                       str = sym_get_string_value(sym);
> -                                       str = sym_escape_string_value(str);
> +                                       str = sym_escape_string(sym);
>                                         printf("%s%s=%s\n", CONFIG_, sym->name, str);
>                                         free((void *)str);
>                                 } else {
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index cf72680cd769..4e053f2477f9 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -734,8 +734,7 @@ static void conf_write_symbol(FILE *fp, struct symbol *sym,
>         case S_UNKNOWN:
>                 break;
>         case S_STRING:
> -               str = sym_get_string_value(sym);
> -               str = sym_escape_string_value(str);
> +               str = sym_escape_string(sym);
>                 printer->print_symbol(fp, sym, str, printer_arg);
>                 free((void *)str);
>                 break;
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index a11626bdc421..035cc522808b 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -18,7 +18,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
>
>  struct symbol * sym_lookup(const char *name, int flags);
>  struct symbol * sym_find(const char *name);
> -const char * sym_escape_string_value(const char *in);
> +const char * sym_escape_string(struct symbol *sym);
>  struct symbol ** sym_re_search(const char *pattern);
>  const char * sym_type_name(enum symbol_type type);
>  void sym_calc_value(struct symbol *sym);
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 5844d636d38f..4a31bb943f79 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -871,13 +871,15 @@ struct symbol *sym_find(const char *name)
>         return symbol;
>  }
>
> -const char *sym_escape_string_value(const char *in)
> +const char *sym_escape_string(struct symbol *sym)
>  {
> -       const char *p;
> +       const char *in, *p;
>         size_t reslen;
>         char *res;
>         size_t l;
>
> +       in = sym_get_string_value(sym);
> +
>         reslen = strlen(in) + strlen("\"\"") + 1;
>
>         p = in;
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
