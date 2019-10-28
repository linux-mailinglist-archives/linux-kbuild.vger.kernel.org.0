Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE7BE7C5D
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2019 23:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfJ1WcI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Oct 2019 18:32:08 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:24226 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfJ1WcI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 18:32:08 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x9SMW3Of018587;
        Tue, 29 Oct 2019 07:32:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x9SMW3Of018587
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572301923;
        bh=tIP4fKcYYiTBe/euc/pda7lr3cd3MV9rfCdBDeRqBKo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JPH3CYBEIwSwtmGVb6OjoxOB0Op9I5l/EayD+2DD+47pJ9jpXjG9Rpln0Oa5qlH4D
         W46CZmmZ38u57ZVSr/NyU5z07EDG1sTjrGXTHwMiesmzy6CwM7rWXAIbADlg7E7Klp
         jCTgS7aohaCM2w7Tt+gAXP7ABh4m3LQzp29H1fMgjAHzd6EiMIathzUQ5MwVWbqcy0
         BbSwWmV+qonTL6aglUJVXaQ1zHLJ3unCQyUSW0QMPHCsoGxOBb2YSsk/AdS8Sb1QpO
         rqbMix+0+bpMV8wT5go371efLTbCyJtmXIAgUgdXis6A9vlYYBFncAbh/MnagMGjFY
         /ts9qL26tT89g==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id f21so2914994uan.3;
        Mon, 28 Oct 2019 15:32:03 -0700 (PDT)
X-Gm-Message-State: APjAAAW6N/MUEd3YdX02TXbwYXwDHeD8YFP9IJ6HWpB7Kns/8EXRZnxB
        Pox9f+upfMlJokZsAQdT26GBiczEh9ZnCSYDBHc=
X-Google-Smtp-Source: APXvYqxn7KT8oRYTTG6hcVMbiPB+u9M5Aux/bjBkpKFFDfjd7wY1m48s+soU/yxmQ5dWOTaQonunwGhWoetABruCEOk=
X-Received: by 2002:a9f:2382:: with SMTP id 2mr9634833uao.95.1572301922136;
 Mon, 28 Oct 2019 15:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191028155639.30330-1-e5ten.arch@gmail.com>
In-Reply-To: <20191028155639.30330-1-e5ten.arch@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 29 Oct 2019 07:31:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS41TxKMLBj3_N=WE57CT7ttHes+7GdLWNW-mAgPkvW7w@mail.gmail.com>
Message-ID: <CAK7LNAS41TxKMLBj3_N=WE57CT7ttHes+7GdLWNW-mAgPkvW7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support byacc as alternative YACC to bison
To:     Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 29, 2019 at 1:02 AM Ethan Sommer <e5ten.arch@gmail.com> wrote:
>
> Switches to a more portable set of flags for generating the same file
> names instead of the bison-specific --defines, uses the more portable -V
> instead of --version, and explicitly defines YYSTYPE in lex.l, which
> bison implicitly defines if not present but byacc does not.
>
> Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
> ---


I applied this patch, and tried the latest byacc,
but I still cannot build kconfig probably because
%destructor is not supported.
byacc does not seem to work anyway.



$ /home/masahiro/bin/yacc  -V
/home/masahiro/bin/yacc - 1.9 20190617
masahiro@grover:~/ref/linux$ make YACC=/home/masahiro/bin/yacc  defconfig
  YACC    scripts/kconfig/parser.tab.[ch]
/home/masahiro/bin/yacc: e - line 104 of "scripts/kconfig/parser.y",
syntax error
%destructor {
^
make[1]: *** [scripts/Makefile.host;17: scripts/kconfig/parser.tab.h] Error 1
make[1]: *** Deleting file 'scripts/kconfig/parser.tab.h'
make[1]: *** [scripts/kconfig/parser.tab.h] Deleting file
'scripts/kconfig/parser.tab.c'
make: *** [Makefile;567: defconfig] Error 2


>  scripts/Makefile.host     | 2 +-
>  scripts/genksyms/Makefile | 2 +-
>  scripts/genksyms/lex.l    | 2 ++
>  3 files changed, 4 insertions(+), 2 deletions(-)
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
> index 78629f515e78..397c2dc8182b 100644
> --- a/scripts/genksyms/Makefile
> +++ b/scripts/genksyms/Makefile
> @@ -15,7 +15,7 @@ genksyms-objs := genksyms.o parse.tab.o lex.lex.o
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>
>  quiet_cmd_bison_no_warn = $(quiet_cmd_bison)
> -      cmd_bison_no_warn = $(YACC) --version >/dev/null; \
> +      cmd_bison_no_warn = $(YACC) -V >/dev/null; \
>                           $(cmd_bison) 2>/dev/null
>
>  $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
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
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
