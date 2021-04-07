Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C8A357455
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 20:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355338AbhDGS2k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 14:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355339AbhDGS2b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 14:28:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2023FC061761
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Apr 2021 11:28:21 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id n8so11318249lfh.1
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Apr 2021 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7v85mQ+wtX28y60W6Yh/bCq1NAVwGeh0wdXBOI+Eck0=;
        b=kBjNpFLvTW7D/TPumXhvrHDqFsUPNEwDiS+AlqiuO4r7zXc9cgGhNChd78+5WzX4c8
         yDCoH/37LeKlqj/o4DxbSk2laYG46ruE+Xk3bROAosBDHNEhkvfG+JcHMd0sBqaDU/VA
         8r6Ycavg+pdSiM9MwvhTMWTj+5D7PKd5GIb6aONAGR0HkInO4pvDeNnJUWCcBZOpeM84
         SFMX/7T2NntN1Z+5PJVWzLHsdRCDQICLo/Tev2QQrntC7y2NeN2WOIIOLkW5EBuWvaJZ
         MO7OVo/azfhZUNHfw977NNxRUnVltb590RsT+CpmOIcvpekSK64W3KWFDle6YhApaWs2
         x+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7v85mQ+wtX28y60W6Yh/bCq1NAVwGeh0wdXBOI+Eck0=;
        b=WBwwF/egGIErjQRqNwuYQy09HZqXa7LuVJGpGErGT1t2pbldl3LIyCgn71FYwjORXY
         V0rgB+mCkhEG4VYHINMXd2Y2a/0NGv2laje8JDdxk9EhZCLdyc34XtnFOMLIgglN3Lwu
         IXg2gNQMk9+oh1Pl9u8vhS8ufGwHvKEKiVw1DzDrj/SowAnZLm+8qo4ysXLHm8TLglU8
         w7/94gpFBxXT/tJRm1AzM7/05gUwePBaAaCkSS6VA4tB1J/JX0HblvOzAKUkPHRVa/1R
         WraMLW0NM1LO4zbNZV0CJsnPbPaRq47g97Un9eQP7G5SiXBUjbo1QoeDsqkjkjvB+plA
         yHyw==
X-Gm-Message-State: AOAM530hVHB7QxRvvEL2ymSYuzzsMKVZ3/gQVw6RnzYkteT9oNnI9EKU
        I0n7x0eEXQhbRhTsZ1gwygjXq57p78eOiEoi/ao2BA==
X-Google-Smtp-Source: ABdhPJzJ6u+bhldxSVexmPg4Ylc3+864a5ow3rqfUvA6j5Kld+Q9PKIhGS2BsFxtsDBG5NcJN8NpPx9zXRv9i6EdDZs=
X-Received: by 2002:a05:6512:3c94:: with SMTP id h20mr3515255lfv.73.1617820099453;
 Wed, 07 Apr 2021 11:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <202104071815.lq85YO6c-lkp@intel.com> <CAKwvOdnrSorkpCCshZAav=1rczSTWa5Ji_Nhcd=vzmywAiCoNQ@mail.gmail.com>
 <CAK8P3a0NX4bpQUdHBhpo1s2PU465WjAOAPPzifeHuvFGi20NMw@mail.gmail.com>
In-Reply-To: <CAK8P3a0NX4bpQUdHBhpo1s2PU465WjAOAPPzifeHuvFGi20NMw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 7 Apr 2021 11:28:08 -0700
Message-ID: <CAKwvOdmcKrHqxkS540CZ=24irC5+o=EH_3RkTTQA-Uk9qh43YQ@mail.gmail.com>
Subject: Re: arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table'
 from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        kbuild-all@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 7, 2021 at 11:23 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Apr 7, 2021 at 8:07 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Wed, Apr 7, 2021 at 3:52 AM kernel test robot <lkp@intel.com> wrote:
> > >
> > > Hi Kees,
> > >
> > > FYI, the error/warning still remains.
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   2d743660786ec51f5c1fefd5782bbdee7b227db0
> > > commit: 5a17850e251a55bba6d65aefbfeacfa9888cd2cd arm/build: Warn on orphan section placement
> > > date:   7 months ago
> > > config: arm-randconfig-r033-20210407 (attached as .config)
> > > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > > reproduce (this is a W=1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout 5a17850e251a55bba6d65aefbfeacfa9888cd2cd
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> > > >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> >
> > Looks like arch/arm/include/asm/cpuidle.h defines
> > `CPUIDLE_METHOD_OF_DECLARE` to create a static struct in such a
> > section.  Only arch/arm/mach-omap2/pm33xx-core.c uses that macro.
>
> Nick, Kees,
>
> Should I resend my patch, or are you taking care of it?
>
> https://lore.kernel.org/lkml/20201230155506.1085689-1-arnd@kernel.org/T/#u

Your patch looks like it has multiple reviewed-by tags, so it should
be ready to be submitted/merged? Waiting on anything else?
-- 
Thanks,
~Nick Desaulniers
