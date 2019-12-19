Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D140125D0E
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 09:56:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfLSI4g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 03:56:36 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52780 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfLSI4g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 03:56:36 -0500
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xBJ8uUge022688;
        Thu, 19 Dec 2019 17:56:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xBJ8uUge022688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576745791;
        bh=CJ/qEVPIQdohGWcu6SkjfsxS+gNDz9h6ttMnMdGwntA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OtDoTR1DqKFuVMp3qoF6qbCDuSuK3JNRF3H0YexVm348F7DB+++QpJwJJhJso8kSG
         CDcjhXFfqioXeQzOMgwuIkh0FmBJBDn6o26kQtcWSahAX4nx/HkTjO/VUKGT4dAU3e
         LJ7+4D702S7FIBePlk0CiZ37DFx1cQFJ1ElgCtlvdkt2vumVwQLVYK47gqEoS7Cj+/
         iTSMM21VTlEvExSL87Hbwh0lDkQ3cx3RLrycbVp+YZ2qHUSEVpqSfkUu1vvZKIIY3l
         eAbroxN0CqpVlFUUCsFHGtdaXF3I9dNIqqTOysl9AfXP7tQ0dHFhSAWfJzXqDwnTLA
         Cbo++AMRQ12bg==
X-Nifty-SrcIP: [209.85.221.180]
Received: by mail-vk1-f180.google.com with SMTP id u6so1410749vkn.13;
        Thu, 19 Dec 2019 00:56:31 -0800 (PST)
X-Gm-Message-State: APjAAAXBPZ8iUPWBw2q4VozsRrRTXlDJplNfG1v+nbqyJmd174nBJhuG
        yGnmCX8BExCUXH9llt1q392iVBckgAp51sS0RLk=
X-Google-Smtp-Source: APXvYqxy+SlvdRodh4m0LAxJVbvQg91yTJatS8sTBtk9ghoUj/z84Cf+wuatV/uFpgcKs0TY9RkuSY6U9zeXSuIslUM=
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr4991451vkd.66.1576745790096;
 Thu, 19 Dec 2019 00:56:30 -0800 (PST)
MIME-Version: 1.0
References: <201912181000.82Z7czbN%lkp@intel.com> <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
 <20191218172353.GO22665@localhost> <CAK7LNATztV-a3maL+vqQhbVsLBD_dsy+wbOZQ5ofQfbZQGGuLA@mail.gmail.com>
 <20191219081814.GP22665@localhost>
In-Reply-To: <20191219081814.GP22665@localhost>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Dec 2019 17:55:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHZ9HsYj+sncDqOBWRV+YoFNTciKOxfeYrA7MtBJ9T7A@mail.gmail.com>
Message-ID: <CAK7LNASHZ9HsYj+sncDqOBWRV+YoFNTciKOxfeYrA7MtBJ9T7A@mail.gmail.com>
Subject: Re: kbuild obj-m directory descend (was: Re: [PATCH] serdev: fix
 builds with CONFIG_SERIAL_DEV_BUS=m)
To:     Johan Hovold <johan@kernel.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        kbuild test robot <lkp@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 19, 2019 at 5:18 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Dec 19, 2019 at 11:00:15AM +0900, Masahiro Yamada wrote:
> > Hi.
> >
> > On Thu, Dec 19, 2019 at 2:23 AM Johan Hovold <johan@kernel.org> wrote:
>
> > > The offending patch is broken since it effectively makes
> > > CONFIG_SERIAL_DEV_BUS bool (built-in or disabled), but for some reaso=
n
> > > those symbols do not end up in vmlinux (despite being compiled) when =
you
> > > add a built-in object goal under a directory that was entered using
> > > obj-m.
> > >
> > > That seems like a bug to me and contradicts the kbuild documentation
> > > (3.6):
> > >
> > >         Example:
> > >
> > >         #fs/Makefile
> > >         obj-$(CONFIG_EXT2_FS) +=3D ext2/
> > >
> > >         If CONFIG_EXT2_FS is set to either =E2=80=98y=E2=80=99 (built=
-in) or =E2=80=98m=E2=80=99
> > >         (modular) the corresponding obj- variable will be set, and
> > >         kbuild will descend down in the ext2 directory. Kbuild only u=
ses
> > >         this information to decide that it needs to visit the directo=
ry,
> > >         it is the Makefile in the subdirectory that specifies what is
> > >         modular and what is built-in.
> > >
> > > I tried adding other targets to obj-y directly and they are also are =
not
> > > included, seemingly since the directory was entered using obj-m.
> > >
> > > Masahiro or Michal, can you shed some light?
>
> > I saw similar questions in ML in the past.
> > Yes, this is how Kbuild works;
> > Kbuild only links objects in Makefiles visited by obj-y.
> >
> > If you use
> >     obj-m +=3D serdev/
> > all objects in serdev/ are considered as modular.
>
> Well, any objects in serdev/ specified in obj-y would currently be built
> but never included in either built-in.a or any module.

Right.

>
> > I think it is better to make the document
> > clarify this.
>
> Yeah, I don't have a use case for this, but the documentation would need
> to be updated to not have more people look into this.
>
> And at least this behaviour allowed us to catch this bug, but only
> because we had dependent modules that failed to build. I see now that
> you posted a patch adding a general warning about obj-y under obj-m last
> fall, but that was apparently never merged.

This one?

https://lore.kernel.org/patchwork/patch/1126959/

This patch detected several Makefile/Kconfig bugs,
and it is good.

But, it also turned out to cause false positive warnings
on some architectures.
I thought it was not so easy to fix it.
So, I decided to postpone it.


> But when was this behaviour changed? And was that done on purpose?

No. Not changed at all.

In my understanding, the current behavior has been kept
from the beginning.



> Johan



--=20
Best Regards
Masahiro Yamada
