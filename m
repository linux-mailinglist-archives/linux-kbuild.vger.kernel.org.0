Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940F540659D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Sep 2021 04:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhIJCRO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 22:17:14 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49919 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbhIJCRO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 22:17:14 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 18A2FX2P009316;
        Fri, 10 Sep 2021 11:15:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 18A2FX2P009316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631240133;
        bh=7gootp9O4wXfYwFe7ItspToaq1GC2C7fuCeIs01oPRA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kf4rXseJysJvIb7HHBGdgBJaUVb37r7dBQOumyjzrbPl0AhomEb6aSkWihANy1pk4
         CUj+dvcLmwglmP55EIHPfwbT0JCKfWxbQ0NS7mzYuIGvPpl2KSaEhCOlfdQ2ebGxod
         YXFdOXLsWW+wqjvy6lmpbcFCpCOqqgahSORrS1OENzEPiaTwiGlioHzM3OnXszZqqN
         PLoY6JHaqDVQX36Bq1CEoc+C2G01rsxR9bQPcMNWiENlYYDWgxCOI0gygqmnoLQgZm
         BlWcf0MbjmJzv/+UZef+u+8k4NX9R2LVmsfOFTu0kALHvCOWoqI8DuHnLXyUC6C8+i
         11TY5L7pWOhEA==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id n18so183174plp.7;
        Thu, 09 Sep 2021 19:15:33 -0700 (PDT)
X-Gm-Message-State: AOAM53039cS5OEgJAssi1z8Rt0dOOz441HsFshtdiJBiOEyM21Y6YWlw
        wwMHEJrKJtecMEoXpJTiFSgZ8bt7EmWbJx3AqiI=
X-Google-Smtp-Source: ABdhPJwFaASA+3q61HDfTo1a+LFxZXKVWtflYH/3nJWMG2HMfCIro78z/6ihz8sEV9Em2NUj53ZBVCazA72sf8kxIRQ=
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr5918490pju.144.1631240132781;
 Thu, 09 Sep 2021 19:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210901175326.568535-1-arielmarcovitch@gmail.com>
In-Reply-To: <20210901175326.568535-1-arielmarcovitch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 10 Sep 2021 11:14:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS2AA=0UxJudhuxmRJkWfXb2=fELc9cA6eH+cvSkOc=7Q@mail.gmail.com>
Message-ID: <CAK7LNAS2AA=0UxJudhuxmRJkWfXb2=fELc9cA6eH+cvSkOc=7Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Create links to main menu items in search
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 2, 2021 at 2:53 AM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> When one searches for a main menu item, links aren't created for it like
> with the rest of the symbols.
>
> This happens because we trace the item until we get to the rootmenu, but
> we don't include it in the path of the item. The rationale was probably
> that we don't want to show the main menu in the path of all items,
> because it is redundant.
>
> However, when an item has only the rootmenu in its path it should be
> included, because this way the user can jump to its location.
>
> In case the item is a direct child of the rootmenu, show it in the
> 'Location:' section as 'Main Menu'.
>
> This makes the 'if (i > 0)' superfluous because each item with prompt
> will have at least one menu in its path.
>
> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> ---
>  scripts/kconfig/menu.c | 40 ++++++++++++++++++++++++++--------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 606ba8a63c24..8d7e3b07bf93 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -712,6 +712,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>         int i, j;
>         struct menu *submenu[8], *menu, *location = NULL;
>         struct jump_key *jump = NULL;
> +       const char *prompt = NULL;


Can you move this to the for-loop ?

The initializer is unneeded.


>
>         str_printf(r, "  Prompt: %s\n", prop->text);
>
> @@ -735,6 +736,13 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>                 if (location == NULL && accessible)
>                         location = menu;
>         }
> +
> +       /* If we have only the root menu, show it */
> +       if (i == 0) {
> +               location = &rootmenu;
> +               submenu[i++] = location;
> +       }


Instead of handling this as a special case,
can we include the rootmenu all the time?

We can change the for-loop condition to:

        for (i = 0; menu && i < 8; menu = menu->parent) {






>         if (head && location) {
>                 jump = xmalloc(sizeof(struct jump_key));
>
> @@ -758,21 +766,25 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
>                 list_add_tail(&jump->entries, head);
>         }
>
> -       if (i > 0) {
> -               str_printf(r, "  Location:\n");
> -               for (j = 4; --i >= 0; j += 2) {
> -                       menu = submenu[i];
> -                       if (jump && menu == location)
> -                               jump->offset = strlen(r->s);
> -                       str_printf(r, "%*c-> %s", j, ' ',
> -                                  menu_get_prompt(menu));
> -                       if (menu->sym) {
> -                               str_printf(r, " (%s [=%s])", menu->sym->name ?
> -                                       menu->sym->name : "<choice>",
> -                                       sym_get_string_value(menu->sym));
> -                       }
> -                       str_append(r, "\n");
> +       str_printf(r, "  Location:\n");
> +       for (j = 4; --i >= 0; j += 2) {
> +               menu = submenu[i];
> +               if (jump && menu == location)
> +                       jump->offset = strlen(r->s);
> +
> +               /* The real rootmenu prompt is ugly */
> +               if (menu == &rootmenu)
> +                       prompt = "Main Menu";

Can you use "Main menu" for the consistency
with scripts/kconfig/parser.y line 501?


> +               else
> +                       prompt = menu_get_prompt(menu);


I think it is better to omit '->' for the rootmenu.


               if (menu == &rootmenu) {
                       prompt = "Main menu";
                       marker = "";
               } else {
                       prompt = menu_get_prompt(menu);
                       marker = "->";
               }

               str_printf(r, "%*c%s %s", j, ' ', marker, prompt);



Maybe, this will make the help look cleaner.





> +               str_printf(r, "%*c-> %s", j, ' ', prompt);
> +               if (menu->sym) {
> +                       str_printf(r, " (%s [=%s])", menu->sym->name ?
> +                               menu->sym->name : "<choice>",
> +                               sym_get_string_value(menu->sym));
>                 }
> +               str_append(r, "\n");
>         }
>  }
>
>
> base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
> --
> 2.25.1
>


--
Best Regards

Masahiro Yamada
