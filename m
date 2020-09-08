Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12D92607C8
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Sep 2020 02:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgIHArM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Sep 2020 20:47:12 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64981 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbgIHArK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Sep 2020 20:47:10 -0400
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0880ksmM027875
        for <linux-kbuild@vger.kernel.org>; Tue, 8 Sep 2020 09:46:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0880ksmM027875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599526015;
        bh=KfqYFsb64ZBTORYbeaeCocdqzg5EgJuZJ7rI/5YLFKU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AXchgfh1/VqHtbJQwBVBhmu92GtjaYXYSp+cklh+wwT4/sFlYIw0IR6M8D9EVEca3
         oLGyKBALmiD9Dq9ZuWqdnNaWyYimMIK7s1/gnNGUK/H8M6AvaQvDk8hgF6hezgdzW3
         ERTBWP+GckXMvjq6q3/USb2+iRehn8uKeySPvL1YS/54c3Qjop+l2K5gcZ9+NMjdBP
         ZX3JirlTtYkEzjqxU28HIvHLi44tlALsvJVA4FtQXlsZuWBwhGJIMB0x3rIh8241uE
         tdiqu+jwH+JBffVprntiPtFDFNitXDOs3BScH+KfW2xOPLroHPrNA+hvamfeP3sisj
         YDrTNpVkV2xfg==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id d9so3244521pfd.3
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Sep 2020 17:46:55 -0700 (PDT)
X-Gm-Message-State: AOAM532nboZjjvD+gG6bIwnUM7l/36vrST53gHBYqRF1RZ+VWUbrXNB3
        cjyzLqDWXPR4Y+VH7f+ANUb5CCtwRZjPrX2evbc=
X-Google-Smtp-Source: ABdhPJzkKWyZ58ECY/xU0nPWb+80kwnyPvY7dVZ3T6KRJKhabuWJNCIbGtefCTEu+Am+4vMlH/AEUPjQjU586Vz50OQ=
X-Received: by 2002:a62:7a53:: with SMTP id v80mr8350398pfc.129.1599526014320;
 Mon, 07 Sep 2020 17:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <202009080532.aH8qq297%lkp@intel.com>
In-Reply-To: <202009080532.aH8qq297%lkp@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 8 Sep 2020 09:46:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNARKSEv+G4yy2k2u33kgLb316GYObCe8zKwwWdOyW7FHpQ@mail.gmail.com>
Message-ID: <CAK7LNARKSEv+G4yy2k2u33kgLb316GYObCe8zKwwWdOyW7FHpQ@mail.gmail.com>
Subject: Re: [kbuild:kbuild 14/14] scripts/module.lds.S:29:10: fatal error:
 'asm/module.lds.h' file not found
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi, 0day bot.

Now I realized my commit is not working reliably
for parallel builds.

I will consider what to do.

Thanks for the report.


On Tue, Sep 8, 2020 at 6:36 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5
> commit: 8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5 [14/14] kbuild: preprocess module linker script
> config: s390-randconfig-r015-20200907 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project ab68517e6b7e51b84c4b0e813a30258ec1ce5da5)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         git checkout 8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> scripts/module.lds.S:29:10: fatal error: 'asm/module.lds.h' file not found
>    #include <asm/module.lds.h>
>             ^~~~~~~~~~~~~~~~~~
>    1 error generated.
>    make[2]: *** [scripts/Makefile.build:377: scripts/module.lds] Error 1
>    make[2]: Target '__build' not remade because of errors.
>    make[1]: *** [Makefile:1192: scripts] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:185: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>
> # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5
> git remote add kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> git fetch --no-tags kbuild kbuild
> git checkout 8d77c9acc14a49e4175d7e0d3ce1e256cd31c5a5
> vim +29 scripts/module.lds.S
>
>     27
>     28  /* bring in arch-specific sections */
>   > 29  #include <asm/module.lds.h>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Best Regards
Masahiro Yamada
