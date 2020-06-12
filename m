Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413011F7431
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2020 08:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgFLG5K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 02:57:10 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:42315 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgFLG5K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 02:57:10 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05C6upa2023595
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 15:56:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05C6upa2023595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591945011;
        bh=t7HJD0GIioC0xkU3zVIfVUd8i6Sffde7p04+jfeWRhg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VYLxhas+ONIZoQf41Goj4g/pm0tSXVgqCWsQS0evOQJ/XN/Agj8KwJl4eZn7Yzw9X
         mUPAXpQ9+pmAXHD15CVTWCPYgcPKS8H8Qqi3HhcDerfIMV5re6inqCbgrQh1F00XM+
         WHJ6O0uhQmfsGPsz0AVH/uG8c9BPgT97FOC2P0brfkeuQCKT19j7Jt37FSBqCD4E29
         X6kKyRLbcmiS/S1SGJqPpbeWBIPCUwPuuWQ3PM+KcoKb82I+PuVtiilGDX2Dog7Urd
         1A6MYvK6Cg33oNUiK2PDuMNg/zHoob+vyjYksxcBaw3oI3FHMT3K1cQ6V8RVOI01qu
         xFRrWT7RjDxGQ==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id m25so4732998vsp.8
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jun 2020 23:56:51 -0700 (PDT)
X-Gm-Message-State: AOAM532kF7eeMY8Xl4t5T0KYavjYrg1VGqzm667hev+8JFY+YfRVHYrv
        gLs13LO5NiFAmwH3NTknIm55U0V/EoYcUllXBpA=
X-Google-Smtp-Source: ABdhPJwctPPAhREBmY4jhOwBykLuFbFRtMhclpBASNvx1Lbg/tPtMedQpT9YBmBZiSyK/Dw7JqgFkaXc4Z8Kh554pjc=
X-Received: by 2002:a67:6383:: with SMTP id x125mr9648404vsb.54.1591945010507;
 Thu, 11 Jun 2020 23:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
 <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
 <3cd1a050fe692425352745672295033c@talpidae.net> <CAD=FV=WPW_o4ExmNUHe=2mYHLheKMfGTemW8CCiN4iQ7X3fAYw@mail.gmail.com>
 <CABXOdTdH7eRaMwn0A9Ej=Z-+qTVzO6bsrh3c6-0JtTsWgM=zbQ@mail.gmail.com>
In-Reply-To: <CABXOdTdH7eRaMwn0A9Ej=Z-+qTVzO6bsrh3c6-0JtTsWgM=zbQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 12 Jun 2020 15:56:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASPBpycdovHqTm2wshZvuGJ2wLBDnOObZqqb+dOYboQMA@mail.gmail.com>
Message-ID: <CAK7LNASPBpycdovHqTm2wshZvuGJ2wLBDnOObZqqb+dOYboQMA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: install modules.builtin even if CONFIG_MODULES=n
To:     Guenter Roeck <groeck@google.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 10, 2020 at 2:31 AM Guenter Roeck <groeck@google.com> wrote:
>
> On Tue, Jun 9, 2020 at 9:38 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Jun 3, 2020 at 9:33 AM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
> > >
> > > Many applications check for available kernel features via:
> > >
> > >   - /proc/modules (loaded modules, present if CONFIG_MODULES=y)
> > >   - $(MODLIB)/modules.builtin (builtin modules)
> > >
> > > They fail to detect features if the kernel was built with
> > > CONFIG_MODULES=n
> > > and modules.builtin isn't installed.
> > >
> > > Therefore, add the target "_builtin_inst_" and make "install" and
> > > "modules_install" depend on it.
> > >
> > > Tests results:
> > >
> > >   - make install: kernel image is copied as before, modules.builtin
> > > copied
> > >   - make modules_install: (CONFIG_MODULES=n) nothing is copied, exit 1
> > >
> > > Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
> > > ---
> > >   Makefile | 14 +++++++++++---
> > >   1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > Note that this change broke builds in the Chrome OS build system
> > because we require modules to be installed to a certain path and we
> > weren't passing "INSTALL_MOD_PATH" when we called "make install".
> >
> > We can certainly fix our build system (I have a patch at
> > https://crrev.com/c/2237511 for it), but I do wonder if others will
> > hit the same issue.  Others might not have such a nice sandboxing
> > system so they might unknowingly try to install files to the build
> > computer's modules directory instead of their target.
> >
>
> I am more concerned with people getting errors such as
>
> mkdir: cannot create directory '/lib/modules/5.7.0+/': Permission denied
>
> when running "make install", with no documentation or explanation that
> or why INSTALL_MOD_PATH is now mandatory for non-root installations.
> Even for root installations, it seems odd that "make install" now
> installs module files; after all, this is what "make modules_install"
> is for.
>
> I can understand the use case for CONFIG_MODULES=n, but the impact and
> changed behavior on systems with CONFIG_MODULES=y is quite unexpected.
>
> Guenter


Sorry, I led this patch in a wrong way.

Maybe, we should allow 'make modules_install' for CONFIG_MODULES=n
as Jonas did in v1.


Another way might be to install it
in /boot/modules.builtin.(ver) when CONFIG_MODULES=n
but checking multiple locations would be inconvenient.



-- 
Best Regards
Masahiro Yamada
