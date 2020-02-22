Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74381168DED
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 10:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgBVJBW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Feb 2020 04:01:22 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:33864 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727134AbgBVJBV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 04:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RpZcQI36sIpFnTJVOgXdjKqzqSFSCF+iUbjqElC6oQ8=; b=D8r9jsZVG3w8NN9fYw7zNPx1V
        cQyNh68SZ0bYtwOrNm1q+b4jGCdcXW4AHcQ9IPKb6ALr76dS5xaXpPs1L9KAiRZf42xdl/WZBhFAM
        k954f7ytWHsaBQtpmTGe+twZ3vwiP5iZR9AAY2Ea4gEPQclE+7Y+Svcuo+eIZqDcy9A2ktEsdK6le
        Wu4FqYf4pxNsdpMcMYhde8qdFakzIJvxJvVfu29E4qRCCImvK7Ge4WfdN8yT8MaG7qkpU93DobGi/
        h2hDAuyb2ZEbJ8jgIyd+pxkmedYdnIGVpRLZVwbBmImKHfet1it6ckLfqqxUum9PHQh7juga65zcl
        oI40ec+HA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55348)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1j5Qew-0006np-QY; Sat, 22 Feb 2020 09:01:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1j5Qev-0004M9-A4; Sat, 22 Feb 2020 09:01:13 +0000
Date:   Sat, 22 Feb 2020 09:01:13 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Message-ID: <20200222090113.GM25745@shell.armlinux.org.uk>
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
 <20200222003820.220854-1-alex_y_xu@yahoo.ca>
 <CAK7LNARNEu2gVBVDpRtbha_n=RWWfcQu57LtO=CbLBXLU9Ds-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARNEu2gVBVDpRtbha_n=RWWfcQu57LtO=CbLBXLU9Ds-g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 22, 2020 at 11:07:14AM +0900, Masahiro Yamada wrote:
> On Sat, Feb 22, 2020 at 9:40 AM Alex Xu (Hello71) <alex_y_xu@yahoo.ca> wrote:
> >
> > -pipe reduces unnecessary disk wear for systems where /tmp is not a
> > tmpfs, slightly increases compilation speed, and avoids leaving behind
> > files when gcc crashes.
> >
> > According to the gcc manual, "this fails to work on some systems where
> > the assembler is unable to read from a pipe; but the GNU assembler has
> > no trouble". We already require GNU ld on all platforms, so this is not
> > an additional dependency. LLVM as also supports pipes.
> >
> > -pipe has always been used for most architectures, this change
> > standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
> > affected.
> >
> > Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
> 
> <snip>
> 
> > diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> > index 20e9ab6cc521..b6a2f553771c 100644
> > --- a/arch/arc/Makefile
> > +++ b/arch/arc/Makefile
> > @@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
> >  CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
> >  endif
> >
> > -cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
> > +cflags-y       += -fno-common -fno-builtin -mmedium-calls -D__linux__
> >  cflags-$(CONFIG_ISA_ARCOMPACT) += -mA7
> >  cflags-$(CONFIG_ISA_ARCV2)     += -mcpu=hs38
> >
> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index db857d07114f..7711467e0797 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -21,7 +21,6 @@ KBUILD_LDS_MODULE     += $(srctree)/arch/arm/kernel/module.lds
> >  endif
> >
> >  GZFLAGS                :=-9
> > -#KBUILD_CFLAGS +=-pipe
> 
> 
> This was commented out by a very old commit,
> which is available in the historical git tree.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=ce20ed858a20f6f04de475cae79e40d3697f4776
> 
> But, I could not parse the reason from the commit message.
> Russell, do you remember why?

-pipe may reduce the disk load but increases the CPU load, so it's an
option that's up to the build environment.  One may wish to pass a
lower parralellism when using -pipe to make to mitigate that, but both
options are up to the build environment to decide upon.

If we unconditionally add -pipe, then we take away choice.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
