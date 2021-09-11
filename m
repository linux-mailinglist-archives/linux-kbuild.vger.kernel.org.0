Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63CD1407653
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Sep 2021 13:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233493AbhIKL5K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Sep 2021 07:57:10 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:39171 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230249AbhIKL5J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Sep 2021 07:57:09 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Unzk85B_1631361353;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0Unzk85B_1631361353)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 11 Sep 2021 19:55:54 +0800
Subject: Re: [PATCH] [RFC] kbuild: add CLANG_TRIPLE to prevent clang from
 compiling with wrong --target
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, nathan@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Alistair Delva <adelva@google.com>
References: <1631173363-40160-1-git-send-email-ashimida@linux.alibaba.com>
 <CAKwvOdnuiV3mHxxCpWbMaZn9vggL4B+PPrMtuX=QOO-yUQj2mA@mail.gmail.com>
From:   ashimida <ashimida@linux.alibaba.com>
Message-ID: <2e10c444-50e2-0f86-f86e-ffb982059c88@linux.alibaba.com>
Date:   Sat, 11 Sep 2021 19:55:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnuiV3mHxxCpWbMaZn9vggL4B+PPrMtuX=QOO-yUQj2mA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Desaulniers,

I now understand the meaning here, the command works fine for me.

Thank you very much for the reply!

On 9/10/21 1:19 AM, Nick Desaulniers wrote:
 > On Thu, Sep 9, 2021 at 12:42 AM ashimida <ashimida@linux.alibaba.com> 
wrote:
 >>
 >> Kernel compiled with tool chain CROSS_COMPILE=aarch64-linux-android-
 >> will panic during the startup phase.
 >>
 >> Clang's --target option comes from $(CROSS_COMPILE). At the time
 >> -fstack-protector-strong is enabled, and compiled with command:
 >> make CC=clang HOSTCC=clang ARCH=arm64 
CROSS_COMPILE=aarch64-linux-android-
 >>
 >> clang will insert code like:
 >>     mrs     x8, TPIDR_EL0        //default value is zero
 >>     str     x8, [sp]
 >>     ldr     x8, [x8, #40]        //access addr 0x40
 >>
 >> instead of the code that accesses __stack_chk_guard to get the
 >> canary, which will cause the kernel to crash due to 0x40
 >> address access.
 >>
 >> This patch (from android) is used to remind the user that current
 >> tool chain cannot be used as the "--target" of clang, the user
 >> should specify an additional "--target" through CLANG_TRIPLE.
 >
 > Hi Ashimida,
 > Thanks for sending this patch; I recognize it from Android, which we
 > had to carry for years due to:
 > 1. reliance on GNU `as` ie. "GAS"
 > 2. not distributing binary prefixes of GNU binutils with a target
 > triple that clang recognized. (ie. Android's binutils were prefixed
 > aarch64-linux-android- while Clang expected something more like
 > aarch64-linux-gnu for --target=)
 >
 > We solved this by working out the issues in clang's assembler.  With
 > LLVM=1 LLVM_IAS=1, we no longer rely on GNU binutils, and no longer
 > need such patch.  You'll find it's been dropped from Android Common
 > Kernels now.  With mainline, LLVM_IAS=1 is now the default when
 > building with LLVM=1, and CROSS_COMPILE is now inferred from ARCH for
 > LLVM=1 as well.
 >
 > So all you should need is:
 > $ ARCH=arm64 make LLVM=1 -j$(nproc)
 >
 > Is there a reason why the above doesn't work for you?  I do not wish
 > to see this patch upstream (or downstream; it should be unnecessary).
 >
 >>
 >> Signed-off-by: ashimida <ashimida@linux.alibaba.com>
 >> ---
 >>   Makefile                 | 6 +++++-
 >>   scripts/clang-android.sh | 4 ++++
 >>   2 files changed, 9 insertions(+), 1 deletion(-)
 >>   create mode 100755 scripts/clang-android.sh
 >>
 >> diff --git a/Makefile b/Makefile
 >> index 61741e9..09bb314 100644
 >> --- a/Makefile
 >> +++ b/Makefile
 >> @@ -586,7 +586,11 @@ CC_VERSION_TEXT = $(subst $(pound),,$(shell 
$(CC) --version 2>/dev/null | head -
 >>
 >>   ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 >>   ifneq ($(CROSS_COMPILE),)
 >> -CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
 >> +CLANG_TRIPLE    ?= $(CROSS_COMPILE)
 >> +CLANG_FLAGS     += --target=$(notdir $(CLANG_TRIPLE:%-=%))
 >> +ifeq ($(shell $(srctree)/scripts/clang-android.sh $(CC) 
$(CLANG_FLAGS)), y)
 >> +$(error "Clang with Android --target detected. Did you specify 
CLANG_TRIPLE?")
 >> +endif
 >>   endif
 >>   ifeq ($(LLVM_IAS),1)
 >>   CLANG_FLAGS    += -integrated-as
 >> diff --git a/scripts/clang-android.sh b/scripts/clang-android.sh
 >> new file mode 100755
 >> index 0000000..9186c4f
 >> --- /dev/null
 >> +++ b/scripts/clang-android.sh
 >> @@ -0,0 +1,4 @@
 >> +#!/bin/sh
 >> +# SPDX-License-Identifier: GPL-2.0
 >> +
 >> +$* -dM -E - </dev/null 2>&1 | grep -q __ANDROID__ && echo "y"
 >> --
 >> 2.7.4
 >>
 >
 >
