Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96E832C1DE
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351283AbhCCT3q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:29:46 -0500
Received: from condef-09.nifty.com ([202.248.20.74]:42478 "EHLO
        condef-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442495AbhCCKTv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 05:19:51 -0500
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-09.nifty.com with ESMTP id 1238YN5D001486;
        Wed, 3 Mar 2021 17:34:23 +0900
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1238XsY6007279;
        Wed, 3 Mar 2021 17:33:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1238XsY6007279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614760435;
        bh=t2H8VyH9AVnFDudiJqpplvJKk6BW/2I4as+O7Wq1jKc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=W7ciNNT0uUj6UfNSR+M5+zqVbOAmQKEh9U2xE4w9wNq1sLvmCNWPHkcB68X9daG79
         xydjdgq1N0CScuowhlmoUI+pXQQBiIsbyiAPsS61/SUEeUG2BtGnVDXpuMkWGLxv41
         SoexK9EMpyiMYMjSNVBRsXglu3iAHnFvLt5zsi5g47iNoPP5OnI4Wy+HV5sNknLkdJ
         N9lu7rspIliTjSy952UK2lRJaQHiTKIt8HDjhU4nFDrAUBSwjOt6SjW3Q6nt8dj8Fk
         l3WJbtncsR0VHab8UGmyLQJeg/av2um0KU9M8zO8ewlRo8xH8yMiclSYmJ6hk8WuMP
         d+8HjIhMbFGzA==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id i4-20020a17090a7184b02900bfb60fbc6bso2555685pjk.0;
        Wed, 03 Mar 2021 00:33:55 -0800 (PST)
X-Gm-Message-State: AOAM532a6n9qOLUD2NFusU3AE/A7E+GWY740CoDKKGCH6vmA9Zc5moo5
        W62c0IDRaHDOhtXTDbci42W3aOIj5Gxj48jdNGo=
X-Google-Smtp-Source: ABdhPJzEdPJFAoBaGAUNdOQRUIFbCdsqtv45KKZHMfKPcSWckKo9UNwRa+AtuNniwWDUXUg5DYbDXw5DzpWuQPy4XhA=
X-Received: by 2002:a17:90a:dc08:: with SMTP id i8mr8226925pjv.153.1614760434319;
 Wed, 03 Mar 2021 00:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <20210302214358.qr6enl6majzplhij@google.com>
In-Reply-To: <20210302214358.qr6enl6majzplhij@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 3 Mar 2021 17:33:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4Ri=K6M39hYU+17JVf0Z=hbRgSxuTdX5ZaVYLpmJRtA@mail.gmail.com>
Message-ID: <CAK7LNAS4Ri=K6M39hYU+17JVf0Z=hbRgSxuTdX5ZaVYLpmJRtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Fangrui Song <maskray@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Wed, Mar 3, 2021 at 6:44 AM Fangrui Song <maskray@google.com> wrote:
>
> Reviewed-by: Fangrui Song <maskray@google.com>
>
> Thanks for the clean-up!
> --gcc-toolchain= is an obsscure way searching for GCC installation prefixes (--prefix).
> The logic is complex and different for different distributions/architectures.
>
> If we specify --prefix= (-B) explicitly, --gcc-toolchain is not needed.


I tested this, and worked for me too.

Before applying this patch, could you please
help me understand the logic?




I checked the manual
(https://clang.llvm.org/docs/ClangCommandLineReference.html#cmdoption-clang-b-dir)



-B<dir>, --prefix <arg>, --prefix=<arg>
    Add <dir> to search path for binaries and object files used implicitly

--gcc-toolchain=<arg>, -gcc-toolchain <arg>
    Use the gcc toolchain at the given directory


Hmm, this description is too concise
to understand how it works...



I use Ubuntu 20.10.

I use distro's default clang
located in /usr/bin/clang.

I place my aarch64 linaro toolchain in
/home/masahiro/tools/aarch64-linaro-7.5/bin/aarch64-linux-gnu-gcc,
which is not in my PATH environment.




From my some experiments,

clang --target=aarch64-linux-gnu -no-integrated-as \
--prefix=/home/masahiro/tools/aarch64-linaro-7.5/bin/aarch64-linux-gnu-  ...

works almost equivalent to

PATH=/home/masahiro/tools/aarch64-linaro-7.5/bin:$PATH \
clang --target=aarch64-linux-gnu -no-integrated-as ...


Then, clang will pick up aarch64-linux-gnu-as
found in the search path.

Is this correct?


On the other hand, I could not understand
what the purpose of --gcc-toolchain= is.


Even if I add --gcc-toolchain=/home/masahiro/tools/aarch64-linaro-7.5,
it does not make any difference, and it is completely useless.


I read the comment from stephenhines:
https://github.com/ClangBuiltLinux/linux/issues/78

How could --gcc-toolchain be used
in a useful way?









> On 2021-03-02, Nathan Chancellor wrote:
> >This is not necessary anymore now that we specify '--prefix=', which
> >tells clang exactly where to find the GNU cross tools. This has been
> >verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as well as a
> >distribution version of LLVM 11.1.0 without binutils in the LLVM
> >toolchain locations.
> >
> >Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >---
> > Makefile | 4 ----
> > 1 file changed, 4 deletions(-)
> >
> >diff --git a/Makefile b/Makefile
> >index f9b54da2fca0..c20f0ad8be73 100644
> >--- a/Makefile
> >+++ b/Makefile
> >@@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
> > CLANG_FLAGS   += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > CLANG_FLAGS   += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> >-GCC_TOOLCHAIN := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> >-endif
> >-ifneq ($(GCC_TOOLCHAIN),)
> >-CLANG_FLAGS   += --gcc-toolchain=$(GCC_TOOLCHAIN)
> > endif
> > ifneq ($(LLVM_IAS),1)
> > CLANG_FLAGS   += -no-integrated-as
> >
> >base-commit: 7a7fd0de4a9804299793e564a555a49c1fc924cb
> >--
> >2.31.0.rc0.75.gec125d1bc1
> >
> >--
> >You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> >To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> >To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210302210646.3044738-1-nathan%40kernel.org.



--
Best Regards

Masahiro Yamada
