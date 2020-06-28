Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD1020C88B
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 16:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgF1OsS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 10:48:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53394 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726573AbgF1OsR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 10:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593355696;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=82qSMqnQIxtm9RO80DF49vRKylVY7TBxv5Jeswhd/Z0=;
        b=FKcSq+AOkBYmHxo4K3BFmKJafOJ3zHmxWQQlahBTed0fvem3jcbtyV4UrBYPNHSW7F+qYV
        7nntTcTwiNxSlfenyvBEc/7zq44eaOV4ZwbhQsaYhthSPGf7Oe5TKdF6FVn9PUczsGl2//
        I6TbPQxScpcjOdxrzYsBsz2FkvFVWGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-RQbvHIngOyOU1dHs64vcGw-1; Sun, 28 Jun 2020 10:48:12 -0400
X-MC-Unique: RQbvHIngOyOU1dHs64vcGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8BEE1800D42;
        Sun, 28 Jun 2020 14:48:10 +0000 (UTC)
Received: from starship (unknown [10.35.206.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4FA7A9CFD0;
        Sun, 28 Jun 2020 14:48:09 +0000 (UTC)
Message-ID: <9ed32076053cd860900366dc9e12e5cb76d031b5.camel@redhat.com>
Subject: Re: [PATCH] kconfig: qconf: make debug links work again
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sun, 28 Jun 2020 17:48:08 +0300
In-Reply-To: <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
References: <ff9d1c3369b96c1d14b1e898e3d5f64ad945b604.1593346883.git.mchehab+huawei@kernel.org>
         <CAK7LNARnDe0ToxYj9mMpocxzmrUvp6yf14iDRxgG8nGuGcxFKw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 2020-06-28 at 23:41 +0900, Masahiro Yamada wrote:
> On Sun, Jun 28, 2020 at 9:21 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > The Qt5 conversion broke support for debug info links.
> > 
> > Restore the behaviour added by changeset
> > ab45d190fd4a ("kconfig: create links in info window").
> > 
> > Reported-by: Maxim Levitsky <mlevitsk@redhat.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> I tested this patch, but this caused
> segmentation fault.
> 
> 
> I enabled 'Show Debug Info',
> and then clicked
> dep: <symbol name>.
> 
> Then, xconfig crashed.
> 
> (without this patch, it did not cause
> segfault at least)
> 
> Did you see this?

Works for me - tested this again 
(I have both patches applied on top on mainline master branch).
Maybe you have Qt4?

One thing that I forgot to report is that when clicking on the symbol,
only config descripion updates and not config/menu windows.
It might even be always like that, I don't remember, but it would be nice if 
these were updated too.

Best regards,
	Maxim Levitsky

> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> > ---
> >  scripts/kconfig/qconf.cc | 35 ++++++++++++++++++++++++++++++++++-
> >  scripts/kconfig/qconf.h  |  1 +
> >  2 files changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > index 631e19659504..03cadf27a376 100644
> > --- a/scripts/kconfig/qconf.cc
> > +++ b/scripts/kconfig/qconf.cc
> > @@ -1012,7 +1012,7 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
> >         : Parent(parent), sym(0), _menu(0)
> >  {
> >         setObjectName(name);
> > -
> > +       setOpenLinks(false);
> > 
> >         if (!objectName().isEmpty()) {
> >                 configSettings->beginGroup(objectName());
> > @@ -1224,6 +1224,36 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
> >                 *text += str2;
> >  }
> > 
> > +void ConfigInfoView::clicked(const QUrl &url)
> > +{
> > +       QByteArray str = url.toEncoded();
> > +       const std::size_t count = str.size();
> > +       char *hex = new char[count];
> > +       unsigned long p;
> > +
> > +       if (count < 1)
> > +               return;
> > +
> > +       memcpy(hex, str.constData(), count);
> > +       p = (int)strtol(hex + 1, NULL, 16);
> > +
> > +       if (!p)
> > +               return;
> > +
> > +       if (hex[0] == 's') {
> > +               struct symbol *s = (struct symbol *)p;
> > +
> > +               sym = s;
> > +               symbolInfo();
> > +       } else {
> > +               struct menu *m = (struct menu *)p;
> > +
> > +               _menu = m;
> > +               menuInfo();
> > +       }
> > +       emit showDebugChanged(true);
> > +}
> > +
> >  QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
> >  {
> >         QMenu* popup = Parent::createStandardContextMenu(pos);
> > @@ -1497,6 +1527,9 @@ ConfigMainWindow::ConfigMainWindow(void)
> >         helpMenu->addAction(showIntroAction);
> >         helpMenu->addAction(showAboutAction);
> > 
> > +       connect (helpText, SIGNAL (anchorClicked (const QUrl &)),
> > +                helpText, SLOT (clicked (const QUrl &)) );
> > +
> >         connect(configList, SIGNAL(menuChanged(struct menu *)),
> >                 helpText, SLOT(setInfo(struct menu *)));
> >         connect(configList, SIGNAL(menuSelected(struct menu *)),
> > diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
> > index d913a02967ae..a193137f2314 100644
> > --- a/scripts/kconfig/qconf.h
> > +++ b/scripts/kconfig/qconf.h
> > @@ -250,6 +250,7 @@ public slots:
> >         void setInfo(struct menu *menu);
> >         void saveSettings(void);
> >         void setShowDebug(bool);
> > +       void clicked (const QUrl &url);
> > 
> >  signals:
> >         void showDebugChanged(bool);
> > --
> > 2.26.2
> > 
> 
> 


