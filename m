Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81865422CAD
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 17:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235689AbhJEPkh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 11:40:37 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57172 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235510AbhJEPkg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 11:40:36 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 195FcWnh026244;
        Wed, 6 Oct 2021 00:38:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 195FcWnh026244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633448313;
        bh=vFxEVVs4NwGaokvHfuD9YVQU6QjgWD0vThAKmtp9B5Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ui8eJdIxfYs+orw0iHCzw8JVU5ubG85ee+L4WnPTYJR0psDb0HDFsWPbtVrT8S1/e
         ncQuME88u1Bm94+0kGVE66SurmoRlQlBC8mo4M5YNQwXRmuaYkob3Zy1HXPeCkGmi3
         39MXziXD5BnTKuMbUYt+0EMTuTrFBmuOEg/H/2gUHl/w7LoSQ1nXAZrJx+7AkmtUcl
         SwNKMgM2AFtwzWEXpeZZDUY+J1rCbNe0WDc/aHvQUnTVzoJcu1ZE4Wmt9SBDGb2F5O
         /++obYkz4T7U7m99S1HX69+2JMk6pHkYTXpMiSBG9j+M/Rgu+qwQnuPX3Lq9STNSTR
         Lkip9XiFQ7tQA==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id rm6-20020a17090b3ec600b0019ece2bdd20so2823625pjb.1;
        Tue, 05 Oct 2021 08:38:32 -0700 (PDT)
X-Gm-Message-State: AOAM533ASXy7AYzEDUo1tnMmgFxu55Eh0uUvbIDsRiDV74Kh/n6ZaxY0
        Pbwa+6LqQxt90+EKKdeSHscl0geaWEDS1IeHHf4=
X-Google-Smtp-Source: ABdhPJwhljwX2x2G2fkRcVvDvz+9AR6ZYIDWkMDm2S9AoI1zuc7EM0wec4G9JCCwWTRt4b4Z+HrzEfwTDertm4l1+cQ=
X-Received: by 2002:a17:902:8206:b0:13e:19b2:af4b with SMTP id
 x6-20020a170902820600b0013e19b2af4bmr5708386pln.82.1633448311724; Tue, 05 Oct
 2021 08:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211001053253.1223316-1-masahiroy@kernel.org>
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 6 Oct 2021 00:37:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQH9z5xnmR2xpfEGZ4_bY3HNU=j4s_wr5vWnieid03=5Q@mail.gmail.com>
Message-ID: <CAK7LNAQH9z5xnmR2xpfEGZ4_bY3HNU=j4s_wr5vWnieid03=5Q@mail.gmail.com>
Subject: Re: [PATCH 01/10] kconfig: remove 'const' from the return type of sym_escape_string_value()
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 1, 2021 at 2:33 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> sym_escape_string_value() returns a malloc'ed memory, but as
> (const char *). So, it must be casted to (void *) when it is free'd.
> This is odd.
>
> The return type of sym_escape_string_value() should be (char *).
>
> I exploited that free(NULL) has no effect.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


All applied to linux-kbuild.

I pushed 10/10 v3 to the for-next branch.


>
>  scripts/kconfig/conf.c      | 15 +++++++--------
>  scripts/kconfig/confdata.c  | 27 ++++++++++++++-------------
>  scripts/kconfig/lkc_proto.h |  2 +-
>  scripts/kconfig/symbol.c    |  3 ++-
>  4 files changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 5d84b44a2a2a..310fdd408793 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -647,17 +647,16 @@ static void check_conf(struct menu *menu)
>                 switch (input_mode) {
>                 case listnewconfig:
>                         if (sym->name) {
> -                               const char *str;
> +                               const char *val = sym_get_string_value(sym);
> +                               char *escaped = NULL;
>
>                                 if (sym->type == S_STRING) {
> -                                       str = sym_get_string_value(sym);
> -                                       str = sym_escape_string_value(str);
> -                                       printf("%s%s=%s\n", CONFIG_, sym->name, str);
> -                                       free((void *)str);
> -                               } else {
> -                                       str = sym_get_string_value(sym);
> -                                       printf("%s%s=%s\n", CONFIG_, sym->name, str);
> +                                       escaped = sym_escape_string_value(val);
> +                                       val = escaped;
>                                 }
> +
> +                               printf("%s%s=%s\n", CONFIG_, sym->name, val);
> +                               free(escaped);
>                         }
>                         break;
>                 case helpnewconfig:
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index cf72680cd769..9b2271eb43d6 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -728,21 +728,22 @@ static struct conf_printer header_printer_cb =
>  static void conf_write_symbol(FILE *fp, struct symbol *sym,
>                               struct conf_printer *printer, void *printer_arg)
>  {
> -       const char *str;
> +       const char *val;
> +       char *escaped = NULL;
>
> -       switch (sym->type) {
> -       case S_UNKNOWN:
> -               break;
> -       case S_STRING:
> -               str = sym_get_string_value(sym);
> -               str = sym_escape_string_value(str);
> -               printer->print_symbol(fp, sym, str, printer_arg);
> -               free((void *)str);
> -               break;
> -       default:
> -               str = sym_get_string_value(sym);
> -               printer->print_symbol(fp, sym, str, printer_arg);
> +       if (sym->type == S_UNKNOWN)
> +               return;
> +
> +       val = sym_get_string_value(sym);
> +
> +       if (sym->type == S_STRING) {
> +               escaped = sym_escape_string_value(val);
> +               val = escaped;
>         }
> +
> +       printer->print_symbol(fp, sym, val, printer_arg);
> +
> +       free(escaped);
>  }
>
>  static void
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index a11626bdc421..e6955df49973 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -18,7 +18,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
>
>  struct symbol * sym_lookup(const char *name, int flags);
>  struct symbol * sym_find(const char *name);
> -const char * sym_escape_string_value(const char *in);
> +char *sym_escape_string_value(const char *in);
>  struct symbol ** sym_re_search(const char *pattern);
>  const char * sym_type_name(enum symbol_type type);
>  void sym_calc_value(struct symbol *sym);
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 5844d636d38f..6bf8665a6a0f 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -871,7 +871,8 @@ struct symbol *sym_find(const char *name)
>         return symbol;
>  }
>
> -const char *sym_escape_string_value(const char *in)
> +/* The returned pointer must be freed on the caller side */
> +char *sym_escape_string_value(const char *in)
>  {
>         const char *p;
>         size_t reslen;
> --
> 2.30.2
>


-- 
Best Regards
Masahiro Yamada
