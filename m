Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8C23AC0C9
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Jun 2021 04:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233637AbhFRCdG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Jun 2021 22:33:06 -0400
Received: from mga04.intel.com ([192.55.52.120]:11565 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231289AbhFRCdG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jun 2021 22:33:06 -0400
IronPort-SDR: RdTuxbtgfOfeQ5BfNt4hFuC4puLPFFVn90lGrsI3DRcIjg24JT9ep0VC5oLlex1ylPbyey6p96
 fINABxTcZpuQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="204654692"
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="204654692"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 19:30:57 -0700
IronPort-SDR: LNeRt7jcTgmZlUFvpESLy6HA+G0PZ5HL8MhZtrJewFA7LvAtcqfgcFBDpBo6CDPy0r5Ck5Nil/
 nLym5qVldoFg==
X-IronPort-AV: E=Sophos;i="5.83,281,1616482800"; 
   d="scan'208";a="485524622"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 19:30:55 -0700
Subject: Re: [linux-next:master 6856/7430] hppa64-linux-ld:
 init/do_mounts.o(.text.unlikely+0x88): cannot reach dump_page
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Helge Deller <deller@gmx.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Philip Li <philip.li@intel.com>
References: <202106051816.t4mlM0Df-lkp@intel.com>
 <CAK8P3a2cXLWD0m6+k4bcfRwOOM9QhusjSFtaV7EMC2wuh1+UEQ@mail.gmail.com>
 <c3e78409-f321-d0dc-67b1-d2a8d3dd24e2@intel.com>
 <CAK8P3a2pAKiKACZ_kazXEWMffqbgZV_ZeQ27z8PSy3YbLGQPxA@mail.gmail.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <46eaef63-0e65-94fa-2400-39524faf32c6@intel.com>
Date:   Fri, 18 Jun 2021 10:30:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2pAKiKACZ_kazXEWMffqbgZV_ZeQ27z8PSy3YbLGQPxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 6/7/21 3:19 PM, Arnd Bergmann wrote:
> On Mon, Jun 7, 2021 at 8:27 AM Rong Chen <rong.a.chen@intel.com> wrote:
>> On 6/5/21 7:08 PM, Arnd Bergmann wrote:
>>> On Sat, Jun 5, 2021 at 12:59 PM kernel test robot <lkp@intel.com> wrote:
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>>> head:   ccc252d2e818f6a479441119ad453c3ce7c7c461
>>>> commit: 2ada05c3a46dda2e2b065a02307c0c6268d9678f [6856/7430] Merge remote-tracking branch 'asm-generic/master'
>>>> config: parisc-randconfig-r012-20210604 (attached as .config)
>>>> compiler: hppa64-linux-gcc (GCC) 9.3.0
>>>> reproduce (this is a W=1 build):
>>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>           chmod +x ~/bin/make.cross
>>>>           # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ada05c3a46dda2e2b065a02307c0c6268d9678f
>>>>           git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>>>           git fetch --no-tags linux-next master
>>>>           git checkout 2ada05c3a46dda2e2b065a02307c0c6268d9678f
>>>>           # save the attached .config to linux build tree
>>>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Helge Deller already fixed this problem with commit 778e45d7720d
>>> ("parisc: E
>> We will ignore the error firstly, I'm a little confused, who can handle
>> the randconfig failures if COMPILE_TEST=n?
> The failures that you only see with COMPILE_TEST=n are the ones that
> someone has previously decided can not be handled properly, for one
> reason or another, examples include:
>
> - rebuilding generated files that require additional tools to be
> installed on the host,
>    e.g. CONFIG_PREVENT_FIRMWARE_BUILD
> - configurations that may or may not work but result in excessive
> compiler warnings
>    that are not otherwise interesting, e.g. GCC_PLUGIN_CYC_COMPLEXITY
> - options that enable compile-time warnings about pointless configurations
>    such as leaving out support for every machine
> - options that are unlikely to have an effect on testing but slow down the build
>    time (e.g. CONFIG_DEBUG_INFO) for build bots finite hardware resources.
>
> On the primary architectures, randconfig builds with 'make -s' should generally
> result in no output from the build, and I would consider any output
> you get a bug.
> When COMPILE_TEST is disabled, there are countless known issues in
> configurations that make no practical sense.
>
>          Arnd

Hi Arnd,

Thanks for the detailed explanation, and we have asked advice of 
internal developers,
we'll enable COMPILE_TEST for randconfig, and check the failures if 
COMPILE_TEST=n
in future.

BTW is there any issue that found by randconfig with COMPILE_TEST=n 
should be reported?

Best Regards,
Rong Chen
