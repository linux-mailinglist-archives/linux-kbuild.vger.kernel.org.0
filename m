Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17899496315
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jan 2022 17:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234921AbiAUQrm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Jan 2022 11:47:42 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:35512 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232369AbiAUQrm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jan 2022 11:47:42 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9CBCB619E0;
        Fri, 21 Jan 2022 16:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125BAC340E1;
        Fri, 21 Jan 2022 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642783661;
        bh=9SrU/k0LYSbwZ45aZAjqd2SKBGAW7Vh9alM4dD37sbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qMYtagzIGQr/lfivcHg49J0wf1BV6l1mX7RaeZ/zV75FCANUIBHcGavQwwtvZACHo
         N6uS7d2X3/esU4RMY3eyLvQftKlfcarZ2M6IifPtOxTKJSd0UtsttGn6qv/0szYzl2
         s6XaD/U19LIEqjEs2kEl7PlTD9kZCQ94CQaIEAmRsybRfOyems1gOivR0O0JP5+GwA
         IsBR/WOHtr2SKVisyT+9MPz4kdEzRkeKuCL1kh4/5w0Hg8riJsYIsalweCVsBf8j0C
         PEzLrmeDfepQbXSFup4h7v4ultxmNHEmJH6YKPGcxVSNHQUrZUJSOFwtUKYamCXMg4
         +djmJ8r93smPA==
Date:   Fri, 21 Jan 2022 09:47:36 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] Makefile: Fix build with scan-build
Message-ID: <YerjqBrxXwjMzCRZ@archlinux-ax161>
References: <20220119135147.1859982-1-amadeuszx.slawinski@linux.intel.com>
 <YeiAa/eCxVZC+QbS@archlinux-ax161>
 <YeiaAgQ+gbZYTMwD@archlinux-ax161>
 <5f5bd99e-4bd3-bc88-b6c5-e414a6608a96@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f5bd99e-4bd3-bc88-b6c5-e414a6608a96@linux.intel.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 21, 2022 at 12:20:39PM +0100, Amadeusz Sławiński wrote:
> On 1/20/2022 12:08 AM, Nathan Chancellor wrote:
> > On Wed, Jan 19, 2022 at 02:19:39PM -0700, Nathan Chancellor wrote:
> > > On Wed, Jan 19, 2022 at 02:51:47PM +0100, Amadeusz Sławiński wrote:
> > > > When building kernel with scan-build for analysis:
> > > > $ scan-build make defconfig
> > > > $ scan-build make menuconfig # disable RETPOLINE
> > > > $ scan-build make -j16 bindeb-pkg
> > > > since commit 7d73c3e9c514 ("Makefile: remove stale cc-option checks")
> > > > it fails with:
> > > >    CC      scripts/mod/empty.o
> > > > could not find clang line
> > > > make[4]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 1
> > > > 
> > > > Seems like changes to how -fconserve-stack support was detected broke
> > > > build with scan-build. Revert part of mentioned commit which changed
> > > > that.
> > > > 
> > > > Fixes: 7d73c3e9c514 ("Makefile: remove stale cc-option checks")
> > > > CC: Nick Desaulniers <ndesaulniers@google.com>
> > > > Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> > > > Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> > > > ---
> > > >   Makefile | 4 +---
> > > >   1 file changed, 1 insertion(+), 3 deletions(-)
> > > > 
> > > > diff --git a/Makefile b/Makefile
> > > > index 765115c99655..1174ccd182f5 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -991,9 +991,7 @@ KBUILD_CFLAGS	+= -fno-strict-overflow
> > > >   KBUILD_CFLAGS  += -fno-stack-check
> > > >   # conserve stack if available
> > > > -ifdef CONFIG_CC_IS_GCC
> > > > -KBUILD_CFLAGS   += -fconserve-stack
> > > > -endif
> > > > +KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
> > > >   # Prohibit date/time macros, which would make the build non-deterministic
> > > >   KBUILD_CFLAGS   += -Werror=date-time
> > > > -- 
> > > > 2.25.1
> > > > 
> > > 
> > > Okay, I think I understand why this happens...
> > > 
> > > scan-build points CC to its CC wrapper [1], ccc-analyzer, which builds the
> > > code with a compiler [2] then runs clang for the static analyzer [3].
> > > The problem is that the default compiler for ccc-analyzer is GCC, which
> > > means that CONFIG_CC_IS_GCC gets set and flags that are supported by GCC
> > > but not clang will cause the clang analyzer part of ccc-analyzer to
> > > error because ccc-analyzer just passes all '-f' flags along [4].
> > > 
> > > Prior to 7d73c3e9c514, there was no error because cc-option would run
> > > the flag against ccc-analyzer, which would error out for the reason I
> > > just described, which would prevent the flag from getting added to
> > > KBUILD_CFLAGS.
> > > 
> > > Now, -fconserve-stack gets passed along to both gcc and clang but clang
> > > does not recognize it and errors out.
> > > 
> > > This should be fixed in clang, which already has the machinery to
> > > recognize but ignore GCC flags for compatibility reasons (which is
> > > probably how gcc and clang can use the same flags). I have pushed a
> > > patch to Phabricator for review:
> > > 
> > > https://reviews.llvm.org/D117717
> > > 
> > > You need to disable CONFIG_RETPOLINE for the same reason but I don't
> > > think working around that in clang is as simple.
> > > 
> > > Until that fix can proliferate through distributions and such, this is
> > > not an unreasonable workaround (unless Masahiro or Nick have a better
> > > idea) but I would really like a comment so that we can revert this once
> > > that fix is more widely available (it is unlikely that clang will
> > > actually support this option).
> > > 
> > > [1]: https://github.com/llvm/llvm-project/blob/3062a1469da0569e714aa4634b29345f6d8c874c/clang/tools/scan-build/bin/scan-build#L1080
> > > [2]: https://github.com/llvm/llvm-project/blob/fd0782a37bbf7dd4ece721df92c703a381595661/clang/tools/scan-build/libexec/ccc-analyzer#L457
> > > [3]: https://github.com/llvm/llvm-project/blob/fd0782a37bbf7dd4ece721df92c703a381595661/clang/tools/scan-build/libexec/ccc-analyzer#L783
> > > [4]: https://github.com/llvm/llvm-project/blob/fd0782a37bbf7dd4ece721df92c703a381595661/clang/tools/scan-build/libexec/ccc-analyzer#L661-L665
> > 
> > Thinking more about this after Fangrui commented on the clang patch
> > above, using scan-build with GCC as the compiler is going to be hard to
> > support, as we are basically trying to support using two different
> > compilers with a unified set of '-f' flags, which I see as problematic
> > for a few reasons.
> > 
> > 1. It restricts our ability to do cc-option cleanups like Nick did.
> > 
> > We should be eliminating cc-option calls that we know are specific to
> > one compiler because checking the Kconfig variables (CONFIG_CC_IS_...)
> > is much cheaper than invoking the compiler.
> > 
> > 2. Necessary GCC specific flags will get dropped.
> > 
> > Adding back the call to cc-option will allow the build to succeed but it
> > drops the flag from KBUILD_CFLAGS. If there were ever a time where an
> > '-f' flag was needed to get a working kernel with GCC, it would not get
> > added because clang would reject it.
> > 
> > We already have a static-analyzer target that requires using CC=clang so
> > I think there is some precedent here to say we require the kernel to be
> > built with clang to use the static analyzer. The fact that it did prior
> > to 7d73c3e9c514 can just be chalked up to luck.
> > 
> > $ make -j"$(nproc)" LLVM=1 defconfig bindeb-pkg static-analyzer
> > 
> > would be the equivalent command to the original patch.
> > 
> > You can still use scan-build with the '--use-cc=clang' flag, which will
> > use clang for the compilation and analysis, if you so prefer.
> > 
> > Masahiro and Nick may have further thoughts and I am open to other
> > opinions but my vote is to say this is an issue we won't fix or
> > workaround.
> > 
> > Cheers,
> > Nathan
> 
> 
> Thank you for detailed explanation. Well I guess question then is: how much
> scan-build is supported? And if it should even support mixing clang and gcc?
> Alternatively maybe use clang as default if CC environment variable is not
> set?

It probably shouldn't, as least not in the way that it currently does.
Someone on the LLVM review I created suggested it should add a filter
for flags that clang does not support from GCC. I think changing the
default would be another good fix but doesn't fix the issue if someone
does actually wants to use GCC for building.

> What I like about scan-build is that it generates html report file.

Ah, that is a good point.

> '--use-cc=clang' worked fine for me.
> 
> I've also tried
> > $ make -j"$(nproc)" LLVM=1 defconfig bindeb-pkg static-analyzer
> although there seems to be no static-analyzer target, I guess you meant
> clang-analyzer instead, but although it seems to generate a lot of text on
> terminal, it doesn't seem that useful to me. Not sure if this is expected?

Yes, my apologies, it should have been clang-analyzer.

> Quoting a piece of log:
> ./include/linux/xarray.h:54:2: error: expected '(' after 'asm'
> [clang-diagnostic-error]
>         WARN_ON((long)v < 0);
>         ^
> ./include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
>                 __WARN();                                               \
>                 ^
> ./include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
> #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
>                                 ^
> ./arch/x86/include/asm/bug.h:79:2: note: expanded from macro '__WARN_FLAGS'
>         _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));           \
>         ^
> ./arch/x86/include/asm/bug.h:27:2: note: expanded from macro '_BUG_FLAGS'
>         asm_inline volatile("1:\t" ins "\n"                             \
>         ^
> ./include/linux/compiler_types.h:281:24: note: expanded from macro
> 'asm_inline'
> #define asm_inline asm __inline
>                        ^
> ./include/linux/xarray.h:1616:2: error: expected '(' after 'asm'
> [clang-diagnostic-error]
>         BUG_ON(order > 0);
>         ^
> ./include/asm-generic/bug.h:65:57: note: expanded from macro 'BUG_ON'
> #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
>                                                         ^
> ./arch/x86/include/asm/bug.h:66:2: note: expanded from macro 'BUG'
>         _BUG_FLAGS(ASM_UD2, 0);                                 \
>         ^
> ./arch/x86/include/asm/bug.h:27:2: note: expanded from macro '_BUG_FLAGS'
>         asm_inline volatile("1:\t" ins "\n"                             \
>         ^
> ./include/linux/compiler_types.h:281:24: note: expanded from macro
> 'asm_inline'
> #define asm_inline asm __inline
>                        ^
> Found compiler error(s).
> 21 errors generated.
> Error while processing /home/xxxxxxxx/linux/drivers/hid/hid-ezkey.c.
> error: too many errors emitted, stopping now [clang-diagnostic-error]
> error: unknown argument: '-fno-stack-clash-protection'
> [clang-diagnostic-error]
> error: unknown warning option '-Wno-frame-address'; did you mean
> '-Wno-address'? [clang-diagnostic-unknown-warning-option]
> error: unknown warning option '-Wno-pointer-to-enum-cast'; did you mean
> '-Wno-pointer-compare'? [clang-diagnostic-unknown-warning-option]
> 
> 
> Unless I did something wrong, this doesn't seem that useful to me compared
> to what I get from scan-build?

I do not see that error but I have little experience with running the
clang-analyzer target. It might be due to a difference between
scan-build and clang-tidy? Regardless, it seems like you prefer reading
the HTML report, so sticking with scan-build with the '--use-cc=clang'
flag will be the way to go.

Cheers,
Nathan
