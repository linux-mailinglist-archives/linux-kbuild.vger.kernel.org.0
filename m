Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AAF7407D07
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Sep 2021 13:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhILLjY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 Sep 2021 07:39:24 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35851 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhILLjX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Sep 2021 07:39:23 -0400
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 18CBbsRb027075;
        Sun, 12 Sep 2021 20:37:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 18CBbsRb027075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631446674;
        bh=ly5ftrKcwPbL9gQv/TIb6sLo/0/Qxq4PSRjVpwiujBc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CCvVoM46bCnr2OfgFCYM4lotVckMydg3//aQO7NWC0e8W8gcr/k/kYYvtcLo3W8z4
         cEn6hk5eneK0G/o3PDt9MdPttteIR4ZOyuDUgk9Q6tXSpFXGvIQaYW2Kfk3BgG6o+K
         UQY24XvLBJfY3OHAu54Kshmm41lzRk1HrEjszNe33jSM4um90xFTpicCFHG4m0s8OJ
         U/HM9qmE+itkfbocSmHHcNlXWIAb5ufT0g2v/ee0n8W/7t3ZlZyl7QT1j2rRoGzKwW
         /dFBb+tGY9P/qiskHxS+X7/kmMrr1C7JYjXWl5HNNn1LUi9jEpdAWs7Fi/LxX7lUXi
         xg2sUPdbjrxpQ==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id dw14so3441197pjb.1;
        Sun, 12 Sep 2021 04:37:54 -0700 (PDT)
X-Gm-Message-State: AOAM531hf9qvkfqfIQMw6Q4SJ0FkqVyIMsXwxFRnW3rZvERp0F4svfxF
        k2CWlLg1ZbDIB7GcS4vS0saQ9PT1Hd5hN1a7XNE=
X-Google-Smtp-Source: ABdhPJz92Xn2uVWqffIfnHnPr0bCRgZxHTz8PuzFvkLhVmspf2EoBXMPBrb0z57yTZMCHTc0wjR23kCxmuNCxCOTOC0=
X-Received: by 2002:a17:90a:192:: with SMTP id 18mr7285146pjc.119.1631446673554;
 Sun, 12 Sep 2021 04:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210901175326.568535-1-arielmarcovitch@gmail.com>
 <CAK7LNAS2AA=0UxJudhuxmRJkWfXb2=fELc9cA6eH+cvSkOc=7Q@mail.gmail.com> <e4c0d198-0ae6-e415-51b5-0a33ff4fb82e@gmail.com>
In-Reply-To: <e4c0d198-0ae6-e415-51b5-0a33ff4fb82e@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 12 Sep 2021 20:37:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBzA96PneYHbdAZu8sbCvUGnbdS8ZxG_gq_t--D2oiSg@mail.gmail.com>
Message-ID: <CAK7LNATBzA96PneYHbdAZu8sbCvUGnbdS8ZxG_gq_t--D2oiSg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Create links to main menu items in search
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Sep 12, 2021 at 3:18 AM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> On 10/09/2021 5:14, Masahiro Yamada wrote:
> >On Thu, Sep 2, 2021 at 2:53 AM Ariel Marcovitch
> ><arielmarcovitch@gmail.com> wrote:
> >>
> >>When one searches for a main menu item, links aren't created for it like
> >>with the rest of the symbols.
> >>
> >>This happens because we trace the item until we get to the rootmenu, but
> >>we don't include it in the path of the item. The rationale was probably
> >>that we don't want to show the main menu in the path of all items,
> >>because it is redundant.
> >>
> >>However, when an item has only the rootmenu in its path it should be
> >>included, because this way the user can jump to its location.
> >>
> >>In case the item is a direct child of the rootmenu, show it in the
> >>'Location:' section as 'Main Menu'.
> >>
> >>This makes the 'if (i > 0)' superfluous because each item with prompt
> >>will have at least one menu in its path.
> >>
> >>Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> >>---
> >>scripts/kconfig/menu.c | 40 ++++++++++++++++++++++++++--------------
> >>1 file changed, 26 insertions(+), 14 deletions(-)
> >>
> >>diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> >>index 606ba8a63c24..8d7e3b07bf93 100644
> >>--- a/scripts/kconfig/menu.c
> >>+++ b/scripts/kconfig/menu.c
> >>@@ -712,6 +712,7 @@ static void get_prompt_str(struct gstr *r, struct
> property *prop,
> >>int i, j;
> >>struct menu *submenu[8], *menu, *location = NULL;
> >>struct jump_key *jump = NULL;
> >>+const char *prompt = NULL;
> >
> >
> >Can you move this to the for-loop ?
> >
> >The initializer is unneeded.
> >
> >
> >>
> >>str_printf(r, " Prompt: %s\n", prop->text);
> >>
> >>@@ -735,6 +736,13 @@ static void get_prompt_str(struct gstr *r, struct
> property *prop,
> >>if (location == NULL && accessible)
> >>location = menu;
> >>}
> >>+
> >>+/* If we have only the root menu, show it */
> >>+if (i == 0) {
> >>+location = &rootmenu;
> >>+submenu[i++] = location;
> >>+}
> >
> >
> >Instead of handling this as a special case,
> >can we include the rootmenu all the time?
> >
> >We can change the for-loop condition to:
> >
> >for (i = 0; menu && i < 8; menu = menu->parent) {
> Of course.
> However, it means search entries will get a bit larger. I guess it is
> worth it?

I think so.
The result is more consistent.




> >
> >
> >
> >
> >
> >
> >
> >>if (head && location) {
> >>jump = xmalloc(sizeof(struct jump_key));
> >>
> >>@@ -758,21 +766,25 @@ static void get_prompt_str(struct gstr *r, struct
> property *prop,
> >>list_add_tail(&jump->entries, head);
> >>}
> >>
> >>-if (i > 0) {
> >>-str_printf(r, " Location:\n");
> >>-for (j = 4; --i >= 0; j += 2) {
> >>-menu = submenu[i];
> >>-if (jump && menu == location)
> >>-jump->offset = strlen(r->s);
> >>-str_printf(r, "%*c-> %s", j, ' ',
> >>-menu_get_prompt(menu));
> >>-if (menu->sym) {
> >>-str_printf(r, " (%s [=%s])", menu->sym->name ?
> >>-menu->sym->name : "<choice>",
> >>-sym_get_string_value(menu->sym));
> >>-}
> >>-str_append(r, "\n");
> >>+str_printf(r, " Location:\n");
> >>+for (j = 4; --i >= 0; j += 2) {
> >>+menu = submenu[i];
> >>+if (jump && menu == location)
> >>+jump->offset = strlen(r->s);
> >>+
> >>+/* The real rootmenu prompt is ugly */
> >>+if (menu == &rootmenu)
> >>+prompt = "Main Menu";
> >
> >Can you use "Main menu" for the consistency
> >with scripts/kconfig/parser.y line 501?
> >
> Seems reasonable. Just to clarify, the prompt there is not relevant
> for linux's Kconfig right?
> >
> >>+else
> >>+prompt = menu_get_prompt(menu);
> >
> >
> >I think it is better to omit '->' for the rootmenu.
> >
> >
> >if (menu == &rootmenu) {
> >prompt = "Main menu";
> >marker = "";
> >} else {
> >prompt = menu_get_prompt(menu);
> >marker = "->";
> >}
> >
> >str_printf(r, "%*c%s %s", j, ' ', marker, prompt);
> >
> Perhaps it will be better to split to separate printfs? I think it
> will be cleaner. It will make the extra vars unneeded as well.

I am fine with it.


> Also, the results look a bit weird... maybe we should use a different
> marker for rootmenu, like '--' or something?


How does it look weird?






> >
> >
> >Maybe, this will make the help look cleaner.
> >
> >
> >
> >
> >
> >>+str_printf(r, "%*c-> %s", j, ' ', prompt);
> >>+if (menu->sym) {
> >>+str_printf(r, " (%s [=%s])", menu->sym->name ?
> >>+menu->sym->name : "<choice>",
> >>+sym_get_string_value(menu->sym));
> >>}
> >>+str_append(r, "\n");
> >>}
> >>}
> >>
> >>
> >>base-commit: 087e856cfb76e9eef9a3a6e000854794f3c36e24
> >>--
> >>2.25.1
> >>
> >
> >
> >--
> >Best Regards
> >
> >Masahiro Yamada
> Thanks for the comments :)
> Ariel Marcovitch



-- 
Best Regards
Masahiro Yamada
