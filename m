Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7B61F9A1
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 19:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfEORzp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 13:55:45 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:42950 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfEORzp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 13:55:45 -0400
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4FHtdMZ004785;
        Thu, 16 May 2019 02:55:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4FHtdMZ004785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557942940;
        bh=9VPJuO+8ek9FdO8rH4SWRexqamweV5OqAsZmezCeNnc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=npSVlWCwM8azB91Uvp4UddzWLtMUeW8Ri76OuXQFVczd/hA7b38h2eIo/euzLjtjP
         Us7sqXmxEl+9rZCPz/yomBjfeOwFzxB1PPK3YeRiT0hGIWEOhRYe5H5Ernk0WJNCOf
         zSgZedoJdabb0XjH6SC1Dbn1dVYcihmmTq2Kt06/6vLpl2dWgyWKs+Oo6VF5L8rekR
         xSrL+4aRbMUwmC0HODH6j5icfDB9WDixrUwWaWMKbfSqfQG+YtASJ8p6/KVKT/xauX
         WhXmu4DWRF9Rayfwix1rBgrRzFOyOqZRcBsIijNx8PFTUfZ5S5OhjPI3YCZuae0/bN
         2oBqyCZGVnv0A==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id j4so244677vke.11;
        Wed, 15 May 2019 10:55:39 -0700 (PDT)
X-Gm-Message-State: APjAAAXbECEDtyT5Rx6J0topLXn4MnQyikpscs46nUQNfIkWWFN9B/Pp
        A9LFOc/z8eqZHw5T3VZFVL94gqSGIucyD7mQyis=
X-Google-Smtp-Source: APXvYqxoXxKj10Lj7JnikLJzkPqlT1eKC+wm0sH9Ncb3Qmnn9kKZOzOYLPGGYDfXGlA0bbQn21QSG9AmWMNSF77r/C0=
X-Received: by 2002:a1f:3dc9:: with SMTP id k192mr11666669vka.74.1557942938566;
 Wed, 15 May 2019 10:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com> <201905150913.C23BD99AD@keescook>
In-Reply-To: <201905150913.C23BD99AD@keescook>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 16 May 2019 02:55:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
Message-ID: <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Kees,

On Thu, May 16, 2019 at 1:20 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, May 15, 2019 at 04:53:15PM +0900, Masahiro Yamada wrote:
> > On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
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
> > > ---
> > >
> >
> > > diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> > > new file mode 100755
> > > index 000000000000..944e68bd22b0
> > > --- /dev/null
> > > +++ b/scripts/modules-check.sh
> > > @@ -0,0 +1,18 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +# Warn if two or more modules have the same basename
> > > +check_same_name_modules()
> > > +{
> > > +       same_name_modules=$(cat modules.order modules.builtin | \
> > > +                               xargs basename -a | sort | uniq -d)
>
> While probably it'll never be a problem, just for robustness, I'd add "--"
> to the end basename to terminate argument interpretation:
>
>     xargs basename -a -- | sort | ...


Sorry for my ignorance, but could you
teach me the effect of "--" ?


I sometimes use "--" as a separator
when there is ambiguity in arguments
for example, "git log <revision> -- <path>"


In this case, what is intended by "--"?



--
Best Regards
Masahiro Yamada
