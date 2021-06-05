Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B86639C7B2
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Jun 2021 13:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhFELML (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Jun 2021 07:12:11 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:55881 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFELMK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Jun 2021 07:12:10 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MIxmm-1m4FvD2OWw-00KPsU for <linux-kbuild@vger.kernel.org>; Sat, 05 Jun
 2021 13:10:21 +0200
Received: by mail-wr1-f47.google.com with SMTP id c9so3127674wrt.5
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Jun 2021 04:10:21 -0700 (PDT)
X-Gm-Message-State: AOAM531UCotOLC6DHQhR3z2FCSo6XCxPdn5HX6mnYQGntOkYvVtY56FZ
        98GlieSSSVDWDEvZveSxFtVTElA0UvSE2lIYYQE=
X-Google-Smtp-Source: ABdhPJzMu84fMZ8q/OTCrQYpDs9iwX0Xw/zThD30vmIyoMLDLDU6660+xepaE8HRr6/VPmzZNoc3XJQh7PfZy4mI1IY=
X-Received: by 2002:adf:a28c:: with SMTP id s12mr8493310wra.105.1622891420949;
 Sat, 05 Jun 2021 04:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <202106051816.t4mlM0Df-lkp@intel.com>
In-Reply-To: <202106051816.t4mlM0Df-lkp@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 5 Jun 2021 13:08:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2cXLWD0m6+k4bcfRwOOM9QhusjSFtaV7EMC2wuh1+UEQ@mail.gmail.com>
Message-ID: <CAK8P3a2cXLWD0m6+k4bcfRwOOM9QhusjSFtaV7EMC2wuh1+UEQ@mail.gmail.com>
Subject: Re: [linux-next:master 6856/7430] hppa64-linux-ld:
 init/do_mounts.o(.text.unlikely+0x88): cannot reach dump_page
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Helge Deller <deller@gmx.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Philip Li <philip.li@intel.com>,
        Rong Chen <rong.a.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:GR2Wl6QGA9htwRtoWMkh8yLZO8It8x/SxI/Boy7UK32LcnrvqV0
 wke60XUpZAPzvaye6MiyjdN4Fph9y9v0xYpO9mOS1ZqaF7moLzPRGfHWrB3ZsmqGQuIbJkD
 Oo93+hmYtkV6MAnbgowvYOXpEErVk8cRBEG3DE82sfzAJ3xkJW6krAY9+Sy+t63Ntn9i2yN
 tqWegsxW9Hly1eXO1cEBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VJewo2AY6JI=:6rp5HL4p/Bp9lOYur2VtOd
 320WUBXsvpKv0FVctVKoEB7Z1YP/r9SR3/ctXL8i/6P7vw8BoiRpBhUWtOWBi2C0oG6yJEwjK
 3B5NezhRoXvY3zWpoTMq5gx7qS9pkulQJxGGpfcfhYOiZPH02oRCroWN3VZdTcuDoiIvhdBzH
 JwGIV1C+H3P/j8mQmjThABftDtqKNFctqe8gtGVidGivpdlsbrLceHu6N80X55KfSCwJ0aisV
 shlW1b7aT1/GodQVn7wos1k7VVF4h/nyUCLccQxyRu2saVg4cC54BhUW2t7eCYbcq6jWODLoy
 D36qeWAeBHYuXjcODgT0M6Wv2BAs02q42UxnyzIAKJgC/AHRJ7OUxoSz0oBiCowtSG5aYQXZY
 qo/EmPvccE2+dmd2UKyC/v9ZwDLkn/tSVKLCKmXTds970M9Upk8QvTAwaBVi/J5SdqNAl2I0b
 JDv9Zy7KG7NB+YcmoDxvIaS3gytaOawRw1ixMP8n2H7ZZnuqz9ac0250cBU6DNgzge1qvUrMy
 rvXSvIwrlRMGpl7ESN6ND37Z14Ak9FVwJAhmxK2qkZgmJqRA1tidOAZZl0LjHB8qSzXqHFOu0
 fGPmfDpDZVp01IxDxohib6N2b4JxaQwjDuaadHscPMXVcSUrB0mbQcZMLwTtHHLD4E0yQB/d2
 zMdA=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 5, 2021 at 12:59 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ccc252d2e818f6a479441119ad453c3ce7c7c461
> commit: 2ada05c3a46dda2e2b065a02307c0c6268d9678f [6856/7430] Merge remote-tracking branch 'asm-generic/master'
> config: parisc-randconfig-r012-20210604 (attached as .config)
> compiler: hppa64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ada05c3a46dda2e2b065a02307c0c6268d9678f
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 2ada05c3a46dda2e2b065a02307c0c6268d9678f
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Helge Deller already fixed this problem with commit 778e45d7720d
("parisc: Enable -mlong-calls
gcc option with CONFIG_COMPILE_TEST"), so randconfig builds with
CONFIG_COMPILE_TEST
turned on don't run into link failures with overly large kernels.

> All errors (new ones prefixed by >>):
>
>    hppa64-linux-ld: init/main.o(.init.text+0xb08): cannot reach panic
>    init/main.o: in function `initcall_blacklist':
>    (.init.text+0xb08): relocation truncated to fit: R_PARISC_PCREL22F against symbol `panic' defined in .text.unlikely section in kernel/panic.o
>    hppa64-linux-ld: init/main.o(.init.text+0xcd0): cannot reach rest_init
>    init/main.o: in function `arch_call_rest_init':
>    (.init.text+0xcd0): relocation truncated to fit: R_PARISC_PCREL22F against symbol `rest_init' defined in .ref.text section in init/main.o
>    hppa64-linux-ld: init/main.o(.init.text+0x1154): cannot reach panic
>    init/main.o: in function `start_kernel':
>    (.init.text+0x1154): relocation truncated to fit: R_PARISC_PCREL22F against symbol `panic' defined in .text.unlikely section in kernel/panic.o
>    hppa64-linux-ld: init/main.o(.init.text+0x128c): cannot reach build_all_zonelists
>    (.init.text+0x128c): relocation truncated to fit: R_PARISC_PCREL22F against symbol `build_all_zonelists' defined in .ref.text section in mm/page_alloc.o

The specific set of errors is completely random, so any patch that
changes the size of the
kernel will trigger this output.

I think the best solution would be for Kconfig to enforce that
CONFIG_COMPILE_TEST is
set to =y when running 'make randconfig'. I had previously discussed
this with Rong
and Philip, who preferred to not enforce COMPILE_TEST=y on the lkp setup because
other users doing randconfig builds might still run into the same issues.

An alternative would be to just not send out emails about randconfig
failures that
happen only with COMPILE_TEST=n.

      Arnd
