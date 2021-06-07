Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E63F39D5DA
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 09:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhFGHX1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 03:23:27 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33249 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGHXZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 03:23:25 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M76jv-1likFO0kgx-008ebl for <linux-kbuild@vger.kernel.org>; Mon, 07 Jun 2021
 09:21:33 +0200
Received: by mail-wr1-f41.google.com with SMTP id l2so16360348wrw.6
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Jun 2021 00:21:33 -0700 (PDT)
X-Gm-Message-State: AOAM532CxzEmEMXByHbavLgkkOXza60RFebNlERaR0exo3RnIRQ/rVJE
        jWJ9pPGHFAEebzcYBQRBJjSVqbwlO01c1eZYFzQ=
X-Google-Smtp-Source: ABdhPJygvi9pZ3xbyxVL+FM0xPyrnPSKsFkolXYa9USvk7iCRttWrDcMsI0oAxQRwmU1k33qwT0etbARk3MfiL48ZIc=
X-Received: by 2002:adf:a28c:: with SMTP id s12mr16204373wra.105.1623050492884;
 Mon, 07 Jun 2021 00:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <202106051816.t4mlM0Df-lkp@intel.com> <CAK8P3a2cXLWD0m6+k4bcfRwOOM9QhusjSFtaV7EMC2wuh1+UEQ@mail.gmail.com>
 <c3e78409-f321-d0dc-67b1-d2a8d3dd24e2@intel.com>
In-Reply-To: <c3e78409-f321-d0dc-67b1-d2a8d3dd24e2@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 7 Jun 2021 09:19:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2pAKiKACZ_kazXEWMffqbgZV_ZeQ27z8PSy3YbLGQPxA@mail.gmail.com>
Message-ID: <CAK8P3a2pAKiKACZ_kazXEWMffqbgZV_ZeQ27z8PSy3YbLGQPxA@mail.gmail.com>
Subject: Re: [linux-next:master 6856/7430] hppa64-linux-ld:
 init/do_mounts.o(.text.unlikely+0x88): cannot reach dump_page
To:     Rong Chen <rong.a.chen@intel.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Helge Deller <deller@gmx.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Philip Li <philip.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xNL4FexmGOMZebU08h3AFI8Dv0AXjCI96zoXWwT9hl6T4rMzWL7
 QvgZ1RNYDQMbxz9j+4gCa69NtZOhGnY4VoTQWrVL6dkWj02sS6IhHD5KsYkI2xOcW6Ngg5S
 0LHyQVCLxFtxB3bjyGG62Df+7OUXkI3dy6LDRrBCdhmFRtCpy8+kC4EiSdQySfiqbL+iwbq
 g77vV8xyseHxVuw7SRdeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1BQx9/+XsUc=:A7wroxDAJv8t9q2L1JwitC
 p8qysyqohW1BuI8Yisj8NZ3pwEMvWOwY03jqkpOmksc2rMNhzHSi7BC1I5jIrv/T1tGmUALpz
 DH61wxjc6Gg9vTDB65+lP8B4DZCvXifF+VVPKUo8g04IJLPJ5DEVUL3Xy1+C61Ed2XVFZ6HPa
 qSxrn/pTZFql2Su3HUbVx6C76uCqVaSZBPlL7yvHDrNtsKcelxh/S2f/ta4Ny4zryeNnRHsOz
 g7eaLIXcceCg5blwIjbSKAP2Z6du/ioko8+3rHph54n8oV09yab4QUjRUSG9klEMoWqAu1NAK
 XZvVU0bbPw6jfECVmnuvrLRfN5To+/loaSD1dJaR9p1xJeGs0LkZWX3gj3iyS40lmd1s/2EMB
 kZ1W6AIoyOl6JcYwgPF1n413Xme3iRVO/qaEuv0hHyJmQMG2hM8Rwgq/Z2oKGAwJdk9F2P0xH
 L+95GPsF4bEvWAsWFavjYcLVBfNwEowTLoQh2Zc9FPOhxWvNAMYYmyIOvgz3FjtVeHI1e5N5G
 NU8OKZJL5/syslq+P+H2cw=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 7, 2021 at 8:27 AM Rong Chen <rong.a.chen@intel.com> wrote:
> On 6/5/21 7:08 PM, Arnd Bergmann wrote:
> > On Sat, Jun 5, 2021 at 12:59 PM kernel test robot <lkp@intel.com> wrote:
> >> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >> head:   ccc252d2e818f6a479441119ad453c3ce7c7c461
> >> commit: 2ada05c3a46dda2e2b065a02307c0c6268d9678f [6856/7430] Merge remote-tracking branch 'asm-generic/master'
> >> config: parisc-randconfig-r012-20210604 (attached as .config)
> >> compiler: hppa64-linux-gcc (GCC) 9.3.0
> >> reproduce (this is a W=1 build):
> >>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>          chmod +x ~/bin/make.cross
> >>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ada05c3a46dda2e2b065a02307c0c6268d9678f
> >>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >>          git fetch --no-tags linux-next master
> >>          git checkout 2ada05c3a46dda2e2b065a02307c0c6268d9678f
> >>          # save the attached .config to linux build tree
> >>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc
> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> > Helge Deller already fixed this problem with commit 778e45d7720d
> > ("parisc: E
>
> We will ignore the error firstly, I'm a little confused, who can handle
> the randconfig failures if COMPILE_TEST=n?

The failures that you only see with COMPILE_TEST=n are the ones that
someone has previously decided can not be handled properly, for one
reason or another, examples include:

- rebuilding generated files that require additional tools to be
installed on the host,
  e.g. CONFIG_PREVENT_FIRMWARE_BUILD
- configurations that may or may not work but result in excessive
compiler warnings
  that are not otherwise interesting, e.g. GCC_PLUGIN_CYC_COMPLEXITY
- options that enable compile-time warnings about pointless configurations
  such as leaving out support for every machine
- options that are unlikely to have an effect on testing but slow down the build
  time (e.g. CONFIG_DEBUG_INFO) for build bots finite hardware resources.

On the primary architectures, randconfig builds with 'make -s' should generally
result in no output from the build, and I would consider any output
you get a bug.
When COMPILE_TEST is disabled, there are countless known issues in
configurations that make no practical sense.

        Arnd
