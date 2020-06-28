Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344D920C89B
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 16:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgF1O7f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 10:59:35 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27341 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgF1O7f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 10:59:35 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05SEx3FM021744;
        Sun, 28 Jun 2020 23:59:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05SEx3FM021744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593356344;
        bh=8y+sYvvSlsPJkePBvt6b93o/5tiZNHK5j3ROt3+LDbs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gfV/cVSVyqGELOxkmM0ddlpJzfJFpck3dTVCA4ly/qTctqpOgCIt8KI/0GZQEwIpB
         Dh5E0+44WOBbh5EzEmaDJTOy+nPCv9Ao3kYSIM6q+hJC5d8r7+GlqWGIL0kiMffB6t
         2s3DpyYA9Ax2Sq97z0qWyYs2OE/sBmLBjGuPI3AoI3LgoqBTDfCrDFZWU6ZmIAukrC
         47Ge9Cyfjj8oyAbh+gAzNTqsGTrVfarH4+aqZzHOm6MAfUF2vtYgvJ0yjbGIC+Twqx
         6FUmzNZACWngYv//f0oAnoZVp/e7XgnA4FOK/snsM81iAAr74iLfmrIPANSU/CbhLT
         1xWc7JGgj32mA==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id g44so4524769uae.12;
        Sun, 28 Jun 2020 07:59:03 -0700 (PDT)
X-Gm-Message-State: AOAM533XXynDBHswid/CHUQ2p/gzZdIWUnLkQe5ziPrXAg/Z22qzXaA3
        McAaBq9r7HumYBpeH6ltbDeqME9QsXVqfgrS6ms=
X-Google-Smtp-Source: ABdhPJzk10ZsmGC+0M0P8bzA7VrZG8l8xO59Tn4JuDQ61DXvhrT8sTPgPSyCfs0ZJlUarc4D98BLZyDfrhOoX/2BOrE=
X-Received: by 2002:ab0:5b91:: with SMTP id y17mr8257200uae.95.1593356342166;
 Sun, 28 Jun 2020 07:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
 <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com> <9ed32076053cd860900366dc9e12e5cb76d031b5.camel@redhat.com>
In-Reply-To: <9ed32076053cd860900366dc9e12e5cb76d031b5.camel@redhat.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 23:58:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARJ6VMX_NJ9_YncWe0HQvJgOxnzujC+S0ZB8cL0NCYMWg@mail.gmail.com>
Message-ID: <CAK7LNARJ6VMX_NJ9_YncWe0HQvJgOxnzujC+S0ZB8cL0NCYMWg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: make debug links work again
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 28, 2020 at 11:48 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
> On Sun, 2020-06-28 at 23:41 +0900, Masahiro Yamada wrote:
> > On Sun, Jun 28, 2020 at 9:21 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > > The Qt5 conversion broke support for debug info links.
> > >
> > > Restore the behaviour added by changeset
> > > ab45d190fd4a ("kconfig: create links in info window").
> > >
> > > Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >
> > I tested this patch, but this caused
> > segmentation fault.
> >
> >
> > I enabled 'Show Debug Info',
> > and then clicked
> > dep: <symbol name>.
> >
> > Then, xconfig crashed.
> >
> > (without this patch, it did not cause
> > segfault at least)
> >
> > Did you see this?
>
> Works for me - tested this again
> (I have both patches applied on top on mainline master branch).
> Maybe you have Qt4?


I do not think so.

I checked scripts/kconfig/.qconf.cmd

qconf was linked with Qt5.


$ cat scripts/kconfig/.qconf.cmd
cmd_scripts/kconfig/qconf := g++   -o scripts/kconfig/qconf
scripts/kconfig/images.o scripts/kconfig/confdata.o
scripts/kconfig/expr.o scripts/kconfig/lexer.lex.o
scripts/kconfig/parser.tab.o scripts/kconfig/preprocess.o
scripts/kconfig/symbol.o scripts/kconfig/util.o
scripts/kconfig/qconf.o   -lQt5Widgets -lQt5Gui -lQt5Core


BTW, my machine runs ubuntu 20.04




>
> One thing that I forgot to report is that when clicking on the symbol,
> only config descripion updates and not config/menu windows.
> It might even be always like that, I don't remember, but it would be nice if
> these were updated too.
>
> Best regards,
>         Maxim Levitsky
>
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > > ---
> > >  scripts/kconfig/qconf.cc | 35 ++++++++++++++++++++++++++++++++++-
> > >  scripts/kconfig/qconf.h  |  1 +
> > >  2 files changed, 35 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > > index 631e19659504..03cadf27a376 100644
> > > --- a/scripts/kconfig/qconf.cc
> > > +++ b/scripts/kconfig/qconf.cc
> > > @@ -1012,7 +1012,7 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
> > >         : Parent(parent), sym(0), _menu(0)
> > >  {
> > >         setObjectName(name);
> > > -
> > > +       setOpenLinks(false);
> > >
> > >         if (!objectName().isEmpty()) {
> > >                 configSettings->beginGroup(objectName());
> > > @@ -1224,6 +1224,36 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
> > >                 *text += str2;
> > >  }
> > >
> > > +void ConfigInfoView::clicked(const QUrl &url)
> > > +{
> > > +       QByteArray str = url.toEncoded();
> > > +       const std::size_t count = str.size();
> > > +       char *hex = new char[count];
> > > +       unsigned long p;
> > > +
> > > +       if (count < 1)
> > > +               return;
> > > +
> > > +       memcpy(hex, str.constData(), count);
> > > +       p = (int)strtol(hex + 1, NULL, 16);
> > > +
> > > +       if (!p)
> > > +               return;
> > > +
> > > +       if (hex[0] == 's') {
> > > +               struct symbol *s = (struct symbol *)p;
> > > +
> > > +               sym = s;
> > > +               symbolInfo();
> > > +       } else {
> > > +               struct menu *m = (struct menu *)p;
> > > +
> > > +               _menu = m;
> > > +               menuInfo();
> > > +       }
> > > +       emit showDebugChanged(true);
> > > +}
> > > +
> > >  QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
> > >  {
> > >         QMenu* popup = Parent::createStandardContextMenu(pos);
> > > @@ -1497,6 +1527,9 @@ ConfigMainWindow::ConfigMainWindow(void)
> > >         helpMenu->addAction(showIntroAction);
> > >         helpMenu->addAction(showAboutAction);
> > >
> > > +       connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
> > > +                helpText, SLOT (clicked (const QUrl &)) );
> > > +
> > >         connect(configList, SIGNAL(menuChanged(struct menu *)),
> > >                 helpText, SLOT(setInfo(struct menu *)));
> > >         connect(configList, SIGNAL(menuSelected(struct menu *)),
> > > diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> > > index d913a02967ae..a193137f2314 100644
> > > --- a/scripts/kconfig/qconf.h
> > > +++ b/scripts/kconfig/qconf.h
> > > @@ -250,6 +250,7 @@ public slots:
> > >         void setInfo(struct menu *menu);
> > >         void saveSettings(void);
> > >         void setShowDebug(bool);
> > > +       void clicked (const QUrl &url);
> > >
> > >  signals:
> > >         void showDebugChanged(bool);
> > > --
> > > 2.26.2
> > >
> >
> >
>
>


-- 
Best Regards
Masahiro Yamada
