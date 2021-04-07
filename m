Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435E53573EC
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 20:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355113AbhDGSHu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 14:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355116AbhDGSHt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 14:07:49 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D26C061761
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Apr 2021 11:07:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y1so21775300ljm.10
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Apr 2021 11:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5SNQQe7SDzzhVV+H2kFmmlWK21vWH8/yxUYO1nxEqu4=;
        b=hs0riZ6T4676ue38OfeGRYZTbWFL9hAfOIYxN1W76PIE+V/ACTdSbf+DYpcbqxVqwp
         a9A6U4hCotDwQcGfmX5RbJ4NlFy2JsKpCCYEPUAGLVa4nyQbgpJKs4US7ENa/Lpyhu+7
         IF2JwuHCgCAIMSaC3TlefGi4y2ecSmLv9K1lXzxbszyTtGJFaFky34CYv2p+1H1ng/CD
         f1BPll6jlCQJSzbPLThEJVE78IAW+F/Gq6bafTTu7NIqYJg7ZdEtA1pBoggyoADJymV/
         7DmW+n+PnxKqfr5LnIiPkFBZYuavnjU34YSRTGvoLFA7EMgVHTx6/TP5+mnCdTtMHW7v
         RxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5SNQQe7SDzzhVV+H2kFmmlWK21vWH8/yxUYO1nxEqu4=;
        b=lLfiVgWrIRTQ7YlAEOagYkjdmxHyxhN2MPl1UqBVLtpp2WMHDER6tKOmrVde1IiKIM
         LD6J6J2neBTxy4IFvEt2pzl431SAIZqWv21yiaucjjzx6H45Pb0CEmeCn/xtdeBY+60q
         N2y1ZoCUPqz+OKizP7ccscibB3Wv/jyEGjdsXGz72JTz68DGClsI8/fwjC/or5dDiObw
         pRyY85t00GvuZVQNSOJzL5I1fBi8V1tF2DQGNjQJIJ1JzeMNK0Q46PtuiGJKsJp+nLDQ
         THwsfzzkjOXKkK5/jdkOPLlgW+JQGS48wr0cZ7fHDRSKLWi8jaRDs2kIGdrFvy2rMlY/
         i9JA==
X-Gm-Message-State: AOAM533bYqt+gzNJaPCelDd22nd86uwVKuh1p8s7z7h+r/yQ0qoncSQH
        BOyoTbutPbacTtLmDO5HFXI9rK2w4z7PwOT3zVvhTw==
X-Google-Smtp-Source: ABdhPJwJNOvYgYm1lfahzlzGZfuIteWu/SZcJyO6DVlEOPM0ttQZT0pogKKbVmd3rhrpn4mb4fjMih/XAhat5Oh5dbU=
X-Received: by 2002:a2e:b008:: with SMTP id y8mr2809573ljk.233.1617818857479;
 Wed, 07 Apr 2021 11:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <202104071815.lq85YO6c-lkp@intel.com>
In-Reply-To: <202104071815.lq85YO6c-lkp@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 7 Apr 2021 11:07:26 -0700
Message-ID: <CAKwvOdnrSorkpCCshZAav=1rczSTWa5Ji_Nhcd=vzmywAiCoNQ@mail.gmail.com>
Subject: Re: arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table'
 from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
To:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 7, 2021 at 3:52 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Kees,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2d743660786ec51f5c1fefd5782bbdee7b227db0
> commit: 5a17850e251a55bba6d65aefbfeacfa9888cd2cd arm/build: Warn on orphan section placement
> date:   7 months ago
> config: arm-randconfig-r033-20210407 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5a17850e251a55bba6d65aefbfeacfa9888cd2cd
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 5a17850e251a55bba6d65aefbfeacfa9888cd2cd
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'
> >> arm-linux-gnueabi-ld: warning: orphan section `__cpuidle_method_of_table' from `arch/arm/mach-omap2/pm33xx-core.o' being placed in section `__cpuidle_method_of_table'

Looks like arch/arm/include/asm/cpuidle.h defines
`CPUIDLE_METHOD_OF_DECLARE` to create a static struct in such a
section.  Only arch/arm/mach-omap2/pm33xx-core.c uses that macro.

>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Thanks,
~Nick Desaulniers
