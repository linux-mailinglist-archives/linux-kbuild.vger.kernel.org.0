Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346F4610BB
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 15:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfGFNB4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jul 2019 09:01:56 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59058 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfGFNB4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 09:01:56 -0400
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x66D1fT3024751
        for <linux-kbuild@vger.kernel.org>; Sat, 6 Jul 2019 22:01:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x66D1fT3024751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562418103;
        bh=QWNNLy97qZ68mnDLhqJ4XeZMdgUCy8iAVUCxpvNyiYU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K8PgKlEHw2ohTwS0h5cgAicK+zBbrBNZTuDdXWK/Tmkp1d5YsdE1AzMlaFWqlhma9
         bn1Glo6ddoZiUvqsIWkwywGuketphPj/zhYxlBLnCCxDC/G4VZKfNdS4CP3R3mdQY3
         zVomw5S6OOHAWnWfEx4A39rHDz/+c8NJ9P+H6i1mnA8p34iKrQFSgko7/s7i0crDlr
         D3L5F853XjBWDrF8z8LKISsjFmPEWqy2z+wXpr8J09yADutmf5pRcdT+BdH8wzTIKm
         h52vHSekORvYUYau8ARoMfNKoc8BguGdK1SWT8mRSyjZvHvf1T0GzGl5hOZNSGlehs
         3TR/SQy7D+wLQ==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id 130so1674813vkn.9
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Jul 2019 06:01:42 -0700 (PDT)
X-Gm-Message-State: APjAAAWNxKUVjF68Lq6s8rtAXDsA+TrsFgwfGwCMSbSf2XAUAiI46Cx/
        8o6IvGROKy3Eh7+KdDgHzvb1BC/VaJBhNfxBqGY=
X-Google-Smtp-Source: APXvYqwMndsxJyZqVRn2t52ppAasVBkx8h52GGig/AqOCBiMPKSoKWbUSBYLrPt/G+3cjqLRP0HMUalYYmH9ZGlEyM8=
X-Received: by 2002:a1f:728b:: with SMTP id n133mr2674562vkc.84.1562418101102;
 Sat, 06 Jul 2019 06:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190704105041.7646-1-marco.ammon@fau.de>
In-Reply-To: <20190704105041.7646-1-marco.ammon@fau.de>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 6 Jul 2019 22:01:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQE+x=_ny-TrJZggqqQZSE0HbRZH1reY17NtF_+YNO_qg@mail.gmail.com>
Message-ID: <CAK7LNAQE+x=_ny-TrJZggqqQZSE0HbRZH1reY17NtF_+YNO_qg@mail.gmail.com>
Subject: Re: [PATCH] lkc_proto.h: Fix spelling of sym_is_changable
To:     Marco Ammon <marco.ammon@fau.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 4, 2019 at 7:58 PM Marco Ammon <marco.ammon@fau.de> wrote:
>
> There is a spelling mistake in "changable", it is corrected to
> "changeable" and all call sites are updated accordingly.
>
> Signed-off-by: Marco Ammon <marco.ammon@fau.de>

Applied to linux-kbuild/kconfig.
Thanks.


> ---
>  scripts/kconfig/conf.c      |  6 +++---
>  scripts/kconfig/confdata.c  |  2 +-
>  scripts/kconfig/lkc_proto.h |  2 +-
>  scripts/kconfig/mconf.c     | 10 +++++-----
>  scripts/kconfig/nconf.c     | 10 +++++-----
>  scripts/kconfig/qconf.cc    |  2 +-
>  scripts/kconfig/symbol.c    |  2 +-
>  7 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 0d4c4f3a8f29..40e16e871ae2 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -90,7 +90,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>         line[0] = '\n';
>         line[1] = 0;
>
> -       if (!sym_is_changable(sym)) {
> +       if (!sym_is_changeable(sym)) {
>                 printf("%s\n", def);
>                 line[0] = '\n';
>                 line[1] = 0;
> @@ -234,7 +234,7 @@ static int conf_choice(struct menu *menu)
>
>         sym = menu->sym;
>         is_new = !sym_has_value(sym);
> -       if (sym_is_changable(sym)) {
> +       if (sym_is_changeable(sym)) {
>                 conf_sym(menu);
>                 sym_calc_value(sym);
>                 switch (sym_get_tristate_value(sym)) {
> @@ -418,7 +418,7 @@ static void check_conf(struct menu *menu)
>
>         sym = menu->sym;
>         if (sym && !sym_has_value(sym)) {
> -               if (sym_is_changable(sym) ||
> +               if (sym_is_changeable(sym) ||
>                     (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
>                         if (input_mode == listnewconfig) {
>                                 if (sym->name) {
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 18e8051d89d7..caab7336abc1 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -796,7 +796,7 @@ int conf_write_defconfig(const char *filename)
>                                 goto next_menu;
>                         sym->flags &= ~SYMBOL_WRITE;
>                         /* If we cannot change the symbol - skip */
> -                       if (!sym_is_changable(sym))
> +                       if (!sym_is_changeable(sym))
>                                 goto next_menu;
>                         /* If symbol equals to default value - skip */
>                         if (strcmp(sym_get_string_value(sym), sym_get_string_default(sym)) == 0)
> diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
> index 38a32b1c1a28..f9ab98238aef 100644
> --- a/scripts/kconfig/lkc_proto.h
> +++ b/scripts/kconfig/lkc_proto.h
> @@ -42,7 +42,7 @@ tristate sym_toggle_tristate_value(struct symbol *sym);
>  bool sym_string_valid(struct symbol *sym, const char *newval);
>  bool sym_string_within_range(struct symbol *sym, const char *str);
>  bool sym_set_string_value(struct symbol *sym, const char *newval);
> -bool sym_is_changable(struct symbol *sym);
> +bool sym_is_changeable(struct symbol *sym);
>  struct property * sym_get_choice_prop(struct symbol *sym);
>  const char * sym_get_string_value(struct symbol *sym);
>
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 694091f3ef9d..49c26ea9dd98 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -536,7 +536,7 @@ static void build_conf(struct menu *menu)
>                 }
>
>                 val = sym_get_tristate_value(sym);
> -               if (sym_is_changable(sym)) {
> +               if (sym_is_changeable(sym)) {
>                         switch (type) {
>                         case S_BOOLEAN:
>                                 item_make("[%c]", val == no ? ' ' : '*');
> @@ -587,7 +587,7 @@ static void build_conf(struct menu *menu)
>                 } else {
>                         switch (type) {
>                         case S_BOOLEAN:
> -                               if (sym_is_changable(sym))
> +                               if (sym_is_changeable(sym))
>                                         item_make("[%c]", val == no ? ' ' : '*');
>                                 else
>                                         item_make("-%c-", val == no ? ' ' : '*');
> @@ -600,7 +600,7 @@ static void build_conf(struct menu *menu)
>                                 case mod: ch = 'M'; break;
>                                 default:  ch = ' '; break;
>                                 }
> -                               if (sym_is_changable(sym)) {
> +                               if (sym_is_changeable(sym)) {
>                                         if (sym->rev_dep.tri == mod)
>                                                 item_make("{%c}", ch);
>                                         else
> @@ -617,7 +617,7 @@ static void build_conf(struct menu *menu)
>                                 if (tmp < 0)
>                                         tmp = 0;
>                                 item_add_str("%*c%s%s", tmp, ' ', menu_get_prompt(menu),
> -                                            (sym_has_value(sym) || !sym_is_changable(sym)) ?
> +                                            (sym_has_value(sym) || !sym_is_changeable(sym)) ?
>                                              "" : " (NEW)");
>                                 item_set_tag('s');
>                                 item_set_data(menu);
> @@ -625,7 +625,7 @@ static void build_conf(struct menu *menu)
>                         }
>                 }
>                 item_add_str("%*c%s%s", indent + 1, ' ', menu_get_prompt(menu),
> -                         (sym_has_value(sym) || !sym_is_changable(sym)) ?
> +                         (sym_has_value(sym) || !sym_is_changeable(sym)) ?
>                           "" : " (NEW)");
>                 if (menu->prompt->type == P_MENU) {
>                         item_add_str("  %s", menu_is_empty(menu) ? "----" : "--->");
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index cbafe3bf082e..b7c1ef757178 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -803,7 +803,7 @@ static void build_conf(struct menu *menu)
>                 }
>
>                 val = sym_get_tristate_value(sym);
> -               if (sym_is_changable(sym)) {
> +               if (sym_is_changeable(sym)) {
>                         switch (type) {
>                         case S_BOOLEAN:
>                                 item_make(menu, 't', "[%c]",
> @@ -857,7 +857,7 @@ static void build_conf(struct menu *menu)
>                 } else {
>                         switch (type) {
>                         case S_BOOLEAN:
> -                               if (sym_is_changable(sym))
> +                               if (sym_is_changeable(sym))
>                                         item_make(menu, 't', "[%c]",
>                                                 val == no ? ' ' : '*');
>                                 else
> @@ -876,7 +876,7 @@ static void build_conf(struct menu *menu)
>                                         ch = ' ';
>                                         break;
>                                 }
> -                               if (sym_is_changable(sym)) {
> +                               if (sym_is_changeable(sym)) {
>                                         if (sym->rev_dep.tri == mod)
>                                                 item_make(menu,
>                                                         't', "{%c}", ch);
> @@ -896,14 +896,14 @@ static void build_conf(struct menu *menu)
>                                 item_add_str("%*c%s%s", tmp, ' ',
>                                                 menu_get_prompt(menu),
>                                                 (sym_has_value(sym) ||
> -                                                !sym_is_changable(sym)) ? "" :
> +                                                !sym_is_changeable(sym)) ? "" :
>                                                 " (NEW)");
>                                 goto conf_childs;
>                         }
>                 }
>                 item_add_str("%*c%s%s", indent + 1, ' ',
>                                 menu_get_prompt(menu),
> -                               (sym_has_value(sym) || !sym_is_changable(sym)) ?
> +                               (sym_has_value(sym) || !sym_is_changeable(sym)) ?
>                                 "" : " (NEW)");
>                 if (menu->prompt && menu->prompt->type == P_MENU) {
>                         item_add_str("  %s", menu_is_empty(menu) ? "----" : "--->");
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index ce7fc87a49a7..82773cc35d35 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -152,7 +152,7 @@ void ConfigItem::updateMenu(void)
>         case S_TRISTATE:
>                 char ch;
>
> -               if (!sym_is_changable(sym) && list->optMode == normalOpt) {
> +               if (!sym_is_changeable(sym) && list->optMode == normalOpt) {
>                         setPixmap(promptColIdx, QIcon());
>                         setText(noColIdx, QString::null);
>                         setText(modColIdx, QString::null);
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 1f9266dadedf..b78650cf2dbe 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -785,7 +785,7 @@ const char *sym_get_string_value(struct symbol *sym)
>         return (const char *)sym->curr.val;
>  }
>
> -bool sym_is_changable(struct symbol *sym)
> +bool sym_is_changeable(struct symbol *sym)
>  {
>         return sym->visible > sym->rev_dep.tri;
>  }
> --
> 2.22.0
>


-- 
Best Regards
Masahiro Yamada
