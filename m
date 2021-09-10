Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12FF406590
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Sep 2021 04:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhIJCOj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 22:14:39 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:31865 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhIJCOj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 22:14:39 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 18A2D44M010730;
        Fri, 10 Sep 2021 11:13:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 18A2D44M010730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631239985;
        bh=sgPJXoTajAmVGHS5iIFMa+U79emXCk2kogyKNFILe4A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1ywusa9vWY7DJjllu1FN3w6cvqRlUJdVlEAiGAi2VLv4JQqaJlCNpU/+I2n1tciJR
         lFOUGX/uZ4PJ4Rr9onJhRLKGL7NG/ngbnxeVaeqnp7vCQ/FH4AD5iLIUjkIulQ85o1
         SpktyzVJpXnzjQ3vGShHaOrDxtWQtyM5lIUHlK7bkCNr33oVHWl/C9aclDzJesRoc3
         XGn6nThedCcLR27d0gv0hNHdtTbJ3veu/pgUF+k1Xl/fOr0CmCeo1iwlxqe5cD68uA
         pSiNRDHc7wKSQP0gzY7npX8NCAtUmDOvJ1KrOB+4kwT1LMhD3mLqH1pe3/vy22LmSg
         OYqtS2xSQ7VCA==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so427167pjr.1;
        Thu, 09 Sep 2021 19:13:05 -0700 (PDT)
X-Gm-Message-State: AOAM531dUOHt/KWzu0vJ8oILvHD6fRpko6fuHUB702ObDb4AS2us5qL4
        0S/7F/ii3jHofJH3N/PXOgiY64F2xYKe2QJ4wHI=
X-Google-Smtp-Source: ABdhPJxuux86ydKbSgkuefvanEMhYmIWHEo9acCeEgvLIlswP7SMLWwOgLSO2fRtFlj0fYLR3L/yPoskO/9htP1Y8uo=
X-Received: by 2002:a17:902:6b42:b0:13a:54d0:39c4 with SMTP id
 g2-20020a1709026b4200b0013a54d039c4mr5506437plt.42.1631239984466; Thu, 09 Sep
 2021 19:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210901164952.538834-1-arielmarcovitch@gmail.com>
In-Reply-To: <20210901164952.538834-1-arielmarcovitch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 10 Sep 2021 11:12:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFq0CwzVmsGon6rXuNV2eaEYLyNPexkncK4ssO1N35tQ@mail.gmail.com>
Message-ID: <CAK7LNATFq0CwzVmsGon6rXuNV2eaEYLyNPexkncK4ssO1N35tQ@mail.gmail.com>
Subject: Re: [PATCH v2] checkkconfigsymbols.py: Remove skipping of help lines
 in parse_kconfig_file
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Valentin Rothberg <valentinrothberg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 2, 2021 at 1:50 AM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> When parsing Kconfig files to find symbol definitions and references,
> lines after a 'help' line are skipped until a new config definition
> starts.
>
> However, Kconfig statements can actually be after a help section, as
> long as these have shallower indentation. These are skipped by the
> parser.
>
> This means that symbols referenced in this kind of statements are
> ignored by this function and thus are not considered undefined
> references in case the symbol is not defined.
>
> Remove the 'skip' logic entirely, as it is not needed if we just use the
> STMT regex to find the end of help lines.
>
> However, this means that keywords that appear as part of the help
> message (i.e. with the same indentation as the help lines) it will be
> considered as a reference/definition. This can happen now as well, but
> only with REGEX_KCONFIG_DEF lines. Also, the keyword must have a SYMBOL
> after it, which probably means that someone referenced a config in the
> help so it seems like a bonus :)
>
> The real solution is to keep track of the indentation when a the first
> help line in encountered and then handle DEF and STMT lines only if the
> indentation is shallower.
>
> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/checkkconfigsymbols.py | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index b9b0f15e5880..4f9dc98f3f60 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -34,7 +34,6 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
>  REGEX_KCONFIG_DEF = re.compile(DEF)
>  REGEX_KCONFIG_EXPR = re.compile(EXPR)
>  REGEX_KCONFIG_STMT = re.compile(STMT)
> -REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
>  REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
>  REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
>  REGEX_QUOTES = re.compile("(\"(.*?)\")")
> @@ -432,7 +431,6 @@ def parse_kconfig_file(kfile):
>      lines = []
>      defined = []
>      references = []
> -    skip = False
>
>      if not os.path.exists(kfile):
>          return defined, references
> @@ -448,12 +446,6 @@ def parse_kconfig_file(kfile):
>          if REGEX_KCONFIG_DEF.match(line):
>              symbol_def = REGEX_KCONFIG_DEF.findall(line)
>              defined.append(symbol_def[0])
> -            skip = False
> -        elif REGEX_KCONFIG_HELP.match(line):
> -            skip = True
> -        elif skip:
> -            # ignore content of help messages
> -            pass
>          elif REGEX_KCONFIG_STMT.match(line):
>              line = REGEX_QUOTES.sub("", line)
>              symbols = get_symbols_in_line(line)
>
> base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
