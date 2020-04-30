Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABEC1C0318
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2020 18:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgD3Qty (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Apr 2020 12:49:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbgD3Qtx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 12:49:53 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF4CB2070B;
        Thu, 30 Apr 2020 16:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588265392;
        bh=rrqyhDXZvaRI55kXE596WWcMbLXCGBsFYJWpaCrpcT8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GXsK31RT7r7njvrtShK7RogKxNlSQZN/y0gLg8HdjAmOZCNmUTKDIqd+XLLOoZsnA
         a08RMqCIqo0y/AYOM+hrrN7yEBfGM8vX2Tqkh8MtQ5KeahoDYK8whVJwsZwJbM23ij
         LwM1m16QwaMnL2aY+qYkL/GLlKoX9Ec2yaek+9Zs=
Date:   Thu, 30 Apr 2020 18:49:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: bug: Kbuild seems to require "make prepare-objtool" in order to
 use (some) new config vars
Message-ID: <20200430184948.27191975@coco.lan>
In-Reply-To: <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
References: <20200430131715.32c1a1f6@coco.lan>
        <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Thu, 30 Apr 2020 22:51:48 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> Hi Mauro,
> 
> 
> On Thu, Apr 30, 2020 at 8:17 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Hi Masahiro,
> >
> > Not sure if this was already reported (or eventually fixed) upstream.
> >
> > While doing a Kconfig reorg on media, I noticed a few weird things,
> > requiring me to call, on a few situations, "make modules_prepare"
> > manually after some changes.
> >
> > I'm now working on a patchset to yet to be merged upstream aiming to
> > resurrect a driver from staging. It is currently on this tree
> > (with is based at the media development tree, on the top of 5.7-rc1):
> >
> >         https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2
> >
> > There, I was able to identify a misbehavior that it is probably
> > what forced me to need calling "make modules_prepare".
> >
> > The atomisp driver is on a very bad shape. Among its problems, it has a
> > set of header definitions that should be different for two different
> > variants of the supported devices. In order to be able to compile for
> > either one of the variants, I added a new config var:
> > CONFIG_VIDEO_ATOMISP_ISP2401.
> >
> > The problem is that calling just
> >
> >         ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401
> >
> > or
> >         ./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401  
> 
> 
> scripts/config does not take the dependency into consideration
> at all.
> 
> You need to enable/disable other options that it depends on.

Yes, I know. on my tests, I did a "make allyesconfig" before
the patch whose added this dependency. So, the only dependency
left to be enabled or disabled was this one.

The problem I'm pointing is not really do a select recursion
(that would be a really cool feature, but I know it is not
trivial), but, instead, that, despite the config var was
there, when I tried to build it with:

	make clean; make M=drivers/staging/media/atomisp

It didn't do the right thing. Instead, it used ISP2401=y
on make clean and ISP2401=n at the drivers build.

So, in order to test if patches won't break building,
depending on the value of this var, I'm currently doing:

	cls;./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make prepare-objtool && make clean && make M=drivers/staging/media/atomisp && ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && make prepare-objtool && make clean && make M=drivers/staging/media/atomisp

(note the alien "make prepare-objtool" in the middle)


> ./scripts/config -e STAGING -e STAGING_MEDIA -e MEDIA_SUPPORT -e
> MEDIA_CONTROLLER -e INTEL_ATOMISP -e VIDEOBUF_VMALLOC -e VIDEO_ATOMISP
> -d MEDIA_SUPPORT_FILTER -e VIDEO_DEV -e VIDEO_V4L2 -e
> VIDEO_ATOMISP_ISP2401
> 
> allows me to enable VIDEO_ATOMISP_ISP2401.
> 
> 
> It is painful to debug such complicated dependency graph, though.

Yeah, dependencies at the media subsystem are usually quite complex.

> >
> > is not enough anymore for the build to actually use the new config value.
> >
> > It just keeps silently using the old config value.
> >
> > I double-checked it by adding this macro at the Makefile:
> >
> >         $(info ************ ISP2401: $(CONFIG_VIDEO_ATOMISP_ISP2401) ************)
> >
> > The Makefile doesn't see the change, except if I explicitly call
> > "make modules_prepare" or "make prepare-objtool".
> >
> > Even calling "make oldconfig" doesn't make it use the new CONFIG_*  
> 
> 
> I do not know.
> 
> I cannot look into it without detailed steps to reproduce it.

I'm applying the enclosed patch to this branch:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=atomisp_v2

and running this:

	$ make allyesconfig 2>/dev/null >/dev/null; echo "disable";./scripts/config -d CONFIG_VIDEO_ATOMISP_ISP2401 && make M=drivers/staging/media/atomisp && ./scripts/config -e CONFIG_VIDEO_ATOMISP_ISP2401 && echo "enable" && make clean && make M=drivers/staging/media/atomisp
	disable

	  WARNING: Symbol version dump ./Module.symvers
	           is missing; modules will have no dependencies and modversions.
	
	************ ISP2401: y ************
	  AR      drivers/staging/media/atomisp/built-in.a
	************ ISP2401: y ************
	  MODPOST 0 modules
	enable
	************ ISP2401:  ************

	  WARNING: Symbol version dump ./Module.symvers
        	   is missing; modules will have no dependencies and modversions.

	************ ISP2401: y ************
	  AR      drivers/staging/media/atomisp/built-in.a
	************ ISP2401: y ************
	  MODPOST 0 modules

PS.: the same occurs if I use "make allmodconfig".

Thanks,
Mauro


diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index b0a396cb6bb3..f796cfce2f72 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -1,9 +1,11 @@
 #
 # Makefile for camera drivers.
 #
-obj-$(CONFIG_INTEL_ATOMISP) += i2c/
-obj-$(CONFIG_INTEL_ATOMISP) += platform/
-obj-$(CONFIG_VIDEO_ATOMISP) += atomisp.o
+
+# HACK: disable all builds
+#obj-$(CONFIG_INTEL_ATOMISP) += i2c/
+#obj-$(CONFIG_INTEL_ATOMISP) += platform/
+#obj-$(CONFIG_VIDEO_ATOMISP) += atomisp.o
 
 atomisp = $(srctree)/drivers/staging/media/atomisp/
 

