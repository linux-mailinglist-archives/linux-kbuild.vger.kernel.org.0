Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA343F5F2E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 15:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhHXNcK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Aug 2021 09:32:10 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25170 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhHXNcK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Aug 2021 09:32:10 -0400
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 17ODVEd4027345;
        Tue, 24 Aug 2021 22:31:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17ODVEd4027345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629811874;
        bh=wPlhHbL8rDPtZtoXfWX35PK2EbQni3fLQ5sq3cBwXOQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QYMWqZz9nklFHvxzQcz9Gv/9LpExcJtQ/c+d7MH84v7H1Lw7v6qgEt7IqMg7OPjZs
         78Zmp/ebpzawrpIB4oDmlGFifch5tiV+eIrWFYrPTx8CrlmkLr+BtW13HQrUtKmX7W
         S5iHQ7F0T3Egl4LI+M0uXZgXPXpgtFZ9edN12FdISg5+Bl7vwHczFK+hNUL/n1zVy3
         8FKKUbLSPgJfjjM+BG4/fwP6a+Beu/2cUffCpGUOFgLdunzE9X2MJjHw2XXJ5OSkPO
         vTR2WdTfoRwwdLM5kd4/xRe0Yl1LLR8A0JyYeAjqi+Pm+s0kJRO+LiXoulm2o33znB
         W+k09Oo308kcw==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id 2so4324654pfo.8;
        Tue, 24 Aug 2021 06:31:14 -0700 (PDT)
X-Gm-Message-State: AOAM530tByD+rmc0q87/qeSN3No25smbho+5YVd4R9ezM/zit8D0taRj
        +OWC/VJPCzwTlGrfGF0vB/4OfqCsN5JgLiUabx0=
X-Google-Smtp-Source: ABdhPJwoRVBhfNZ239uyJqO9q/BWIjMjNpQfNSWE8F4RAloZNtZOzOI7cj3RFIidH2I8orM2A4tQBpfFfUkRFBuIg+A=
X-Received: by 2002:aa7:94ac:0:b0:3e0:f21a:e6ff with SMTP id
 a12-20020aa794ac000000b003e0f21ae6ffmr38094358pfl.76.1629811873673; Tue, 24
 Aug 2021 06:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210822192205.43210-1-arielmarcovitch@gmail.com> <20210822192205.43210-3-arielmarcovitch@gmail.com>
In-Reply-To: <20210822192205.43210-3-arielmarcovitch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 24 Aug 2021 22:30:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNATy17OQ900ThKJwHRy35+4Yg=9CRNg9Zp0tZ_O=uQ+kaw@mail.gmail.com>
Message-ID: <CAK7LNATy17OQ900ThKJwHRy35+4Yg=9CRNg9Zp0tZ_O=uQ+kaw@mail.gmail.com>
Subject: Re: [PATCH 2/3] checkkconfigsymbols.py: Fix Kconfig parsing to find
 'if' lines
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 4:22 AM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> When parsing Kconfig files to find symbol definitions and references,
> lines after a 'help' line are skipped until a new config definition
> starts.
>
> However, it is quite common to define a config and then make some other
> configs depend on it by adding an 'if' line. This kind of kconfig
> statement usually appears after a config definition which might contain
> a 'help' section. The 'if' line is skipped in parse_kconfig_file()
> because it is not a config definition.
>
> This means that symbols referenced in this kind of statements are
> ignored by this function and thus are not considered undefined
> references in case the symbol is not defined.
>
> The REGEX_KCONFIG_STMT regex can't be used because the other types of
> statements can't break help lines.
>
> Define a new regex for matching 'if' statements and stop the 'help'
> skipping in case it is encountered.
>
> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> ---
>  scripts/checkkconfigsymbols.py | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index b9b0f15e5880..875e9a2c14b2 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -26,6 +26,7 @@ EXPR = r"(?:" + OPERATORS + r"|\s|" + SYMBOL + r")+"
>  DEFAULT = r"default\s+.*?(?:if\s.+){,1}"
>  STMT = r"^\s*(?:if|select|imply|depends\s+on|(?:" + DEFAULT + r"))\s+" + EXPR
>  SOURCE_SYMBOL = r"(?:\W|\b)+[D]{,1}CONFIG_(" + SYMBOL + r")"
> +IF_LINE = r"^\s*(?:if)\s+" + EXPR


Why is it enclosed by "(?: )"   ?

"(?:if)"  seems to the same as "if"






>
>  # regex objects
>  REGEX_FILE_KCONFIG = re.compile(r".*Kconfig[\.\w+\-]*$")
> @@ -35,11 +36,11 @@ REGEX_KCONFIG_DEF = re.compile(DEF)
>  REGEX_KCONFIG_EXPR = re.compile(EXPR)
>  REGEX_KCONFIG_STMT = re.compile(STMT)
>  REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
> +REGEX_KCONFIG_IF_LINE = re.compile(IF_LINE)
>  REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
>  REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
>  REGEX_QUOTES = re.compile("(\"(.*?)\")")
>
> -
>  def parse_options():
>      """The user interface of this module."""
>      usage = "Run this tool to detect Kconfig symbols that are referenced but " \
> @@ -445,6 +446,11 @@ def parse_kconfig_file(kfile):
>          line = line.strip('\n')
>          line = line.split("#")[0]  # ignore comments
>
> +        # 'if EXPR' lines can be after help lines
> +        # The if line itself is handled later
> +        if REGEX_KCONFIG_IF_LINE.match(line):
> +            skip = False
> +


I do not think this is the right fix.
There are similar patterns where
config references are ignored.

For example, FOO and BAR are ignored
in the following cases.

ex1)

choice
          prompt "foo"
          default FOO



ex2)

menu "bar"
           depends on BAR




The help block ends with shallower indentation.




>          if REGEX_KCONFIG_DEF.match(line):
>              symbol_def = REGEX_KCONFIG_DEF.findall(line)
>              defined.append(symbol_def[0])
> --
> 2.25.1
>


--
Best Regards
Masahiro Yamada
