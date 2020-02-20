Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02CD16552C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2020 03:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgBTCkd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Feb 2020 21:40:33 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17334 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbgBTCkd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 21:40:33 -0500
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 01K2eI2F000430
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Feb 2020 11:40:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 01K2eI2F000430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582166419;
        bh=gVDvA6WEq6+9xUChuOpdvu/qUus7uaSw/iTkQtqFaQI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yYEu45ByreBXynLUagnK21JB8Wlh207n2ixfj8xgdvUb5T6vx2K2lgFqRMHagjiKQ
         0oAfR7JNLw8nuQJVwTc9Rb3waK8VDNTeq4hq3EHMFNgTmdhQjNeYducvCuMTvme1gL
         f2DopVAnet0uv8rrxVVSAycx+vKpuwYrW3HYj4JqwUzofod9mpYoiUFdlgPcamTft+
         sBHoAKp5I0sxHqYhbWjK4npAZ+628WBPjiuEM1gnMr+SzfDbTsGh72g66p4+uga1cq
         IeW2hk/MC3r/+Tai5xJs3sm0/uFdsvnifvQSQvayk+QuqUH3c1SCBd/7B3mRf7l67E
         XUWrm6zHQkgMw==
X-Nifty-SrcIP: [209.85.221.172]
Received: by mail-vk1-f172.google.com with SMTP id t129so775259vkg.6
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Feb 2020 18:40:18 -0800 (PST)
X-Gm-Message-State: APjAAAUoaARUubuzGP5DTwcDDVdOnsCqkvv80u4QsMFAy3XNVn4GDZ7b
        cu8SXiH9Tght2+sMWBOJJ8UsrUszmLt66HUNbXY=
X-Google-Smtp-Source: APXvYqyfjUu/p0HZLUrWQ9Vx8I5TRpMbW2Qw3Fi/kbVaRrZMKswzHtFitWufRwRL37N105HjCxrBqjTFfpFVQHptmvA=
X-Received: by 2002:a1f:1bc3:: with SMTP id b186mr13311848vkb.96.1582166417409;
 Wed, 19 Feb 2020 18:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20200217012741.22100-2-masahiroy@kernel.org> <202002200725.lfEcxTej%lkp@intel.com>
In-Reply-To: <202002200725.lfEcxTej%lkp@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 20 Feb 2020 11:39:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMfv-JzbX1PMy4J6H1XGVPO7s-6Gy6QF2KevKvKjGcoA@mail.gmail.com>
Message-ID: <CAK7LNARMfv-JzbX1PMy4J6H1XGVPO7s-6Gy6QF2KevKvKjGcoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add -Wall to KBUILD_HOSTCXXFLAGS
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 20, 2020 at 8:37 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Masahiro,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on kbuild/for-next]
> [also build test WARNING on kbuild/kconfig linux/master linus/master v5.6-rc2 next-20200219]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Masahiro-Yamada/kconfig-remove-unused-variable-in-qconf-cc/20200219-035229
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: i386-randconfig-a003-20200219 (attached as .config)
> compiler: gcc-5 (Ubuntu 5.5.0-12ubuntu1) 5.5.0 20171010
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts//gcc-plugins/gcc-common.h:9,
>                     from scripts//gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\



Thanks for the report.
This is a warning from the toolchain headers.
I cannot fix it.

I do not see this warning on newer GCC.







>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts//gcc-plugins/gcc-common.h:9,
>                     from scripts//gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
> --
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/randomize_layout_plugin.c:19:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:27,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
>          |                     ^
>    /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/randomize_layout_plugin.c:19:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    In file included from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/tm.h:48,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/gcc-plugin.h:31,
>                     from /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/plugin.h:23,
>                     from scripts/gcc-plugins/gcc-common.h:9,
>                     from scripts/gcc-plugins/cyc_complexity_plugin.c:21:
> >> /usr/lib/gcc/x86_64-linux-gnu/5/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
>      126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
>          |                        ^
>    Cyclomatic Complexity 1 scripts/mod/devicetable-offsets.c:main
>    Cyclomatic Complexity 1 kernel/bounds.c:main
>    Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets_32.c:foo
>    Cyclomatic Complexity 1 arch/x86/kernel/asm-offsets.c:common
>    51 real  8 user  9 sys  33.65% cpu   make prepare
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Best Regards
Masahiro Yamada
