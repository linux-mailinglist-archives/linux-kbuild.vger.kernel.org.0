Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D860B39D4EE
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 08:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhFGG32 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 02:29:28 -0400
Received: from mga09.intel.com ([134.134.136.24]:28782 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhFGG32 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 02:29:28 -0400
IronPort-SDR: UQRsPjCiFG1l+BRMJCCjK8ok+0Mk47E5oSa9fKDG0FohYhB2jQ9+HewahqHOQA3HvrMgOQInZ9
 +Eu/+CgfMRjw==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="204539598"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="204539598"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2021 23:27:35 -0700
IronPort-SDR: KjHmY4LqdeKq3oTyNrNTuvKmiqnjB11Hq0/bfQgQlClE2VqE6gtgzlJmcbsRNoSCS0RI8Yx0b4
 9m4CHc8mYvbg==
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="447377068"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.11]) ([10.239.13.11])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2021 23:27:33 -0700
Subject: Re: [linux-next:master 6856/7430] hppa64-linux-ld:
 init/do_mounts.o(.text.unlikely+0x88): cannot reach dump_page
To:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Helge Deller <deller@gmx.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Philip Li <philip.li@intel.com>
References: <202106051816.t4mlM0Df-lkp@intel.com>
 <CAK8P3a2cXLWD0m6+k4bcfRwOOM9QhusjSFtaV7EMC2wuh1+UEQ@mail.gmail.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <c3e78409-f321-d0dc-67b1-d2a8d3dd24e2@intel.com>
Date:   Mon, 7 Jun 2021 14:27:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2cXLWD0m6+k4bcfRwOOM9QhusjSFtaV7EMC2wuh1+UEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 6/5/21 7:08 PM, Arnd Bergmann wrote:
> On Sat, Jun 5, 2021 at 12:59 PM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   ccc252d2e818f6a479441119ad453c3ce7c7c461
>> commit: 2ada05c3a46dda2e2b065a02307c0c6268d9678f [6856/7430] Merge remote-tracking branch 'asm-generic/master'
>> config: parisc-randconfig-r012-20210604 (attached as .config)
>> compiler: hppa64-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ada05c3a46dda2e2b065a02307c0c6268d9678f
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 2ada05c3a46dda2e2b065a02307c0c6268d9678f
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
> Helge Deller already fixed this problem with commit 778e45d7720d
> ("parisc: Enable -mlong-calls
> gcc option with CONFIG_COMPILE_TEST"), so randconfig builds with
> CONFIG_COMPILE_TEST
> turned on don't run into link failures with overly large kernels.
>
>> All errors (new ones prefixed by >>):
>>
>>     hppa64-linux-ld: init/main.o(.init.text+0xb08): cannot reach panic
>>     init/main.o: in function `initcall_blacklist':
>>     (.init.text+0xb08): relocation truncated to fit: R_PARISC_PCREL22F against symbol `panic' defined in .text.unlikely section in kernel/panic.o
>>     hppa64-linux-ld: init/main.o(.init.text+0xcd0): cannot reach rest_init
>>     init/main.o: in function `arch_call_rest_init':
>>     (.init.text+0xcd0): relocation truncated to fit: R_PARISC_PCREL22F against symbol `rest_init' defined in .ref.text section in init/main.o
>>     hppa64-linux-ld: init/main.o(.init.text+0x1154): cannot reach panic
>>     init/main.o: in function `start_kernel':
>>     (.init.text+0x1154): relocation truncated to fit: R_PARISC_PCREL22F against symbol `panic' defined in .text.unlikely section in kernel/panic.o
>>     hppa64-linux-ld: init/main.o(.init.text+0x128c): cannot reach build_all_zonelists
>>     (.init.text+0x128c): relocation truncated to fit: R_PARISC_PCREL22F against symbol `build_all_zonelists' defined in .ref.text section in mm/page_alloc.o
> The specific set of errors is completely random, so any patch that
> changes the size of the
> kernel will trigger this output.
>
> I think the best solution would be for Kconfig to enforce that
> CONFIG_COMPILE_TEST is
> set to =y when running 'make randconfig'. I had previously discussed
> this with Rong
> and Philip, who preferred to not enforce COMPILE_TEST=y on the lkp setup because
> other users doing randconfig builds might still run into the same issues.
>
> An alternative would be to just not send out emails about randconfig
> failures that
> happen only with COMPILE_TEST=n.
>
>        Arnd


Hi Arnd,

We will ignore the error firstly, I'm a little confused, who can handle 
the randconfig failures
if COMPILE_TEST=n?

Best Regards,
Rong Chen
