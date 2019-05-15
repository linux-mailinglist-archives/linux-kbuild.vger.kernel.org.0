Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAA61EA81
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 10:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbfEOI6y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 04:58:54 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28366 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOI6y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 04:58:54 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4F8wRhu014705;
        Wed, 15 May 2019 17:58:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x4F8wRhu014705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557910708;
        bh=2MrrSHdBxYxVtPj2/DVwtwR68DpWBrQh9eRHG+q/Ras=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jug8I0tk1Pn8hz6j2xUe4+x8GdPnAVwmlUAm1/isDl2mGqcSUUtwj6wj0pMUccZ0b
         +Rt4R//uYCdeIiNh6m5fV/5nrm4/2yVXFTw+nV0B7vuP2jmZ9CnszTkb6++4kt/pYC
         iuY8I6ELpoQf+hmzmLAg8FwoqoicqhKxnAWQoS6HiUNJkdBHMe3FwjIzY3cNLA5gjA
         gVtGOugd/ZMGFNMZV0FbGl7+tPSKSowweC/CJOjoUGUjH42eWeVMK7ytaDakjsKnFZ
         b0wJfwCmXQ3mK0iFffBCXDuDeeYHS05SJHqRPSZk/2ZI4QgNH81cnEwg44D6R0KDEe
         cvNU2PJaBTtmQ==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id m1so1183920vsr.6;
        Wed, 15 May 2019 01:58:27 -0700 (PDT)
X-Gm-Message-State: APjAAAXjUv4QPa+g9QKFUvVdd4DLduLfaIbI8aPEgtxLJcNtHYB/idgt
        vM1vnkh/MRrelGqF9/58wN5EWLQ9OFJcED88NRM=
X-Google-Smtp-Source: APXvYqwiIrHwReJgRh15IRutCI+xHlWSLgVpa+JYsXecdQqZvMW8wM9FCJc2CnGJ7JtW/ROzngXadei4gINSatKZNMA=
X-Received: by 2002:a67:fc4:: with SMTP id 187mr19815232vsp.215.1557910706916;
 Wed, 15 May 2019 01:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK8P3a1y7hxME0me_Zu-F8a8jU6n=T+c32mv83utOtsL-+gc0A@mail.gmail.com> <20190515081422.GA22750@kroah.com>
In-Reply-To: <20190515081422.GA22750@kroah.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 15 May 2019 17:57:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpJFAgvuak=mz5kkM3oGh9-M8y_84KZv-xcUkQ0h=d_A@mail.gmail.com>
Message-ID: <CAK7LNASpJFAgvuak=mz5kkM3oGh9-M8y_84KZv-xcUkQ0h=d_A@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 15, 2019 at 5:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 15, 2019 at 10:08:12AM +0200, Arnd Bergmann wrote:
> > On Wed, May 15, 2019 at 9:39 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > In the recent build test of linux-next, Stephen saw a build error
> > > caused by a broken .tmp_versions/*.mod file:
> > >
> > >   https://lkml.org/lkml/2019/5/13/991
> > >
> > > drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> > > basename, and there is a race in generating .tmp_versions/asix.mod
> > >
> > > Kbuild has not checked this before, and it occasionally shows up with
> > > obscure error message when this kind of race occurs.
> > >
> > > It is not trivial to catch this potential issue by eyes.
> > >
> > > Hence, this script.
> > >
> > > I compile-tested allmodconfig for the latest kernel as of writing,
> > > it detected the following:
> > >
> > > warning: same basename '88pm800.ko' if the following are built as modules:
> > >   drivers/regulator/88pm800.ko
> > >   drivers/mfd/88pm800.ko
> > > warning: same basename 'adv7511.ko' if the following are built as modules:
> > >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> > >   drivers/media/i2c/adv7511.ko
> > > warning: same basename 'asix.ko' if the following are built as modules:
> > >   drivers/net/phy/asix.ko
> > >   drivers/net/usb/asix.ko
> > > warning: same basename 'coda.ko' if the following are built as modules:
> > >   fs/coda/coda.ko
> > >   drivers/media/platform/coda/coda.ko
> > > warning: same basename 'realtek.ko' if the following are built as modules:
> > >   drivers/net/phy/realtek.ko
> > >   drivers/net/dsa/realtek.ko
> > >
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > That looks great!
> >
> > > ---
> > >
> > >  [Alternative fix ? ]
> > >
> > > I do not know about the user experience of modprobe etc.
> > > when two different modules have the same name.
> > > It does not matter if this is correctly handled by modules.order?
> > >
> > > If this is just a problem of the build system, it is pretty easy to fix.
> > > For example, if we prepend the directory path, parallel build will
> > > never write to the same file simultanously.
> > >
> > >   asix.mod -> drivers/net/phy/asix.mod
> > >   asix.mod -> drivers/net/usb/asix.mod
> >
> > non-unique module names cause all kinds of problems, and
> > modprobe can certainly not handle them correctly, and there
> > are issues with symbols exported from a module when another
> > one has the same name.
>
> /sys/modules/ will fall over when this happens as well.  I thought we
> had the "rule" that module names had to be unique, I guess it was only a
> matter of time before they started colliding :(
>
> So warning is good, but forbidding this is better, as things will break.
>
> Or we need to fix up the places where things will break.


If we intentionally break the build,
we need to send fix-up patches to subsystems first.



-- 
Best Regards
Masahiro Yamada
