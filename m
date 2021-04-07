Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A93357510
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 21:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236517AbhDGTl6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 15:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236301AbhDGTl5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 15:41:57 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2501C06175F
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Apr 2021 12:41:47 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id e10so5513362pls.6
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Apr 2021 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wjpLZJAP8ODkOI6RVsD0JKJ4FjWnlxV4QLszMGiVHq4=;
        b=QsjUlY5xevUJL2fig0Uj27ongzXDSYWEdRrCtN255vUmp5nzlGeZTRVFOzToOjCMI1
         igt/QNjRwruaIY60+d9ahn3OAgeLDvOGqyzU0IrxBiheKCA8pf2Djr6HpvjUwpTcLrGM
         JSmXg6kQS4e31TIrsh4Mf5kmwAcKB45lwURzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wjpLZJAP8ODkOI6RVsD0JKJ4FjWnlxV4QLszMGiVHq4=;
        b=rEM9uvParrlKePfY59EAm7OihJlULow8Dv7mg6u/DKFm5kMiELx321MGeG30EE/Ls1
         8KodLR4m1HZDaKm/rv5DLD+9GVjJo4W4mWZfs0txjq2j4nJMbxQR2DUtoYk3SlMyliCm
         Yjz0p0XRF7i9KFdPjI8OgUmhYo74XQJcvHEFTj62am3jtOABk3oSHUVQxCtVJ43NtWVr
         9qNnG9BPBHkXzpegeiUlBp/1ntanbKJ5HbV+VVGCffRRctOdC4yoHooRcnVaJ1Iz65dp
         +UDdKHXRfZ9R+Hej/dcKJhMwviWCNdO5WCqJKLEcJJUQWVei9CWHP2c3KWE8wAHdM5VY
         nLoA==
X-Gm-Message-State: AOAM533CRDeSOQ/ShopiuOzW+iFCPjqWO6jMr/hsdu5/RjuCOM9ylsdD
        aTcltb503DJnUNpAwfbGA206Mg==
X-Google-Smtp-Source: ABdhPJy3YzHzlbtgHWUicyJIEw+XU2sO1OtxQtdU/87LiMH3Ry9/uvmuw5PuhceWShum7fd7hdFxSA==
X-Received: by 2002:a17:90b:1490:: with SMTP id js16mr4638576pjb.131.1617824507237;
        Wed, 07 Apr 2021 12:41:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q95sm6017353pjq.20.2021.04.07.12.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 12:41:46 -0700 (PDT)
Date:   Wed, 7 Apr 2021 12:41:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        kbuild-all@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: arm-linux-gnueabi-ld: warning: orphan section
 `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being
 placed in section `__cpuidle_method_of_table'
Message-ID: <202104071241.DDD60D1B49@keescook>
References: <202104071815.lq85YO6c-lkp@intel.com>
 <CAKwvOdnrSorkpCCshZAav=1rczSTWa5Ji_Nhcd=vzmywAiCoNQ@mail.gmail.com>
 <CAK8P3a0NX4bpQUdHBhpo1s2PU465WjAOAPPzifeHuvFGi20NMw@mail.gmail.com>
 <CAKwvOdmcKrHqxkS540CZ=24irC5+o=EH_3RkTTQA-Uk9qh43YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmcKrHqxkS540CZ=24irC5+o=EH_3RkTTQA-Uk9qh43YQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 11:28:08AM -0700, Nick Desaulniers wrote:
> On Wed, Apr 7, 2021 at 11:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Wed, Apr 7, 2021 at 8:07 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > On Wed, Apr 7, 2021 at 3:52 AM kernel test robot <lkp@intel.com> wrote:
> > > >
> > > > Hi Kees,
> > > >
> > > > FYI, the error/warning still remains.
> > > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > head:   2d743660786ec51f5c1fefd5782bbdee7b227db0
> > > > commit: 5a17850e251a55bba6d65aefbfeacfa9888cd2cd arm/build: Warn on orphan section placement
> > > > date:   7 months ago
> > > > config: arm-randconfig-r033-20210407 (attached as .config)
> > > > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > > > reproduce (this is a W=1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > > >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > > >         git fetch --no-tags linus master
> > > >         git checkout 5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > > >         # save the attached .config to linux build tree
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm
> > > >
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> > > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> > > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> > >
> > > Looks like arch/arm/include/asm/cpuidle.h defines
> > > `CPUIDLE_METHOD_OF_DECLARE` to create a static struct in such a
> > > section.  Only arch/arm/mach-omap2/pm33xx-core.c uses that macro.
> >
> > Nick, Kees,
> >
> > Should I resend my patch, or are you taking care of it?
> >
> > https://lore.kernel.org/lkml/20201230155506.1085689-1-arnd@kernel.org/T/#u
> 
> Your patch looks like it has multiple reviewed-by tags, so it should
> be ready to be submitted/merged? Waiting on anything else?

Yeah, that looks ready to go. Does that go via SoC tree or arm32 tree?

-- 
Kees Cook
