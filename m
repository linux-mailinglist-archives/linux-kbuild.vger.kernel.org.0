Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DB441802F
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Sep 2021 09:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhIYHai (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Sep 2021 03:30:38 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36603 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230029AbhIYHah (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Sep 2021 03:30:37 -0400
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 18P7Sp0O003510;
        Sat, 25 Sep 2021 16:28:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 18P7Sp0O003510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632554931;
        bh=QizMDLoweQqG/MXgzlf4Mhojf4ocNeNgXCew0MMpp78=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K7ElZxtEbuBB6IsxDPsiaBC5JCW2HJ4p+EIgFCsupAUuOhmcI0SHtxh7xhy/aD+87
         g4EoMQdqC3OlkywYokI/vbGdu0z2z5hx2Si7gK5tS8m7QJjMBBZfNsOF8Dwvhu3tWt
         6vHAxZdcrQHF9vg5ZlY86GbB8w8YdwGo5uUaQvQz4c952X6xwY4So4lTIkPWg9simE
         EP/nHV3qI3QHH/7ztV/XvmFpiitGERSmFng96bDZ7HpDCWj5DFLdVVFTmiK0qDXyVY
         Ysi89g1SqgEiUkapyHjFQTkXFdzEbVSBMlKHMtJSq/BrbZdJtuJTcMa+57luLtIrtN
         yB2oVE9wfFRew==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id mv7-20020a17090b198700b0019c843e7233so9255675pjb.4;
        Sat, 25 Sep 2021 00:28:51 -0700 (PDT)
X-Gm-Message-State: AOAM530voZNBt76DiHVL+pYOTpkrA/w1PADZ0+cVMx8liPSC/8C/MFc+
        d8ONiHydTBkQ9bJSJdnMkv74WjG09B08+vaNZIM=
X-Google-Smtp-Source: ABdhPJzlBSK2PJQNVujmzqxa5ODztHbWPefbqvfDEBHV27ueF2HjtiIJtUm2UWSZhgGpkmSJ48oML5isOpAQDqsflZs=
X-Received: by 2002:a17:90a:55c8:: with SMTP id o8mr411334pjm.144.1632554930461;
 Sat, 25 Sep 2021 00:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210913164514.437972-1-arielmarcovitch@gmail.com> <be481cb5-cfe0-6e23-2c27-c2e0aed69c6c@gmail.com>
In-Reply-To: <be481cb5-cfe0-6e23-2c27-c2e0aed69c6c@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Sep 2021 16:28:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQy-Mm75FrxxCuTibBKVUBB3is26ZpP6KQ1BNHSLstbhw@mail.gmail.com>
Message-ID: <CAK7LNAQy-Mm75FrxxCuTibBKVUBB3is26ZpP6KQ1BNHSLstbhw@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: Create links to main menu items in search
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 25, 2021 at 3:00 AM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> On 13/09/2021 19:45, Ariel Marcovitch wrote:
> > When one searches for a main menu item, links aren't created for it like
> > with the rest of the symbols.
> >
> > This happens because we trace the item until we get to the rootmenu, but
> > we don't include it in the path of the item. The rationale was probably
> > that we don't want to show the main menu in the path of all items,
> > because it is redundant.
> >
> > However, when an item has only the rootmenu in its path it should be
> > included, because this way the user can jump to its location.
> >
> > Add a 'Main menu' entry in the 'Location:' section for the kconfig
> > items.
> >
> > This makes the 'if (i > 0)' superfluous because each item with prompt
> > will have at least one menu in its path.
> >
> > Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> > ---
> >   scripts/kconfig/menu.c | 33 ++++++++++++++++++---------------
> >   1 file changed, 18 insertions(+), 15 deletions(-)
> >
> > diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> > index 606ba8a63c24..3d6f7cba8846 100644
> > --- a/scripts/kconfig/menu.c
> > +++ b/scripts/kconfig/menu.c
> > @@ -728,7 +728,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
> >               get_dep_str(r, prop->visible.expr, "  Visible if: ");
> >
> >       menu = prop->menu->parent;
> > -     for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
> > +     for (i = 0; menu && i < 8; menu = menu->parent) {
> >               bool accessible = menu_is_visible(menu);
> >
> >               submenu[i++] = menu;
> > @@ -758,21 +758,24 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
> >               list_add_tail(&jump->entries, head);
> >       }
> >
> > -     if (i > 0) {
> > -             str_printf(r, "  Location:\n");
> > -             for (j = 4; --i >= 0; j += 2) {
> > -                     menu = submenu[i];
> > -                     if (jump && menu == location)
> > -                             jump->offset = strlen(r->s);
> > -                     str_printf(r, "%*c-> %s", j, ' ',
> > -                                menu_get_prompt(menu));
> > -                     if (menu->sym) {
> > -                             str_printf(r, " (%s [=%s])", menu->sym->name ?
> > -                                     menu->sym->name : "<choice>",
> > -                                     sym_get_string_value(menu->sym));
> > -                     }
> > -                     str_append(r, "\n");
> > +     str_printf(r, "  Location:\n");
> > +     for (j = 4; --i >= 0; j += 2) {
> > +             menu = submenu[i];
> > +             if (jump && menu == location)
> > +                     jump->offset = strlen(r->s);
> > +
> > +             if (menu == &rootmenu)
> > +                     /* The real rootmenu prompt is ugly */
> > +                     str_printf(r, "%*cMain menu", j, ' ');
> > +             else
> > +                     str_printf(r, "%*c-> %s", j, ' ', menu_get_prompt(menu));
> > +
> > +             if (menu->sym) {
> > +                     str_printf(r, " (%s [=%s])", menu->sym->name ?
> > +                             menu->sym->name : "<choice>",
> > +                             sym_get_string_value(menu->sym));
> >               }
> > +             str_append(r, "\n");
> >       }
> >   }
> >
> >
> > base-commit: a9086b878b7fd65894eb8cb1fa395dd469970566
> A friendly ping :)


Applied to linux-kbuild. Thanks.

-- 
Best Regards
Masahiro Yamada
