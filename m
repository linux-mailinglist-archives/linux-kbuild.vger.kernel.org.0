Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B795C1C05DF
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2020 21:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgD3TKP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 15:10:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726375AbgD3TKP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 15:10:15 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5C9C2054F;
        Thu, 30 Apr 2020 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588273813;
        bh=WQLpEl3rCyzmrmNEo8NAfjgPykV4n6E5CzPZAgGu7FM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k5aJ+zOSc/KLuUq2cKnlKL+vtsoU91Sw1YI9mXffNuxjYY+Wo869B67R4KEhqOG20
         7f2LjtJRN7qzqj/YenuBh0k/M4e5sEYxbhFfTaKe0NhuIC4siScmrB2qs4rY4OWOAQ
         zrcHXoPxMocwyN/IHJO+hXyMWgzKRvUkrgw4ejgc=
Date:   Thu, 30 Apr 2020 21:10:09 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: bug: Kbuild seems to require "make prepare-objtool" in order to
 use (some) new config vars
Message-ID: <20200430211009.3fef03f3@coco.lan>
In-Reply-To: <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
References: <20200430131715.32c1a1f6@coco.lan>
        <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
        <20200430184948.27191975@coco.lan>
        <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Fri, 1 May 2020 02:20:13 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> On Fri, May 1, 2020 at 1:49 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Thu, 30 Apr 2020 22:51:48 +0900
> > Masahiro Yamada <masahiroy@kernel.org> escreveu:
> >  
> > > Hi Mauro,
> > >
> > >
> > > On Thu, Apr 30, 2020 at 8:17 PM Mauro Carvalho Chehab
> > > <mchehab+huawei@kernel.org> wrote:  
> > > >
> > > > Hi Masahiro,
> > > >
> > > > Not sure if this was already reported (or eventually fixed) upstream.
> > > >
> > > > While doing a Kconfig reorg on media, I noticed a few weird things,
> > > > requiring me to call, on a few situations, "make modules_prepare"
> > > > manually after some changes.
> > > >
> > > > I'm now working on a patchset to yet to be merged upstream aiming to
> > > > resurrect a driver from staging. It is currently on this tree
> > > > (with is based at the media development tree, on the top of 5.7-rc1):
> > > >
> > > >         https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
> > > >
> > > > There, I was able to identify a misbehavior that it is probably
> > > > what forced me to need calling "make modules_prepare".
> > > >
> > > > The atomisp driver is on a very bad shape. Among its problems, it has a
> > > > set of header definitions that should be different for two different
> > > > variants of the supported devices. In order to be able to compile for
> > > > either one of the variants, I added a new config var:
> > > > CONFIG_VIDEO_ATOMISP_ISP2401.
> > > >
> > > > The problem is that calling just
> > > >
> > > >         ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401
> > > >
> > > > or
> > > >         ./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401  
> > >
> > >
> > > scripts/config does not take the dependency into consideration
> > > at all.
> > >
> > > You need to enable/disable other options that it depends on.  
> >
> > Yes, I know. on my tests, I did a "make allyesconfig" before
> > the patch whose added this dependency. So, the only dependency
> > left to be enabled or disabled was this one.
> >
> > The problem I'm pointing is not really do a select recursion
> > (that would be a really cool feature, but I know it is not
> > trivial), but, instead, that, despite the config var was
> > there, when I tried to build it with:
> >
> >         make clean; make M=drivers/staging/media/atomisp
> >
> > It didn't do the right thing. Instead, it used ISP2401=y
> > on make clean and ISP2401=n at the drivers build.
> >
> > So, in order to test if patches won't break building,
> > depending on the value of this var, I'm currently doing:
> >
> >         cls;./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make prepare-objtool && make clean && make M=drivers/staging/media/atomisp && ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make prepare-objtool && make clean && make M=drivers/staging/media/atomisp
> >
> > (note the alien "make prepare-objtool" in the middle)
> >
> >  
> > > ./scripts/config -e STAGING -e STAGING_MEDIA -e MEDIA_SUPPORT -e
> > > MEDIA_CONTROLLER -e INTEL_ATOMISP -e VIDEOBUF_VMALLOC -e VIDEO_ATOMISP
> > > -d MEDIA_SUPPORT_FILTER -e VIDEO_DEV -e VIDEO_V4L2 -e
> > > VIDEO_ATOMISP_ISP2401
> > >
> > > allows me to enable VIDEO_ATOMISP_ISP2401.
> > >
> > >
> > > It is painful to debug such complicated dependency graph, though.  
> >
> > Yeah, dependencies at the media subsystem are usually quite complex.
> >  
> > > >
> > > > is not enough anymore for the build to actually use the new config value.
> > > >
> > > > It just keeps silently using the old config value.
> > > >
> > > > I double-checked it by adding this macro at the Makefile:
> > > >
> > > >         $(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP2401) ************)
> > > >
> > > > The Makefile doesn't see the change, except if I explicitly call
> > > > "make modules_prepare" or "make prepare-objtool".
> > > >
> > > > Even calling "make oldconfig" doesn't make it use the new CONFIG_*  
> > >
> > >
> > > I do not know.
> > >
> > > I cannot look into it without detailed steps to reproduce it.  
> >
> > I'm applying the enclosed patch to this branch:
> >
> >         https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
> >
> > and running this:
> >
> >         $ make allyesconfig 2>/dev/null >/dev/null; echo "disable";./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make M=drivers/staging/media/atomisp && ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && echo "enable" && make clean && make M=drivers/staging/media/atomisp
> >         disable
> >
> >           WARNING: Symbol version dump ./Module.symvers
> >                    is missing; modules will have no dependencies and modversions.
> >
> >         ************ ISP2401: y ************
> >           AR      drivers/staging/media/atomisp/built-in.a
> >         ************ ISP2401: y ************
> >           MODPOST 0 modules
> >         enable
> >         ************ ISP2401:  ************
> >
> >           WARNING: Symbol version dump ./Module.symvers
> >                    is missing; modules will have no dependencies and modversions.
> >
> >         ************ ISP2401: y ************
> >           AR      drivers/staging/media/atomisp/built-in.a
> >         ************ ISP2401: y ************
> >           MODPOST 0 modules
> >
> > PS.: the same occurs if I use "make allmodconfig".  
> 
> 
> 
> This is the expected behavior.
> 
> The problem is that you immediately compile the module after
> you tweak the .config file.
> 
> Kbuild does not use the .config file directly.
> Instead, it uses include/config/auto.conf.
> 
> 
> The M= builds never touch the in-kernel build artifacts,
> so it includes the stale include/config/auto.conf

I'm pretty sure that this used to work in the past.

Can't we have something similar to[1]:

	include/config/auto.conf: .config

in order to force auto.conf to be re-generated if the .config file
was modified?

[1] yeah, I know that the above won't work currently, because of the
ifdefs, but perhaps something like this could be done inside the
"if KBUILD_EXTMOD" part of the Makefile.

> After you change the .config, you must run 'make modules_prepare'
> at least.
> 
> This is documented in 'make help'.
> 
> 
>   modules_prepare - Set up for building external modules

Yeah, I noticed this new target on more recent Kernels. I was not
familiar with this "new" concept of "external"[2].

Maybe the text should be changed to something like:

   modules_prepare - Should be called before using "make M=<module dir>"

To make it clearer. Yet, having to call it *every time* a
Kconfig option has changed, doesn't seem right. The
building system could be smarter and re-build auto.conf if
it is older than .config file, or, at least, emit a WARNING, if
the file is not synchronized.


[2] Not sure if this still works, but, in the past (2.x), it was 
possible to setup an out-of-tree external tree with just a new 
driver. Then use "make modules" to build those external OOT 
modules. For historical reasons, still have at linuxtv.org 
one such tree:

	 https://linuxtv.org/hg/v4l-dvb/file/tip
	

Thanks,
Mauro
