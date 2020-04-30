Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DDD1C03C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2020 19:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgD3RVH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 13:21:07 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54297 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbgD3RVG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 13:21:06 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 03UHKnKI029138;
        Fri, 1 May 2020 02:20:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 03UHKnKI029138
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588267250;
        bh=idO+PYcTkrBz1ObTdwrdbsSBqMQ+50mQZ94ZeAp+P/o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uP+Vt2DBQqTUpgrqE87lFRDHSBL6hPCLcr1BA1Ynf9wBb5JDsks3LCTd6nX956S3j
         Mk6NrtnZgZqPRn3smlQhA/VecUy3IjcXXC9EYVYiWV8HysHwGaEDX6l3kkOpFVNDCD
         tf2A1c6LCqo14yV82lPq27gC1ysMN47I+Yl9HUhwsRTO5sIofIBIbUx3cjx3bTV95M
         fQkhFvAvjXSxH82nfo7eyAg/3wpUNzcuHFIKQFYpXQiOY4gcZ/6XeCfDMB5mrWxUNo
         ddW/6eWgHy9C+SOcvmAxHeqZqopGPeTtVuCA6Rmaf+1NzKw8YXW5T1mlInIVQD06Yf
         GAC5frx+hxtmQ==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id z1so4540548vsn.11;
        Thu, 30 Apr 2020 10:20:50 -0700 (PDT)
X-Gm-Message-State: AGi0PuaPZmy5Yx6yN/NPPGlWGK7d1QCMKAoBBY5NTjBY0N3P8Rt2Jsgu
        DtgEFanC5WZ6Hh6YX3rYaiGGZUieS+yLNZL0WQc=
X-Google-Smtp-Source: APiQypLaXg5iWTN+9RN6U1M6KCPary9ZZvUbEEvqouDEsArTUokkiuHp39Ss8noi9EjdWgfULUl9e5c85d5slO5Uqz8=
X-Received: by 2002:a67:e94d:: with SMTP id p13mr4348692vso.215.1588267248970;
 Thu, 30 Apr 2020 10:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200430131715.32c1a1f6@coco.lan> <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
 <20200430184948.27191975@coco.lan>
In-Reply-To: <20200430184948.27191975@coco.lan>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 02:20:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
Message-ID: <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
Subject: Re: bug: Kbuild seems to require "make prepare-objtool" in order to
 use (some) new config vars
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 1, 2020 at 1:49 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Thu, 30 Apr 2020 22:51:48 +0900
> Masahiro Yamada <masahiroy@kernel.org> escreveu:
>
> > Hi Mauro,
> >
> >
> > On Thu, Apr 30, 2020 at 8:17 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > Not sure if this was already reported (or eventually fixed) upstream.
> > >
> > > While doing a Kconfig reorg on media, I noticed a few weird things,
> > > requiring me to call, on a few situations, "make modules_prepare"
> > > manually after some changes.
> > >
> > > I'm now working on a patchset to yet to be merged upstream aiming to
> > > resurrect a driver from staging. It is currently on this tree
> > > (with is based at the media development tree, on the top of 5.7-rc1):
> > >
> > >         https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Dato=
misp_v2
> > >
> > > There, I was able to identify a misbehavior that it is probably
> > > what forced me to need calling "make modules_prepare".
> > >
> > > The atomisp driver is on a very bad shape. Among its problems, it has=
 a
> > > set of header definitions that should be different for two different
> > > variants of the supported devices. In order to be able to compile for
> > > either one of the variants, I added a new config var:
> > > CONFIG_VIDEO_ATOMISP_ISP2401.
> > >
> > > The problem is that calling just
> > >
> > >         ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401
> > >
> > > or
> > >         ./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401
> >
> >
> > scripts/config does not take the dependency into consideration
> > at all.
> >
> > You need to enable/disable other options that it depends on.
>
> Yes, I know. on my tests, I did a "make allyesconfig" before
> the patch whose added this dependency. So, the only dependency
> left to be enabled or disabled was this one.
>
> The problem I'm pointing is not really do a select recursion
> (that would be a really cool feature, but I know it is not
> trivial), but, instead, that, despite the config var was
> there, when I tried to build it with:
>
>         make clean; make M=3Ddrivers/staging/media/atomisp
>
> It didn't do the right thing. Instead, it used ISP2401=3Dy
> on make clean and ISP2401=3Dn at the drivers build.
>
> So, in order to test if patches won't break building,
> depending on the value of this var, I'm currently doing:
>
>         cls;./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make prep=
are-objtool && make clean && make M=3Ddrivers/staging/media/atomisp && ./sc=
ripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make prepare-objtool && mak=
e clean && make M=3Ddrivers/staging/media/atomisp
>
> (note the alien "make prepare-objtool" in the middle)
>
>
> > ./scripts/config -e STAGING -e STAGING_MEDIA -e MEDIA_SUPPORT -e
> > MEDIA_CONTROLLER -e INTEL_ATOMISP -e VIDEOBUF_VMALLOC -e VIDEO_ATOMISP
> > -d MEDIA_SUPPORT_FILTER -e VIDEO_DEV -e VIDEO_V4L2 -e
> > VIDEO_ATOMISP_ISP2401
> >
> > allows me to enable VIDEO_ATOMISP_ISP2401.
> >
> >
> > It is painful to debug such complicated dependency graph, though.
>
> Yeah, dependencies at the media subsystem are usually quite complex.
>
> > >
> > > is not enough anymore for the build to actually use the new config va=
lue.
> > >
> > > It just keeps silently using the old config value.
> > >
> > > I double-checked it by adding this macro at the Makefile:
> > >
> > >         $(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP2401) =
************)
> > >
> > > The Makefile doesn't see the change, except if I explicitly call
> > > "make modules_prepare" or "make prepare-objtool".
> > >
> > > Even calling "make oldconfig" doesn't make it use the new CONFIG_*
> >
> >
> > I do not know.
> >
> > I cannot look into it without detailed steps to reproduce it.
>
> I'm applying the enclosed patch to this branch:
>
>         https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Datomisp=
_v2
>
> and running this:
>
>         $ make allyesconfig 2>/dev/null >/dev/null; echo "disable";./scri=
pts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make M=3Ddrivers/staging/medi=
a/atomisp && ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && echo "enab=
le" && make clean && make M=3Ddrivers/staging/media/atomisp
>         disable
>
>           WARNING: Symbol version dump ./Module.symvers
>                    is missing; modules will have no dependencies and modv=
ersions.
>
>         ************ ISP2401: y ************
>           AR      drivers/staging/media/atomisp/built-in.a
>         ************ ISP2401: y ************
>           MODPOST 0 modules
>         enable
>         ************ ISP2401:  ************
>
>           WARNING: Symbol version dump ./Module.symvers
>                    is missing; modules will have no dependencies and modv=
ersions.
>
>         ************ ISP2401: y ************
>           AR      drivers/staging/media/atomisp/built-in.a
>         ************ ISP2401: y ************
>           MODPOST 0 modules
>
> PS.: the same occurs if I use "make allmodconfig".



This is the expected behavior.

The problem is that you immediately compile the module after
you tweak the .config file.

Kbuild does not use the .config file directly.
Instead, it uses include/config/auto.conf.


The M=3D builds never touch the in-kernel build artifacts,
so it includes the stale include/config/auto.conf


After you change the .config, you must run 'make modules_prepare'
at least.

This is documented in 'make help'.


  modules_prepare - Set up for building external modules


--=20
Best Regards
Masahiro Yamada
