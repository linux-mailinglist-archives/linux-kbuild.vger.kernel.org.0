Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 025791F060
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 13:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732224AbfEOLn0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 07:43:26 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55727 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732170AbfEOLnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 07:43:24 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4FBhEDa019916;
        Wed, 15 May 2019 20:43:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x4FBhEDa019916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557920595;
        bh=+/we/8cOii8b99PZhVYm0AcO3nqZi/sKx4erv7OLIUE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tx5hgVYtzu12J6V2/Rn+WH6NWqubXfxd43BXwabA/gnxqGOvkQ+bsagPcytr4hoZq
         Tu1sMHuxX8abGfAwnPfxGso5be69sJb4Cy0MIgIETskeC5emqoDQ3+AGkVkq7bCW2W
         YCO/x8bwl77Hmg/vGH1bilfZ0p24kjqhiFGTde21w/IZm0/nXOEcVVdsG+Bf9r/TVv
         jw+tjE4dlYX7+C2qhmEjWvCbx0PVBnIHEErdidHacE6kgE4rmra1cEL3G/+anwKQaM
         r1JaR4J/0WBNIBKHS82iPAblY7cVhQLP1/MI2GgsDy7eq/j30YvOcoE0s+VMQv8ff6
         O0nINqS+RcyXQ==
X-Nifty-SrcIP: [209.85.160.175]
Received: by mail-qt1-f175.google.com with SMTP id i26so940210qtr.10;
        Wed, 15 May 2019 04:43:15 -0700 (PDT)
X-Gm-Message-State: APjAAAWf1CHLyu/JbvYAC3tWazBU22ZZPN+nIQuYwBZf1FtckmP4MP6w
        L6j12Bb+Bzd6mWrGOjmqdYpYzhOMDJRQUgXMxso=
X-Google-Smtp-Source: APXvYqz8UMUEkHKjEaRHNMHyCfn133IiH2H+rDbuxuhm9tMwfpfNPVI6ERliCWZVO3MkCJsAQpIuSxV/RFmmLdZueU4=
X-Received: by 2002:a0c:c686:: with SMTP id d6mr31378804qvj.179.1557920593889;
 Wed, 15 May 2019 04:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK8P3a1y7hxME0me_Zu-F8a8jU6n=T+c32mv83utOtsL-+gc0A@mail.gmail.com>
 <20190515081422.GA22750@kroah.com> <CAK7LNASpJFAgvuak=mz5kkM3oGh9-M8y_84KZv-xcUkQ0h=d_A@mail.gmail.com>
 <20190515113113.GC11749@kroah.com>
In-Reply-To: <20190515113113.GC11749@kroah.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 15 May 2019 20:42:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLk7avr71vWEzHdRVMk5bCrFDrFUapD-ab_75-Li_8aw@mail.gmail.com>
Message-ID: <CAK7LNARLk7avr71vWEzHdRVMk5bCrFDrFUapD-ab_75-Li_8aw@mail.gmail.com>
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

On Wed, May 15, 2019 at 8:34 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 15, 2019 at 05:57:50PM +0900, Masahiro Yamada wrote:
> > On Wed, May 15, 2019 at 5:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, May 15, 2019 at 10:08:12AM +0200, Arnd Bergmann wrote:
> > > > On Wed, May 15, 2019 at 9:39 AM Masahiro Yamada
> > > > <yamada.masahiro@socionext.com> wrote:
> > > > >
> > > > > In the recent build test of linux-next, Stephen saw a build error
> > > > > caused by a broken .tmp_versions/*.mod file:
> > > > >
> > > > >   https://lkml.org/lkml/2019/5/13/991
> > > > >
> > > > > drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> > > > > basename, and there is a race in generating .tmp_versions/asix.mod
> > > > >
> > > > > Kbuild has not checked this before, and it occasionally shows up with
> > > > > obscure error message when this kind of race occurs.
> > > > >
> > > > > It is not trivial to catch this potential issue by eyes.
> > > > >
> > > > > Hence, this script.
> > > > >
> > > > > I compile-tested allmodconfig for the latest kernel as of writing,
> > > > > it detected the following:
> > > > >
> > > > > warning: same basename '88pm800.ko' if the following are built as modules:
> > > > >   drivers/regulator/88pm800.ko
> > > > >   drivers/mfd/88pm800.ko
> > > > > warning: same basename 'adv7511.ko' if the following are built as modules:
> > > > >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> > > > >   drivers/media/i2c/adv7511.ko
> > > > > warning: same basename 'asix.ko' if the following are built as modules:
> > > > >   drivers/net/phy/asix.ko
> > > > >   drivers/net/usb/asix.ko
> > > > > warning: same basename 'coda.ko' if the following are built as modules:
> > > > >   fs/coda/coda.ko
> > > > >   drivers/media/platform/coda/coda.ko
> > > > > warning: same basename 'realtek.ko' if the following are built as modules:
> > > > >   drivers/net/phy/realtek.ko
> > > > >   drivers/net/dsa/realtek.ko
> > > > >
> > > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > >
> > > > That looks great!
> > > >
> > > > > ---
> > > > >
> > > > >  [Alternative fix ? ]
> > > > >
> > > > > I do not know about the user experience of modprobe etc.
> > > > > when two different modules have the same name.
> > > > > It does not matter if this is correctly handled by modules.order?
> > > > >
> > > > > If this is just a problem of the build system, it is pretty easy to fix.
> > > > > For example, if we prepend the directory path, parallel build will
> > > > > never write to the same file simultanously.
> > > > >
> > > > >   asix.mod -> drivers/net/phy/asix.mod
> > > > >   asix.mod -> drivers/net/usb/asix.mod
> > > >
> > > > non-unique module names cause all kinds of problems, and
> > > > modprobe can certainly not handle them correctly, and there
> > > > are issues with symbols exported from a module when another
> > > > one has the same name.
> > >
> > > /sys/modules/ will fall over when this happens as well.  I thought we
> > > had the "rule" that module names had to be unique, I guess it was only a
> > > matter of time before they started colliding :(
> > >
> > > So warning is good, but forbidding this is better, as things will break.
> > >
> > > Or we need to fix up the places where things will break.
> >
> >
> > If we intentionally break the build,
> > we need to send fix-up patches to subsystems first.
>
> True, but those builds are already broken if anyone tries to use them :)
>
> A warning for now would be nice, that way we can find these and know to
> fix them up over time.


Yes, I think it is a fair point.

Start this with warning, then people will soon notice the problem.

Turning it into error is easy once we fix all instances.


-- 
Best Regards
Masahiro Yamada
