Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF9D3D95B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jul 2021 21:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG1TAS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Jul 2021 15:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhG1TAR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Jul 2021 15:00:17 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6B7C061765
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Jul 2021 12:00:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a7so4276065ljq.11
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Jul 2021 12:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IHfSHdJMp1ac7+FtC9uOY9CbIvUOsDtm7pUymTGrBto=;
        b=DasNgrs7wyzhChHr4ZDJhG7k0cY7OVxzs1g5Pw98gvoSad8ovXMxBCKjaVScLZOrRY
         Ar9egV9KR+97RJeNnNopBvIl3Z0AoH6VTVnRqvPIjSNLcQT2kDXn5Sqgz+0vyxq34a24
         s+c4xKGj16uL2GBajckF/FFPBHBb3CIZl1S+QjErjnPgC5Ams+bIk57Zi5YQ5BKVgYl0
         wdVQWM0elzrrEgS6DQeE2lWWwU42i/cPqTeSw8wsJD/gE9qdk2gffiurUAXh8vBDkT5X
         SoqvusICo2onhgVAlWxBQpCm1rsKTZYeEurDCzaaJPU60C1QVjoJ24DiOYn4rQGarMpp
         Ad1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IHfSHdJMp1ac7+FtC9uOY9CbIvUOsDtm7pUymTGrBto=;
        b=gYxxg02Sfw8R6dULO7EqWaNGysWA0NqXIQddY3I382gsXyQW0H6VFaohmgYplibYIH
         0eQGj64SICQQFK4Tk+n8PY91OayObLOfPwbbdcguTCZR7id+SFCr5HznnOzVYZ41gnlz
         CDhWF93DTAw9gJLAwcdjgp0P+221gGdG6P60O6xVjDy60JzzvUMKvtg8oCWAUNP4ln4Z
         RxD2aC/az85lsHWTJWAy9jabfhr0uSi9KSVQ3rgmeQym12+qwAPACtrFWO63GuiOB70T
         rS3HNJnODrWEEguXFqHCo64MfOAidu7xbZ5p0zaiO6x9keyoY4j5bonIV61hk/+1QD1a
         TiFg==
X-Gm-Message-State: AOAM530PjXEYEr6h6IoW19+yABnHMcQ7zrDjmL/0lU/BEofu6jxQ/WFg
        5BdIjbQ5eVjMo54Niam5v47UkbUErelKAja9QZWTVQ==
X-Google-Smtp-Source: ABdhPJxCqfkSLElTrwr/7lDTQXaZ0GZrnOGlQP49bCxwi3HyMs3iAlG96wdS9Xils4CZYOIIPm/d9HwukrHun35aOUU=
X-Received: by 2002:a05:651c:329:: with SMTP id b9mr731525ljp.116.1627498812284;
 Wed, 28 Jul 2021 12:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <0636b417-15bb-3f65-39f7-148d94fe22db@kernel.org> <CAK7LNAQtw-ZR0D4quHAqT_6rkMjgkjJhWG8EY7H4T1=PwUMgVw@mail.gmail.com>
In-Reply-To: <CAK7LNAQtw-ZR0D4quHAqT_6rkMjgkjJhWG8EY7H4T1=PwUMgVw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Jul 2021 11:59:59 -0700
Message-ID: <CAKwvOdkENUWd7OgJO=dNiYjH6D1aJ0puBgs4W7uuYO9xQiAiNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 8:50 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Jul 21, 2021 at 2:30 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On 7/20/2021 1:04 AM, Masahiro Yamada wrote:
> > > On Fri, Jul 9, 2021 at 8:25 AM 'Nick Desaulniers' via Clang Built
> > > Linux <clang-built-linux@googlegroups.com> wrote:
> > >>
> > >> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> > >> index 297932e973d4..956603f56724 100644
> > >> --- a/scripts/Makefile.clang
> > >> +++ b/scripts/Makefile.clang
> > >> @@ -1,6 +1,36 @@
> > >> -ifneq ($(CROSS_COMPILE),)
> > >> +# Individual arch/{arch}/Makfiles should use -EL/-EB to set intended endianness
> > >> +# and -m32/-m64 to set word size based on Kconfigs instead of relying on the
> > >> +# target triple.
> > >> +ifeq ($(CROSS_COMPILE),)
> > >> +ifneq ($(LLVM),)
> > >
> > >
> > > Do you need to check $(LLVM) ?
> > >
> > >
> > > LLVM=1 is a convenient switch to change all the
> > > defaults, but yet you can flip each tool individually.
> > >
> > > Instead of LLVM=1, you still should be able to
> > > get the equivalent setups by:
> > >
> > >
> > >    make CC=clang LD=ld.lld AR=llvm-ar OBJCOPY=llvm-objcopy ...
> > >
> > >
> > > The --target option is passed to only
> > > KBUILD_CFLAGS and KBUILD_AFLAGS.
> > >
> > > So, when we talk about --target=,
> > > we only care about whether $(CC) is Clang.
> > > Not caring about $(AR), $(LD), or $(OBJCOPY).
> > >
> > >
> > > scripts/Makefile.clang is already guarded by:
> > >
> > > ifneq ($(findstring clang,$(CC_VERSION_TEXT)),
> >
> > $ make ARCH=arm64 CC=clang LLVM_IAS=1
> >
> > will use the right compiler and assembler but none of the other binary
> > tools because '--prefix=' will not be set so CROSS_COMPILE needs to be
> > specified still, which defeats the purpose of this whole change. This
> > patch is designed to work for the "normal" case of saying "I want to use
> > all of the LLVM tools", not "I want to use clang by itself".
>
>
> I disagree.
>
> LLVM=1 is a shorthand.
>
>
>
> make LLVM=1 LLVM_IAS=1
>
>   should be equivalent to:
>
> make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
>   OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>   HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld \
>   LLVM_IAS=1
>
>
>
> We do not care about the origin of CC=clang,
> whether it came from LLVM=1 or every tool was explicitly,
> individually specified.
>
>
>
> ifneq ($(LLVM),) is a garbage code
> that checks a pointless thing.

Masahiro,
Nathan is correct.  Test for yourself; if you apply these two patches,
then apply:

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 956603f56724..a1b46811bdc6 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -2,7 +2,6 @@
 # and -m32/-m64 to set word size based on Kconfigs instead of relying on the
 # target triple.
 ifeq ($(CROSS_COMPILE),)
-ifneq ($(LLVM),)
 ifeq ($(LLVM_IAS),1)
 ifeq ($(SRCARCH),arm)
 CLANG_FLAGS    += --target=arm-linux-gnueabi
@@ -26,7 +25,6 @@ else
 $(error Specify CROSS_COMPILE or add '--target=' option to
scripts/Makefile.clang)
 endif # SRCARCH
 endif # LLVM_IAS
-endif # LLVM
 else
 CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
 endif # CROSS_COMPILE

Then build as Nathan specified:
$ ARCH=arm64 make CC=clang LLVM_IAS=1 -j72 defconfig all
...
arch/arm64/Makefile:25: ld does not support --fix-cortex-a53-843419;
kernel may be susceptible to erratum
...
  LD      arch/arm64/kernel/vdso/vdso.so.dbg
ld: unrecognised emulation mode: aarch64linux
Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
elf_l1om elf_k1om i386pep i386pe
make[1]: *** [arch/arm64/kernel/vdso/Makefile:56:
arch/arm64/kernel/vdso/vdso.so.dbg] Error 1
make: *** [arch/arm64/Makefile:193: vdso_prepare] Error 2

Nathan referred to --prefix, but in this failure, because
CROSS_COMPILE was never set, the top level Makefile set LD to:
 452 LD    = $(CROSS_COMPILE)ld
in this case `ld` in my path was my host x86 linker, which is not
correct for a cross compilation of arm64 target.

Perhaps we can somehow support "implicit CROSS_COMPILE" with just
CC=clang, and not LLVM=1, but I think it would be inflexible to
hardcode such target triple prefixes.  What if someone has
arm-linux-gnueabi-as but not arm-linux-gnueabihf-as installed?  That's
the point of CROSS_COMPILE in my opinion to provide such flexibility
at the cost of additional command line verbosity.

For the common case of LLVM=1 though, this series is a simplification.
If users want to specify CC=clang, then they MUST use CROSS_COMPILE
when cross compiling.

Please review the current approach and see if there's more I can
improve in a v3; otherwise I still think this series is good to go.
-- 
Thanks,
~Nick Desaulniers
