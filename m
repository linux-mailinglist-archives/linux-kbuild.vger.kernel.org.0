Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A9220CB4E
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2020 02:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgF2AzN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 20:55:13 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:26493 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgF2AzN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 20:55:13 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 05T0ssKN026245;
        Mon, 29 Jun 2020 09:54:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 05T0ssKN026245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593392095;
        bh=bOf/lE436n2WGriOCLlkQaKpvVlJV7vhJ1zLC9oSOss=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1t6elTSmr8Ms5RsbC+9FOv4pJ9/35fB2irSBN+9lLxbOsn/hspY7fOVuhsCQydqkS
         q03f6rmsAX/tqutswkhnEQrg/K2tfpRI0rb/WstZ/tRcKCJy4CzfEbDTlSv5AIrsSs
         EbB3vHCRF+jaU3m/5fOc/+mQHgm06WpOSzhtu11dPiw5VhDjxiNjoi8KAKBe3NMxug
         0XVU2EEK/u5zn6jeCywHa9lOx9XC87yW1YB5T5eMeiPATMSlWOn7P9ig0K7v6FYaGj
         HIrrXLGoohScZA5RitKW1K6JL5XJO2or6I4XqivTHrLIfzMJIQX+8GJNdTDKT9JsI0
         oUg2+GQmTasfA==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id 64so2096094vsl.3;
        Sun, 28 Jun 2020 17:54:55 -0700 (PDT)
X-Gm-Message-State: AOAM533VD6fvmoZqUAVJJAp5TP2Uzu3P9EQzMK77/vklu7XtcQyti6tS
        G78OhmlAlusDEpkh3N8/Tg737Ysuvpe3wgOJBs0=
X-Google-Smtp-Source: ABdhPJxdRk8WVXUHuUKRxe9/H0k8luqAoXesosui5cQT4PdvYMVfMVbCa/ZkPaCxQ9XZg6F+ZRIp5PkYRKbrw4P0Y7s=
X-Received: by 2002:a67:2e4d:: with SMTP id u74mr806278vsu.215.1593392094049;
 Sun, 28 Jun 2020 17:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200617030220.34733-1-masahiroy@kernel.org>
In-Reply-To: <20200617030220.34733-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 29 Jun 2020 09:54:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATGmbunTT2KkS6-GTuangCUXJSOOoaxm=Y4Vn=sAf1UEA@mail.gmail.com>
Message-ID: <CAK7LNATGmbunTT2KkS6-GTuangCUXJSOOoaxm=Y4Vn=sAf1UEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: remove '---help---' support
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 17, 2020 at 12:02 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The conversion is done. No more user of '---help---'.
>
> Cc: Ulf Magnusson <ulfalizer@gmail.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild.

> ---
>
>  scripts/checkkconfigsymbols.py | 2 +-
>  scripts/kconfig/lexer.l        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
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
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
