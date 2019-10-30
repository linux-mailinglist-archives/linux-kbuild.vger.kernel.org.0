Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531F8E952A
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 03:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfJ3C7p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 22:59:45 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:61863 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfJ3C7o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 22:59:44 -0400
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x9U2xZt1025589;
        Wed, 30 Oct 2019 11:59:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x9U2xZt1025589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572404376;
        bh=zQxDpruBzRyBKppwP5ufPnzpMr/EBdaseHOs9UiGMV8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OxfsEQxgLNHEqymRgTqaLPInL64onTfT/jX7yOp8c2pSL1h5cnBoLl39FYdgY8MXA
         yyG0PeMARKzREXlhJAgOhpZDJW1c6s8gwrv3UqVxyfxd+/TYM5hkrZTE8JPzpdB6ns
         +lxc/N+/0YDobhp8hCs8+JwleD5eZGozzBKxjf6zQ3l/0Ye9p5xxNzkLE8MfEH6PG0
         FzCOj4bMSD+fOAITzfAWBTWI6j6w8VfZKvr385MRgVTebnVdodd9vaOgxrn8zjUNy0
         e56WlrWlD/lPSpQj5ErYNrm1XvipAtzaeOUlmtoCcawHMNEyxpCxqoYc0x4VTOJOyd
         jZTKyEfq5GtUw==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id d126so147609vkb.1;
        Tue, 29 Oct 2019 19:59:36 -0700 (PDT)
X-Gm-Message-State: APjAAAXAkBYDm71cA3Fy3pnXsuX0sL1Vo0YvMSIF6P9b/PMi/Z7SRRzw
        Fntm7W95YnpDcy0D6SQ943gu7hDukxJzkLsP/sY=
X-Google-Smtp-Source: APXvYqyx4HWyZkPpQ4DmBVc4L5u+YULsarpybloXOc9/eX/T4/sYK5FeUYOgK1GaKScUCfxLZMXJrhqF6cCjNcJ1yPA=
X-Received: by 2002:a1f:4b05:: with SMTP id y5mr13116072vka.12.1572404375169;
 Tue, 29 Oct 2019 19:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
 <20191029150119.19823-1-e5ten.arch@gmail.com>
In-Reply-To: <20191029150119.19823-1-e5ten.arch@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 30 Oct 2019 11:58:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT0HdWrHaubdjNuVSEdQWvqj6SkXNybs5LvEd2i9Ku1cA@mail.gmail.com>
Message-ID: <CAK7LNAT0HdWrHaubdjNuVSEdQWvqj6SkXNybs5LvEd2i9Ku1cA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: support byacc as alternative YACC to bison
To:     Ethan Sommer <e5ten.arch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 30, 2019 at 12:02 AM Ethan Sommer <e5ten.arch@gmail.com> wrote:
>
> Switches to a more portable set of flags for generating the same file
> names instead of the bison-specific --defines, uses the more portable -V
> instead of --version, and explicitly defines YYSTYPE in lex.l, which
> bison implicitly defines if not present but byacc does not.
>
> Add %locations to dtc-parser.y to explicitly enable location tracking
> for byacc, and define YYERROR_CALL explicitly to prevent the locations
> directive from causing it to be defined to a 2-parameter call to
> yyerror, which dtc-parser.y defines to accept one parameter.
>
> Requires byacc to be built with --enable-btyacc.
>
> Signed-off-by: Ethan Sommer <e5ten.arch@gmail.com>
> ---
>  scripts/Makefile.host     | 2 +-
>  scripts/dtc/dtc-parser.y  | 4 ++++
>  scripts/genksyms/Makefile | 2 +-
>  scripts/genksyms/lex.l    | 2 ++
>  4 files changed, 8 insertions(+), 2 deletions(-)
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


Hmm, this is unfortunate since there is no common way to
specify the header path directly.

I am not sure how much effort we should invent
to support non-GNU implementation
since we already rely on various GNU tools.

If we decide to support byacc,
we must carry the restriction
that bans GNU-extension.






>  $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
>         $(call if_changed,bison)
> diff --git a/scripts/dtc/dtc-parser.y b/scripts/dtc/dtc-parser.y
> index 2ed4dc1f07fd..40dcf4f149da 100644
> --- a/scripts/dtc/dtc-parser.y
> +++ b/scripts/dtc/dtc-parser.y
> @@ -2,6 +2,8 @@
>  /*
>   * (C) Copyright David Gibson <dwg@au1.ibm.com>, IBM Corporation.  2005.
>   */
> +%locations
> +
>  %{
>  #include <stdio.h>
>  #include <inttypes.h>
> @@ -17,6 +19,8 @@ extern void yyerror(char const *s);
>                 treesource_error = true; \
>         } while (0)
>
> +#define YYERROR_CALL(msg) yyerror(msg)
> +
>  extern struct dt_info *parser_output;
>  extern bool treesource_error;
>  %}
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
