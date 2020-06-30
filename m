Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5BC20EE0B
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 08:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgF3GJF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 02:09:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgF3GJE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 02:09:04 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2900720775;
        Tue, 30 Jun 2020 06:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593497343;
        bh=vxjH9R8r5IheRYtbktHUs99dhD4TTgE9pQoxWF1pqyw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K2D/6iK6FO6KLd7gO0us0XpRbcjirLeEXmoi2APAxR0eIfe0CzHUJltPgluSCVrT6
         5pskdOxgy8g7whbYcVhwGovVJXCICN3yQa69fLPQdnXUxFqIajz4mxfz+kZ0YC8OdL
         NaUXDExN6gP4US7hskJyL/oM8niMp0lUvqxN31vE=
Date:   Tue, 30 Jun 2020 08:09:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] kconfig: qconf: don't show goback button on
 splitMode
Message-ID: <20200630080900.3606145c@coco.lan>
In-Reply-To: <CAK7LNASQg8g7ad6SvZBQaq69+fcXLofV5WzRiFc8B3m6Rdy2vg@mail.gmail.com>
References: <cover.1593444492.git.mchehab+huawei@kernel.org>
        <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
        <CAK7LNASQg8g7ad6SvZBQaq69+fcXLofV5WzRiFc8B3m6Rdy2vg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Tue, 30 Jun 2020 12:55:05 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> On Tue, Jun 30, 2020 at 12:30 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > the goback button does nothing on splitMode. So, why display
> > it? =20
>=20
>=20
> Hmm, I still see the goback button
> on all of the three modes...

Huh?=20

Perhaps we're talking about a different thing here...

What I meant by goback button is this:

	=E2=97=80 ..

Which is displayed as the first item is not the root config item.

This is implemented on this logic, within ConfigItem::updateMenu():

        if (goParent) {
                setPixmap(promptColIdx, list->menuBackPix);
                prompt =3D "..";
                goto set_prompt;
        }

and it displays this image:

	const char *xpm_menuback[] =3D {
	"12 12 2 1",
	"  c white",
	". c black",
	"            ",
	" .......... ",
	" .        . ",
	" .     .. . ",
	" .   .... . ",
	" . ...... . ",
	" . ...... . ",
	" .   .... . ",
	" .     .. . ",
	" .        . ",
	" .......... ",
	"            "};

This item is should never be shown on fullMode, because it never=20
changes the root item.=20

Looking within the code logic, the only place that passes
goParent =3D true to "new ConfigItem" (thus creating it) is here:

	if (rootEntry !=3D &rootmenu && (mode =3D=3D singleMode ||
	    (mode =3D=3D symbolMode && rootEntry->parent !=3D &rootmenu))) {
		item =3D (ConfigItem *)topLevelItem(0);
		if (!item && mode !=3D symbolMode) {
			item =3D new ConfigItem(this, 0, true);
			last =3D item;
		}
	}

(Btw, I almost sent a patch making the "goParent" parameter explict
when creating ConfigItem)

So, even before this patch, the goback button is only displayed on
singleMode and symbolMode (with is one of the internal representations
for the split mode).

This patch should solve the split mode case.

>=20
>=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  scripts/kconfig/qconf.cc | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > index d0bcc0b717f0..f49fbac91995 100644
> > --- a/scripts/kconfig/qconf.cc
> > +++ b/scripts/kconfig/qconf.cc
> > @@ -437,9 +437,10 @@ void ConfigList::updateList(ConfigItem* item)
> >         if (rootEntry !=3D &rootmenu && (mode =3D=3D singleMode ||
> >             (mode =3D=3D symbolMode && rootEntry->parent !=3D &rootmenu=
))) {
> >                 item =3D (ConfigItem *)topLevelItem(0);
> > -               if (!item)
> > +               if (!item && mode !=3D symbolMode) {
> >                         item =3D new ConfigItem(this, 0, true);
> > -               last =3D item;
> > +                       last =3D item;
> > +               }
> >         }
> >         if ((mode =3D=3D singleMode || (mode =3D=3D symbolMode && !(roo=
tEntry->flags & MENU_ROOT))) &&
> >             rootEntry->sym && rootEntry->prompt) {
> > --
> > 2.26.2
> > =20
>=20
>=20



Thanks,
Mauro
