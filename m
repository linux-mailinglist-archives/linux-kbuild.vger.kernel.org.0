Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16A220C886
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 16:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgF1Onu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 10:43:50 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:58484 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgF1Ont (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 10:43:49 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 05SEhPEU018380;
        Sun, 28 Jun 2020 23:43:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 05SEhPEU018380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593355406;
        bh=Zf7SkASOX3zOYNjzpboDOaQtt5ag7MRuNwmEO4LCFJg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h7OmUbwWfTN6StZpJzqF9R46GokNIQBfrUe6hCefnZdXQceK9VzyJa8QxtgcqRkUS
         vNrxtOmkkemWMPayDpFQsUIsH8nGVQIm7CvIocWgj0ValZRqZxvO/gy7jwKglPH06b
         QZZRCfwbpItcDHG2FlfBZ+KdtB2gcFpsvoTHvRKip3AhCjSuzfVpJ4fa650N+phBvW
         Hez+3ms+APP9fQ3ai11nJXISlUmWSSe28ten2mp8Yp9gnMvpgOp9ruf9sORXyfzqd2
         VrjF3/LNMiO/0o4iZpTumBz4XQ2a7P39VtPHUGUSuVFYSo6IeoH0299jw2DpxyT5Da
         Ira/x8boaevLg==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id z47so4532142uad.5;
        Sun, 28 Jun 2020 07:43:26 -0700 (PDT)
X-Gm-Message-State: AOAM531BywM3pDFPOae26X4o9E0jCRP6EkBHqZ1qj49r5WNGd7CkTIuE
        3qPzaSq+zlTZO68thYMkHq4y0jHKBOSaXNR5Eso=
X-Google-Smtp-Source: ABdhPJwmnCX2prKemL199Z0LF+nsENJFY+MpLBnoBNPVkKtHukvEm12rwB8/5oQqWLhvsJQUFUUAuBXp3VgjJLvbh/4=
X-Received: by 2002:ab0:71d3:: with SMTP id n19mr8188868uao.25.1593355405102;
 Sun, 28 Jun 2020 07:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200625154226.25692cd1@coco.lan> <371f4815f6daac50e90057520d5f2b40a6ca3a74.1593096720.git.mchehab+huawei@kernel.org>
 <c3c58115168c983eb1d441daa7cc84378cf33f39.camel@redhat.com>
In-Reply-To: <c3c58115168c983eb1d441daa7cc84378cf33f39.camel@redhat.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 23:42:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5meMz0LF3C-2FnA6S8dettg4uJO-=FvsnCZ3H6+CVng@mail.gmail.com>
Message-ID: <CAK7LNAT5meMz0LF3C-2FnA6S8dettg4uJO-=FvsnCZ3H6+CVng@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 28, 2020 at 5:40 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> On Thu, 2020-06-25 at 16:52 +0200, Mauro Carvalho Chehab wrote:
> > The logic handling find on split mode is currently broken.
> > Fix it, making it work again as expected.
>
> I tested this patch and it works well.
> There is one really small cosmetic issue:
>
> If you select search result, and then select another search result
> which happens not to update the 'menu', then both the results are
> selected (that is the old one doesn't clear its selection)

I see this too.
So, this can be improved somehow...



>
> Best regards,
>         Maxim Levitsky
>
> >
> > Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/kconfig/qconf.cc | 19 +++++++++----------
> >  1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > index c0ac8f7b5f1a..b8f577c6e8aa 100644
> > --- a/scripts/kconfig/qconf.cc
> > +++ b/scripts/kconfig/qconf.cc
> > @@ -1645,22 +1645,21 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
> >                       return;
> >               list->setRootMenu(parent);
> >               break;
> > -     case symbolMode:
> > +     case menuMode:
> >               if (menu->flags & MENU_ROOT) {
> > -                     configList->setRootMenu(menu);
> > +                     menuList->setRootMenu(menu);
> >                       configList->clearSelection();
> > -                     list = menuList;
> > -             } else {
> >                       list = configList;
> > +             } else {
> > +                     configList->setRootMenu(menu);
> > +                     configList->clearSelection();
> > +
> >                       parent = menu_get_parent_menu(menu->parent);
> >                       if (!parent)
> >                               return;
> > -                     item = menuList->findConfigItem(parent);
> > -                     if (item) {
> > -                             item->setSelected(true);
> > -                             menuList->scrollToItem(item);
> > -                     }
> > -                     list->setRootMenu(parent);
> > +                     menuList->setRootMenu(parent);
> > +
> > +                     list = menuList;
> >               }
> >               break;
> >       case fullMode:
>
>


-- 
Best Regards
Masahiro Yamada
