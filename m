Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CCF34BFC1
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Mar 2021 01:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhC1XSs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Mar 2021 19:18:48 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33852 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhC1XSn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Mar 2021 19:18:43 -0400
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 12SNIVPg030116
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Mar 2021 08:18:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 12SNIVPg030116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616973511;
        bh=f9EJkysLwp3pvhhrWTkcaxf0QBTfNStpd5N7vlTG4Rg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DX+/muN9YPOuOwj+6T0ER/ATn2xsHmpmuGYKA3j20tInnAg8twzWYk+cRxhFBJF4A
         G5g7EOmR9K8vGbtxgKn0SAY84l54q4ZwlpJztuT85H5WuONF5eURSfpqJdhSARhVqI
         zugJrXz5gKm7ibAO3jzusSBK8S82zLgwtfydYrA7ZuYgJxiXa6NdZGNqoFScuJ13od
         t9mNlou25f3Suj/ohlfMA0s9l7zwC6RWQGHLBtJ8Z8HRNCnUgETQ3fxqxBzKAz6F6z
         Xi/pemWNKQlA+tNVU7e3q2ZKoRgX9EkBl7IWx1Qq7qaO4+A5VS6c/mcpZTXgYhjAA7
         Ama8ZTA93sjsA==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id il9-20020a17090b1649b0290114bcb0d6c2so6847033pjb.0
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Mar 2021 16:18:31 -0700 (PDT)
X-Gm-Message-State: AOAM532B/wvWb0Aql+jDCSvpK4AdHGdvys0aWlzWMWjzC72RMIkiOViJ
        2Yc5sxBOghjy8aL8Bb6Vd+1+dQO3owooR63KftM=
X-Google-Smtp-Source: ABdhPJyFvbLE5FnLSeyQJuzWsJf5WS1nwmRLFiidtePeSr7EoRLovgeLtrTdUrWRW+0ji18BIwbSbjmpDO7deLUkwOQ=
X-Received: by 2002:a17:90a:3b0e:: with SMTP id d14mr24265661pjc.198.1616973510439;
 Sun, 28 Mar 2021 16:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <202103290524.GyaqJAZU-lkp@intel.com>
In-Reply-To: <202103290524.GyaqJAZU-lkp@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 29 Mar 2021 08:17:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDFcaN9YWB5a3HTHrPnZfj1OvRftGORY3WV55ABC4K6Q@mail.gmail.com>
Message-ID: <CAK7LNARDFcaN9YWB5a3HTHrPnZfj1OvRftGORY3WV55ABC4K6Q@mail.gmail.com>
Subject: Re: [kbuild:kbuild 14/16] Error: kernelrelease not valid - run 'make
 prepare' to update it
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 29, 2021 at 6:47 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   3f482040592dd9aec4578cb49af7664f4a8375d4
> commit: b0600f0d9b549348ec6516be2596eb81cd04c55d [14/16] kbuild: check the minimum assembler version in Kconfig
> config: x86_64-randconfig-a015-20210329 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 821547cabb5819ed42245376a9afcd11cdee5ddd)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?id=b0600f0d9b549348ec6516be2596eb81cd04c55d
>         git remote add kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>         git fetch --no-tags kbuild kbuild
>         git checkout b0600f0d9b549348ec6516be2596eb81cd04c55d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> Error: kernelrelease not valid - run 'make prepare' to update it
> --
>    clang -no-integrated-as --prefix=/usr/bin/ -Werror=unknown-warning-option: unknown assembler invoked
>    scripts/Kconfig.include:50: Sorry, this assembler is not supported.
>    make[3]: *** [scripts/kconfig/Makefile:63: syncconfig] Error 1
>    make[2]: *** [Makefile:617: syncconfig] Error 2
>    make[1]: *** [Makefile:726: include/config/auto.conf.cmd] Error 2
>    make[1]: Failed to remake makefile 'include/config/auto.conf.cmd'.
>    make[1]: Failed to remake makefile 'include/config/auto.conf'.
>    make[1]: *** [arch/x86/Makefile:283: checkbin] Error 1
> >> Error: kernelrelease not valid - run 'make prepare' to update it
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:215: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202103290524.GyaqJAZU-lkp%40intel.com.

I will fix as follows:

Author: Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon Mar 29 08:17:03 2021 +0900

    fix

    Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

diff --git a/scripts/as-version.sh b/scripts/as-version.sh
index 11f1e7b24bff..8b9410e329df 100755
--- a/scripts/as-version.sh
+++ b/scripts/as-version.sh
@@ -45,7 +45,7 @@ orig_args="$@"
 # Get the first line of the --version output.
 IFS='
 '
-set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o
/dev/null 2>&1)
+set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o
/dev/null 2>/dev/null)

 # Split the line on spaces.
 IFS=' '


-- 
Best Regards
Masahiro Yamada
