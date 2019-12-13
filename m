Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5455E11DE16
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 07:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731552AbfLMGDw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 01:03:52 -0500
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:49205 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727474AbfLMGDw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 01:03:52 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0Tkm5YRB_1576217015;
Received: from ali-6c96cfdd1403.local(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Tkm5YRB_1576217015)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 13 Dec 2019 14:03:46 +0800
Subject: Re: [RFC PATCH v6 0/7] Speed booting by sorting ORC unwind tables at
 build time
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>, x86@kernel.org
Cc:     "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
References: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <7578e83f-0e90-88c3-e07d-4719e907e93a@linux.alibaba.com>
Date:   Fri, 13 Dec 2019 14:03:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Peter, Ingo,

Sorry for ping,
but how about this series? or what can I do next?

Thanks!

On 2019/12/4 08:46, Shile Zhang wrote:
> Hi,
>
> Sorry, update for compile error fix, reported by Intel's kbuild test robot.
> Any comments or suggestions are welcome!
>
> Thanks!
>
> Changelog:
> ==========
> v5->v6:
> - fix compile error reported by kbuild test robot;
>
> v4->v5:
> - replace sort with qsort, suggested by Andy Lutomirski <luto@amacapital.net>;
> - add error handling in link scripts;
> - fixed some review findings;
> https://lore.kernel.org/lkml/20191128110206.2107-1-shile.zhang@linux.alibaba.com/
>
> v3->v4:
> - Code refactored for Peter's review findings and suggestions.
> https://lore.kernel.org/lkml/20191115164539.57930-1-shile.zhang@linux.alibaba.com/
>
> v2->v3:
> - Discard new added sortorctable tool and related Kconfig changes.
> - Refactored sortextable, makes it more readable and extendable.
> - Rename 'sortextable' to 'sorttable', for more kernel tables extend.
> - Add ORC unwind tables sort into sorttable.
> - Remove the runtime ORC tables sort.
> https://lore.kernel.org/lkml/20191115064750.47888-1-shile.zhang@linux.alibaba.com/
>
> v1->v2:
> - Removed new added Kconfig and runtime sort code, advised by Josh Poimboeuf.
> - Some minor refactoring.
> https://lore.kernel.org/lkml/20191108071108.72132-1-shile.zhang@linux.alibaba.com/
>
> v1:
> - Added a new sortorctable tool to sort ORC unwind tables at build time,
>    same as sortextable.
> - Add a new Kconfigure to control if ORC unwind tables sort at build
>    time.
> https://lore.kernel.org/lkml/20191107143205.206606-1-shile.zhang@linux.alibaba.com/
>
> Shile Zhang (7):
>    scripts/sortextable: Rewrite error/success handling
>    scripts/sortextable: kernel coding style formating
>    scripts/sortextable: Remove dead code
>    scripts/sortextable: refactor do_func() function
>    scripts/sorttable: rename sortextable to sorttable
>    scripts/sorttable: Add ORC unwind tables sort concurrently
>    x86/unwind/orc: remove run-time ORC unwind tables sort
>
>   arch/arc/Kconfig                       |   2 +-
>   arch/arm/Kconfig                       |   2 +-
>   arch/arm64/Kconfig                     |   2 +-
>   arch/microblaze/Kconfig                |   2 +-
>   arch/mips/Kconfig                      |   2 +-
>   arch/parisc/Kconfig                    |   2 +-
>   arch/powerpc/Kconfig                   |   2 +-
>   arch/s390/Kconfig                      |   2 +-
>   arch/x86/Kconfig                       |   2 +-
>   arch/x86/kernel/unwind_orc.c           |   8 +-
>   arch/xtensa/Kconfig                    |   2 +-
>   init/Kconfig                           |   2 +-
>   scripts/.gitignore                     |   2 +-
>   scripts/Makefile                       |  13 +-
>   scripts/link-vmlinux.sh                |  13 +-
>   scripts/sortextable.h                  | 209 --------------
>   scripts/{sortextable.c => sorttable.c} | 305 +++++++++-----------
>   scripts/sorttable.h                    | 380 +++++++++++++++++++++++++
>   18 files changed, 557 insertions(+), 395 deletions(-)
>   delete mode 100644 scripts/sortextable.h
>   rename scripts/{sortextable.c => sorttable.c} (67%)
>   create mode 100644 scripts/sorttable.h
>

