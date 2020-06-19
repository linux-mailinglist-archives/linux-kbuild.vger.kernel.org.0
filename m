Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3DE200176
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2020 06:57:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727883AbgFSE5s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jun 2020 00:57:48 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:38158 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgFSE5q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 00:57:46 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 05J4v8F1026953;
        Fri, 19 Jun 2020 13:57:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 05J4v8F1026953
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592542629;
        bh=dujpi7I0U9k7gbH9ypmk/muZnwGY/nD2/xY7qqg2JjM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uCfc7PEQubisNfpiKftcKHuBLk64k3wrCfGxB83f+uQqNJdFJJvfpgWtTKuwP7dxj
         a7lgTgtJ4DkjJ1j6oPdNVBoUnG8Hhf1LHPpW3Rs8ljJufGTOigVwKlS27spG+ovjoS
         GumI20+Xp7SmPg30kxUkGflqRlpCB4noQjHXhMyttIY5tN2Ak2bFd8uAhMszU8+DYL
         tJI/vPLkLXzdaRMljZtl/X5pcCIHM/pETidDH3zr88Z6mdla89YEWh1vhjwbi/CXcI
         qLfNAUeq0scaLBWOp3vvhXkZcgAnQWBj6nv1u+A87BLKWbXUBC0XygJIQZBT0+ussc
         Fbw+8waxzPrlg==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id d5so1999677vkb.12;
        Thu, 18 Jun 2020 21:57:08 -0700 (PDT)
X-Gm-Message-State: AOAM533CaHYd8MCpo73bd7VAX40aMSpAnbObzozvUmaVnYRApiKBAQqs
        SQ49qrBylucMYWEHStsOntDnGJ3WmGn8dU+JHng=
X-Google-Smtp-Source: ABdhPJwF2+6s/DEQsVrx9/QAVaGe864JOw9u3yxQfvLNoqvvOVeomg1kILExUV5hpH0dC11xaTrLQnOctSvACrHda1o=
X-Received: by 2002:a1f:1f04:: with SMTP id f4mr6113993vkf.73.1592542627476;
 Thu, 18 Jun 2020 21:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200617030220.34733-1-masahiroy@kernel.org> <20200617030220.34733-2-masahiroy@kernel.org>
 <b1eef508475f2ad501a153bb9d90d64a5128ecdd.camel@perches.com>
In-Reply-To: <b1eef508475f2ad501a153bb9d90d64a5128ecdd.camel@perches.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 19 Jun 2020 13:56:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR-hYJyOHe6Mgw6-3SbDMqd4udq2o1fk1TzVSAy8gsPXQ@mail.gmail.com>
Message-ID: <CAK7LNAR-hYJyOHe6Mgw6-3SbDMqd4udq2o1fk1TzVSAy8gsPXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "checkpatch: kconfig: prefer 'help' over '---help---'"
To:     Joe Perches <joe@perches.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Andy Whitcroft <apw@canonical.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 17, 2020 at 1:37 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-06-17 at 12:02 +0900, Masahiro Yamada wrote:
> > This reverts commit 84af7a6194e493fae312a2b7fa5a3b51f76d9282.
>
> Also: https://lore.kernel.org/patchwork/patch/1255848/
> ---

Yes, I removed --help-- support in 1/2.

https://patchwork.kernel.org/patch/11608927/



>  scripts/checkkconfigsymbols.py | 2 +-
>  scripts/checkpatch.pl          | 6 +-----
>  scripts/kconfig/lexer.l        | 2 +-
>  3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index 00a10a293f4f..1548f9ce4682 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -34,7 +34,7 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
>  REGEX_KCONFIG_DEF = re.compile(DEF)
>  REGEX_KCONFIG_EXPR = re.compile(EXPR)
>  REGEX_KCONFIG_STMT = re.compile(STMT)
> -REGEX_KCONFIG_HELP = re.compile(r"^\s+(help|---help---)\s*$")
> +REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
>  REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
>  REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
>  REGEX_QUOTES = re.compile("(\"(.*?)\")")
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 524df88f9364..738bb3fcf202 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3044,11 +3044,7 @@ sub process {
>
>                                 if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
>                                         $is_start = 1;
> -                               } elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
> -                                       if ($lines[$ln - 1] =~ "---help---") {
> -                                               WARN("CONFIG_DESCRIPTION",
> -                                                    "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
> -                                       }
> +                               } elsif ($lines[$ln - 1] =~ /^\+\s*help\s*$/) {
>                                         $length = -1;
>                                 }
>
> diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
> index 6354c905b006..4b7339ff4c8b 100644
> --- a/scripts/kconfig/lexer.l
> +++ b/scripts/kconfig/lexer.l
> @@ -105,7 +105,7 @@ n   [A-Za-z0-9_-]
>  "endchoice"            return T_ENDCHOICE;
>  "endif"                        return T_ENDIF;
>  "endmenu"              return T_ENDMENU;
> -"help"|"---help---"    return T_HELP;
> +"help"                 return T_HELP;
>  "hex"                  return T_HEX;
>  "if"                   return T_IF;
>  "imply"                        return T_IMPLY;
>
>


-- 
Best Regards
Masahiro Yamada
