Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5BA91F8077
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2020 04:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgFMC7A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 22:59:00 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33798 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgFMC7A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 22:59:00 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 05D2wi21015259;
        Sat, 13 Jun 2020 11:58:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 05D2wi21015259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592017124;
        bh=3nEcwA2TH/A9ABNBLkTbUtqaSI0/D8H1x/AJSSdiKL0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SkI4ruXO8k11Qx2PSdkoNAKDa2dCHcKGt1j1ciEl7t2VapNg4q3V+ZWKNc74mCoMz
         /qn/MDUmiRX9cUoPwgDlSqVVm8/Kx6iREQhCOuPx6NBNB5zWbM2NBee22L2Ur/3aAW
         Nefs00ZEpP6cZ/2nFgPOSI1h/QkOoMMRr7uKqEWu403G+aG7/T1Rq/F3rh2HAn0TP7
         f+t2cJ0nxjb/T2fTCCDDOL4f3NpW2lk47YCEJR+C2IwkzP8361FX08fCPcy5gPH20c
         LgFBGr5obRxJecaJQI4nmyw7kVZ4gU0xK9OwrGZ+wUGEH9NfOY+MmJRu0D3pWtMhwC
         RWiiOyVP8jFzQ==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id x14so314428uao.7;
        Fri, 12 Jun 2020 19:58:44 -0700 (PDT)
X-Gm-Message-State: AOAM532MqtlIjmTYOuUgEfwWWLWD+5L/OGM2fApIMRdwbNkTsExMXKjO
        UzTSSyM/o3bdSr/2sTOUwZx8bWisAo5P+Wyi6Kc=
X-Google-Smtp-Source: ABdhPJx4mT4RRqCOnEAKQevkOUiKRYErtgf6OTcFUVt018jUeZ6UsYNWpcPqfT7b7V0JGgwDb2ZFaf7e2p1PL6zUDss=
X-Received: by 2002:a9f:2204:: with SMTP id 4mr12902256uad.40.1592017123342;
 Fri, 12 Jun 2020 19:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
 <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
 <3cd1a050fe692425352745672295033c@talpidae.net> <CAD=FV=WPW_o4ExmNUHe=2mYHLheKMfGTemW8CCiN4iQ7X3fAYw@mail.gmail.com>
 <CABXOdTdH7eRaMwn0A9Ej=Z-+qTVzO6bsrh3c6-0JtTsWgM=zbQ@mail.gmail.com>
 <CAK7LNASPBpycdovHqTm2wshZvuGJ2wLBDnOObZqqb+dOYboQMA@mail.gmail.com> <2d6662a2fee48eb148c81131115c6f11@talpidae.net>
In-Reply-To: <2d6662a2fee48eb148c81131115c6f11@talpidae.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 13 Jun 2020 11:58:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyf+7tuf=gbow9sDgqk3Vw-=H6GXX1t0ZiDszr2BVWGg@mail.gmail.com>
Message-ID: <CAK7LNAQyf+7tuf=gbow9sDgqk3Vw-=H6GXX1t0ZiDszr2BVWGg@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: install modules.builtin even if CONFIG_MODULES=n
To:     Jonas Zeiger <jonas.zeiger@talpidae.net>
Cc:     Guenter Roeck <groeck@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kbuild-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 13, 2020 at 12:35 AM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
>
> On 2020-06-12 08:56, Masahiro Yamada wrote:
> > On Wed, Jun 10, 2020 at 2:31 AM Guenter Roeck <groeck@google.com>
> > wrote:
> >>
> >> On Tue, Jun 9, 2020 at 9:38 AM Doug Anderson <dianders@chromium.org>
> >> wrote:
> >> >
> >> > Hi,
> >> >
> >> > On Tue, Jun 3, 2020 at 9:33 AM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
> >> > >
> >> > > Many applications check for available kernel features via:
> >> > >
> >> > >   - /proc/modules (loaded modules, present if CONFIG_MODULES=y)
> >> > >   - $(MODLIB)/modules.builtin (builtin modules)
> >> > >
> >> > > They fail to detect features if the kernel was built with
> >> > > CONFIG_MODULES=n
> >> > > and modules.builtin isn't installed.
> >> > >
> >> > > Therefore, add the target "_builtin_inst_" and make "install" and
> >> > > "modules_install" depend on it.
> >> > >
> >> > > Tests results:
> >> > >
> >> > >   - make install: kernel image is copied as before, modules.builtin
> >> > > copied
> >> > >   - make modules_install: (CONFIG_MODULES=n) nothing is copied, exit 1
> >> > >
> >> > > Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
> >> > > ---
> >> > >   Makefile | 14 +++++++++++---
> >> > >   1 file changed, 11 insertions(+), 3 deletions(-)
> >> >
> >> > Note that this change broke builds in the Chrome OS build system
> >> > because we require modules to be installed to a certain path and we
> >> > weren't passing "INSTALL_MOD_PATH" when we called "make install".
> >> >
> >> > We can certainly fix our build system (I have a patch at
> >> > https://crrev.com/c/2237511 for it), but I do wonder if others will
> >> > hit the same issue.  Others might not have such a nice sandboxing
> >> > system so they might unknowingly try to install files to the build
> >> > computer's modules directory instead of their target.
> >> >
> >>
> >> I am more concerned with people getting errors such as
> >>
> >> mkdir: cannot create directory '/lib/modules/5.7.0+/': Permission
> >> denied
> >>
> >> when running "make install", with no documentation or explanation that
> >> or why INSTALL_MOD_PATH is now mandatory for non-root installations.
> >> Even for root installations, it seems odd that "make install" now
> >> installs module files; after all, this is what "make modules_install"
> >> is for.
> >>
> >> I can understand the use case for CONFIG_MODULES=n, but the impact and
> >> changed behavior on systems with CONFIG_MODULES=y is quite unexpected.
> >>
> >> Guenter
> >
> >
> > Sorry, I led this patch in a wrong way.
> >
> > Maybe, we should allow 'make modules_install' for CONFIG_MODULES=n
> > as Jonas did in v1.
> >
> >
> > Another way might be to install it
> > in /boot/modules.builtin.(ver) when CONFIG_MODULES=n
> > but checking multiple locations would be inconvenient.
>
> I have noticed that my build system specified INSTALL_MOD_PATH for "make
> install", so the patch doesn't cause issues in my environment.
>
> However, I should have noticed that the change is breaking some existing
> setups.
>
> Masahiro, I still believe that the approach you favored (v2) makes more
> sense architecturally, but at this point it seems that v1 is more
> pragmatic.
>
> Would you agree to revert v2 and apply v1 instead?


Yes, I agree.

Thanks.


> I will fix issues that may come up with v1, however unlikely.
>


-- 
Best Regards
Masahiro Yamada
