Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C920E210EEE
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 17:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731564AbgGAPSj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 11:18:39 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:21624 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgGAPSj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:18:39 -0400
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 061FIJOI017028;
        Thu, 2 Jul 2020 00:18:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 061FIJOI017028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593616700;
        bh=P+sbxog9Xfyjhd58ruLdFep9dEzw8IWgnpUnyqt+B9M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w6SoUxKcPjvSqeZ+ZaSPCrdxN9UotC2RjVJgm+aRrv+MeINrGoi4hw4MTMpyO5UQD
         sD9nRXi8jLx+bg4SbgclzIX0N/aH+V+pwWebEWMsl6p5OuO7xvnBIqpYnp9ZUD5mRk
         WxhW3+Q7+VujO8GJCksbSJQFZujrsNTO4y7MaaSK66/Qbdv4BUL0WGwyMPVcketQdm
         wRqAn7Y4QzreFgGxHyqMdstJDOdvphX8LDPOU6KEykgPif5H3v876T/Lq4cqDPQB7j
         Y9WN0i8XcQmLqNfGUpzH6rEwfCgFPsiHlKOKkrNV4eFLW/JHp4rVI6d9b7YuhdYi7N
         LodDdxJ18EsxA==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id d64so5565627vke.4;
        Wed, 01 Jul 2020 08:18:20 -0700 (PDT)
X-Gm-Message-State: AOAM532dYRzT66GILsLOOWhJrRJn/LWLgWyk8gt2Si5tbH39Q46w0iPO
        WayEVqpKdJMaREAMLPhUQwJ7X+YQ5B/AzOcxQvc=
X-Google-Smtp-Source: ABdhPJyUqc5xbV6icDYToGwRimvQa0sj6v2oJf3kU2DLnN6+vY5JB4jziWgN0n7LN9DvwvrkSMfzIQOpgyM1xUwhcpY=
X-Received: by 2002:a1f:e841:: with SMTP id f62mr18957125vkh.66.1593616699028;
 Wed, 01 Jul 2020 08:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593444492.git.mchehab+huawei@kernel.org>
 <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
 <CAK7LNASQg8g7ad6SvZBQaq69+fcXLofV5WzRiFc8B3m6Rdy2vg@mail.gmail.com> <20200630080900.3606145c@coco.lan>
In-Reply-To: <20200630080900.3606145c@coco.lan>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 2 Jul 2020 00:17:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcg3UdR475h4frHoNZ3=kp6BFVyUQ=DBrvRQNZtm=o6w@mail.gmail.com>
Message-ID: <CAK7LNATcg3UdR475h4frHoNZ3=kp6BFVyUQ=DBrvRQNZtm=o6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: qconf: don't show goback button on splitMode
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 30, 2020 at 3:09 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Tue, 30 Jun 2020 12:55:05 +0900
> Masahiro Yamada <masahiroy@kernel.org> escreveu:
>
> > On Tue, Jun 30, 2020 at 12:30 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > the goback button does nothing on splitMode. So, why display
> > > it?
> >
> >
> > Hmm, I still see the goback button
> > on all of the three modes...
>
> Huh?
>
> Perhaps we're talking about a different thing here...
>
> What I meant by goback button is this:
>
>         =E2=97=80 ..


Sorry, I misunderstood the goback button.

This improvement is neat.

Thank you.





> Which is displayed as the first item is not the root config item.
>
> This is implemented on this logic, within ConfigItem::updateMenu():
>
>         if (goParent) {
>                 setPixmap(promptColIdx, list->menuBackPix);
>                 prompt =3D "..";
>                 goto set_prompt;
>         }
>
> and it displays this image:
>
>         const char *xpm_menuback[] =3D {
>         "12 12 2 1",
>         "  c white",
>         ". c black",
>         "            ",
>         " .......... ",
>         " .        . ",
>         " .     .. . ",
>         " .   .... . ",
>         " . ...... . ",
>         " . ...... . ",
>         " .   .... . ",
>         " .     .. . ",
>         " .        . ",
>         " .......... ",
>         "            "};
>
> This item is should never be shown on fullMode, because it never
> changes the root item.
>
> Looking within the code logic, the only place that passes
> goParent =3D true to "new ConfigItem" (thus creating it) is here:
>
>         if (rootEntry !=3D &rootmenu && (mode =3D=3D singleMode ||
>             (mode =3D=3D symbolMode && rootEntry->parent !=3D &rootmenu))=
) {
>                 item =3D (ConfigItem *)topLevelItem(0);
>                 if (!item && mode !=3D symbolMode) {
>                         item =3D new ConfigItem(this, 0, true);
>                         last =3D item;
>                 }
>         }
>
> (Btw, I almost sent a patch making the "goParent" parameter explict
> when creating ConfigItem)
>
> So, even before this patch, the goback button is only displayed on
> singleMode and symbolMode (with is one of the internal representations
> for the split mode).
>
> This patch should solve the split mode case.
>
> >
> >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  scripts/kconfig/qconf.cc | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > > index d0bcc0b717f0..f49fbac91995 100644
> > > --- a/scripts/kconfig/qconf.cc
> > > +++ b/scripts/kconfig/qconf.cc
> > > @@ -437,9 +437,10 @@ void ConfigList::updateList(ConfigItem* item)
> > >         if (rootEntry !=3D &rootmenu && (mode =3D=3D singleMode ||
> > >             (mode =3D=3D symbolMode && rootEntry->parent !=3D &rootme=
nu))) {
> > >                 item =3D (ConfigItem *)topLevelItem(0);
> > > -               if (!item)
> > > +               if (!item && mode !=3D symbolMode) {
> > >                         item =3D new ConfigItem(this, 0, true);
> > > -               last =3D item;
> > > +                       last =3D item;
> > > +               }
> > >         }
> > >         if ((mode =3D=3D singleMode || (mode =3D=3D symbolMode && !(r=
ootEntry->flags & MENU_ROOT))) &&
> > >             rootEntry->sym && rootEntry->prompt) {
> > > --
> > > 2.26.2
> > >
> >
> >
>
>
>
> Thanks,
> Mauro



--=20
Best Regards
Masahiro Yamada
