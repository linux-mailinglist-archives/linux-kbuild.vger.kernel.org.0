Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA493D98F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jul 2021 00:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbhG1Wgw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Jul 2021 18:36:52 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33668 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbhG1Wgw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Jul 2021 18:36:52 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 16SMaSpw009511;
        Thu, 29 Jul 2021 07:36:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 16SMaSpw009511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627511789;
        bh=TmY7u99GvKGaIrLNACsThniYgzMQ+Eus0lMGKUzW6R4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UM02UuIiQNiR6b7PSxMr4UhwWU5fln/BxpEhyJlihPGhgMdTSaL5xiWZt/9Vk6G/k
         8pUwijVsYwpwNakDdZ+fpgWhMblpM4hkJxEcQ18PmcJyeeDNzX/OLhDEpG9sa8jkU2
         a0Og2+pB7DoqEV+eoNk2tk85qO5/nNFtrKsY13bEFKZh/6NZNRJwl0MiiDh7+Z+oCo
         EJDKMLy0MOU2njIm7kI5Uwv599Cx823l1pf6inIJkgjwoFYgSKDbSQJIstH5hsNjFh
         JKiOhuUTPXOa5K7550tf03MfjmoS91BkjWQ9YgYV7L03qhoMHZeEYp5+psp6urUn3G
         0sXxhZF1azC8g==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id m1so7411631pjv.2;
        Wed, 28 Jul 2021 15:36:28 -0700 (PDT)
X-Gm-Message-State: AOAM533r8IZ7qHAYhXNSOh3JatettkLQtMFQJ+IW0aUtL5mdLC0LhnE/
        zSKhas785dn0LU4jEoz12crDYVnIippx9EBzlx4=
X-Google-Smtp-Source: ABdhPJyEiRgoFU7YIi1ba2pQVYHMwa9TRitcGe7dEpg/naXMc2Scx534EplzEBKnc5zHrNLyp6R/bw3QMAyPUli2cQ8=
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr11696072pjt.198.1627511787958;
 Wed, 28 Jul 2021 15:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <0636b417-15bb-3f65-39f7-148d94fe22db@kernel.org> <CAK7LNAQtw-ZR0D4quHAqT_6rkMjgkjJhWG8EY7H4T1=PwUMgVw@mail.gmail.com>
 <CAKwvOdkENUWd7OgJO=dNiYjH6D1aJ0puBgs4W7uuYO9xQiAiNg@mail.gmail.com>
In-Reply-To: <CAKwvOdkENUWd7OgJO=dNiYjH6D1aJ0puBgs4W7uuYO9xQiAiNg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 29 Jul 2021 07:35:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrwpk5s8FDFoRbGqx2mzUk8xM9TBNnH3SepFPoijkBAA@mail.gmail.com>
Message-ID: <CAK7LNARrwpk5s8FDFoRbGqx2mzUk8xM9TBNnH3SepFPoijkBAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
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

On Thu, Jul 29, 2021 at 4:00 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Tue, Jul 20, 2021 at 8:50 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Jul 21, 2021 at 2:30 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > >
> > > On 7/20/2021 1:04 AM, Masahiro Yamada wrote:
> > > > On Fri, Jul 9, 2021 at 8:25 AM 'Nick Desaulniers' via Clang Built
> > > > Linux <clang-built-linux@googlegroups.com> wrote:
> > > >>
> > > >> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> > > >> index 297932e973d4..956603f56724 100644
> > > >> --- a/scripts/Makefile.clang
> > > >> +++ b/scripts/Makefile.clang
> > > >> @@ -1,6 +1,36 @@
> > > >> -ifneq ($(CROSS_COMPILE),)
> > > >> +# Individual arch/{arch}/Makfiles should use -EL/-EB to set intended endianness
> > > >> +# and -m32/-m64 to set word size based on Kconfigs instead of relying on the
> > > >> +# target triple.
> > > >> +ifeq ($(CROSS_COMPILE),)
> > > >> +ifneq ($(LLVM),)
> > > >
> > > >
> > > > Do you need to check $(LLVM) ?
> > > >
> > > >
> > > > LLVM=1 is a convenient switch to change all the
> > > > defaults, but yet you can flip each tool individually.
> > > >
> > > > Instead of LLVM=1, you still should be able to
> > > > get the equivalent setups by:
> > > >
> > > >
> > > >    make CC=clang LD=ld.lld AR=llvm-ar OBJCOPY=llvm-objcopy ...
> > > >
> > > >
> > > > The --target option is passed to only
> > > > KBUILD_CFLAGS and KBUILD_AFLAGS.
> > > >
> > > > So, when we talk about --target=,
> > > > we only care about whether $(CC) is Clang.
> > > > Not caring about $(AR), $(LD), or $(OBJCOPY).
> > > >
> > > >
> > > > scripts/Makefile.clang is already guarded by:
> > > >
> > > > ifneq ($(findstring clang,$(CC_VERSION_TEXT)),
> > >
> > > $ make ARCH=arm64 CC=clang LLVM_IAS=1
> > >
> > > will use the right compiler and assembler but none of the other binary
> > > tools because '--prefix=' will not be set so CROSS_COMPILE needs to be
> > > specified still, which defeats the purpose of this whole change. This
> > > patch is designed to work for the "normal" case of saying "I want to use
> > > all of the LLVM tools", not "I want to use clang by itself".
> >
> >
> > I disagree.
> >
> > LLVM=1 is a shorthand.
> >
> >
> >
> > make LLVM=1 LLVM_IAS=1
> >
> >   should be equivalent to:
> >
> > make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
> >   OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> >   HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld \
> >   LLVM_IAS=1
> >
> >
> >
> > We do not care about the origin of CC=clang,
> > whether it came from LLVM=1 or every tool was explicitly,
> > individually specified.
> >
> >
> >
> > ifneq ($(LLVM),) is a garbage code
> > that checks a pointless thing.
>
> Masahiro,
> Nathan is correct.  Test for yourself; if you apply these two patches,
> then apply:
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 956603f56724..a1b46811bdc6 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -2,7 +2,6 @@
>  # and -m32/-m64 to set word size based on Kconfigs instead of relying on the
>  # target triple.
>  ifeq ($(CROSS_COMPILE),)
> -ifneq ($(LLVM),)
>  ifeq ($(LLVM_IAS),1)
>  ifeq ($(SRCARCH),arm)
>  CLANG_FLAGS    += --target=arm-linux-gnueabi
> @@ -26,7 +25,6 @@ else
>  $(error Specify CROSS_COMPILE or add '--target=' option to
> scripts/Makefile.clang)
>  endif # SRCARCH
>  endif # LLVM_IAS
> -endif # LLVM
>  else
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  endif # CROSS_COMPILE
>
> Then build as Nathan specified:
> $ ARCH=arm64 make CC=clang LLVM_IAS=1 -j72 defconfig all


Yes, LD is set to GNU ld, which is only for x86.

$ ARCH=arm64  make  CC=clang LLVM_IAS=1  LD=ld.lld \
   OBJCOPY=llvm-objcopy STRIP=llvm-strip \
    -j72 defconfig all

worked for me.



It is true that the most common use-case would be
LLVM=1 LLVM_IAS=1, but as I said, there is no good
reason to prevent this feature from working when
CC, LD, etc. are specified individually.







> ...
> arch/arm64/Makefile:25: ld does not support --fix-cortex-a53-843419;
> kernel may be susceptible to erratum
> ...
>   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> ld: unrecognised emulation mode: aarch64linux
> Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
> elf_l1om elf_k1om i386pep i386pe
> make[1]: *** [arch/arm64/kernel/vdso/Makefile:56:
> arch/arm64/kernel/vdso/vdso.so.dbg] Error 1
> make: *** [arch/arm64/Makefile:193: vdso_prepare] Error 2
>
> Nathan referred to --prefix, but in this failure, because
> CROSS_COMPILE was never set, the top level Makefile set LD to:
>  452 LD    = $(CROSS_COMPILE)ld
> in this case `ld` in my path was my host x86 linker, which is not
> correct for a cross compilation of arm64 target.
>
> Perhaps we can somehow support "implicit CROSS_COMPILE" with just
> CC=clang, and not LLVM=1, but I think it would be inflexible to
> hardcode such target triple prefixes.  What if someone has
> arm-linux-gnueabi-as but not arm-linux-gnueabihf-as installed?  That's
> the point of CROSS_COMPILE in my opinion to provide such flexibility
> at the cost of additional command line verbosity.
>
> For the common case of LLVM=1 though, this series is a simplification.
> If users want to specify CC=clang, then they MUST use CROSS_COMPILE
> when cross compiling.
>
> Please review the current approach and see if there's more I can
> improve in a v3; otherwise I still think this series is good to go.
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkENUWd7OgJO%3DdNiYjH6D1aJ0puBgs4W7uuYO9xQiAiNg%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
