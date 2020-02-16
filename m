Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E22751601B5
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2020 06:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgBPFJv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Feb 2020 00:09:51 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:40890 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgBPFJu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 00:09:50 -0500
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01G59UFa010966;
        Sun, 16 Feb 2020 14:09:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01G59UFa010966
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581829771;
        bh=rbqePs9IMaIcm8x3+kZKs+EYOftnr7m5qjep5xY5fxg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iHwjX/+WCWjcDYod62PLrTAzcNoFWuxwh19HzVxrmayKtiJqNXexO6eakZPuuuusa
         Hwb+sjrCHDPw7OFwmqaU/vTSglOS1gm/+I1DwLS+88mjkV6PrF5LZtwtPMdZqKxh1o
         jDL+iXgvYJYNE5gXxSifLyRjXMzMbqwe0AX+xtQAFSpLfl7gPwj8tNbbonx8f3drdt
         wOf46QJ9kdjZhSYl/iLIAhCDo/vzMq9covm8pM9RgloCwXt0yC+/4i1R4l5OyuBQVd
         +w4iW2FBsLIwvSyessEQuE98HFAgF4iCF8YP17nXZ2/F3YD/TsmI/AASF30DKzznSi
         FuoflP37LkpPA==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id a2so8719747vso.3;
        Sat, 15 Feb 2020 21:09:30 -0800 (PST)
X-Gm-Message-State: APjAAAWnfe57S+e+eO43BfrUbOfWINl7NodOgxyXY3F69txGm8mn12Iz
        fERCumsv9WXyXXNM2DEoOWq2AKq10ZS81puHvIg=
X-Google-Smtp-Source: APXvYqxBxTQIoI2VevLx1VLO3Y65QF4At1ZpLqEtvYMB0XvZ6WuTKop6V1O+rjOZsFgyrDYUrhIkJ3+PeQaqZ0Dysc4=
X-Received: by 2002:a67:6485:: with SMTP id y127mr5539788vsb.54.1581829769328;
 Sat, 15 Feb 2020 21:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20200130162314.31449-1-e5ten.arch@gmail.com>
In-Reply-To: <20200130162314.31449-1-e5ten.arch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 16 Feb 2020 14:08:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNASxZ9_doDB_t6vFfgVUvh4hpi9RK7_QFU65az+j+JU84A@mail.gmail.com>
Message-ID: <CAK7LNASxZ9_doDB_t6vFfgVUvh4hpi9RK7_QFU65az+j+JU84A@mail.gmail.com>
Subject: Re: [PATCH] make yacc usage POSIX-compliant
To:     Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ethan,

On Fri, Jan 31, 2020 at 1:23 AM Ethan Sommer <e5ten.arch@gmail.com> wrote:
>
> use -b and -d to generate correctly named source and header files,
> instead of bison-specific --defines and non-POSIX -o
> check that YACC command is found in path or is an executable file,
> instead of using bison-specific --version flag to display an error when
> it is missing
> explicitly define yyltype in scripts/genksyms/lex.l, instead of relying
> on bison automatically defining it
> replace bison-specific %destructor use in scripts/kconfig/parser.y
> dtc's yacc usage is not covered here, as its use of bison-specific
> features is much greater, and it is only built on certain architectures,
> unlike kconfig and genksyms

Please start each sentence with a capital letter,
and end with a period.

>
> Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
> ---
>  scripts/Makefile.host     |  2 +-
>  scripts/genksyms/Makefile |  6 ++++--
>  scripts/genksyms/lex.l    |  2 ++
>  scripts/kconfig/parser.y  | 14 +++++++-------
>  4 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 4c51c95d40f4..64e98e1d4825 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -11,7 +11,7 @@ $(obj)/%.lex.c: $(src)/%.l FORCE
>  # YACC
>  # ---------------------------------------------------------------------------
>  quiet_cmd_bison = YACC    $(basename $@).[ch]
> -      cmd_bison = $(YACC) -o $(basename $@).c --defines=$(basename $@).h -t -l $<
> +      cmd_bison = $(YACC) -b $(basename $(basename $@)) -d -t -l $<
>
>  $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
>         $(call if_changed,bison)
> diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
> index 78629f515e78..1e120328fa88 100644
> --- a/scripts/genksyms/Makefile
> +++ b/scripts/genksyms/Makefile
> @@ -14,9 +14,11 @@ genksyms-objs        := genksyms.o parse.tab.o lex.lex.o
>  # so that 'bison: not found' will be displayed if it is missing.
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>
> +ifeq ($(shell command -v $(YACC) || [ -x $(YACC) ] && echo y),)
> +  $(error command not found: $(YACC))
> +endif


Please do not check the presence of $(YACC)
in the parse stage of Makefile.

You would not be able to run 'make mrproper' or 'make distclean'
without $(YACC), which is odd.


>  quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
> -      cmd_bison_no_warn = $(YACC) --version >/dev/null; \
> -                         $(cmd_bison) 2>/dev/null
> +      cmd_bison_no_warn = $(cmd_bison) 2>/dev/null
>
>  $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
>         $(call if_changed,bison_no_warn)
> diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
> index e265c5d96861..0580c088527f 100644
> --- a/scripts/genksyms/lex.l
> +++ b/scripts/genksyms/lex.l
> @@ -19,6 +19,8 @@
>  #include "genksyms.h"
>  #include "parse.tab.h"
>
> +extern YYSTYPE yylval;
> +
>  /* We've got a two-level lexer here.  We let flex do basic tokenization
>     and then we categorize those basic tokens in the second stage.  */
>  #define YY_DECL                static int yylex1(void)
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index b3eff9613cf8..9eb9a94a68e0 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -20,6 +20,8 @@
>
>  int cdebug = PRINTD;
>
> +int yynerrs = 0;
> +

Isn't yynerrs POSIX-compiliant?

Both bison and byacc worked for me without this change.


This patch is stricter than
your previous 'make it work for byacc as well'.

If this is a desired change,
how can I test if the code is POSIX-compliant?



But, I am still not convinced with this part:

"dtc's yacc usage is not covered here, as its use of bison-specific
features is much greater, and it is only built on certain architectures,
unlike kconfig and genksyms"


If DTC remains as an exceptional case that is bison-specific code,
I do not get the point of merging this change.





>  static void yyerror(const char *err);
>  static void zconfprint(const char *err, ...);
>  static void zconf_error(const char *err, ...);
> @@ -101,13 +103,6 @@ static struct menu *current_menu, *current_entry;
>  %type <string> word_opt assign_val
>  %type <flavor> assign_op
>
> -%destructor {
> -       fprintf(stderr, "%s:%d: missing end statement for this entry\n",
> -               $$->file->name, $$->lineno);
> -       if (current_menu == $$)
> -               menu_end_menu();
> -} if_entry menu_entry choice_entry
> -
>  %%
>  input: mainmenu_stmt stmt_list | stmt_list;
>
> @@ -529,6 +524,11 @@ static bool zconf_endtoken(const char *tokenname,
>         if (strcmp(tokenname, expected_tokenname)) {
>                 zconf_error("unexpected '%s' within %s block",
>                             tokenname, expected_tokenname);
> +               if (!strcmp(tokenname, "if") || !strcmp(tokenname, "menu") ||
> +                       !strcmp(tokenname, "choice"))
> +                       fprintf(stderr, "%s:%d: missing end statement for this entry\n",
> +                               current_menu->file->name, current_menu->lineno);
> +               menu_end_menu();
>                 yynerrs++;
>                 return false;
>         }
> --
> 2.25.0
>


--
Best Regards
Masahiro Yamada
