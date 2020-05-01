Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354EE1C0C24
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 04:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgEACcd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 22:32:33 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:34289 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbgEACcd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 22:32:33 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0412WEMr006917;
        Fri, 1 May 2020 11:32:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0412WEMr006917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588300335;
        bh=yrr78h9HkaQu75AGwSiVtR9mY0FnYBsVLLeJjF6O95c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TQ+9tRK/vvv5UPirS78lsBuo7aT1CqGQ3kl/plKC5ZfxTx7+PJdHrBCqp3fCZdRyB
         06soZgeAUt87RJY6hrOBLYP+7lSk6hbxJuoVxB59Z92mA75DRc4LzsNe062g2fTCCL
         4JpxOE2696u5yEU5ylYBoNsbV6lwok7FYBlGTGt1tRJnCBUo4Q96q2Zw9FCXC3i5Qm
         RRZnckkjk4O+q6b3OBmOlRK1bT+IS6cEiMyssleEpUIpm4XxCJT5+k0DOiwK/mKcYU
         BM/3hkTBpW4phRrQpIWhbR2xBD9H1EJ0K7hdjVxQIHoSQ68ZfdNVrc+/joeVwApF0t
         KzhqXa5UBu57Q==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id b5so5581107vsb.1;
        Thu, 30 Apr 2020 19:32:15 -0700 (PDT)
X-Gm-Message-State: AGi0Pua00xkpBhHfbsEAreGaPMQpUc4quIDZgu4qIAkCNOSD+e51MP00
        JRDSZAvmN/w0AVtIhAV+gqwRawUJTLzgWVguMR8=
X-Google-Smtp-Source: APiQypLFZWlnXJT7Y7lXFQXy/2YaWGHBdEdXT9ipt0EOXxksQIOdHjf1NMbZvTUE95JCs0WyonYnG6YieBSDvDf6JFA=
X-Received: by 2002:a05:6102:240f:: with SMTP id j15mr1827213vsi.155.1588300333975;
 Thu, 30 Apr 2020 19:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200430131715.32c1a1f6@coco.lan> <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
 <20200430184948.27191975@coco.lan> <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
 <20200430211009.3fef03f3@coco.lan>
In-Reply-To: <20200430211009.3fef03f3@coco.lan>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 11:31:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNC0HSMx9z-tQS1+Kd=_x6Sa3ohXv5-cXP_n5XUz3jPA@mail.gmail.com>
Message-ID: <CAK7LNAQNC0HSMx9z-tQS1+Kd=_x6Sa3ohXv5-cXP_n5XUz3jPA@mail.gmail.com>
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

On Fri, May 1, 2020 at 4:10 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 1 May 2020 02:20:13 +0900
> Masahiro Yamada <masahiroy@kernel.org> escreveu:
>
> > On Fri, May 1, 2020 at 1:49 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Em Thu, 30 Apr 2020 22:51:48 +0900
> > > Masahiro Yamada <masahiroy@kernel.org> escreveu:
> > >
> > > > Hi Mauro,
> > > >
> > > >
> > > > On Thu, Apr 30, 2020 at 8:17 PM Mauro Carvalho Chehab
> > > > <mchehab+huawei@kernel.org> wrote:
> > > > >
> > > > > Hi Masahiro,
> > > > >
> > > > > Not sure if this was already reported (or eventually fixed) upstr=
eam.
> > > > >
> > > > > While doing a Kconfig reorg on media, I noticed a few weird thing=
s,
> > > > > requiring me to call, on a few situations, "make modules_prepare"
> > > > > manually after some changes.
> > > > >
> > > > > I'm now working on a patchset to yet to be merged upstream aiming=
 to
> > > > > resurrect a driver from staging. It is currently on this tree
> > > > > (with is based at the media development tree, on the top of 5.7-r=
c1):
> > > > >
> > > > >         https://git.linuxtv.org/mchehab/experimental.git/log/?h=
=3Datomisp_v2
> > > > >
> > > > > There, I was able to identify a misbehavior that it is probably
> > > > > what forced me to need calling "make modules_prepare".
> > > > >
> > > > > The atomisp driver is on a very bad shape. Among its problems, it=
 has a
> > > > > set of header definitions that should be different for two differ=
ent
> > > > > variants of the supported devices. In order to be able to compile=
 for
> > > > > either one of the variants, I added a new config var:
> > > > > CONFIG_VIDEO_ATOMISP_ISP2401.
> > > > >
> > > > > The problem is that calling just
> > > > >
> > > > >         ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401
> > > > >
> > > > > or
> > > > >         ./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401
> > > >
> > > >
> > > > scripts/config does not take the dependency into consideration
> > > > at all.
> > > >
> > > > You need to enable/disable other options that it depends on.
> > >
> > > Yes, I know. on my tests, I did a "make allyesconfig" before
> > > the patch whose added this dependency. So, the only dependency
> > > left to be enabled or disabled was this one.
> > >
> > > The problem I'm pointing is not really do a select recursion
> > > (that would be a really cool feature, but I know it is not
> > > trivial), but, instead, that, despite the config var was
> > > there, when I tried to build it with:
> > >
> > >         make clean; make M=3Ddrivers/staging/media/atomisp
> > >
> > > It didn't do the right thing. Instead, it used ISP2401=3Dy
> > > on make clean and ISP2401=3Dn at the drivers build.
> > >
> > > So, in order to test if patches won't break building,
> > > depending on the value of this var, I'm currently doing:
> > >
> > >         cls;./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make =
prepare-objtool && make clean && make M=3Ddrivers/staging/media/atomisp && =
./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make prepare-objtool &&=
 make clean && make M=3Ddrivers/staging/media/atomisp
> > >
> > > (note the alien "make prepare-objtool" in the middle)
> > >
> > >
> > > > ./scripts/config -e STAGING -e STAGING_MEDIA -e MEDIA_SUPPORT -e
> > > > MEDIA_CONTROLLER -e INTEL_ATOMISP -e VIDEOBUF_VMALLOC -e VIDEO_ATOM=
ISP
> > > > -d MEDIA_SUPPORT_FILTER -e VIDEO_DEV -e VIDEO_V4L2 -e
> > > > VIDEO_ATOMISP_ISP2401
> > > >
> > > > allows me to enable VIDEO_ATOMISP_ISP2401.
> > > >
> > > >
> > > > It is painful to debug such complicated dependency graph, though.
> > >
> > > Yeah, dependencies at the media subsystem are usually quite complex.
> > >
> > > > >
> > > > > is not enough anymore for the build to actually use the new confi=
g value.
> > > > >
> > > > > It just keeps silently using the old config value.
> > > > >
> > > > > I double-checked it by adding this macro at the Makefile:
> > > > >
> > > > >         $(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP24=
01) ************)
> > > > >
> > > > > The Makefile doesn't see the change, except if I explicitly call
> > > > > "make modules_prepare" or "make prepare-objtool".
> > > > >
> > > > > Even calling "make oldconfig" doesn't make it use the new CONFIG_=
*
> > > >
> > > >
> > > > I do not know.
> > > >
> > > > I cannot look into it without detailed steps to reproduce it.
> > >
> > > I'm applying the enclosed patch to this branch:
> > >
> > >         https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Dato=
misp_v2
> > >
> > > and running this:
> > >
> > >         $ make allyesconfig 2>/dev/null >/dev/null; echo "disable";./=
scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make M=3Ddrivers/staging/=
media/atomisp && ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && echo "=
enable" && make clean && make M=3Ddrivers/staging/media/atomisp
> > >         disable
> > >
> > >           WARNING: Symbol version dump ./Module.symvers
> > >                    is missing; modules will have no dependencies and =
modversions.
> > >
> > >         ************ ISP2401: y ************
> > >           AR      drivers/staging/media/atomisp/built-in.a
> > >         ************ ISP2401: y ************
> > >           MODPOST 0 modules
> > >         enable
> > >         ************ ISP2401:  ************
> > >
> > >           WARNING: Symbol version dump ./Module.symvers
> > >                    is missing; modules will have no dependencies and =
modversions.
> > >
> > >         ************ ISP2401: y ************
> > >           AR      drivers/staging/media/atomisp/built-in.a
> > >         ************ ISP2401: y ************
> > >           MODPOST 0 modules
> > >
> > > PS.: the same occurs if I use "make allmodconfig".
> >
> >
> >
> > This is the expected behavior.
> >
> > The problem is that you immediately compile the module after
> > you tweak the .config file.
> >
> > Kbuild does not use the .config file directly.
> > Instead, it uses include/config/auto.conf.
> >
> >
> > The M=3D builds never touch the in-kernel build artifacts,
> > so it includes the stale include/config/auto.conf
>
> I'm pretty sure that this used to work in the past.
>
> Can't we have something similar to[1]:
>
>         include/config/auto.conf: .config
>
> in order to force auto.conf to be re-generated if the .config file
> was modified?
>
> [1] yeah, I know that the above won't work currently, because of the
> ifdefs, but perhaps something like this could be done inside the
> "if KBUILD_EXTMOD" part of the Makefile.
>
> > After you change the .config, you must run 'make modules_prepare'
> > at least.
> >
> > This is documented in 'make help'.
> >
> >
> >   modules_prepare - Set up for building external modules
>
> Yeah, I noticed this new target on more recent Kernels. I was not
> familiar with this "new" concept of "external"[2].


The meaning of "new" depends on people.

The 'modules_prepare' target was added in 2004.

This commit:
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/=
?id=3D95065ad3fa787c417008a36d3a5d9a3bab17ab98


I do not think it is new, but you may think differently.






One more thing,
please tell me the motivation to do:

 make M=3Ddrivers/staging/media/atomisp



The main usage of M=3D is to build external modules.
If you want to compile the individual directory,
you can do this:

 make drivers/staging/media/stomisp/





>
> Maybe the text should be changed to something like:
>
>    modules_prepare - Should be called before using "make M=3D<module dir>=
"
>
> To make it clearer. Yet, having to call it *every time* a
> Kconfig option has changed, doesn't seem right. The
> building system could be smarter and re-build auto.conf if
> it is older than .config file, or, at least, emit a WARNING, if
> the file is not synchronized.
>
>
> [2] Not sure if this still works, but, in the past (2.x), it was
> possible to setup an out-of-tree external tree with just a new
> driver. Then use "make modules" to build those external OOT
> modules. For historical reasons, still have at linuxtv.org
> one such tree:
>
>          https://linuxtv.org/hg/v4l-dvb/file/tip
>
>
> Thanks,
> Mauro


--
Best Regards
Masahiro Yamada
