Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97664221C7
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 May 2019 08:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbfERGbP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 May 2019 02:31:15 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60034 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfERGbP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 May 2019 02:31:15 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4I6Uvd7026025;
        Sat, 18 May 2019 15:30:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4I6Uvd7026025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558161058;
        bh=ei52fYKWjTlRAbyCt0fr60Z6fZOw8HyESNllhyAewIw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zWD6szCuLtmRonWEDr/i2GNYVDvgxpAEAVRtSHIJWGTD9cRuRfRv+Vn41+aXOli7M
         WcwOquKf3EEVUm3mlfeWRdTMu28Ubl3wgY/pcYqoZ+eJ6NUDeukoATYvgXCVlZk+++
         8wNPJPlUEI6WL7nDCzYT8Uiqyfxcc4lk+aDl7PE4hpIc/lxU0ne8g8BqSSOn3hXJHl
         GoEroYnTeUH91xNuEN0nahJgHLetOeQlQvgvhY1YuTTmh9pIczJbBXNoXgeqApeHHW
         EvVnAqIx5sSPbxXNjgMxdQ9xcxAt7DiUCHr/8pn5kd1ke5hmT72umZrVczbOrtK0OR
         y92HvrN0jR6FA==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id z11so6009755vsq.9;
        Fri, 17 May 2019 23:30:58 -0700 (PDT)
X-Gm-Message-State: APjAAAVXsSCvuV4xz2GE0rGMxYSSktsqRHx12t94QSjYjKcQf7uGCK0i
        DvhfgpILedSBTtxnJ2tOQ7aIKm2xMQSB3TEvBCY=
X-Google-Smtp-Source: APXvYqxBf/S37pkQ7h/wex9e82yqGOLnYPs4oB2EJ2zQAxn2I4s1kGKz2afDBehbr71vK7LhcvuTdI01SAAfXYUMr3Y=
X-Received: by 2002:a67:fc4:: with SMTP id 187mr8390761vsp.215.1558161056885;
 Fri, 17 May 2019 23:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <1558122142-10683-1-git-send-email-alex.popov@linux.com>
In-Reply-To: <1558122142-10683-1-git-send-email-alex.popov@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 18 May 2019 15:30:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNASGD3F-MOpQdwfoC3zqJowgdEP9bpABbg2g+a+d7jJPDg@mail.gmail.com>
Message-ID: <CAK7LNASGD3F-MOpQdwfoC3zqJowgdEP9bpABbg2g+a+d7jJPDg@mail.gmail.com>
Subject: Re: [v3 1/1] kconfig: Terminate menu blocks with a comment in the
 generated config
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 18, 2019 at 4:42 AM Alexander Popov <alex.popov@linux.com> wrote:
>
> Currently menu blocks start with a pretty header but end with nothing in
> the generated config. So next config options stick together with the
> options from the menu block.
>
> Let's terminate menu blocks in the generated config with a comment and
> a newline if needed. Example:
>
> ...
> CONFIG_BPF_STREAM_PARSER=y
> CONFIG_NET_FLOW_LIMIT=y
>
> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=y
> CONFIG_NET_DROP_MONITOR=y
> # end of Network testing
> # end of Networking options
>
> CONFIG_HAMRADIO=y
> ...
>
> Signed-off-by: Alexander Popov <alex.popov@linux.com>


Applied to linux-kbuild. Thanks.



> ---
>
> v3 changes:
>  - rebase onto the recent rc;
>  - don't print the end comment for the rootmenu to avoid breaking
>    'make testconfig' (thanks to Masahiro Yamada).
>
> ---
>  scripts/kconfig/confdata.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 492ac34..6006154 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -867,6 +867,7 @@ int conf_write(const char *name)
>         const char *str;
>         char tmpname[PATH_MAX + 1], oldname[PATH_MAX + 1];
>         char *env;
> +       bool need_newline = false;
>
>         if (!name)
>                 name = conf_get_configname();
> @@ -912,12 +913,16 @@ int conf_write(const char *name)
>                                      "#\n"
>                                      "# %s\n"
>                                      "#\n", str);
> +                       need_newline = false;
>                 } else if (!(sym->flags & SYMBOL_CHOICE)) {
>                         sym_calc_value(sym);
>                         if (!(sym->flags & SYMBOL_WRITE))
>                                 goto next;
> +                       if (need_newline) {
> +                               fprintf(out, "\n");
> +                               need_newline = false;
> +                       }
>                         sym->flags &= ~SYMBOL_WRITE;
> -
>                         conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
>                 }
>
> @@ -929,6 +934,12 @@ int conf_write(const char *name)
>                 if (menu->next)
>                         menu = menu->next;
>                 else while ((menu = menu->parent)) {
> +                       if (!menu->sym && menu_is_visible(menu) &&
> +                           menu != &rootmenu) {
> +                               str = menu_get_prompt(menu);
> +                               fprintf(out, "# end of %s\n", str);
> +                               need_newline = true;
> +                       }
>                         if (menu->next) {
>                                 menu = menu->next;
>                                 break;
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
