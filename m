Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507F63F6B5E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 23:53:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235905AbhHXVx4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Aug 2021 17:53:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:38856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237016AbhHXVxt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Aug 2021 17:53:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDFA06127B;
        Tue, 24 Aug 2021 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629841984;
        bh=HIeUUjdpdOE3EExH+2foqRMzjAiDKgARCIUjBxzZVk8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=buJw1smEq5TmuXHkLVOI0m08XNuAaEpcFRKYl2LWggsTAq4/qVwt5BcxeErCcjJAz
         W+9UKBjDg7BU2M7IxskuIXiJyx30tcyZGeVin7sGoRPlDUV4wJWt6XNOypodd8WxQs
         4G7uwCijbfr4jWurcOEdOuxAZ1e+LP9BpgFj5LnrEdR9psDqR7LOgmIN79Zk2Mdxy1
         WMLmp+7CAWKRb8IO3tV8rfLEvdOb50Er3JHM2a6e+nyGoYhVlkrc/u/UJA9IzCsRn3
         a199osU0re6l7XHsV1iR6HvEm8wU1J+86kDCfBH0hP7SSV7khi36CoxE68UGkKNE0V
         AnbnaaGu0FMBw==
Date:   Tue, 24 Aug 2021 14:53:00 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Fangrui Song <maskray@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] x86: Do not add -falign flags unconditionally for
 clang
Message-ID: <YSVqPNPOewbFS7U8@Ryzen-9-3900X.localdomain>
References: <20210824022640.2170859-1-nathan@kernel.org>
 <20210824022640.2170859-2-nathan@kernel.org>
 <20210824025647.tssnp7qtccbgvdq7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824025647.tssnp7qtccbgvdq7@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 07:56:47PM -0700, Fangrui Song wrote:
> On 2021-08-23, Nathan Chancellor wrote:
> > clang does not support -falign-jumps and only recently gained support
> > for -falign-loops. When one of the configuration options that adds these
> > flags is enabled, clang warns and all cc-{disable-warning,option} that
> > follow fail because -Werror gets added to test for the presence of this
> > warning:
> 
> [I implemented clang -falign-loops :) It doesn't affect LTO, though.
> LTO ld.lld may use -Wl,-mllvm,-align-loops=32 for now.  ]
> 
> > clang-14: warning: optimization flag '-falign-jumps=0' is not supported
> > [-Wignored-optimization-argument]
> 
> grub made a similar mistake:) It thought the availability of -falign-X
> implies the availability of other -falign-*
> https://lists.gnu.org/archive/html/grub-devel/2021-08/msg00076.html
> 
> > To resolve this, add a couple of cc-option calls when building with
> > clang; gcc has supported these options since 3.2 so there is no point in
> > testing for their support. -falign-functions was implemented in clang-7,
> > -falign-loops was implemented in clang-14, and -falign-jumps has not
> > been implemented yet.
> > 
> > Link: https://lore.kernel.org/r/YSQE2f5teuvKLkON@Ryzen-9-3900X.localdomain/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > arch/x86/Makefile_32.cpu | 12 +++++++++---
> > 1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
> > index cd3056759880..e8c65f990afd 100644
> > --- a/arch/x86/Makefile_32.cpu
> > +++ b/arch/x86/Makefile_32.cpu
> > @@ -10,6 +10,12 @@ else
> > tune		= $(call cc-option,-mcpu=$(1),$(2))
> > endif
> > 
> > +ifdef CONFIG_CC_IS_CLANG
> > +align		:= -falign-functions=0 $(call cc-option,-falign-jumps=0) $(call cc-option,-falign-loops=0)
> > +else
> > +align		:= -falign-functions=0 -falign-jumps=0 -falign-loops=0
> > +endif
> > +
> > cflags-$(CONFIG_M486SX)		+= -march=i486
> > cflags-$(CONFIG_M486)		+= -march=i486
> > cflags-$(CONFIG_M586)		+= -march=i586
> > @@ -25,11 +31,11 @@ cflags-$(CONFIG_MK6)		+= -march=k6
> > # They make zero difference whatsosever to performance at this time.
> > cflags-$(CONFIG_MK7)		+= -march=athlon
> > cflags-$(CONFIG_MK8)		+= $(call cc-option,-march=k8,-march=athlon)
> > -cflags-$(CONFIG_MCRUSOE)	+= -march=i686 -falign-functions=0 -falign-jumps=0 -falign-loops=0
> > -cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) -falign-functions=0 -falign-jumps=0 -falign-loops=0
> > +cflags-$(CONFIG_MCRUSOE)	+= -march=i686 $(align)
> > +cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) $(align)
> > cflags-$(CONFIG_MWINCHIPC6)	+= $(call cc-option,-march=winchip-c6,-march=i586)
> > cflags-$(CONFIG_MWINCHIP3D)	+= $(call cc-option,-march=winchip2,-march=i586)
> > -cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) -falign-functions=0 -falign-jumps=0 -falign-loops=0
> > +cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)
> > cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
> > cflags-$(CONFIG_MVIAC7)		+= -march=i686
> > cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)
> > -- 
> > 2.33.0
> 
> https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html says
> "If n is not specified or is zero, use a machine-dependent default."
> 
> Unless some other files specify -falign-loops=N and expect 0 to reset to
> the machine default, -falign-jumps=0 -falign-loops=0 -falign-functions=0 should just be dropped.

Grepping the tree, I see:

rg "align-(functions|jumps|loops)"
Makefile
977:KBUILD_CFLAGS += -falign-functions=64

arch/x86/Makefile
101:        KBUILD_CFLAGS += $(call cc-option,-falign-jumps=1)
104:        KBUILD_CFLAGS += $(call cc-option,-falign-loops=1)

arch/x86/Makefile_32.cpu
28:cflags-$(CONFIG_MCRUSOE)     += -march=i686 -falign-functions=0 -falign-jumps=0 -falign-loops=0
29:cflags-$(CONFIG_MEFFICEON)   += -march=i686 $(call tune,pentium3) -falign-functions=0 -falign-jumps=0 -falign-loops=0
32:cflags-$(CONFIG_MCYRIXIII)   += $(call cc-option,-march=c3,-march=i486) -falign-functions=0 -falign-jumps=0 -falign-loops=0

arch/ia64/Makefile
26:                -falign-functions=32 -frename-registers -fno-optimize-sibling-calls

The two cc-options calls in arch/x86/Makefile are for x86_64 only and
the Makefile use of -falign-functions=64 is for
DEBUG_FORCE_FUNCTION_ALIGN_64B, which is a debug option so it does not
seem like the flags are going to get overridden in a normal case.

However, I read the GCC docs as if functions are not aligned by default
and -falign-functions / -falign-functions=0 aligns them to a machine
specific default, so I am not sure if these flags can just be dropped?
These flags have been in the tree for 19 years though and there is very
little history that I can find around why they are there.

https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/tree/arch/i386/Makefile?id=7a2deb32924142696b8174cdf9b38cd72a11fc96

-O2 turns on -falign-{functions,jumps,loops} by default but the kernel
can use -Os, which omits those, so it is possible that is why they are
there? Some input from the x86 folks might be helpful around this :)

> BTW: I believe GCC 8 (likely when fixing another issue with a large refactor
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84100) introduced a bug
> that -falign-X=0 was essentially -falign-X=1.
> GCC 11.0 (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96247) fixed the bug.

Cheers,
Nathan
